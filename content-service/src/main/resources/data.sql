-- =============================================
-- Códigos HTTP y Validación en Spring Boot
-- =============================================

-- Códigos HTTP básicos
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que un recurso fue creado exitosamente?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente envió datos incorrectos o inválidos?',
        '401 Unauthorized', '404 Not Found', '400 Bad Request', '500 Internal Server Error',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el recurso solicitado no existe?',
        '400 Bad Request', '403 Forbidden', '500 Internal Server Error', '404 Not Found',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un error interno del servidor (bug en el código)?',
        '500 Internal Server Error', '400 Bad Request', '503 Service Unavailable', '502 Bad Gateway',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un conflicto con datos existentes (ej: DNI duplicado)?',
        '400 Bad Request', '422 Unprocessable Entity', '409 Conflict', '403 Forbidden',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP se usa cuando un DELETE se ejecuta correctamente y no hay contenido que devolver?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia principal entre los códigos 4xx y 5xx?',
        '4xx son errores del cliente, 5xx son errores del servidor', '4xx son warnings, 5xx son errores', '4xx son del servidor, 5xx del cliente', 'No hay diferencia, son intercambiables',
        0, 'HTTP', 'BLANCO', NOW());

-- Validación en Spring Boot
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se usa en el Controller para activar las validaciones de un DTO?',
        '@Validated', '@Valid', '@Check', '@Verify',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si NO pones @Valid en el @RequestBody del Controller?',
        'Spring lanza un error 500', 'Las anotaciones de validación (@NotBlank, etc.) se ignoran completamente', 'La app no compila', 'Spring valida pero no devuelve errores',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @NotNull, @NotEmpty y @NotBlank?',
        'Son sinónimos, hacen lo mismo', '@NotNull solo valida null; @NotEmpty valida null y vacío; @NotBlank valida null, vacío y espacios', '@NotBlank es para números, @NotNull para Strings', '@NotEmpty es la versión deprecated de @NotBlank',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué @NotBlank no funciona en un campo de tipo LocalDate?',
        'Porque LocalDate no tiene zona horaria', 'Porque @NotBlank solo funciona con Strings (CharSequence), no con fechas', 'Porque falta importar la librería de fechas', 'Sí funciona, es un mito que no funcione',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usarías para validar que una fecha NO sea null (en un campo LocalDate)?',
        '@NotBlank', '@NotEmpty', '@NotNull', '@Required',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué excepción lanza Spring cuando @Valid detecta errores de validación en un @RequestBody?',
        'ValidationException', 'ConstraintViolationException', 'MethodArgumentNotValidException', 'IllegalArgumentException',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @RestControllerAdvice con @ExceptionHandler?',
        'Para crear endpoints REST automáticamente', 'Para capturar excepciones y devolver respuestas HTTP personalizadas en vez de errores 500', 'Para validar los DTOs', 'Para manejar la autenticación',
        1, 'VALIDACION', 'BLANCO', NOW());

-- Exception Handling
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Si una excepción NO está capturada en el GlobalExceptionHandler, ¿qué código HTTP devuelve Spring por defecto?',
        '400 Bad Request', '404 Not Found', '500 Internal Server Error', '503 Service Unavailable',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas en el Controller para que un POST devuelva 201 en vez de 200?',
        '@StatusCode(201)', '@ResponseStatus(HttpStatus.CREATED)', '@HttpResponse(201)', '@ReturnCode(CREATED)',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP es peor señal en producción: un 400 o un 500?',
        '400, porque significa que el frontend está roto', '500, porque indica un bug en el servidor que no fue manejado', 'Ambos son igual de graves', 'Ninguno es grave, son informativos',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un String tenga máximo N caracteres?',
        '@Max(N)', '@Length(max=N)', '@Size(max=N)', '@Limit(N)',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que una fecha sea anterior a hoy?',
        '@Before', '@Past', '@Historical', '@PastDate',
        1, 'VALIDACION', 'BLANCO', NOW());

-- =============================================
-- Mockito y Testing en Spring Boot
-- =============================================

-- Paso 1: Setup del test
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas para crear un mock (objeto falso) de un Repository en un test unitario?',
        '@Autowired', '@Mock', '@Repository', '@FakeBean',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación inyecta los mocks dentro de la clase que estás testeando (ej: el Service)?',
        '@Inject', '@MockBean', '@InjectMocks', '@AutoWireMocks',
        2, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación necesitas en la clase de test para que @Mock y @InjectMocks funcionen?',
        '@SpringBootTest', '@ExtendWith(MockitoExtension.class)', '@RunWith(JUnit.class)', '@EnableMocks',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Paso 2: Entender la estructura del test
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de Service con Mockito, ¿cuál es el orden correcto de los pasos?',
        'Mock → Request → Service → Assert', 'Request → Entity → Mock → Service → Assert', 'Assert → Mock → Request → Service', 'Service → Mock → Assert → Request',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué creas un StudentRequest Y un Student separados en el test?',
        'Porque Java obliga a tener dos objetos', 'El Request es lo que envía el usuario, el Student es lo que devolvería la BD — son capas distintas', 'Es una convención pero no es necesario', 'Para que el test sea más largo y completo',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Paso 3: Configurar el mock (when/thenReturn)
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace when(repository.save(any())).thenReturn(student)?',
        'Guarda el student en la BD real', 'Le dice al mock: cuando alguien llame a save(), devuelve este student sin tocar la BD', 'Ejecuta el save y luego devuelve el student', 'Verifica que save fue llamado',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué usamos any() dentro de when(repository.save(any())) en vez del objeto exacto?',
        'Porque any() es más rápido', 'Porque el Service crea un objeto nuevo internamente, y no es la misma instancia que nuestro request', 'Porque save() no acepta objetos concretos', 'No hay razón, es solo costumbre',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si el mock NO tiene un when() configurado y el Service llama al repository?',
        'Lanza una excepción', 'Devuelve null (para objetos) o valores por defecto (0, false, etc.)', 'Llama a la BD real', 'El test no compila',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Paso 4: Llamar al service
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En el test, cuando haces studentService.create(request), ¿qué BD se usa?',
        'La BD real de PostgreSQL', 'Una BD H2 en memoria', 'Ninguna — el mock intercepta la llamada al repository y devuelve lo que configuraste', 'Una BD de test configurada en application-test.yml',
        2, 'MOCKITO', 'NARANJA', NOW());

-- Paso 5: Assertions
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace assertEquals("Carlos", result.getNombre()) en un test?',
        'Asigna el valor "Carlos" al resultado', 'Compara si el nombre del resultado es "Carlos" — si no lo es, el test falla', 'Imprime "Carlos" en consola', 'Busca "Carlos" en la BD',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace verify(repository, times(1)).save(any()) en un test?',
        'Guarda el objeto una vez en la BD', 'Comprueba que el método save() del mock fue llamado exactamente 1 vez', 'Ejecuta save() una vez más', 'Resetea el mock después de un save',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Conceptos clave
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la principal ventaja de usar Mockito en tests de Service?',
        'Los tests son más bonitos', 'No necesitas BD real, son rápidos y aislados — solo testeas la lógica del Service', 'Mockito testea el frontend también', 'Genera los tests automáticamente',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "mock" en testing?',
        'Una copia exacta de la BD', 'Un objeto falso que simula el comportamiento de otro sin ejecutar su lógica real', 'Un tipo de test que corre en producción', 'Un framework para hacer tests de frontend',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Mock y @MockBean?',
        'Son lo mismo', '@Mock es de Mockito puro (test unitario), @MockBean es de Spring (test de integración con contexto)', '@MockBean es la versión vieja de @Mock', '@Mock es para repositories, @MockBean para services',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo testeas que el Service lanza una excepción cuando el estudiante no existe?',
        'try/catch en el test', 'assertThrows(ResourceNotFoundException.class, () -> service.findById(999L))', 'No se puede testear excepciones', '@ExpectException(ResourceNotFoundException.class)',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Para testear findById cuando el estudiante NO existe, ¿qué when() configuras?',
        'when(repo.findById(999L)).thenReturn(null)', 'when(repo.findById(999L)).thenReturn(Optional.empty())', 'when(repo.findById(999L)).thenThrow(Exception.class)', 'No necesitas when(), Mockito lo hace solo',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué un test unitario con @Mock es más rápido que uno con @SpringBootTest?',
        'Porque usa menos memoria RAM', 'Porque @Mock NO levanta el contexto de Spring (no arranca la app), solo crea objetos falsos', 'Porque @SpringBootTest tiene un bug de rendimiento', 'No hay diferencia de velocidad',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Flujo completo
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En este código de test: when(repo.existsByDni("123")).thenReturn(true), ¿qué escenario estás simulando?',
        'Que el DNI es válido', 'Que ya existe un estudiante con ese DNI en la BD (para testear duplicados)', 'Que el repository funciona correctamente', 'Que la BD está conectada',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué patrón siguen los tests bien escritos?',
        'Setup → Execute → Cleanup', 'Given (preparar datos) → When (ejecutar acción) → Then (verificar resultado)', 'Input → Process → Output', 'Create → Read → Update → Delete',
        1, 'MOCKITO', 'NARANJA', NOW());

-- =============================================
-- MockMvc y Tests de Controller
-- =============================================

-- Qué es MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es MockMvc?',
        'Un mock del Service', 'Un simulador de peticiones HTTP que testea el Controller sin levantar un servidor real', 'Una librería para testear la BD', 'Un navegador web para tests',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test con MockMvc (controller) y un test con @Mock (service)?',
        'Son lo mismo', 'MockMvc simula peticiones HTTP y SÍ ejecuta validaciones @Valid; @Mock solo testea lógica de negocio sin HTTP', 'MockMvc es más lento siempre', '@Mock también ejecuta validaciones',
        1, 'MOCKMVC', 'VERDE', NOW());

-- Setup de MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve MockMvcBuilders.standaloneSetup(controller)?',
        'Arranca toda la aplicación Spring', 'Crea un MockMvc que solo carga ESE controller, sin levantar el contexto completo de Spring', 'Conecta el controller a la BD', 'Configura los mocks automáticamente',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué pones .setControllerAdvice(new GlobalExceptionHandler()) al crear MockMvc?',
        'Para que los logs sean más bonitos', 'Para que el test capture las excepciones y devuelva los códigos HTTP correctos (404, 409, etc.) en vez de 500', 'Para activar la seguridad', 'Es obligatorio, sin eso no compila',
        1, 'MOCKMVC', 'VERDE', NOW());

-- Validación en controller tests
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Si tu request no incluye un campo @NotBlank y haces POST con MockMvc, ¿qué pasa?',
        'El mock del Service devuelve null', 'Spring valida ANTES de llamar al Service y devuelve 400 — el Service ni se ejecuta', 'El test falla con NullPointerException', 'Spring ignora la validación en tests',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Tu test espera 201 pero recibe 400. El request tiene dni, nombre y apellidos pero falta email (que es @NotBlank). ¿Cuál es el problema?',
        'El mock está mal configurado', 'Falta un campo obligatorio en el request — @Valid lo rechaza antes de llegar al Service', 'El controller tiene un bug', 'MockMvc no soporta POST',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el flujo correcto cuando MockMvc hace un POST con @Valid?',
        'Service → Controller → Validación → Response', 'JSON → @Valid (valida campos) → ¿ok? → Service → Response. Si falla validación → 400 directo', 'JSON → Service → @Valid → Response', 'JSON → BD → Controller → Response',
        1, 'MOCKMVC', 'VERDE', NOW());

-- Sintaxis de MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace mockMvc.perform(post("/api/students").content(json))?',
        'Envía datos a la BD', 'Simula una petición POST al endpoint /api/students con ese JSON como body', 'Crea un student directamente', 'Llama al Service sin pasar por el Controller',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(status().isCreated())?',
        'Crea el recurso en la BD', 'Verifica que la respuesta HTTP fue 201 Created — si fue otro código, el test falla', 'Configura el status del mock', 'Espera a que el servidor arranque',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(jsonPath("$.nombre").value("Berto"))?',
        'Busca "Berto" en la BD', 'Verifica que el JSON de respuesta tiene un campo "nombre" con valor "Berto"', 'Asigna "Berto" al campo nombre', 'Filtra resultados por nombre',
        1, 'MOCKMVC', 'VERDE', NOW());

-- Errores comunes (basados en tus errores reales)
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de UPDATE usas get() en vez de put(). ¿Qué pasa?',
        'Funciona igual, da lo mismo', 'Llamas al endpoint GET en vez del PUT — estás testeando el método equivocado del controller', 'Spring lo convierte automáticamente a PUT', 'El test no compila',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de DELETE usas post() en vez de delete(). ¿Qué resultado obtienes?',
        '204 No Content', 'Probablemente 405 Method Not Allowed o un resultado inesperado, porque POST /api/students/1 no es el endpoint de borrado', '200 OK', 'El test pasa correctamente',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Tu test lanza RuntimeException pero el GlobalExceptionHandler solo captura ResourceNotFoundException. ¿Qué código HTTP recibes?',
        '404 Not Found', '400 Bad Request', '500 Internal Server Error — porque la excepción no está capturada por ningún handler', '200 OK',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué necesitas ObjectMapper con JavaTimeModule en los tests de controller?',
        'Para conectar a la BD', 'Para que Jackson sepa serializar LocalDate a JSON (ej: "1989-05-28") — sin eso falla la conversión', 'Para activar las validaciones', 'Es decorativo, no es necesario',
        1, 'MOCKMVC', 'VERDE', NOW());

-- Test de Service vs Test de Controller
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde testeas que @NotBlank rechaza un campo vacío: en el test del Service o del Controller?',
        'En el Service, porque es donde está la lógica', 'En el Controller con MockMvc, porque @Valid se ejecuta en la capa del Controller', 'En ambos por igual', 'En ninguno, las validaciones no se testean',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué testeas en el Service y qué testeas en el Controller?',
        'Lo mismo en ambos', 'Service: lógica de negocio (duplicados, excepciones, transformaciones). Controller: HTTP (códigos de estado, validación, formato JSON)', 'Service: HTTP. Controller: lógica', 'Solo se testea uno de los dos',
        1, 'MOCKMVC', 'VERDE', NOW());

-- =============================================
-- Arquitectura Spring Boot (Entities, DTOs, capas)
-- =============================================

