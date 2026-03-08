package com.dojo.frontend.controller.guia;

import java.util.*;
import static com.dojo.frontend.controller.guia.GuiaHelper.*;

public class GuiaCapitulo15 {

    public static Map<String, Object> getPaso() {
        return crearPaso(
            15, "Docker Compose", "bi-box-seam",
            "Hasta ahora arrancábamos 5 terminales a mano. Docker Compose levanta todo el sistema "
            + "con un solo comando: <code>docker compose up --build</code>. "
            + "Vamos a ver cómo está configurado y por qué cada decisión importa.",
            List.of(

                section("1. ¿Qué es Docker Compose?",
                    "<p>Docker Compose es una herramienta que define y ejecuta aplicaciones <b>multi-contenedor</b>. "
                    + "En vez de hacer <code>docker run</code> para cada servicio, describes todo en un archivo YAML "
                    + "y Docker se encarga del resto.</p>"
                    + "<p>En nuestro caso tenemos <b>6 servicios</b>: Eureka, Gateway, Auth, Content, Progress y Frontend. "
                    + "Sin Compose necesitarías 6 terminales. Con Compose: un comando.</p>"
                    + "<pre><code>docker compose up --build    # Construir y arrancar todo\n"
                    + "docker compose down           # Parar y eliminar contenedores\n"
                    + "docker compose logs -f        # Ver logs en tiempo real</code></pre>"),

                section("2. Estructura del docker-compose.yml",
                    "<p>Nuestro archivo define los 6 servicios con sus puertos, variables de entorno y dependencias:</p>"
                    + "<pre><code>services:\n"
                    + "  eureka-server:       # Puerto 8761 — Service Discovery\n"
                    + "  api-gateway:         # Puerto 8080 — Punto de entrada\n"
                    + "  auth-service:        # Puerto 8081 — Autenticación + JWT\n"
                    + "  content-service:     # Puerto 8083 — Flashcards y Quizzes\n"
                    + "  progress-service:    # Puerto 8084 — Progreso y cinturones\n"
                    + "  dojo-frontend:       # Puerto 8090 — Interfaz web</code></pre>"
                    + "<p>Cada servicio tiene su propio <code>Dockerfile</code> en su carpeta. "
                    + "La directiva <code>build: ./nombre-servicio</code> le dice a Compose dónde encontrarlo.</p>"),

                section("3. Eureka Server — El primero en arrancar",
                    "<p>Eureka es el <b>Service Discovery</b>: todos los demás servicios se registran aquí al arrancar. "
                    + "Por eso debe estar listo antes que nadie.</p>"
                    + "<pre><code>eureka-server:\n"
                    + "  build: ./eureka-server\n"
                    + "  container_name: eureka-server\n"
                    + "  ports:\n"
                    + "    - \"8761:8761\"\n"
                    + "  healthcheck:\n"
                    + "    test: [\"CMD\", \"curl\", \"-f\",\n"
                    + "           \"http://localhost:8761/actuator/health\"]\n"
                    + "    interval: 10s\n"
                    + "    timeout: 5s\n"
                    + "    retries: 5\n"
                    + "    start_period: 30s</code></pre>"
                    + "<p><b>healthcheck</b>: Docker comprueba cada 10s si Eureka responde. "
                    + "Los demás servicios usan <code>depends_on</code> para no arrancar hasta que esté listo "
                    + "(aunque aquí usamos <code>service_started</code>, no <code>service_healthy</code> — "
                    + "Spring Boot se encarga de reintentar el registro).</p>"),

                section("4. Los microservicios (Auth, Content, Progress)",
                    "<p>Los tres siguen el mismo patrón:</p>"
                    + "<pre><code>auth-service:\n"
                    + "  build: ./auth-service\n"
                    + "  container_name: auth-service\n"
                    + "  ports:\n"
                    + "    - \"8081:8081\"\n"
                    + "  environment:\n"
                    + "    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=\n"
                    + "        http://eureka-server:8761/eureka/\n"
                    + "    - SPRING_DATASOURCE_URL=jdbc:h2:mem:authdb\n"
                    + "  depends_on:\n"
                    + "    eureka-server:\n"
                    + "      condition: service_started</code></pre>"
                    + "<p>Puntos clave:</p>"
                    + "<ul>"
                    + "<li><b>EUREKA_CLIENT_SERVICEURL_DEFAULTZONE</b> — En vez de <code>localhost</code>, usamos "
                    + "<code>eureka-server</code> (el nombre del contenedor). Docker Compose crea una red interna "
                    + "donde los contenedores se resuelven por nombre.</li>"
                    + "<li><b>SPRING_DATASOURCE_URL</b> — Cada servicio tiene su propia base de datos H2 en memoria. "
                    + "Se pierden al parar los contenedores (igual que en desarrollo local).</li>"
                    + "<li><b>depends_on</b> — Eureka arranca primero, pero <code>service_started</code> solo espera "
                    + "a que el contenedor <i>arranque</i>, no a que esté sano. Para producción usarías "
                    + "<code>service_healthy</code>.</li>"
                    + "</ul>"),

                section("5. API Gateway — El punto de entrada",
                    "<p>El Gateway es el <b>proxy inverso</b> que enruta peticiones a los microservicios:</p>"
                    + "<pre><code>api-gateway:\n"
                    + "  build: ./api-gateway\n"
                    + "  container_name: api-gateway\n"
                    + "  ports:\n"
                    + "    - \"8080:8080\"\n"
                    + "  environment:\n"
                    + "    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=\n"
                    + "        http://eureka-server:8761/eureka/\n"
                    + "  depends_on:\n"
                    + "    eureka-server:\n"
                    + "      condition: service_started</code></pre>"
                    + "<p>El Gateway descubre los servicios a través de Eureka y enruta automáticamente. "
                    + "El frontend habla con el Gateway (puerto 8080), nunca directamente con los microservicios.</p>"),

                section("6. Frontend — La cara visible",
                    "<p>El frontend Thymeleaf necesita saber dónde está el Gateway:</p>"
                    + "<pre><code>dojo-frontend:\n"
                    + "  build: ./dojo-frontend\n"
                    + "  container_name: dojo-frontend\n"
                    + "  ports:\n"
                    + "    - \"8090:8090\"\n"
                    + "  environment:\n"
                    + "    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=\n"
                    + "        http://eureka-server:8761/eureka/\n"
                    + "    - GATEWAY_URL=http://api-gateway:8080\n"
                    + "  depends_on:\n"
                    + "    - api-gateway\n"
                    + "    - auth-service\n"
                    + "    - content-service\n"
                    + "    - progress-service</code></pre>"
                    + "<p><b>GATEWAY_URL</b> le dice al frontend que las llamadas HTTP van a <code>api-gateway:8080</code> "
                    + "en vez de <code>localhost:8080</code>. Dentro de Docker la red es distinta.</p>"
                    + "<p>Depende de <b>todos</b> los servicios porque necesita que todo esté arriba para funcionar.</p>"),

                section("7. La red interna de Docker",
                    "<p>Docker Compose crea automáticamente una <b>red bridge</b> donde todos los contenedores se ven entre sí "
                    + "por nombre de servicio:</p>"
                    + "<pre><code># Dentro de los contenedores:\n"
                    + "eureka-server → 172.18.0.2\n"
                    + "api-gateway   → 172.18.0.3\n"
                    + "auth-service  → 172.18.0.4\n"
                    + "...etc\n\n"
                    + "# Pero no necesitas IPs, usas nombres:\n"
                    + "http://eureka-server:8761/eureka/\n"
                    + "http://api-gateway:8080</code></pre>"
                    + "<p>Desde <b>fuera</b> (tu navegador), accedes por <code>localhost:puerto</code>. "
                    + "Desde <b>dentro</b> (entre contenedores), acceden por nombre de servicio.</p>"),

                section("8. Comandos útiles",
                    "<pre><code># Arrancar todo (construir + ejecutar)\n"
                    + "docker compose up --build\n\n"
                    + "# Arrancar en segundo plano\n"
                    + "docker compose up --build -d\n\n"
                    + "# Ver logs de un servicio concreto\n"
                    + "docker compose logs -f auth-service\n\n"
                    + "# Parar todo\n"
                    + "docker compose down\n\n"
                    + "# Reconstruir solo un servicio\n"
                    + "docker compose build auth-service\n"
                    + "docker compose up auth-service\n\n"
                    + "# Ver estado de los contenedores\n"
                    + "docker compose ps\n\n"
                    + "# Entrar en un contenedor\n"
                    + "docker compose exec auth-service bash</code></pre>"),

                section("9. Checklist",
                    "<ul>"
                    + "<li>✅ <code>docker-compose.yml</code> define 6 servicios</li>"
                    + "<li>✅ Eureka arranca primero con healthcheck</li>"
                    + "<li>✅ Cada servicio tiene su Dockerfile</li>"
                    + "<li>✅ Variables de entorno sobreescriben <code>application.properties</code></li>"
                    + "<li>✅ Red interna: contenedores se comunican por nombre</li>"
                    + "<li>✅ <code>depends_on</code> controla el orden de arranque</li>"
                    + "<li>✅ Un comando lo levanta todo: <code>docker compose up --build</code></li>"
                    + "</ul>")
            )
        );
    }
}
