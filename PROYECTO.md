# Spring Boot Dojo 🥋

## Qué es
Plataforma de aprendizaje interactivo de Spring Boot con arquitectura de microservicios.
Aprende Spring Boot CONSTRUYENDO una app real con microservicios.

## Arquitectura

### Microservicios de infraestructura
1. **eureka-server** (puerto 8761) — Service Discovery
2. **api-gateway** (puerto 8080) — Spring Cloud Gateway, punto de entrada único
3. **config-server** (puerto 8888) — Configuración centralizada
4. **auth-service** (puerto 8081) — JWT Authentication/Authorization

### Microservicios de negocio
5. **user-service** (puerto 8082) — Usuarios, perfiles, progreso
6. **content-service** (puerto 8083) — Flashcards, quizzes, ejercicios de código
7. **progress-service** (puerto 8084) — Spaced repetition, rachas, estadísticas
8. **notification-service** (puerto 8085) — Recordatorios, logros (Kafka consumer)

### Frontend
9. **dojo-frontend** — Thymeleaf + Bootstrap (simple, sin frameworks JS pesados)

## Stack técnico
- Java 17 (compatibilidad con ofertas de empleo)
- Spring Boot 3.2
- Spring Cloud (Eureka, Gateway, Config, OpenFeign)
- Spring Security + JWT
- Spring Data JPA + PostgreSQL
- Apache Kafka (comunicación asíncrona entre servicios)
- Redis (caché de sesiones/tokens)
- Resilience4j (Circuit Breaker)
- Micrometer + Zipkin (trazas distribuidas)
- Flyway (migraciones DB)
- Docker + Docker Compose (levantar todo con un comando)
- Swagger/OpenAPI (documentación APIs)
- JUnit 5 + Mockito + TestContainers

## Niveles de aprendizaje (cinturones)
1. **Blanco** — IoC, DI, @Component, @Autowired, @Bean
2. **Amarillo** — REST APIs, @RestController, JPA, validación, DTOs
3. **Naranja** — Security, JWT, OAuth, perfiles, testing
4. **Verde** — Microservicios, Eureka, Gateway, Feign, Config Server
5. **Marrón** — Kafka, Docker, Circuit Breaker, trazas distribuidas
6. **Negro** — Arquitectura hexagonal, DDD, CI/CD, deployment

## Sistema de repetición espaciada
- Cada concepto aparece en múltiples formatos: flashcard → quiz → código → explicar
- No avanzas hasta acertar X veces seguidas
- Los fallos vuelven más frecuentemente
- Racha diaria (streak) para motivar la práctica constante

## Para empezar (Fase 1)
Montar la base: eureka-server + api-gateway + auth-service + content-service
Todo dockerizado con docker-compose.
Frontend básico con login + listado de flashcards.

## Estructura de carpetas
```
spring-boot-dojo/
├── eureka-server/
├── api-gateway/
├── config-server/
├── auth-service/
├── user-service/
├── content-service/
├── progress-service/
├── notification-service/
├── dojo-frontend/
├── docker-compose.yml
└── PROYECTO.md
```
