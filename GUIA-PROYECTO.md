# 🥋 Guía: Crear un Proyecto con Microservicios Spring Boot desde Cero

> Sigue esta guía paso a paso en IntelliJ IDEA para construir una arquitectura de microservicios completa.

---

## Índice
1. [Proyecto Padre (Multi-módulo Maven)](#paso-1-proyecto-padre)
2. [Eureka Server (Service Discovery)](#paso-2-eureka-server)
3. [API Gateway](#paso-3-api-gateway)
4. [Auth Service (JWT)](#paso-4-auth-service)
5. [Content Service (API REST + JPA)](#paso-5-content-service)
6. [Progress Service (Tracking)](#paso-6-progress-service)
7. [Frontend (Thymeleaf + Bootstrap)](#paso-7-frontend)
8. [Docker Compose](#paso-8-docker-compose)
9. [Orden de arranque y pruebas](#paso-9-arranque-y-pruebas)

---

## Paso 1: Proyecto Padre

### ¿Qué es?
Un proyecto multi-módulo Maven agrupa varios microservicios bajo un mismo "paraguas". Cada servicio es un módulo independiente con su propio `pom.xml`, pero comparten versiones de dependencias del padre.

### En IntelliJ
1. **File → New → Project**
2. Selecciona **Maven Archetype** → `maven-archetype-quickstart`
3. GroupId: `com.dojo` / ArtifactId: `spring-boot-dojo`
4. Borra la carpeta `src/` del proyecto padre (no tiene código propio)

### pom.xml del padre

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.3</version>
        <relativePath/>
    </parent>

    <groupId>com.dojo</groupId>
    <artifactId>spring-boot-dojo</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>pom</packaging>
    <name>Spring Boot Dojo</name>

    <properties>
        <java.version>17</java.version>
        <spring-cloud.version>2023.0.0</spring-cloud.version>
    </properties>

    <modules>
        <module>eureka-server</module>
        <module>api-gateway</module>
        <module>auth-service</module>
        <module>content-service</module>
        <module>progress-service</module>
        <module>dojo-frontend</module>
    </modules>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
</project>
```

### 💡 Conceptos clave
- `<packaging>pom</packaging>` → indica que es un proyecto padre, no genera JAR
- `<modules>` → lista de submódulos (cada microservicio)
- `spring-boot-starter-parent` → hereda versiones de Spring Boot
- `spring-cloud-dependencies` → gestiona versiones de Spring Cloud (Eureka, Gateway, etc.)

---

## Paso 2: Eureka Server

### ¿Qué es?
**Eureka** es un servidor de **descubrimiento de servicios** (Service Discovery). En vez de que cada servicio tenga la URL hardcodeada de los demás, se registran en Eureka y se buscan por nombre.

**Analogía**: Es como una guía telefónica. En vez de memorizar números (URLs), buscas por nombre ("auth-service") y Eureka te dice dónde está.

### Crear el módulo en IntelliJ
1. Click derecho en el proyecto padre → **New → Module**
2. Spring Initializr → GroupId: `com.dojo` / ArtifactId: `eureka-server`
3. Dependencia: **Eureka Server**

### Dependencias Maven (pom.xml)

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>
    </dependency>
</dependencies>
```

### Clase principal

```java
package com.dojo.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer  // ← Esto activa el servidor Eureka
public class EurekaServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}
```

### application.yml

```yaml
server:
  port: 8761  # Puerto estándar de Eureka

spring:
  application:
    name: eureka-server

eureka:
  client:
    register-with-eureka: false  # No se registra a sí mismo
    fetch-registry: false        # No busca otros servicios
  server:
    enable-self-preservation: false  # Desactivar en desarrollo
```

### ¿Cómo probarlo?
1. Arranca `EurekaServerApplication`
2. Abre http://localhost:8761
3. Verás el **dashboard de Eureka** — por ahora vacío, pero cuando arranques otros servicios aparecerán ahí

### ⚠️ Errores comunes
- **Puerto ocupado**: Si el 8761 ya está en uso, cámbialo en `server.port`
- **"Cannot resolve spring-cloud-starter-netflix-eureka-server"**: Asegúrate de tener `spring-cloud-dependencies` en el pom padre
- **Dashboard vacío**: Normal si no has arrancado otros servicios aún

---

## Paso 3: API Gateway

### ¿Qué es?
El **API Gateway** es el **punto de entrada único** a todos tus microservicios. Los clientes (frontend, apps móviles) solo hablan con el Gateway, y este redirige las peticiones al servicio correcto.

**Analogía**: Es como la recepción de un hotel. Tú llegas y dices "quiero hablar con el servicio de habitaciones" y la recepción te conecta, sin que tú sepas dónde está exactamente.

### Ventajas
- Un solo puerto para todo (8080)
- Puedes añadir autenticación centralizada
- Balanceo de carga automático
- Puedes añadir rate limiting, logging, etc.

### Dependencias Maven

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-gateway</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
    </dependency>
    <!-- Para JWT validation -->
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-api</artifactId>
        <version>0.11.5</version>
    </dependency>
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-impl</artifactId>
        <version>0.11.5</version>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-jackson</artifactId>
        <version>0.11.5</version>
        <scope>runtime</scope>
    </dependency>
</dependencies>
```

### Clase principal

```java
package com.dojo.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApiGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApiGatewayApplication.class, args);
    }
}
```

### application.yml

```yaml
server:
  port: 8080

spring:
  application:
    name: api-gateway
  cloud:
    gateway:
      routes:
        # Rutas al Auth Service
        - id: auth-service
          uri: lb://auth-service        # lb:// = load balanced via Eureka
          predicates:
            - Path=/api/auth/**         # Peticiones que empiecen por /api/auth/
          filters:
            - StripPrefix=0

        # Rutas al Content Service
        - id: content-service
          uri: lb://content-service
          predicates:
            - Path=/api/flashcards/**, /api/quizzes/**, /api/exercises/**
          filters:
            - StripPrefix=0

        # Rutas al Progress Service
        - id: progress-service
          uri: lb://progress-service
          predicates:
            - Path=/api/progress/**
          filters:
            - StripPrefix=0

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/
  instance:
    prefer-ip-address: true

jwt:
  secret: MiClaveSecretaSuperSeguraParaJWT2024DojoSpringBoot
```

### Filtro JWT (para proteger rutas)

```java
package com.dojo.gateway.filter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Component
public class JwtAuthFilter implements GlobalFilter, Ordered {

    @Value("${jwt.secret}")
    private String jwtSecret;

    // Rutas que NO requieren autenticación
    private final List<String> openPaths = List.of(
            "/api/auth/login",
            "/api/auth/register"
    );

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String path = exchange.getRequest().getURI().getPath();

        // Si es una ruta pública, dejar pasar
        if (openPaths.stream().anyMatch(path::startsWith)) {
            return chain.filter(exchange);
        }

        // Buscar el token en el header Authorization
        String authHeader = exchange.getRequest().getHeaders().getFirst("Authorization");
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
            return exchange.getResponse().setComplete();
        }

        String token = authHeader.substring(7);
        try {
            // Validar el token
            Claims claims = Jwts.parserBuilder()
                    .setSigningKey(Keys.hmacShaKeyFor(jwtSecret.getBytes(StandardCharsets.UTF_8)))
                    .build()
                    .parseClaimsJws(token)
                    .getBody();

            // Añadir el username al header para que los servicios lo usen
            exchange = exchange.mutate()
                    .request(r -> r.header("X-User", claims.getSubject()))
                    .build();

            return chain.filter(exchange);
        } catch (Exception e) {
            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
            return exchange.getResponse().setComplete();
        }
    }

    @Override
    public int getOrder() {
        return -1; // Se ejecuta antes que otros filtros
    }
}
```

### 💡 Conceptos clave
- `lb://auth-service` → "load balanced" + nombre del servicio en Eureka
- `predicates` → condiciones para que la ruta aplique (por path, header, etc.)
- `StripPrefix=0` → no quita nada del path (lo pasa tal cual al servicio)
- `GlobalFilter` → se aplica a TODAS las peticiones que pasan por el Gateway

### ⚠️ Errores comunes
- **"No instances available for auth-service"**: Eureka no tiene registrado el servicio → arráncalo primero
- **Spring MVC vs WebFlux conflict**: El Gateway usa WebFlux. NO añadas `spring-boot-starter-web`
- **CORS errors**: Si el frontend está en otro puerto, configura CORS en el Gateway

---

## Paso 4: Auth Service

### ¿Qué es?
Servicio de **autenticación y autorización**. Gestiona el registro de usuarios, login, y genera tokens JWT.

### ¿Cómo funciona JWT?
1. El usuario envía email + contraseña a `/api/auth/login`
2. El servicio valida las credenciales contra la base de datos
3. Si son correctas, genera un **token JWT** firmado con una clave secreta
4. El cliente guarda ese token y lo envía en cada petición futura
5. El Gateway valida el token sin consultar la base de datos (es **stateless**)

### Dependencias Maven

```xml
<dependencies>
    <!-- Spring Web -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <!-- Spring Security -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>
    <!-- JPA + H2 (base de datos en memoria para desarrollo) -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
    <!-- JWT -->
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-api</artifactId>
        <version>0.11.5</version>
    </dependency>
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-impl</artifactId>
        <version>0.11.5</version>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>io.jsonwebtoken</groupId>
        <artifactId>jjwt-jackson</artifactId>
        <version>0.11.5</version>
        <scope>runtime</scope>
    </dependency>
    <!-- Eureka Client -->
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
    </dependency>
</dependencies>
```

### application.yml

```yaml
server:
  port: 8081

spring:
  application:
    name: auth-service
  datasource:
    url: jdbc:h2:mem:authdb     # Base de datos en memoria
    driver-class-name: org.h2.Driver
    username: sa
    password:
  jpa:
    hibernate:
      ddl-auto: create-drop     # Crea tablas al arrancar, borra al parar
    show-sql: true              # Muestra las queries SQL en consola
  h2:
    console:
      enabled: true             # Consola H2 en http://localhost:8081/h2-console

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/

jwt:
  secret: MiClaveSecretaSuperSeguraParaJWT2024DojoSpringBoot
  expiration: 86400000          # 24 horas en milisegundos
```

### Entidad User

```java
package com.dojo.auth.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;  // Se guarda encriptada con BCrypt

    @Column(nullable = false)
    private String role;      // "USER" o "ADMIN"

    // Constructor vacío (requerido por JPA)
    public User() {}

    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Getters y setters...
    public Long getId() { return id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
```

### Repository

```java
package com.dojo.auth.repository;

import com.dojo.auth.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    boolean existsByUsername(String username);
}
```

### JwtService

```java
package com.dojo.auth.service;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.Date;

@Service
public class JwtService {

    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.expiration}")
    private long expiration;

    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)                              // Quién es
                .setIssuedAt(new Date())                           // Cuándo se creó
                .setExpiration(new Date(System.currentTimeMillis() + expiration))  // Cuándo expira
                .signWith(Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8)),
                         SignatureAlgorithm.HS256)                 // Firma
                .compact();
    }
}
```

### AuthService

```java
package com.dojo.auth.service;

import com.dojo.auth.dto.AuthResponse;
import com.dojo.auth.dto.LoginRequest;
import com.dojo.auth.dto.RegisterRequest;
import com.dojo.auth.entity.User;
import com.dojo.auth.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(UserRepository userRepository,
                       PasswordEncoder passwordEncoder,
                       JwtService jwtService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    public AuthResponse register(RegisterRequest request) {
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new RuntimeException("El usuario ya existe");
        }

        User user = new User(
            request.getUsername(),
            passwordEncoder.encode(request.getPassword()),  // ← Encripta la contraseña
            "USER"
        );
        userRepository.save(user);

        String token = jwtService.generateToken(user.getUsername());
        return new AuthResponse(token, user.getUsername());
    }

    public AuthResponse login(LoginRequest request) {
        User user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new RuntimeException("Contraseña incorrecta");
        }

        String token = jwtService.generateToken(user.getUsername());
        return new AuthResponse(token, user.getUsername());
    }
}
```

### AuthController

```java
package com.dojo.auth.controller;

import com.dojo.auth.dto.AuthResponse;
import com.dojo.auth.dto.LoginRequest;
import com.dojo.auth.dto.RegisterRequest;
import com.dojo.auth.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@RequestBody RegisterRequest request) {
        return ResponseEntity.ok(authService.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }
}
```

### DTOs

```java
// LoginRequest.java
public class LoginRequest {
    private String username;
    private String password;
    // Getters y setters
}

// RegisterRequest.java
public class RegisterRequest {
    private String username;
    private String password;
    // Getters y setters
}

// AuthResponse.java
public class AuthResponse {
    private String token;
    private String username;

    public AuthResponse(String token, String username) {
        this.token = token;
        this.username = username;
    }
    // Getters
}
```

### SecurityConfig

```java
package com.dojo.auth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())          // Desactivar CSRF (usamos JWT)
            .sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))  // Sin sesiones
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/auth/**").permitAll()   // Login y registro públicos
                .requestMatchers("/h2-console/**").permitAll() // Consola H2
                .anyRequest().authenticated()
            )
            .headers(headers -> headers.frameOptions(f -> f.disable()));  // Para H2 console

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // Encripta contraseñas de forma segura
    }
}
```

### ¿Cómo probarlo?
1. Arranca Eureka Server primero
2. Arranca Auth Service
3. Prueba con curl o Postman:

```bash
# Registrar usuario
curl -X POST http://localhost:8081/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"berto","password":"1234"}'

# Login
curl -X POST http://localhost:8081/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"berto","password":"1234"}'

# Respuesta: {"token":"eyJhbGciOi...","username":"berto"}
```

### ⚠️ Errores comunes
- **403 Forbidden en todo**: Revisa que `SecurityConfig` permite `/api/auth/**`
- **"There is no PasswordEncoder mapped"**: Falta el `@Bean PasswordEncoder`
- **H2 console no carga**: Necesitas desactivar `frameOptions` y permitir `/h2-console/**`
- **Datos se pierden al reiniciar**: H2 en memoria (`mem:authdb`) es así. Para persistir usa `file:./authdb`

---

## Paso 5: Content Service

### ¿Qué es?
Servicio que gestiona el **contenido de aprendizaje**: flashcards, quizzes y ejercicios de código. Expone una API REST que el frontend consume a través del Gateway.

### Dependencias Maven

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
    </dependency>
</dependencies>
```

### application.yml

```yaml
server:
  port: 8083

spring:
  application:
    name: content-service
  datasource:
    url: jdbc:h2:mem:contentdb
    driver-class-name: org.h2.Driver
    username: sa
    password:
  jpa:
    hibernate:
      ddl-auto: create-drop
    show-sql: true

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/
```

### Entidad Flashcard

```java
package com.dojo.content.entity;

import jakarta.persistence.*;

@Entity
public class Flashcard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 1000)
    private String question;      // Pregunta

    @Column(length = 2000)
    private String answer;        // Respuesta

    private String category;      // SPRING_BASICS, REST_API, SECURITY, etc.
    private String belt;          // BLANCO, AMARILLO, NARANJA, VERDE, MARRON, NEGRO

    public Flashcard() {}

    public Flashcard(String question, String answer, String category, String belt) {
        this.question = question;
        this.answer = answer;
        this.category = category;
        this.belt = belt;
    }

    // Getters y setters...
}
```

### FlashcardController (ejemplo de API REST completa)

```java
package com.dojo.content.controller;

import com.dojo.content.entity.Flashcard;
import com.dojo.content.repository.FlashcardRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/flashcards")
public class FlashcardController {

    private final FlashcardRepository repository;

    public FlashcardController(FlashcardRepository repository) {
        this.repository = repository;
    }

    // GET /api/flashcards → Todas las flashcards
    @GetMapping
    public List<Flashcard> getAll() {
        return repository.findAll();
    }

    // GET /api/flashcards/belt/BLANCO → Filtrar por cinturón
    @GetMapping("/belt/{belt}")
    public List<Flashcard> getByBelt(@PathVariable String belt) {
        return repository.findByBelt(belt);
    }

    // GET /api/flashcards/5 → Una flashcard por ID
    @GetMapping("/{id}")
    public ResponseEntity<Flashcard> getById(@PathVariable Long id) {
        return repository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // POST /api/flashcards → Crear nueva
    @PostMapping
    public Flashcard create(@RequestBody Flashcard flashcard) {
        return repository.save(flashcard);
    }
}
```

### DataSeeder (datos iniciales)
Los datos se cargan automáticamente al arrancar con un `CommandLineRunner`. Ver el archivo `DataSeeder.java` para el contenido completo de flashcards, quizzes y ejercicios.

### 💡 Conceptos clave
- `@RestController` = `@Controller` + `@ResponseBody` (devuelve JSON directo)
- `@RequestMapping("/api/flashcards")` = ruta base para todos los endpoints
- `@PathVariable` = extrae valores de la URL (`/belt/{belt}`)
- `ResponseEntity` = controla el código HTTP de respuesta (200, 404, etc.)
- `JpaRepository` = Spring genera las queries SQL automáticamente

---

## Paso 6: Progress Service

### ¿Qué es?
Servicio que **trackea el progreso** del usuario: cuántas flashcards ha acertado, racha diaria, y nivel de cinturón.

### application.yml

```yaml
server:
  port: 8084

spring:
  application:
    name: progress-service
  datasource:
    url: jdbc:h2:mem:progressdb
    driver-class-name: org.h2.Driver
    username: sa
    password:
  jpa:
    hibernate:
      ddl-auto: create-drop

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/
```

### Entidad UserProgress

```java
@Entity
public class UserProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String belt;           // Cinturón actual
    private int totalCorrect;      // Total de aciertos
    private int totalAttempts;     // Total de intentos
    private int currentStreak;     // Racha actual (días seguidos)
    private int bestStreak;        // Mejor racha
    private LocalDate lastStudyDate;  // Último día que estudió

    // Getters, setters, constructor...
}
```

---

## Paso 7: Frontend (Thymeleaf + Bootstrap)

### ¿Qué es?
El frontend usa **Thymeleaf** (motor de plantillas de Spring) + **Bootstrap 5** (CSS framework). No necesitas React ni Angular — Thymeleaf renderiza HTML en el servidor.

### Dependencias Maven

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-thymeleaf</artifactId>
    </dependency>
</dependencies>
```

### application.yml

```yaml
server:
  port: 8090

spring:
  application:
    name: dojo-frontend

api:
  gateway:
    url: http://localhost:8080   # Todas las llamadas van al Gateway
```

### Flujo
1. Usuario abre http://localhost:8090 → ve pantalla de login
2. Introduce credenciales → el frontend llama al Gateway → Auth Service valida → devuelve JWT
3. Frontend guarda el JWT en la sesión HTTP
4. Para ver flashcards → frontend llama al Gateway con el JWT → Gateway valida → redirige a Content Service

---

## Paso 8: Docker Compose

### docker-compose.yml

```yaml
version: '3.8'

services:
  eureka-server:
    build: ./eureka-server
    ports:
      - "8761:8761"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8761/actuator/health"]
      interval: 10s
      retries: 5

  api-gateway:
    build: ./api-gateway
    ports:
      - "8080:8080"
    depends_on:
      eureka-server:
        condition: service_healthy
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/

  auth-service:
    build: ./auth-service
    ports:
      - "8081:8081"
    depends_on:
      eureka-server:
        condition: service_healthy
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/

  content-service:
    build: ./content-service
    ports:
      - "8083:8083"
    depends_on:
      eureka-server:
        condition: service_healthy
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/

  progress-service:
    build: ./progress-service
    ports:
      - "8084:8084"
    depends_on:
      eureka-server:
        condition: service_healthy
    environment:
      - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://eureka-server:8761/eureka/

  dojo-frontend:
    build: ./dojo-frontend
    ports:
      - "8090:8090"
    depends_on:
      - api-gateway
    environment:
      - API_GATEWAY_URL=http://api-gateway:8080
```

---

## Paso 9: Arranque y Pruebas

### Orden de arranque (IMPORTANTE)

```
1. eureka-server     (puerto 8761) ← SIEMPRE PRIMERO
2. auth-service      (puerto 8081) ← Espera a que Eureka esté listo
3. content-service   (puerto 8083)
4. progress-service  (puerto 8084)
5. api-gateway       (puerto 8080) ← Necesita que los servicios estén registrados
6. dojo-frontend     (puerto 8090) ← El último, necesita el Gateway
```

### En IntelliJ
Abre 6 terminales (o usa Run Configurations):
```bash
# Terminal 1
cd eureka-server && mvn spring-boot:run

# Terminal 2 (espera 10 seg)
cd auth-service && mvn spring-boot:run

# Terminal 3
cd content-service && mvn spring-boot:run

# Terminal 4
cd progress-service && mvn spring-boot:run

# Terminal 5 (espera 15 seg)
cd api-gateway && mvn spring-boot:run

# Terminal 6
cd dojo-frontend && mvn spring-boot:run
```

### URLs para probar

| URL | Qué es |
|-----|--------|
| http://localhost:8761 | Dashboard Eureka (ver servicios registrados) |
| http://localhost:8090 | Frontend (login, estudiar) |
| http://localhost:8081/h2-console | Consola H2 del Auth Service |
| http://localhost:8083/h2-console | Consola H2 del Content Service |

### Probar la API con curl

```bash
# 1. Registrarse
curl -s -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"berto","password":"1234"}' | jq

# 2. Login (guarda el token)
TOKEN=$(curl -s -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"berto","password":"1234"}' | jq -r '.token')

# 3. Ver flashcards (con token)
curl -s http://localhost:8080/api/flashcards \
  -H "Authorization: Bearer $TOKEN" | jq

# 4. Flashcards del cinturón blanco
curl -s http://localhost:8080/api/flashcards/belt/BLANCO \
  -H "Authorization: Bearer $TOKEN" | jq
```

---

## 🎯 Resumen de la Arquitectura

```
┌─────────────┐
│   Cliente    │  (Browser en :8090)
└──────┬──────┘
       │
┌──────▼──────┐
│ API Gateway │  (:8080) — Punto de entrada único
│ + JWT Filter│  — Valida tokens, redirige peticiones
└──────┬──────┘
       │ lb:// (load balanced via Eureka)
       │
┌──────┼────────────┬────────────┐
│      │            │            │
▼      ▼            ▼            ▼
Auth   Content    Progress    Eureka
:8081  :8083      :8084       :8761
│      │            │            │
H2     H2          H2       Registry
```

**Flujo de una petición:**
1. Cliente → Gateway (:8080)
2. Gateway valida JWT
3. Gateway busca en Eureka dónde está el servicio destino
4. Gateway redirige la petición al servicio correcto
5. Servicio procesa y responde
6. Respuesta vuelve por el mismo camino

---

> 💡 **Tip**: Mientras sigues esta guía, ten abierto el dashboard de Eureka (http://localhost:8761) para ver cómo se van registrando los servicios conforme los arrancas.
