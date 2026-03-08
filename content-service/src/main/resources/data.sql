-- =============================================
-- Códigos HTTP y Validación en Spring Boot
-- =============================================

-- Códigos HTTP básicos
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que un recurso fue creado exitosamente?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        1, 'HTTP', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente envió datos incorrectos o inválidos?',
        '401 Unauthorized', '404 Not Found', '400 Bad Request', '500 Internal Server Error',
        2, 'HTTP', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el recurso solicitado no existe?',
        '400 Bad Request', '403 Forbidden', '500 Internal Server Error', '404 Not Found',
        3, 'HTTP', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un error interno del servidor (bug en el código)?',
        '500 Internal Server Error', '400 Bad Request', '503 Service Unavailable', '502 Bad Gateway',
        0, 'HTTP', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un conflicto con datos existentes (ej: DNI duplicado)?',
        '400 Bad Request', '422 Unprocessable Entity', '409 Conflict', '403 Forbidden',
        2, 'HTTP', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP se usa cuando un DELETE se ejecuta correctamente y no hay contenido que devolver?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        2, 'HTTP', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia principal entre los códigos 4xx y 5xx?',
        '4xx son errores del cliente, 5xx son errores del servidor', '4xx son warnings, 5xx son errores', '4xx son del servidor, 5xx del cliente', 'No hay diferencia, son intercambiables',
        0, 'HTTP', 'EASY', NOW());

-- Validación en Spring Boot
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se usa en el Controller para activar las validaciones de un DTO?',
        '@Validated', '@Valid', '@Check', '@Verify',
        1, 'VALIDACION', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si NO pones @Valid en el @RequestBody del Controller?',
        'Spring lanza un error 500', 'Las anotaciones de validación (@NotBlank, etc.) se ignoran completamente', 'La app no compila', 'Spring valida pero no devuelve errores',
        1, 'VALIDACION', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @NotNull, @NotEmpty y @NotBlank?',
        'Son sinónimos, hacen lo mismo', '@NotNull solo valida null; @NotEmpty valida null y vacío; @NotBlank valida null, vacío y espacios', '@NotBlank es para números, @NotNull para Strings', '@NotEmpty es la versión deprecated de @NotBlank',
        1, 'VALIDACION', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué @NotBlank no funciona en un campo de tipo LocalDate?',
        'Porque LocalDate no tiene zona horaria', 'Porque @NotBlank solo funciona con Strings (CharSequence), no con fechas', 'Porque falta importar la librería de fechas', 'Sí funciona, es un mito que no funcione',
        1, 'VALIDACION', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usarías para validar que una fecha NO sea null (en un campo LocalDate)?',
        '@NotBlank', '@NotEmpty', '@NotNull', '@Required',
        2, 'VALIDACION', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué excepción lanza Spring cuando @Valid detecta errores de validación en un @RequestBody?',
        'ValidationException', 'ConstraintViolationException', 'MethodArgumentNotValidException', 'IllegalArgumentException',
        2, 'VALIDACION', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @RestControllerAdvice con @ExceptionHandler?',
        'Para crear endpoints REST automáticamente', 'Para capturar excepciones y devolver respuestas HTTP personalizadas en vez de errores 500', 'Para validar los DTOs', 'Para manejar la autenticación',
        1, 'VALIDACION', 'MEDIUM', NOW());

-- Exception Handling
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Si una excepción NO está capturada en el GlobalExceptionHandler, ¿qué código HTTP devuelve Spring por defecto?',
        '400 Bad Request', '404 Not Found', '500 Internal Server Error', '503 Service Unavailable',
        2, 'HTTP', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas en el Controller para que un POST devuelva 201 en vez de 200?',
        '@StatusCode(201)', '@ResponseStatus(HttpStatus.CREATED)', '@HttpResponse(201)', '@ReturnCode(CREATED)',
        1, 'HTTP', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP es peor señal en producción: un 400 o un 500?',
        '400, porque significa que el frontend está roto', '500, porque indica un bug en el servidor que no fue manejado', 'Ambos son igual de graves', 'Ninguno es grave, son informativos',
        1, 'HTTP', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un String tenga máximo N caracteres?',
        '@Max(N)', '@Length(max=N)', '@Size(max=N)', '@Limit(N)',
        2, 'VALIDACION', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que una fecha sea anterior a hoy?',
        '@Before', '@Past', '@Historical', '@PastDate',
        1, 'VALIDACION', 'EASY', NOW());