-- Entities y Flyway
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una Entity en Spring Boot?',
        'Un JSON que envía el usuario', 'Una clase Java que representa una tabla de la BD — cada campo es una columna', 'Un controlador REST', 'Un archivo de configuración',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Flyway en un proyecto Spring Boot?',
        'Para hacer tests automáticos', 'Para gestionar migraciones de BD — crea y versiona tablas con scripts SQL (V1__, V2__, etc.)', 'Para desplegar la app en producción', 'Para generar entities automáticamente',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre ddl-auto: validate y ddl-auto: create-drop?',
        'Son lo mismo', 'validate solo comprueba que la Entity coincide con la BD; create-drop crea las tablas al arrancar y las borra al parar', 'validate crea tablas, create-drop las valida', 'validate es para producción, create-drop no existe',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se recomienda ddl-auto: validate + Flyway en producción en vez de ddl-auto: update?',
        'Porque es más rápido', 'Porque Flyway da control total sobre los cambios de BD con scripts versionados, y validate asegura que todo cuadra sin modificar nada automáticamente', 'Porque update no funciona en producción', 'No hay diferencia real',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- DTOs
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un DTO (Data Transfer Object)?',
        'Una tabla de la BD', 'Un objeto que define qué datos entran o salen de la API — separa la Entity de lo que ve el usuario', 'Un tipo de test', 'Un framework de Java',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa un StudentRequest y un StudentResponse en vez de usar la Entity Student directamente?',
        'Por convención, pero no es necesario', 'Para no exponer campos internos (id, createdAt) en el request, y para controlar exactamente qué devuelve la API en el response', 'Porque Spring lo obliga', 'Para que el código sea más largo',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema hay si usas la Entity directamente como @RequestBody en el Controller?',
        'Ninguno, funciona perfecto', 'El usuario podría enviar campos como id, createdAt o activo y modificar datos que no debería tocar', 'Spring no lo permite', 'La app no compila',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Capas del Service
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son las 3 capas principales de una API REST en Spring Boot?',
        'HTML, CSS, JavaScript', 'Controller (HTTP) → Service (lógica de negocio) → Repository (acceso a BD)', 'Entity, DTO, Config', 'Frontend, Backend, Base de datos',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde va la lógica de negocio como "verificar si un DNI ya existe antes de crear"?',
        'En el Controller', 'En el Service', 'En el Repository', 'En el DTO',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Transactional en un método del Service?',
        'Hace el método más rápido', 'Asegura que si algo falla a mitad de la operación, todos los cambios en BD se deshacen (rollback)', 'Activa las validaciones', 'Permite llamar a otros services',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Controller y códigos HTTP
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación convierte una clase en un endpoint REST en Spring Boot?',
        '@Service', '@Entity', '@RestController', '@Component',
        2, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP corresponde a cada operación CRUD?',
        'GET=Create, POST=Read, PUT=Update, DELETE=Delete', 'POST=Create, GET=Read, PUT=Update, DELETE=Delete', 'PUT=Create, GET=Read, POST=Update, DELETE=Delete', 'POST=Create, PUT=Read, GET=Update, DELETE=Delete',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Tests de integración
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test unitario (Mockito) y uno de integración (@SpringBootTest)?',
        'Son lo mismo con diferente nombre', 'El unitario testea una clase aislada con mocks; el de integración levanta la app completa con BD real y testea todo junto', 'El unitario es para producción, el de integración para desarrollo', 'El de integración es más rápido',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa H2 (BD en memoria) para tests de integración en vez de PostgreSQL?',
        'Porque H2 es mejor que PostgreSQL', 'Porque H2 es rápida, no necesita instalación, y se crea/destruye con cada test — ideal para tests aislados y repetibles', 'Porque PostgreSQL no soporta tests', 'No hay razón, es costumbre',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Transactional en un test de integración?',
        'Para que el test sea más rápido', 'Para que los datos insertados durante el test se deshagan automáticamente (rollback) y no contaminen otros tests', 'Para activar las validaciones', 'Para conectar a la BD de producción',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Un test de integración falla con 409 Conflict al crear un estudiante. ¿Cuál es la causa más probable?',
        'El controller tiene un bug', 'Ya existe un registro con ese DNI en la BD — los datos de un test anterior no se limpiaron', 'El mock está mal configurado', 'H2 no soporta INSERT',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ActiveProfiles("test") en un test de integración?',
        'Activa el modo debug', 'Carga application-test.yml en vez del application.yml normal — permite usar otra BD o configuración para tests', 'Desactiva las validaciones', 'Hace que los tests corran más rápido',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- ============================================================
-- SPRING_CORE
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre BeanFactory y ApplicationContext en Spring?',
        'Son exactamente lo mismo', 'BeanFactory es el contenedor básico con lazy init; ApplicationContext lo extiende con i18n, eventos, AOP, y carga beans eagerly', 'ApplicationContext solo sirve para web', 'BeanFactory es más moderno',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el scope por defecto de un bean en Spring?',
        'prototype', 'singleton', 'request', 'session',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si tienes dos beans del mismo tipo y usas @Autowired sin @Qualifier?',
        'Spring elige el primero que encuentra', 'Spring lanza NoUniqueBeanDefinitionException al arrancar', 'Spring inyecta null', 'Spring crea un proxy que delega a ambos',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Primary en Spring?',
        'Para marcar el bean como el más importante en rendimiento', 'Para indicar a Spring cuál bean debe usarse por defecto cuando hay múltiples candidatos del mismo tipo', 'Para que el bean se inicie antes que los demás', 'Para deshabilitar otros beans del mismo tipo',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se ejecuta después de que el bean es construido e inyectadas sus dependencias?',
        '@AfterInit', '@PostConstruct', '@BeanReady', '@OnCreated',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Un bean singleton scope tiene una dependencia de scope prototype. ¿Qué problema ocurre?',
        'Ninguno, funciona perfecto', 'El bean prototype se crea una sola vez e inyecta siempre la misma instancia, perdiendo el comportamiento prototype — se llama "scoped bean injection problem"', 'Spring lanza un error al arrancar', 'El singleton se convierte en prototype automáticamente',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @Component, @Service y @Repository?',
        '@Service y @Repository tienen comportamiento especial; @Component no', 'Semánticamente son iguales (@Component es la meta-anotación), pero @Repository activa traducción de excepciones de persistencia a DataAccessException', 'Son completamente distintos sin relación', '@Repository solo funciona con JPA',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Conditional en Spring?',
        'Ejecuta código condicionalmente en runtime', 'Registra un bean en el contexto solo si se cumple una condición determinada (matches() devuelve true)', 'Marca una propiedad como opcional', 'Sustituye a @Profile',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo resuelve Spring una dependencia circular entre BeanA y BeanB con inyección por constructor?',
        'La resuelve automáticamente con un proxy', 'Lanza BeanCurrentlyInCreationException — las dependencias circulares por constructor no se pueden resolver', 'Inyecta null en uno de los dos', 'Crea ambos beans vacíos y los conecta después',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Configuration y @Component?',
        'Son idénticos', '@Configuration garantiza que los @Bean methods devuelven beans del contexto (usa CGLIB proxy), por lo que múltiples llamadas devuelven el mismo bean. @Component no hace esto', 'Solo @Configuration puede tener @Bean methods', '@Component es para clases de configuración',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un BeanPostProcessor?',
        'Un listener de eventos de Spring', 'Una interfaz que permite modificar beans recién creados antes y después de la inicialización — base de muchas características de Spring (AOP, @Autowired)', 'Un validador de beans', 'Una factoría de beans',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué se usa @Profile("prod") en un bean?',
        'Para que el bean solo funcione más rápido en producción', 'Para que el bean solo sea registrado cuando el perfil activo sea "prod"', 'Para desactivar el bean en producción', 'Para configurar el entorno de producción automáticamente',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo de proxy usa Spring AOP por defecto para beans que implementan una interfaz?',
        'CGLIB proxy', 'JDK dynamic proxy', 'Javassist proxy', 'ASM proxy',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se ejecuta @PreDestroy en un bean?',
        'Cuando se lanza una excepción', 'Antes de que el bean sea destruido, cuando el contexto de Spring se cierra', 'Antes de que el bean sea creado', 'Cuando se llama a beanFactory.getBean()',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué scope debe usarse para un bean que debe ser nuevo en cada petición HTTP?',
        'singleton', 'prototype', 'request', 'session',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si llamas a un @Bean method dentro de una clase @Configuration desde otro @Bean method?',
        'Se crea una nueva instancia cada vez', 'Spring intercepta la llamada mediante CGLIB y devuelve el bean existente del contexto, no crea una nueva instancia', 'Lanza StackOverflowError', 'Solo funciona si el método es static',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En AOP, ¿qué es un "pointcut"?',
        'El código que se ejecuta en el aspecto', 'Una expresión que define dónde (en qué métodos/clases) se aplica un advice', 'Un tipo de proxy', 'Una anotación de Spring',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la forma de inyección de dependencias más recomendada en Spring moderno y por qué?',
        'Inyección por campo (@Autowired en el campo) porque es la más simple', 'Inyección por constructor porque hace las dependencias explícitas, facilita los tests y el bean es inmutable', 'Inyección por setter para todo', 'Lookup method injection siempre',
        1, 'SPRING_CORE', 'MARRON', NOW());

-- ============================================================
-- SPRING_BOOT
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo funciona la auto-configuración de Spring Boot?',
        'Lee un archivo XML al arrancar', 'Escanea el classpath y aplica @Configuration classes condicionalmente (via spring.factories o META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports)', 'Lee todas las anotaciones de tu proyecto', 'Conecta a un servidor remoto para descargar configuración',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ConditionalOnClass(DataSource.class) en una auto-configuración?',
        'Verifica que DataSource esté instanciado', 'Registra la configuración solo si la clase DataSource está presente en el classpath', 'Inyecta DataSource automáticamente', 'Lanza error si DataSource no está disponible',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la ventaja de usar @ConfigurationProperties sobre @Value?',
        '@Value es más moderno', '@ConfigurationProperties permite agrupar propiedades relacionadas en un POJO tipado con validación, refactoring más fácil y soporte IDE', '@ConfigurationProperties es más rápido', '@Value no funciona con YAML',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué endpoint del Actuator devuelve el estado de salud de la aplicación?',
        '/actuator/status', '/actuator/health', '/actuator/alive', '/actuator/ping',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Por defecto, ¿cuántos endpoints del Actuator están expuestos sobre HTTP?',
        'Todos', 'Solo /health e /info', 'Ninguno', 'Solo /metrics',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Boot DevTools cuando detecta un cambio en clases compiladas?',
        'Reinicia la JVM completa', 'Hace un restart rápido recargando solo el classloader de la aplicación, no el de las librerías', 'Compila automáticamente el código fuente', 'Detiene la aplicación y espera un comando manual',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el servidor embebido por defecto en Spring Boot?',
        'Jetty', 'Undertow', 'Tomcat', 'Netty',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué propiedad en application.properties define el puerto del servidor?',
        'spring.port', 'server.port', 'application.port', 'spring.server.port',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @SpringBootApplication?',
        'Solo activa el component scan', 'Es una meta-anotación que combina @Configuration, @EnableAutoConfiguration y @ComponentScan', 'Solo habilita auto-configuración', 'Registra la aplicación en Eureka',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si defines la misma propiedad en application.properties y como variable de entorno?',
        'application.properties siempre gana', 'La variable de entorno tiene mayor precedencia que application.properties', 'Lanza una excepción de conflicto', 'Se usan ambas de forma aleatoria',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el Actuator endpoint /actuator/env?',
        'Para ver las variables de entorno del SO', 'Para ver todas las propiedades de configuración activas y su origen (fichero, env var, default)', 'Para modificar propiedades en caliente', 'Para ver los beans del contexto',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "starter" en Spring Boot?',
        'Una plantilla de proyecto', 'Una dependencia de conveniencia que agrupa librerías relacionadas con su auto-configuración — por ejemplo spring-boot-starter-web incluye Tomcat, Spring MVC, Jackson', 'Un plugin de Maven/Gradle', 'Un script de inicio',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura el graceful shutdown en Spring Boot 2.3+?',
        'Implementando ShutdownHook manualmente', 'Con server.shutdown=graceful — espera a que las peticiones activas terminen antes de cerrar', 'Sobrescribiendo el método close()', 'Es automático, no requiere configuración',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre application.properties y application.yml?',
        'YAML soporta más propiedades', 'Son equivalentes en funcionalidad; YAML soporta estructuras jerárquicas y listas de forma más legible, pero ambos expresan la misma configuración', 'application.properties es más moderno', 'YAML solo funciona en producción',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué evento de Spring Boot se lanza justo ANTES de que el contexto sea refrescado?',
        'ApplicationStartedEvent', 'ApplicationContextInitializedEvent', 'ApplicationEnvironmentPreparedEvent', 'ApplicationReadyEvent',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @ConditionalOnMissingBean?',
        'Para registrar un bean si no hay ningún bean del tipo especificado ya en el contexto — permite que el usuario override la auto-configuración', 'Para verificar que el bean no sea null', 'Para crear el bean solo en tests', 'Para evitar duplicados en el contexto',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace el endpoint /actuator/metrics?',
        'Muestra el uso de CPU del servidor', 'Expone métricas de la aplicación (JVM, HTTP requests, custom) compatibles con sistemas como Prometheus/Micrometer', 'Muestra el tamaño del código', 'Solo muestra métricas de base de datos',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En Spring Boot, ¿cuál es el orden correcto de precedencia de propiedades (mayor a menor)?',
        'application.properties > variables de entorno > argumentos de línea de comandos', 'Argumentos de línea de comandos > variables de entorno > application.properties', 'Variables de entorno > application.properties > argumentos de línea de comandos', 'Todas tienen la misma precedencia',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

