package com.dojo.content.config;

import com.dojo.content.entity.CodeExercise;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.entity.Quiz;
import com.dojo.content.repository.CodeExerciseRepository;
import com.dojo.content.repository.FlashcardRepository;
import com.dojo.content.repository.QuizRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class DataSeeder {

    @Bean
    CommandLineRunner seedFlashcards(FlashcardRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                        // BLANCO - Spring Basics
                        new Flashcard(
                                "What does @SpringBootApplication do?",
                                "Combines @Configuration, @EnableAutoConfiguration, and @ComponentScan. It marks the main class of a Spring Boot application.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is Dependency Injection (DI)?",
                                "A design pattern where objects receive their dependencies from an external source rather than creating them. Spring uses DI via constructor injection, setter injection, or field injection.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is the difference between @Component, @Service, and @Repository?",
                                "All are stereotypes for component scanning. @Service indicates business logic, @Repository indicates data access (adds persistence exception translation), and @Component is a generic stereotype.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is the Spring IoC Container?",
                                "The Inversion of Control container is the core of Spring Framework. It creates objects, wires them together, configures them, and manages their lifecycle. BeanFactory and ApplicationContext are IoC container interfaces.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is the purpose of application.properties or application.yml?",
                                "These files configure Spring Boot application settings such as server port, database connection, logging levels, and custom properties. YAML provides hierarchical configuration while properties uses flat key-value pairs.",
                                "SPRING_BASICS", "BLANCO"),

                        // AMARILLO - REST APIs
                        new Flashcard(
                                "What does @RestController do?",
                                "Combines @Controller and @ResponseBody. Every method returns data directly (JSON by default) instead of a view name.",
                                "REST_API", "AMARILLO"),
                        new Flashcard(
                                "What is Spring Data JPA?",
                                "A Spring module that simplifies data access by providing repository abstractions. You define interfaces extending JpaRepository and Spring generates the implementation automatically.",
                                "DATA_ACCESS", "AMARILLO"),
                        new Flashcard(
                                "What is the difference between @RequestParam and @PathVariable?",
                                "@PathVariable extracts values from the URI path (e.g., /users/{id}), while @RequestParam extracts query parameters (e.g., /users?name=John). PathVariable is for RESTful resource identification, RequestParam for filtering/options.",
                                "REST_API", "AMARILLO"),
                        new Flashcard(
                                "What is ResponseEntity and when should you use it?",
                                "ResponseEntity represents the full HTTP response including status code, headers, and body. Use it when you need to control the HTTP status code or add custom headers to the response.",
                                "REST_API", "AMARILLO"),
                        new Flashcard(
                                "What HTTP methods are used in RESTful APIs and what do they represent?",
                                "GET retrieves resources, POST creates new resources, PUT updates/replaces resources, PATCH partially updates resources, and DELETE removes resources. These map to @GetMapping, @PostMapping, @PutMapping, @PatchMapping, @DeleteMapping.",
                                "REST_API", "AMARILLO"),

                        // NARANJA - Data & Validation
                        new Flashcard(
                                "What are JPA entity relationships and how are they mapped?",
                                "@OneToMany, @ManyToOne, @OneToOne, and @ManyToMany define relationships between entities. Use mappedBy for bidirectional relationships. @JoinColumn specifies the foreign key column.",
                                "DATA_ACCESS", "NARANJA"),
                        new Flashcard(
                                "How does Bean Validation work in Spring Boot?",
                                "Add spring-boot-starter-validation dependency, annotate DTO fields with constraints like @NotBlank, @Size, @Email, @Min, @Max, @Pattern, and use @Valid on controller parameters to trigger validation.",
                                "VALIDATION", "NARANJA"),
                        new Flashcard(
                                "What is @ControllerAdvice and how is it used for exception handling?",
                                "@ControllerAdvice is a global exception handler. Combined with @ExceptionHandler methods, it catches exceptions across all controllers and returns consistent error responses without duplicating error handling logic.",
                                "REST_API", "NARANJA"),
                        new Flashcard(
                                "What are Spring Profiles and how do you use them?",
                                "Profiles allow different configurations for different environments (dev, test, prod). Activate with spring.profiles.active property. Use @Profile annotation on beans or create application-{profile}.yml files for profile-specific config.",
                                "CONFIGURATION", "NARANJA"),
                        new Flashcard(
                                "What is the difference between JPA and Hibernate?",
                                "JPA (Jakarta Persistence API) is a specification that defines ORM standards. Hibernate is the most popular JPA implementation. Spring Data JPA adds a repository layer on top, so you work with JPA interfaces and Hibernate provides the implementation.",
                                "DATA_ACCESS", "NARANJA"),

                        // VERDE - Security & Testing
                        new Flashcard(
                                "How does Spring Security's filter chain work?",
                                "Spring Security uses a chain of servlet filters. Each filter handles a specific security concern (authentication, authorization, CSRF, etc.). SecurityFilterChain bean configures which filters apply to which endpoints and in what order.",
                                "SECURITY", "VERDE"),
                        new Flashcard(
                                "What is JWT authentication and how does it work in Spring Boot?",
                                "JWT (JSON Web Token) is a stateless authentication mechanism. After login, the server issues a signed token containing user claims. The client sends this token in the Authorization header. The server validates the signature without storing session state.",
                                "SECURITY", "VERDE"),
                        new Flashcard(
                                "How do you write unit tests with @MockBean in Spring Boot?",
                                "@MockBean creates a Mockito mock and adds it to the Spring ApplicationContext, replacing any existing bean. Use it in @WebMvcTest to mock service layers, then verify interactions with verify() and stub responses with when().thenReturn().",
                                "TESTING", "VERDE"),
                        new Flashcard(
                                "What is @SpringBootTest and when should you use it?",
                                "@SpringBootTest loads the full application context for integration testing. It starts the actual Spring Boot application. Use it for testing multiple layers together, but prefer @WebMvcTest or @DataJpaTest for faster, focused tests.",
                                "TESTING", "VERDE"),
                        new Flashcard(
                                "What is CORS and how do you configure it in Spring Boot?",
                                "Cross-Origin Resource Sharing controls which domains can access your API. Configure globally via WebMvcConfigurer.addCorsMappings() or per-controller with @CrossOrigin. Set allowed origins, methods, headers, and credentials.",
                                "SECURITY", "VERDE"),

                        // MARRON - Microservices
                        new Flashcard(
                                "What is Spring Cloud Gateway and how does it work?",
                                "Spring Cloud Gateway is an API gateway built on Spring WebFlux. It provides routing, filtering, and load balancing for microservices. Routes match requests by predicates and apply filters for cross-cutting concerns like authentication.",
                                "MICROSERVICES", "MARRON"),
                        new Flashcard(
                                "What is Eureka and how does service discovery work?",
                                "Eureka is Netflix's service discovery server. Services register themselves with Eureka on startup. Other services look up registered instances by name. This enables load balancing and eliminates hardcoded URLs between microservices.",
                                "MICROSERVICES", "MARRON"),
                        new Flashcard(
                                "What is the Circuit Breaker pattern and how does Resilience4j implement it?",
                                "Circuit Breaker prevents cascading failures. It monitors calls to a service; if failures exceed a threshold, the circuit 'opens' and returns a fallback. Resilience4j provides @CircuitBreaker annotation with configurable failure rates and wait durations.",
                                "MICROSERVICES", "MARRON"),
                        new Flashcard(
                                "What is Spring Cloud Config and why is it useful?",
                                "Spring Cloud Config provides centralized external configuration for distributed systems. A Config Server serves properties from a Git repository. Services fetch their configuration at startup, enabling environment-specific config without redeployment.",
                                "MICROSERVICES", "MARRON"),
                        new Flashcard(
                                "How does client-side load balancing work with Spring Cloud?",
                                "Spring Cloud LoadBalancer (replacing Ribbon) distributes requests across service instances. When using lb:// URIs in Gateway or @LoadBalanced RestTemplate, it queries Eureka for available instances and applies round-robin or custom strategies.",
                                "MICROSERVICES", "MARRON"),

                        // NEGRO - Advanced Topics
                        new Flashcard(
                                "What is Spring WebFlux and how does reactive programming differ from traditional MVC?",
                                "WebFlux is Spring's reactive web framework using Project Reactor. It uses non-blocking I/O with Mono (0-1 elements) and Flux (0-N elements). Unlike MVC's thread-per-request model, WebFlux handles more concurrent connections with fewer threads.",
                                "ADVANCED", "NEGRO"),
                        new Flashcard(
                                "What is Spring Boot Actuator and what endpoints does it provide?",
                                "Actuator adds production-ready features: /health for health checks, /metrics for application metrics, /info for app info, /env for environment properties, /loggers for log level management. Secure these endpoints in production.",
                                "ADVANCED", "NEGRO"),
                        new Flashcard(
                                "How do you containerize a Spring Boot application with Docker?",
                                "Use a multi-stage Dockerfile: first stage builds with Maven/Gradle, second stage uses a JRE base image and copies the JAR. Use layered JARs for better caching. Configure JVM memory settings with -Xmx and -Xms for container environments.",
                                "ADVANCED", "NEGRO"),
                        new Flashcard(
                                "What is event-driven architecture with Spring and how does Kafka integrate?",
                                "Event-driven architecture uses asynchronous messaging between services. Spring Kafka provides KafkaTemplate for producing messages and @KafkaListener for consuming. Events decouple services, improve scalability, and enable eventual consistency.",
                                "ADVANCED", "NEGRO"),
                        new Flashcard(
                                "What is Spring Native and GraalVM, and what are the benefits?",
                                "Spring Native compiles Spring Boot apps to native executables using GraalVM's ahead-of-time compilation. Native images start in milliseconds and use less memory, ideal for serverless and containerized deployments, but have longer build times.",
                                "ADVANCED", "NEGRO")
                ));
            }
        };
    }

    @Bean
    CommandLineRunner seedExercises(CodeExerciseRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                    // BLANCO - Spring Basics
                    new CodeExercise(
                        "Crear un @Bean de configuración",
                        "Crea una clase de configuración que defina un bean de tipo String llamado 'appName' que retorne \"Spring Boot Dojo\".",
                        "BLANCO",
                        "@Configuration\npublic class AppConfig {\n\n    // TODO: Crea un método con @Bean que retorne un String\n\n}",
                        "@Configuration\npublic class AppConfig {\n\n    @Bean\n    public String appName() {\n        return \"Spring Boot Dojo\";\n    }\n}",
                        "@Configuration,@Bean,public,return",
                        "Usa @Configuration en la clase y @Bean en el método. El método debe ser public y retornar un valor."
                    ),
                    new CodeExercise(
                        "Inyección con @Autowired",
                        "Crea un servicio que inyecte un repositorio usando inyección por constructor. La clase debe ser un @Service.",
                        "BLANCO",
                        "@Service\npublic class UserService {\n\n    // TODO: Inyecta UserRepository por constructor\n\n}",
                        "@Service\npublic class UserService {\n\n    private final UserRepository userRepository;\n\n    @Autowired\n    public UserService(UserRepository userRepository) {\n        this.userRepository = userRepository;\n    }\n}",
                        "@Service,private final,UserRepository,@Autowired,public UserService",
                        "Declara el campo como private final, crea un constructor con @Autowired que reciba el repositorio."
                    ),
                    new CodeExercise(
                        "Crear un @Component",
                        "Crea un componente llamado EmailValidator que tenga un método 'isValid(String email)' que retorne boolean.",
                        "BLANCO",
                        "// TODO: Marca esta clase como componente de Spring\npublic class EmailValidator {\n\n    // TODO: Método que valide un email\n\n}",
                        "@Component\npublic class EmailValidator {\n\n    public boolean isValid(String email) {\n        return email != null && email.contains(\"@\");\n    }\n}",
                        "@Component,public boolean isValid,String email,return",
                        "Usa @Component para que Spring lo detecte. El método debe recibir un String y retornar boolean."
                    ),

                    // AMARILLO - REST APIs
                    new CodeExercise(
                        "Crear un @RestController con GET",
                        "Crea un controlador REST para productos con un endpoint GET /products que retorne una lista de strings.",
                        "AMARILLO",
                        "// TODO: Marca como controlador REST\n// TODO: Mapea a /products\npublic class ProductController {\n\n    // TODO: Endpoint GET que retorne lista de productos\n\n}",
                        "@RestController\n@RequestMapping(\"/products\")\npublic class ProductController {\n\n    @GetMapping\n    public List<String> getAll() {\n        return List.of(\"Laptop\", \"Mouse\", \"Keyboard\");\n    }\n}",
                        "@RestController,@RequestMapping,@GetMapping,public,List",
                        "Usa @RestController + @RequestMapping para la ruta base. @GetMapping para el método GET."
                    ),
                    new CodeExercise(
                        "Crear una entidad JPA",
                        "Crea una entidad JPA 'Product' con campos: id (Long, autogenerado), name (String, no nulo) y price (Double).",
                        "AMARILLO",
                        "// TODO: Marca como entidad JPA\n// TODO: Define la tabla\npublic class Product {\n\n    // TODO: Id autogenerado\n    private Long id;\n\n    // TODO: Campo obligatorio\n    private String name;\n\n    private Double price;\n\n    // Getters y setters...\n}",
                        "@Entity\n@Table(name = \"products\")\npublic class Product {\n\n    @Id\n    @GeneratedValue(strategy = GenerationType.IDENTITY)\n    private Long id;\n\n    @Column(nullable = false)\n    private String name;\n\n    private Double price;\n}",
                        "@Entity,@Table,@Id,@GeneratedValue,@Column,nullable = false",
                        "Usa @Entity y @Table en la clase. @Id + @GeneratedValue para el id. @Column(nullable = false) para campos obligatorios."
                    ),
                    new CodeExercise(
                        "Crear un DTO con validación",
                        "Crea un DTO 'CreateProductRequest' con campos: name (@NotBlank), price (@Min(0)) y description (@Size(max=500)).",
                        "AMARILLO",
                        "public class CreateProductRequest {\n\n    // TODO: name no puede estar vacío\n    private String name;\n\n    // TODO: price mínimo 0\n    private Double price;\n\n    // TODO: description máximo 500 caracteres\n    private String description;\n\n    // Getters y setters...\n}",
                        "public class CreateProductRequest {\n\n    @NotBlank\n    private String name;\n\n    @Min(0)\n    private Double price;\n\n    @Size(max = 500)\n    private String description;\n}",
                        "@NotBlank,@Min,@Size,private String name,private Double price",
                        "Usa @NotBlank para strings obligatorios, @Min para valores mínimos, @Size para limitar longitud."
                    )
                ));
            }
        };
    }

    @Bean
    CommandLineRunner seedQuizzes(QuizRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                        // BLANCO quizzes
                        new Quiz("Which annotation marks a Spring Boot main class?",
                                "@SpringBootApplication", "@SpringMain", "@BootApplication", "@EnableSpring",
                                0, "SPRING_BASICS", "BLANCO"),
                        new Quiz("What does DI stand for in Spring?",
                                "Dependency Injection", "Data Integration", "Direct Instantiation", "Dynamic Interface",
                                0, "SPRING_BASICS", "BLANCO"),
                        new Quiz("Which file is used to configure a Spring Boot app?",
                                "application.yml", "spring-config.xml", "boot.properties", "server.conf",
                                0, "CONFIGURATION", "BLANCO"),
                        new Quiz("Which annotation is used for data access components?",
                                "@Controller", "@Service", "@Repository", "@Component",
                                2, "SPRING_BASICS", "BLANCO"),
                        new Quiz("What build tool does Spring Boot commonly use?",
                                "Ant", "Gradle or Maven", "Make", "Webpack",
                                1, "SPRING_BASICS", "BLANCO"),

                        // AMARILLO quizzes
                        new Quiz("Which annotation creates a REST controller?",
                                "@Controller", "@RestController", "@WebController", "@ApiController",
                                1, "REST_API", "AMARILLO"),
                        new Quiz("What does @GetMapping map to?",
                                "HTTP POST requests", "HTTP GET requests", "HTTP PUT requests", "HTTP DELETE requests",
                                1, "REST_API", "AMARILLO"),
                        new Quiz("What interface do Spring Data repositories extend?",
                                "CrudRepository or JpaRepository", "DataRepository", "SpringRepository", "EntityRepository",
                                0, "DATA_ACCESS", "AMARILLO"),
                        new Quiz("What does ResponseEntity allow you to control?",
                                "Only the response body", "HTTP status, headers, and body", "Only the HTTP status", "Only the headers",
                                1, "REST_API", "AMARILLO"),
                        new Quiz("Which annotation extracts values from the URL path?",
                                "@RequestParam", "@RequestBody", "@PathVariable", "@RequestHeader",
                                2, "REST_API", "AMARILLO"),

                        // NARANJA quizzes
                        new Quiz("Which annotation defines a one-to-many JPA relationship?",
                                "@ManyToOne", "@OneToMany", "@JoinTable", "@Relationship",
                                1, "DATA_ACCESS", "NARANJA"),
                        new Quiz("Which annotation triggers bean validation on a parameter?",
                                "@Validated", "@Valid", "@Check", "@Verify",
                                1, "VALIDATION", "NARANJA"),
                        new Quiz("What does @ControllerAdvice do?",
                                "Configures routing", "Handles exceptions globally", "Enables caching", "Manages transactions",
                                1, "REST_API", "NARANJA"),
                        new Quiz("How do you activate a Spring profile?",
                                "spring.profile=dev", "spring.profiles.active=dev", "spring.env=dev", "profile.name=dev",
                                1, "CONFIGURATION", "NARANJA"),
                        new Quiz("What is Hibernate in relation to JPA?",
                                "An alternative to JPA", "A JPA implementation", "A database driver", "A Spring module",
                                1, "DATA_ACCESS", "NARANJA"),

                        // VERDE quizzes
                        new Quiz("What does Spring Security use to process requests?",
                                "Interceptors", "Filter chain", "Aspects", "Listeners",
                                1, "SECURITY", "VERDE"),
                        new Quiz("What does JWT stand for?",
                                "Java Web Technology", "JSON Web Token", "Java Web Token", "JSON Wired Transfer",
                                1, "SECURITY", "VERDE"),
                        new Quiz("Which annotation creates a mock bean in Spring tests?",
                                "@Mock", "@MockBean", "@Fake", "@Stub",
                                1, "TESTING", "VERDE"),
                        new Quiz("What does @SpringBootTest do?",
                                "Runs only unit tests", "Loads full application context", "Tests only controllers", "Tests only repositories",
                                1, "TESTING", "VERDE"),
                        new Quiz("What does CORS stand for?",
                                "Cross-Origin Resource Sharing", "Client-Origin Request Security", "Cross-Object Remote Service", "Central Origin Response System",
                                0, "SECURITY", "VERDE"),

                        // MARRON quizzes
                        new Quiz("What is Spring Cloud Gateway built on?",
                                "Spring MVC", "Spring WebFlux", "Servlet API", "Netty directly",
                                1, "MICROSERVICES", "MARRON"),
                        new Quiz("What does Eureka provide?",
                                "Configuration management", "Service discovery", "Load balancing", "Circuit breaking",
                                1, "MICROSERVICES", "MARRON"),
                        new Quiz("What does a Circuit Breaker do when failures exceed a threshold?",
                                "Retries immediately", "Opens and returns fallback", "Restarts the service", "Logs and continues",
                                1, "MICROSERVICES", "MARRON"),
                        new Quiz("Where does Spring Cloud Config store configuration?",
                                "Local filesystem only", "Git repository", "Database", "Environment variables only",
                                1, "MICROSERVICES", "MARRON"),
                        new Quiz("What does lb:// prefix mean in gateway routes?",
                                "Local binding", "Load balanced", "Lazy binding", "Link bridge",
                                1, "MICROSERVICES", "MARRON"),

                        // NEGRO quizzes
                        new Quiz("What are Mono and Flux in Spring WebFlux?",
                                "Database types", "Reactive types for 0-1 and 0-N elements", "Thread pools", "Cache types",
                                1, "ADVANCED", "NEGRO"),
                        new Quiz("Which Actuator endpoint checks application health?",
                                "/status", "/health", "/check", "/ping",
                                1, "ADVANCED", "NEGRO"),
                        new Quiz("What is the benefit of multi-stage Docker builds?",
                                "Faster runtime", "Smaller final image size", "Better logging", "More security",
                                1, "ADVANCED", "NEGRO"),
                        new Quiz("What does Spring Kafka use to send messages?",
                                "KafkaProducer", "KafkaTemplate", "MessageSender", "EventPublisher",
                                1, "ADVANCED", "NEGRO"),
                        new Quiz("What does GraalVM native image provide?",
                                "Faster build times", "Fast startup and low memory usage", "Better debugging", "Hot reload",
                                1, "ADVANCED", "NEGRO")
                ));
            }
        };
    }
}
