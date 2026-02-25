#!/bin/bash
# Spring Boot Dojo - Arranca todos los servicios
# Uso: ./start-all.sh
# Logs: logs/<servicio>.log
# Parar todo: ./start-all.sh stop

DOJO_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="$DOJO_DIR/logs"
PID_DIR="$DOJO_DIR/.pids"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

mkdir -p "$LOG_DIR" "$PID_DIR"

# Parar todos los servicios
stop_all() {
    echo -e "${RED}🛑 Parando todos los servicios...${NC}"
    for pidfile in "$PID_DIR"/*.pid; do
        [ -f "$pidfile" ] || continue
        name=$(basename "$pidfile" .pid)
        pid=$(cat "$pidfile")
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid"
            echo -e "  ${YELLOW}⏹  $name (PID $pid) parado${NC}"
        fi
        rm -f "$pidfile"
    done
    echo -e "${GREEN}✅ Todo parado${NC}"
    exit 0
}

if [ "$1" = "stop" ]; then
    stop_all
fi

# Verificar que no hay servicios ya corriendo
if ls "$PID_DIR"/*.pid 1>/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Hay servicios corriendo. Parando primero...${NC}"
    stop_all_silent() {
        for pidfile in "$PID_DIR"/*.pid; do
            [ -f "$pidfile" ] || continue
            pid=$(cat "$pidfile")
            kill "$pid" 2>/dev/null
            rm -f "$pidfile"
        done
    }
    stop_all_silent
    sleep 2
fi

# Limpiar logs antiguos
rm -f "$LOG_DIR"/*.log

start_service() {
    local name=$1
    local dir=$2
    local wait_for=$3

    echo -ne "  ${CYAN}🚀 Arrancando $name...${NC}"
    cd "$DOJO_DIR/$dir"
    mvn spring-boot:run > "$LOG_DIR/$name.log" 2>&1 &
    local pid=$!
    echo "$pid" > "$PID_DIR/$name.pid"

    # Esperar a que arranque (buscar "Started" en el log)
    local timeout=90
    local elapsed=0
    while [ $elapsed -lt $timeout ]; do
        if grep -q "Started" "$LOG_DIR/$name.log" 2>/dev/null; then
            echo -e " ${GREEN}✅ OK (${elapsed}s) — PID $pid${NC}"
            return 0
        fi
        if ! kill -0 "$pid" 2>/dev/null; then
            echo -e " ${RED}❌ FALLÓ${NC}"
            echo -e "  ${RED}→ Ver log: cat $LOG_DIR/$name.log${NC}"
            return 1
        fi
        sleep 2
        elapsed=$((elapsed + 2))
        echo -ne "."
    done
    echo -e " ${RED}⏰ TIMEOUT (${timeout}s)${NC}"
    echo -e "  ${RED}→ Ver log: cat $LOG_DIR/$name.log${NC}"
    return 1
}

echo ""
echo -e "${GREEN}🥋 ═══════════════════════════════════════${NC}"
echo -e "${GREEN}   SPRING BOOT DOJO - Arrancando todo${NC}"
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo -e "Logs en: ${CYAN}$LOG_DIR/${NC}"
echo ""

# 1. Eureka (siempre primero)
echo -e "${YELLOW}[1/5] Service Discovery${NC}"
start_service "eureka-server" "eureka-server" || exit 1
echo ""

# 2. Auth + Content + Progress (en paralelo)
echo -e "${YELLOW}[2/5] Microservicios de negocio (paralelo)${NC}"
cd "$DOJO_DIR/auth-service"
mvn spring-boot:run > "$LOG_DIR/auth-service.log" 2>&1 &
echo "$!" > "$PID_DIR/auth-service.pid"

cd "$DOJO_DIR/content-service"
mvn spring-boot:run > "$LOG_DIR/content-service.log" 2>&1 &
echo "$!" > "$PID_DIR/content-service.pid"

cd "$DOJO_DIR/progress-service"
mvn spring-boot:run > "$LOG_DIR/progress-service.log" 2>&1 &
echo "$!" > "$PID_DIR/progress-service.pid"

# Esperar a los 3
for svc in auth-service content-service progress-service; do
    pid=$(cat "$PID_DIR/$svc.pid")
    echo -ne "  ${CYAN}🚀 $svc...${NC}"
    elapsed=0
    while [ $elapsed -lt 90 ]; do
        if grep -q "Started" "$LOG_DIR/$svc.log" 2>/dev/null; then
            echo -e " ${GREEN}✅ OK (${elapsed}s) — PID $pid${NC}"
            break
        fi
        if ! kill -0 "$pid" 2>/dev/null; then
            echo -e " ${RED}❌ FALLÓ → cat $LOG_DIR/$svc.log${NC}"
            break
        fi
        sleep 2
        elapsed=$((elapsed + 2))
    done
done
echo ""

# 3. Gateway
echo -e "${YELLOW}[3/5] API Gateway${NC}"
start_service "api-gateway" "api-gateway" || exit 1
echo ""

# 4. Frontend
echo -e "${YELLOW}[4/5] Frontend${NC}"
start_service "dojo-frontend" "dojo-frontend" || exit 1
echo ""

# Resumen
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}🥋 ¡DOJO LISTO!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo ""
echo -e "  🌐 App:      ${CYAN}http://localhost:8090${NC}"
echo -e "  📡 Eureka:   ${CYAN}http://localhost:8761${NC}"
echo -e "  🔌 Gateway:  ${CYAN}http://localhost:8080${NC}"
echo ""
echo -e "  📋 Logs:     ${CYAN}tail -f $LOG_DIR/<servicio>.log${NC}"
echo -e "  🛑 Parar:    ${CYAN}./start-all.sh stop${NC}"
echo ""
echo -e "  Servicios corriendo:"
for pidfile in "$PID_DIR"/*.pid; do
    [ -f "$pidfile" ] || continue
    name=$(basename "$pidfile" .pid)
    pid=$(cat "$pidfile")
    if kill -0 "$pid" 2>/dev/null; then
        echo -e "    ${GREEN}✅ $name (PID $pid)${NC}"
    else
        echo -e "    ${RED}❌ $name (muerto)${NC}"
    fi
done
echo ""