-- ============================================================
-- SPRING_DATA_JPA
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el problema N+1 en JPA?',
        'Un error cuando hay más de N entidades', 'Al cargar N entidades padre, se lanzan N queries adicionales para cargar sus colecciones — en total N+1 queries en vez de 1', 'Un límite de JPA en el número de joins', 'Un bug conocido de Hibernate',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se resuelve el problema N+1 con JPQL?',
        'Usando @Lazy en la relación', 'Usando JOIN FETCH en la query para traer la colección en una sola consulta', 'Poniendo FetchType.EAGER', 'Usando @Query(nativeQuery = true)',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Modifying cuando se combina con @Query?',
        'Hace la query más rápida', 'Indica que la query es un UPDATE o DELETE, habilitando la ejecución de queries de modificación en Spring Data JPA', 'Modifica el resultado de la query', 'Activa el caché de queries',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre CascadeType.REMOVE y orphanRemoval=true?',
        'Son lo mismo', 'CascadeType.REMOVE elimina los hijos al eliminar el padre; orphanRemoval también elimina hijos que son desvinculados de la colección del padre sin necesidad de eliminar el padre', 'orphanRemoval es más rápido', 'CascadeType.REMOVE solo funciona con OneToMany',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué devuelve un método de repositorio que retorna Page<T> vs Slice<T>?',
        'Son idénticos', 'Page<T> incluye el conteo total de elementos (ejecuta un COUNT query adicional); Slice<T> solo sabe si hay siguiente página sin hacer COUNT', 'Slice<T> incluye metadata adicional', 'Page<T> solo funciona con SQL nativo',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Version en una entidad JPA?',
        'Para guardar la versión de la aplicación', 'Para implementar optimistic locking — si dos transacciones intentan actualizar la misma entidad, la segunda falla con OptimisticLockException', 'Para controlar migraciones de esquema', 'Para versionar el esquema de la tabla',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @EntityGraph en Spring Data JPA?',
        'Define la estructura de la tabla', 'Permite especificar qué asociaciones deben cargarse eagerly para una query específica, sin modificar la entidad', 'Dibuja el gráfico de entidades relacionadas', 'Es un alias de @Query',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la propagación por defecto de @Transactional?',
        'REQUIRES_NEW', 'MANDATORY', 'REQUIRED', 'NESTED',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Con PROPAGATION_REQUIRES_NEW, ¿qué ocurre con la transacción existente al llamar al método?',
        'Se usa la misma transacción', 'La transacción existente se suspende y se crea una nueva transacción independiente', 'Lanza una excepción', 'Se hace un savepoint',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una Projection Interface en Spring Data JPA?',
        'Una interfaz que extiende JpaRepository', 'Una interfaz con getters que mapean solo las columnas que necesitas, evitando traer toda la entidad — mejora rendimiento', 'Una interfaz para proyectar entidades a DTOs con MapStruct', 'Una interfaz para auditoría',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotaciones de Spring Data provee @CreatedDate y @LastModifiedDate?',
        'Requieren implementar Auditable manualmente', 'Forman parte de Spring Data Auditing — se activan con @EnableJpaAuditing y @EntityListeners(AuditingEntityListener.class)', 'Son anotaciones de Hibernate, no de Spring', 'Solo funcionan con MongoDB',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se define una relación ManyToMany con tabla intermedia personalizada en JPA?',
        'Con @ManyToMany(table="nombre")', 'Con @ManyToMany y @JoinTable especificando joinColumns y inverseJoinColumns', 'ManyToMany no permite tabla intermedia personalizada', 'Creando una entidad intermedia con @OneToMany en ambos lados',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se lanza LazyInitializationException?',
        'Cuando usas FetchType.EAGER', 'Al acceder a una colección lazy fuera del contexto de una transacción/sesión JPA activa', 'Cuando la colección está vacía', 'Solo en tests de integración',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la Specification API de Spring Data JPA?',
        'Una API para definir el esquema de la BD', 'Una forma de construir queries dinámicas y componibles usando el patrón Specification, combinables con and()/or()', 'Una API REST para especificaciones de endpoints', 'Una alternativa a JPA para bases NoSQL',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el FetchType por defecto de una relación @OneToMany?',
        'EAGER', 'LAZY', 'JOIN', 'SELECT',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué nivel de aislamiento evita "dirty reads" pero permite "non-repeatable reads"?',
        'READ_UNCOMMITTED', 'READ_COMMITTED', 'REPEATABLE_READ', 'SERIALIZABLE',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace save() en SimpleJpaRepository cuando la entidad ya tiene un ID asignado?',
        'Siempre hace INSERT', 'Llama a merge() — actualiza si existe, inserta si no (comportamiento de EntityManager.merge())', 'Lanza una excepción de duplicado', 'Siempre hace UPDATE',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se recomienda usar LAZY loading en @ManyToOne?',
        'LAZY es el default en @ManyToOne', 'Para evitar cargar innecesariamente la entidad padre cada vez que se accede al hijo, mejorando el rendimiento cuando no se necesita el padre', '@ManyToOne no soporta EAGER', 'LAZY es obligatorio en relaciones bidireccionales',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

-- ============================================================
-- SPRING_SECURITY
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Autenticación y Autorización?',
        'Son sinónimos en seguridad', 'Autenticación verifica QUIÉN eres (identidad); Autorización verifica QUÉ puedes hacer (permisos)', 'Autorización ocurre antes que la autenticación', 'Autenticación solo aplica a APIs REST',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa BCrypt para hashear contraseñas en lugar de MD5 o SHA?',
        'BCrypt es más rápido', 'BCrypt incluye salt automático y es intencionalmente lento/costoso computacionalmente, dificultando ataques de fuerza bruta', 'BCrypt es un estándar de Spring, no de seguridad', 'MD5 está desactivado en Java 17',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué debe devolver UserDetailsService.loadUserByUsername()?',
        'Un String con el rol del usuario', 'Un objeto UserDetails con username, password hasheado y authorities', 'Un objeto Authentication', 'Un JWT token',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace sessionManagement().sessionCreationPolicy(STATELESS)?',
        'Deshabilita las sesiones HTTP y Spring Security no creará ni usará HttpSession — requerido para APIs REST con JWT', 'Hace que las sesiones duren menos tiempo', 'Activa Redis para sesiones distribuidas', 'Restringe a un solo usuario simultáneo',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿En qué parte del JWT se almacenan los claims (como username y roles)?',
        'En el Header', 'En el Payload (segunda parte del token, codificada en Base64)', 'En la Signature', 'En el Issuer',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué las APIs REST con JWT generalmente deshabilitan la protección CSRF?',
        'CSRF solo aplica a aplicaciones móviles', 'Porque CSRF explota cookies de sesión; al usar JWT en Authorization header (no en cookie), el vector de ataque CSRF no aplica', 'Porque Spring Security no soporta CSRF y JWT juntos', 'Para mejorar el rendimiento',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @PreAuthorize y @Secured?',
        'Son idénticos', '@PreAuthorize soporta SpEL (Spring Expression Language) permitiendo expresiones como hasRole() && #id == authentication.name; @Secured solo soporta lista de roles', '@Secured es más moderno', '@PreAuthorize solo funciona en controllers',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se habilita la seguridad a nivel de método en Spring?',
        'Es automático con @EnableWebSecurity', 'Añadiendo @EnableMethodSecurity (o @EnableGlobalMethodSecurity en versiones anteriores) a una clase @Configuration', 'Implementando MethodSecurityInterceptor manualmente', 'Configurando security.method=true en properties',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde se almacena el objeto Authentication durante una petición en Spring Security?',
        'En la HttpSession', 'En el SecurityContextHolder que usa un ThreadLocal por defecto', 'En el bean Authentication global', 'En un cookie de seguridad',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un OncePerRequestFilter en Spring Security?',
        'Un filtro que solo ejecuta la lógica una vez por petición HTTP, garantizando que no se ejecute dos veces en caso de forwards/includes', 'Un filtro que limita a una petición por segundo', 'Un filtro de rate limiting', 'Un filtro para peticiones de un solo uso',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura CORS en Spring Security para APIs REST?',
        'Solo con @CrossOrigin en el controller', 'Configurando cors().configurationSource() en el SecurityFilterChain y/o usando @CrossOrigin — Spring Security debe procesar CORS antes de validar autenticación', 'CORS no se puede configurar con Spring Security', 'Deshabilitando Spring Security',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En OAuth2, ¿qué es un "Resource Server"?',
        'El servidor que emite tokens', 'El servidor que protege recursos y valida tokens presentados por los clientes', 'El navegador del usuario', 'La base de datos de usuarios',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué retorna http.authorizeHttpRequests().requestMatchers("/public/**").permitAll()?',
        'Hace que /public/** requiera autenticación', 'Permite acceso sin autenticación a cualquier URL que empiece con /public/', 'Solo permite acceso a usuarios con rol PUBLIC', 'Deshabilita Spring Security para esas rutas',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué status HTTP devuelve Spring Security cuando el usuario está autenticado pero no tiene permiso para acceder al recurso?',
        '401 Unauthorized', '403 Forbidden', '404 Not Found', '400 Bad Request',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo devuelve Spring Security 401 vs 403?',
        '401 si no tienes permiso, 403 si no estás autenticado', '401 cuando no estás autenticado (no hay credenciales válidas); 403 cuando estás autenticado pero no tienes suficientes permisos', 'Son lo mismo', '401 solo para APIs, 403 solo para web',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema tiene guardar el JWT en localStorage?',
        'Ninguno, es la práctica recomendada', 'Es vulnerable a ataques XSS — cualquier script malicioso puede leer localStorage. Las cookies HttpOnly son más seguras contra XSS', 'localStorage no está disponible en todos los navegadores modernos', 'El JWT no cabe en localStorage',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace PasswordEncoder.matches(rawPassword, encodedPassword)?',
        'Encripta rawPassword y compara los hashes', 'Verifica si rawPassword corresponde al encodedPassword sin necesidad de desencriptar (usando el mismo algoritmo)', 'Desencripta encodedPassword y compara con rawPassword', 'Actualiza el hash en la base de datos',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

-- ============================================================
-- REST_API
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el código HTTP correcto al crear un recurso exitosamente con POST?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia semántica entre PUT y PATCH?',
        'PUT y PATCH son intercambiables', 'PUT reemplaza el recurso completo; PATCH aplica una modificación parcial al recurso', 'PATCH es idempotente, PUT no', 'PUT solo funciona con JSON',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP debe devolver un DELETE exitoso cuando no hay cuerpo en la respuesta?',
        '200 OK', '201 Created', '204 No Content', '202 Accepted',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa que un método HTTP sea "idempotente"?',
        'Que devuelve el mismo resultado siempre', 'Que ejecutarlo múltiples veces produce el mismo efecto en el servidor que ejecutarlo una sola vez', 'Que no modifica datos', 'Que es seguro usarlo sin autenticación',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @PathVariable y @RequestParam?',
        'Son idénticos', '@PathVariable extrae valor de la URL path (/usuarios/{id}); @RequestParam extrae del query string (/usuarios?page=1)', '@RequestParam es más seguro', '@PathVariable solo funciona con GET',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es apropiado usar 422 Unprocessable Entity vs 400 Bad Request?',
        'Son equivalentes', '400 para errores de sintaxis/formato (JSON malformado); 422 cuando el formato es correcto pero los datos no pasan validación de negocio', '422 solo para errores de base de datos', '400 es obsoleto, usar 422 siempre',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ventaja tiene usar ResponseEntity<?> en lugar de devolver directamente el objeto?',
        'ResponseEntity es más rápido', 'Permite controlar explícitamente el status code, headers y body de la respuesta HTTP', 'ResponseEntity serializa automáticamente a XML', 'Solo ResponseEntity funciona con @RestController',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es HATEOAS en APIs REST?',
        'Un protocolo de autenticación para REST', 'Hypermedia As The Engine Of Application State — las respuestas incluyen links a las acciones disponibles, haciendo la API autodescubrible', 'Un formato de respuesta JSON', 'Una estrategia de versionado de APIs',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estrategia de versionado de API más común en la URL?',
        'Usando headers HTTP', 'Incluyendo la versión en la URI: /api/v1/usuarios — simple y visible aunque viola el principio REST de URI estable', 'Usando query parameters: /api/usuarios?version=1', 'Versionado por fecha: /api/2024-01/usuarios',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP debe devolverse al intentar crear un recurso que ya existe (ej: email duplicado)?',
        '400 Bad Request', '404 Not Found', '409 Conflict', '422 Unprocessable Entity',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se implementa paginación correctamente en una API REST?',
        'Devolviendo siempre todos los registros', 'Aceptando parámetros page/size en el query string y devolviendo metadata (total, hasNext) junto con los datos', 'Usando cursores siempre', 'La paginación viola los principios REST',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se sube un archivo con Spring MVC?',
        'Con @RequestBody byte[]', 'Recibiendo un parámetro de tipo MultipartFile y el request con multipart/form-data content type', 'Con @FileUpload en el método', 'Enviando el archivo codificado en Base64 en el JSON',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la negociación de contenido (content negotiation) en REST?',
        'Negociar el precio del API', 'El mecanismo por el que cliente y servidor acuerdan el formato de datos (JSON, XML, etc) usando headers Accept y Content-Type', 'La compresión automática de respuestas', 'El proceso de autenticación del cliente',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Al diseñar una API REST, ¿dónde se debe incluir el Location header?',
        'En todas las respuestas', 'En las respuestas 201 Created, indicando la URL del recurso recién creado', 'Solo en respuestas de error', 'En respuestas de autenticación',
        1, 'REST_API', 'VERDE', NOW());

-- ============================================================
-- LAMBDAS_STREAMS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué interfaz funcional usarías para una función que recibe un String y devuelve un Integer?',
        'Consumer<String>', 'Supplier<Integer>', 'Function<String, Integer>', 'Predicate<String>',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la evaluación lazy en los Streams de Java?',
        'Los streams son lentos por naturaleza', 'Las operaciones intermedias (map, filter) no se ejecutan hasta que se invoca una operación terminal (collect, forEach) — permite optimizaciones', 'Los streams se ejecutan en un hilo separado', 'La evaluación lazy solo aplica a parallel streams',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre map() y flatMap() en Streams?',
        'flatMap() es más rápido', 'map() aplica una función 1-a-1; flatMap() aplica una función que devuelve un Stream y los aplana, útil para colecciones de colecciones', 'map() solo funciona con números', 'flatMap() no existe en Java 8',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.groupingBy()?',
        'Ordena los elementos por un criterio', 'Agrupa los elementos del Stream en un Map<K, List<V>> según la función clasificadora', 'Filtra elementos duplicados', 'Une todos los elementos en un String',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si intentas usar un Stream dos veces?',
        'Funciona normalmente', 'Lanza IllegalStateException porque un Stream solo puede consumirse una vez', 'Devuelve los resultados duplicados', 'Crea automáticamente un nuevo Stream',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Optional.orElse() y Optional.orElseGet()?',
        'Son idénticos', 'orElse() siempre evalúa el argumento (incluso si el Optional tiene valor); orElseGet() recibe un Supplier que solo se invoca si el Optional está vacío — más eficiente para operaciones costosas', 'orElseGet() es obsoleto en Java 11', 'orElse() lanza excepción si está vacío',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué interfaz funcional usarías para una operación que consume un valor pero no devuelve nada?',
        'Function<T, Void>', 'Supplier<T>', 'Consumer<T>', 'Predicate<T>',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es apropiado usar un parallel stream?',
        'Siempre, para maximizar rendimiento', 'Para operaciones CPU-intensivas sobre colecciones grandes donde el overhead de paralelismo se amortiza — NO para operaciones I/O o colecciones pequeñas', 'Para todas las operaciones de ordenamiento', 'Cuando se usan más de 2 núcleos en el servidor',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Stream.peek()?',
        'Comprueba si el stream tiene elementos', 'Es una operación intermedia que permite ejecutar una acción (como logging) en cada elemento sin modificarlo — útil para debugging', 'Devuelve el primer elemento', 'Pausa el stream hasta que se consuma',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se convierte una lista de strings a un solo String separado por comas con Streams?',
        'list.stream().reduce(",", String::concat)', 'list.stream().collect(Collectors.joining(", "))', 'list.stream().collect(Collectors.toList())', 'String.join(list)',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una referencia a método estático en Java?',
        'Una lambda que referencia a un field estático', 'La forma compacta ClassName::methodName para referenciar un método estático como lambda — equivalente a x -> ClassName.methodName(x)', 'Un método que no puede ser sobrescrito', 'Una referencia a un método de instancia',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.partitioningBy()?',
        'Divide el stream en N partes iguales', 'Divide los elementos en dos grupos (true/false) según un Predicate, devolviendo Map<Boolean, List<T>>', 'Filtra elementos según un criterio', 'Ordena y divide por rangos',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si una lambda captura una variable local?',
        'La variable se serializa automáticamente', 'La variable debe ser efectivamente final (no modificada después de la captura) — de lo contrario el compilador da error', 'Las lambdas no pueden capturar variables locales', 'La variable se copia automáticamente como final',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre Stream.of() y Arrays.stream() para arrays de primitivos?',
        'Son idénticos', 'Arrays.stream(int[]) devuelve IntStream (sin boxing); Stream.of(int[]) devolvería Stream<int[]> — un Stream con un solo elemento que es el array completo', 'Stream.of() es más eficiente', 'Arrays.stream() requiere Java 11',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el propósito de Optional en Java?',
        'Mejorar el rendimiento evitando null checks', 'Representar explícitamente la posibilidad de ausencia de un valor, forzando al programador a manejar el caso vacío y eliminando NullPointerExceptions implícitos', 'Envolver objetos para serialización', 'Reemplazar completamente null en Java',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace reduce() en un Stream?',
        'Reduce el tamaño del stream filtrando elementos', 'Combina todos los elementos del stream en un único valor aplicando una función acumuladora de forma sucesiva', 'Elimina elementos duplicados', 'Ordena el stream de mayor a menor',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo devuelve Collectors.toMap() cuando hay claves duplicadas sin merge function?',
        'Ignora los duplicados y guarda el primer valor', 'Lanza IllegalStateException por clave duplicada', 'Sobrescribe con el último valor', 'Crea una lista como valor para cada clave duplicada',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

