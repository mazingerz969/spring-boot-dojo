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
                        "AVANZADO", "NEGRO"),

                    // ══════════════════════════════════════════
                    // BLANCO - JAVA_CORE
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es un HashMap en Java?",
                        "HashMap es una estructura de datos que almacena pares clave-valor usando una tabla hash. Permite búsquedas, inserciones y eliminaciones en O(1) promedio. Las claves deben implementar hashCode() y equals(). No garantiza orden y permite una clave null.",
                        "JAVA_CORE", "BLANCO"),
                    new Flashcard(
                        "¿Diferencia entre ArrayList y array en Java?",
                        "Un array tiene tamaño fijo definido en su creación (int[] arr = new int[10]). ArrayList es dinámico: crece automáticamente al agregar elementos. ArrayList solo almacena objetos (no primitivos), mientras que los arrays admiten primitivos. ArrayList ofrece métodos útiles como add(), remove(), size().",
                        "JAVA_CORE", "BLANCO"),
                    new Flashcard(
                        "¿Diferencia entre equals() y == en Java?",
                        "== compara referencias de memoria: verifica si dos variables apuntan al mismo objeto. equals() compara el contenido lógico del objeto. Para String, == puede dar false aunque el texto sea idéntico si son objetos distintos. Siempre usa equals() para comparar Strings y objetos.",
                        "JAVA_CORE", "BLANCO"),
                    new Flashcard(
                        "¿Qué son las excepciones en Java?",
                        "Las excepciones son eventos que interrumpen el flujo normal del programa cuando ocurre un error. Java tiene una jerarquía: Throwable → Error (problemas graves de la JVM) y Exception (recuperables). RuntimeException y sus subclases son unchecked; las demás son checked y deben declararse o capturarse.",
                        "JAVA_CORE", "BLANCO"),
                    new Flashcard(
                        "¿Para qué sirve try-catch-finally en Java?",
                        "try contiene el código que puede lanzar una excepción. catch captura y maneja la excepción específica. finally siempre se ejecuta, haya o no excepción, ideal para cerrar recursos. Desde Java 7 existe try-with-resources que cierra automáticamente objetos que implementan AutoCloseable.",
                        "JAVA_CORE", "BLANCO"),

                    // ══════════════════════════════════════════
                    // BLANCO - LAMBDAS_STREAMS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es una lambda en Java?",
                        "Una lambda es una función anónima que puede tratarse como un valor. Sintaxis: (parámetros) -> expresión. Ejemplo: (x, y) -> x + y. Las lambdas implementan interfaces funcionales (con un solo método abstracto). Permiten escribir código más conciso especialmente con Streams y callbacks.",
                        "LAMBDAS_STREAMS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es una interfaz funcional en Java?",
                        "Una interfaz funcional tiene exactamente un método abstracto y se puede anotar con @FunctionalInterface. Son la base para usar lambdas. Java proporciona muchas: Predicate<T> (retorna boolean), Consumer<T> (acepta T, no retorna), Function<T,R> (acepta T, retorna R), Supplier<T> (no acepta, retorna T).",
                        "LAMBDAS_STREAMS", "BLANCO"),
                    new Flashcard(
                        "¿Cómo se usa Predicate y Consumer con lambdas?",
                        "Predicate<String> esMayorDe5 = s -> s.length() > 5; esMayorDe5.test(\"Hola\") retorna false. Consumer<String> imprimir = s -> System.out.println(s); imprimir.accept(\"Hola\") imprime el texto. Ambas son interfaces funcionales de java.util.function usadas frecuentemente con Streams.",
                        "LAMBDAS_STREAMS", "BLANCO"),

                    // ══════════════════════════════════════════
                    // BLANCO - GIT
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué hacen git add, git commit y git push?",
                        "git add <archivo> mueve cambios al área de staging (preparación). git commit -m \"mensaje\" guarda un snapshot permanente en el repositorio local. git push origin <rama> sube los commits al repositorio remoto (GitHub, GitLab). Es el flujo básico: modificar → add → commit → push.",
                        "GIT", "BLANCO"),
                    new Flashcard(
                        "¿Cómo funcionan las ramas en Git?",
                        "Una rama (branch) es un puntero a un commit que permite desarrollar en paralelo sin afectar main. git branch feature/login crea la rama. git checkout feature/login o git switch feature/login cambia a ella. git merge feature/login integra los cambios en la rama actual. git branch -d borra la rama.",
                        "GIT", "BLANCO"),
                    new Flashcard(
                        "¿Para qué sirve el archivo .gitignore?",
                        ".gitignore especifica qué archivos y directorios Git debe ignorar y no rastrear. Es esencial para excluir archivos compilados (target/, *.class), archivos de IDE (.idea/, .vscode/), secretos (.env, application-secrets.properties) y dependencias (node_modules/). Los patrones usan wildcards como * y **.",
                        "GIT", "BLANCO"),

                    // ══════════════════════════════════════════
                    // BLANCO - SQL_DB
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona SELECT en SQL?",
                        "SELECT recupera datos de una o más tablas. SELECT * FROM usuarios trae todas las columnas. SELECT nombre, email FROM usuarios trae solo esas columnas. Es la instrucción más usada en SQL y se puede combinar con WHERE, ORDER BY, LIMIT y otras cláusulas para filtrar y ordenar resultados.",
                        "SQL_DB", "BLANCO"),
                    new Flashcard(
                        "¿Cómo se usan WHERE y ORDER BY en SQL?",
                        "WHERE filtra filas según una condición: SELECT * FROM productos WHERE precio > 100. ORDER BY ordena resultados: ORDER BY nombre ASC (ascendente) o DESC (descendente). Se pueden combinar: SELECT * FROM productos WHERE activo = true ORDER BY precio DESC. WHERE va antes de ORDER BY.",
                        "SQL_DB", "BLANCO"),
                    new Flashcard(
                        "¿Cómo se insertan, actualizan y eliminan datos en SQL?",
                        "INSERT INTO usuarios (nombre, email) VALUES ('Ana', 'ana@mail.com') inserta un nuevo registro. UPDATE usuarios SET email = 'nuevo@mail.com' WHERE id = 1 modifica un registro existente (¡siempre usa WHERE!). DELETE FROM usuarios WHERE id = 1 elimina el registro. Sin WHERE en UPDATE/DELETE afectas todos los registros.",
                        "SQL_DB", "BLANCO"),

                    // ══════════════════════════════════════════
                    // AMARILLO - JAVA_CORE
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Diferencia entre HashMap y TreeMap?",
                        "HashMap usa tabla hash: O(1) para get/put pero no garantiza orden. TreeMap usa árbol rojo-negro: O(log n) para operaciones pero mantiene las claves ordenadas naturalmente o por Comparator. Usa HashMap cuando no necesitas orden (rendimiento máximo) y TreeMap cuando necesitas iterar las claves en orden.",
                        "JAVA_CORE", "AMARILLO"),
                    new Flashcard(
                        "¿Diferencia entre excepciones checked y unchecked?",
                        "Checked exceptions heredan de Exception (no de RuntimeException) y el compilador obliga a manejarlas con try-catch o declarar throws. Ejemplos: IOException, SQLException. Unchecked heredan de RuntimeException y son opcionales de manejar. Ejemplos: NullPointerException, IllegalArgumentException. Las unchecked indican errores de programación.",
                        "JAVA_CORE", "AMARILLO"),
                    new Flashcard(
                        "¿Por qué String es inmutable en Java?",
                        "String es inmutable porque una vez creado su valor no puede cambiar. Esto permite el String Pool: la JVM reutiliza literales String en memoria. Ventajas: thread-safe por naturaleza, seguro como clave en HashMap, cacheable. Si necesitas modificaciones frecuentes usa StringBuilder (no thread-safe) o StringBuffer (thread-safe).",
                        "JAVA_CORE", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es el autoboxing en Java?",
                        "Autoboxing es la conversión automática entre primitivos y sus clases wrapper: int ↔ Integer, double ↔ Double, boolean ↔ Boolean. Java lo hace automáticamente al asignar o pasar parámetros. Unboxing es el proceso inverso. Cuidado: puede lanzar NullPointerException si el wrapper es null al hacer unboxing.",
                        "JAVA_CORE", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // AMARILLO - LAMBDAS_STREAMS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo se usan Stream.filter(), map() y collect()?",
                        "filter() selecciona elementos que cumplen un Predicate. map() transforma cada elemento. collect() materializa el stream en una colección. Ejemplo: List<String> nombres = personas.stream().filter(p -> p.getEdad() > 18).map(Persona::getNombre).collect(Collectors.toList()). Los streams son lazy: solo procesan al llamar la operación terminal.",
                        "LAMBDAS_STREAMS", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es Optional en Java y para qué sirve?",
                        "Optional<T> es un contenedor que puede o no tener un valor, diseñado para evitar NullPointerException. Optional.of(valor) crea uno con valor, Optional.empty() sin valor, Optional.ofNullable(valor) acepta null. Métodos clave: isPresent(), get(), orElse(default), orElseThrow(), ifPresent(consumer), map().",
                        "LAMBDAS_STREAMS", "AMARILLO"),
                    new Flashcard(
                        "¿Qué son las referencias a métodos en Java?",
                        "Las referencias a métodos son una forma más concisa de lambdas cuando esta solo llama a un método existente. Tipos: Clase::métodoEstático (Integer::parseInt), instancia::método (System.out::println), Clase::métodoInstancia (String::toUpperCase), Clase::new para constructores. Son equivalentes a lambdas pero más legibles.",
                        "LAMBDAS_STREAMS", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // AMARILLO - SQL_DB
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Diferencia entre INNER JOIN y LEFT JOIN?",
                        "INNER JOIN retorna solo las filas que tienen coincidencia en ambas tablas. LEFT JOIN retorna todas las filas de la tabla izquierda y las coincidencias de la derecha (NULL si no hay). Ejemplo: SELECT u.nombre, p.titulo FROM usuarios u LEFT JOIN posts p ON u.id = p.usuario_id retorna todos los usuarios aunque no tengan posts.",
                        "SQL_DB", "AMARILLO"),
                    new Flashcard(
                        "¿Para qué sirve GROUP BY en SQL?",
                        "GROUP BY agrupa filas con el mismo valor en una columna para aplicar funciones de agregación. SELECT categoria, COUNT(*) as total, AVG(precio) as promedio FROM productos GROUP BY categoria agrupa productos por categoría y calcula conteo y precio promedio. HAVING filtra grupos (como WHERE pero para grupos): HAVING COUNT(*) > 5.",
                        "SQL_DB", "AMARILLO"),
                    new Flashcard(
                        "¿Qué son los índices en bases de datos?",
                        "Un índice es una estructura de datos (B-tree normalmente) que acelera las búsquedas en una columna a costa de espacio y tiempo de escritura. CREATE INDEX idx_email ON usuarios(email) acelera WHERE email = '...'. Las claves primarias y únicas tienen índices automáticos. Demasiados índices ralentizan INSERT/UPDATE/DELETE.",
                        "SQL_DB", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // AMARILLO - PATRONES_DISENO
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es un patrón de diseño?",
                        "Un patrón de diseño es una solución reutilizable a un problema recurrente en el diseño de software. Los patrones del libro GoF se clasifican en creacionales (cómo crear objetos), estructurales (cómo componer objetos) y de comportamiento (cómo interactúan). No son código copy-paste sino guías conceptuales adaptables.",
                        "PATRONES_DISENO", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es el patrón Singleton?",
                        "Singleton garantiza que una clase tenga solo una instancia y provee un punto de acceso global. Implementación: constructor privado, campo estático con la instancia, método getInstance() que crea la instancia solo si es null. En Spring, todos los beans son Singleton por defecto, manejados por el contenedor IoC.",
                        "PATRONES_DISENO", "AMARILLO"),
                    new Flashcard(
                        "¿Qué es el patrón Factory?",
                        "Factory Method define una interfaz para crear objetos pero deja que las subclases decidan qué clase instanciar. Desacopla la creación de objetos de su uso. Ejemplo: una NotificationFactory que según el tipo retorna EmailNotification, SMSNotification o PushNotification. Facilita agregar nuevos tipos sin modificar el código cliente.",
                        "PATRONES_DISENO", "AMARILLO"),

                    // ══════════════════════════════════════════
                    // NARANJA - SPRING_CORE
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Para qué sirven @Qualifier y @Primary en Spring?",
                        "@Primary marca un bean como preferido cuando hay múltiples candidatos del mismo tipo. @Qualifier(\"nombreBean\") especifica exactamente qué bean inyectar. Si tienes dos implementaciones de PaymentService (CreditCardService y PaypalService), @Primary en una evita ambigüedad, o @Qualifier en el punto de inyección selecciona explícitamente.",
                        "SPRING_CORE", "NARANJA"),
                    new Flashcard(
                        "¿Cuál es el ciclo de vida de un bean en Spring?",
                        "Spring instancia el bean → inyecta dependencias → llama @PostConstruct (inicialización personalizada) → el bean está listo para usar → al cerrar el contexto llama @PreDestroy (limpieza). También puedes implementar InitializingBean/DisposableBean o usar init-method/destroy-method en @Bean. @PostConstruct es la forma más común y limpia.",
                        "SPRING_CORE", "NARANJA"),
                    new Flashcard(
                        "¿Qué son los perfiles en Spring y cómo se usan?",
                        "Los perfiles (profiles) permiten tener configuraciones diferentes según el entorno. @Profile(\"dev\") en una clase o bean solo lo activa en el perfil dev. Se activan con spring.profiles.active=dev en properties o variable de entorno. Muy útil para tener bases de datos H2 en dev y PostgreSQL en prod.",
                        "SPRING_CORE", "NARANJA"),
                    new Flashcard(
                        "¿Qué es @Conditional en Spring?",
                        "@Conditional crea beans condicionalmente según una Condition personalizada. Spring Boot lo usa extensamente internamente: @ConditionalOnClass (solo si una clase existe en classpath), @ConditionalOnMissingBean (solo si no hay otro bean del tipo), @ConditionalOnProperty (según valor de propiedad). Son la base de la auto-configuración.",
                        "SPRING_CORE", "NARANJA"),

                    // ══════════════════════════════════════════
                    // NARANJA - SPRING_BOOT
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es @ConfigurationProperties en Spring Boot?",
                        "@ConfigurationProperties enlaza grupos de propiedades del application.properties a un objeto Java. @ConfigurationProperties(prefix = \"app.mail\") en una clase con campos host, port, username los enlaza automáticamente con app.mail.host, app.mail.port. Más limpio que múltiples @Value. Soporta validación con @Validated.",
                        "SPRING_BOOT", "NARANJA"),
                    new Flashcard(
                        "¿Qué son los starters de Spring Boot?",
                        "Los starters son dependencias predefinidas que agrupan todo lo necesario para una funcionalidad. spring-boot-starter-web incluye Spring MVC, Tomcat embebido y Jackson. spring-boot-starter-data-jpa incluye Hibernate, Spring Data y JDBC. Eliminan la necesidad de gestionar versiones compatibles manualmente.",
                        "SPRING_BOOT", "NARANJA"),
                    new Flashcard(
                        "¿Cómo funciona la auto-configuración de Spring Boot?",
                        "Spring Boot escanea el classpath y configura automáticamente componentes según las dependencias presentes. Si detecta H2 en classpath, configura un DataSource en memoria automáticamente. Esto ocurre porque @EnableAutoConfiguration (incluida en @SpringBootApplication) carga las clases listadas en META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports.",
                        "SPRING_BOOT", "NARANJA"),

                    // ══════════════════════════════════════════
                    // NARANJA - JAVA_CORE
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Diferencia entre Comparable y Comparator?",
                        "Comparable define el orden natural de una clase implementando compareTo() en la propia clase. Comparator es externo: define criterios de ordenación alternativos sin modificar la clase. Collections.sort(lista) usa Comparable. Collections.sort(lista, comparator) usa Comparator. Comparator.comparing(Persona::getEdad) crea un Comparator usando lambdas.",
                        "JAVA_CORE", "NARANJA"),
                    new Flashcard(
                        "¿Qué son los genéricos en Java?",
                        "Los genéricos permiten escribir código que funciona con cualquier tipo manteniendo type-safety en tiempo de compilación. List<String> garantiza que solo contiene Strings. <T> en una clase o método es un parámetro de tipo. Bounded wildcards: <T extends Number> limita a subclases de Number. Los genéricos usan type erasure en runtime.",
                        "JAVA_CORE", "NARANJA"),
                    new Flashcard(
                        "¿Qué es ConcurrentHashMap y cuándo usarlo?",
                        "ConcurrentHashMap es una versión thread-safe de HashMap optimizada para concurrencia. A diferencia de Hashtable (que sincroniza todo el mapa), ConcurrentHashMap divide el mapa en segmentos y solo bloquea el segmento afectado, permitiendo lecturas y escrituras concurrentes con alta eficiencia. Úsalo en entornos multi-hilo.",
                        "JAVA_CORE", "NARANJA"),

                    // ══════════════════════════════════════════
                    // NARANJA - SQL_DB
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué son las subconsultas en SQL?",
                        "Una subconsulta es una SELECT anidada dentro de otra consulta. SELECT nombre FROM usuarios WHERE id IN (SELECT usuario_id FROM pedidos WHERE total > 1000) obtiene usuarios con pedidos grandes. Pueden ir en WHERE, FROM (subquery como tabla) o SELECT (columna calculada). Correlacionadas referencian la query externa y se ejecutan por cada fila.",
                        "SQL_DB", "NARANJA"),
                    new Flashcard(
                        "¿Qué significan las propiedades ACID en bases de datos?",
                        "ACID garantiza la fiabilidad de las transacciones. Atomicidad: todo o nada, si falla cualquier parte se revierte todo. Consistencia: la BD pasa de un estado válido a otro válido. Isolation: transacciones concurrentes no se interfieren. Durabilidad: los cambios confirmados persisten aunque caiga el sistema.",
                        "SQL_DB", "NARANJA"),
                    new Flashcard(
                        "¿Qué es la normalización en bases de datos?",
                        "La normalización organiza tablas para reducir redundancia y dependencias. 1NF: elimina grupos repetidos, cada celda tiene un valor atómico. 2NF: elimina dependencias parciales (todo campo depende de toda la PK). 3NF: elimina dependencias transitivas (campos no clave no dependen de otros no clave). Más allá de 3NF es raro en práctica.",
                        "SQL_DB", "NARANJA"),

                    // ══════════════════════════════════════════
                    // VERDE - SPRING_DATA_JPA
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo se usa @Query con JPQL en Spring Data JPA?",
                        "@Query(\"SELECT u FROM Usuario u WHERE u.email = :email\") permite escribir consultas JPQL personalizadas. JPQL usa nombres de clases y campos Java (no tablas SQL). Con nativeQuery = true puedes usar SQL puro. Los parámetros se inyectan con @Param(\"email\") o posicionalmente con ?1. Útil para consultas complejas que el método naming no puede expresar.",
                        "SPRING_DATA_JPA", "VERDE"),
                    new Flashcard(
                        "¿Qué es la propagación de transacciones en @Transactional?",
                        "La propagación define cómo se comporta una transacción cuando se llama desde otra. REQUIRED (default): usa la existente o crea una nueva. REQUIRES_NEW: siempre crea una nueva, suspendiendo la existente. NESTED: crea un savepoint dentro de la existente. SUPPORTS: usa la existente si hay, sino sin transacción. Importante para diseñar correctamente el comportamiento transaccional.",
                        "SPRING_DATA_JPA", "VERDE"),
                    new Flashcard(
                        "¿Qué es la Specification API en Spring Data JPA?",
                        "Specification es una interfaz que encapsula una cláusula WHERE como objeto, basada en el patrón Specification de DDD. Permite construir consultas dinámicas y combinarlas: specs.and(otherSpec), specs.or(otherSpec). El repositorio debe extender JpaSpecificationExecutor<T>. Ideal para filtros de búsqueda con múltiples criterios opcionales.",
                        "SPRING_DATA_JPA", "VERDE"),
                    new Flashcard(
                        "¿Cómo funciona la auditoría en Spring Data JPA?",
                        "Spring Data JPA puede auto-rellenar campos de auditoría. Anota la entidad con @EntityListeners(AuditingEntityListener.class) y usa @CreatedDate, @LastModifiedDate, @CreatedBy, @LastModifiedBy en los campos. Habilita con @EnableJpaAuditing en la configuración. Para @CreatedBy necesitas implementar AuditorAware<T> que retorna el usuario actual.",
                        "SPRING_DATA_JPA", "VERDE"),

                    // ══════════════════════════════════════════
                    // VERDE - SPRING_SECURITY
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona el flujo JWT en detalle?",
                        "1) Usuario envía credenciales al endpoint /auth/login. 2) Server valida y genera JWT firmado con clave secreta (header.payload.signature en base64). 3) Cliente guarda el token y lo envía en cada request como Authorization: Bearer <token>. 4) Filtro JwtAuthenticationFilter extrae y valida el token, carga el usuario y lo pone en SecurityContext. El token expira según exp claim.",
                        "SPRING_SECURITY", "VERDE"),
                    new Flashcard(
                        "¿Cómo funciona @PreAuthorize en Spring Security?",
                        "@PreAuthorize evalúa una expresión SpEL antes de ejecutar el método. @PreAuthorize(\"hasRole('ADMIN')\") solo permite admins. @PreAuthorize(\"hasAuthority('READ_USERS')\") requiere permiso específico. @PreAuthorize(\"#id == authentication.principal.id\") permite acceso solo al propio usuario. Requiere @EnableMethodSecurity en la configuración.",
                        "SPRING_SECURITY", "VERDE"),
                    new Flashcard(
                        "¿Qué es OAuth2 y cómo se relaciona con Spring Security?",
                        "OAuth2 es un protocolo de autorización que permite a aplicaciones acceder a recursos en nombre del usuario sin compartir credenciales. Flujos principales: Authorization Code (web apps), Client Credentials (server-to-server). Spring Security OAuth2 simplifica implementar login con Google/GitHub (@EnableOAuth2Sso) o proteger APIs como Resource Server.",
                        "SPRING_SECURITY", "VERDE"),
                    new Flashcard(
                        "¿Qué es CSRF y cómo lo maneja Spring Security?",
                        "CSRF (Cross-Site Request Forgery) es un ataque donde un sitio malicioso hace peticiones en nombre del usuario autenticado. Spring Security incluye protección CSRF por defecto para formularios HTML usando tokens sincronizados. Para APIs REST stateless normalmente se deshabilita (http.csrf().disable()) porque usan JWT que ya protege contra CSRF.",
                        "SPRING_SECURITY", "VERDE"),

                    // ══════════════════════════════════════════
                    // VERDE - LAMBDAS_STREAMS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo se usa Collectors.groupingBy?",
                        "Collectors.groupingBy agrupa elementos de un stream en un Map según una función clasificadora. personas.stream().collect(Collectors.groupingBy(Persona::getDepartamento)) retorna Map<String, List<Persona>>. Se puede combinar con un downstream collector: groupingBy(Persona::getDept, Collectors.counting()) cuenta personas por departamento.",
                        "LAMBDAS_STREAMS", "VERDE"),
                    new Flashcard(
                        "¿Cómo funciona reduce() en Streams?",
                        "reduce() combina los elementos de un stream en un único resultado aplicando una función acumuladora. stream.reduce(0, (acc, x) -> acc + x) suma todos los elementos. También: reduce(identity, BinaryOperator). Para Optional sin identidad: reduce(BinaryOperator). Es la operación base de muchos Collectors. Suma, producto, concatenación son casos comunes.",
                        "LAMBDAS_STREAMS", "VERDE"),
                    new Flashcard(
                        "¿Para qué sirve flatMap() en Streams?",
                        "flatMap() aplana streams anidados. Si tienes List<List<String>>, stream().flatMap(Collection::stream) produce un Stream<String> plano. Útil cuando map() retornaría Stream<Stream<T>>. Ejemplo: orders.stream().flatMap(order -> order.getItems().stream()) obtiene todos los items de todas las órdenes en un único stream.",
                        "LAMBDAS_STREAMS", "VERDE"),
                    new Flashcard(
                        "¿Qué son los parallel streams y cuándo usarlos?",
                        "parallelStream() divide el stream en sub-streams procesados en paralelo usando ForkJoinPool. Útil para operaciones CPU-intensivas sobre colecciones grandes. Cuidado: el overhead de gestión de hilos puede hacerlo más lento para colecciones pequeñas. Nunca uses parallel streams con operaciones con estado compartido sin sincronización. Mide antes de optimizar.",
                        "LAMBDAS_STREAMS", "VERDE"),

                    // ══════════════════════════════════════════
                    // VERDE - PATRONES_DISENO
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es el patrón Strategy?",
                        "Strategy define una familia de algoritmos intercambiables en tiempo de ejecución. Una interfaz Strategy con el método ejecutar(), múltiples implementaciones concretas, y el contexto que delega a la estrategia actual. Ejemplo: un procesador de pagos con estrategias CreditCard, PayPal, Crypto. Elimina condicionales if-else para seleccionar comportamiento.",
                        "PATRONES_DISENO", "VERDE"),
                    new Flashcard(
                        "¿Qué es el patrón Observer?",
                        "Observer define una relación uno-a-muchos donde cuando un objeto (Subject) cambia estado, todos sus dependientes (Observers) son notificados automáticamente. El Subject mantiene una lista de Observers y los notifica en cada cambio. En Java: java.util.Observable (legacy), EventListener. Spring usa ApplicationEvent/ApplicationListener para eventos del contexto.",
                        "PATRONES_DISENO", "VERDE"),
                    new Flashcard(
                        "¿Qué es el patrón Builder?",
                        "Builder separa la construcción de un objeto complejo de su representación. Útil cuando un constructor tiene muchos parámetros opcionales. Ejemplo: Person.builder().nombre(\"Ana\").edad(30).email(\"ana@mail.com\").build(). Lombok @Builder genera el builder automáticamente. Evita el problema del \"telescoping constructor\" con múltiples sobrecargas.",
                        "PATRONES_DISENO", "VERDE"),
                    new Flashcard(
                        "¿Qué es el patrón Adapter?",
                        "Adapter convierte la interfaz de una clase en otra interfaz que el cliente espera. Permite que clases incompatibles trabajen juntas. Ejemplo: tienes una biblioteca externa con métoodoViejo() pero tu código espera metodoNuevo(); el Adapter implementa la interfaz esperada y delega al código externo. Muy usado al integrar sistemas legacy.",
                        "PATRONES_DISENO", "VERDE"),

                    // ══════════════════════════════════════════
                    // AZUL - SPRING_CORE (AOP)
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es AOP (Programación Orientada a Aspectos) en Spring?",
                        "AOP permite separar concerns transversales (logging, seguridad, transacciones) del código de negocio. Un Aspect agrupa advice (código a ejecutar) aplicado en Joinpoints (métodos). Pointcut define qué métodos son afectados. Spring AOP usa proxies en runtime. @Aspect + @Component define un aspecto. Ejemplo: @Around para medir tiempos de ejecución.",
                        "SPRING_CORE", "AZUL"),
                    new Flashcard(
                        "¿Qué tipos de advice existen en Spring AOP?",
                        "@Before ejecuta antes del método. @After ejecuta siempre después (haya o no excepción). @AfterReturning ejecuta solo si el método retorna exitosamente. @AfterThrowing ejecuta solo si lanza excepción. @Around es el más potente: envuelve completamente el método, puede modificar argumentos, resultado o prevenir la ejecución con ProceedingJoinPoint.",
                        "SPRING_CORE", "AZUL"),
                    new Flashcard(
                        "¿Diferencia entre proxy JDK y proxy CGLIB en Spring?",
                        "Spring AOP crea proxies para implementar aspectos. JDK proxy requiere que la clase implemente una interfaz y crea un proxy de esa interfaz. CGLIB genera una subclase de la clase objetivo y no requiere interfaz. Spring Boot usa CGLIB por defecto. Limitación de CGLIB: no puede proxear métodos final ni clases final. Si llamas un método desde el mismo bean el proxy se omite (self-invocation problem).",
                        "SPRING_CORE", "AZUL"),

                    // ══════════════════════════════════════════
                    // AZUL - SPRING_DATA_JPA
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es el optimistic locking con @Version en JPA?",
                        "@Version en un campo Long/Integer añade control de concurrencia optimista. JPA incluye WHERE version = N en los UPDATE y lo incrementa. Si dos transacciones leen la misma entidad y ambas intentan actualizar, la segunda lanza OptimisticLockException porque la versión ya cambió. Más eficiente que locks pesimistas para conflictos raros.",
                        "SPRING_DATA_JPA", "AZUL"),
                    new Flashcard(
                        "¿Cómo se resuelve el problema N+1 en JPA?",
                        "N+1 ocurre cuando cargas N entidades y JPA hace 1 query adicional por cada una para cargar sus relaciones lazy. Soluciones: @EntityGraph especifica qué relaciones cargar en un fetch específico. @BatchSize(size=20) carga relaciones en batches. JOIN FETCH en JPQL. @NamedEntityGraph para reutilizar. FetchType.EAGER es tentador pero crea otros problemas.",
                        "SPRING_DATA_JPA", "AZUL"),
                    new Flashcard(
                        "¿Qué son las proyecciones en Spring Data JPA?",
                        "Las proyecciones permiten retornar solo un subconjunto de campos en lugar de toda la entidad. Interface-based: una interfaz con getters para los campos deseados (Spring genera la implementación). Class-based (DTO): un DTO con constructor. Dynamic: retornar el tipo depende del parámetro genérico. Mejoran rendimiento evitando cargar campos innecesarios.",
                        "SPRING_DATA_JPA", "AZUL"),

                    // ══════════════════════════════════════════
                    // AZUL - JAVA_CORE
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es CompletableFuture en Java?",
                        "CompletableFuture permite programación asíncrona y no bloqueante. CompletableFuture.supplyAsync(() -> fetchData()) ejecuta en otro hilo. .thenApply(data -> transform(data)) encadena transformaciones. .thenCombine() combina dos futuros. .exceptionally() maneja errores. Mejor que Future porque no bloquea con get() y permite composición funcional de operaciones async.",
                        "JAVA_CORE", "AZUL"),
                    new Flashcard(
                        "¿Diferencia entre volatile y synchronized en Java?",
                        "volatile garantiza visibilidad: todos los hilos ven el último valor escrito, sin cache en registros. No garantiza atomicidad. synchronized garantiza tanto visibilidad como atomicidad: solo un hilo a la vez ejecuta el bloque y los cambios son visibles al salir. volatile es más ligero, útil para flags simples. synchronized para operaciones compuestas como check-then-act.",
                        "JAVA_CORE", "AZUL"),
                    new Flashcard(
                        "¿Qué es un ThreadPool y por qué usarlo?",
                        "Un ThreadPool reutiliza un conjunto fijo de hilos en lugar de crear uno nuevo por cada tarea. Evita el overhead de crear/destruir hilos y limita el consumo de recursos. Executors.newFixedThreadPool(10) crea un pool de 10 hilos. newCachedThreadPool() crece según demanda. newSingleThreadExecutor() garantiza ejecución secuencial. Spring usa ThreadPool para @Async.",
                        "JAVA_CORE", "AZUL"),
                    new Flashcard(
                        "¿Qué es el problema del diamante en Java?",
                        "El problema del diamante surge cuando una clase hereda de dos fuentes que tienen el mismo método. Java no permite herencia múltiple de clases para evitarlo. Con interfaces Java 8+ (default methods) puede ocurrir: si dos interfaces tienen el mismo default method, la clase que las implementa debe sobrescribirlo para resolver la ambigüedad, o el compilador falla.",
                        "JAVA_CORE", "AZUL"),

                    // ══════════════════════════════════════════
                    // AZUL - DOCKER_DEVOPS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es un Dockerfile multi-stage build?",
                        "Multi-stage build usa múltiples FROM en un Dockerfile para separar etapas. La primera etapa compila (FROM maven:3.9 AS builder → mvn package). La segunda etapa usa solo el JAR resultante (FROM eclipse-temurin:17-jre → COPY --from=builder). La imagen final es mínima: no incluye Maven, código fuente ni dependencias de compilación.",
                        "DOCKER_DEVOPS", "AZUL"),
                    new Flashcard(
                        "¿Cómo funcionan las redes en Docker Compose?",
                        "Docker Compose crea automáticamente una red bridge para todos los servicios del mismo docker-compose.yml. Los servicios se comunican usando el nombre del servicio como hostname: el servicio app puede llamar a http://db:5432 donde db es el nombre del servicio PostgreSQL. Puedes crear redes personalizadas para aislar grupos de servicios o habilitar comunicación entre compose files.",
                        "DOCKER_DEVOPS", "AZUL"),
                    new Flashcard(
                        "¿Qué etapas tiene un pipeline CI/CD típico?",
                        "Pipeline típico: 1) Checkout del código. 2) Build (compilar, resolver dependencias). 3) Test unitarios e integración. 4) Análisis estático (SonarQube, checkstyle). 5) Build imagen Docker. 6) Push al registry. 7) Deploy a staging. 8) Tests de smoke/e2e. 9) Aprobación manual (opcional). 10) Deploy a producción. Cada etapa falla rápido si hay problemas.",
                        "DOCKER_DEVOPS", "AZUL"),

                    // ══════════════════════════════════════════
                    // MARRON - MICROSERVICIOS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona el patrón Saga en microservicios?",
                        "Saga gestiona transacciones distribuidas como secuencia de transacciones locales. Coreografía: cada servicio publica eventos y reacciona a eventos de otros (descentralizado). Orquestación: un orquestador central dirige el flujo. Si un paso falla, se ejecutan transacciones compensatorias para deshacer los pasos anteriores. Eventualmente consistente, no ACID.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Qué es la arquitectura event-driven en microservicios?",
                        "En arquitectura event-driven los servicios se comunican publicando y consumiendo eventos asincrónicos (Kafka, RabbitMQ). El productor publica un evento y no espera respuesta. Los consumidores reaccionan de forma independiente. Ventajas: desacoplamiento temporal, resiliencia, escalabilidad. Desventajas: debugging complejo, consistencia eventual, necesidad de idempotencia.",
                        "MICROSERVICIOS", "MARRON"),
                    new Flashcard(
                        "¿Cómo manejar transacciones distribuidas en microservicios?",
                        "Las transacciones ACID distribuidas (2PC) crean acoplamiento y son difíciles de escalar. Alternativas: Saga (compensaciones), Outbox Pattern (guardar evento en misma BD que los datos antes de publicar), Event Sourcing (el estado como secuencia de eventos). La clave es diseñar operaciones idempotentes y aceptar consistencia eventual.",
                        "MICROSERVICIOS", "MARRON"),

                    // ══════════════════════════════════════════
                    // MARRON - PATRONES_DISENO
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué es el patrón Decorator?",
                        "Decorator añade responsabilidades a un objeto dinámicamente sin modificar su clase, usando composición en lugar de herencia. Envuelve el objeto original implementando la misma interfaz y delegando más comportamiento. Ejemplo clásico: java.io.BufferedReader envuelve FileReader añadiendo buffering. Permite combinar comportamientos de forma flexible.",
                        "PATRONES_DISENO", "MARRON"),
                    new Flashcard(
                        "¿Qué es el patrón Template Method?",
                        "Template Method define el esqueleto de un algoritmo en una clase base, dejando algunos pasos para que las subclases los implementen. La clase base tiene el método template con el flujo general y métodos abstractos (hooks) que las subclases concretan. Ejemplo: proceso de exportación con pasos fijos pero formatos diferentes (CSV, PDF, Excel).",
                        "PATRONES_DISENO", "MARRON"),
                    new Flashcard(
                        "¿Qué es el patrón Proxy?",
                        "Proxy proporciona un sustituto que controla el acceso al objeto real. Tipos: Virtual Proxy (carga lazy del objeto costoso), Protection Proxy (control de acceso), Remote Proxy (representa objeto en otro proceso/servidor), Caching Proxy (cachea resultados). Spring AOP usa proxies extensamente para @Transactional, @Cacheable, aspectos. JDK Proxy y CGLIB son las implementaciones.",
                        "PATRONES_DISENO", "MARRON"),
                    new Flashcard(
                        "¿Cuáles son los principios SOLID y por qué importan?",
                        "S: Single Responsibility (una clase, una razón para cambiar). O: Open/Closed (abierto para extensión, cerrado para modificación). L: Liskov Substitution (las subclases deben sustituir a sus padres). I: Interface Segregation (interfaces específicas mejor que una general). D: Dependency Inversion (depender de abstracciones, no implementaciones). SOLID produce código mantenible, testeable y extensible.",
                        "PATRONES_DISENO", "MARRON"),

                    // ══════════════════════════════════════════
                    // MARRON - DOCKER_DEVOPS
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona GitHub Actions para CI/CD?",
                        "GitHub Actions define workflows en .github/workflows/*.yml. Un workflow tiene triggers (on: push, pull_request), jobs que corren en runners (ubuntu-latest) y steps (actions/checkout, setup-java, mvn test). Jobs pueden ser paralelos o secuenciales (needs: build). Secrets se almacenan en Settings → Secrets y se acceden como ${{ secrets.DOCKER_PASSWORD }}.",
                        "DOCKER_DEVOPS", "MARRON"),
                    new Flashcard(
                        "¿Qué es Kubernetes y cuáles son sus conceptos básicos?",
                        "Kubernetes (K8s) orquesta contenedores en producción. Pod: unidad mínima, uno o más contenedores. Deployment: gestiona réplicas y rolling updates. Service: expone pods con IP estable y load balancing. ConfigMap/Secret: configuración externa. Namespace: aislamiento lógico. kubectl apply -f deployment.yaml despliega. K8s maneja auto-healing, scaling y rolling deployments.",
                        "DOCKER_DEVOPS", "MARRON"),
                    new Flashcard(
                        "¿Qué es la orquestación de contenedores?",
                        "La orquestación gestiona el ciclo de vida de contenedores a escala: scheduling (en qué nodo corre cada contenedor), scaling (ajustar réplicas según carga), networking (comunicación entre servicios), storage (volúmenes persistentes), self-healing (reiniciar contenedores fallidos). Kubernetes es el estándar. Docker Swarm es más simple. AWS ECS/EKS son opciones gestionadas.",
                        "DOCKER_DEVOPS", "MARRON"),

                    // ══════════════════════════════════════════
                    // MARRON - GIT
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Diferencia entre git rebase y git merge?",
                        "merge crea un commit de fusión que preserva el historial completo de ambas ramas. rebase re-aplica los commits de tu rama sobre la rama destino, creando un historial lineal más limpio. Nunca hagas rebase de ramas públicas/compartidas (reescribe historial). Merge es más seguro, rebase produce historial más legible. Rebase interactivo (rebase -i) permite limpiar commits antes de merge.",
                        "GIT", "MARRON"),
                    new Flashcard(
                        "¿Qué es git cherry-pick?",
                        "cherry-pick aplica los cambios de un commit específico en la rama actual, sin fusionar toda la rama. git cherry-pick abc123 crea un nuevo commit con los mismos cambios. Útil para llevar un hotfix de main a una rama de release, o para rescatar un commit específico de una rama experimental. Puede generar conflictos si el contexto es diferente.",
                        "GIT", "MARRON"),
                    new Flashcard(
                        "¿Qué es GitFlow y cuándo usarlo?",
                        "GitFlow es un modelo de branching con ramas: main (producción), develop (integración), feature/* (nuevas funcionalidades), release/* (preparación de versión), hotfix/* (correcciones urgentes). Adecuado para proyectos con releases versionadas. Para desarrollo continuo (CD), trunk-based development (todos trabajan en main con feature flags) es más ágil.",
                        "GIT", "MARRON"),
                    new Flashcard(
                        "¿Cómo resolver conflictos en Git?",
                        "Un conflicto ocurre cuando dos ramas modifican la misma parte de un archivo. Git marca las zonas en conflicto con <<<<<<, ======= y >>>>>>. Debes editar manualmente eligiendo qué cambios conservar, luego git add el archivo y git commit para completar el merge. Herramientas como VS Code, IntelliJ o git mergetool facilitan la resolución visual.",
                        "GIT", "MARRON"),

                    // ══════════════════════════════════════════
                    // MARRON - SQL_DB
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué son las window functions en SQL?",
                        "Las window functions calculan valores sobre un conjunto de filas relacionadas con la actual, sin colapsar filas como GROUP BY. ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) numera empleados por departamento. RANK(), DENSE_RANK() para rankings. LAG()/LEAD() para valores de filas anteriores/siguientes. SUM() OVER () para totales acumulados.",
                        "SQL_DB", "MARRON"),
                    new Flashcard(
                        "¿Qué son los niveles de aislamiento de transacciones?",
                        "READ UNCOMMITTED: lee datos no confirmados (dirty reads). READ COMMITTED (default PostgreSQL): solo lee datos confirmados. REPEATABLE READ: garantiza que releer la misma fila da el mismo resultado. SERIALIZABLE: máximo aislamiento, como si las transacciones fueran secuenciales. Mayor aislamiento = mayor consistencia pero menor rendimiento y más contención de locks.",
                        "SQL_DB", "MARRON"),
                    new Flashcard(
                        "¿Qué son las materialized views?",
                        "Una materialized view almacena físicamente el resultado de una consulta, a diferencia de las views normales que ejecutan la query cada vez. Mejoran enormemente el rendimiento de consultas analíticas complejas. Se refrescan manualmente (REFRESH MATERIALIZED VIEW) o automáticamente según la BD. Útiles para reportes y dashboards donde la consistencia exacta en tiempo real no es crítica.",
                        "SQL_DB", "MARRON"),

                    // ══════════════════════════════════════════
                    // NEGRO - JAVA_CORE (JVM internals)
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo funciona la memoria de la JVM (heap, stack, generaciones)?",
                        "Stack: almacena frames de métodos y variables locales, uno por hilo. Heap: almacena objetos, compartido entre hilos. El heap se divide en Young Generation (Eden + Survivor spaces, objetos nuevos), Old Generation (objetos de larga vida) y Metaspace (metadata de clases). El GC recolecta Young Gen frecuentemente (Minor GC) y Old Gen ocasionalmente (Major/Full GC).",
                        "JAVA_CORE", "NEGRO"),
                    new Flashcard(
                        "¿Qué es el class loading en Java?",
                        "El ClassLoader carga clases dinámicamente cuando se referencian por primera vez. Jerarquía: Bootstrap ClassLoader (rt.jar/JDK core), Extension/Platform ClassLoader, Application ClassLoader (classpath de la app). Delegation model: primero delega al padre. La clase se carga solo una vez por ClassLoader. Permite hot-reload en frameworks y plugins con ClassLoaders personalizados.",
                        "JAVA_CORE", "NEGRO"),
                    new Flashcard(
                        "¿Qué es la reflexión (reflection) en Java y cuándo usarla?",
                        "Reflection permite inspeccionar y manipular clases, métodos y campos en runtime, independientemente del tipo en compilación. Class.forName(\"com.Foo\"), clazz.getDeclaredMethods(), method.invoke(obj, args). Usado por frameworks (Spring IoC, JUnit, Hibernate). Es poderoso pero costoso en rendimiento y rompe encapsulación. Evitar en código de negocio, preferir para frameworks/librerías.",
                        "JAVA_CORE", "NEGRO"),

                    // ══════════════════════════════════════════
                    // NEGRO - SPRING_BOOT (auto-configuration)
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo crear una auto-configuración personalizada en Spring Boot?",
                        "Crea una clase @Configuration con @ConditionalOnClass, @ConditionalOnMissingBean, etc. Regístrala en src/main/resources/META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports (Spring Boot 3) o spring.factories (Boot 2). Spring Boot la carga automáticamente si el jar está en classpath. Así funcionan todos los starters de Spring Boot.",
                        "SPRING_BOOT", "NEGRO"),
                    new Flashcard(
                        "¿Qué es spring.factories y cómo funciona?",
                        "spring.factories (Spring Boot 2) / AutoConfiguration.imports (Boot 3) es el mecanismo de Service Loader de Spring. Registra implementaciones de interfaces clave: EnableAutoConfiguration, ApplicationListener, BeanFactoryPostProcessor. Spring Boot escanea todos los jars en classpath buscando este archivo. Permite a librerías de terceros integrarse automáticamente sin configuración explícita del usuario.",
                        "SPRING_BOOT", "NEGRO"),

                    // ══════════════════════════════════════════
                    // NEGRO - AVANZADO (Reactive, Event Sourcing, DDD)
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Qué son los Reactive Streams y Project Reactor?",
                        "Reactive Streams es una especificación para streams asincrónicos no bloqueantes con backpressure. Project Reactor implementa esta spec con Mono<T> (0 o 1 elemento) y Flux<T> (0 a N elementos). Spring WebFlux usa Reactor para APIs reactivas. Backpressure permite al consumidor señalar al productor que va lento, evitando desbordamiento de buffers.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es Event Sourcing?",
                        "Event Sourcing almacena el estado de la aplicación como secuencia inmutable de eventos en lugar del estado actual. Para reconstruir el estado actual se reproducen todos los eventos desde el inicio. Ventajas: historial completo de cambios, auditoría perfecta, posibilidad de time-travel. Complejidad: event schema evolution, proyecciones para queries eficientes (CQRS suele combinarse).",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es la arquitectura hexagonal (Ports and Adapters)?",
                        "La arquitectura hexagonal aísla la lógica de negocio (dominio) de los detalles técnicos. El dominio define puertos (interfaces): puertos de entrada (casos de uso) y puertos de salida (repositorios, servicios externos). Los adaptadores implementan estos puertos: REST controllers adaptan HTTP al caso de uso, JpaRepository adapta JPA al repositorio. Facilita testing y cambio de tecnología.",
                        "AVANZADO", "NEGRO"),
                    new Flashcard(
                        "¿Qué es DDD (Domain-Driven Design)?",
                        "DDD es un enfoque de diseño que centra el modelo de software en el dominio del negocio. Conceptos clave: Ubiquitous Language (vocabulario compartido entre técnicos y negocio), Bounded Context (límites explícitos del modelo), Aggregate (grupo de entidades con consistencia transaccional), Value Object (inmutable, sin identidad), Domain Events, Repository pattern.",
                        "AVANZADO", "NEGRO"),

                    // ══════════════════════════════════════════
                    // NEGRO - TESTING
                    // ══════════════════════════════════════════
                    new Flashcard(
                        "¿Cómo se usan Testcontainers en profundidad?",
                        "Testcontainers arranca contenedores Docker reales en tests. @Testcontainers + @Container PostgreSQLContainer db = new PostgreSQLContainer(\"postgres:15\") inicia un Postgres real. Con @DynamicPropertySource se registran las propiedades del contenedor (URL, usuario) en el contexto Spring. Soporta Kafka, Redis, MongoDB y cualquier imagen Docker. Más lento que mocks pero mucho más fiel a producción.",
                        "TESTING", "NEGRO"),
                    new Flashcard(
                        "¿Qué es mutation testing?",
                        "Mutation testing evalúa la calidad de los tests introduciendo pequeñas mutaciones (cambios) en el código (cambiar > por >=, eliminar una condición) y verificando que los tests fallen. Si un test no detecta la mutación es un test débil. PIT Mutation Testing es la herramienta estándar para Java. Un mutation score alto indica tests robustos que detectan regresiones.",
                        "TESTING", "NEGRO"),
                    new Flashcard(
                        "¿Qué es el contract testing y cuándo usarlo?",
                        "Contract testing verifica que productor y consumidor de una API cumplen el contrato acordado. Pact es la herramienta más popular: el consumidor define expectativas (pact), el productor las verifica contra su implementación real. Ideal en microservicios para detectar breaking changes sin tests de integración full. Más rápido y estable que tests end-to-end.",
                        "TESTING", "NEGRO")
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