-- =============================================
-- Mockito y Testing en Spring Boot
-- =============================================

-- Paso 1: Setup del test
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas para crear un mock (objeto falso) de un Repository en un test unitario?',
        '@Autowired', '@Mock', '@Repository', '@FakeBean',
        1, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación inyecta los mocks dentro de la clase que estás testeando (ej: el Service)?',
        '@Inject', '@MockBean', '@InjectMocks', '@AutoWireMocks',
        2, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación necesitas en la clase de test para que @Mock y @InjectMocks funcionen?',
        '@SpringBootTest', '@ExtendWith(MockitoExtension.class)', '@RunWith(JUnit.class)', '@EnableMocks',
        1, 'MOCKITO', 'EASY', NOW());

-- Paso 2: Entender la estructura del test
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('En un test de Service con Mockito, ¿cuál es el orden correcto de los pasos?',
        'Mock → Request → Service → Assert', 'Request → Entity → Mock → Service → Assert', 'Assert → Mock → Request → Service', 'Service → Mock → Assert → Request',
        1, 'MOCKITO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué creas un StudentRequest Y un Student separados en el test?',
        'Porque Java obliga a tener dos objetos', 'El Request es lo que envía el usuario, el Student es lo que devolvería la BD — son capas distintas', 'Es una convención pero no es necesario', 'Para que el test sea más largo y completo',
        1, 'MOCKITO', 'MEDIUM', NOW());

-- Paso 3: Configurar el mock (when/thenReturn)
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace when(repository.save(any())).thenReturn(student)?',
        'Guarda el student en la BD real', 'Le dice al mock: cuando alguien llame a save(), devuelve este student sin tocar la BD', 'Ejecuta el save y luego devuelve el student', 'Verifica que save fue llamado',
        1, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué usamos any() dentro de when(repository.save(any())) en vez del objeto exacto?',
        'Porque any() es más rápido', 'Porque el Service crea un objeto nuevo internamente, y no es la misma instancia que nuestro request', 'Porque save() no acepta objetos concretos', 'No hay razón, es solo costumbre',
        1, 'MOCKITO', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si el mock NO tiene un when() configurado y el Service llama al repository?',
        'Lanza una excepción', 'Devuelve null (para objetos) o valores por defecto (0, false, etc.)', 'Llama a la BD real', 'El test no compila',
        1, 'MOCKITO', 'MEDIUM', NOW());

-- Paso 4: Llamar al service
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('En el test, cuando haces studentService.create(request), ¿qué BD se usa?',
        'La BD real de PostgreSQL', 'Una BD H2 en memoria', 'Ninguna — el mock intercepta la llamada al repository y devuelve lo que configuraste', 'Una BD de test configurada en application-test.yml',
        2, 'MOCKITO', 'MEDIUM', NOW());

-- Paso 5: Assertions
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace assertEquals("Carlos", result.getNombre()) en un test?',
        'Asigna el valor "Carlos" al resultado', 'Compara si el nombre del resultado es "Carlos" — si no lo es, el test falla', 'Imprime "Carlos" en consola', 'Busca "Carlos" en la BD',
        1, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace verify(repository, times(1)).save(any()) en un test?',
        'Guarda el objeto una vez en la BD', 'Comprueba que el método save() del mock fue llamado exactamente 1 vez', 'Ejecuta save() una vez más', 'Resetea el mock después de un save',
        1, 'MOCKITO', 'MEDIUM', NOW());