-- ============================================================
-- JAVA_CORE
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo funciona internamente HashMap al hacer put(key, value)?',
        'Busca linealmente hasta encontrar un hueco', 'Calcula hashCode() de la clave, determina el bucket, y si hay colisión almacena en una lista enlazada (o árbol en Java 8+ cuando la lista supera 8 elementos)', 'Ordena las entradas automáticamente', 'Usa una tabla de hashing perfecta sin colisiones',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si sobrescribes equals() pero no hashCode()?',
        'Nada, equals() es suficiente', 'Viola el contrato equals/hashCode: dos objetos iguales según equals() pueden tener hashCodes distintos, rompiendo el comportamiento de HashMap, HashSet, etc.', 'Java lanza una advertencia en compilación', 'El programa lanza NullPointerException',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre TreeMap y LinkedHashMap?',
        'Son idénticos', 'TreeMap ordena por clave natural (o Comparator) en O(log n); LinkedHashMap mantiene el orden de inserción con acceso O(1)', 'LinkedHashMap ordena por valor', 'TreeMap es más rápido en todas las operaciones',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías LinkedList sobre ArrayList?',
        'Siempre, es más moderno', 'Cuando las operaciones dominantes son inserción/eliminación en posiciones arbitrarias (O(1) con iterator) y no acceso aleatorio. En práctica, ArrayList suele ser más rápido por localidad de caché', 'Para almacenar más de 1000 elementos', 'LinkedList ocupa menos memoria que ArrayList',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el String Pool en Java?',
        'Un pool de threads para operaciones de String', 'Un área en el heap (PermGen/Metaspace) donde Java almacena String literals para reutilizarlos — s1 == s2 puede ser true si ambos son literals iguales', 'Una estructura de datos para String eficiente', 'El límite máximo de Strings en memoria',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Comparable y Comparator?',
        'Son lo mismo con diferente sintaxis', 'Comparable define el orden natural en la propia clase (compareTo); Comparator es externo, permite múltiples criterios de ordenamiento sin modificar la clase', 'Comparator es obsoleto desde Java 8', 'Comparable solo funciona con tipos primitivos',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantiza volatile en Java respecto a la visibilidad?',
        'Hace la variable thread-safe para operaciones compuestas', 'Garantiza que las lecturas/escrituras de la variable sean siempre de/a memoria principal, no caché del hilo — garantiza visibilidad pero NO atomicidad para operaciones compuestas como i++', 'Hace la variable inmutable', 'Previene el reordenamiento de instrucciones completamente',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el type erasure en Java Generics?',
        'La eliminación de tipos en tiempo de compilación es un error', 'Los tipos genéricos se borran en tiempo de compilación — en bytecode List<String> y List<Integer> son simplemente List. Impide reflection sobre tipos genéricos', 'Es una optimización de la JVM para Generics', 'El proceso de convertir tipos primitivos a objetos',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre checked y unchecked exceptions?',
        'Solo los unchecked exceptions pueden atrapase', 'Checked exceptions heredan de Exception (no RuntimeException) y el compilador obliga a manejarlas o declararlas; unchecked heredan de RuntimeException y son opcionales', 'Checked exceptions son más graves', 'Solo las unchecked exceptions tienen stack trace',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es try-with-resources en Java?',
        'Una forma de manejar múltiples excepciones en un catch', 'Una sintaxis que garantiza que los recursos que implementan AutoCloseable se cierran automáticamente al salir del bloque, incluso con excepciones', 'Una forma de intentar operaciones con retry automático', 'Un try que no requiere catch',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema puede ocurrir con el autoboxing en colecciones?',
        'Las colecciones no soportan tipos primitivos, pero eso es por diseño', 'Integer cache solo va de -128 a 127: Integer a = 1000; Integer b = 1000; a == b es FALSE (son objetos distintos). Además el boxing/unboxing genera overhead y posibles NullPointerExceptions', 'El autoboxing es siempre seguro y sin problemas', 'Solo ocurre en versiones anteriores a Java 11',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo resuelve Java el "diamond problem" con interfaces default methods?',
        'No lo resuelve, lanza error de compilación siempre', 'Si una clase implementa dos interfaces con el mismo método default, debe sobrescribirlo obligatoriamente; puede llamar a la implementación específica con Interface.super.method()', 'Java prohíbe implementar dos interfaces con métodos del mismo nombre', 'El compilador elige automáticamente el primer método',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es ConcurrentHashMap y cómo difiere de Collections.synchronizedMap()?',
        'Son idénticos en comportamiento', 'ConcurrentHashMap usa segmentación/locks por bucket en Java 8 (CAS operations) permitiendo alta concurrencia; synchronizedMap usa un lock global bloqueando todo el mapa para cada operación', 'ConcurrentHashMap no permite null keys', 'synchronizedMap es más rápido',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CompletableFuture en Java?',
        'Un Future que nunca lanza excepciones', 'Una implementación de Future que permite encadenar operaciones asíncronas (thenApply, thenCompose, thenCombine) y manejar errores sin bloquear el hilo', 'Un thread pool gestionado por la JVM', 'Una forma de ejecutar código en paralelo sin threads',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué String es inmutable en Java?',
        'Por limitaciones de la JVM', 'Por diseño: seguridad (no se puede alterar un String usado como parámetro), thread-safety automático, y permite el String Pool — múltiples referencias al mismo objeto literal', 'Para mejorar el rendimiento de la JVM', 'Porque los chars son primitivos e inmutables',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el wildcard correcto para un método que acepta List de cualquier tipo que sea Number o subclase?',
        'List<Number>', 'List<? super Number>', 'List<? extends Number>', 'List<T extends Number>',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace String.intern()?',
        'Verifica si el String es intern (primitivo)', 'Añade el String al String Pool y devuelve la referencia del pool, permitiendo comparación con == para Strings que no son literals', 'Convierte el String a formato interno UTF-16', 'Elimina espacios del String',
        1, 'JAVA_CORE', 'MARRON', NOW());

-- ============================================================
-- MICROSERVICIOS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los tres estados de un Circuit Breaker?',
        'Abierto, Cerrado, Bloqueado', 'Closed (normal), Open (bloqueando llamadas), Half-Open (probando si el servicio se recuperó)', 'Activo, Inactivo, Degradado', 'Conectado, Desconectado, Reconectando',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se registra un microservicio en Eureka?',
        'Llamando a la API REST de Eureka manualmente', 'Añadiendo spring-cloud-starter-netflix-eureka-client al proyecto y configurando eureka.client.service-url.defaultZone', 'Configurando un DNS especial', 'Registrándolo en el API Gateway',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Saga en microservicios?',
        'Un patrón para diseñar APIs REST', 'Un patrón para gestionar transacciones distribuidas dividiendo la operación en una secuencia de transacciones locales con compensaciones si algo falla', 'Un patrón de caché distribuido', 'Un patrón para descubrimiento de servicios',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Saga coreografía y orquestación?',
        'Son lo mismo con diferente nombre', 'En coreografía cada servicio reacciona a eventos y publica los suyos (sin coordinador central); en orquestación un orquestador central coordina el flujo', 'La orquestación es más escalable siempre', 'La coreografía requiere un message broker, la orquestación no',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CQRS?',
        'Un protocolo de comunicación entre microservicios', 'Command Query Responsibility Segregation — separar el modelo de escritura (commands) del modelo de lectura (queries) para optimizar cada uno independientemente', 'Un sistema de caché para microservicios', 'Un patrón de autenticación distribuida',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve un API Gateway en microservicios?',
        'Solo para balanceo de carga', 'Es el punto de entrada único que maneja routing, autenticación, rate limiting, logging y composición de respuestas de múltiples servicios', 'Solo para documentar APIs', 'Para almacenar datos de sesión',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "idempotent consumer" en sistemas de mensajería?',
        'Un consumidor que solo procesa un mensaje', 'Un consumidor que puede procesar el mismo mensaje múltiples veces sin efectos adversos — crucial en sistemas at-least-once delivery', 'Un consumidor con alta disponibilidad', 'Un consumidor que ignora mensajes duplicados automáticamente',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace un Feign Client en Spring Cloud?',
        'Gestiona conexiones de base de datos remotas', 'Permite llamar a APIs REST de otros servicios de forma declarativa con interfaces Java anotadas, sin escribir código HTTP manual', 'Es un cliente FTP para transferir archivos', 'Gestiona el registro en Eureka',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Strangler Fig en microservicios?',
        'Un patrón para eliminar microservicios obsoletos', 'Una estrategia de migración incremental de monolito a microservicios: se crea el nuevo sistema alrededor del viejo, redirigiendo tráfico gradualmente hasta que el monolito puede eliminarse', 'Un antipatrón que debe evitarse', 'Un patrón para gestionar dependencias circulares',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la consistencia eventual en sistemas distribuidos?',
        'Un bug en sistemas distribuidos que debe corregirse', 'El modelo donde el sistema garantiza que, si no hay más actualizaciones, todos los nodos eventualmente convergen al mismo estado — a cambio de mayor disponibilidad', 'Que todos los nodos siempre tienen los mismos datos', 'Un nivel de aislamiento de base de datos',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es distributed tracing y para qué sirve?',
        'Un sistema de logging centralizado', 'El seguimiento de una petición a través de múltiples microservicios usando trace IDs — permite diagnosticar latencia y errores en sistemas distribuidos (ej: Zipkin, Jaeger)', 'Un sistema de monitoreo de CPU', 'Una técnica de debugging remoto',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el principal beneficio del Config Server de Spring Cloud?',
        'Encripta automáticamente las propiedades', 'Centraliza la configuración de todos los microservicios en un repositorio Git, permitiendo cambios de configuración sin redesplegar los servicios', 'Es más rápido que los archivos properties locales', 'Permite usar YAML en lugar de properties',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Event Sourcing?',
        'El patrón donde en lugar de guardar el estado actual, se guardan todos los eventos que han ocurrido — el estado se reconstruye reproduciéndolos', 'Un sistema de logging de eventos de usuario', 'Una técnica para procesar eventos en tiempo real', 'Un patrón para publicar eventos entre microservicios',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema resuelve el Circuit Breaker pattern?',
        'La autenticación entre microservicios', 'Evita que un fallo en cascada colapse todo el sistema: cuando un servicio falla repetidamente, el circuit breaker "abre" y retorna un fallback inmediato sin esperar timeouts', 'El balanceo de carga entre instancias', 'La sincronización de configuración',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

