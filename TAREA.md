# Tarea: Traducir contenido a español + Crear guía de proyecto

## 1. Traducir TODO el contenido del DataSeeder.java a español
- Todas las flashcards (pregunta y respuesta) → español
- Todos los quizzes (pregunta y opciones) → español  
- Los ejercicios de código ya están parcialmente en español, revisar y completar
- Mantener términos técnicos en inglés (ej: @SpringBootApplication, JPA, REST, JWT)
- El tono debe ser didáctico y cercano, no académico

## 2. Crear una GUIA de creación de proyecto paso a paso
Crear archivo: `GUIA-PROYECTO.md` en la raíz del proyecto

La guía debe explicar cómo crear desde cero un proyecto con:
- **Paso 1**: Crear proyecto padre (multi-módulo Maven)
- **Paso 2**: Eureka Server (qué es, cómo configurarlo, application.yml)
- **Paso 3**: API Gateway (Spring Cloud Gateway, rutas, filtros)
- **Paso 4**: Auth Service (Spring Security + JWT, login, registro)
- **Paso 5**: Content Service (JPA, H2, endpoints REST, DTOs)
- **Paso 6**: Progress Service (tracking de progreso, rachas)
- **Paso 7**: Frontend con Thymeleaf + Bootstrap
- **Paso 8**: Docker Compose para levantar todo

Cada paso debe incluir:
- Explicación teórica breve (qué es y para qué sirve)
- Dependencias Maven necesarias (con groupId y artifactId)
- Código completo de cada clase importante
- application.yml de cada servicio
- Cómo probarlo (qué arrancar, en qué orden, URLs)
- Errores comunes y cómo solucionarlos

La guía debe ser lo suficientemente detallada para que alguien pueda seguirla en IntelliJ paso a paso y tener todo funcionando.

## 3. Añadir más flashcards y quizzes
- Mínimo 10 flashcards nuevas por cinturón (total 60+ nuevas)
- Mínimo 8 quizzes nuevos por cinturón (total 48+ nuevos)
- Temas que faltan: Lombok, MapStruct, Flyway/Liquibase, OpenAPI/Swagger, Actuator, Docker avanzado, testing con @DataJpaTest, @WebMvcTest

## IMPORTANTE
- Todo en ESPAÑOL
- No cambiar la estructura del proyecto ni los puertos
- No romper lo que ya funciona
- Archivo DataSeeder.java está en: content-service/src/main/java/com/dojo/content/config/DataSeeder.java
