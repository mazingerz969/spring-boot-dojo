# Spring Boot Dojo - Project Instructions

## Architecture
Microservices-based learning platform for Spring Boot concepts, organized by martial arts belt levels.

### Services
| Service | Port | Database | Purpose |
|---------|------|----------|---------|
| eureka-server | 8761 | — | Service discovery |
| api-gateway | 8080 | — | Gateway + JWT filter + CORS |
| auth-service | 8081 | H2 mem (authdb) | Login/Register, JWT tokens |
| content-service | 8083 | H2 mem (contentdb) | Flashcards, quizzes, exercises |
| progress-service | 8084 | H2 file (progressdb) | Stats, streaks, rankings |
| dojo-frontend | 8090 | — | OLD Thymeleaf frontend (being replaced) |
| dojo-frontend-next | 3000 | — | NEW Next.js frontend |

### Starting Services
```bash
cd /home/alaving/proyectos/spring-boot-dojo
bash start-all.sh        # Start all Java microservices
bash start-all.sh stop   # Stop all
```

### API Routes (through gateway at :8080)
- `/api/auth/**` → auth-service
- `/api/content/**` → content-service (JWT required)
- `/api/exercises/**` → content-service (JWT required)
- `/api/progress/**` → progress-service (JWT required)

### CORS
Gateway allows: `localhost:3000` (Next.js), `localhost:8090` (Thymeleaf)

## Frontend (dojo-frontend-next)
- **Stack:** Next.js 16 + React 19 + TypeScript 5.9 + Framer Motion 12 + Tailwind v4
- **Dev command:** `npm run dev` (uses `--webpack` flag, turbopack breaks CSS)
- **Styling:** Inline styles for visuals, Tailwind only for layout (see global CLAUDE.md)
- **Icons:** Phosphor Icons React
- **Fonts:** Outfit (main), JetBrains Mono (code)
- **Auth:** JWT stored in localStorage (`dojo-user`), sent as Bearer token
- **API base:** `NEXT_PUBLIC_API_URL` from `.env.local` (defaults to `http://localhost:8080`)

### Belt System (6 levels)
White (#a1a1aa) → Yellow (#ca8a04) → Orange (#ea580c) → Green (#059669) → Brown (#92400e) → Black (#18181b)

### Key Files
- `src/lib/api.ts` — API client with auth headers
- `src/lib/auth-context.tsx` — React Context for auth state
- `src/lib/belts.ts` — Belt definitions and colors
- `src/components/ui/Navbar.tsx` — Fixed glassmorphism navbar
- `src/app/globals.css` — Global styles + custom scrollbar

## Backend Tech
- Java 17, Spring Boot 3.2.0, Spring Cloud 2023.0.0
- Maven wrapper (`./mvnw`)
- JWT via JJWT 0.12.3
- Each service has its own Dockerfile
- `docker-compose.yml` at project root for containerized deployment