-- ============================================================
-- DOCKER_DEVOPS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre CMD y ENTRYPOINT en un Dockerfile?',
        'Son idénticos', 'ENTRYPOINT define el ejecutable principal (no se sobreescribe fácilmente); CMD proporciona argumentos por defecto que sí pueden sobreescribirse al ejecutar docker run', 'CMD ejecuta en build time, ENTRYPOINT en runtime', 'ENTRYPOINT solo funciona con scripts shell',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve un multi-stage build en Docker?',
        'Para construir imágenes en múltiples servidores', 'Para separar el entorno de compilación del de ejecución — compilas en una imagen completa (con JDK, Maven) y copias solo el artefacto final a una imagen mínima (JRE), reduciendo el tamaño', 'Para ejecutar múltiples aplicaciones en un contenedor', 'Para crear múltiples versiones de la imagen simultáneamente',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace COPY vs ADD en Dockerfile?',
        'Son idénticos', 'COPY copia ficheros locales; ADD también puede descomprimir tar.gz locales y descargar URLs remotas — se recomienda COPY por claridad salvo que necesites las funcionalidades extra de ADD', 'ADD es más eficiente', 'COPY requiere permisos de root',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué el orden de las instrucciones en un Dockerfile importa?',
        'No importa, Docker optimiza el orden', 'Docker cachea las capas — si una capa cambia, todas las posteriores se invalidan. Se deben poner las instrucciones que cambian menos (dependencias) antes que el código fuente', 'Solo importa la primera y última instrucción', 'Importa solo en multi-stage builds',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un volumen en Docker y para qué se usa?',
        'La memoria RAM asignada al contenedor', 'Un mecanismo para persistir datos fuera del contenedor — los datos sobreviven al contenedor y pueden compartirse entre contenedores', 'El espacio en disco máximo del contenedor', 'Un tipo especial de red Docker',
        1, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre contenedor y máquina virtual?',
        'Son idénticos tecnológicamente', 'Los contenedores comparten el kernel del SO host siendo más ligeros y rápidos; las VMs virtualizan hardware completo con su propio kernel — los contenedores sacrifican aislamiento por eficiencia', 'Las VMs son más seguras siempre', 'Los contenedores solo funcionan en Linux',
        1, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve .dockerignore?',
        'Para ignorar errores de Docker build', 'Para excluir ficheros/directorios del contexto de build de Docker, evitando enviar archivos innecesarios (node_modules, .git, .env) al daemon', 'Para ignorar imágenes obsoletas', 'Para excluir contenedores del docker-compose',
        1, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un health check en Docker?',
        'Un comando que verifica si Docker Desktop está instalado', 'Una instrucción que permite a Docker saber si el contenedor está sano — ejecuta un comando periódicamente y marca el contenedor como healthy/unhealthy', 'Un monitoreo del uso de CPU del contenedor', 'Una verificación de la imagen antes de ejecutar',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace depends_on en docker-compose?',
        'Comparte variables entre servicios', 'Establece el orden de arranque de los servicios — pero OJO: solo espera a que el contenedor inicie, no a que la aplicación dentro esté lista', 'Copia ficheros entre servicios', 'Establece dependencias de red',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los "layered JARs" en Spring Boot y por qué mejoran Docker?',
        'JARs divididos en múltiples archivos ZIP', 'Spring Boot 2.3+ puede crear JARs con capas separadas (dependencies, snapshot-dependencies, application) que se mapean a capas Docker — el código de aplicación cambia frecuentemente pero las dependencias no, optimizando el caché', 'JARs que cargan clases de forma lazy', 'Una forma de comprimir el JAR final',
        1, 'DOCKER_DEVOPS', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son las etapas típicas de un pipeline CI/CD?',
        'Solo build y deploy', 'Source → Build → Test → Staging deploy → Production deploy (con posibles etapas de análisis de código, seguridad, etc.)', 'Commit → Push → Done', 'Build → Deploy → Test',
        1, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En GitHub Actions, ¿qué es un "workflow"?',
        'Un script de bash que se ejecuta en el servidor', 'Un fichero YAML en .github/workflows/ que define un proceso automatizado con triggers (push, PR) y jobs con steps', 'Un plugin de GitHub para CI/CD', 'Un contenedor Docker con instrucciones de build',
        1, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es mala práctica poner secretos (passwords, API keys) como ENV en un Dockerfile?',
        'ENV no funciona para datos sensibles', 'Los valores ENV quedan grabados en las capas de la imagen y son visibles con docker inspect o docker history — deben pasarse en runtime con -e o usando Docker secrets/Kubernetes secrets', 'Solo es problema en imágenes públicas', 'ENV se borra automáticamente después del build',
        1, 'DOCKER_DEVOPS', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la instrucción EXPOSE en un Dockerfile?',
        'Abre el puerto del contenedor para acceso externo', 'Es documentación que indica qué puertos usa el contenedor — NO publica el puerto automáticamente; para eso se usa -p al ejecutar docker run', 'Configura el firewall del contenedor', 'Conecta el contenedor a una red',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

-- ============================================================
-- PATRONES_DISENO
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la forma más segura de implementar Singleton en Java moderno?',
        'Usando un campo static con double-checked locking', 'Usando un enum — garantiza una sola instancia, thread-safe por la JVM, y sobrevive a serialización correctamente', 'Usando synchronized en el constructor', 'Usando volatile en el campo estático',
        1, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Factory Method y Abstract Factory?',
        'Son el mismo patrón', 'Factory Method define un método para crear un objeto, dejando que las subclases decidan la clase concreta; Abstract Factory proporciona una interfaz para crear familias de objetos relacionados', 'Abstract Factory es más moderno', 'Factory Method crea múltiples objetos, Abstract Factory uno solo',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Builder?',
        'Para construir interfaces gráficas', 'Para construir objetos complejos paso a paso, separando la construcción de la representación — especialmente útil cuando hay muchos parámetros opcionales', 'Para el patrón Repository', 'Para implementar constructores en interfaces',
        1, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema resuelve el patrón Strategy?',
        'Permite crear múltiples instancias de una clase', 'Define una familia de algoritmos intercambiables encapsulados en clases, permitiendo cambiar el algoritmo en runtime sin modificar el cliente', 'Gestiona el ciclo de vida de objetos', 'Sincroniza acceso concurrente',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo implementa Spring el patrón Repository?',
        'Mediante herencia de clases abstractas', 'Las interfaces que extienden JpaRepository/CrudRepository — Spring genera la implementación en tiempo de ejecución mediante proxies', 'Mediante anotaciones XML', 'Requiere implementación manual del patrón',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál de los principios SOLID establece que una clase debe tener solo una razón para cambiar?',
        'Open/Closed Principle', 'Single Responsibility Principle', 'Liskov Substitution Principle', 'Interface Segregation Principle',
        1, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué establece el Liskov Substitution Principle?',
        'Las clases base no deben conocer sus subclases', 'Si S es subtipo de T, los objetos de T en un programa pueden reemplazarse por objetos de S sin alterar el comportamiento correcto del programa', 'Las interfaces deben ser pequeñas y específicas', 'El código debe abierto para extensión y cerrado para modificación',
        1, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Observer?',
        'Para observar el rendimiento de la aplicación', 'Define una dependencia uno-a-muchos donde cuando un objeto (subject) cambia de estado, todos sus dependientes (observers) son notificados automáticamente', 'Para monitorear excepciones', 'Para implementar logging en Spring',
        1, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón DTO (Data Transfer Object)?',
        'Un objeto que se persiste en la base de datos', 'Un objeto simple que transporta datos entre capas (ej: de controller a service) sin lógica de negocio, desacoplando la API del modelo de dominio', 'Un patrón para transferir archivos entre microservicios', 'Un objeto inmutable para configuración',
        1, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo implementa Spring AOP el patrón Proxy?',
        'Creando subclases en tiempo de compilación', 'Wrapping beans con proxies JDK (si implementan interfaz) o CGLIB (si no) que interceptan llamadas a métodos para aplicar advice antes/después de la ejecución', 'Modificando el bytecode en tiempo de ejecución con ASM', 'Usando reflection directamente sin proxies',
        1, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Template Method?',
        'Un patrón para crear templates HTML', 'Define el esqueleto de un algoritmo en la clase base, delegando algunos pasos a subclases sin cambiar la estructura general del algoritmo', 'Un patrón para generar código automáticamente', 'Una forma de implementar interfaces con métodos default',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué establece el Dependency Inversion Principle?',
        'Inyectar dependencias con @Autowired', 'Los módulos de alto nivel no deben depender de módulos de bajo nivel; ambos deben depender de abstracciones (interfaces)', 'Las dependencias deben ser singleton', 'Cada clase debe gestionar sus propias dependencias',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Adapter?',
        'Para adaptar el rendimiento de la aplicación', 'Permite que clases con interfaces incompatibles trabajen juntas — convierte la interfaz de una clase en otra interfaz que el cliente espera', 'Para adaptar la configuración entre entornos', 'Para adaptar DTOs a entidades JPA',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo viola el Open/Closed Principle añadir un switch/case a un método existente?',
        'Nunca, switch/case es una buena práctica', 'Cuando se añaden casos para nuevos tipos de objetos — cada adición modifica código existente. La solución es polimorfismo o Strategy pattern para que sea abierto a extensión sin modificar', 'Solo cuando el switch tiene más de 5 casos', 'Solo en clases de servicio',
        1, 'PATRONES_DISENO', 'HARD', NOW());

-- ============================================================
-- SQL_DB
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre INNER JOIN y LEFT JOIN?',
        'Son idénticos', 'INNER JOIN devuelve solo filas con coincidencia en ambas tablas; LEFT JOIN devuelve todas las filas de la tabla izquierda aunque no haya coincidencia en la derecha (con NULL)', 'LEFT JOIN es más lento siempre', 'INNER JOIN no puede usarse con más de dos tablas',
        1, 'SQL_DB', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre DELETE y TRUNCATE?',
        'Son idénticos', 'DELETE elimina filas según WHERE y puede hacerse rollback; TRUNCATE elimina todas las filas de golpe, es más rápido pero no es transaccional en algunos SGBD y resetea el auto-increment', 'TRUNCATE permite WHERE', 'DELETE no puede hacerse rollback',
        1, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un índice "covering" (cubriente)?',
        'Un índice que cubre todas las tablas de la BD', 'Un índice que contiene todas las columnas necesarias para una query — la BD puede responder consultando solo el índice sin acceder a la tabla principal', 'Un índice que es más grande que la tabla', 'Un índice en todas las columnas de una tabla',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre UNION y UNION ALL?',
        'UNION ALL es más lento', 'UNION elimina filas duplicadas (hace DISTINCT); UNION ALL incluye todos los resultados incluyendo duplicados — UNION ALL es más eficiente si no necesitas eliminar duplicados', 'UNION puede combinar más de 2 queries', 'UNION ALL no funciona con NULL',
        1, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué se usa GROUP BY y cuándo se añade HAVING?',
        'GROUP BY ordena, HAVING filtra ordenaciones', 'GROUP BY agrupa filas por columna para usar funciones de agregación (COUNT, SUM); HAVING filtra los grupos resultantes (como WHERE pero para grupos)', 'HAVING reemplaza a WHERE con GROUP BY', 'GROUP BY y HAVING solo se usan con JOIN',
        1, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantiza ACID en las transacciones de base de datos?',
        'Velocidad, Consistencia, Integridad, Disponibilidad', 'Atomicity (todo o nada), Consistency (la BD pasa de estado válido a válido), Isolation (transacciones independientes), Durability (los cambios persisten)', 'Autenticación, Cifrado, Integridad, Disponibilidad', 'Atomicity, Cifrado, Índices, Durabilidad',
        1, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una "dirty read" en bases de datos?',
        'Una lectura con datos corruptos', 'Leer datos de una transacción que aún no ha hecho commit y podría hacer rollback — el nivel de aislamiento READ_UNCOMMITTED lo permite', 'Leer datos encriptados sin permisos', 'Una lectura que viola las reglas de negocio',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la normalización 3NF (Tercera Forma Normal)?',
        'Que cada tabla tenga al menos 3 columnas', 'Una tabla está en 3NF si está en 2NF y no hay dependencias transitivas (columnas no-clave que dependen de otras columnas no-clave)', 'Que cada tabla tenga exactamente 3 índices', 'Que los datos se almacenen en 3 servidores',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una window function como ROW_NUMBER()?',
        'Una función para calcular el tamaño de una ventana de tiempo', 'Una función de agregación que opera sobre un conjunto de filas relacionadas con la fila actual (la "ventana") sin colapsar el resultado — añade cálculos como ranking sin perder filas individuales', 'Una función para páginar resultados', 'Una función específica de PostgreSQL',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre una vista (VIEW) y una vista materializada?',
        'Son idénticas en rendimiento', 'Una VIEW es una query guardada que se ejecuta cada vez que se consulta; una vista materializada almacena físicamente los resultados y se actualiza periódicamente — más rápida para consultas complejas pero datos menos frescos', 'Las vistas materializadas no existen en PostgreSQL', 'Las vistas no pueden usarse con JOIN',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es útil una subquery correlacionada?',
        'Nunca, las subqueries correlacionadas deben evitarse siempre', 'Cuando la subquery referencia columnas de la query exterior — se ejecuta una vez por fila de la query exterior. Útil pero puede ser lenta; a veces reemplazable con JOIN', 'Para operaciones de INSERT únicamente', 'Solo en bases de datos Oracle',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo de índice usa PostgreSQL/MySQL por defecto para PRIMARY KEY?',
        'Hash index', 'Full-text index', 'B-tree index', 'Bitmap index',
        2, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es problema poner una columna con baja cardinalidad (ej: género M/F) en un índice?',
        'Los índices no funcionan con VARCHAR', 'Con baja cardinalidad el optimizador puede ignorar el índice y hacer full scan igualmente — los índices son más efectivos en columnas con alta cardinalidad (IDs, emails)', 'Aumenta mucho el tamaño de la tabla', 'La BD lanza error al crear el índice',
        1, 'SQL_DB', 'HARD', NOW());

-- ============================================================
-- GIT
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre git merge y git rebase?',
        'Son idénticos', 'merge crea un commit de fusión preservando el historial completo; rebase reescribe commits encima de otra rama creando un historial lineal más limpio pero altera el historial existente', 'rebase es más seguro para ramas compartidas', 'merge es más moderno',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es peligroso hacer git rebase en ramas compartidas (pusheadas)?',
        'Porque rebase es lento', 'Porque rebase reescribe commits (cambia sus SHAs) — los compañeros que tienen los commits originales tendrán conflictos al sincronizar', 'Porque rebase no funciona con ramas remotas', 'Porque puede borrar commits del servidor',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve git cherry-pick?',
        'Para seleccionar archivos específicos para commit', 'Para aplicar los cambios de un commit específico a la rama actual sin fusionar toda la rama de origen', 'Para deshacer el último commit', 'Para ver el log de commits de forma gráfica',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace git stash?',
        'Elimina cambios del working directory', 'Guarda temporalmente los cambios no commiteados (staged y unstaged) en una pila, dejando el working directory limpio — recuperable con git stash pop', 'Comprime el repositorio', 'Crea un backup del repositorio',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve git reflog?',
        'Para ver el log de cambios en archivos', 'Para ver el historial de todas las acciones que han movido HEAD (commits, checkouts, resets, rebases) — permite recuperar commits "perdidos"', 'Para ver el log de commits del repositorio remoto', 'Para ver cambios en el .gitignore',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre git reset --soft, --mixed y --hard?',
        'Solo difieren en velocidad', '--soft mueve HEAD pero mantiene staged y working; --mixed (default) mueve HEAD y desescacea pero mantiene working; --hard descarta todo incluyendo working directory', '--hard es el más seguro', '--soft borra el commit del servidor',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el trunk-based development?',
        'Desarrollar directamente en producción', 'Todos los desarrolladores integran cambios frecuentemente en una rama principal (trunk/main) usando feature flags, minimizando ramas de larga duración', 'Tener una rama por cada sprint', 'Una estrategia de git solo para proyectos open source',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace git bisect?',
        'Divide el repositorio en dos partes', 'Realiza una búsqueda binaria en el historial de commits para encontrar cuál introdujo un bug — marcas commits como good/bad y git bisect encuentra el culpable', 'Compara dos ramas', 'Fusiona dos ramas bisectadas',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En GitFlow, ¿cuándo se crea una rama hotfix?',
        'Para nuevas funcionalidades urgentes', 'Para corregir bugs críticos en producción directamente desde main/master sin pasar por develop', 'Para preparar un nuevo release', 'Para experimentos de corta duración',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "squash merge" y cuándo es útil?',
        'Una fusión que elimina los archivos duplicados', 'Combina todos los commits de una rama en uno solo antes de mergear — útil para mantener el historial de main limpio cuando la rama de feature tiene muchos commits de trabajo en progreso', 'Un merge que no crea commit de fusión', 'Una fusión entre más de dos ramas simultáneamente',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los git hooks?',
        'Atajos de teclado para comandos git', 'Scripts que se ejecutan automáticamente en eventos de git (pre-commit, post-commit, pre-push) — útiles para ejecutar tests, linting o validaciones antes de commitear', 'Extensiones de la API de GitHub', 'Plugins para IDEs que integran git',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre fast-forward merge y no-ff merge?',
        'Fast-forward es más seguro', 'Fast-forward mueve el puntero de la rama sin crear commit de merge (historial lineal); --no-ff siempre crea commit de merge explícito preservando la historia de la rama feature', 'No-ff es más eficiente', 'Fast-forward requiere que las ramas no tengan conflictos',
        1, 'GIT', 'NEGRO', NOW());