-- Conceptos clave
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la principal ventaja de usar Mockito en tests de Service?',
        'Los tests son más bonitos', 'No necesitas BD real, son rápidos y aislados — solo testeas la lógica del Service', 'Mockito testea el frontend también', 'Genera los tests automáticamente',
        1, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "mock" en testing?',
        'Una copia exacta de la BD', 'Un objeto falso que simula el comportamiento de otro sin ejecutar su lógica real', 'Un tipo de test que corre en producción', 'Un framework para hacer tests de frontend',
        1, 'MOCKITO', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Mock y @MockBean?',
        'Son lo mismo', '@Mock es de Mockito puro (test unitario), @MockBean es de Spring (test de integración con contexto)', '@MockBean es la versión vieja de @Mock', '@Mock es para repositories, @MockBean para services',
        1, 'MOCKITO', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo testeas que el Service lanza una excepción cuando el estudiante no existe?',
        'try/catch en el test', 'assertThrows(ResourceNotFoundException.class, () -> service.findById(999L))', 'No se puede testear excepciones', '@ExpectException(ResourceNotFoundException.class)',
        1, 'MOCKITO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Para testear findById cuando el estudiante NO existe, ¿qué when() configuras?',
        'when(repo.findById(999L)).thenReturn(null)', 'when(repo.findById(999L)).thenReturn(Optional.empty())', 'when(repo.findById(999L)).thenThrow(Exception.class)', 'No necesitas when(), Mockito lo hace solo',
        1, 'MOCKITO', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué un test unitario con @Mock es más rápido que uno con @SpringBootTest?',
        'Porque usa menos memoria RAM', 'Porque @Mock NO levanta el contexto de Spring (no arranca la app), solo crea objetos falsos', 'Porque @SpringBootTest tiene un bug de rendimiento', 'No hay diferencia de velocidad',
        1, 'MOCKITO', 'MEDIUM', NOW());

-- Flujo completo
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('En este código de test: when(repo.existsByDni("123")).thenReturn(true), ¿qué escenario estás simulando?',
        'Que el DNI es válido', 'Que ya existe un estudiante con ese DNI en la BD (para testear duplicados)', 'Que el repository funciona correctamente', 'Que la BD está conectada',
        1, 'MOCKITO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué patrón siguen los tests bien escritos?',
        'Setup → Execute → Cleanup', 'Given (preparar datos) → When (ejecutar acción) → Then (verificar resultado)', 'Input → Process → Output', 'Create → Read → Update → Delete',
        1, 'MOCKITO', 'EASY', NOW());

-- =============================================
-- MockMvc y Tests de Controller
-- =============================================

-- Qué es MockMvc
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es MockMvc?',
        'Un mock del Service', 'Un simulador de peticiones HTTP que testea el Controller sin levantar un servidor real', 'Una librería para testear la BD', 'Un navegador web para tests',
        1, 'MOCKMVC', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test con MockMvc (controller) y un test con @Mock (service)?',
        'Son lo mismo', 'MockMvc simula peticiones HTTP y SÍ ejecuta validaciones @Valid; @Mock solo testea lógica de negocio sin HTTP', 'MockMvc es más lento siempre', '@Mock también ejecuta validaciones',
        1, 'MOCKMVC', 'MEDIUM', NOW());

-- Setup de MockMvc
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve MockMvcBuilders.standaloneSetup(controller)?',
        'Arranca toda la aplicación Spring', 'Crea un MockMvc que solo carga ESE controller, sin levantar el contexto completo de Spring', 'Conecta el controller a la BD', 'Configura los mocks automáticamente',
        1, 'MOCKMVC', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué pones .setControllerAdvice(new GlobalExceptionHandler()) al crear MockMvc?',
        'Para que los logs sean más bonitos', 'Para que el test capture las excepciones y devuelva los códigos HTTP correctos (404, 409, etc.) en vez de 500', 'Para activar la seguridad', 'Es obligatorio, sin eso no compila',
        1, 'MOCKMVC', 'MEDIUM', NOW());

-- Validación en controller tests
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Si tu request no incluye un campo @NotBlank y haces POST con MockMvc, ¿qué pasa?',
        'El mock del Service devuelve null', 'Spring valida ANTES de llamar al Service y devuelve 400 — el Service ni se ejecuta', 'El test falla con NullPointerException', 'Spring ignora la validación en tests',
        1, 'MOCKMVC', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Tu test espera 201 pero recibe 400. El request tiene dni, nombre y apellidos pero falta email (que es @NotBlank). ¿Cuál es el problema?',
        'El mock está mal configurado', 'Falta un campo obligatorio en el request — @Valid lo rechaza antes de llegar al Service', 'El controller tiene un bug', 'MockMvc no soporta POST',
        1, 'MOCKMVC', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el flujo correcto cuando MockMvc hace un POST con @Valid?',
        'Service → Controller → Validación → Response', 'JSON → @Valid (valida campos) → ¿ok? → Service → Response. Si falla validación → 400 directo', 'JSON → Service → @Valid → Response', 'JSON → BD → Controller → Response',
        1, 'MOCKMVC', 'HARD', NOW());

