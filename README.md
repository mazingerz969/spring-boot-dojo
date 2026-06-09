# Spring Boot Dojo

Plataforma interactiva para aprender **Spring Boot** construyendo una aplicación real: flashcards, quizzes, ejercicios de código y sistema de cinturones (blanco → negro).

**Demo en vivo:** http://spring-dojo.duckdns.org  
**Repositorio (código):** https://github.com/mazingerz969/spring-boot-dojo

> **Código ≠ app online.** GitHub guarda el repo; la demo pública va en un **servidor VPS** con Docker. Ver **[DEPLOY.md](./DEPLOY.md)** → sección *¿Dónde subo qué?*.

---

## Qué incluye

- **Backend:** Spring Boot 3.2, JWT, JPA, rate limiting
- **Frontend:** Next.js 16 + React 19 + TypeScript
- **Arquitectura:** microservicios (dev) + monolito (producción recomendada)
- **Contenido:** 500+ quizzes, flashcards y ejercicios en español

---

## Arranque local (desarrollo)

### Requisitos

- Java 17+
- Maven 3.9+
- Node.js 20+

### Backend (microservicios + H2)

```bash
git clone https://github.com/mazingerz969/spring-boot-dojo.git
cd spring-boot-dojo
bash start-all.sh
```

### Frontend Next.js

```bash
cd dojo-frontend-next
cp .env.example .env.local
npm install
npm run dev
```

- App: http://localhost:3000  
- API (gateway): http://localhost:8080  

Parar todo: `bash start-all.sh stop`

---

## Despliegue en producción

| Paso | Dónde | Acción |
|------|--------|--------|
| 1 | **GitHub** | `git push` del código |
| 2 | **VPS** (Oracle / Hetzner / …) | `git clone` + Docker |
| 3 | **Dominio + DNS** | Apuntar a la IP del VPS + HTTPS |

En el servidor:

```bash
git clone https://github.com/mazingerz969/spring-boot-dojo.git
cd spring-boot-dojo
cp .env.production.example .env.production
# Edita secretos (JWT_SECRET, DB_PASSWORD, DOMAIN, CORS)
docker compose -f docker-compose.prod.yml --env-file .env.production up -d --build
```

Guía completa: **[DEPLOY.md](./DEPLOY.md)**  
Seguridad: **[SECURITY.md](./SECURITY.md)**

---

## Estructura del proyecto

| Carpeta | Descripción |
|---------|-------------|
| `dojo-monolith/` | Backend unificado (recomendado para producción) |
| `dojo-frontend-next/` | Frontend moderno (Next.js) |
| `auth-service/`, `content-service/`, … | Microservicios (aprendizaje / dev) |
| `docker-compose.prod.yml` | Stack producción (Postgres + backend + frontend + nginx) |
| `GUIA-PROYECTO.md` | Tutorial para crear el proyecto desde cero |

---

## Stack

Java 17 · Spring Boot 3.2 · Spring Security · JWT · JPA · PostgreSQL · Next.js · Docker

---

## Licencia

Proyecto educativo personal. Consulta el repositorio para detalles.