-- ============================================================
-- TESTING
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el ciclo Red-Green-Refactor en TDD?',
        'Etapas del proceso de deploy', 'Red: escribir un test que falla; Green: escribir el mínimo código para que pase; Refactor: mejorar el código manteniendo los tests en verde', 'Colores del semáforo de CI/CD', 'Estados de los tests en JUnit',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué forma tiene la pirámide de tests y qué significa?',
        'Muchos tests de UI arriba, pocos unitarios abajo', 'Muchos tests unitarios (base), menos tests de integración (medio), pocos tests E2E (cima) — los unitarios son más rápidos y baratos; los E2E son lentos y frágiles', 'Tests iguales en todos los niveles', 'Solo tests de integración en el centro',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre un Mock y un Stub?',
        'Son sinónimos intercambiables', 'Un Stub proporciona respuestas predefinidas a llamadas; un Mock además verifica que ciertas llamadas ocurrieron (tiene expectativas) — los Mocks fallan el test si las expectativas no se cumplen', 'Los Mocks son más lentos', 'Los Stubs solo funcionan con interfaces',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Spy en Mockito?',
        'Un mock que monitorea llamadas sin responder', 'Un wrapper de un objeto real que permite verificar llamadas y sobreescribir métodos selectivamente, mientras el resto del comportamiento real se mantiene', 'Un tipo de stub para verificación', 'Un mock completo de una clase abstracta',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @SpringBootTest y los test slices como @WebMvcTest?',
        '@WebMvcTest carga más contexto', '@SpringBootTest levanta el contexto completo de la aplicación (lento); @WebMvcTest carga solo la capa web (controllers, filters) siendo más rápido y enfocado', '@SpringBootTest no permite mocks', '@WebMvcTest requiere base de datos real',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías @TestConfiguration?',
        'Para configurar la base de datos de producción en tests', 'Para definir beans adicionales o sobreescribir beans del contexto SOLO para tests, sin afectar la configuración de producción', 'Para deshabilitar la seguridad en tests', 'Para configurar el servidor embebido de tests',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Awaitility en tests?',
        'Para pausar los tests durante N segundos', 'Para testear código asíncrono de forma elegante — espera hasta que una condición se cumpla con timeout configurable, sin usar Thread.sleep()', 'Para ejecutar tests en paralelo', 'Para tests de performance con tiempo límite',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el mutation testing?',
        'Tests que modifican datos de producción', 'Una técnica que introduce bugs intencionales (mutantes) en el código y verifica que tus tests los detectan — mide la calidad de los tests, no solo la cobertura de líneas', 'Tests que cambian configuración en tiempo de ejecución', 'Una forma de generar datos aleatorios para tests',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué mide la cobertura de código con JaCoCo?',
        'La calidad del código', 'Qué porcentaje de líneas, ramas e instrucciones son ejecutadas por los tests — es una métrica necesaria pero no suficiente (100% coverage no garantiza ausencia de bugs)', 'El tiempo de ejecución de los tests', 'La complejidad ciclomática del código',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la opción @SpringBootTest(webEnvironment) para levantar un servidor real en un puerto disponible?',
        'MOCK', 'NONE', 'RANDOM_PORT', 'DEFINED_PORT',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @DataJpaTest en Spring?',
        'Para testear controllers con base de datos real', 'Es un test slice que configura solo la capa JPA (entidades, repositorios) con H2 en memoria, sin cargar el contexto web ni servicios — ideal para testear repositorios aisladamente', 'Para testear servicios con mocks de repositorios', 'Para testear migraciones de base de datos',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ventaja ofrece RestAssured frente a MockMvc para tests de API?',
        'RestAssured es más rápido', 'RestAssured hace peticiones HTTP reales contra un servidor levantado, con una DSL fluida muy legible; MockMvc simula el servidor en memoria. RestAssured es más realista pero requiere servidor levantado', 'MockMvc requiere más configuración', 'RestAssured solo funciona con Spring Boot',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En Mockito, ¿cuándo usarías verify() en un test?',
        'Para verificar que el mock no es null', 'Para verificar que un método de un mock fue llamado (y opcionalmente cuántas veces y con qué argumentos) — útil cuando el comportamiento correcto es que se llame a cierta dependencia', 'Para verificar el valor de retorno del mock', 'Para verificar que el mock está configurado correctamente',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "test fake" y en qué difiere de un mock?',
        'Un test que verifica comportamiento falso', 'Un Fake es una implementación funcional simplificada (ej: in-memory repository) que funciona realmente pero no es apta para producción; un Mock es un objeto vacío que solo registra llamadas', 'Los fakes son más lentos que los mocks', 'Los fakes no pueden usarse con Spring',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa "test isolation" y por qué es importante?',
        'Ejecutar tests en un ambiente aislado del internet', 'Que cada test es independiente: no depende del estado de otros tests ni lo modifica — garantiza que los tests son deterministas y el orden de ejecución no importa', 'Que los tests se ejecutan en procesos separados', 'Que los tests no pueden llamar a código de producción',
        1, 'TESTING', 'NARANJA', NOW());