-- Sintaxis de MockMvc
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace mockMvc.perform(post("/api/students").content(json))?',
        'Envía datos a la BD', 'Simula una petición POST al endpoint /api/students con ese JSON como body', 'Crea un student directamente', 'Llama al Service sin pasar por el Controller',
        1, 'MOCKMVC', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(status().isCreated())?',
        'Crea el recurso en la BD', 'Verifica que la respuesta HTTP fue 201 Created — si fue otro código, el test falla', 'Configura el status del mock', 'Espera a que el servidor arranque',
        1, 'MOCKMVC', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(jsonPath("$.nombre").value("Berto"))?',
        'Busca "Berto" en la BD', 'Verifica que el JSON de respuesta tiene un campo "nombre" con valor "Berto"', 'Asigna "Berto" al campo nombre', 'Filtra resultados por nombre',
        1, 'MOCKMVC', 'EASY', NOW());

-- Errores comunes (basados en tus errores reales)
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('En un test de UPDATE usas get() en vez de put(). ¿Qué pasa?',
        'Funciona igual, da lo mismo', 'Llamas al endpoint GET en vez del PUT — estás testeando el método equivocado del controller', 'Spring lo convierte automáticamente a PUT', 'El test no compila',
        1, 'MOCKMVC', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('En un test de DELETE usas post() en vez de delete(). ¿Qué resultado obtienes?',
        '204 No Content', 'Probablemente 405 Method Not Allowed o un resultado inesperado, porque POST /api/students/1 no es el endpoint de borrado', '200 OK', 'El test pasa correctamente',
        1, 'MOCKMVC', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Tu test lanza RuntimeException pero el GlobalExceptionHandler solo captura ResourceNotFoundException. ¿Qué código HTTP recibes?',
        '404 Not Found', '400 Bad Request', '500 Internal Server Error — porque la excepción no está capturada por ningún handler', '200 OK',
        2, 'MOCKMVC', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué necesitas ObjectMapper con JavaTimeModule en los tests de controller?',
        'Para conectar a la BD', 'Para que Jackson sepa serializar LocalDate a JSON (ej: "1989-05-28") — sin eso falla la conversión', 'Para activar las validaciones', 'Es decorativo, no es necesario',
        1, 'MOCKMVC', 'MEDIUM', NOW());

-- Test de Service vs Test de Controller
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde testeas que @NotBlank rechaza un campo vacío: en el test del Service o del Controller?',
        'En el Service, porque es donde está la lógica', 'En el Controller con MockMvc, porque @Valid se ejecuta en la capa del Controller', 'En ambos por igual', 'En ninguno, las validaciones no se testean',
        1, 'MOCKMVC', 'HARD', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué testeas en el Service y qué testeas en el Controller?',
        'Lo mismo en ambos', 'Service: lógica de negocio (duplicados, excepciones, transformaciones). Controller: HTTP (códigos de estado, validación, formato JSON)', 'Service: HTTP. Controller: lógica', 'Solo se testea uno de los dos',
        1, 'MOCKMVC', 'MEDIUM', NOW());

-- =============================================
-- Arquitectura Spring Boot (Entities, DTOs, capas)
-- =============================================

-- Entities y Flyway
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una Entity en Spring Boot?',
        'Un JSON que envía el usuario', 'Una clase Java que representa una tabla de la BD — cada campo es una columna', 'Un controlador REST', 'Un archivo de configuración',
        1, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Flyway en un proyecto Spring Boot?',
        'Para hacer tests automáticos', 'Para gestionar migraciones de BD — crea y versiona tablas con scripts SQL (V1__, V2__, etc.)', 'Para desplegar la app en producción', 'Para generar entities automáticamente',
        1, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre ddl-auto: validate y ddl-auto: create-drop?',
        'Son lo mismo', 'validate solo comprueba que la Entity coincide con la BD; create-drop crea las tablas al arrancar y las borra al parar', 'validate crea tablas, create-drop las valida', 'validate es para producción, create-drop no existe',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se recomienda ddl-auto: validate + Flyway en producción en vez de ddl-auto: update?',
        'Porque es más rápido', 'Porque Flyway da control total sobre los cambios de BD con scripts versionados, y validate asegura que todo cuadra sin modificar nada automáticamente', 'Porque update no funciona en producción', 'No hay diferencia real',
        1, 'ARQUITECTURA', 'HARD', NOW());

