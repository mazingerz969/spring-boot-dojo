# Despliegue online — Spring Boot Dojo

Guía para dejar la app **funcional, segura y lista para LinkedIn**.

## ¿Dónde subo qué?

Son **dos sitios distintos**. No confundas código con la app en marcha:

| Qué subes | Dónde | Para qué |
|-----------|--------|----------|
| **Código fuente** | [GitHub](https://github.com/mazingerz969/spring-boot-dojo) | Portfolio, LinkedIn, colaboración, `git clone` |
| **App en funcionamiento** | Un **servidor VPS** (Oracle, Hetzner, etc.) | Que cualquiera entre a `https://tu-dominio.com` |

Flujo resumido:

```
Tu PC  ──git push──►  GitHub (repo)
                         │
Servidor VPS ◄──git clone──┘
     │
     └── docker compose up  ──►  https://dojo.tudominio.com  (usuarios / LinkedIn)
```

- **GitHub** guarda el código. No ejecuta Spring Boot ni PostgreSQL.
- **El VPS** es donde corre Docker (backend + frontend + nginx + Postgres).
- **El dominio** (opcional pero recomendado) apunta con DNS a la IP del VPS.

### Dónde alojar la app (recomendación)

| Opción | Coste | Ideal para |
|--------|-------|------------|
| **Oracle Cloud Free Tier** | 0 €/mes | Empezar, demo LinkedIn |
| **Hetzner CX22** | ~4 €/mes | Estable y simple |
| **DigitalOcean Droplet** | ~6 $/mes | Alternativa conocida |

No uses solo Vercel/Netlify para este proyecto: necesitas Java + PostgreSQL siempre encendidos (Docker en un VPS).

### Compartir VPS con SolStay (Laravel)

Si también despliegas [SolStay](https://github.com/mazingerz969/solstay-web) en el mismo servidor, el nginx de este proyecto actúa como **gateway** para ambos subdominios (`dojo.*` y `solstay.*`) vía la red Docker `portfolio-net`. Guía completa en el repo de SolStay: `DEPLOY.md`.

---

## Recomendación de stack

| Entorno | Stack |
|---------|--------|
| **Producción (LinkedIn)** | `docker-compose.prod.yml` → monolito + PostgreSQL + Next.js + nginx |
| **Desarrollo local** | `start-all.sh` (microservicios + H2) |

El monolito es más barato, simple y suficiente para una demo pública.

---

## Paso 1 — Preparar el servidor

Opciones económicas:

- **Oracle Cloud Free Tier** (VM siempre gratis)
- **Hetzner CX22** (~4 €/mes)
- **DigitalOcean Droplet** (~6 $/mes)

Requisitos mínimos: **2 GB RAM**, **2 vCPU**, Ubuntu 22.04/24.04 o Fedora.

```bash
# En el servidor
sudo dnf install -y docker docker-compose-plugin git   # Fedora
# o: sudo apt install docker.io docker-compose-v2 git  # Ubuntu

sudo systemctl enable --now docker
sudo usermod -aG docker $USER
# Cierra sesión y vuelve a entrar
```

---

## Paso 2 — Clonar y configurar secretos

```bash
git clone https://github.com/mazingerz969/spring-boot-dojo.git
cd spring-boot-dojo

cp .env.production.example .env.production
```

Genera secretos **únicos** (nunca reutilices los de ejemplo):

```bash
echo "JWT_SECRET=$(openssl rand -base64 64)"
echo "DB_PASSWORD=$(openssl rand -base64 32)"
```

Edita `.env.production`:

```env
JWT_SECRET=<el generado>
DB_PASSWORD=<el generado>
DOMAIN=https://dojo.tudominio.com
NEXT_PUBLIC_API_URL=https://dojo.tudominio.com
CORS_ALLOWED_ORIGINS=https://dojo.tudominio.com
```

> **Importante:** `NEXT_PUBLIC_API_URL` y `CORS_ALLOWED_ORIGINS` deben ser tu dominio **público con HTTPS**.

---

## Paso 3 — DNS

En tu registrador de dominios, crea un registro **A** apuntando a la IP del servidor:

```
dojo.tudominio.com  →  123.45.67.89
```

Espera 5–30 minutos a que propague.

---

## Paso 4 — Levantar con Docker

```bash
docker compose -f docker-compose.prod.yml --env-file .env.production up -d --build
docker compose -f docker-compose.prod.yml ps
docker compose -f docker-compose.prod.yml logs -f backend
```

La primera vez el backend crea tablas y el `DataSeeder` carga flashcards/quizzes si la BD está vacía.

Prueba: `http://TU_IP` (HTTP) → deberías ver el frontend.

---

## Paso 5 — HTTPS (obligatorio para usuarios reales)

### Opción A — Certbot en el host (recomendada)

Detén el nginx del compose en el puerto 80 temporalmente, o usa un proxy en el host.

```bash
sudo dnf install certbot
sudo certbot certonly --standalone -d dojo.tudominio.com
```

Monta los certificados en nginx o usa un reverse proxy en el host que termine TLS y reenvíe a Docker.

### Opción B — Cloudflare (rápida para demo)

1. Añade el dominio a Cloudflare (plan free)
2. Activa proxy naranja en el registro DNS
3. SSL/TLS → **Flexible** o **Full**
4. Los usuarios entran por `https://dojo.tudominio.com`

---

## Paso 6 — Verificación antes de LinkedIn

```bash
# Registro
curl -s -X POST https://dojo.tudominio.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"test","email":"test@example.com","password":"Test1234!"}'

# Login
curl -s -X POST https://dojo.tudominio.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"test","password":"Test1234!"}'
```

Checklist manual:

- [ ] Registro e inicio de sesión funcionan
- [ ] Flashcards y quizzes cargan
- [ ] HTTPS activo (candado en el navegador)
- [ ] No hay secretos en el repo (`git grep -i password`, `.env` ignorados)
- [ ] CORS solo permite tu dominio

---

## Comandos útiles

```bash
# Ver logs
docker compose -f docker-compose.prod.yml logs -f

# Reiniciar
docker compose -f docker-compose.prod.yml restart

# Parar
docker compose -f docker-compose.prod.yml down

# Actualizar tras git pull
docker compose -f docker-compose.prod.yml --env-file .env.production up -d --build
```

---

## Publicar el repositorio en GitHub

**Esto es solo el código**, no despliega la web. Hazlo desde tu PC:

```bash
cd ~/proyectos/spring-boot-dojo

# Comprueba que los secretos no se suben
git check-ignore .env.production
git grep -i "JWT_SECRET=" -- ':!.env.production.example' ':!.env.example'

git add README.md DEPLOY.md SECURITY.md docker-compose.prod.yml deploy/ ...
git commit -m "Add production deployment and app fixes"
git push origin main
```

Repo: **https://github.com/mazingerz969/spring-boot-dojo**

Para hacerlo público: GitHub → **Settings → General → Danger Zone → Change visibility → Public**.

Añade topics: `spring-boot`, `java`, `nextjs`, `learning-platform`, `microservices`.

Después, en el **servidor VPS**, clona ese mismo repo y ejecuta el Paso 4 (Docker).

---

## Texto sugerido para LinkedIn

> Acabo de publicar **Spring Boot Dojo**: una plataforma interactiva para aprender Spring Boot con flashcards, quizzes y ejercicios de código, organizada por cinturones como en artes marciales.
>
> Stack: Java 17, Spring Boot 3, JWT, PostgreSQL, Next.js.
>
> Pruébala aquí: https://dojo.tudominio.com  
> Código abierto: https://github.com/mazingerz969/spring-boot-dojo
>
> #SpringBoot #Java #OpenSource #DesarrolloWeb

---

## Problemas frecuentes

| Error | Solución |
|-------|----------|
| CORS blocked | `CORS_ALLOWED_ORIGINS` debe coincidir exactamente con la URL del navegador |
| 502 Bad Gateway | Espera a que `backend` termine de arrancar (`logs backend`) |
| SSL error en curl | Configura HTTPS antes de probar desde fuera |
| Out of memory | VM con menos de 2 GB RAM → añade swap o sube de plan |