-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN BLANCO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para obtener datos del servidor?',
        'POST', 'GET', 'PUT', 'DELETE',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente no tiene autorización (no ha hecho login)?',
        '403 Forbidden', '404 Not Found', '401 Unauthorized', '400 Bad Request',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el servidor está temporalmente fuera de servicio?',
        '500 Internal Server Error', '502 Bad Gateway', '504 Gateway Timeout', '503 Service Unavailable',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa el código HTTP 200 OK?',
        'El recurso fue creado', 'La petición fue exitosa', 'El recurso fue eliminado', 'El servidor redirige al cliente',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente tiene prohibido acceder al recurso aunque esté autenticado?',
        '401 Unauthorized', '403 Forbidden', '404 Not Found', '405 Method Not Allowed',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un campo numérico tenga un valor mínimo?',
        '@NotNull', '@Size(min=N)', '@Min(N)', '@MinValue(N)',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un campo String tenga formato de email?',
        '@Mail', '@Email', '@ValidEmail', '@EmailFormat',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué dependencia necesitas en el pom.xml para usar @NotBlank, @Email, etc.?',
        'spring-boot-starter-web', 'spring-boot-starter-validation', 'spring-boot-starter-security', 'spring-boot-starter-data-jpa',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usarías para validar que un campo String cumple una expresión regular?',
        '@Regex', '@Pattern(regexp="...")', '@Match', '@Format',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP devuelve Spring cuando un campo @NotBlank está vacío y se usa @Valid?',
        '500 Internal Server Error', '404 Not Found', '400 Bad Request', '422 Unprocessable Entity',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para enviar datos al servidor y crear un recurso nuevo?',
        'GET', 'PUT', 'POST', 'PATCH',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para actualizar un recurso existente completamente?',
        'POST', 'PATCH', 'GET', 'PUT',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para eliminar un recurso?',
        'REMOVE', 'POST', 'DELETE', 'DESTROY',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @NotNull y @NotBlank para un String?',
        'No hay diferencia', '@NotNull solo rechaza null; @NotBlank rechaza null, vacío "" y solo espacios "   "', '@NotBlank rechaza null pero permite vacío', '@NotNull es para números y @NotBlank para Strings',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué rango de códigos HTTP indica una redirección?',
        '1xx', '2xx', '3xx', '4xx',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué rango de códigos HTTP indica éxito?',
        '1xx', '2xx', '3xx', '4xx',
        1, 'HTTP', 'BLANCO', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN AMARILLO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Boot Initializr?',
        'Un IDE para Spring', 'Una herramienta web (start.spring.io) que genera proyectos Spring Boot con las dependencias seleccionadas', 'Un plugin de Maven', 'Un contenedor Docker para Spring',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Lombok en un proyecto Spring Boot?',
        'Para la seguridad de la aplicación', 'Para generar automáticamente getters, setters, constructores y otros métodos repetitivos mediante anotaciones', 'Para conectar a la base de datos', 'Para hacer tests automáticos',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Data de Lombok?',
        'Conecta a la base de datos', 'Genera getters, setters, toString, equals, hashCode y constructor con args requeridos (@RequiredArgsConstructor)', 'Valida los datos del DTO', 'Serializa el objeto a JSON',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es MapStruct y para qué se usa?',
        'Un framework de testing', 'Un generador de código que crea implementaciones de mappers entre objetos (Entity↔DTO) en tiempo de compilación, más eficiente que reflexión', 'Un ORM alternativo a Hibernate', 'Una librería para crear mapas geográficos',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Controller y @RestController?',
        'Son idénticos', '@RestController combina @Controller + @ResponseBody: cada método devuelve datos directamente (JSON) en vez de vistas (HTML)', '@Controller es para REST y @RestController para MVC', '@RestController es obsoleto',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un @Bean en Spring Boot?',
        'Una entidad de la base de datos', 'Un objeto gestionado por el contenedor de Spring que puede ser inyectado en otras clases', 'Un tipo de test', 'Un endpoint REST',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se usa para inyectar una dependencia en Spring?',
        '@Inject', '@Autowired (o inyección por constructor, preferida)', '@Bean', '@Component',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @RequestMapping("/api/students") en un controller?',
        'Crea una tabla students en la BD', 'Define el prefijo de URL para todos los endpoints del controller', 'Registra el controller en Eureka', 'Mapea el controller a un servicio externo',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Jackson en el contexto de Spring Boot?',
        'Un servidor de aplicaciones', 'La librería que serializa/deserializa objetos Java a/desde JSON automáticamente en los endpoints REST', 'Un framework de testing', 'Un gestor de dependencias',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @JsonIgnore en un campo de una entity o DTO?',
        'Ignora la validación del campo', 'Excluye el campo de la serialización/deserialización JSON — no aparece en la respuesta ni se lee del request', 'Hace el campo nullable en la BD', 'Ignora el campo en los tests',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN NARANJA
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Spy y @Mock en Mockito?',
        'Son lo mismo', '@Mock crea un objeto completamente falso; @Spy envuelve un objeto real y permite sobrescribir solo algunos métodos, los demás ejecutan la lógica real', '@Spy es más antiguo', '@Mock funciona con constructor y @Spy no',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace doThrow(Exception.class).when(mock).metodo() en Mockito?',
        'Lanza la excepción inmediatamente', 'Configura el mock para que lance esa excepción cuando se llame a metodo() — útil para testear manejo de errores', 'Verifica que se lanzó la excepción', 'Captura la excepción para analizarla',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace ArgumentCaptor en Mockito?',
        'Captura excepciones del test', 'Permite capturar y examinar los argumentos que fueron pasados a un método del mock — útil para verificar qué datos se enviaron', 'Captura el resultado de un método', 'Genera argumentos aleatorios para tests',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estructura AAA (Arrange-Act-Assert) en testing?',
        'Autenticar-Autorizar-Acceder', 'Arrange: preparar datos y mocks; Act: ejecutar la acción a testear; Assert: verificar el resultado esperado', 'Agregar-Actualizar-Archivar', 'API-Application-Architecture',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @DisplayName en JUnit 5?',
        'Para nombrar la clase de test', 'Para dar un nombre descriptivo legible al test que aparece en los reportes en vez del nombre del método', 'Para mostrar el nombre del developer', 'Para filtrar tests por nombre',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ParameterizedTest en JUnit 5?',
        'Ejecuta el test en paralelo', 'Permite ejecutar el mismo test con diferentes datos de entrada, evitando duplicar código de test', 'Inyecta parámetros en el constructor del test', 'Parametriza la configuración de Spring',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué verifica verifyNoMoreInteractions(mock) en Mockito?',
        'Que el mock no tiene más métodos', 'Que no se llamaron más métodos del mock aparte de los ya verificados — detecta llamadas inesperadas', 'Que el mock no lanza excepciones', 'Que el test terminó correctamente',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías @BeforeEach vs @BeforeAll en JUnit 5?',
        'Son lo mismo', '@BeforeEach ejecuta antes de CADA test (setup limpio); @BeforeAll ejecuta una vez antes de TODOS los tests de la clase (setup costoso compartido)', '@BeforeAll es para tests de integración', '@BeforeEach es obsoleto en JUnit 5',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un test unitario vs un test de integración?',
        'Son lo mismo pero con diferentes nombres', 'Unitario testea una sola clase/método aislado con mocks; de integración testea varias capas juntas con componentes reales (BD, HTTP)', 'Unitario es más completo que integración', 'Integración es solo para microservicios',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace when(mock.metodo()).thenAnswer(invocation -> ...)?',
        'Es igual que thenReturn', 'Permite definir una respuesta dinámica basada en los argumentos recibidos, más flexible que thenReturn que devuelve un valor fijo', 'Responde preguntas del mock', 'Ejecuta el método real del mock',
        1, 'MOCKITO', 'NARANJA', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN VERDE
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @WebMvcTest y @SpringBootTest para tests de controller?',
        'Son idénticos', '@WebMvcTest solo carga la capa web (controller, filtros, converters); @SpringBootTest carga TODO el contexto de Spring incluyendo BD — @WebMvcTest es más rápido y enfocado', '@WebMvcTest es obsoleto', '@SpringBootTest no soporta MockMvc',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un IntStream y cuándo lo usarías?',
        'Un stream para internet', 'Un Stream especializado para primitivos int que evita boxing/unboxing — más eficiente para operaciones numéricas que Stream<Integer>', 'Un stream de entrada de datos', 'Un tipo de InputStream',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Stream.distinct()?',
        'Ordena los elementos', 'Elimina elementos duplicados del Stream usando equals() para comparar', 'Cuenta elementos únicos', 'Separa el stream en dos',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se debe usar @Async en Spring?',
        'Para hacer llamadas REST', 'Para ejecutar métodos en un hilo separado sin bloquear el hilo principal — se activa con @EnableAsync y devuelve CompletableFuture<T>', 'Para cachear resultados', 'Para validar datos asíncronamente',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Predicate en Java funcional?',
        'Un tipo de excepción', 'Una interfaz funcional que recibe un argumento y devuelve boolean — se usa para filtrar elementos', 'Un predicado SQL', 'Una condición de Spring Security',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ExceptionHandler(MethodArgumentNotValidException.class) en un @RestControllerAdvice?',
        'Maneja todas las excepciones', 'Captura específicamente los errores de validación (@Valid) y permite devolver una respuesta personalizada con los errores de campos', 'Maneja excepciones de métodos privados', 'Lanza la excepción al frontend',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.toUnmodifiableList()?',
        'Crea una lista ordenada', 'Recoge los elementos del Stream en una lista inmutable — cualquier intento de modificarla lanza UnsupportedOperationException', 'Filtra elementos nulos', 'Crea una lista thread-safe',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es WebClient en Spring y cuándo usarlo en vez de RestTemplate?',
        'Son lo mismo', 'WebClient es el cliente HTTP reactivo/no-bloqueante de Spring WebFlux — se recomienda sobre RestTemplate (bloqueante) para aplicaciones modernas y alta concurrencia', 'WebClient es solo para WebSocket', 'RestTemplate es más moderno',
        1, 'REST_API', 'VERDE', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN MARRÓN
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @MappedSuperclass en JPA?',
        'Crea una tabla abstracta en la BD', 'Permite que una clase padre defina campos comunes (id, createdAt) que se heredan en las tablas de las subclases sin crear tabla propia', 'Es un alias de @Entity', 'Mapea la clase a múltiples tablas',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los Records en Java 16+ y cuándo usarlos en Spring Boot?',
        'Son tablas de la BD', 'Son clases inmutables con constructor, getters, equals, hashCode y toString generados — ideales para DTOs en Spring Boot', 'Son un tipo de colección', 'Son logs del sistema',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un sealed class en Java 17?',
        'Una clase encriptada', 'Una clase que restringe qué otras clases pueden heredar de ella usando permits — permite modelar jerarquías cerradas', 'Una clase que no puede instanciarse', 'Una clase final',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es pattern matching para instanceof en Java 16+?',
        'Expresiones regulares para tipos', 'Permite hacer cast automático en el if: if (obj instanceof String s) { usar s directamente } — elimina casts manuales', 'Un patrón de diseño', 'Matching de patterns en switch',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre findById() y getReferenceById() en JPA?',
        'Son idénticos', 'findById() carga la entidad de BD inmediatamente; getReferenceById() devuelve un proxy lazy que solo consulta la BD cuando accedes a sus propiedades', 'getReferenceById() lanza excepción si no existe', 'findById() es más lento',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el first-level cache (L1 cache) en JPA/Hibernate?',
        'Un caché de Redis', 'El PersistenceContext/Session que cachea entidades dentro de una transacción — la misma entidad cargada dos veces devuelve la misma instancia en memoria', 'El caché del navegador', 'El caché de queries SQL',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es @EventListener en Spring?',
        'Un listener de eventos del navegador', 'Un método que se ejecuta automáticamente cuando se publica un evento en el ApplicationEventPublisher de Spring — permite comunicación desacoplada entre componentes', 'Un listener de eventos de la BD', 'Un listener de excepciones',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es text blocks (""") en Java 15+?',
        'Una forma de crear archivos de texto', 'Una sintaxis para strings multilínea que preserva formato e indentación, útil para JSON, SQL o HTML embebido en el código', 'Bloques de comentarios', 'Templates de String',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es switch expressions en Java 14+?',
        'Un nuevo tipo de condicional', 'Switch como expresión que devuelve valor, con sintaxis arrow (->), exhaustividad obligatoria y sin fall-through accidental', 'Switch para streams', 'Un pattern matching',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Cacheable en Spring Boot?',
        'Valida que los datos estén en caché', 'Cachea el resultado de un método — la primera llamada ejecuta el método, las siguientes devuelven el resultado cacheado sin ejecutarlo de nuevo', 'Limpia la caché', 'Cachea las queries SQL automáticamente',
        1, 'SPRING_CORE', 'MARRON', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN NEGRO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un API Gateway en microservicios?',
        'Un servidor de base de datos', 'Un punto de entrada único que enruta peticiones a los microservicios correctos, maneja autenticación, rate limiting y balanceo de carga', 'Un framework de testing', 'Un tipo de cache distribuida',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Circuit Breaker en microservicios?',
        'Un cortocircuito eléctrico', 'Un patrón que detecta fallos repetidos en llamadas a otros servicios y "abre el circuito" para evitar cascadas de errores, devolviendo un fallback', 'Un patrón de seguridad', 'Un tipo de load balancer',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Docker y por qué se usa con Spring Boot?',
        'Un IDE para Java', 'Una plataforma de contenedores que empaqueta la app con sus dependencias en una imagen portable, garantizando que funciona igual en cualquier entorno', 'Un gestor de dependencias como Maven', 'Un servidor de aplicaciones',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Dockerfile multistage build para Spring Boot?',
        'Un archivo que crea múltiples contenedores', 'Un Dockerfile con varias etapas FROM: primero compila con Maven/JDK (builder), luego copia solo el JAR a una imagen ligera con JRE — reduce el tamaño de la imagen final', 'Un archivo para Docker Compose', 'Una configuración de CI/CD',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Service Discovery (Eureka) en microservicios?',
        'Un buscador de servicios en internet', 'Un registro donde los microservicios se inscriben al arrancar y pueden encontrar las ubicaciones (IP:puerto) de otros servicios dinámicamente', 'Un servidor DNS', 'Un balanceador de carga hardware',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es git rebase vs git merge?',
        'Son lo mismo', 'merge crea un commit de merge preservando la historia; rebase reescribe la historia poniendo tus commits sobre la rama destino, creando una línea recta sin commits de merge', 'rebase es más seguro que merge', 'merge es obsoleto',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es git stash y cuándo se usa?',
        'Para borrar cambios', 'Para guardar temporalmente cambios sin hacer commit — útil cuando necesitas cambiar de rama pero tienes trabajo en progreso', 'Para crear un backup del repo', 'Para revertir el último commit',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Cloud Config en microservicios?',
        'Un archivo de configuración local', 'Un servidor centralizado que gestiona la configuración de todos los microservicios desde un repositorio Git, permitiendo cambios sin redesplegar', 'Un plugin de IntelliJ', 'Una alternativa a application.yml',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @RefreshScope en Spring Cloud?',
        'Refresca la página web', 'Permite que los beans se recreen con nueva configuración cuando se llama al endpoint /actuator/refresh sin reiniciar la aplicación', 'Refresca la caché', 'Reinicia el servicio automáticamente',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Resilience4j y por qué reemplazó a Hystrix?',
        'Un framework de seguridad', 'Una librería ligera de tolerancia a fallos (circuit breaker, retry, rate limiter) diseñada para Java 8+/funcional — Hystrix entró en modo mantenimiento', 'Un servidor de mensajería', 'Un ORM alternativo',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Saga en microservicios?',
        'Una historia épica del proyecto', 'Un patrón para gestionar transacciones distribuidas entre múltiples servicios, usando una secuencia de transacciones locales con compensaciones en caso de fallo', 'Un tipo de event sourcing', 'Un patrón de comunicación síncrona',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());


-- =============================================
-- TEMAS AVANZADOS - SPRING WEBFLUX (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring WebFlux?',
        'Una versión más rápida de Spring MVC', 'El módulo reactivo de Spring que permite programación no-bloqueante basada en Project Reactor (Mono/Flux), ideal para alta concurrencia con pocos hilos', 'Un framework para WebSockets', 'Un reemplazo de Thymeleaf',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Mono y Flux en Project Reactor?',
        'Son lo mismo', 'Mono emite 0 o 1 elemento; Flux emite 0 a N elementos — ambos son Publishers reactivos que se suscriben de forma lazy', 'Mono es síncrono y Flux asíncrono', 'Flux es más rápido que Mono',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es backpressure en programación reactiva?',
        'Presión en el servidor por muchas peticiones', 'Un mecanismo donde el consumidor le indica al productor que baje la velocidad de emisión de datos cuando no puede procesarlos tan rápido', 'Un tipo de compresión de datos', 'Un error de memoria',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si llamas .block() en un Mono dentro de un hilo reactivo (event loop)?',
        'Funciona normalmente', 'Lanza IllegalStateException porque bloquear un hilo del event loop anula las ventajas reactivas y puede causar deadlock', 'Devuelve null', 'Convierte el Mono en síncrono automáticamente',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo NO deberías usar WebFlux sobre Spring MVC?',
        'Nunca, WebFlux siempre es mejor', 'Cuando tu app es CRUD simple con operaciones bloqueantes (JDBC tradicional, JPA) y baja concurrencia — WebFlux añade complejidad sin beneficio real', 'Cuando usas Java 17', 'Cuando necesitas seguridad',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace flatMap() en un Mono/Flux a diferencia de map()?',
        'Son idénticos', 'map() transforma el valor síncronamente; flatMap() transforma a otro Mono/Flux (operación asíncrona) y aplana el resultado — esencial para encadenar llamadas reactivas', 'flatMap() filtra elementos', 'map() es reactivo y flatMap() no',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es R2DBC y por qué se usa con WebFlux?',
        'Una alternativa a REST', 'Reactive Relational Database Connectivity — un driver de BD reactivo no-bloqueante, necesario porque JDBC es bloqueante e incompatible con WebFlux', 'Un tipo de base de datos NoSQL', 'Un protocolo de red',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Mono.defer(() -> Mono.just(valor))?',
        'Es igual que Mono.just(valor)', 'Retrasa la creación del Mono hasta que alguien se suscriba — cada suscripción crea un Mono nuevo, útil para valores que cambian o efectos secundarios', 'Defiende contra excepciones', 'Ejecuta en otro hilo',
        1, 'WEBFLUX', 'NEGRO', NOW());

-- =============================================
-- MENSAJERÍA - KAFKA / RABBITMQ (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia fundamental entre Kafka y RabbitMQ?',
        'Son idénticos', 'Kafka es un log distribuido que retiene mensajes y permite replay; RabbitMQ es un broker de mensajes tradicional que elimina mensajes tras el acknowledgment', 'Kafka es más fácil de configurar', 'RabbitMQ es más moderno',
        1, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación de Spring Kafka se usa para consumir mensajes de un topic?',
        '@Subscribe', '@KafkaListener', '@MessageConsumer', '@TopicReader',
        1, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Consumer Group en Kafka?',
        'Un grupo de topics', 'Un conjunto de consumidores que se reparten las particiones de un topic — cada partición solo es leída por un consumidor del grupo, permitiendo paralelismo', 'Un grupo de productores', 'Una configuración de seguridad',
        1, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué patrón de comunicación usa RabbitMQ por defecto?',
        'Request-Response', 'Publish-Subscribe con exchanges y queues — el productor envía al exchange, que enruta a las queues según routing rules', 'Peer-to-peer', 'Streaming',
        1, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantía ofrece Kafka con acks=all?',
        'Entrega exactamente una vez', 'El mensaje se considera enviado solo cuando TODAS las réplicas del broker lo han escrito — máxima durabilidad a costa de mayor latencia', 'Sin garantía de entrega', 'Entrega en orden pero sin confirmación',
        1, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Dead Letter Queue (DLQ)?',
        'Una queue para mensajes eliminados', 'Una queue donde van los mensajes que no pudieron ser procesados tras N reintentos — permite analizar fallos sin perder datos', 'Una queue de alta prioridad', 'Una queue temporal',
        1, 'MENSAJERIA', 'NEGRO', NOW());

-- =============================================
-- OBSERVABILIDAD (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Micrometer en Spring Boot?',
        'Un framework de testing', 'Una fachada de métricas que abstrae el sistema de monitoreo (Prometheus, Datadog, etc.) — equivalente a SLF4J pero para métricas', 'Un medidor de rendimiento de la JVM', 'Un plugin de Maven',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es distributed tracing y para qué sirve en microservicios?',
        'Trazar errores en la base de datos', 'Seguir el recorrido de una petición a través de múltiples servicios usando un traceId único — permite ver latencia y fallos en toda la cadena', 'Debuggear código en producción', 'Trackear usuarios',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Boot Actuator /actuator/prometheus?',
        'Instala Prometheus', 'Expone las métricas de la aplicación en formato Prometheus (texto plano) para que un servidor Prometheus las scrape periódicamente', 'Monitorea la base de datos', 'Genera dashboards automáticos',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los 3 pilares de la observabilidad?',
        'CPU, RAM, Disco', 'Logs (qué pasó), Métricas (cuánto/cuántas veces) y Traces (dónde y cuánto tardó) — juntos dan visibilidad completa del sistema', 'Tests, Deploy, Monitoring', 'Seguridad, Rendimiento, Disponibilidad',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Zipkin/Jaeger en el contexto de Spring Boot?',
        'Servidores de bases de datos', 'Sistemas de tracing distribuido que recopilan, almacenan y visualizan las trazas de las peticiones entre microservicios', 'Frameworks de testing', 'Herramientas de deployment',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un health indicator custom en Spring Boot Actuator?',
        'Un indicador de salud del desarrollador', 'Una clase que implementa HealthIndicator para verificar componentes específicos (conexión a API externa, espacio en disco, etc.) y reportar UP/DOWN en /actuator/health', 'Un test automático', 'Un log de errores',
        1, 'OBSERVABILIDAD', 'MARRON', NOW());

-- =============================================
-- TESTCONTAINERS (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Testcontainers?',
        'Un framework para crear contenedores Docker en producción', 'Una librería Java que levanta contenedores Docker reales (PostgreSQL, Redis, Kafka, etc.) durante los tests de integración — tests más realistas que con H2', 'Una alternativa a Docker Compose', 'Un framework de testing unitario',
        1, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué usar Testcontainers con PostgreSQL en vez de H2 para tests?',
        'H2 es más rápido, no hay razón', 'Porque H2 tiene diferencias de comportamiento con PostgreSQL (funciones SQL, tipos de datos, constraints) que pueden ocultar bugs que sí aparecerían en producción', 'Porque Testcontainers es más fácil de configurar', 'Porque H2 está deprecated',
        1, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación de Testcontainers inicia el contenedor antes de los tests?',
        '@DockerContainer', '@Testcontainers (en la clase) + @Container (en el campo GenericContainer)', '@StartContainer', '@AutoContainer',
        1, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @DynamicPropertySource en tests con Testcontainers?',
        'Genera propiedades aleatorias', 'Inyecta dinámicamente propiedades de configuración (como la URL del contenedor) en el contexto de Spring antes de que arranque — necesario porque el puerto del contenedor es aleatorio', 'Fuente de datos dinámica', 'Carga propiedades del sistema operativo',
        1, 'TESTCONTAINERS', 'VERDE', NOW());

-- =============================================
-- GRAALVM / NATIVE (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Boot Native (GraalVM)?',
        'Spring Boot compilado a JavaScript', 'Compilar la aplicación Spring Boot a un ejecutable nativo (AOT) que arranca en milisegundos y consume menos memoria — ideal para serverless/containers', 'Un perfil de Spring para producción', 'Spring Boot sin JVM',
        1, 'NATIVE', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la principal limitación de GraalVM Native Image con Spring?',
        'No soporta Java 17', 'La reflexión, proxies dinámicos y class loading dinámico no funcionan sin configuración explícita (hints) — muchas librerías necesitan adaptaciones', 'No soporta Spring Security', 'Solo funciona con Linux',
        1, 'NATIVE', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es AOT (Ahead-of-Time) processing en Spring Boot 3?',
        'Compilación anticipada de HTML', 'Procesamiento en tiempo de compilación que analiza la app, genera código optimizado y metadata de reflexión para native image — reemplaza trabajo que antes hacía Spring en runtime', 'Un tipo de caching', 'Análisis de seguridad automático',
        1, 'NATIVE', 'NEGRO', NOW());

-- =============================================
-- VIRTUAL THREADS / PROJECT LOOM (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los Virtual Threads de Java 21?',
        'Threads que corren en la nube', 'Threads livianos gestionados por la JVM (no por el SO) que permiten crear millones de threads con bajo overhead — ideales para I/O blocking sin necesitar programación reactiva', 'Threads virtualizados en Docker', 'Threads para realidad virtual',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se activan los Virtual Threads en Spring Boot 3.2+?',
        'Requiere código especial', 'Con la propiedad spring.threads.virtual.enabled=true — Spring Boot usa automáticamente virtual threads para manejar peticiones HTTP', 'Instalando un plugin', 'Cambiando el servidor a Netty',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo los Virtual Threads pueden reemplazar a WebFlux?',
        'Nunca, son cosas diferentes', 'Cuando tu código es bloqueante (JDBC, RestTemplate) y necesitas alta concurrencia — virtual threads permiten el modelo thread-per-request sin agotar hilos, sin la complejidad reactiva', 'Siempre, WebFlux es obsoleto', 'Solo para aplicaciones batch',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema tienen los Virtual Threads con synchronized blocks?',
        'Ninguno, funcionan igual', 'synchronized "pinea" el virtual thread al platform thread del SO, bloqueándolo — se recomienda usar ReentrantLock en su lugar para no perder las ventajas', 'synchronized es incompatible con virtual threads', 'Lanza UnsupportedOperationException',
        1, 'JAVA_CORE', 'MARRON', NOW());

-- =============================================
-- REDIS / CACHING DISTRIBUIDO (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Redis en el contexto de Spring Boot?',
        'Un ORM alternativo', 'Un almacén de datos en memoria (key-value) usado como caché distribuido, session store o broker de mensajes — acceso sub-milisegundo', 'Un framework de testing', 'Un servidor HTTP',
        1, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @CacheEvict en Spring?',
        'Cachea el resultado', 'Elimina una o todas las entradas de una caché específica — se usa cuando los datos se modifican (update/delete) para invalidar la caché', 'Evita que se use la caché', 'Mueve datos de caché a BD',
        1, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Cacheable y @CachePut?',
        'Son lo mismo', '@Cacheable NO ejecuta el método si el valor está en caché; @CachePut SIEMPRE ejecuta el método y actualiza la caché — @CachePut se usa para updates', 'CachePut es más rápido', '@Cacheable es para Redis, @CachePut para memoria',
        1, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el cache-aside pattern?',
        'Un patrón de diseño visual', 'La app primero busca en caché; si no encuentra (cache miss), consulta la BD y guarda en caché. En escritura, actualiza BD e invalida caché', 'Un tipo de CDN', 'Un patrón para bases de datos',
        1, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura Spring Session con Redis?',
        'Implementando SessionFactory manualmente', 'Añadiendo spring-session-data-redis como dependencia y configurando spring.session.store-type=redis — las HttpSessions se almacenan automáticamente en Redis', 'Con @EnableRedisSession solamente', 'No es posible, las sesiones son locales',
        1, 'REDIS', 'MARRON', NOW());

-- =============================================
-- OPENAPI / SWAGGER (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es OpenAPI (Swagger) en Spring Boot?',
        'Un framework de seguridad', 'Una especificación estándar para documentar APIs REST — genera documentación interactiva automáticamente desde tus controllers con springdoc-openapi', 'Un tipo de test', 'Un protocolo de comunicación',
        1, 'OPENAPI', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué dependencia se usa para OpenAPI 3 en Spring Boot 3?',
        'swagger-core', 'springdoc-openapi-starter-webmvc-ui — genera la UI de Swagger en /swagger-ui.html automáticamente', 'spring-boot-starter-swagger', 'openapi-spring-generator',
        1, 'OPENAPI', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Operation(summary="...") de OpenAPI?',
        'Para ejecutar operaciones en la BD', 'Para añadir descripción legible a un endpoint en la documentación generada de Swagger UI', 'Para crear operaciones CRUD automáticas', 'Para configurar rate limiting',
        1, 'OPENAPI', 'VERDE', NOW());

-- =============================================
-- PATRONES AVANZADOS (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón CQRS?',
        'Create-Query-Read-Store', 'Command Query Responsibility Segregation — separa el modelo de escritura (commands) del modelo de lectura (queries), permitiendo optimizar cada uno independientemente', 'Un patrón de caché', 'Un tipo de base de datos',
        1, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Event Sourcing?',
        'Monitorear eventos del sistema', 'En vez de guardar el estado actual, se guardan todos los eventos que modificaron el estado — el estado se reconstruye reproduciendo los eventos', 'Fuente de eventos de JavaScript', 'Un patrón de logging',
        1, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Outbox en microservicios?',
        'Una bandeja de salida de emails', 'Guardar el evento y la entidad en la misma transacción de BD (tabla outbox), y un proceso aparte publica los eventos — garantiza consistencia entre BD y mensajería', 'Un tipo de message queue', 'Un patrón de backup',
        1, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Strangler Fig para migración de monolito a microservicios?',
        'Eliminar el monolito de golpe', 'Migrar gradualmente funcionalidades del monolito a microservicios, redirigiendo tráfico progresivamente hasta que el monolito se vacía — sin big bang rewrite', 'Un patrón de base de datos', 'Un tipo de load balancing',
        1, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Bulkhead en microservicios?',
        'Un patrón de base de datos', 'Aislar recursos (thread pools, conexiones) por servicio/funcionalidad para que el fallo de uno no agote los recursos de otros — como compartimentos estancos de un barco', 'Un patrón de autenticación', 'Un tipo de firewall',
        1, 'PATRONES', 'NEGRO', NOW());

-- =============================================
-- CUSTOM AUTO-CONFIGURATION (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se crea un custom Spring Boot starter?',
        'Con @StarterConfiguration', 'Creando un módulo con auto-configuración (@Configuration + @Conditional*), registrándola en META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports, y un starter POM que agrupa dependencias', 'Con spring init --starter', 'Solo Spring puede crear starters',
        1, 'SPRING_BOOT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @AutoConfiguration(after = DataSourceAutoConfiguration.class)?',
        'Ejecuta después de la app', 'Ordena la auto-configuración para que se procese DESPUÉS de DataSourceAutoConfiguration — garantiza que el DataSource ya existe cuando tu config lo necesite', 'Configuración automática de backups', 'Desactiva DataSourceAutoConfiguration',
        1, 'SPRING_BOOT', 'NEGRO', NOW());

-- =============================================
-- OAUTH2 / OIDC AVANZADO (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre OAuth2 y OpenID Connect (OIDC)?',
        'Son lo mismo', 'OAuth2 es un framework de AUTORIZACIÓN (acceso a recursos); OIDC es una capa de AUTENTICACIÓN sobre OAuth2 que añade identidad del usuario (ID Token)', 'OIDC es más antiguo', 'OAuth2 incluye autenticación',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un ID Token vs un Access Token en OIDC?',
        'Son intercambiables', 'ID Token contiene información del usuario (quién es, JWT firmado); Access Token da permisos para acceder a recursos (autorización) — nunca usar ID Token para autorizar acceso a APIs', 'ID Token es para APIs, Access Token para login', 'Access Token siempre es JWT',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el flujo Authorization Code + PKCE en OAuth2?',
        'Un flujo para aplicaciones de servidor', 'El flujo recomendado para SPAs y móviles: usa un code verifier/challenge para prevenir interceptación del authorization code — reemplaza al Implicit flow (deprecated)', 'Un flujo de autenticación con contraseña', 'Un tipo de cifrado',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace spring-boot-starter-oauth2-resource-server?',
        'Crea un servidor OAuth2', 'Configura tu API como Resource Server que valida tokens JWT o tokens opacos — verifica firma, expiración y claims antes de permitir acceso', 'Genera tokens OAuth2', 'Gestiona usuarios OAuth2',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

-- =============================================
-- SPRING BATCH (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Batch?',
        'Un framework para hacer commits en lote', 'Un framework para procesamiento de datos en lote (batch) — lee, procesa y escribe grandes volúmenes de datos con manejo de errores, restart y chunk processing', 'Una extensión de Spring MVC', 'Un framework de scheduling',
        1, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estructura de un Job en Spring Batch?',
        'Job → Task → Run', 'Job → Step(s) → cada Step tiene un Reader (lee datos), Processor (transforma) y Writer (escribe resultado) — procesamiento chunk-oriented', 'Job → Pipeline → Output', 'Job → Queue → Worker',
        1, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es chunk processing en Spring Batch?',
        'Procesar todo de una vez', 'Leer N items (chunk size), procesarlos en memoria, y escribirlos juntos en una transacción — si falla, solo se pierde el chunk actual, no todo el job', 'Comprimir datos antes de procesarlos', 'Dividir archivos en pedazos',
        1, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el JobRepository en Spring Batch?',
        'Para almacenar los datos del job', 'Para persistir metadatos de ejecución (estado del job, step, restart info) — permite reiniciar jobs desde el punto donde fallaron', 'Para gestionar repositorios Git', 'Para almacenar configuración del job',
        1, 'SPRING_BATCH', 'MARRON', NOW());

-- =============================================
-- HIBERNATE AVANZADO (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el second-level cache (L2) en Hibernate?',
        'El caché del navegador', 'Un caché compartido entre sesiones/transacciones (a diferencia del L1 que es por sesión) — se configura con EhCache/Caffeine y reduce queries a la BD', 'El caché de queries JPQL', 'El caché del connection pool',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es dirty checking en Hibernate?',
        'Verificar datos corruptos', 'Hibernate compara automáticamente el estado de las entidades managed con su snapshot inicial al hacer flush — genera UPDATE solo para campos que realmente cambiaron', 'Un tipo de validación', 'Verificar permisos de escritura',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es @BatchSize(size=N) en Hibernate?',
        'Tamaño del batch de Spring Batch', 'Optimización que carga N colecciones lazy a la vez usando IN clause en vez de N queries individuales — reduce el problema N+1 sin JOIN FETCH', 'Tamaño máximo del ResultSet', 'Número de entidades en caché',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los estados del ciclo de vida de una entidad JPA?',
        'Activo e Inactivo', 'New (transient), Managed (persistido en contexto), Detached (fuera del contexto), Removed (marcado para borrar)', 'Created, Updated, Deleted', 'Loaded, Modified, Saved',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

-- =============================================
-- CI/CD Y DEPLOYMENT (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CI/CD en el contexto de Spring Boot?',
        'Configuration Injection / Container Deployment', 'Continuous Integration (build + tests automáticos en cada push) y Continuous Delivery/Deployment (deploy automático a staging/producción)', 'Code Inspection / Code Documentation', 'Container Image / Container Distribution',
        1, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es GitHub Actions para un proyecto Spring Boot?',
        'Acciones de Git en el repositorio', 'Una plataforma CI/CD integrada en GitHub que ejecuta workflows (build, test, deploy) automáticamente en respuesta a eventos como push o pull requests', 'Un plugin de Maven', 'Un IDE online',
        1, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué estrategia de deployment minimiza downtime?',
        'Parar el servidor y redesplegar', 'Blue-Green deployment: mantener dos entornos idénticos, desplegar en el inactivo (green) y redirigir tráfico cuando está listo — rollback instantáneo volviendo al anterior (blue)', 'Desplegar de madrugada', 'Copiar el JAR manualmente',
        1, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un rolling deployment?',
        'Desplegar en un servidor a la vez de forma rotativa', 'Actualizar instancias gradualmente: se reemplazan una por una con la nueva versión mientras las demás siguen sirviendo tráfico — sin downtime pero con versiones mixtas temporalmente', 'Un deployment que puede deshacerse', 'Un deployment programado',
        1, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Canary deployment?',
        'Un deployment de prueba en producción', 'Enviar un pequeño porcentaje del tráfico (ej: 5%) a la nueva versión para validar su comportamiento antes de hacer rollout completo — detecta problemas con impacto mínimo', 'Un deployment nocturno', 'Un deployment solo para testers',
        1, 'DEVOPS', 'NEGRO', NOW());

-- =============================================
-- SPRING DATA REST / HATEOAS (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Data REST automáticamente?',
        'Crea la base de datos', 'Expone los repositorios JPA como endpoints REST completos (CRUD + paginación + búsqueda) sin necesidad de crear controllers — útil para prototipos rápidos', 'Genera tests automáticos', 'Crea documentación Swagger',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un RepresentationModel en Spring HATEOAS?',
        'Un modelo de datos de la BD', 'Una clase base que añade links (_links) a los DTOs de respuesta, permitiendo navegar la API siguiendo enlaces como en una web — nivel 3 del Richardson Maturity Model', 'Un modelo de representación visual', 'Una clase abstracta de Spring MVC',
        1, 'REST_API', 'VERDE', NOW());

-- =============================================
-- SEGURIDAD AVANZADA (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Rate Limiting y cómo se implementa en Spring?',
        'Limitar la velocidad de la BD', 'Restringir el número de peticiones por cliente/IP en un periodo de tiempo — se implementa con Resilience4j @RateLimiter, Bucket4j, o en el API Gateway', 'Limitar el tamaño de la respuesta', 'Limitar usuarios concurrentes',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es JWT Refresh Token y por qué se usa?',
        'Un token que se refresca solo', 'Un token de larga duración que permite obtener nuevos Access Tokens sin re-autenticarse — el Access Token es de corta vida (minutos), el Refresh Token de larga vida (días/semanas)', 'Un token para refrescar la página', 'Un token que regenera la contraseña',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el principio de least privilege en seguridad?',
        'Dar acceso total y restringir después', 'Cada usuario/servicio debe tener SOLO los permisos mínimos necesarios para su función — nunca dar más acceso del necesario', 'Privilegios mínimos de hardware', 'Reducir el número de usuarios',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