-- DTOs
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un DTO (Data Transfer Object)?',
        'Una tabla de la BD', 'Un objeto que define qué datos entran o salen de la API — separa la Entity de lo que ve el usuario', 'Un tipo de test', 'Un framework de Java',
        1, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa un StudentRequest y un StudentResponse en vez de usar la Entity Student directamente?',
        'Por convención, pero no es necesario', 'Para no exponer campos internos (id, createdAt) en el request, y para controlar exactamente qué devuelve la API en el response', 'Porque Spring lo obliga', 'Para que el código sea más largo',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema hay si usas la Entity directamente como @RequestBody en el Controller?',
        'Ninguno, funciona perfecto', 'El usuario podría enviar campos como id, createdAt o activo y modificar datos que no debería tocar', 'Spring no lo permite', 'La app no compila',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

-- Capas del Service
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son las 3 capas principales de una API REST en Spring Boot?',
        'HTML, CSS, JavaScript', 'Controller (HTTP) → Service (lógica de negocio) → Repository (acceso a BD)', 'Entity, DTO, Config', 'Frontend, Backend, Base de datos',
        1, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde va la lógica de negocio como "verificar si un DNI ya existe antes de crear"?',
        'En el Controller', 'En el Service', 'En el Repository', 'En el DTO',
        1, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Transactional en un método del Service?',
        'Hace el método más rápido', 'Asegura que si algo falla a mitad de la operación, todos los cambios en BD se deshacen (rollback)', 'Activa las validaciones', 'Permite llamar a otros services',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

-- Controller y códigos HTTP
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación convierte una clase en un endpoint REST en Spring Boot?',
        '@Service', '@Entity', '@RestController', '@Component',
        2, 'ARQUITECTURA', 'EASY', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP corresponde a cada operación CRUD?',
        'GET=Create, POST=Read, PUT=Update, DELETE=Delete', 'POST=Create, GET=Read, PUT=Update, DELETE=Delete', 'PUT=Create, GET=Read, POST=Update, DELETE=Delete', 'POST=Create, PUT=Read, GET=Update, DELETE=Delete',
        1, 'ARQUITECTURA', 'EASY', NOW());

-- Tests de integración
INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test unitario (Mockito) y uno de integración (@SpringBootTest)?',
        'Son lo mismo con diferente nombre', 'El unitario testea una clase aislada con mocks; el de integración levanta la app completa con BD real y testea todo junto', 'El unitario es para producción, el de integración para desarrollo', 'El de integración es más rápido',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa H2 (BD en memoria) para tests de integración en vez de PostgreSQL?',
        'Porque H2 es mejor que PostgreSQL', 'Porque H2 es rápida, no necesita instalación, y se crea/destruye con cada test — ideal para tests aislados y repetibles', 'Porque PostgreSQL no soporta tests', 'No hay razón, es costumbre',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Transactional en un test de integración?',
        'Para que el test sea más rápido', 'Para que los datos insertados durante el test se deshagan automáticamente (rollback) y no contaminen otros tests', 'Para activar las validaciones', 'Para conectar a la BD de producción',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('Un test de integración falla con 409 Conflict al crear un estudiante. ¿Cuál es la causa más probable?',
        'El controller tiene un bug', 'Ya existe un registro con ese DNI en la BD — los datos de un test anterior no se limpiaron', 'El mock está mal configurado', 'H2 no soporta INSERT',
        1, 'ARQUITECTURA', 'MEDIUM', NOW());

INSERT INTO quizzes (question, option_a, option_b, option_c, option_d, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ActiveProfiles("test") en un test de integración?',
        'Activa el modo debug', 'Carga application-test.yml en vez del application.yml normal — permite usar otra BD o configuración para tests', 'Desactiva las validaciones', 'Hace que los tests corran más rápido',
        1, 'ARQUITECTURA', 'EASY', NOW());
