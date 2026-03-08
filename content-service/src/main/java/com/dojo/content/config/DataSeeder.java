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
                    // ══════════════════════════════════════════
                    // BLANCO - Fundamentos de Spring
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué hace la anotación @SpringBootApplication?",
                        "Combina tres anotaciones: @Configuration (clase de configuración), @EnableAutoConfiguration (configuración automática según dependencias) y @ComponentScan (escanea componentes en el paquete). Es la anotación que marca la clase principal de una app Spring Boot.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es la Inyección de Dependencias (DI)?",
                        "Es un patrón de diseño donde los objetos reciben sus dependencias desde fuera en vez de crearlas ellos mismos. Spring inyecta dependencias por constructor (recomendado), setter o campo (@Autowired). Esto hace el código más testeable y desacoplado.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Cuál es la diferencia entre @Component, @Service y @Repository?",
                        "Las tres son estereotipos para que Spring las detecte en el escaneo de componentes. @Service indica lógica de negocio, @Repository indica acceso a datos (añade traducción de excepciones de persistencia), y @Component es un estereotipo genérico para cualquier otra cosa.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es el contenedor IoC de Spring?",
                        "El contenedor de Inversión de Control es el corazón de Spring. Crea objetos (beans), los conecta entre sí, los configura y gestiona su ciclo de vida. Las interfaces principales son BeanFactory (básica) y ApplicationContext (con más funcionalidades).",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Para qué sirve application.properties o application.yml?",
                        "Son archivos de configuración de Spring Boot. Definen cosas como el puerto del servidor, conexión a base de datos, niveles de log y propiedades personalizadas. YAML usa formato jerárquico (más legible), properties usa clave=valor plano.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es un Bean en Spring?",
                        "Un bean es cualquier objeto gestionado por el contenedor IoC de Spring. Se puede crear con @Component/@Service/@Repository (escaneo automático) o con @Bean dentro de una clase @Configuration (creación manual). Spring se encarga de su ciclo de vida.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué diferencia hay entre @Autowired en campo vs constructor?",
                        "Campo: @Autowired private MiServicio servicio; — fácil pero difícil de testear. Constructor: MiServicio inyectado por parámetro — RECOMENDADO porque permite campos final, facilita tests con mocks, y hace explícitas las dependencias. Si solo hay un constructor, @Autowired es opcional.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es el scope de un bean y cuáles existen?",
                        "El scope define cuántas instancias se crean. Singleton (por defecto): una sola instancia compartida. Prototype: nueva instancia cada vez que se pide. Request: una por petición HTTP. Session: una por sesión HTTP. En el 95% de casos, singleton es suficiente.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué hace @Value en Spring?",
                        "@Value inyecta valores de configuración en campos. Ejemplo: @Value(\"${server.port}\") private int port; Lee el valor de application.yml. También acepta valores por defecto: @Value(\"${mi.propiedad:valorDefault}\").",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Para qué sirve @PostConstruct?",
                        "@PostConstruct marca un método que se ejecuta DESPUÉS de que Spring cree el bean e inyecte todas sus dependencias. Es útil para inicialización que necesita dependencias ya inyectadas. Se ejecuta una sola vez.",
                        "FUNDAMENTOS", "BLANCO"),

                    // ══════════════════════════════════════════
                    // AMARILLO - APIs REST y JPA
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué hace @RestController?",
                        "Combina @Controller y @ResponseBody. Todos los métodos devuelven datos directamente (JSON por defecto) en vez de un nombre de vista. Es la anotación estándar para crear APIs REST.",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es Spring Data JPA?",
                        "Un módulo de Spring que simplifica el acceso a datos. Defines interfaces que extienden JpaRepository y Spring genera la implementación automáticamente. Incluye métodos CRUD, paginación y queries derivados del nombre del método.",
                        "ACCESO_DATOS", "AMARILLO"),
                    new Flashcard(
                        "¿Cuál es la diferencia entre @RequestParam y @PathVariable?",
                        "@PathVariable extrae valores de la ruta URL (ej: /users/{id} → @PathVariable Long id). @RequestParam extrae parámetros de consulta (ej: /users?name=Berto → @RequestParam String name). PathVariable para identificar recursos, RequestParam para filtrar.",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es ResponseEntity y cuándo usarlo?",
                        "ResponseEntity representa la respuesta HTTP completa: código de estado, cabeceras y cuerpo. Úsalo cuando necesites controlar el código HTTP (ej: 201 Created, 404 Not Found) o añadir cabeceras personalizadas. Ejemplo: ResponseEntity.status(201).body(objeto).",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Qué métodos HTTP se usan en APIs REST?",
                        "GET: obtener recursos. POST: crear nuevos. PUT: actualizar/reemplazar completo. PATCH: actualizar parcialmente. DELETE: eliminar. En Spring se mapean con @GetMapping, @PostMapping, @PutMapping, @PatchMapping, @DeleteMapping.",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es un DTO y por qué usarlo?",
                        "DTO (Data Transfer Object) es un objeto que transporta datos entre capas. Se usa para: 1) No exponer entidades JPA directamente en la API, 2) Controlar qué campos se envían/reciben, 3) Validar datos de entrada, 4) Evitar problemas de serialización circular.",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Cómo funcionan las queries derivadas en Spring Data JPA?",
                        "Spring Data genera queries SQL a partir del nombre del método. Ejemplo: findByUsernameAndActive(String username, boolean active) genera SELECT * FROM tabla WHERE username = ? AND active = ?. Soporta keywords: And, Or, Between, LessThan, Like, OrderBy, etc.",
                        "ACCESO_DATOS", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es @RequestBody y cómo funciona?",
                        "@RequestBody convierte el cuerpo JSON de la petición HTTP a un objeto Java automáticamente (usando Jackson). Ejemplo: @PostMapping public User crear(@RequestBody UserDTO dto) — Spring parsea el JSON del body y lo convierte a UserDTO.",
                        "REST_API", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es H2 y para qué se usa en desarrollo?",
                        "H2 es una base de datos relacional en memoria (in-memory) escrita en Java. Perfecta para desarrollo y tests porque no necesita instalación, arranca con la app y tiene consola web. Con ddl-auto: create-drop, las tablas se crean al arrancar y se borran al parar.",
                        "ACCESO_DATOS", "AMARILLO"),
                    new Flashcard(
                        "¿Qué diferencia hay entre save() y saveAll() en JpaRepository?",
                        "save() persiste una sola entidad (INSERT si es nueva, UPDATE si ya existe). saveAll() persiste una lista de entidades. Ambos devuelven la entidad guardada con el ID generado. Spring detecta si es nuevo mirando si el @Id es null.",
                        "ACCESO_DATOS", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // NARANJA - Validación, Relaciones, Perfiles
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo se definen relaciones JPA entre entidades?",
                        "@OneToMany, @ManyToOne, @OneToOne y @ManyToMany definen relaciones. Usa mappedBy en la relación bidireccional (lado que NO tiene la FK). @JoinColumn especifica la columna de clave foránea. Siempre define el lado 'dueño' de la relación.",
                        "ACCESO_DATOS", "NARANJA"),
                    new Flashcard(
                        "¿Cómo funciona Bean Validation en Spring Boot?",
                        "Añade la dependencia spring-boot-starter-validation. Anota campos del DTO con restricciones (@NotBlank, @Size, @Email, @Min, @Max, @Pattern). Usa @Valid en el parámetro del controller para activar la validación. Los errores devuelven 400 Bad Request.",
                        "VALIDACION", "NARANJA"),
                    new Flashcard(
                        "¿Qué es @ControllerAdvice y cómo se usa para manejar errores?",
                        "@ControllerAdvice es un manejador global de excepciones. Combinado con @ExceptionHandler, captura excepciones de TODOS los controllers y devuelve respuestas de error consistentes. Evita repetir try-catch en cada endpoint.",
                        "REST_API", "NARANJA"),
                    new Flashcard(
                        "¿Qué son los Spring Profiles y cómo se usan?",
                        "Los perfiles permiten configuraciones diferentes por entorno (dev, test, prod). Se activan con spring.profiles.active=dev. Puedes crear application-dev.yml, application-prod.yml. También se usa @Profile(\"dev\") en beans para que solo existan en cierto perfil.",
                        "CONFIGURACION", "NARANJA"),
                    new Flashcard(
                        "¿Cuál es la diferencia entre JPA e Hibernate?",
                        "JPA (Jakarta Persistence API) es una ESPECIFICACIÓN que define estándares ORM. Hibernate es la IMPLEMENTACIÓN más popular de JPA. Spring Data JPA añade una capa de repositorios encima. Tú trabajas con interfaces JPA, Hibernate hace el trabajo sucio por debajo.",
                        "ACCESO_DATOS", "NARANJA"),
                    new Flashcard(
                        "¿Qué es el problema N+1 en JPA y cómo evitarlo?",
                        "Ocurre cuando al cargar N entidades, JPA hace 1 query para la lista + N queries extras (una por cada relación). Solución: usar JOIN FETCH en JPQL, @EntityGraph, o configurar fetch = FetchType.LAZY y cargar explícitamente cuando necesites.",
                        "ACCESO_DATOS", "NARANJA"),
                    new Flashcard(
                        "¿Qué es @Transactional y cuándo usarlo?",
                        "@Transactional asegura que un grupo de operaciones de base de datos se ejecutan como una unidad atómica: o todas se completan o ninguna. Ponlo en métodos de servicio que hagan múltiples escrituras. rollbackFor define qué excepciones hacen rollback.",
                        "ACCESO_DATOS", "NARANJA"),
                    new Flashcard(
                        "¿Qué es Lombok y qué anotaciones son las más útiles?",
                        "Lombok genera código repetitivo (boilerplate) en tiempo de compilación. @Data = getters + setters + toString + equals + hashCode. @NoArgsConstructor / @AllArgsConstructor = constructores. @Builder = patrón builder. @Slf4j = logger. Ahorra MUCHO código.",
                        "HERRAMIENTAS", "NARANJA"),
                    new Flashcard(
                        "¿Qué es MapStruct y para qué sirve?",
                        "MapStruct genera automáticamente código para convertir entre entidades y DTOs. Defines una interfaz @Mapper con métodos como UserDTO toDto(User user) y MapStruct genera la implementación. Es más rápido que hacerlo manual y menos propenso a errores.",
                        "HERRAMIENTAS", "NARANJA"),
                    new Flashcard(
                        "¿Qué es la paginación y cómo se implementa en Spring Data?",
                        "En vez de devolver todos los registros, devuelves páginas. El endpoint recibe Pageable como parámetro y el repository devuelve Page<T>. Ejemplo: /api/users?page=0&size=10&sort=name,asc. El cliente controla qué página ver y cuántos elementos.",
                        "ACCESO_DATOS", "NARANJA"),

                    // ══════════════════════════════════════════
                    // VERDE - Seguridad y Testing
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona la cadena de filtros de Spring Security?",
                        "Spring Security usa una cadena de filtros servlet. Cada filtro maneja un aspecto de seguridad (autenticación, autorización, CSRF, etc.). SecurityFilterChain configura qué filtros aplican a qué endpoints y en qué orden. Se procesan de forma secuencial.",
                        "SEGURIDAD", "VERDE"),
                    new Flashcard(
                        "¿Qué es JWT y cómo funciona en Spring Boot?",
                        "JWT (JSON Web Token) es un mecanismo de autenticación stateless. Tras el login, el servidor genera un token firmado con claims del usuario. El cliente envía el token en el header Authorization. El servidor valida la firma sin guardar estado de sesión.",
                        "SEGURIDAD", "VERDE"),
                    new Flashcard(
                        "¿Cómo se escriben tests unitarios con @MockBean?",
                        "@MockBean crea un mock de Mockito y lo añade al contexto de Spring, reemplazando el bean real. Se usa en @WebMvcTest para mockear capas de servicio. Verificas interacciones con verify() y configuras respuestas con when().thenReturn().",
                        "TESTING", "VERDE"),
                    new Flashcard(
                        "¿Qué es @SpringBootTest y cuándo usarlo?",
                        "@SpringBootTest carga el contexto COMPLETO de la aplicación para tests de integración. Arranca la app real de Spring Boot. Úsalo para probar varias capas juntas. Pero es lento — prefiere @WebMvcTest o @DataJpaTest para tests más rápidos y enfocados.",
                        "TESTING", "VERDE"),
                    new Flashcard(
                        "¿Qué es CORS y cómo se configura en Spring Boot?",
                        "CORS (Cross-Origin Resource Sharing) controla qué dominios pueden acceder a tu API. Se configura globalmente con WebMvcConfigurer.addCorsMappings() o por controller con @CrossOrigin. Define orígenes, métodos, cabeceras y credenciales permitidos.",
                        "SEGURIDAD", "VERDE"),
                    new Flashcard(
                        "¿Qué es @WebMvcTest y cómo se usa?",
                        "@WebMvcTest carga SOLO la capa web (controllers, filtros, converters). No carga servicios ni repositorios — los mockeas con @MockBean. Es rápido y perfecto para testear que tus endpoints responden correctamente. Usa MockMvc para simular peticiones HTTP.",
                        "TESTING", "VERDE"),
                    new Flashcard(
                        "¿Qué es @DataJpaTest y cuándo usarlo?",
                        "@DataJpaTest carga SOLO la capa de persistencia (entidades, repositorios, EntityManager). Usa una BD en memoria por defecto. Perfecto para testear queries personalizadas, relaciones JPA y constraints. Cada test hace rollback automático.",
                        "TESTING", "VERDE"),
                    new Flashcard(
                        "¿Qué es BCrypt y por qué se usa para contraseñas?",
                        "BCrypt es un algoritmo de hash diseñado para contraseñas. Incluye un salt aleatorio (protege contra rainbow tables) y un factor de coste configurable (hace el hash más lento = más seguro contra fuerza bruta). NUNCA guardes contraseñas en texto plano.",
                        "SEGURIDAD", "VERDE"),
                    new Flashcard(
                        "¿Cómo se testea con MockMvc?",
                        "MockMvc simula peticiones HTTP sin levantar un servidor real. Ejemplo: mockMvc.perform(get(\"/api/users\")).andExpect(status().isOk()).andExpect(jsonPath(\"$[0].name\").value(\"Berto\")). Permite verificar status, headers, body JSON y más.",
                        "TESTING", "VERDE"),
                    new Flashcard(
                        "¿Qué es OpenAPI/Swagger y cómo se añade a Spring Boot?",
                        "OpenAPI es la especificación para documentar APIs REST. Swagger es la UI que muestra esa documentación. Añade springdoc-openapi-starter-webmvc-ui y accede a /swagger-ui.html. Documenta tus endpoints automáticamente sin escribir documentación manual.",
                        "HERRAMIENTAS", "VERDE"),

                    // ══════════════════════════════════════════
                    // MARRÓN - Microservicios
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es Spring Cloud Gateway y cómo funciona?",
                        "Es un API Gateway construido sobre Spring WebFlux. Proporciona enrutamiento, filtrado y balanceo de carga para microservicios. Las rutas se definen con predicados (por path, header, etc.) y filtros para funcionalidades transversales como autenticación.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es Eureka y cómo funciona el descubrimiento de servicios?",
                        "Eureka es el servidor de Service Discovery de Netflix. Los servicios se registran en Eureka al arrancar. Otros servicios buscan instancias por nombre. Esto elimina URLs hardcodeadas y permite balanceo de carga automático entre instancias.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es el patrón Circuit Breaker y cómo lo implementa Resilience4j?",
                        "Circuit Breaker previene fallos en cascada. Monitoriza llamadas a un servicio; si los fallos superan un umbral, el circuito se 'abre' y devuelve un fallback. Resilience4j proporciona @CircuitBreaker con tasas de fallo y tiempos de espera configurables.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es Spring Cloud Config y por qué es útil?",
                        "Proporciona configuración centralizada externa para sistemas distribuidos. Un Config Server sirve propiedades desde un repositorio Git. Los servicios obtienen su configuración al arrancar, permitiendo configuración por entorno sin redesplegar.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Cómo funciona el balanceo de carga del lado del cliente con Spring Cloud?",
                        "Spring Cloud LoadBalancer distribuye peticiones entre instancias de un servicio. Cuando usas lb:// en Gateway o @LoadBalanced RestTemplate, consulta Eureka para obtener instancias disponibles y aplica round-robin u otra estrategia de distribución.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es OpenFeign y cómo simplifica las llamadas entre microservicios?",
                        "OpenFeign es un cliente HTTP declarativo. Defines una interfaz con anotaciones (@FeignClient, @GetMapping) y Spring genera la implementación. Integra automáticamente con Eureka para descubrimiento. Mucho más limpio que usar RestTemplate manual.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es Docker Compose y cómo se usa con microservicios?",
                        "Docker Compose orquesta múltiples contenedores Docker con un solo archivo YAML. Defines cada servicio, puertos, variables de entorno y dependencias. Con 'docker compose up' levantas toda la arquitectura de microservicios con un solo comando.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es el patrón Saga en microservicios?",
                        "El patrón Saga gestiona transacciones distribuidas entre microservicios. En vez de un gran transaction, usa una secuencia de transacciones locales. Si una falla, ejecuta transacciones de compensación (rollback manual). Puede ser coreografiada (eventos) u orquestada.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué son las trazas distribuidas y para qué sirve Zipkin?",
                        "En microservicios, una petición atraviesa varios servicios. Las trazas distribuidas asignan un ID único a cada petición y rastrean su camino. Zipkin visualiza estas trazas, mostrando tiempos y cuellos de botella. Se integra con Micrometer Tracing.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es un API Gateway y qué ventajas tiene?",
                        "Un API Gateway es el punto de entrada único para todos los microservicios. Ventajas: 1) Un solo URL para el cliente, 2) Autenticación centralizada, 3) Rate limiting, 4) Logging centralizado, 5) Balanceo de carga, 6) Transformación de peticiones.",
                        "MICROSERVICIOS", "MARRON"),

                    // ══════════════════════════════════════════
                    // NEGRO - Temas Avanzados
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es Spring WebFlux y cómo difiere de MVC?",
                        "WebFlux es el framework web reactivo de Spring usando Project Reactor. Usa I/O no bloqueante con Mono (0-1 elementos) y Flux (0-N elementos). A diferencia del modelo thread-per-request de MVC, WebFlux maneja más conexiones concurrentes con menos hilos.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es Spring Boot Actuator y qué endpoints ofrece?",
                        "Actuator añade funcionalidades de producción: /health (estado de salud), /metrics (métricas de la app), /info (info de la app), /env (propiedades del entorno), /loggers (gestión de niveles de log). ¡Protege estos endpoints en producción!",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Cómo se dockeriza una aplicación Spring Boot?",
                        "Usa un Dockerfile multi-stage: primera etapa compila con Maven/Gradle, segunda usa una imagen JRE base y copia el JAR. Usa layered JARs para mejor caché. Configura memoria JVM con -Xmx y -Xms para entornos containerizados.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es la arquitectura dirigida por eventos con Kafka?",
                        "Arquitectura donde los servicios se comunican mediante eventos asíncronos. Spring Kafka proporciona KafkaTemplate para producir mensajes y @KafkaListener para consumir. Los eventos desacoplan servicios, mejoran la escalabilidad y permiten consistencia eventual.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es GraalVM Native Image y qué beneficios tiene?",
                        "Spring Native compila apps Spring Boot a ejecutables nativos usando compilación ahead-of-time de GraalVM. Las imágenes nativas arrancan en milisegundos y usan menos memoria, ideal para serverless y contenedores. Desventaja: tiempos de compilación más largos.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es Flyway y cómo gestiona las migraciones de base de datos?",
                        "Flyway gestiona cambios de esquema de BD de forma versionada. Creas scripts SQL (V1__crear_users.sql, V2__añadir_roles.sql) y Flyway los ejecuta en orden. Sabe qué migraciones ya se aplicaron. Imprescindible para equipos y producción.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es la arquitectura hexagonal (puertos y adaptadores)?",
                        "Arquitectura que separa la lógica de negocio del mundo exterior. El dominio está en el centro, define puertos (interfaces). Los adaptadores (controllers, repositorios, clientes HTTP) implementan esos puertos. El dominio no depende de infraestructura.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué son los Testcontainers y cuándo usarlos?",
                        "Testcontainers levanta contenedores Docker reales durante los tests. En vez de H2 en memoria (que no es tu BD real), levantas PostgreSQL, Redis, Kafka en contenedores. Tests más realistas que detectan problemas reales. Se integra con JUnit 5.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es CI/CD y cómo se implementa para Spring Boot?",
                        "CI (Integración Continua): cada push ejecuta tests automáticamente. CD (Despliegue Continuo): si los tests pasan, se despliega automáticamente. Herramientas: GitHub Actions, Jenkins, GitLab CI. Pipeline típico: build → test → análisis → deploy.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es el patrón CQRS y cuándo aplicarlo?",
                        "CQRS (Command Query Responsibility Segregation) separa lecturas y escrituras en modelos diferentes. Las queries leen de un modelo optimizado para lectura, los commands escriben en otro. Útil cuando los patrones de lectura y escritura son muy diferentes.",
                        "AVANZADO", "NEGRO")
                ));
            }
        };
    }

    @Bean
    CommandLineRunner seedExercises(CodeExerciseRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                    // BLANCO
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
                        "Inyección por constructor",
                        "Crea un servicio que inyecte un repositorio usando inyección por constructor. La clase debe ser un @Service.",
                        "BLANCO",
                        "@Service\npublic class UserService {\n\n    // TODO: Inyecta UserRepository por constructor\n\n}",
                        "@Service\npublic class UserService {\n\n    private final UserRepository userRepository;\n\n    public UserService(UserRepository userRepository) {\n        this.userRepository = userRepository;\n    }\n}",
                        "@Service,private final,UserRepository,public UserService",
                        "Declara el campo como private final, crea un constructor que reciba el repositorio. Con un solo constructor, @Autowired es opcional."
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

                    // AMARILLO
                    new CodeExercise(
                        "Crear un @RestController con GET",
                        "Crea un controlador REST para productos con un endpoint GET /api/products que retorne una lista de strings.",
                        "AMARILLO",
                        "// TODO: Marca como controlador REST\n// TODO: Mapea a /api/products\npublic class ProductController {\n\n    // TODO: Endpoint GET que retorne lista de productos\n\n}",
                        "@RestController\n@RequestMapping(\"/api/products\")\npublic class ProductController {\n\n    @GetMapping\n    public List<String> getAll() {\n        return List.of(\"Portátil\", \"Ratón\", \"Teclado\");\n    }\n}",
                        "@RestController,@RequestMapping,@GetMapping,public,List",
                        "Usa @RestController + @RequestMapping para la ruta base. @GetMapping para el método GET."
                    ),
                    new CodeExercise(
                        "Crear una entidad JPA",
                        "Crea una entidad JPA 'Product' con campos: id (Long, autogenerado), name (String, no nulo) y price (Double).",
                        "AMARILLO",
                        "// TODO: Marca como entidad JPA\npublic class Product {\n\n    // TODO: Id autogenerado\n    private Long id;\n\n    // TODO: Campo obligatorio\n    private String name;\n\n    private Double price;\n}",
                        "@Entity\n@Table(name = \"products\")\npublic class Product {\n\n    @Id\n    @GeneratedValue(strategy = GenerationType.IDENTITY)\n    private Long id;\n\n    @Column(nullable = false)\n    private String name;\n\n    private Double price;\n}",
                        "@Entity,@Table,@Id,@GeneratedValue,@Column,nullable = false",
                        "Usa @Entity y @Table en la clase. @Id + @GeneratedValue para el id. @Column(nullable = false) para campos obligatorios."
                    ),
                    new CodeExercise(
                        "Crear un DTO con validación",
                        "Crea un DTO 'CreateProductRequest' con: name (@NotBlank), price (@Min(0)) y description (@Size(max=500)).",
                        "AMARILLO",
                        "public class CreateProductRequest {\n\n    // TODO: name no puede estar vacío\n    private String name;\n\n    // TODO: price mínimo 0\n    private Double price;\n\n    // TODO: description máximo 500 caracteres\n    private String description;\n}",
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
                    // ══════════════════════════════════════════
                    // BLANCO
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué anotación marca la clase principal de Spring Boot?",
                            "@SpringBootApplication", "@SpringMain", "@BootApplication", "@EnableSpring",
                            0, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Qué significa DI en Spring?",
                            "Inyección de Dependencias", "Integración de Datos", "Instanciación Directa", "Interfaz Dinámica",
                            0, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Qué archivo se usa para configurar una app Spring Boot?",
                            "application.yml", "spring-config.xml", "boot.properties", "server.conf",
                            0, "CONFIGURACION", "BLANCO"),
                    new Quiz("¿Qué anotación se usa para componentes de acceso a datos?",
                            "@Controller", "@Service", "@Repository", "@Component",
                            2, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Qué herramientas de build usa Spring Boot comúnmente?",
                            "Ant", "Gradle o Maven", "Make", "Webpack",
                            1, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Cuál es el scope por defecto de un bean en Spring?",
                            "Prototype", "Request", "Singleton", "Session",
                            2, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Qué tipo de inyección de dependencias es RECOMENDADO?",
                            "Por campo (@Autowired)", "Por setter", "Por constructor", "Por interfaz",
                            2, "FUNDAMENTOS", "BLANCO"),
                    new Quiz("¿Qué hace @Value(\"${server.port}\")?",
                            "Define el puerto", "Inyecta el valor de configuración", "Valida el puerto", "Crea una variable",
                            1, "FUNDAMENTOS", "BLANCO"),

                    // ══════════════════════════════════════════
                    // AMARILLO
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué anotación crea un controlador REST?",
                            "@Controller", "@RestController", "@WebController", "@ApiController",
                            1, "REST_API", "AMARILLO"),
                    new Quiz("¿A qué tipo de petición HTTP mapea @GetMapping?",
                            "POST", "GET", "PUT", "DELETE",
                            1, "REST_API", "AMARILLO"),
                    new Quiz("¿Qué interfaz extienden los repositorios de Spring Data?",
                            "CrudRepository o JpaRepository", "DataRepository", "SpringRepository", "EntityRepository",
                            0, "ACCESO_DATOS", "AMARILLO"),
                    new Quiz("¿Qué permite controlar ResponseEntity?",
                            "Solo el cuerpo de la respuesta", "Código HTTP, cabeceras y cuerpo", "Solo el código HTTP", "Solo las cabeceras",
                            1, "REST_API", "AMARILLO"),
                    new Quiz("¿Qué anotación extrae valores de la ruta URL?",
                            "@RequestParam", "@RequestBody", "@PathVariable", "@RequestHeader",
                            2, "REST_API", "AMARILLO"),
                    new Quiz("¿Qué hace @RequestBody?",
                            "Lee parámetros de URL", "Convierte JSON del body a objeto Java", "Envía la respuesta", "Lee cabeceras HTTP",
                            1, "REST_API", "AMARILLO"),
                    new Quiz("¿Qué base de datos en memoria se suele usar en desarrollo?",
                            "MySQL", "PostgreSQL", "H2", "MongoDB",
                            2, "ACCESO_DATOS", "AMARILLO"),
                    new Quiz("¿Qué es un DTO?",
                            "Un tipo de base de datos", "Un objeto para transferir datos entre capas", "Un test unitario", "Un contenedor Docker",
                            1, "REST_API", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // NARANJA
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué anotación define una relación one-to-many en JPA?",
                            "@ManyToOne", "@OneToMany", "@JoinTable", "@Relationship",
                            1, "ACCESO_DATOS", "NARANJA"),
                    new Quiz("¿Qué anotación activa la validación en un parámetro del controller?",
                            "@Validated", "@Valid", "@Check", "@Verify",
                            1, "VALIDACION", "NARANJA"),
                    new Quiz("¿Qué hace @ControllerAdvice?",
                            "Configura rutas", "Maneja excepciones globalmente", "Activa caché", "Gestiona transacciones",
                            1, "REST_API", "NARANJA"),
                    new Quiz("¿Cómo se activa un Spring Profile?",
                            "spring.profile=dev", "spring.profiles.active=dev", "spring.env=dev", "profile.name=dev",
                            1, "CONFIGURACION", "NARANJA"),
                    new Quiz("¿Qué es Hibernate respecto a JPA?",
                            "Una alternativa a JPA", "Una implementación de JPA", "Un driver de BD", "Un módulo de Spring",
                            1, "ACCESO_DATOS", "NARANJA"),
                    new Quiz("¿Qué genera Lombok con @Data?",
                            "Solo getters", "Getters, setters, toString, equals y hashCode", "Solo constructores", "Solo toString",
                            1, "HERRAMIENTAS", "NARANJA"),
                    new Quiz("¿Qué es el problema N+1 en JPA?",
                            "Error de conexión", "Queries extras por cada relación cargada", "Falta de índices", "Tabla no encontrada",
                            1, "ACCESO_DATOS", "NARANJA"),
                    new Quiz("¿Qué asegura @Transactional?",
                            "Rendimiento", "Que las operaciones de BD son atómicas", "Seguridad", "Logging",
                            1, "ACCESO_DATOS", "NARANJA"),

                    // ══════════════════════════════════════════
                    // VERDE
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué usa Spring Security para procesar peticiones?",
                            "Interceptors", "Cadena de filtros", "Aspectos", "Listeners",
                            1, "SEGURIDAD", "VERDE"),
                    new Quiz("¿Qué significa JWT?",
                            "Java Web Technology", "JSON Web Token", "Java Web Token", "JSON Wired Transfer",
                            1, "SEGURIDAD", "VERDE"),
                    new Quiz("¿Qué anotación crea un mock en tests de Spring?",
                            "@Mock", "@MockBean", "@Fake", "@Stub",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace @SpringBootTest?",
                            "Solo ejecuta tests unitarios", "Carga el contexto completo de la app", "Solo testea controllers", "Solo testea repositorios",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué significa CORS?",
                            "Cross-Origin Resource Sharing", "Client-Origin Request Security", "Cross-Object Remote Service", "Central Origin Response System",
                            0, "SEGURIDAD", "VERDE"),
                    new Quiz("¿Qué carga @WebMvcTest?",
                            "Toda la aplicación", "Solo la capa web (controllers)", "Solo la base de datos", "Solo los servicios",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué algoritmo se recomienda para hashear contraseñas?",
                            "MD5", "SHA-256", "BCrypt", "Base64",
                            2, "SEGURIDAD", "VERDE"),
                    new Quiz("¿Qué herramienta genera documentación de API automáticamente?",
                            "JavaDoc", "Swagger/OpenAPI", "Postman", "README.md",
                            1, "HERRAMIENTAS", "VERDE"),

                    // ══════════════════════════════════════════
                    // MARRÓN
                    // ══════════════════════════════════════════
                    new Quiz("¿Sobre qué está construido Spring Cloud Gateway?",
                            "Spring MVC", "Spring WebFlux", "Servlet API", "Netty directamente",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué proporciona Eureka?",
                            "Gestión de configuración", "Descubrimiento de servicios", "Balanceo de carga", "Circuit breaking",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué hace un Circuit Breaker cuando los fallos superan el umbral?",
                            "Reintenta inmediatamente", "Se abre y devuelve un fallback", "Reinicia el servicio", "Solo loguea y continúa",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Dónde almacena Spring Cloud Config la configuración?",
                            "Solo en sistema de archivos local", "Repositorio Git", "Base de datos", "Solo variables de entorno",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué significa el prefijo lb:// en rutas del gateway?",
                            "Local binding", "Load balanced", "Lazy binding", "Link bridge",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué es OpenFeign?",
                            "Un ORM", "Un cliente HTTP declarativo", "Un servidor web", "Un motor de plantillas",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué herramienta orquesta múltiples contenedores Docker?",
                            "Dockerfile", "Docker Compose", "Docker Hub", "Docker Swarm",
                            1, "MICROSERVICIOS", "MARRON"),
                    new Quiz("¿Qué visualiza Zipkin en una arquitectura de microservicios?",
                            "Métricas de CPU", "Trazas distribuidas", "Logs de errores", "Configuración",
                            1, "MICROSERVICIOS", "MARRON"),

                    // ══════════════════════════════════════════
                    // NEGRO
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué son Mono y Flux en Spring WebFlux?",
                            "Tipos de base de datos", "Tipos reactivos para 0-1 y 0-N elementos", "Pools de hilos", "Tipos de caché",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué endpoint de Actuator comprueba la salud de la app?",
                            "/status", "/health", "/check", "/ping",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Cuál es el beneficio de Docker multi-stage builds?",
                            "Runtime más rápido", "Imagen final más pequeña", "Mejor logging", "Más seguridad",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué usa Spring Kafka para enviar mensajes?",
                            "KafkaProducer", "KafkaTemplate", "MessageSender", "EventPublisher",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué proporciona GraalVM native image?",
                            "Builds más rápidos", "Arranque rápido y bajo consumo de memoria", "Mejor debugging", "Hot reload",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué gestiona Flyway?",
                            "Dependencias Maven", "Migraciones de base de datos", "Despliegues", "Tests",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué son los Testcontainers?",
                            "Tests de UI", "Contenedores Docker para tests de integración", "Mocks automáticos", "Tests de rendimiento",
                            1, "AVANZADO", "NEGRO"),
                    new Quiz("¿Qué separa la arquitectura hexagonal?",
                            "Frontend y backend", "Lógica de negocio de la infraestructura", "Tests y código", "Servicios y controllers",
                            1, "AVANZADO", "NEGRO"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (BLANCO)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué anotación marca un método como test en JUnit 5?",
                            "@Test", "@TestMethod", "@RunTest", "@JUnitTest",
                            0, "TESTING", "BLANCO"),
                    new Quiz("¿Qué método de JUnit verifica que dos valores son iguales?",
                            "assertSame()", "assertEquals()", "assertMatch()", "assertIs()",
                            1, "TESTING", "BLANCO"),
                    new Quiz("¿Qué hace el método assertThrows()?",
                            "Lanza una excepción", "Verifica que se lanza una excepción esperada", "Detiene el test", "Captura errores del sistema",
                            1, "TESTING", "BLANCO"),
                    new Quiz("¿Qué diferencia hay entre assertEquals y assertSame?",
                            "Son lo mismo", "assertEquals compara con equals(), assertSame compara referencias", "assertSame es más rápido", "assertEquals solo compara Strings",
                            1, "TESTING", "BLANCO"),
                    new Quiz("¿Qué hace assertTrue()?",
                            "Verifica que un valor es null", "Verifica que una condición es verdadera", "Verifica que no hay excepciones", "Crea un valor booleano",
                            1, "TESTING", "BLANCO"),
                    new Quiz("¿Qué paquete contiene las aserciones de JUnit 5?",
                            "org.junit.Assert", "org.junit.jupiter.api.Assertions", "org.testing.Assert", "junit.framework.Assert",
                            1, "TESTING", "BLANCO"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (AMARILLO)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué anotación se ejecuta ANTES de cada test en JUnit 5?",
                            "@Before", "@BeforeEach", "@Setup", "@Init",
                            1, "TESTING", "AMARILLO"),
                    new Quiz("¿Qué anotación se ejecuta DESPUÉS de cada test?",
                            "@After", "@AfterEach", "@Cleanup", "@TearDown",
                            1, "TESTING", "AMARILLO"),
                    new Quiz("¿Qué hace @BeforeAll en JUnit 5?",
                            "Ejecuta antes de cada test", "Ejecuta una vez antes de todos los tests de la clase", "Inicializa Spring", "Crea la base de datos",
                            1, "TESTING", "AMARILLO"),
                    new Quiz("¿Por qué un método @BeforeAll debe ser static?",
                            "Por rendimiento", "Porque se ejecuta antes de instanciar la clase de test", "Es una convención", "Para acceder a variables estáticas",
                            1, "TESTING", "AMARILLO"),
                    new Quiz("¿Qué hace @DisplayName en JUnit 5?",
                            "Renombra la clase", "Define un nombre descriptivo para el test", "Cambia el orden de ejecución", "Filtra los tests",
                            1, "TESTING", "AMARILLO"),
                    new Quiz("¿Qué hace @Disabled en un test de JUnit 5?",
                            "Lo elimina", "Lo desactiva temporalmente sin borrarlo", "Lo ejecuta al final", "Lo marca como fallido",
                            1, "TESTING", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (NARANJA)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué es un Mock en testing?",
                            "Un test real", "Un objeto simulado que imita el comportamiento de una dependencia", "Un tipo de base de datos", "Un framework de testing",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué anotación de Mockito crea un mock?",
                            "@Fake", "@Mock", "@Stub", "@Simulate",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué hace when(...).thenReturn(...) en Mockito?",
                            "Ejecuta el método real", "Define qué debe devolver un mock cuando se llama un método", "Lanza una excepción", "Verifica una llamada",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué hace @InjectMocks?",
                            "Crea un mock", "Inyecta los mocks en la clase bajo test", "Configura Spring", "Inicializa la base de datos",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué extensión activa Mockito en JUnit 5?",
                            "@RunWith(MockitoRunner.class)", "@ExtendWith(MockitoExtension.class)", "@EnableMockito", "@MockitoTest",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué hace verify() en Mockito?",
                            "Valida el resultado", "Comprueba que un método del mock fue llamado", "Verifica la conexión", "Ejecuta el test",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué hace when(...).thenThrow(...)?",
                            "Captura una excepción", "Hace que el mock lance una excepción al llamar ese método", "Detiene el test", "Ignora la excepción",
                            1, "TESTING", "NARANJA"),
                    new Quiz("¿Qué es any() en Mockito?",
                            "Un tipo de assert", "Un argument matcher que acepta cualquier valor", "Un tipo de mock", "Una anotación",
                            1, "TESTING", "NARANJA"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (VERDE)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué diferencia hay entre @Mock y @MockBean?",
                            "Son lo mismo", "@Mock es de Mockito puro, @MockBean reemplaza el bean en el contexto de Spring", "@MockBean es más rápido", "@Mock solo funciona con JUnit 4",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace @DataJpaTest?",
                            "Carga toda la app", "Carga solo la capa de persistencia para testear repositorios", "Testea controllers", "Testea servicios",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace MockMvc?",
                            "Crea mocks automáticos", "Permite testear controllers sin levantar un servidor HTTP real", "Genera datos de prueba", "Simula la base de datos",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué método de MockMvc simula una petición GET?",
                            "mockMvc.get()", "mockMvc.perform(get(...))", "mockMvc.request(GET)", "mockMvc.send(get(...))",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace andExpect(status().isOk()) en MockMvc?",
                            "Envía un 200", "Verifica que la respuesta tiene código HTTP 200", "Crea un endpoint", "Configura el servidor",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace @ParameterizedTest en JUnit 5?",
                            "Ejecuta tests en paralelo", "Ejecuta el mismo test con diferentes datos de entrada", "Parametriza la configuración", "Crea mocks dinámicos",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué fuente de datos usa @ValueSource en tests parametrizados?",
                            "Un archivo CSV", "Valores literales inline (strings, ints, etc.)", "Una base de datos", "Un archivo JSON",
                            1, "TESTING", "VERDE"),
                    new Quiz("¿Qué hace verify(mock, times(2)).metodo()?",
                            "Ejecuta el método 2 veces", "Verifica que el método fue llamado exactamente 2 veces", "Crea 2 mocks", "Reintenta 2 veces si falla",
                            1, "TESTING", "VERDE"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (MARRÓN)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué hace @Spy en Mockito?",
                            "Crea un mock completo", "Crea un wrapper parcial que usa la implementación real salvo lo que se override", "Espía las llamadas a la BD", "Monitoriza rendimiento",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace ArgumentCaptor en Mockito?",
                            "Crea argumentos aleatorios", "Captura los argumentos pasados a un método del mock para inspeccionarlos", "Valida tipos de argumentos", "Genera test data",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace @Nested en JUnit 5?",
                            "Ejecuta tests en paralelo", "Agrupa tests relacionados en clases internas", "Hereda tests de otra clase", "Desactiva tests",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace assertAll() en JUnit 5?",
                            "Ejecuta todos los tests", "Agrupa varias aserciones y reporta TODAS las que fallan", "Valida toda la clase", "Resetea los mocks",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace @CsvSource en tests parametrizados?",
                            "Lee un archivo CSV externo", "Provee múltiples conjuntos de parámetros inline en formato CSV", "Exporta resultados a CSV", "Conecta con una BD",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace doReturn(...).when(spy).metodo() vs when(spy.metodo()).thenReturn(...)?",
                            "Son idénticos", "doReturn no ejecuta el método real del spy, when sí lo ejecuta", "doReturn es más lento", "when es para mocks, doReturn para stubs",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué verifica verify(mock, never()).metodo()?",
                            "Que el método se llamó al menos una vez", "Que el método NUNCA fue llamado", "Que el mock es válido", "Que no hubo excepciones",
                            1, "TESTING", "MARRON"),
                    new Quiz("¿Qué hace @TestMethodOrder en JUnit 5?",
                            "Ejecuta tests en paralelo", "Define el orden de ejecución de los tests", "Prioriza tests fallidos", "Ordena alfabéticamente los resultados",
                            1, "TESTING", "MARRON"),

                    // ══════════════════════════════════════════
                    // TESTING - JUnit & Mockito (NEGRO)
                    // ══════════════════════════════════════════
                    new Quiz("¿Qué son los Testcontainers?",
                            "Mocks de Docker", "Contenedores Docker reales que se levantan durante los tests de integración", "Tests dentro de Docker", "Un plugin de Maven",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué hace @DynamicPropertySource con Testcontainers?",
                            "Crea propiedades aleatorias", "Inyecta propiedades dinámicas (como puertos) del contenedor al contexto de Spring", "Genera archivos de configuración", "Resetea propiedades",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué hace @AutoConfigureMockMvc?",
                            "Configura mocks de servicios", "Configura automáticamente MockMvc en tests con @SpringBootTest", "Crea controllers automáticos", "Desactiva seguridad en tests",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué estrategia de test usa @SpringBootTest con WebEnvironment.RANDOM_PORT?",
                            "Mock del servidor", "Levanta un servidor real en un puerto aleatorio", "No levanta servidor", "Usa el puerto 8080",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué hace @Timeout en JUnit 5?",
                            "Espera un tiempo antes de ejecutar", "Falla el test si supera el tiempo máximo indicado", "Pausa entre tests", "Configura reintentos",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué es el patrón AAA en testing?",
                            "Assert-Act-Arrange", "Arrange-Act-Assert (preparar, ejecutar, verificar)", "Always-Automate-Assert", "Add-Analyze-Apply",
                            1, "TESTING", "NEGRO"),
                    new Quiz("¿Qué hace BDDMockito.given(...).willReturn(...)?",
                            "Es un alias de when/thenReturn con estilo BDD (Given-When-Then)", "Define precondiciones de BD", "Crea mocks condicionales", "Configura el contexto de Spring",
                            0, "TESTING", "NEGRO"),
                    new Quiz("¿Qué hace @RepeatedTest(5) en JUnit 5?",
                            "Crea 5 instancias del test", "Ejecuta el mismo test 5 veces para detectar fallos intermitentes", "Espera 5 segundos", "Genera 5 reportes",
                            1, "TESTING", "NEGRO")
                ));
            }
        };
    }
}
