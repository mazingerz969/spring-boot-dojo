-- =============================================
-- Códigos HTTP y Validación en Spring Boot
-- =============================================

-- Códigos HTTP básicos
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que un recurso fue creado exitosamente?',
        '200 OK — la operación se completó pero sin crear un recurso nuevo', '204 No Content — éxito sin cuerpo de respuesta, usado en PUT y DELETE', '202 Accepted — la petición fue aceptada para procesamiento asíncrono', '201 Created',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente envió datos incorrectos o inválidos?',
        '401 Unauthorized — el cliente no ha proporcionado credenciales válidas de autenticación', '404 Not Found — el servidor no encontró el recurso en la ruta especificada', '422 Unprocessable Entity — el JSON es válido pero los datos no pasan validación de negocio', '400 Bad Request',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el recurso solicitado no existe?',
        '410 Gone — el recurso existió anteriormente pero fue eliminado permanentemente', '400 Bad Request — el formato de la petición es incorrecto o tiene campos inválidos', '404 Not Found', '403 Forbidden — el servidor entendió la petición pero rechaza autorizar el acceso',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un error interno del servidor (bug en el código)?',
        '500 Internal Server Error', '502 Bad Gateway — un servidor intermediario recibió una respuesta inválida del upstream', '503 Service Unavailable — el servidor está temporalmente saturado o en mantenimiento', '504 Gateway Timeout — un servidor intermediario no recibió respuesta a tiempo del upstream',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica un conflicto con datos existentes (ej: DNI duplicado)?',
        '422 Unprocessable Entity — los datos tienen formato correcto pero fallan validación de negocio', '412 Precondition Failed — una precondición indicada en los headers no se cumplió', '400 Bad Request — el servidor no puede procesar la petición por un error de sintaxis del cliente', '409 Conflict',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP se usa cuando un DELETE se ejecuta correctamente y no hay contenido que devolver?',
        '204 No Content', '410 Gone — el recurso ha sido eliminado permanentemente y no volverá a estar disponible', '202 Accepted — la eliminación fue aceptada y se procesará de forma asíncrona', '200 OK — operación exitosa con body de confirmación indicando qué se eliminó',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia principal entre los códigos 4xx y 5xx?',
        '4xx los genera el framework de validación, 5xx los genera el servidor de aplicaciones directamente', '4xx son errores recuperables que el cliente puede reintentar, 5xx son errores permanentes del servidor', '4xx indican problemas de autenticación y autorización, 5xx indican problemas de infraestructura', '4xx son errores del cliente, 5xx son errores del servidor',
        3, 'HTTP', 'BLANCO', NOW());

-- Validación en Spring Boot
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se usa en el Controller para activar las validaciones de un DTO?',
        '@Validated — activa las validaciones y además permite validación por grupos de constraints', '@Valid', '@RequestValid — combina @RequestBody con validación automática de Spring', '@NotNull — marca el parámetro como obligatorio y activa la validación automática',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si NO pones @Valid en el @RequestBody del Controller?',
        'Las anotaciones de validación (@NotBlank, etc.) se ignoran completamente', 'Las validaciones se ejecutan pero solo registran warnings en el log sin rechazar la petición', 'Spring valida los campos pero devuelve 200 OK con warnings en el body de la respuesta', 'Spring lanza ConstraintViolationException con los errores de cada campo que no cumple',
        0, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @NotNull, @NotEmpty y @NotBlank?',
        '@NotNull solo valida null; @NotEmpty valida null y vacío; @NotBlank valida null, vacío y espacios', '@NotNull valida null y cadenas vacías; @NotEmpty valida null y espacios en blanco; @NotBlank solo valida null', '@NotEmpty valida que la colección tenga elementos; @NotNull y @NotBlank son equivalentes para Strings', '@NotBlank es la versión de Jakarta que reemplaza a @NotEmpty; @NotNull es para tipos primitivos exclusivamente',
        0, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué @NotBlank no funciona en un campo de tipo LocalDate?',
        'Porque @NotBlank necesita un constructor String en el tipo y LocalDate usa un factory method estático', 'Porque @NotBlank solo funciona con Strings (CharSequence), no con fechas', 'Porque LocalDate implementa Comparable pero no CharSequence, y @NotBlank requiere ambas interfaces', 'Porque @NotBlank delega en String.isEmpty() internamente y LocalDate no tiene ese método',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usarías para validar que una fecha NO sea null (en un campo LocalDate)?',
        '@NotEmpty — valida que el campo no sea null ni tenga valor por defecto del tipo', '@NotBlank — funciona con cualquier tipo que implemente toString() incluyendo LocalDate', '@Required — marca el campo como obligatorio en el contexto de Spring MVC', '@NotNull',
        3, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué excepción lanza Spring cuando @Valid detecta errores de validación en un @RequestBody?',
        'ConstraintViolationException — se lanza cuando las restricciones de Jakarta Validation fallan en cualquier capa', 'HttpMessageNotReadableException — se lanza cuando el JSON no puede mapearse al DTO correctamente', 'MethodArgumentNotValidException', 'BindException — se lanza cuando hay errores de binding en formularios y request bodies por igual',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @RestControllerAdvice con @ExceptionHandler?',
        'Para registrar beans de serialización personalizados que transforman las respuestas JSON del controller', 'Para capturar excepciones y devolver respuestas HTTP personalizadas en vez de errores 500', 'Para interceptar las peticiones HTTP entrantes y validar los headers antes de llegar al controller', 'Para definir filtros de seguridad que interceptan excepciones de autenticación y autorización',
        1, 'VALIDACION', 'BLANCO', NOW());

-- Exception Handling
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Si una excepción NO está capturada en el GlobalExceptionHandler, ¿qué código HTTP devuelve Spring por defecto?',
        '500 Internal Server Error', '503 Service Unavailable — Spring marca el servicio como no disponible cuando hay excepciones no controladas', '400 Bad Request — Spring convierte excepciones no capturadas en errores de validación por defecto', '404 Not Found — Spring asume que si la operación falló es porque el recurso no existe',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas en el Controller para que un POST devuelva 201 en vez de 200?',
        '@StatusCode(HttpStatus.CREATED) — anotación de Jakarta EE para definir el código de retorno', '@ResponseStatus(HttpStatus.CREATED)', '@PostMapping(status = HttpStatus.CREATED) — configura el código de retorno directamente en el mapping', '@HttpStatus(code = 201) — anotación de Spring MVC para configurar el código de respuesta HTTP',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP es peor señal en producción: un 400 o un 500?',
        'Son igual de graves porque ambos indican que la petición del usuario no se completó exitosamente', '400, porque un volumen alto de 400s puede indicar un ataque o un problema de compatibilidad de versiones', '500, porque indica un bug en el servidor que no fue manejado', '400, porque indica que la API no tiene buena validación y el frontend está mandando datos incorrectos',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un String tenga máximo N caracteres?',
        '@Length(max=N) — anotación de Hibernate Validator específica para validar longitud de Strings', '@Max(N) — valida que el valor numérico no exceda N, también funciona con la longitud de Strings', '@Size(max=N)', '@Column(length=N) — define el tamaño máximo de la columna en la BD y también valida en runtime',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que una fecha sea anterior a hoy?',
        '@PastOrPresent — valida que la fecha sea anterior o igual a hoy, permitiendo la fecha actual', '@Past', '@Before — anotación de Jakarta Validation que compara contra la fecha especificada como parámetro', '@Temporal(TemporalType.PAST) — combina la definición del tipo temporal con la validación de anterioridad',
        1, 'VALIDACION', 'BLANCO', NOW());

-- =============================================
-- Mockito y Testing en Spring Boot
-- =============================================

-- Paso 1: Setup del test
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usas para crear un mock (objeto falso) de un Repository en un test unitario?',
        '@Mock', '@Spy — envuelve el repository real permitiendo interceptar solo algunas llamadas', '@Autowired — inyecta la implementación real del repository desde el contexto de Spring', '@MockBean — crea un mock y lo registra como bean en el contexto de Spring Test para reemplazar el real',
        0, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación inyecta los mocks dentro de la clase que estás testeando (ej: el Service)?',
        '@Spy — envuelve la clase real con los mocks parciales en las dependencias', '@InjectMocks', '@Autowired — inyecta las dependencias reales desde el contexto de Spring', '@MockBean — registra los mocks como beans de Spring y los inyecta en los componentes del contexto',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación necesitas en la clase de test para que @Mock y @InjectMocks funcionen?',
        '@TestConfiguration — configura los beans de test incluyendo la resolución de mocks y spies', '@RunWith(SpringRunner.class) — integra JUnit con el contexto de Spring para resolver @Mock', '@ExtendWith(MockitoExtension.class)', '@SpringBootTest — carga el contexto completo de Spring incluyendo los mocks configurados',
        2, 'MOCKITO', 'NARANJA', NOW());

-- Paso 2: Entender la estructura del test
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de Service con Mockito, ¿cuál es el orden correcto de los pasos?',
        'Crear request → Configurar entity → Configurar mock → Llamar service → Verificar con assert', 'Given (preparar datos) → When (ejecutar acción) → Then (verificar resultado)', 'Configurar mocks → Crear request → Inyectar dependencias → Ejecutar → Verificar resultado', 'Verificar precondiciones → Configurar mock → Crear request → Ejecutar service → Validar estado',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué creas un StudentRequest Y un Student separados en el test?',
        'Porque el Service transforma el Request aplicando reglas de negocio antes de persistir la Entity', 'El Request es lo que envía el usuario, el Student es lo que devolvería la BD — son capas distintas', 'Porque JPA requiere que las entidades sean diferentes de los DTOs para el tracking de cambios', 'Porque Mockito necesita tipos diferentes para distinguir los argumentos del mock y el retorno',
        1, 'MOCKITO', 'NARANJA', NOW());

-- Paso 3: Configurar el mock (when/thenReturn)
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace when(repository.save(any())).thenReturn(student)?',
        'Guarda el student en la BD real', 'Le dice al mock: cuando alguien llame a save(), devuelve este student sin tocar la BD', 'Ejecuta el save y luego devuelve el student', 'Verifica que save fue llamado',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué usamos any() dentro de when(repository.save(any())) en vez del objeto exacto?',
        'Porque any() es más rápido', 'Porque save() no acepta objetos concretos', 'No hay razón, es solo costumbre', 'Porque el Service crea un objeto nuevo internamente, y no es la misma instancia que nuestro request',
        3, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué pasa si el mock NO tiene un when() configurado y el Service llama al repository?',
        'Devuelve null (para objetos) o valores por defecto (0, false, etc.)', 'El test no compila', 'Lanza una excepción', 'Llama a la BD real',
        0, 'MOCKITO', 'NARANJA', NOW());

-- Paso 4: Llamar al service
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En el test, cuando haces studentService.create(request), ¿qué BD se usa?',
        'Ninguna — el mock intercepta la llamada al repository y devuelve lo que configuraste', 'Una BD de test configurada en application-test.yml', 'Una BD H2 en memoria', 'La BD real de PostgreSQL',
        0, 'MOCKITO', 'NARANJA', NOW());

-- Paso 5: Assertions
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace assertEquals("Carlos", result.getNombre()) en un test?',
        'Asigna el valor "Carlos" al resultado', 'Compara si el nombre del resultado es "Carlos" — si no lo es, el test falla', 'Imprime "Carlos" en consola', 'Busca "Carlos" en la BD',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace verify(repository, times(1)).save(any()) en un test?',
        'Comprueba que el método save() del mock fue llamado exactamente 1 vez', 'Guarda el objeto una vez en la BD', 'Ejecuta save() una vez más', 'Resetea el mock después de un save',
        0, 'MOCKITO', 'NARANJA', NOW());

-- Conceptos clave
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la principal ventaja de usar Mockito en tests de Service?',
        'Los tests con Mockito tienen mayor cobertura de código porque testean todas las capas simultáneamente', 'No necesitas BD real, son rápidos y aislados — solo testeas la lógica del Service', 'Mockito genera automáticamente los datos de prueba basándose en los tipos de los campos del DTO', 'Los tests con Mockito son deterministas porque controlan el estado global de la aplicación Spring',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "mock" en testing?',
        'Una implementación simplificada que funciona realmente pero con datos en memoria en vez de BD real', 'Un wrapper que intercepta llamadas al objeto real y registra las interacciones para verificación posterior', 'Un objeto falso que simula el comportamiento de otro sin ejecutar su lógica real', 'Una copia exacta de la BD que se crea en memoria para cada test y se destruye al finalizar',
        2, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Mock y @MockBean?',
        '@Mock es para interfaces y @MockBean es para clases concretas que requieren proxy CGLIB para el mock', '@Mock es de Mockito puro (test unitario), @MockBean es de Spring (test de integración con contexto)', '@Mock genera un proxy JDK dinámico y @MockBean usa bytecode generation con CGLIB para el mock', '@MockBean crea el mock y además ejecuta @PostConstruct del bean original para inicializar estado',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo testeas que el Service lanza una excepción cuando el estudiante no existe?',
        'Configurando when().thenThrow() y verificando con verify() que la excepción fue propagada correctamente', 'Usando @ExpectedException(ResourceNotFoundException.class) como anotación en el método de test', 'Envolviendo la llamada en un try-catch y verificando el tipo de excepción en el bloque catch', 'assertThrows(ResourceNotFoundException.class, () -> service.findById(999L))',
        3, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Para testear findById cuando el estudiante NO existe, ¿qué when() configuras?',
        'No configuras when() porque el mock ya devuelve Optional.empty() por defecto para métodos que retornan Optional', 'when(repo.findById(999L)).thenThrow(EntityNotFoundException.class) — simula la excepción de JPA directamente', 'when(repo.findById(999L)).thenReturn(Optional.empty())', 'when(repo.findById(999L)).thenReturn(null) — devuelve null directamente simulando que no se encontró',
        2, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué un test unitario con @Mock es más rápido que uno con @SpringBootTest?',
        'Porque @Mock no escanea el classpath buscando componentes, lo que ahorra tiempo en proyectos grandes', 'Porque @Mock usa menos memoria RAM al no cargar las librerías de Spring en el classpath del test', 'Porque @Mock NO levanta el contexto de Spring (no arranca la app), solo crea objetos falsos', 'Porque @SpringBootTest ejecuta todos los @PostConstruct y @EventListener antes de cada test',
        2, 'MOCKITO', 'NARANJA', NOW());

-- Flujo completo
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En este código de test: when(repo.existsByDni("123")).thenReturn(true), ¿qué escenario estás simulando?',
        'Que el DNI es válido', 'Que ya existe un estudiante con ese DNI en la BD (para testear duplicados)', 'Que el repository funciona correctamente', 'Que la BD está conectada',
        1, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué patrón siguen los tests bien escritos?',
        'Input → Process → Output → Verify — modelar el test como un flujo de datos transformado', 'Arrange → Assert → Act — primero definir las expectativas, luego ejecutar y verificar', 'Given (preparar datos) → When (ejecutar acción) → Then (verificar resultado)', 'Setup → Execute → Cleanup — preparar estado, ejecutar operación, limpiar datos de test',
        2, 'MOCKITO', 'NARANJA', NOW());

-- =============================================
-- MockMvc y Tests de Controller
-- =============================================

-- Qué es MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es MockMvc?',
        'Un framework de testing que levanta un servidor embebido ligero para ejecutar peticiones HTTP reales', 'Un simulador de peticiones HTTP que testea el Controller sin levantar un servidor real', 'Un mock del Service que intercepta llamadas HTTP y las redirige al controller sin red real', 'Una extensión de Mockito que permite crear mocks de controllers con soporte para anotaciones Spring MVC',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test con MockMvc (controller) y un test con @Mock (service)?',
        'MockMvc simula peticiones HTTP y SÍ ejecuta validaciones @Valid; @Mock solo testea lógica de negocio sin HTTP', 'MockMvc es más lento siempre', '@Mock también ejecuta validaciones', 'Son lo mismo',
        0, 'MOCKMVC', 'VERDE', NOW());

-- Setup de MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve MockMvcBuilders.standaloneSetup(controller)?',
        'Conecta el controller a la BD', 'Crea un MockMvc que solo carga ESE controller, sin levantar el contexto completo de Spring', 'Configura los mocks automáticamente', 'Arranca toda la aplicación Spring',
        1, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué pones .setControllerAdvice(new GlobalExceptionHandler()) al crear MockMvc?',
        'Para que el test capture las excepciones y devuelva los códigos HTTP correctos (404, 409, etc.) en vez de 500', 'Para activar la seguridad', 'Para que los logs sean más bonitos', 'Es obligatorio, sin eso no compila',
        0, 'MOCKMVC', 'VERDE', NOW());

-- Validación en controller tests
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Si tu request no incluye un campo @NotBlank y haces POST con MockMvc, ¿qué pasa?',
        'Spring valida ANTES de llamar al Service y devuelve 400 — el Service ni se ejecuta', 'MockMvc ignora las validaciones @Valid en modo standalone y pasa el request directamente al Service', 'El Service recibe el campo como null y lanza NullPointerException al intentar procesarlo', 'Spring intenta deserializar el JSON parcial y lanza HttpMessageNotReadableException con código 400',
        0, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Tu test espera 201 pero recibe 400. El request tiene dni, nombre y apellidos pero falta email (que es @NotBlank). ¿Cuál es el problema?',
        'El ObjectMapper no puede serializar el request por un conflicto de tipos en el campo email', 'El mock del Service no está configurado para ese request específico y devuelve null causando el error', 'El controller tiene un @RequestMapping incorrecto y MockMvc no encuentra el endpoint esperado', 'Falta un campo obligatorio en el request — @Valid lo rechaza antes de llegar al Service',
        3, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el flujo correcto cuando MockMvc hace un POST con @Valid?',
        'JSON → Service → Controller → @Valid → Response — el Service procesa antes de validar', 'JSON → Controller → Service → Repository → @Valid al persistir. Si falla → 422 Unprocessable', 'JSON → Filtros de seguridad → @Valid → Controller → Service → Response. Si falla → 403 Forbidden', 'JSON → @Valid (valida campos) → ¿ok? → Service → Response. Si falla validación → 400 directo',
        3, 'MOCKMVC', 'VERDE', NOW());

-- Sintaxis de MockMvc
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace mockMvc.perform(post("/api/students").content(json))?',
        'Crea un student directamente', 'Envía datos a la BD', 'Llama al Service sin pasar por el Controller', 'Simula una petición POST al endpoint /api/students con ese JSON como body',
        3, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(status().isCreated())?',
        'Espera a que el servidor arranque', 'Crea el recurso en la BD', 'Verifica que la respuesta HTTP fue 201 Created — si fue otro código, el test falla', 'Configura el status del mock',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace .andExpect(jsonPath("$.nombre").value("Berto"))?',
        'Verifica que el JSON de respuesta tiene un campo "nombre" con valor "Berto"', 'Filtra resultados por nombre', 'Asigna "Berto" al campo nombre', 'Busca "Berto" en la BD',
        0, 'MOCKMVC', 'VERDE', NOW());

-- Errores comunes (basados en tus errores reales)
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de UPDATE usas get() en vez de put(). ¿Qué pasa?',
        'Funciona igual, da lo mismo', 'Spring lo convierte automáticamente a PUT', 'Llamas al endpoint GET en vez del PUT — estás testeando el método equivocado del controller', 'El test no compila',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En un test de DELETE usas post() en vez de delete(). ¿Qué resultado obtienes?',
        'Probablemente 405 Method Not Allowed o un resultado inesperado, porque POST /api/students/1 no es el endpoint de borrado', 'El test pasa correctamente', '204 No Content', '200 OK',
        0, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Tu test lanza RuntimeException pero el GlobalExceptionHandler solo captura ResourceNotFoundException. ¿Qué código HTTP recibes?',
        '400 Bad Request — Spring interpreta RuntimeException como un error de validación del request', '503 Service Unavailable — Spring marca el servicio como no disponible cuando hay excepciones no controladas', '500 Internal Server Error — porque la excepción no está capturada por ningún handler', '404 Not Found — Spring convierte RuntimeException en 404 porque asume que el recurso no se encontró',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué necesitas ObjectMapper con JavaTimeModule en los tests de controller?',
        'Para que Spring MVC pueda bindear los parámetros de fecha del query string al controller automáticamente', 'Para activar las validaciones @Past y @Future de Bean Validation en los campos de fecha del DTO', 'Para que Jackson sepa serializar LocalDate a JSON (ej: "1989-05-28") — sin eso falla la conversión', 'Para que MockMvc serialice los headers de fecha (If-Modified-Since, Last-Modified) en formato HTTP correcto',
        2, 'MOCKMVC', 'VERDE', NOW());

-- Test de Service vs Test de Controller
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde testeas que @NotBlank rechaza un campo vacío: en el test del Service o del Controller?',
        'En el Repository con @DataJpaTest, porque las constraints de validación se verifican al persistir', 'En el Service con Mockito, porque @Valid se ejecuta en la capa de negocio antes del repository', 'En el Controller con MockMvc, porque @Valid se ejecuta en la capa del Controller', 'En ambos igualmente — las validaciones @NotBlank se ejecutan tanto en el Controller como en el Service',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué testeas en el Service y qué testeas en el Controller?',
        'Service: todo lo que no depende de HTTP. Controller: solo el routing de URLs a métodos del service', 'Service: lógica de negocio (duplicados, excepciones, transformaciones). Controller: HTTP (códigos de estado, validación, formato JSON)', 'Service: validaciones y códigos HTTP. Controller: lógica de negocio y transformaciones de datos', 'Service: acceso a datos y queries. Controller: seguridad, autenticación y autorización de endpoints',
        1, 'MOCKMVC', 'VERDE', NOW());

-- =============================================
-- Arquitectura Spring Boot (Entities, DTOs, capas)
-- =============================================

-- Entities y Flyway
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una Entity en Spring Boot?',
        'Un JSON que envía el usuario al controller y se valida automáticamente con @Valid antes de procesarse', 'Un DTO que se mapea directamente a una tabla mediante anotaciones de Jackson como @JsonProperty', 'Un componente de Spring que encapsula la lógica de acceso a datos y se inyecta en los repositories', 'Una clase Java que representa una tabla de la BD — cada campo es una columna',
        3, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Flyway en un proyecto Spring Boot?',
        'Para generar las entidades JPA automáticamente a partir del esquema existente de la base de datos', 'Para sincronizar el esquema de la BD entre los diferentes microservicios de la aplicación', 'Para ejecutar tests de integración contra la BD real con datos precargados de forma automática', 'Para gestionar migraciones de BD — crea y versiona tablas con scripts SQL (V1__, V2__, etc.)',
        3, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre ddl-auto: validate y ddl-auto: create-drop?',
        'validate compara la Entity con la BD y crea las columnas faltantes; create-drop recrea todas las tablas al arrancar', 'validate solo comprueba que la Entity coincide con la BD; create-drop crea las tablas al arrancar y las borra al parar', 'validate ejecuta las migraciones pendientes de Flyway; create-drop ignora Flyway y usa el esquema de las entidades', 'validate verifica las constraints de integridad referencial; create-drop resetea los sequences y auto-increments',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se recomienda ddl-auto: validate + Flyway en producción en vez de ddl-auto: update?',
        'No hay diferencia real', 'Porque Flyway da control total sobre los cambios de BD con scripts versionados, y validate asegura que todo cuadra sin modificar nada automáticamente', 'Porque update no funciona en producción', 'Porque es más rápido',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- DTOs
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un DTO (Data Transfer Object)?',
        'Una tabla de la BD', 'Un tipo de test', 'Un objeto que define qué datos entran o salen de la API — separa la Entity de lo que ve el usuario', 'Un framework de Java',
        2, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa un StudentRequest y un StudentResponse en vez de usar la Entity Student directamente?',
        'Para no exponer campos internos (id, createdAt) en el request, y para controlar exactamente qué devuelve la API en el response', 'Porque Spring MVC requiere tipos diferentes para deserializar el @RequestBody y serializar el @ResponseBody', 'Para que Jackson pueda optimizar la serialización usando diferentes estrategias para lectura y escritura', 'Para poder aplicar diferentes validaciones de entrada (@NotBlank en request) y salida (@JsonFormat en response)',
        0, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema hay si usas la Entity directamente como @RequestBody en el Controller?',
        'JPA puede entrar en modo dirty checking y persistir cambios no deseados cuando Hibernate hace flush automático', 'Spring Data no puede distinguir entre un INSERT y un UPDATE si la Entity viene con id del request', 'Jackson ignora las anotaciones JPA (@Column, @Table) y serializa todos los campos incluyendo las relaciones lazy', 'El usuario podría enviar campos como id, createdAt o activo y modificar datos que no debería tocar',
        3, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Capas del Service
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son las 3 capas principales de una API REST en Spring Boot?',
        'Presentation (vista) → Application (lógica) → Infrastructure (BD, mensajería, APIs externas)', 'Controller (HTTP) → Service (lógica de negocio) → Repository (acceso a BD)', 'Entity (modelo de datos) → DTO (transferencia) → Config (configuración de beans y seguridad)', 'Gateway (entrada) → Handler (procesamiento) → Persistence (almacenamiento y consultas)',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde va la lógica de negocio como "verificar si un DNI ya existe antes de crear"?',
        'En el Repository, usando métodos custom con @Query para verificar y crear en una sola operación', 'En el Controller, porque es donde se valida el @RequestBody antes de pasar al Service', 'En el Service', 'En el DTO, implementando un método validate() que se ejecuta automáticamente con @Valid',
        2, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Transactional en un método del Service?',
        'Convierte el método en una operación atómica que se ejecuta en un hilo separado del thread pool', 'Asegura que si algo falla a mitad de la operación, todos los cambios en BD se deshacen (rollback)', 'Mejora el rendimiento agrupando múltiples queries en un solo batch para enviar a la BD', 'Bloquea la tabla completa durante la ejecución del método para evitar lecturas concurrentes',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Controller y códigos HTTP
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación convierte una clase en un endpoint REST en Spring Boot?',
        '@Service — marca la clase como componente de negocio con capacidad de recibir peticiones HTTP', '@RestController', '@Component — registra la clase como bean y Spring MVC automáticamente la expone como endpoint REST', '@RequestMapping — convierte la clase en un handler de peticiones HTTP cuando se combina con @Component',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP corresponde a cada operación CRUD?',
        'POST=Create, GET=Read, PUT=Update, DELETE=Delete', 'PUT=Create, GET=Read, POST=Update, DELETE=Delete — PUT crea porque es idempotente', 'GET=Create, POST=Read, PUT=Update, DELETE=Delete — GET crea porque pasa los datos por URL', 'POST=Create, PUT=Read, PATCH=Update, DELETE=Delete — PUT es para lectura de recurso completo',
        0, 'ARQUITECTURA', 'AMARILLO', NOW());

-- Tests de integración
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre un test unitario (Mockito) y uno de integración (@SpringBootTest)?',
        'El unitario testea una clase aislada con mocks; el de integración levanta la app completa con BD real y testea todo junto', 'El unitario es para producción, el de integración para desarrollo', 'Son lo mismo con diferente nombre', 'El de integración es más rápido',
        0, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa H2 (BD en memoria) para tests de integración en vez de PostgreSQL?',
        'Porque H2 es mejor que PostgreSQL', 'Porque H2 es rápida, no necesita instalación, y se crea/destruye con cada test — ideal para tests aislados y repetibles', 'Porque PostgreSQL no soporta tests', 'No hay razón, es costumbre',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Transactional en un test de integración?',
        'Para garantizar que las operaciones del test se ejecuten secuencialmente sin interferencia de otros tests paralelos', 'Para que el test pueda acceder a colecciones lazy de las entidades sin LazyInitializationException', 'Para que el test pueda ejecutar múltiples queries en una sola conexión de BD sin reconectar', 'Para que los datos insertados durante el test se deshagan automáticamente (rollback) y no contaminen otros tests',
        3, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Un test de integración falla con 409 Conflict al crear un estudiante. ¿Cuál es la causa más probable?',
        'El controller tiene un @UniqueConstraint que rechaza el request antes de llegar al Service', 'Ya existe un registro con ese DNI en la BD — los datos de un test anterior no se limpiaron', 'H2 genera automáticamente un DNI y colisiona con el DNI del request enviado en el test', 'El Service está configurado con @Transactional(REQUIRES_NEW) y conflicta con la transacción del test',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ActiveProfiles("test") en un test de integración?',
        'Hace que los tests corran más rápido', 'Carga application-test.yml en vez del application.yml normal — permite usar otra BD o configuración para tests', 'Desactiva las validaciones', 'Activa el modo debug',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

-- ============================================================
-- SPRING_CORE
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre BeanFactory y ApplicationContext en Spring?',
        'BeanFactory es para aplicaciones web y ApplicationContext para aplicaciones de escritorio y batch', 'BeanFactory gestiona beans singleton y ApplicationContext gestiona beans de todos los scopes incluyendo request y session', 'BeanFactory es el contenedor básico con lazy init; ApplicationContext lo extiende con i18n, eventos, AOP, y carga beans eagerly', 'BeanFactory usa XML para configuración y ApplicationContext usa anotaciones Java como @Configuration',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el scope por defecto de un bean en Spring?',
        'application — se crea una instancia compartida por todo el ServletContext de la aplicación web', 'singleton', 'prototype — se crea una nueva instancia cada vez que se solicita el bean con getBean()', 'request — se crea una instancia por cada petición HTTP y se destruye al finalizar la respuesta',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si tienes dos beans del mismo tipo y usas @Autowired sin @Qualifier?',
        'Spring crea un proxy compuesto que delega al bean que tenga @Primary o al primero registrado', 'Spring lanza NoUniqueBeanDefinitionException al arrancar', 'Spring inyecta el bean cuyo nombre coincide con el nombre del campo anotado con @Autowired', 'Spring elige el bean que fue registrado primero en el orden de escaneo de paquetes',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Primary en Spring?',
        'Para marcar el bean como de alta prioridad en la inicialización del contexto, cargándose antes que otros beans', 'Para garantizar que el bean se recree si falla su inicialización, actuando como retry automático', 'Para desactivar otros beans del mismo tipo y asegurar que solo exista una implementación en el contexto', 'Para indicar a Spring cuál bean debe usarse por defecto cuando hay múltiples candidatos del mismo tipo',
        3, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se ejecuta después de que el bean es construido e inyectadas sus dependencias?',
        '@AfterInit — callback de Spring que se ejecuta después de resolver todas las dependencias transitivas', '@PostConstruct', '@BeanReady — notifica al bean que todas sus propiedades han sido configuradas por el contenedor', '@EventListener(ContextRefreshedEvent.class) — se ejecuta cuando el contexto de Spring está listo',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Un bean singleton scope tiene una dependencia de scope prototype. ¿Qué problema ocurre?',
        'El singleton se comporta como prototype al detectar que su dependencia es prototype, creando ambos beans nuevos', 'El bean prototype se crea una sola vez e inyecta siempre la misma instancia, perdiendo el comportamiento prototype — se llama "scoped bean injection problem"', 'Spring detecta la incompatibilidad de scopes y lanza BeanCreationException al iniciar el contexto', 'Spring resuelve el conflicto automáticamente usando un proxy scoped que delega a instancias nuevas de prototype',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @Component, @Service y @Repository?',
        'Semánticamente son iguales (@Component es la meta-anotación), pero @Repository activa traducción de excepciones de persistencia a DataAccessException', '@Component es solo para clases utilitarias; @Service es para clases con @Transactional; @Repository es para interfaces de datos', '@Repository genera proxies JPA automáticos; @Service configura transaccionalidad por defecto; @Component no hace nada especial', '@Service y @Repository añaden interceptores AOP específicos; @Component es la anotación base sin interceptores',
        0, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Conditional en Spring?',
        'Registra un bean en el contexto solo si se cumple una condición determinada (matches() devuelve true)', 'Marca una propiedad de configuración como opcional, usando un valor por defecto si no se encuentra', 'Ejecuta el método del bean condicionalmente en cada llamada, evaluando la condición en runtime', 'Permite alternar entre dos implementaciones de un bean basándose en variables de entorno en runtime',
        0, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo resuelve Spring una dependencia circular entre BeanA y BeanB con inyección por constructor?',
        'Spring inyecta un proxy lazy en uno de los constructores que se resuelve después de crear ambos beans', 'Spring detecta la circular en compile-time con el BeanDefinitionRegistryPostProcessor y falla el build', 'Spring usa un three-level cache para resolver la circular: singletonObjects, earlySingletonObjects y singletonFactories', 'Lanza BeanCurrentlyInCreationException — las dependencias circulares por constructor no se pueden resolver',
        3, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Configuration y @Component?',
        '@Configuration solo puede tener @Bean methods estáticos; @Component permite @Bean methods de instancia', '@Configuration garantiza que los @Bean methods devuelven beans del contexto (usa CGLIB proxy), por lo que múltiples llamadas devuelven el mismo bean. @Component no hace esto', '@Configuration registra los beans lazily para optimizar el arranque; @Component los registra eagerly siempre', '@Configuration permite importar otras configuraciones con @Import; @Component solo se descubre por component scan',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un BeanPostProcessor?',
        'Un validador que verifica las dependencias de un bean antes de inyectarlas para prevenir errores en runtime', 'Una factoría especializada que crea beans complejos que requieren múltiples pasos de inicialización', 'Una interfaz que permite modificar beans recién creados antes y después de la inicialización — base de muchas características de Spring (AOP, @Autowired)', 'Un listener que se ejecuta cuando un bean es destruido para liberar recursos y cerrar conexiones',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué se usa @Profile("prod") en un bean?',
        'Para que el bean solo funcione más rápido en producción', 'Para que el bean solo sea registrado cuando el perfil activo sea "prod"', 'Para configurar el entorno de producción automáticamente', 'Para desactivar el bean en producción',
        1, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo de proxy usa Spring AOP por defecto para beans que implementan una interfaz?',
        'Javassist proxy — modifica el bytecode de la clase en tiempo de carga para insertar los advices', 'ASM proxy — genera bytecode optimizado directamente sin necesidad de subclases ni interfaces', 'JDK dynamic proxy', 'CGLIB proxy — genera una subclase en runtime que intercepta las llamadas a los métodos del bean',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se ejecuta @PreDestroy en un bean?',
        'Cuando otro bean del mismo tipo es registrado, justo antes de reemplazar la instancia anterior', 'Antes de que el bean sea reciclado por el garbage collector de la JVM', 'Antes de que el bean sea destruido, cuando el contexto de Spring se cierra', 'Cuando el bean lanza una excepción no controlada durante la ejecución de un método',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué scope debe usarse para un bean que debe ser nuevo en cada petición HTTP?',
        'request', 'singleton — usando @Scope(proxyMode = TARGET_CLASS) para que Spring cree un nuevo proxy por petición', 'prototype — crea una nueva instancia cada vez que se solicita el bean desde el contexto', 'session — se crea una instancia por sesión HTTP que sobrevive a múltiples peticiones del mismo usuario',
        0, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si llamas a un @Bean method dentro de una clase @Configuration desde otro @Bean method?',
        'Spring registra un warning porque los @Bean methods no deberían llamarse entre sí directamente', 'Se crea una nueva instancia cada vez que llamas al método, igual que un método Java normal', 'Spring intercepta la llamada mediante CGLIB y devuelve el bean existente del contexto, no crea una nueva instancia', 'Lanza StackOverflowError si el método se llama recursivamente al resolver dependencias circulares entre beans',
        2, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En AOP, ¿qué es un "pointcut"?',
        'Una expresión que define dónde (en qué métodos/clases) se aplica un advice', 'La interfaz que un bean debe implementar para que Spring AOP pueda crear un proxy dinámico', 'El punto de unión (join point) donde la ejecución del programa puede ser interceptada por un aspecto', 'El código de interceptación (advice) que se ejecuta antes o después del método objetivo en el proxy',
        0, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la forma de inyección de dependencias más recomendada en Spring moderno y por qué?',
        'Inyección por campo (@Autowired en el campo) porque reduce el boilerplate y Spring resuelve las dependencias automáticamente', 'Lookup method injection porque Spring genera la implementación y evita problemas con scopes diferentes entre beans', 'Inyección por constructor porque hace las dependencias explícitas, facilita los tests y el bean es inmutable', 'Inyección por setter porque permite cambiar dependencias en runtime y facilita la configuración condicional',
        2, 'SPRING_CORE', 'MARRON', NOW());

-- ============================================================
-- SPRING_BOOT
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo funciona la auto-configuración de Spring Boot?',
        'Conecta a start.spring.io en tiempo de compilación para descargar la configuración óptima según las dependencias', 'Lee las anotaciones @Bean de tu proyecto y genera configuraciones equivalentes optimizadas para producción', 'Analiza las entidades JPA y los controllers para generar automáticamente la configuración de BD y seguridad', 'Escanea el classpath y aplica @Configuration classes condicionalmente (via spring.factories o META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports)',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ConditionalOnClass(DataSource.class) en una auto-configuración?',
        'Verifica que DataSource esté instanciado', 'Lanza error si DataSource no está disponible', 'Registra la configuración solo si la clase DataSource está presente en el classpath', 'Inyecta DataSource automáticamente',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la ventaja de usar @ConfigurationProperties sobre @Value?',
        '@ConfigurationProperties genera documentación automática de las propiedades en META-INF/spring-configuration-metadata.json', '@Value soporta SpEL completo y tipos complejos; @ConfigurationProperties solo funciona con tipos primitivos y Strings', '@ConfigurationProperties cachea las propiedades en memoria para acceso más rápido que @Value que lee del Environment cada vez', '@ConfigurationProperties permite agrupar propiedades relacionadas en un POJO tipado con validación, refactoring más fácil y soporte IDE',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué endpoint del Actuator devuelve el estado de salud de la aplicación?',
        '/actuator/ping — endpoint ligero que devuelve 200 OK si la aplicación está viva', '/actuator/status — devuelve un JSON con el estado de todos los componentes del sistema', '/actuator/info — devuelve información del sistema incluyendo estado de salud y versión', '/actuator/health',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Por defecto, ¿cuántos endpoints del Actuator están expuestos sobre HTTP?',
        'Solo /health e /info', 'Solo /health, /info y /metrics — los tres endpoints básicos de monitoreo', 'Ninguno — todos requieren configuración explícita con management.endpoints.web.exposure.include', 'Todos los endpoints están expuestos pero requieren autenticación por defecto',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Boot DevTools cuando detecta un cambio en clases compiladas?',
        'Detiene la aplicación, ejecuta los tests afectados, y reinicia solo si los tests pasan correctamente', 'Recompila automáticamente el código fuente Java y regenera el bytecode de las clases modificadas', 'Hace un restart rápido recargando solo el classloader de la aplicación, no el de las librerías', 'Invalida las cachés de beans afectados y recrea solo los componentes que dependen de las clases modificadas',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el servidor embebido por defecto en Spring Boot?',
        'Netty — servidor reactivo no-bloqueante que Spring Boot usa por defecto con Spring WebFlux', 'Jetty — servidor ligero optimizado para aplicaciones Spring Boot con bajo consumo de memoria', 'Tomcat', 'Undertow — servidor de alto rendimiento basado en NIO que Spring Boot selecciona por defecto',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué propiedad en application.properties define el puerto del servidor?',
        'application.port — configura el puerto en el que escucha el servidor embebido', 'spring.port — define el puerto HTTP principal de la aplicación Spring', 'server.port', 'spring.server.port — propiedad de Spring Cloud para definir el puerto del servicio',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @SpringBootApplication?',
        'Es una meta-anotación que combina @Configuration, @EnableAutoConfiguration y @ComponentScan', 'Configura la aplicación como un microservicio con service discovery y circuit breaker habilitados', 'Activa el component scan y configura el servidor embebido con los defaults de Spring Boot', 'Habilita la auto-configuración y registra la aplicación automáticamente en un servidor Eureka',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si defines la misma propiedad en application.properties y como variable de entorno?',
        'Se usan ambos valores: la variable de entorno para runtime y application.properties para tests', 'application.properties siempre gana porque es la fuente de configuración más específica del proyecto', 'La variable de entorno tiene mayor precedencia que application.properties', 'Spring lanza una excepción PropertyConflictException indicando la duplicidad para evitar ambigüedad',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el Actuator endpoint /actuator/env?',
        'Para modificar propiedades de configuración en caliente sin reiniciar la aplicación Spring Boot', 'Para ver solo las variables de entorno del sistema operativo que afectan a la aplicación Spring', 'Para ver los beans registrados en el contexto y sus propiedades de configuración asociadas', 'Para ver todas las propiedades de configuración activas y su origen (fichero, env var, default)',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "starter" en Spring Boot?',
        'Una dependencia de conveniencia que agrupa librerías relacionadas con su auto-configuración — por ejemplo spring-boot-starter-web incluye Tomcat, Spring MVC, Jackson', 'Un plugin de Maven/Gradle que configura el build process con las opciones óptimas para Spring Boot', 'Una plantilla de proyecto generada por Spring Initializr con la estructura de directorios y archivos básicos', 'Un script de inicio que arranca la aplicación con las propiedades de perfil correctas según el entorno',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura el graceful shutdown en Spring Boot 2.3+?',
        'Configurando spring.lifecycle.timeout-per-shutdown-phase con el tiempo máximo de espera en segundos', 'Registrando un @PreDestroy en el @SpringBootApplication que espera las conexiones activas del pool', 'Implementando SmartLifecycle y sobrescribiendo el método stop() con la lógica de espera personalizada', 'Con server.shutdown=graceful — espera a que las peticiones activas terminen antes de cerrar',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre application.properties y application.yml?',
        'Son equivalentes en funcionalidad; YAML soporta estructuras jerárquicas y listas de forma más legible, pero ambos expresan la misma configuración', 'YAML permite expresiones SpEL dentro de los valores; properties solo admite valores literales y placeholders', 'YAML soporta propiedades encriptadas nativamente con jasypt; properties requiere un plugin adicional', 'application.properties permite profiles inline; YAML requiere archivos separados por perfil como application-dev.yml',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué evento de Spring Boot se lanza justo ANTES de que el contexto sea refrescado?',
        'ApplicationEnvironmentPreparedEvent — se lanza cuando el Environment está listo pero antes del contexto', 'ApplicationContextInitializedEvent', 'ApplicationReadyEvent — se lanza cuando la aplicación está completamente lista para servir peticiones', 'ApplicationStartedEvent — se lanza cuando la aplicación ha iniciado pero antes de aceptar peticiones',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @ConditionalOnMissingBean?',
        'Para registrar un bean si no hay ningún bean del tipo especificado ya en el contexto — permite que el usuario override la auto-configuración', 'Para verificar que un bean no se ha destruido antes de inyectarlo en otro componente', 'Para registrar un bean solo en ausencia de una propiedad de configuración específica en el Environment', 'Para evitar duplicados lanzando una excepción si se detecta otro bean del mismo tipo registrado',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace el endpoint /actuator/metrics?',
        'Expone métricas de la aplicación (JVM, HTTP requests, custom) compatibles con sistemas como Prometheus/Micrometer', 'Muestra estadísticas de uso de CPU, memoria heap y threads de la JVM exclusivamente', 'Genera un reporte de rendimiento con los tiempos de respuesta de cada endpoint REST de la aplicación', 'Muestra las métricas de base de datos incluyendo número de queries, conexiones activas y pool stats',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En Spring Boot, ¿cuál es el orden correcto de precedencia de propiedades (mayor a menor)?',
        'Argumentos de línea de comandos > variables de entorno > application.properties', 'Variables de entorno > argumentos de línea de comandos > application.properties — el entorno del SO siempre gana', 'application-{profile}.properties > application.properties > variables de entorno > argumentos CLI', 'application.properties > variables de entorno > argumentos de línea de comandos — las propiedades del proyecto siempre tienen prioridad',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

-- ============================================================
-- SPRING_DATA_JPA
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el problema N+1 en JPA?',
        'Un bug conocido de Hibernate', 'Un error cuando hay más de N entidades', 'Un límite de JPA en el número de joins', 'Al cargar N entidades padre, se lanzan N queries adicionales para cargar sus colecciones — en total N+1 queries en vez de 1',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se resuelve el problema N+1 con JPQL?',
        'Usando @Query(nativeQuery = true)', 'Usando @Lazy en la relación', 'Poniendo FetchType.EAGER', 'Usando JOIN FETCH en la query para traer la colección en una sola consulta',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Modifying cuando se combina con @Query?',
        'Activa el caché de queries para que JPA reutilice el plan de ejecución en posteriores llamadas al mismo método', 'Habilita la propagación transaccional REQUIRES_NEW para garantizar que la modificación se commite inmediatamente', 'Convierte la query SELECT en una query optimizada que modifica los resultados en el caché L1 directamente', 'Indica que la query es un UPDATE o DELETE, habilitando la ejecución de queries de modificación en Spring Data JPA',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre CascadeType.REMOVE y orphanRemoval=true?',
        'CascadeType.REMOVE propaga el DELETE a los hijos al eliminar el padre; orphanRemoval convierte la relación en lazy loading al desvincular', 'CascadeType.REMOVE solo funciona con @OneToMany; orphanRemoval también funciona con @ManyToMany y @ManyToOne', 'orphanRemoval ejecuta un DELETE SQL directo sin pasar por el EntityManager; CascadeType.REMOVE usa el ciclo de vida JPA completo', 'CascadeType.REMOVE elimina los hijos al eliminar el padre; orphanRemoval también elimina hijos que son desvinculados de la colección del padre sin necesidad de eliminar el padre',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué devuelve un método de repositorio que retorna Page<T> vs Slice<T>?',
        'Page<T> y Slice<T> son equivalentes pero Page usa Pageable y Slice usa Sort como parámetro del método', 'Page<T> incluye el conteo total de elementos (ejecuta un COUNT query adicional); Slice<T> solo sabe si hay siguiente página sin hacer COUNT', 'Slice<T> incluye metadata de ordenamiento y filtrado; Page<T> solo contiene los datos y el número de página', 'Page<T> carga todos los resultados en memoria y pagina en Java; Slice<T> usa LIMIT/OFFSET SQL para eficiencia',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Version en una entidad JPA?',
        'Para guardar la versión del esquema de base de datos y detectar si la entidad necesita migración', 'Para controlar las migraciones de Flyway asegurando que la entidad sea compatible con la versión actual del esquema', 'Para mantener un historial de cambios de la entidad, incrementando la versión en cada UPDATE para auditoría', 'Para implementar optimistic locking — si dos transacciones intentan actualizar la misma entidad, la segunda falla con OptimisticLockException',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @EntityGraph en Spring Data JPA?',
        'Define la estructura de relaciones entre entidades para generar automáticamente las foreign keys en la BD', 'Configura el orden de inicialización de las entidades para resolver dependencias circulares entre tablas', 'Permite especificar qué asociaciones deben cargarse eagerly para una query específica, sin modificar la entidad', 'Genera un diagrama visual de las relaciones entre entidades que se expone en /actuator/entitygraph',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la propagación por defecto de @Transactional?',
        'REQUIRES_NEW — siempre crea una transacción nueva independiente suspendiendo la existente', 'SUPPORTS — participa en la transacción existente si hay una, pero no crea nueva si no hay', 'REQUIRED', 'MANDATORY — requiere que ya exista una transacción activa, lanzando excepción si no hay ninguna',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Con PROPAGATION_REQUIRES_NEW, ¿qué ocurre con la transacción existente al llamar al método?',
        'La transacción existente se suspende y se crea una nueva transacción independiente', 'Ambas transacciones se fusionan en una sola transacción más grande que se commitea al final del método exterior', 'Se crea un savepoint dentro de la transacción existente para poder hacer rollback parcial si falla', 'La transacción existente se commitea inmediatamente antes de crear la nueva transacción del método',
        0, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una Projection Interface en Spring Data JPA?',
        'Una interfaz de auditoría que proyecta los cambios realizados en una entidad durante una transacción', 'Una interfaz que define cómo transformar entidades JPA a DTOs usando MapStruct automáticamente', 'Una interfaz que extiende JpaRepository con métodos personalizados para proyecciones SQL específicas', 'Una interfaz con getters que mapean solo las columnas que necesitas, evitando traer toda la entidad — mejora rendimiento',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotaciones de Spring Data provee @CreatedDate y @LastModifiedDate?',
        'Requieren implementar la interfaz Auditable<T> manualmente en cada entidad que necesite tracking de fechas', 'Requieren un AuditingHandler custom que implemente la lógica de asignar fechas usando un reloj configurable', 'Son anotaciones de Hibernate que funcionan automáticamente sin configuración adicional de Spring Data', 'Forman parte de Spring Data Auditing — se activan con @EnableJpaAuditing y @EntityListeners(AuditingEntityListener.class)',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se define una relación ManyToMany con tabla intermedia personalizada en JPA?',
        'Creando una entidad intermedia con @OneToMany en ambos lados y @MapsId para las foreign keys compuestas', 'Creando un @Embeddable para la tabla intermedia y mapeándolo con @ElementCollection en ambas entidades', 'Con @ManyToMany y @JoinTable especificando joinColumns y inverseJoinColumns', 'Usando @SecondaryTable para mapear la tabla intermedia y @JoinColumn para las foreign keys en cada entidad',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se lanza LazyInitializationException?',
        'Cuando Hibernate detecta una dependencia circular entre entidades lazy y no puede resolver el proxy', 'Al intentar serializar una entidad con relaciones lazy a JSON usando Jackson sin @JsonIgnore', 'Al acceder a una colección lazy fuera del contexto de una transacción/sesión JPA activa', 'Cuando usas FetchType.EAGER y la colección tiene más elementos de los que el buffer de Hibernate puede manejar',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la Specification API de Spring Data JPA?',
        'Una API REST auto-generada por Spring Data que expone las especificaciones JPA como endpoints de búsqueda', 'Una API para definir el esquema de la BD programáticamente como alternativa a las migraciones SQL de Flyway', 'Una alternativa al QueryDSL que genera queries tipadas en compile-time a partir de las entidades JPA', 'Una forma de construir queries dinámicas y componibles usando el patrón Specification, combinables con and()/or()',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el FetchType por defecto de una relación @OneToMany?',
        'SELECT — carga la colección en una segunda query separada solo cuando se accede por primera vez', 'EAGER — carga la colección inmediatamente junto con la entidad padre en un solo JOIN SQL', 'LAZY', 'SUBSELECT — carga todas las colecciones de las entidades padre con una subquery optimizada',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué nivel de aislamiento evita "dirty reads" pero permite "non-repeatable reads"?',
        'REPEATABLE_READ — garantiza que las lecturas repetidas devuelvan siempre los mismos datos en la misma transacción', 'SERIALIZABLE — ejecuta las transacciones como si fueran secuenciales, evitando todos los problemas de concurrencia', 'READ_UNCOMMITTED — permite leer datos no commiteados de otras transacciones concurrentes', 'READ_COMMITTED',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace save() en SimpleJpaRepository cuando la entidad ya tiene un ID asignado?',
        'Lanza una excepción de duplicado', 'Siempre hace UPDATE', 'Siempre hace INSERT', 'Llama a merge() — actualiza si existe, inserta si no (comportamiento de EntityManager.merge())',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se recomienda usar LAZY loading en @ManyToOne?',
        'Porque EAGER en @ManyToOne causa un error de referencia circular cuando ambas entidades se serializan a JSON', 'Porque @ManyToOne con EAGER genera un JOIN OUTER que puede devolver resultados duplicados si hay múltiples hijos', 'Para evitar cargar innecesariamente la entidad padre cada vez que se accede al hijo, mejorando el rendimiento cuando no se necesita el padre', 'LAZY es el FetchType por defecto en @ManyToOne y cambiarlo a EAGER no tiene ningún efecto visible',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

-- ============================================================
-- SPRING_SECURITY
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Autenticación y Autorización?',
        'Autenticación usa tokens JWT y Autorización usa roles RBAC — son mecanismos completamente independientes', 'Autenticación ocurre en el API Gateway y Autorización ocurre en cada microservicio individualmente', 'Autorización verifica la identidad del usuario contra el IdP; Autenticación valida los permisos en el SecurityContext', 'Autenticación verifica QUIÉN eres (identidad); Autorización verifica QUÉ puedes hacer (permisos)',
        3, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué se usa BCrypt para hashear contraseñas en lugar de MD5 o SHA?',
        'BCrypt usa AES-256 internamente para encriptar la contraseña, permitiendo recuperarla si el usuario la olvida', 'BCrypt incluye salt automático y es intencionalmente lento/costoso computacionalmente, dificultando ataques de fuerza bruta', 'BCrypt es el único algoritmo soportado por PasswordEncoder de Spring Security desde la versión 5.0', 'BCrypt genera hashes más cortos que SHA-256, ahorrando espacio en la columna de contraseña de la BD',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué debe devolver UserDetailsService.loadUserByUsername()?',
        'Un String con el rol del usuario y el hash de la contraseña separados por dos puntos', 'Un Optional<User> con la entidad del usuario que Spring Security convierte automáticamente a UserDetails', 'Un objeto UserDetails con username, password hasheado y authorities', 'Un objeto Authentication completo con el token JWT generado y las authorities del usuario',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace sessionManagement().sessionCreationPolicy(STATELESS)?',
        'Restringe a un solo usuario simultáneo', 'Hace que las sesiones duren menos tiempo', 'Deshabilita las sesiones HTTP y Spring Security no creará ni usará HttpSession — requerido para APIs REST con JWT', 'Activa Redis para sesiones distribuidas',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿En qué parte del JWT se almacenan los claims (como username y roles)?',
        'En el Payload (segunda parte del token, codificada en Base64)', 'En el Issuer', 'En el Header', 'En la Signature',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué las APIs REST con JWT generalmente deshabilitan la protección CSRF?',
        'Porque los tokens CSRF añaden overhead significativo a cada petición REST y degradan el rendimiento de la API', 'Porque Spring Security no soporta CSRF y JWT simultáneamente por limitaciones en el FilterChainProxy', 'Porque CSRF tokens requieren estado de sesión y JWT es stateless, lo que crea un conflicto con el SecurityContextHolder', 'Porque CSRF explota cookies de sesión; al usar JWT en Authorization header (no en cookie), el vector de ataque CSRF no aplica',
        3, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @PreAuthorize y @Secured?',
        '@Secured es thread-safe y funciona con @Async; @PreAuthorize requiere que el método sea síncrono para evaluar SpEL', '@PreAuthorize solo funciona en controllers REST; @Secured funciona en cualquier bean de Spring incluyendo services', '@PreAuthorize se evalúa antes de ejecutar el método; @Secured se evalúa después, pudiendo filtrar el resultado', '@PreAuthorize soporta SpEL (Spring Expression Language) permitiendo expresiones como hasRole() && #id == authentication.name; @Secured solo soporta lista de roles',
        3, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se habilita la seguridad a nivel de método en Spring?',
        'Configurando spring.security.method.enabled=true en application.properties y reiniciando la aplicación', 'Añadiendo @EnableMethodSecurity (o @EnableGlobalMethodSecurity en versiones anteriores) a una clase @Configuration', 'Es automático al incluir spring-boot-starter-security — @PreAuthorize funciona en cualquier bean por defecto', 'Implementando MethodSecurityInterceptor y registrándolo como @Bean en la configuración de seguridad',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Dónde se almacena el objeto Authentication durante una petición en Spring Security?',
        'En una cookie segura HttpOnly que el navegador envía automáticamente con cada petición al servidor', 'En el SecurityContextHolder que usa un ThreadLocal por defecto', 'En la HttpSession del servidor, serializado como atributo con la clave SPRING_SECURITY_CONTEXT', 'En un bean @RequestScope que Spring Security crea y destruye con cada petición HTTP entrante',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un OncePerRequestFilter en Spring Security?',
        'Un filtro que solo ejecuta la lógica una vez por petición HTTP, garantizando que no se ejecute dos veces en caso de forwards/includes', 'Un filtro que se ejecuta solo en la primera petición del usuario y cachea el resultado para las siguientes', 'Un filtro de rate limiting que bloquea al usuario después de N intentos fallidos de autenticación', 'Un filtro que limita a una petición por segundo por cliente IP para prevenir ataques de fuerza bruta',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura CORS en Spring Security para APIs REST?',
        'Configurando cors().configurationSource() en el SecurityFilterChain y/o usando @CrossOrigin — Spring Security debe procesar CORS antes de validar autenticación', 'Añadiendo los headers Access-Control-Allow-Origin manualmente en cada respuesta del @RestControllerAdvice', 'Deshabilitando el filtro CORS de Spring Security con http.cors().disable() y delegando a un filtro servlet custom', 'Solo con @CrossOrigin en cada método del controller que necesite acceso cross-origin habilitado',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En OAuth2, ¿qué es un "Resource Server"?',
        'El servidor que almacena las credenciales de los usuarios y gestiona el registro y login', 'El cliente (frontend o mobile app) que solicita tokens y los presenta al acceder a recursos protegidos', 'El servidor que protege recursos y valida tokens presentados por los clientes', 'El servidor que emite y firma los tokens OAuth2 (Authorization Server) después de validar las credenciales',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué retorna http.authorizeHttpRequests().requestMatchers("/public/**").permitAll()?',
        'Hace que /public/** requiera autenticación', 'Permite acceso sin autenticación a cualquier URL que empiece con /public/', 'Solo permite acceso a usuarios con rol PUBLIC', 'Deshabilita Spring Security para esas rutas',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué status HTTP devuelve Spring Security cuando el usuario está autenticado pero no tiene permiso para acceder al recurso?',
        '404 Not Found — Spring Security oculta la existencia del recurso por seguridad cuando no hay permisos', '401 Unauthorized — Spring Security no distingue entre falta de autenticación y falta de permisos', '403 Forbidden', '409 Conflict — indica que el rol del usuario conflicta con los permisos requeridos por el endpoint',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo devuelve Spring Security 401 vs 403?',
        '401 si el token JWT expiró; 403 si el token es inválido o está mal firmado — ambos son errores de token', '401 cuando no estás autenticado (no hay credenciales válidas); 403 cuando estás autenticado pero no tienes suficientes permisos', '401 para endpoints REST y 403 para páginas web — Spring Security diferencia por el tipo de recurso solicitado', '401 cuando falta el header Authorization; 403 cuando el header está presente pero el formato es incorrecto',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema tiene guardar el JWT en localStorage?',
        'localStorage no es persistente entre sesiones del navegador — el usuario debe re-autenticarse al cerrar la pestaña', 'localStorage tiene un límite de 5MB que puede ser insuficiente para tokens JWT con muchos claims personalizados', 'Es vulnerable a ataques XSS — cualquier script malicioso puede leer localStorage. Las cookies HttpOnly son más seguras contra XSS', 'Los tokens en localStorage no se envían automáticamente, requiriendo configurar interceptores en cada petición HTTP',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace PasswordEncoder.matches(rawPassword, encodedPassword)?',
        'Verifica si rawPassword corresponde al encodedPassword sin necesidad de desencriptar (usando el mismo algoritmo)', 'Desencripta encodedPassword y compara con rawPassword', 'Encripta rawPassword y compara los hashes', 'Actualiza el hash en la base de datos',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

-- ============================================================
-- REST_API
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el código HTTP correcto al crear un recurso exitosamente con POST?',
        '202 Accepted — la creación fue aceptada y se completará de forma asíncrona en background', '201 Created', '204 No Content — éxito sin necesidad de devolver el recurso creado en el body', '200 OK — operación exitosa estándar, suficiente para indicar que el POST funcionó correctamente',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia semántica entre PUT y PATCH?',
        'PATCH es idempotente como PUT pero además garantiza orden de ejecución con operaciones concurrentes', 'PUT aplica cambios parciales enviando solo los campos modificados; PATCH reemplaza el recurso completo', 'PUT solo acepta application/json como Content-Type; PATCH también acepta application/merge-patch+json', 'PUT reemplaza el recurso completo; PATCH aplica una modificación parcial al recurso',
        3, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP debe devolver un DELETE exitoso cuando no hay cuerpo en la respuesta?',
        '204 No Content', '202 Accepted — confirma que la eliminación fue programada y se procesará en background', '200 OK — éxito estándar, con un JSON confirmando qué recurso fue eliminado y cuándo', '410 Gone — indica que el recurso fue eliminado permanentemente y no volverá a estar disponible',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa que un método HTTP sea "idempotente"?',
        'Que devuelve el mismo resultado siempre', 'Que no modifica datos', 'Que ejecutarlo múltiples veces produce el mismo efecto en el servidor que ejecutarlo una sola vez', 'Que es seguro usarlo sin autenticación',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @PathVariable y @RequestParam?',
        '@PathVariable solo funciona con tipos primitivos; @RequestParam también acepta objetos complejos y listas', '@RequestParam es obligatorio por defecto; @PathVariable es opcional y tiene un valor por defecto de null', '@PathVariable extrae valor de la URL path (/usuarios/{id}); @RequestParam extrae del query string (/usuarios?page=1)', '@PathVariable extrae valores del body del request; @RequestParam los extrae de los headers HTTP',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es apropiado usar 422 Unprocessable Entity vs 400 Bad Request?',
        '400 para errores de sintaxis/formato (JSON malformado); 422 cuando el formato es correcto pero los datos no pasan validación de negocio', '422 para errores que se originan en la base de datos (constraints, duplicados); 400 para errores de formato del request', '400 es para errores del cliente; 422 es específico de APIs que procesan datos tipo formulario o XML', 'Son equivalentes en la práctica y pueden usarse indistintamente según la preferencia del equipo',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ventaja tiene usar ResponseEntity<?> en lugar de devolver directamente el objeto?',
        'Solo ResponseEntity funciona con @RestController', 'Permite controlar explícitamente el status code, headers y body de la respuesta HTTP', 'ResponseEntity es más rápido', 'ResponseEntity serializa automáticamente a XML',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es HATEOAS en APIs REST?',
        'Un protocolo de autenticación para APIs REST basado en Hypermedia tokens que reemplazan JWT', 'Hypermedia As The Engine Of Application State — las respuestas incluyen links a las acciones disponibles, haciendo la API autodescubrible', 'Un formato de serialización de respuestas JSON que incluye metadata de tipos y validaciones del esquema', 'Una estrategia de versionado semántico para APIs REST que usa headers Hypermedia para negociar la versión',
        1, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estrategia de versionado de API más común en la URL?',
        'Usando el header X-API-Version: 1 — separa el versionado de la URI manteniendo URLs estables', 'Usando el header Accept con media type versioning: Accept: application/vnd.api.v1+json — limpio y RESTful', 'Usando query parameters: /api/usuarios?version=1 — permite versionado opcional con fallback al latest', 'Incluyendo la versión en la URI: /api/v1/usuarios — simple y visible aunque viola el principio REST de URI estable',
        3, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP debe devolverse al intentar crear un recurso que ya existe (ej: email duplicado)?',
        '400 Bad Request — el servidor no puede procesar la petición porque los datos violan una regla de validación', '412 Precondition Failed — la condición de unicidad especificada en la petición no se cumplió', '409 Conflict', '422 Unprocessable Entity — los datos tienen formato correcto pero violan una constraint de negocio',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se implementa paginación correctamente en una API REST?',
        'Aceptando parámetros page/size en el query string y devolviendo metadata (total, hasNext) junto con los datos', 'Usando cursores basados en el ID del último elemento para navegar eficientemente sin queries COUNT costosos', 'Implementando HATEOAS con links next/prev/first/last que el cliente sigue para navegar entre páginas', 'Devolviendo todos los registros en un array JSON y dejando que el frontend implemente la paginación localmente',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se sube un archivo con Spring MVC?',
        'Con @RequestBody byte[] — Spring deserializa automáticamente el archivo binario del body HTTP', 'Enviando el archivo codificado en Base64 dentro del JSON del @RequestBody del controller', 'Recibiendo un parámetro de tipo MultipartFile y el request con multipart/form-data content type', 'Con @FileUpload que lee el InputStream del request y lo convierte en un Resource de Spring',
        2, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la negociación de contenido (content negotiation) en REST?',
        'El mecanismo por el que cliente y servidor acuerdan el formato de datos (JSON, XML, etc) usando headers Accept y Content-Type', 'Negociar el precio del API', 'El proceso de autenticación del cliente', 'La compresión automática de respuestas',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('Al diseñar una API REST, ¿dónde se debe incluir el Location header?',
        'En respuestas de error (4xx/5xx) para indicar la URL de documentación del error al desarrollador', 'En todas las respuestas exitosas (2xx) para que el cliente pueda redirigir a la siguiente operación', 'En las respuestas 201 Created, indicando la URL del recurso recién creado', 'Solo en respuestas de redirección (3xx) para indicar la nueva ubicación del recurso movido',
        2, 'REST_API', 'VERDE', NOW());

-- ============================================================
-- LAMBDAS_STREAMS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué interfaz funcional usarías para una función que recibe un String y devuelve un Integer?',
        'Supplier<Integer> — interfaz que genera un Integer sin necesidad de recibir parámetros de entrada', 'Function<String, Integer>', 'Predicate<String> — interfaz que evalúa un String y devuelve un resultado numérico como Integer', 'Consumer<String> — interfaz que recibe un String, lo procesa y devuelve el resultado transformado',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la evaluación lazy en los Streams de Java?',
        'La evaluación lazy almacena el resultado de cada operación intermedia en caché para reutilizarlo en posteriores streams', 'Los streams procesan los elementos uno a uno en vez de cargar toda la colección en memoria primero', 'Las operaciones intermedias (map, filter) no se ejecutan hasta que se invoca una operación terminal (collect, forEach) — permite optimizaciones', 'Los streams se ejecutan en un hilo separado del ForkJoinPool y los resultados se consolidan al final',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre map() y flatMap() en Streams?',
        'map() aplica una función 1-a-1; flatMap() aplica una función que devuelve un Stream y los aplana, útil para colecciones de colecciones', 'map() solo funciona con números', 'flatMap() es más rápido', 'flatMap() no existe en Java 8',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.groupingBy()?',
        'Agrupa los elementos del Stream en un Map<K, List<V>> según la función clasificadora', 'Ordena los elementos por un criterio', 'Une todos los elementos en un String', 'Filtra elementos duplicados',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si intentas usar un Stream dos veces?',
        'Lanza IllegalStateException porque un Stream solo puede consumirse una vez', 'El Stream se reinicia automáticamente desde el source y procesa los elementos desde el principio', 'Devuelve un Stream vacío en la segunda iteración ya que todos los elementos fueron consumidos', 'Java crea una copia del Stream original automáticamente para permitir el reutilizo transparente',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Optional.orElse() y Optional.orElseGet()?',
        'orElse() siempre evalúa el argumento (incluso si el Optional tiene valor); orElseGet() recibe un Supplier que solo se invoca si el Optional está vacío — más eficiente para operaciones costosas', 'orElseGet() es obsoleto en Java 11', 'orElse() lanza excepción si está vacío', 'Son idénticos',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué interfaz funcional usarías para una operación que consume un valor pero no devuelve nada?',
        'Predicate<T> — interfaz que evalúa una condición sobre el valor recibido y devuelve boolean', 'Supplier<T> — interfaz que proporciona un valor sin recibir argumentos, útil para factories lazy', 'Function<T, Void> — interfaz que recibe un valor de tipo T y retorna Void para indicar operación sin resultado', 'Consumer<T>',
        3, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es apropiado usar un parallel stream?',
        'Siempre que el Stream tenga más de 100 elementos, ya que el overhead de paralelismo se amortiza rápidamente', 'Cuando se ejecuta dentro de un @Async method, ya que Spring configura el ForkJoinPool óptimamente para el contexto', 'Para operaciones CPU-intensivas sobre colecciones grandes donde el overhead de paralelismo se amortiza — NO para operaciones I/O o colecciones pequeñas', 'Para operaciones I/O-intensivas como llamadas HTTP o lectura de archivos, donde el paralelismo aprovecha la espera',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Stream.peek()?',
        'Devuelve el primer elemento', 'Comprueba si el stream tiene elementos', 'Pausa el stream hasta que se consuma', 'Es una operación intermedia que permite ejecutar una acción (como logging) en cada elemento sin modificarlo — útil para debugging',
        3, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se convierte una lista de strings a un solo String separado por comas con Streams?',
        'list.stream().reduce(", ", String::concat) — reduce usando concat con ", " como identity', 'list.stream().map(s -> s + ", ").collect(Collectors.toList()).toString() — mapea y concatena con toString', 'list.stream().collect(Collectors.joining(", "))', 'String.join(", ", list) — método estático de String que también funciona pero sin necesidad de streams',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una referencia a método estático en Java?',
        'La forma compacta ClassName::methodName para referenciar un método estático como lambda — equivalente a x -> ClassName.methodName(x)', 'Un método que no puede ser sobrescrito por subclases al ser final y estático simultáneamente', 'Una referencia a un método de instancia de una clase específica que se invoca en un contexto estático', 'Una lambda que referencia a un campo estático de la clase para usar su valor como argumento de la función',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.partitioningBy()?',
        'Filtra elementos según un criterio', 'Ordena y divide por rangos', 'Divide el stream en N partes iguales', 'Divide los elementos en dos grupos (true/false) según un Predicate, devolviendo Map<Boolean, List<T>>',
        3, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si una lambda captura una variable local?',
        'La variable debe ser efectivamente final (no modificada después de la captura) — de lo contrario el compilador da error', 'La variable se convierte automáticamente en un AtomicReference para garantizar thread-safety en la lambda', 'Java crea una copia profunda de la variable en el heap para que la lambda tenga su propia instancia independiente', 'La variable se serializa junto con la lambda para permitir su ejecución remota en parallel streams',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre Stream.of() y Arrays.stream() para arrays de primitivos?',
        'Arrays.stream() requiere Java 11', 'Stream.of() es más eficiente', 'Son idénticos', 'Arrays.stream(int[]) devuelve IntStream (sin boxing); Stream.of(int[]) devolvería Stream<int[]> — un Stream con un solo elemento que es el array completo',
        3, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el propósito de Optional en Java?',
        'Reemplazar completamente el uso de null en Java, convirtiendo NullPointerException en NoSuchElementException', 'Mejorar el rendimiento eliminando null checks innecesarios mediante optimización en compile-time del bytecode', 'Representar explícitamente la posibilidad de ausencia de un valor, forzando al programador a manejar el caso vacío y eliminando NullPointerExceptions implícitos', 'Envolver objetos para habilitar programación reactiva con Mono<T> y Flux<T> de Project Reactor',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace reduce() en un Stream?',
        'Elimina elementos duplicados', 'Combina todos los elementos del stream en un único valor aplicando una función acumuladora de forma sucesiva', 'Reduce el tamaño del stream filtrando elementos', 'Ordena el stream de mayor a menor',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo devuelve Collectors.toMap() cuando hay claves duplicadas sin merge function?',
        'Crea una lista como valor para cada clave duplicada', 'Lanza IllegalStateException por clave duplicada', 'Sobrescribe con el último valor', 'Ignora los duplicados y guarda el primer valor',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

-- ============================================================
-- JAVA_CORE
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo funciona internamente HashMap al hacer put(key, value)?',
        'Almacena las entradas en un array ordenado por hashCode y usa búsqueda binaria para encontrar el bucket correspondiente', 'Usa una tabla de hashing perfecto generada en compile-time que garantiza O(1) sin colisiones para tipos estándar', 'Distribuye las entradas entre múltiples arrays internos usando consistent hashing para minimizar redistribuciones al crecer', 'Calcula hashCode() de la clave, determina el bucket, y si hay colisión almacena en una lista enlazada (o árbol en Java 8+ cuando la lista supera 8 elementos)',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si sobrescribes equals() pero no hashCode()?',
        'Viola el contrato equals/hashCode: dos objetos iguales según equals() pueden tener hashCodes distintos, rompiendo el comportamiento de HashMap, HashSet, etc.', 'Java genera automáticamente un hashCode() consistente basado en los campos usados en equals() via reflection', 'El compilador genera un warning pero el programa funciona correctamente porque HashMap usa equals() como fallback', 'La JVM detecta la inconsistencia en runtime y usa el hashCode() de Object como respaldo para colecciones hash',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre TreeMap y LinkedHashMap?',
        'TreeMap usa hashing con encadenamiento para mantener orden; LinkedHashMap usa un árbol rojo-negro interno para acceso O(log n)', 'LinkedHashMap ordena por valor usando Comparable; TreeMap ordena por clave y permite rangos con subMap()', 'TreeMap garantiza thread-safety con locks por segmento; LinkedHashMap no es thread-safe pero es más rápido en single-thread', 'TreeMap ordena por clave natural (o Comparator) en O(log n); LinkedHashMap mantiene el orden de inserción con acceso O(1)',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías LinkedList sobre ArrayList?',
        'Cuando las operaciones dominantes son inserción/eliminación en posiciones arbitrarias (O(1) con iterator) y no acceso aleatorio. En práctica, ArrayList suele ser más rápido por localidad de caché', 'Cuando necesitas una cola FIFO thread-safe ya que LinkedList implementa BlockingQueue para concurrencia', 'Cuando necesitas acceso aleatorio frecuente por índice ya que LinkedList implementa RandomAccess internamente', 'Cuando la colección supera los 10.000 elementos porque ArrayList necesita arrays contiguos que fragmentan la memoria heap',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el String Pool en Java?',
        'Un área del stack donde se almacenan Strings locales de cada método para acceso rápido sin pasar por el heap', 'Un área en el heap (PermGen/Metaspace) donde Java almacena String literals para reutilizarlos — s1 == s2 puede ser true si ambos son literals iguales', 'Una caché LRU que almacena Strings frecuentemente usados para optimizar comparaciones con equals() y hashCode()', 'Un buffer circular que almacena los últimos N Strings creados para reducir la presión sobre el garbage collector',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Comparable y Comparator?',
        'Comparable define el orden natural en la propia clase (compareTo); Comparator es externo, permite múltiples criterios de ordenamiento sin modificar la clase', 'Comparable es para ordenamiento ascendente exclusivamente; Comparator permite definir orden ascendente y descendente', 'Comparator genera código de ordenamiento en compile-time via annotation processing; Comparable usa reflexión en runtime', 'Comparable usa compareTo() y solo funciona con tipos numéricos; Comparator usa compare() y funciona con cualquier tipo de objeto',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantiza volatile en Java respecto a la visibilidad?',
        'Garantiza que las lecturas/escrituras de la variable sean siempre de/a memoria principal, no caché del hilo — garantiza visibilidad pero NO atomicidad para operaciones compuestas como i++', 'Hace la variable completamente thread-safe para cualquier operación incluyendo incrementos atómicos como i++', 'Convierte la variable en inmutable una vez asignada, lanzando IllegalStateException si se intenta modificar desde otro hilo', 'Aplica un memory barrier completo que previene cualquier reordenamiento de instrucciones antes y después de la variable',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el type erasure en Java Generics?',
        'La eliminación de tipos redundantes en compile-time para optimizar el tamaño del bytecode generado por javac', 'Los tipos genéricos se borran en tiempo de compilación — en bytecode List<String> y List<Integer> son simplemente List. Impide reflection sobre tipos genéricos', 'El proceso por el que la JVM elimina las referencias a tipos no usados durante el garbage collection de clases', 'La optimización del JIT compiler que reemplaza tipos genéricos por tipos concretos para evitar boxing/unboxing',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre checked y unchecked exceptions?',
        'Checked exceptions se registran en el log automáticamente; unchecked exceptions se propagan silenciosamente sin traza', 'Checked exceptions solo se lanzan en código síncrono; unchecked exceptions también se propagan en CompletableFuture y parallel streams', 'Checked exceptions heredan de Exception (no RuntimeException) y el compilador obliga a manejarlas o declararlas; unchecked heredan de RuntimeException y son opcionales', 'Unchecked exceptions son más graves y causan terminación del programa; checked exceptions son recuperables y permiten retry',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es try-with-resources en Java?',
        'Una sintaxis que garantiza que los recursos que implementan AutoCloseable se cierran automáticamente al salir del bloque, incluso con excepciones', 'Un bloque try que ejecuta el finally antes del catch para garantizar que los recursos se liberan antes del manejo de error', 'Una forma de manejar múltiples excepciones en un catch multi-tipo usando la sintaxis try(Exception1 | Exception2)', 'Una forma de intentar operaciones con retry automático configurable usando exponential backoff entre intentos',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema puede ocurrir con el autoboxing en colecciones?',
        'El boxing automático falla silenciosamente con valores extremos (MAX_VALUE, MIN_VALUE) devolviendo null en vez de lanzar excepción', 'Integer cache solo va de -128 a 127: Integer a = 1000; Integer b = 1000; a == b es FALSE (son objetos distintos). Además el boxing/unboxing genera overhead y posibles NullPointerExceptions', 'El autoboxing causa memory leaks porque los objetos wrapper no son elegibles para garbage collection mientras la colección exista', 'Las colecciones genéricas no aceptan tipos primitivos por diseño, pero el autoboxing resuelve esto sin problemas de rendimiento',
        1, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo resuelve Java el "diamond problem" con interfaces default methods?',
        'Java no tiene diamond problem porque las interfaces no pueden tener implementaciones de métodos, solo firmas abstractas', 'El compilador elige automáticamente el método de la primera interfaz en el orden de declaración del implements', 'Si una clase implementa dos interfaces con el mismo método default, debe sobrescribirlo obligatoriamente; puede llamar a la implementación específica con Interface.super.method()', 'Java prohíbe implementar dos interfaces que declaren métodos default con la misma firma y parámetros',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es ConcurrentHashMap y cómo difiere de Collections.synchronizedMap()?',
        'ConcurrentHashMap usa segmentación/locks por bucket en Java 8 (CAS operations) permitiendo alta concurrencia; synchronizedMap usa un lock global bloqueando todo el mapa para cada operación', 'synchronizedMap es más rápido para escrituras frecuentes porque usa un solo lock optimizado; ConcurrentHashMap es mejor para lecturas', 'ConcurrentHashMap no permite null como key ni como value; synchronizedMap permite ambos igual que HashMap normal', 'ConcurrentHashMap crea copias del mapa para cada hilo (copy-on-write); synchronizedMap comparte una instancia con lock global',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CompletableFuture en Java?',
        'Una implementación de Future que permite encadenar operaciones asíncronas (thenApply, thenCompose, thenCombine) y manejar errores sin bloquear el hilo', 'Un thread pool gestionado por la JVM que distribuye tareas automáticamente entre los cores disponibles del procesador', 'Una implementación de Future que ejecuta tareas en el thread del caller sin crear nuevos hilos para operaciones simples', 'Una versión simplificada de ExecutorService que permite enviar tareas con timeout y cancelación automática',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué String es inmutable en Java?',
        'Porque los arrays de char internos son final y no pueden redimensionarse una vez creados por el constructor', 'Por limitaciones del garbage collector que no puede rastrear mutaciones en objetos compartidos entre hilos', 'Para optimizar el rendimiento del operador + que concatena strings creando nuevos objetos en vez de modificar existentes', 'Por diseño: seguridad (no se puede alterar un String usado como parámetro), thread-safety automático, y permite el String Pool — múltiples referencias al mismo objeto literal',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el wildcard correcto para un método que acepta List de cualquier tipo que sea Number o subclase?',
        'List<Number> — acepta solo List<Number> exactamente, no List<Integer> ni List<Double> por invarianza de generics', 'List<T extends Number> — declara un type parameter T acotado que permite operaciones con el tipo concreto dentro del método', 'List<? extends Number>', 'List<? super Number> — acepta Number y cualquier supertipo, permite añadir Number pero el tipo de lectura es Object',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace String.intern()?',
        'Añade el String al String Pool y devuelve la referencia del pool, permitiendo comparación con == para Strings que no son literals', 'Verifica si el String es un literal del código fuente y devuelve true/false indicando si está en el pool', 'Elimina espacios en blanco al inicio y final del String, equivalente a String.strip() introducido en Java 11', 'Convierte el String a formato interno compacto Latin-1 de Java 9+ para reducir el consumo de memoria',
        0, 'JAVA_CORE', 'MARRON', NOW());

-- ============================================================
-- MICROSERVICIOS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los tres estados de un Circuit Breaker?',
        'Closed (normal), Open (bloqueando llamadas), Half-Open (probando si el servicio se recuperó)', 'Activo (procesando requests normalmente), Inactivo (rechazando todo el tráfico), Degradado (procesando con timeout reducido)', 'Conectado (enlazado al servicio destino), Desconectado (sin conexión al destino), Reconectando (intentando restablecer la conexión)', 'Healthy (0% errores), Warning (>50% errores con retry automático), Critical (>90% errores con fallback activado)',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se registra un microservicio en Eureka?',
        'Añadiendo spring-cloud-starter-netflix-eureka-client al proyecto y configurando eureka.client.service-url.defaultZone', 'Registrándolo en el API Gateway con una ruta en application.yml que Eureka sincroniza con su registro interno', 'Llamando a la API REST de Eureka manualmente con un POST al endpoint /eureka/apps/{appName} al iniciar el servicio', 'Configurando un DNS SRV record que Eureka escanea automáticamente para descubrir nuevos servicios en la red',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Saga en microservicios?',
        'Un patrón para gestionar transacciones distribuidas dividiendo la operación en una secuencia de transacciones locales con compensaciones si algo falla', 'Un patrón de caché distribuido que replica datos entre microservicios para reducir la latencia de consultas cross-service', 'Un patrón de comunicación asíncrona donde cada servicio publica y consume eventos a través de un event bus central', 'Un patrón para diseñar APIs REST que encadenan múltiples llamadas síncronas en una sola transacción HTTP distribuida',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Saga coreografía y orquestación?',
        'En coreografía cada servicio reacciona a eventos y publica los suyos (sin coordinador central); en orquestación un orquestador central coordina el flujo', 'La coreografía requiere un service mesh (Istio/Linkerd) para funcionar; la orquestación solo necesita un message broker', 'La orquestación usa comunicación síncrona (HTTP/gRPC) mientras la coreografía usa asíncrona (Kafka/RabbitMQ) exclusivamente', 'Coreografía es para sagas simples con 2-3 servicios; orquestación escala mejor para flujos complejos con más de 5 servicios',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CQRS?',
        'Command Query Responsibility Segregation — separar el modelo de escritura (commands) del modelo de lectura (queries) para optimizar cada uno independientemente', 'Cross-service Query Resolution System — un patrón para resolver queries que requieren datos de múltiples microservicios', 'Create-Query-Read-Store — patrón de cuatro operaciones básicas que reemplaza CRUD en arquitecturas de microservicios', 'Consistent Query Routing Service — un servicio que rutea queries a la réplica de BD más cercana geográficamente',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve un API Gateway en microservicios?',
        'Solo para agregar CORS headers y traducir entre protocolos (HTTP a gRPC, REST a GraphQL) de forma transparente', 'Solo para balanceo de carga round-robin entre las instancias de cada microservicio registrado en Eureka', 'Es el punto de entrada único que maneja routing, autenticación, rate limiting, logging y composición de respuestas de múltiples servicios', 'Para almacenar tokens JWT de sesión en Redis y distribuirlos entre los microservicios downstream',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "idempotent consumer" en sistemas de mensajería?',
        'Un consumidor que valida la integridad del mensaje con checksums antes de procesarlo para evitar corrupción', 'Un consumidor que puede procesar el mismo mensaje múltiples veces sin efectos adversos — crucial en sistemas at-least-once delivery', 'Un consumidor con alta disponibilidad que mantiene réplicas activas-pasivas para failover automático', 'Un consumidor que procesa mensajes exactamente una vez usando transacciones distribuidas XA con el broker',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace un Feign Client en Spring Cloud?',
        'Genera documentación OpenAPI automáticamente a partir de las interfaces de los clientes REST declarativos', 'Gestiona las conexiones JDBC remotas entre microservicios que comparten una base de datos distribuida', 'Actúa como proxy inverso entre microservicios para añadir circuit breaking y retry automático a las llamadas', 'Permite llamar a APIs REST de otros servicios de forma declarativa con interfaces Java anotadas, sin escribir código HTTP manual',
        3, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Strangler Fig en microservicios?',
        'Una técnica de deployment donde se despliega una nueva versión que coexiste con la anterior hasta validar su estabilidad', 'Una estrategia de migración incremental de monolito a microservicios: se crea el nuevo sistema alrededor del viejo, redirigiendo tráfico gradualmente hasta que el monolito puede eliminarse', 'Un antipatrón donde un microservicio crece hasta convertirse en un monolito que "estrangula" a los demás servicios', 'Un patrón para gestionar dependencias circulares entre microservicios usando un mediador que desacopla las llamadas',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la consistencia eventual en sistemas distribuidos?',
        'El comportamiento donde cada nodo prioriza la consistencia local antes de sincronizar con los demás nodos del cluster', 'Un nivel de aislamiento de base de datos equivalente a READ_UNCOMMITTED pero para sistemas distribuidos multi-nodo', 'El modelo donde el sistema garantiza que, si no hay más actualizaciones, todos los nodos eventualmente convergen al mismo estado — a cambio de mayor disponibilidad', 'Un bug en sistemas distribuidos donde los datos quedan temporalmente inconsistentes y debe corregirse con transacciones XA',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es distributed tracing y para qué sirve?',
        'Una técnica de debugging remoto que permite pausar la ejecución de un microservicio y inspeccionar su estado en producción', 'Un sistema de monitoreo de CPU y memoria que correlaciona métricas de infraestructura entre los hosts del cluster', 'El seguimiento de una petición a través de múltiples microservicios usando trace IDs — permite diagnosticar latencia y errores en sistemas distribuidos (ej: Zipkin, Jaeger)', 'Un sistema de logging centralizado que agrega los logs de todos los microservicios en un solo dashboard como ELK Stack',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es el principal beneficio del Config Server de Spring Cloud?',
        'Distribuye las propiedades de configuración usando Consul como backend para alta disponibilidad multi-region', 'Centraliza la configuración de todos los microservicios en un repositorio Git, permitiendo cambios de configuración sin redesplegar los servicios', 'Valida las propiedades de configuración contra un esquema JSON y rechaza configuraciones inválidas antes del arranque', 'Encripta automáticamente todas las propiedades sensibles usando AES-256 antes de almacenarlas en el repositorio Git',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Event Sourcing?',
        'Un patrón para publicar eventos de dominio entre microservicios usando el ApplicationEventPublisher de Spring', 'El patrón donde en lugar de guardar el estado actual, se guardan todos los eventos que han ocurrido — el estado se reconstruye reproduciéndolos', 'Un sistema de logging estructurado que registra cada cambio de estado como un evento inmutable para auditoría completa', 'Una técnica para procesar eventos en tiempo real usando Apache Kafka Streams o Spring Cloud Stream con windowing',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema resuelve el Circuit Breaker pattern?',
        'La sincronización de configuración entre microservicios cuando el Config Server está caído o inaccesible', 'La autenticación y autorización entre microservicios cuando el IdP central está temporalmente no disponible', 'Evita que un fallo en cascada colapse todo el sistema: cuando un servicio falla repetidamente, el circuit breaker "abre" y retorna un fallback inmediato sin esperar timeouts', 'El balanceo de carga entre instancias de un mismo microservicio cuando algunas están más cargadas que otras',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

-- ============================================================
-- DOCKER_DEVOPS
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre CMD y ENTRYPOINT en un Dockerfile?',
        'CMD define el ejecutable base que no puede sobreescribirse; ENTRYPOINT añade argumentos por defecto modificables al ejecutar docker run', 'ENTRYPOINT define el ejecutable principal (no se sobreescribe fácilmente); CMD proporciona argumentos por defecto que sí pueden sobreescribirse al ejecutar docker run', 'CMD se ejecuta durante el docker build para preparar la imagen; ENTRYPOINT se ejecuta al iniciar el contenedor en runtime', 'ENTRYPOINT solo funciona con la sintaxis exec form (array JSON); CMD funciona tanto con shell form como exec form',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve un multi-stage build en Docker?',
        'Para separar el entorno de compilación del de ejecución — compilas en una imagen completa (con JDK, Maven) y copias solo el artefacto final a una imagen mínima (JRE), reduciendo el tamaño', 'Para ejecutar múltiples procesos dentro de un mismo contenedor usando supervisor de procesos integrado en Docker', 'Para construir la imagen en múltiples servidores de CI/CD en paralelo y combinar los artefactos al final', 'Para crear variantes de la imagen (dev, staging, prod) con diferentes configuraciones en un solo Dockerfile',
        0, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace COPY vs ADD en Dockerfile?',
        'COPY hereda los permisos del archivo original; ADD establece permisos root por defecto requiriendo chmod explícito', 'ADD valida la integridad del archivo con checksums antes de copiar; COPY no realiza validaciones de integridad', 'COPY soporta archivos remotos via URL y descompresión automática; ADD solo copia archivos locales sin transformación', 'COPY copia ficheros locales; ADD también puede descomprimir tar.gz locales y descargar URLs remotas — se recomienda COPY por claridad salvo que necesites las funcionalidades extra de ADD',
        3, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué el orden de las instrucciones en un Dockerfile importa?',
        'Docker ejecuta todas las instrucciones secuencialmente sin optimización, por lo que el orden no afecta al resultado final', 'Docker cachea las capas — si una capa cambia, todas las posteriores se invalidan. Se deben poner las instrucciones que cambian menos (dependencias) antes que el código fuente', 'Solo importa para multi-stage builds donde las etapas se ejecutan en el orden declarado y comparten artefactos intermedios', 'El orden afecta la seguridad de la imagen porque cada capa hereda los permisos de la anterior acumulativamente',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un volumen en Docker y para qué se usa?',
        'Una partición del filesystem del host que se monta como read-only dentro del contenedor para configuración', 'La memoria RAM asignada al contenedor que se configura con --memory al ejecutar docker run', 'El espacio en disco máximo que puede usar el contenedor, configurable con storage drivers como overlay2', 'Un mecanismo para persistir datos fuera del contenedor — los datos sobreviven al contenedor y pueden compartirse entre contenedores',
        3, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre contenedor y máquina virtual?',
        'Los contenedores comparten el kernel del SO host siendo más ligeros y rápidos; las VMs virtualizan hardware completo con su propio kernel — los contenedores sacrifican aislamiento por eficiencia', 'Los contenedores virtualizan el hardware completo incluyendo CPU y memoria; las VMs solo virtualizan el sistema de archivos', 'Las VMs usan namespaces y cgroups del kernel Linux; los contenedores usan hypervisores como KVM o VirtualBox', 'Los contenedores son más seguros por tener aislamiento completo de hardware; las VMs comparten recursos del host',
        0, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve .dockerignore?',
        'Para ignorar errores de Docker build y continuar la construcción aunque algunas instrucciones fallen', 'Para excluir servicios específicos del docker-compose cuando se ejecuta en modo desarrollo local', 'Para excluir ficheros/directorios del contexto de build de Docker, evitando enviar archivos innecesarios (node_modules, .git, .env) al daemon', 'Para ignorar imágenes base obsoletas del caché local y forzar la descarga de versiones actualizadas',
        2, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un health check en Docker?',
        'Un monitoreo del uso de CPU del contenedor', 'Una verificación de la imagen antes de ejecutar', 'Una instrucción que permite a Docker saber si el contenedor está sano — ejecuta un comando periódicamente y marca el contenedor como healthy/unhealthy', 'Un comando que verifica si Docker Desktop está instalado',
        2, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace depends_on en docker-compose?',
        'Comparte variables entre servicios', 'Establece el orden de arranque de los servicios — pero OJO: solo espera a que el contenedor inicie, no a que la aplicación dentro esté lista', 'Establece dependencias de red', 'Copia ficheros entre servicios',
        1, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los "layered JARs" en Spring Boot y por qué mejoran Docker?',
        'Spring Boot 2.3+ puede crear JARs con capas separadas (dependencies, snapshot-dependencies, application) que se mapean a capas Docker — el código de aplicación cambia frecuentemente pero las dependencias no, optimizando el caché', 'Una forma de comprimir el JAR final', 'JARs divididos en múltiples archivos ZIP', 'JARs que cargan clases de forma lazy',
        0, 'DOCKER_DEVOPS', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son las etapas típicas de un pipeline CI/CD?',
        'Build → Deploy → Test', 'Commit → Push → Done', 'Source → Build → Test → Staging deploy → Production deploy (con posibles etapas de análisis de código, seguridad, etc.)', 'Solo build y deploy',
        2, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En GitHub Actions, ¿qué es un "workflow"?',
        'Un script de bash que se ejecuta en el servidor', 'Un contenedor Docker con instrucciones de build', 'Un fichero YAML en .github/workflows/ que define un proceso automatizado con triggers (push, PR) y jobs con steps', 'Un plugin de GitHub para CI/CD',
        2, 'DOCKER_DEVOPS', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es mala práctica poner secretos (passwords, API keys) como ENV en un Dockerfile?',
        'Los valores ENV quedan grabados en las capas de la imagen y son visibles con docker inspect o docker history — deben pasarse en runtime con -e o usando Docker secrets/Kubernetes secrets', 'ENV se borra automáticamente después del build', 'ENV no funciona para datos sensibles', 'Solo es problema en imágenes públicas',
        0, 'DOCKER_DEVOPS', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la instrucción EXPOSE en un Dockerfile?',
        'Configura el firewall del contenedor', 'Abre el puerto del contenedor para acceso externo', 'Es documentación que indica qué puertos usa el contenedor — NO publica el puerto automáticamente; para eso se usa -p al ejecutar docker run', 'Conecta el contenedor a una red',
        2, 'DOCKER_DEVOPS', 'MEDIUM', NOW());

-- ============================================================
-- PATRONES_DISENO
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la forma más segura de implementar Singleton en Java moderno?',
        'Usando un campo static con double-checked locking y volatile para garantizar thread-safety en la inicialización lazy', 'Usando el BeanFactory de Spring con scope singleton, delegando la gestión del ciclo de vida al contenedor IoC', 'Usando un enum — garantiza una sola instancia, thread-safe por la JVM, y sobrevive a serialización correctamente', 'Usando un synchronized en el constructor private y un método static getInstance() con inicialización eagerly',
        2, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Factory Method y Abstract Factory?',
        'Factory Method crea objetos de una sola jerarquía; Abstract Factory combina múltiples Factory Methods en una interfaz cohesiva', 'Factory Method usa reflexión para instanciar la clase concreta; Abstract Factory usa constructores directos con type safety', 'Abstract Factory es una versión simplificada de Factory Method que elimina la necesidad de subclases en el código cliente', 'Factory Method define un método para crear un objeto, dejando que las subclases decidan la clase concreta; Abstract Factory proporciona una interfaz para crear familias de objetos relacionados',
        3, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Builder?',
        'Para construir objetos complejos paso a paso, separando la construcción de la representación — especialmente útil cuando hay muchos parámetros opcionales', 'Para crear instancias inmutables de clases que requieren validación de invariantes en el constructor', 'Para construir interfaces gráficas de usuario de forma programática usando un DSL fluent en Java', 'Para implementar el patrón Repository en Spring Data generando queries SQL a partir de nombres de métodos',
        0, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema resuelve el patrón Strategy?',
        'Permite crear múltiples instancias de una clase con diferentes configuraciones usando el mismo constructor', 'Gestiona el ciclo de vida de objetos complejos con múltiples estados y transiciones definidas en una máquina de estados', 'Sincroniza el acceso concurrente a un recurso compartido permitiendo múltiples lectores pero un solo escritor', 'Define una familia de algoritmos intercambiables encapsulados en clases, permitiendo cambiar el algoritmo en runtime sin modificar el cliente',
        3, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo implementa Spring el patrón Repository?',
        'Mediante annotation processing en compile-time que genera las implementaciones concretas como clases Java en target/generated-sources', 'Usando AOP con @Around advice que intercepta las llamadas a los métodos de la interfaz y ejecuta las queries correspondientes', 'Las interfaces que extienden JpaRepository/CrudRepository — Spring genera la implementación en tiempo de ejecución mediante proxies', 'Mediante clases abstractas que el desarrollador extiende implementando los métodos CRUD específicos de cada entidad',
        2, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál de los principios SOLID establece que una clase debe tener solo una razón para cambiar?',
        'Open/Closed Principle — el código debe estar abierto a extensión y cerrado a modificación directa', 'Liskov Substitution Principle — las subclases deben poder sustituir a sus clases base sin alterar el comportamiento', 'Single Responsibility Principle', 'Interface Segregation Principle — los clientes no deben depender de interfaces que no utilizan',
        2, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué establece el Liskov Substitution Principle?',
        'Las interfaces deben ser pequeñas y específicas para cada cliente en vez de tener una interfaz grande para todos', 'Si S es subtipo de T, los objetos de T en un programa pueden reemplazarse por objetos de S sin alterar el comportamiento correcto del programa', 'El código debe estar abierto para extensión (via herencia o composición) y cerrado para modificación directa', 'Las clases base no deben conocer sus subclases ni depender de sus implementaciones concretas para funcionar correctamente',
        1, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Observer?',
        'Para monitorear excepciones y errores en la aplicación usando un sistema de callbacks registrados globalmente', 'Para implementar logging estructurado en Spring usando logback con appenders que observan los eventos del ApplicationContext', 'Define una dependencia uno-a-muchos donde cuando un objeto (subject) cambia de estado, todos sus dependientes (observers) son notificados automáticamente', 'Para observar y registrar métricas de rendimiento de la aplicación usando un sistema de interceptores AOP',
        2, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón DTO (Data Transfer Object)?',
        'Un objeto simple que transporta datos entre capas (ej: de controller a service) sin lógica de negocio, desacoplando la API del modelo de dominio', 'Un objeto que se persiste en la base de datos', 'Un objeto inmutable para configuración', 'Un patrón para transferir archivos entre microservicios',
        0, 'PATRONES_DISENO', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo implementa Spring AOP el patrón Proxy?',
        'Wrapping beans con proxies JDK (si implementan interfaz) o CGLIB (si no) que interceptan llamadas a métodos para aplicar advice antes/después de la ejecución', 'Usando reflection directamente en cada llamada al método para verificar si hay advices configurados antes de ejecutar', 'Modificando el bytecode de la clase directamente en tiempo de carga (load-time weaving) usando un agente Java especial', 'Generando subclases en tiempo de compilación via annotation processing que añaden los interceptores como bytecode adicional',
        0, 'PATRONES_DISENO', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Template Method?',
        'Una forma de implementar métodos default en interfaces de Java que proporcionan una implementación base extensible', 'Define el esqueleto de un algoritmo en la clase base, delegando algunos pasos a subclases sin cambiar la estructura general del algoritmo', 'Un patrón para crear templates de respuesta HTTP reutilizables con formato JSON estandarizado para la API REST', 'Un patrón para generar código boilerplate automáticamente usando annotation processing como lo hace Lombok',
        1, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué establece el Dependency Inversion Principle?',
        'Que las dependencias externas (librerías, frameworks) deben encapsularse detrás de interfaces propias del proyecto', 'Que las dependencias deben inyectarse con @Autowired en vez de instanciarse con new dentro de la clase', 'Los módulos de alto nivel no deben depender de módulos de bajo nivel; ambos deben depender de abstracciones (interfaces)', 'Que cada clase singleton debe gestionar sus propias dependencias a través de un factory method interno',
        2, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el patrón Adapter?',
        'Para adaptar la configuración entre entornos (dev, staging, prod) usando profiles de Spring automáticamente', 'Para transformar DTOs de entrada en entidades JPA de forma bidireccional usando MapStruct como implementación', 'Permite que clases con interfaces incompatibles trabajen juntas — convierte la interfaz de una clase en otra interfaz que el cliente espera', 'Para adaptar el rendimiento de la aplicación automáticamente según la carga del servidor usando auto-scaling',
        2, 'PATRONES_DISENO', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo viola el Open/Closed Principle añadir un switch/case a un método existente?',
        'Nunca, switch/case es una buena práctica', 'Solo en clases de servicio', 'Cuando se añaden casos para nuevos tipos de objetos — cada adición modifica código existente. La solución es polimorfismo o Strategy pattern para que sea abierto a extensión sin modificar', 'Solo cuando el switch tiene más de 5 casos',
        2, 'PATRONES_DISENO', 'HARD', NOW());

-- ============================================================
-- SQL_DB
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre INNER JOIN y LEFT JOIN?',
        'LEFT JOIN es más eficiente porque lee solo la tabla izquierda; INNER JOIN necesita leer ambas tablas completas', 'INNER JOIN devuelve solo filas con coincidencia en ambas tablas; LEFT JOIN devuelve todas las filas de la tabla izquierda aunque no haya coincidencia en la derecha (con NULL)', 'INNER JOIN preserva el orden de las filas; LEFT JOIN reordena los resultados poniendo las coincidencias primero', 'INNER JOIN combina filas por foreign key; LEFT JOIN combina por cualquier condición de la cláusula ON',
        1, 'SQL_DB', 'EASY', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre DELETE y TRUNCATE?',
        'TRUNCATE permite filtrar con WHERE igual que DELETE pero ejecuta la eliminación de forma más eficiente usando batch processing', 'DELETE elimina filas según WHERE y puede hacerse rollback; TRUNCATE elimina todas las filas de golpe, es más rápido pero no es transaccional en algunos SGBD y resetea el auto-increment', 'DELETE marca las filas como eliminadas (soft delete) manteniendo los datos; TRUNCATE las borra físicamente del disco', 'DELETE usa DDL (Data Definition Language) y TRUNCATE usa DML (Data Manipulation Language) para operar sobre los datos',
        1, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un índice "covering" (cubriente)?',
        'Un índice que es más grande que la tabla', 'Un índice en todas las columnas de una tabla', 'Un índice que contiene todas las columnas necesarias para una query — la BD puede responder consultando solo el índice sin acceder a la tabla principal', 'Un índice que cubre todas las tablas de la BD',
        2, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre UNION y UNION ALL?',
        'UNION puede combinar más de 2 queries en una sola operación; UNION ALL solo combina exactamente 2 queries', 'UNION ALL ordena los resultados automáticamente; UNION los devuelve en el orden de las queries originales', 'UNION ALL permite combinar queries con diferente número de columnas rellenando con NULL; UNION requiere el mismo número', 'UNION elimina filas duplicadas (hace DISTINCT); UNION ALL incluye todos los resultados incluyendo duplicados — UNION ALL es más eficiente si no necesitas eliminar duplicados',
        3, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué se usa GROUP BY y cuándo se añade HAVING?',
        'HAVING reemplaza a WHERE cuando se usa GROUP BY porque WHERE no puede filtrar después del agrupamiento', 'GROUP BY ordena los resultados por la columna especificada; HAVING filtra las filas antes de la ordenación', 'GROUP BY agrupa filas por columna para usar funciones de agregación (COUNT, SUM); HAVING filtra los grupos resultantes (como WHERE pero para grupos)', 'GROUP BY se usa exclusivamente con INNER JOIN; HAVING se usa con LEFT JOIN para filtrar filas sin coincidencia',
        2, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantiza ACID en las transacciones de base de datos?',
        'Availability (siempre disponible), Consistency (datos sincronizados), Isolation (sin lecturas sucias), Durability (tolerante a fallos)', 'Atomicity (operación indivisible), Concurrency (acceso paralelo seguro), Isolation (sin interferencia), Distribution (datos replicados)', 'Authentication (seguridad), Consistency (datos válidos), Integrity (sin corrupción), Durability (persistencia)', 'Atomicity (todo o nada), Consistency (la BD pasa de estado válido a válido), Isolation (transacciones independientes), Durability (los cambios persisten)',
        3, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una "dirty read" en bases de datos?',
        'Leer datos de una transacción que aún no ha hecho commit y podría hacer rollback — el nivel de aislamiento READ_UNCOMMITTED lo permite', 'Una lectura que viola las reglas de negocio', 'Una lectura con datos corruptos', 'Leer datos encriptados sin permisos',
        0, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es la normalización 3NF (Tercera Forma Normal)?',
        'Que cada tabla tenga al menos 3 columnas', 'Una tabla está en 3NF si está en 2NF y no hay dependencias transitivas (columnas no-clave que dependen de otras columnas no-clave)', 'Que cada tabla tenga exactamente 3 índices', 'Que los datos se almacenen en 3 servidores',
        1, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es una window function como ROW_NUMBER()?',
        'Una función específica de PostgreSQL', 'Una función para calcular el tamaño de una ventana de tiempo', 'Una función de agregación que opera sobre un conjunto de filas relacionadas con la fila actual (la "ventana") sin colapsar el resultado — añade cálculos como ranking sin perder filas individuales', 'Una función para páginar resultados',
        2, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre una vista (VIEW) y una vista materializada?',
        'Las vistas materializadas no existen en PostgreSQL', 'Las vistas no pueden usarse con JOIN', 'Una VIEW es una query guardada que se ejecuta cada vez que se consulta; una vista materializada almacena físicamente los resultados y se actualiza periódicamente — más rápida para consultas complejas pero datos menos frescos', 'Son idénticas en rendimiento',
        2, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo es útil una subquery correlacionada?',
        'Solo en bases de datos Oracle', 'Para operaciones de INSERT únicamente', 'Cuando la subquery referencia columnas de la query exterior — se ejecuta una vez por fila de la query exterior. Útil pero puede ser lenta; a veces reemplazable con JOIN', 'Nunca, las subqueries correlacionadas deben evitarse siempre',
        2, 'SQL_DB', 'HARD', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué tipo de índice usa PostgreSQL/MySQL por defecto para PRIMARY KEY?',
        'B-tree index', 'Bitmap index', 'Full-text index', 'Hash index',
        0, 'SQL_DB', 'MEDIUM', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es problema poner una columna con baja cardinalidad (ej: género M/F) en un índice?',
        'Los índices no funcionan con VARCHAR', 'Aumenta mucho el tamaño de la tabla', 'Con baja cardinalidad el optimizador puede ignorar el índice y hacer full scan igualmente — los índices son más efectivos en columnas con alta cardinalidad (IDs, emails)', 'La BD lanza error al crear el índice',
        2, 'SQL_DB', 'HARD', NOW());

-- ============================================================
-- GIT
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre git merge y git rebase?',
        'merge requiere resolver conflictos de una vez; rebase permite resolver conflictos commit por commit de forma incremental', 'rebase es más seguro para ramas compartidas porque no modifica commits existentes, solo añade los nuevos encima', 'merge reescribe el historial creando una línea recta; rebase preserva las ramas creando commits de fusión explícitos', 'merge crea un commit de fusión preservando el historial completo; rebase reescribe commits encima de otra rama creando un historial lineal más limpio pero altera el historial existente',
        3, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué es peligroso hacer git rebase en ramas compartidas (pusheadas)?',
        'Porque rebase elimina los merge commits necesarios para que git bisect funcione correctamente en el historial', 'Porque rebase puede corromper el repositorio remoto si hay más de 50 commits en la rama afectada', 'Porque rebase es considerablemente más lento que merge para ramas grandes con muchos commits', 'Porque rebase reescribe commits (cambia sus SHAs) — los compañeros que tienen los commits originales tendrán conflictos al sincronizar',
        3, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve git cherry-pick?',
        'Para marcar un commit como importante (cherry) facilitando su localización en el historial del proyecto', 'Para seleccionar archivos específicos para incluir en el próximo commit sin staged los demás cambios', 'Para aplicar los cambios de un commit específico a la rama actual sin fusionar toda la rama de origen', 'Para revertir un commit específico aplicando los cambios inversos a la rama actual como un nuevo commit',
        2, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace git stash?',
        'Elimina permanentemente los cambios del working directory que no han sido commiteados ni staged', 'Guarda temporalmente los cambios no commiteados (staged y unstaged) en una pila, dejando el working directory limpio — recuperable con git stash pop', 'Crea una snapshot del repositorio completo como backup que se puede restaurar si algo sale mal', 'Comprime el historial de commits del repositorio eliminando commits intermedios para reducir el tamaño del .git',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve git reflog?',
        'Para ver el log de cambios realizados en cada archivo del repositorio con detalle de líneas añadidas/eliminadas', 'Para ver el historial de todas las acciones que han movido HEAD (commits, checkouts, resets, rebases) — permite recuperar commits "perdidos"', 'Para ver los logs del repositorio remoto sin necesidad de hacer fetch, consultando directamente el servidor', 'Para ver los cambios en .gitignore y su efecto en los archivos tracked/untracked del working directory',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre git reset --soft, --mixed y --hard?',
        '--soft mueve HEAD pero mantiene staged y working; --mixed (default) mueve HEAD y desescacea pero mantiene working; --hard descarta todo incluyendo working directory', '--hard es el más seguro porque crea un backup automático antes de descartar los cambios del working directory', 'Todos hacen lo mismo (mover HEAD) pero difieren en la velocidad de ejecución según el tamaño del repositorio', '--soft resetea solo el último commit; --mixed resetea los últimos N commits; --hard resetea toda la rama hasta el commit indicado',
        0, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el trunk-based development?',
        'Una estrategia exclusiva de proyectos open source donde los contributors envían patches por email al maintainer', 'Todos los desarrolladores integran cambios frecuentemente en una rama principal (trunk/main) usando feature flags, minimizando ramas de larga duración', 'Una estrategia donde cada developer tiene su propia rama trunk que sincroniza periódicamente con el main del equipo', 'Desarrollar directamente en producción haciendo push al branch main/master sin branches intermedios ni code review',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace git bisect?',
        'Fusiona selectivamente commits de dos ramas eligiendo los mejores cambios de cada una (cherry-pick automático)', 'Compara dos ramas commit por commit generando un diff detallado de las diferencias entre ambas', 'Divide el repositorio en dos ramas paralelas para comparar diferentes implementaciones del mismo feature', 'Realiza una búsqueda binaria en el historial de commits para encontrar cuál introdujo un bug — marcas commits como good/bad y git bisect encuentra el culpable',
        3, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En GitFlow, ¿cuándo se crea una rama hotfix?',
        'Para desarrollar nuevas funcionalidades que son urgentes y necesitan llegar a producción antes del siguiente release', 'Para experimentos de corta duración que prueban una idea antes de convertirla en un feature branch formal', 'Para corregir bugs críticos en producción directamente desde main/master sin pasar por develop', 'Para preparar un nuevo release candidato aplicando los últimos cambios de develop antes del deploy',
        2, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "squash merge" y cuándo es útil?',
        'Una fusión entre más de dos ramas simultáneamente que combina los cambios de un sprint completo en un solo merge', 'Combina todos los commits de una rama en uno solo antes de mergear — útil para mantener el historial de main limpio cuando la rama de feature tiene muchos commits de trabajo en progreso', 'Un merge que no crea commit de fusión, aplicando los cambios directamente sobre el HEAD de la rama destino', 'Una fusión que elimina los archivos duplicados entre ramas y mantiene solo la versión más reciente de cada uno',
        1, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los git hooks?',
        'Extensiones de la API de GitHub que permiten integrar el repositorio con servicios externos como Slack o Jira', 'Atajos de teclado configurables en .gitconfig para ejecutar comandos git frecuentes con alias cortos', 'Plugins para IDEs (IntelliJ, VS Code) que añaden funcionalidad extra a la integración git del editor', 'Scripts que se ejecutan automáticamente en eventos de git (pre-commit, post-commit, pre-push) — útiles para ejecutar tests, linting o validaciones antes de commitear',
        3, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre fast-forward merge y no-ff merge?',
        'No-ff es más eficiente', 'Fast-forward es más seguro', 'Fast-forward requiere que las ramas no tengan conflictos', 'Fast-forward mueve el puntero de la rama sin crear commit de merge (historial lineal); --no-ff siempre crea commit de merge explícito preservando la historia de la rama feature',
        3, 'GIT', 'NEGRO', NOW());

-- ============================================================
-- TESTING
-- ============================================================
INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el ciclo Red-Green-Refactor en TDD?',
        'Las etapas de code review: Red (cambios rechazados), Green (cambios aprobados), Refactor (cambios solicitados)', 'Las tres fases del pipeline de CI/CD: Red (tests fallando), Green (build exitoso), Refactor (deploy a producción)', 'Red: escribir un test que falla; Green: escribir el mínimo código para que pase; Refactor: mejorar el código manteniendo los tests en verde', 'Los tres estados de un test en JUnit: Red (error), Green (pasado), Refactor (skip/ignored por @Disabled)',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué forma tiene la pirámide de tests y qué significa?',
        'Solo tests de integración en el centro de la pirámide, validando la interacción real entre componentes sin mocks', 'Muchos tests de UI/E2E en la base, menos tests de integración, pocos tests unitarios — los E2E cubren más funcionalidad por test', 'Igual cantidad de tests en cada nivel para garantizar cobertura uniforme en todas las capas de la aplicación', 'Muchos tests unitarios (base), menos tests de integración (medio), pocos tests E2E (cima) — los unitarios son más rápidos y baratos; los E2E son lentos y frágiles',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre un Mock y un Stub?',
        'Los Mocks simulan el comportamiento completo del objeto; los Stubs solo simulan los métodos que devuelven valores', 'Un Stub proporciona respuestas predefinidas a llamadas; un Mock además verifica que ciertas llamadas ocurrieron (tiene expectativas) — los Mocks fallan el test si las expectativas no se cumplen', 'Los Stubs requieren una interfaz para funcionar; los Mocks también funcionan con clases concretas mediante CGLIB', 'Son sinónimos intercambiables usados por diferentes frameworks: Mock es de Mockito y Stub es de EasyMock',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Spy en Mockito?',
        'Un wrapper de un objeto real que permite verificar llamadas y sobreescribir métodos selectivamente, mientras el resto del comportamiento real se mantiene', 'Un tipo de stub que genera datos aleatorios basados en el tipo de retorno del método para fuzz testing', 'Un mock que registra todas las interacciones sin responder, usado exclusivamente para verificar llamadas con verify()', 'Un mock especial para clases abstractas que implementa automáticamente los métodos abstractos con valores por defecto',
        0, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @SpringBootTest y los test slices como @WebMvcTest?',
        '@SpringBootTest levanta el contexto completo de la aplicación (lento); @WebMvcTest carga solo la capa web (controllers, filters) siendo más rápido y enfocado', '@SpringBootTest no permite inyectar mocks con @MockBean; @WebMvcTest sí porque carga solo una parte del contexto', '@WebMvcTest requiere una base de datos real configurada; @SpringBootTest usa H2 automáticamente por defecto', '@WebMvcTest carga más contexto que @SpringBootTest para poder testear filtros y converters de Spring MVC',
        0, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías @TestConfiguration?',
        'Para configurar la base de datos de producción en tests', 'Para deshabilitar la seguridad en tests', 'Para configurar el servidor embebido de tests', 'Para definir beans adicionales o sobreescribir beans del contexto SOLO para tests, sin afectar la configuración de producción',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Awaitility en tests?',
        'Para ejecutar tests en paralelo', 'Para pausar los tests durante N segundos', 'Para testear código asíncrono de forma elegante — espera hasta que una condición se cumpla con timeout configurable, sin usar Thread.sleep()', 'Para tests de performance con tiempo límite',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el mutation testing?',
        'Una forma de generar datos aleatorios (fuzzing) para encontrar edge cases que los tests manuales no cubren', 'Tests que modifican datos de producción para verificar que los rollback mechanisms funcionan correctamente', 'Tests que modifican la configuración de Spring en runtime para verificar la resiliencia de la aplicación a cambios', 'Una técnica que introduce bugs intencionales (mutantes) en el código y verifica que tus tests los detectan — mide la calidad de los tests, no solo la cobertura de líneas',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué mide la cobertura de código con JaCoCo?',
        'El tiempo de ejecución acumulado de cada línea de código para identificar bottlenecks de rendimiento', 'La calidad general del código basada en métricas de complejidad ciclomática y mantenibilidad', 'Qué porcentaje de líneas, ramas e instrucciones son ejecutadas por los tests — es una métrica necesaria pero no suficiente (100% coverage no garantiza ausencia de bugs)', 'La cantidad de código duplicado entre tests que podría extraerse a métodos helper reutilizables',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la opción @SpringBootTest(webEnvironment) para levantar un servidor real en un puerto disponible?',
        'MOCK', 'NONE', 'RANDOM_PORT', 'DEFINED_PORT',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @DataJpaTest en Spring?',
        'Para testear servicios con mocks de repositorios', 'Para testear migraciones de base de datos', 'Para testear controllers con base de datos real', 'Es un test slice que configura solo la capa JPA (entidades, repositorios) con H2 en memoria, sin cargar el contexto web ni servicios — ideal para testear repositorios aisladamente',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ventaja ofrece RestAssured frente a MockMvc para tests de API?',
        'RestAssured es más rápido', 'RestAssured solo funciona con Spring Boot', 'MockMvc requiere más configuración', 'RestAssured hace peticiones HTTP reales contra un servidor levantado, con una DSL fluida muy legible; MockMvc simula el servidor en memoria. RestAssured es más realista pero requiere servidor levantado',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('En Mockito, ¿cuándo usarías verify() en un test?',
        'Para verificar que el mock no es null', 'Para verificar que el mock está configurado correctamente', 'Para verificar el valor de retorno del mock', 'Para verificar que un método de un mock fue llamado (y opcionalmente cuántas veces y con qué argumentos) — útil cuando el comportamiento correcto es que se llame a cierta dependencia',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un "test fake" y en qué difiere de un mock?',
        'Los fakes son más lentos que los mocks', 'Un test que verifica comportamiento falso', 'Un Fake es una implementación funcional simplificada (ej: in-memory repository) que funciona realmente pero no es apta para producción; un Mock es un objeto vacío que solo registra llamadas', 'Los fakes no pueden usarse con Spring',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa "test isolation" y por qué es importante?',
        'Que los tests se ejecutan en procesos separados', 'Ejecutar tests en un ambiente aislado del internet', 'Que los tests no pueden llamar a código de producción', 'Que cada test es independiente: no depende del estado de otros tests ni lo modifica — garantiza que los tests son deterministas y el orden de ejecución no importa',
        3, 'TESTING', 'NARANJA', NOW());


-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN BLANCO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para obtener datos del servidor?',
        'GET', 'PUT — método para obtener y actualizar un recurso del servidor en una sola operación', 'POST — método estándar para solicitar datos del servidor enviando los parámetros en el body', 'PATCH — método para obtener una parte específica del recurso sin descargar el recurso completo',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente no tiene autorización (no ha hecho login)?',
        '403 Forbidden — el servidor rechaza la petición porque el usuario no tiene permisos suficientes', '401 Unauthorized', '404 Not Found — el servidor no encontró el recurso solicitado en la URL especificada', '400 Bad Request — el servidor no puede procesar la petición por un error de sintaxis del cliente',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el servidor está temporalmente fuera de servicio?',
        '504 Gateway Timeout — el servidor intermediario no recibió respuesta a tiempo del upstream', '503 Service Unavailable', '502 Bad Gateway — el servidor intermediario recibió una respuesta inválida del servidor upstream', '500 Internal Server Error — error inesperado en el servidor causado por un bug en el código',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué significa el código HTTP 200 OK?',
        'El recurso fue eliminado correctamente y el servidor confirma la operación', 'El recurso solicitado fue creado exitosamente en el servidor con los datos enviados', 'La petición fue exitosa', 'El servidor redirige al cliente a otra URL donde se encuentra el recurso solicitado',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP indica que el cliente tiene prohibido acceder al recurso aunque esté autenticado?',
        '405 Method Not Allowed — el método HTTP usado no está permitido para este recurso', '403 Forbidden', '404 Not Found — el servidor no encontró el recurso en la ruta especificada por la URL', '401 Unauthorized — el cliente no ha proporcionado credenciales válidas de autenticación',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un campo numérico tenga un valor mínimo?',
        '@Range(min=N) — anotación de Hibernate Validator que define un rango mínimo y máximo simultáneamente', '@Size(min=N) — valida el tamaño mínimo de Strings y colecciones, también funciona con números', '@Min(N)', '@NotNull — valida que el campo no sea null pero no verifica que tenga un valor mínimo específico',
        2, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación valida que un campo String tenga formato de email?',
        '@Mail — anotación de Jakarta Validation para validar formato de correo electrónico', '@Email', '@EmailFormat — anotación de Spring Validation que verifica formato y dominio del email', '@Pattern(regexp="^[\\w.]+@[\\w.]+$") — validación por expresión regular específica para emails',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué dependencia necesitas en el pom.xml para usar @NotBlank, @Email, etc.?',
        'jakarta.validation-api — la API estándar de validación de Jakarta EE con las anotaciones @NotBlank y @Email', 'spring-boot-starter-validation', 'spring-boot-starter-web — incluye las validaciones como parte del stack web de Spring MVC', 'spring-boot-starter-data-jpa — las validaciones vienen incluidas con Hibernate Validator',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación usarías para validar que un campo String cumple una expresión regular?',
        '@Pattern(regexp="...")', '@Format(pattern="...") — anotación de Jakarta Bean Validation para validar formato con patrones', '@Regex("...") — anotación de Java Validation API para aplicar expresiones regulares a campos String', '@Match(value="...") — anotación de Spring Validation para comparar contra un patrón definido',
        0, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué código HTTP devuelve Spring cuando un campo @NotBlank está vacío y se usa @Valid?',
        '422 Unprocessable Entity — el JSON es válido pero los datos no cumplen las restricciones de validación', '404 Not Found — Spring interpreta la ausencia del campo como un recurso que no se encontró', '500 Internal Server Error — Spring lanza una excepción de validación que no está capturada por defecto', '400 Bad Request',
        3, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para enviar datos al servidor y crear un recurso nuevo?',
        'PUT — envía datos al servidor para crear o reemplazar un recurso en una URL específica', 'POST', 'PATCH — envía datos parciales al servidor para crear un recurso con los campos proporcionados', 'GET — puede enviar datos al servidor como query parameters en la URL del request',
        1, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para actualizar un recurso existente completamente?',
        'POST — método para enviar datos y actualizar recursos existentes en el servidor', 'PATCH — aplica una actualización parcial enviando solo los campos que han cambiado', 'PUT', 'GET — obtiene el recurso actual y lo reemplaza con la versión actualizada del cliente',
        2, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué método HTTP se usa para eliminar un recurso?',
        'DELETE', 'POST — método genérico que también puede usarse para eliminar recursos enviando una acción en el body', 'REMOVE — método HTTP estándar para eliminar recursos del servidor de forma permanente', 'PATCH — puede usarse para "eliminar" un recurso cambiando su campo activo a false (soft delete)',
        0, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre @NotNull y @NotBlank para un String?',
        'No hay diferencia funcional; @NotBlank es un alias de @NotNull introducido en Jakarta Validation 3.0', '@NotNull solo rechaza null; @NotBlank rechaza null, vacío "" y solo espacios "   "', '@NotNull es para validar cualquier tipo de campo; @NotBlank solo funciona con campos numéricos', '@NotBlank rechaza null pero permite cadenas vacías; @NotNull rechaza tanto null como cadenas vacías',
        1, 'VALIDACION', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué rango de códigos HTTP indica una redirección?',
        '4xx — códigos de error del cliente que incluyen redirecciones por recursos movidos', '2xx — códigos de éxito que incluyen redirecciones exitosas a otros recursos', '1xx — códigos informativos que indican redirección temporal mientras el servidor procesa', '3xx',
        3, 'HTTP', 'BLANCO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué rango de códigos HTTP indica éxito?',
        '1xx — códigos informativos que confirman la recepción exitosa de la petición', '3xx — códigos de redirección que indican que la operación se completó en otra URL', '4xx — incluye 200-499 que son todos los códigos de respuesta exitosa del servidor', '2xx',
        3, 'HTTP', 'BLANCO', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN AMARILLO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Boot Initializr?',
        'Un plugin de Maven que inicializa la estructura del proyecto y descarga las dependencias automáticamente', 'Un IDE integrado para desarrollo de aplicaciones Spring Boot con auto-completado y debugging', 'Un contenedor Docker pre-configurado con JDK, Maven y Spring Boot para desarrollo rápido', 'Una herramienta web (start.spring.io) que genera proyectos Spring Boot con las dependencias seleccionadas',
        3, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve Lombok en un proyecto Spring Boot?',
        'Para generar automáticamente getters, setters, constructores y otros métodos repetitivos mediante anotaciones', 'Para conectar a la base de datos y generar las entidades JPA automáticamente desde el esquema existente', 'Para configurar la seguridad de la aplicación generando automáticamente las clases de autenticación', 'Para generar tests unitarios automáticos basados en la estructura de las clases del proyecto',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Data de Lombok?',
        'Conecta la clase anotada a la base de datos como si fuera una @Entity JPA simplificada', 'Genera getters, setters, toString, equals, hashCode y constructor con args requeridos (@RequiredArgsConstructor)', 'Serializa el objeto a JSON usando la configuración de Jackson personalizada del proyecto', 'Valida automáticamente los datos del DTO aplicando @NotNull a todos los campos no primitivos',
        1, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es MapStruct y para qué se usa?',
        'Un ORM alternativo a Hibernate que mapea objetos Java a tablas usando convenciones de nombres en vez de anotaciones', 'Un framework de testing que genera mocks automáticos a partir de interfaces Java anotadas', 'Un generador de código que crea implementaciones de mappers entre objetos (Entity↔DTO) en tiempo de compilación, más eficiente que reflexión', 'Una librería para crear representaciones de datos geográficos (mapas) en aplicaciones Spring Boot',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Controller y @RestController?',
        'Son completamente equivalentes; @RestController es simplemente un alias moderno para @Controller', '@RestController combina @Controller + @ResponseBody: cada método devuelve datos directamente (JSON) en vez de vistas (HTML)', '@Controller es exclusivo para APIs REST; @RestController es para aplicaciones MVC con vistas Thymeleaf', '@RestController hereda de @Controller añadiendo auto-configuración de Jackson y content negotiation',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un @Bean en Spring Boot?',
        'Un endpoint REST que Spring Boot expone automáticamente para monitorear el estado de los componentes', 'Un objeto gestionado por el contenedor de Spring que puede ser inyectado en otras clases', 'Un tipo de test unitario que valida la configuración de beans y la inyección de dependencias del contexto', 'Una entidad de la base de datos anotada con JPA que se persiste automáticamente en la tabla correspondiente',
        1, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación se usa para inyectar una dependencia en Spring?',
        '@Inject — anotación estándar de CDI (Jakarta) que inyecta dependencias sin integración con Spring', '@Bean — define un método factory que crea el objeto y lo registra como dependencia en el contexto', '@Autowired (o inyección por constructor, preferida)', '@Component — marca la clase como candidata para inyección automática por component scanning',
        2, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @RequestMapping("/api/students") en un controller?',
        'Registra el controller en Eureka', 'Crea una tabla students en la BD', 'Mapea el controller a un servicio externo', 'Define el prefijo de URL para todos los endpoints del controller',
        3, 'ARQUITECTURA', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Jackson en el contexto de Spring Boot?',
        'La librería que serializa/deserializa objetos Java a/desde JSON automáticamente en los endpoints REST', 'Un gestor de dependencias que resuelve conflictos de versiones entre librerías JSON del proyecto', 'Un framework de testing para validar estructuras JSON de respuestas en tests de controller con MockMvc', 'Un servidor de aplicaciones embebido alternativo a Tomcat optimizado para JSON processing',
        0, 'SPRING_BOOT', 'AMARILLO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @JsonIgnore en un campo de una entity o DTO?',
        'Hace el campo nullable en la BD ignorando las constraints @Column(nullable=false) de JPA', 'Ignora las validaciones @NotNull y @NotBlank del campo durante la deserialización del JSON', 'Excluye el campo de la serialización/deserialización JSON — no aparece en la respuesta ni se lee del request', 'Ignora el campo en los tests unitarios para que Mockito no incluya ese campo en las comparaciones',
        2, 'SPRING_BOOT', 'AMARILLO', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN NARANJA
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Spy y @Mock en Mockito?',
        '@Spy es más antiguo', '@Mock funciona con constructor y @Spy no', 'Son lo mismo', '@Mock crea un objeto completamente falso; @Spy envuelve un objeto real y permite sobrescribir solo algunos métodos, los demás ejecutan la lógica real',
        3, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace doThrow(Exception.class).when(mock).metodo() en Mockito?',
        'Configura el mock para que lance esa excepción cuando se llame a metodo() — útil para testear manejo de errores', 'Lanza la excepción inmediatamente', 'Captura la excepción para analizarla', 'Verifica que se lanzó la excepción',
        0, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace ArgumentCaptor en Mockito?',
        'Captura el resultado de un método', 'Genera argumentos aleatorios para tests', 'Captura excepciones del test', 'Permite capturar y examinar los argumentos que fueron pasados a un método del mock — útil para verificar qué datos se enviaron',
        3, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estructura AAA (Arrange-Act-Assert) en testing?',
        'Autenticar-Autorizar-Acceder', 'Arrange: preparar datos y mocks; Act: ejecutar la acción a testear; Assert: verificar el resultado esperado', 'API-Application-Architecture', 'Agregar-Actualizar-Archivar',
        1, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @DisplayName en JUnit 5?',
        'Para mostrar el nombre del developer', 'Para nombrar la clase de test', 'Para filtrar tests por nombre', 'Para dar un nombre descriptivo legible al test que aparece en los reportes en vez del nombre del método',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ParameterizedTest en JUnit 5?',
        'Ejecuta el test en paralelo', 'Inyecta parámetros en el constructor del test', 'Parametriza la configuración de Spring', 'Permite ejecutar el mismo test con diferentes datos de entrada, evitando duplicar código de test',
        3, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué verifica verifyNoMoreInteractions(mock) en Mockito?',
        'Que el mock no lanza excepciones', 'Que el test terminó correctamente', 'Que el mock no tiene más métodos', 'Que no se llamaron más métodos del mock aparte de los ya verificados — detecta llamadas inesperadas',
        3, 'MOCKITO', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo usarías @BeforeEach vs @BeforeAll en JUnit 5?',
        '@BeforeEach ejecuta antes de CADA test (setup limpio); @BeforeAll ejecuta una vez antes de TODOS los tests de la clase (setup costoso compartido)', '@BeforeEach es obsoleto en JUnit 5', '@BeforeAll es para tests de integración', 'Son lo mismo',
        0, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un test unitario vs un test de integración?',
        'Unitario es más completo que integración', 'Son lo mismo pero con diferentes nombres', 'Unitario testea una sola clase/método aislado con mocks; de integración testea varias capas juntas con componentes reales (BD, HTTP)', 'Integración es solo para microservicios',
        2, 'TESTING', 'NARANJA', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace when(mock.metodo()).thenAnswer(invocation -> ...)?',
        'Ejecuta el método real del mock', 'Es igual que thenReturn', 'Permite definir una respuesta dinámica basada en los argumentos recibidos, más flexible que thenReturn que devuelve un valor fijo', 'Responde preguntas del mock',
        2, 'MOCKITO', 'NARANJA', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN VERDE
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @WebMvcTest y @SpringBootTest para tests de controller?',
        'Son idénticos', '@WebMvcTest es obsoleto', '@WebMvcTest solo carga la capa web (controller, filtros, converters); @SpringBootTest carga TODO el contexto de Spring incluyendo BD — @WebMvcTest es más rápido y enfocado', '@SpringBootTest no soporta MockMvc',
        2, 'MOCKMVC', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un IntStream y cuándo lo usarías?',
        'Un stream para internet', 'Un tipo de InputStream', 'Un Stream especializado para primitivos int que evita boxing/unboxing — más eficiente para operaciones numéricas que Stream<Integer>', 'Un stream de entrada de datos',
        2, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Stream.distinct()?',
        'Elimina elementos duplicados del Stream usando equals() para comparar', 'Cuenta elementos únicos', 'Ordena los elementos', 'Separa el stream en dos',
        0, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo se debe usar @Async en Spring?',
        'Para ejecutar métodos en un hilo separado sin bloquear el hilo principal — se activa con @EnableAsync y devuelve CompletableFuture<T>', 'Para cachear resultados', 'Para hacer llamadas REST', 'Para validar datos asíncronamente',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Predicate en Java funcional?',
        'Un predicado SQL', 'Un tipo de excepción', 'Una condición de Spring Security', 'Una interfaz funcional que recibe un argumento y devuelve boolean — se usa para filtrar elementos',
        3, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @ExceptionHandler(MethodArgumentNotValidException.class) en un @RestControllerAdvice?',
        'Captura específicamente los errores de validación (@Valid) y permite devolver una respuesta personalizada con los errores de campos', 'Maneja todas las excepciones', 'Lanza la excepción al frontend', 'Maneja excepciones de métodos privados',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Collectors.toUnmodifiableList()?',
        'Crea una lista ordenada', 'Recoge los elementos del Stream en una lista inmutable — cualquier intento de modificarla lanza UnsupportedOperationException', 'Crea una lista thread-safe', 'Filtra elementos nulos',
        1, 'LAMBDAS_STREAMS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es WebClient en Spring y cuándo usarlo en vez de RestTemplate?',
        'Son lo mismo', 'RestTemplate es más moderno', 'WebClient es el cliente HTTP reactivo/no-bloqueante de Spring WebFlux — se recomienda sobre RestTemplate (bloqueante) para aplicaciones modernas y alta concurrencia', 'WebClient es solo para WebSocket',
        2, 'REST_API', 'VERDE', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN MARRÓN
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @MappedSuperclass en JPA?',
        'Mapea la clase a múltiples tablas', 'Es un alias de @Entity', 'Crea una tabla abstracta en la BD', 'Permite que una clase padre defina campos comunes (id, createdAt) que se heredan en las tablas de las subclases sin crear tabla propia',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los Records en Java 16+ y cuándo usarlos en Spring Boot?',
        'Son clases inmutables con constructor, getters, equals, hashCode y toString generados — ideales para DTOs en Spring Boot', 'Son un tipo de colección', 'Son logs del sistema', 'Son tablas de la BD',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un sealed class en Java 17?',
        'Una clase final', 'Una clase encriptada', 'Una clase que no puede instanciarse', 'Una clase que restringe qué otras clases pueden heredar de ella usando permits — permite modelar jerarquías cerradas',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es pattern matching para instanceof en Java 16+?',
        'Expresiones regulares para tipos', 'Matching de patterns en switch', 'Un patrón de diseño', 'Permite hacer cast automático en el if: if (obj instanceof String s) { usar s directamente } — elimina casts manuales',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre findById() y getReferenceById() en JPA?',
        'Son idénticos', 'findById() carga la entidad de BD inmediatamente; getReferenceById() devuelve un proxy lazy que solo consulta la BD cuando accedes a sus propiedades', 'getReferenceById() lanza excepción si no existe', 'findById() es más lento',
        1, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el first-level cache (L1 cache) en JPA/Hibernate?',
        'El PersistenceContext/Session que cachea entidades dentro de una transacción — la misma entidad cargada dos veces devuelve la misma instancia en memoria', 'El caché del navegador', 'El caché de queries SQL', 'Un caché de Redis',
        0, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es @EventListener en Spring?',
        'Un listener de eventos de la BD', 'Un listener de eventos del navegador', 'Un listener de excepciones', 'Un método que se ejecuta automáticamente cuando se publica un evento en el ApplicationEventPublisher de Spring — permite comunicación desacoplada entre componentes',
        3, 'SPRING_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es text blocks (""") en Java 15+?',
        'Templates de String', 'Una forma de crear archivos de texto', 'Una sintaxis para strings multilínea que preserva formato e indentación, útil para JSON, SQL o HTML embebido en el código', 'Bloques de comentarios',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es switch expressions en Java 14+?',
        'Un nuevo tipo de condicional', 'Un pattern matching', 'Switch para streams', 'Switch como expresión que devuelve valor, con sintaxis arrow (->), exhaustividad obligatoria y sin fall-through accidental',
        3, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @Cacheable en Spring Boot?',
        'Cachea las queries SQL automáticamente', 'Valida que los datos estén en caché', 'Limpia la caché', 'Cachea el resultado de un método — la primera llamada ejecuta el método, las siguientes devuelven el resultado cacheado sin ejecutarlo de nuevo',
        3, 'SPRING_CORE', 'MARRON', NOW());

-- =============================================
-- PREGUNTAS ADICIONALES - CINTURÓN NEGRO
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un API Gateway en microservicios?',
        'Un framework de testing', 'Un tipo de cache distribuida', 'Un servidor de base de datos', 'Un punto de entrada único que enruta peticiones a los microservicios correctos, maneja autenticación, rate limiting y balanceo de carga',
        3, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Circuit Breaker en microservicios?',
        'Un patrón de seguridad', 'Un tipo de load balancer', 'Un patrón que detecta fallos repetidos en llamadas a otros servicios y "abre el circuito" para evitar cascadas de errores, devolviendo un fallback', 'Un cortocircuito eléctrico',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Docker y por qué se usa con Spring Boot?',
        'Un IDE para Java', 'Un gestor de dependencias como Maven', 'Una plataforma de contenedores que empaqueta la app con sus dependencias en una imagen portable, garantizando que funciona igual en cualquier entorno', 'Un servidor de aplicaciones',
        2, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Dockerfile multistage build para Spring Boot?',
        'Una configuración de CI/CD', 'Un Dockerfile con varias etapas FROM: primero compila con Maven/JDK (builder), luego copia solo el JAR a una imagen ligera con JRE — reduce el tamaño de la imagen final', 'Un archivo que crea múltiples contenedores', 'Un archivo para Docker Compose',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Service Discovery (Eureka) en microservicios?',
        'Un buscador de servicios en internet', 'Un registro donde los microservicios se inscriben al arrancar y pueden encontrar las ubicaciones (IP:puerto) de otros servicios dinámicamente', 'Un balanceador de carga hardware', 'Un servidor DNS',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es git rebase vs git merge?',
        'Son lo mismo', 'rebase es más seguro que merge', 'merge crea un commit de merge preservando la historia; rebase reescribe la historia poniendo tus commits sobre la rama destino, creando una línea recta sin commits de merge', 'merge es obsoleto',
        2, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es git stash y cuándo se usa?',
        'Para guardar temporalmente cambios sin hacer commit — útil cuando necesitas cambiar de rama pero tienes trabajo en progreso', 'Para crear un backup del repo', 'Para borrar cambios', 'Para revertir el último commit',
        0, 'GIT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Cloud Config en microservicios?',
        'Un servidor centralizado que gestiona la configuración de todos los microservicios desde un repositorio Git, permitiendo cambios sin redesplegar', 'Un archivo de configuración local', 'Una alternativa a application.yml', 'Un plugin de IntelliJ',
        0, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @RefreshScope en Spring Cloud?',
        'Refresca la caché', 'Permite que los beans se recreen con nueva configuración cuando se llama al endpoint /actuator/refresh sin reiniciar la aplicación', 'Refresca la página web', 'Reinicia el servicio automáticamente',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Resilience4j y por qué reemplazó a Hystrix?',
        'Un servidor de mensajería', 'Una librería ligera de tolerancia a fallos (circuit breaker, retry, rate limiter) diseñada para Java 8+/funcional — Hystrix entró en modo mantenimiento', 'Un framework de seguridad', 'Un ORM alternativo',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Saga en microservicios?',
        'Un patrón para diseñar APIs REST que encadenan múltiples llamadas síncronas en una sola transacción HTTP distribuida', 'Un patrón para gestionar transacciones distribuidas dividiendo la operación en una secuencia de transacciones locales con compensaciones si algo falla', 'Un patrón de comunicación asíncrona donde cada servicio publica y consume eventos a través de un event bus central', 'Un patrón de caché distribuido que replica datos entre microservicios para reducir la latencia de consultas cross-service',
        1, 'MICROSERVICIOS', 'NEGRO', NOW());


-- =============================================
-- TEMAS AVANZADOS - SPRING WEBFLUX (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring WebFlux?',
        'Un framework para WebSockets bidireccionales que permite comunicación en tiempo real entre servidor y cliente', 'Una versión optimizada de Spring MVC que usa thread pooling avanzado para manejar más peticiones por segundo', 'Un reemplazo de Spring MVC que usa Netty como servidor y elimina la necesidad de Tomcat para aplicaciones web', 'El módulo reactivo de Spring que permite programación no-bloqueante basada en Project Reactor (Mono/Flux), ideal para alta concurrencia con pocos hilos',
        3, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la diferencia entre Mono y Flux en Project Reactor?',
        'Mono es para operaciones síncronas (blocking) y Flux para operaciones asíncronas (non-blocking) exclusivamente', 'Flux es más eficiente que Mono para operaciones individuales porque usa buffering interno para optimizar el throughput', 'Son intercambiables; Mono es simplemente un alias de Flux con una API simplificada para un solo elemento', 'Mono emite 0 o 1 elemento; Flux emite 0 a N elementos — ambos son Publishers reactivos que se suscriben de forma lazy',
        3, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es backpressure en programación reactiva?',
        'Un mecanismo donde el consumidor le indica al productor que baje la velocidad de emisión de datos cuando no puede procesarlos tan rápido', 'Un tipo de compresión de datos reactiva que reduce el tamaño de los mensajes entre publisher y subscriber', 'La presión excesiva sobre el servidor cuando hay demasiadas peticiones concurrentes que saturan el thread pool', 'Un patrón de error handling donde la presión de errores acumulados se propaga hacia arriba en la cadena reactiva',
        0, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué ocurre si llamas .block() en un Mono dentro de un hilo reactivo (event loop)?',
        'Devuelve null', 'Convierte el Mono en síncrono automáticamente', 'Lanza IllegalStateException porque bloquear un hilo del event loop anula las ventajas reactivas y puede causar deadlock', 'Funciona normalmente',
        2, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo NO deberías usar WebFlux sobre Spring MVC?',
        'Cuando necesitas Spring Security porque el soporte de seguridad reactiva es limitado comparado con el modelo servlet', 'Cuando tu app es CRUD simple con operaciones bloqueantes (JDBC tradicional, JPA) y baja concurrencia — WebFlux añade complejidad sin beneficio real', 'Nunca — WebFlux es siempre superior a Spring MVC en rendimiento y escalabilidad para cualquier tipo de aplicación', 'Cuando usas Java 17+ porque las mejoras de rendimiento de la JVM hacen innecesaria la programación reactiva',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace flatMap() en un Mono/Flux a diferencia de map()?',
        'flatMap() filtra elementos', 'map() transforma el valor síncronamente; flatMap() transforma a otro Mono/Flux (operación asíncrona) y aplana el resultado — esencial para encadenar llamadas reactivas', 'Son idénticos', 'map() es reactivo y flatMap() no',
        1, 'WEBFLUX', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es R2DBC y por qué se usa con WebFlux?',
        'Un tipo de base de datos NoSQL', 'Reactive Relational Database Connectivity — un driver de BD reactivo no-bloqueante, necesario porque JDBC es bloqueante e incompatible con WebFlux', 'Un protocolo de red', 'Una alternativa a REST',
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
        'Son funcionalmente equivalentes pero Kafka es open-source y RabbitMQ es comercial con licencia propietaria', 'Kafka es más fácil de configurar y operar en producción gracias a su arquitectura simplificada sin clustering', 'Kafka es un log distribuido que retiene mensajes y permite replay; RabbitMQ es un broker de mensajes tradicional que elimina mensajes tras el acknowledgment', 'RabbitMQ soporta mensajes más grandes (hasta 1GB) mientras Kafka tiene un límite de 1MB por mensaje por defecto',
        2, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación de Spring Kafka se usa para consumir mensajes de un topic?',
        '@MessageConsumer', '@Subscribe', '@TopicReader', '@KafkaListener',
        3, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Consumer Group en Kafka?',
        'Un grupo de topics', 'Una configuración de seguridad', 'Un grupo de productores', 'Un conjunto de consumidores que se reparten las particiones de un topic — cada partición solo es leída por un consumidor del grupo, permitiendo paralelismo',
        3, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué patrón de comunicación usa RabbitMQ por defecto?',
        'Peer-to-peer directo donde cada productor conoce la dirección del consumidor destino sin intermediarios', 'Request-Response síncrono con correlation IDs para emparejar peticiones con respuestas entre servicios', 'Streaming continuo donde los mensajes se procesan en orden con garantía de exactly-once delivery por defecto', 'Publish-Subscribe con exchanges y queues — el productor envía al exchange, que enruta a las queues según routing rules',
        3, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué garantía ofrece Kafka con acks=all?',
        'El mensaje se considera enviado solo cuando TODAS las réplicas del broker lo han escrito — máxima durabilidad a costa de mayor latencia', 'Garantiza entrega exactamente una vez (exactly-once) eliminando la posibilidad de mensajes duplicados', 'Garantiza entrega en orden estricto dentro de un topic, asignando cada mensaje a una partición basada en un hash consistente', 'No ofrece garantía de entrega — acks=all simplemente confirma que el broker recibió el mensaje sin verificar las réplicas',
        0, 'MENSAJERIA', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Dead Letter Queue (DLQ)?',
        'Una queue donde van los mensajes que no pudieron ser procesados tras N reintentos — permite analizar fallos sin perder datos', 'Una queue temporal', 'Una queue de alta prioridad', 'Una queue para mensajes eliminados',
        0, 'MENSAJERIA', 'NEGRO', NOW());

-- =============================================
-- OBSERVABILIDAD (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Micrometer en Spring Boot?',
        'Un plugin de Maven que genera reportes de métricas de código como complejidad ciclomática y cobertura de tests', 'Un medidor de rendimiento de la JVM que reporta uso de CPU, heap memory y threads activos en tiempo real', 'Un framework de testing para medir tiempos de respuesta de endpoints REST en tests de rendimiento', 'Una fachada de métricas que abstrae el sistema de monitoreo (Prometheus, Datadog, etc.) — equivalente a SLF4J pero para métricas',
        3, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es distributed tracing y para qué sirve en microservicios?',
        'Una técnica de debugging remoto que permite pausar la ejecución de un microservicio y inspeccionar su estado en producción', 'Un sistema de logging centralizado que agrega los logs de todos los microservicios en un solo dashboard como ELK Stack', 'El seguimiento de una petición a través de múltiples microservicios usando trace IDs — permite diagnosticar latencia y errores en sistemas distribuidos (ej: Zipkin, Jaeger)', 'Un sistema de monitoreo de CPU y memoria que correlaciona métricas de infraestructura entre los hosts del cluster',
        2, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Boot Actuator /actuator/prometheus?',
        'Expone las métricas de la aplicación en formato Prometheus (texto plano) para que un servidor Prometheus las scrape periódicamente', 'Genera dashboards automáticos', 'Instala Prometheus', 'Monitorea la base de datos',
        0, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los 3 pilares de la observabilidad?',
        'Seguridad, Rendimiento y Disponibilidad — los tres atributos de calidad más importantes de un sistema en producción', 'CPU, RAM y Disco — las tres métricas de infraestructura fundamentales para monitorear cualquier sistema', 'Tests, Deployment y Monitoring — las tres fases del ciclo de vida de software para garantizar calidad', 'Logs (qué pasó), Métricas (cuánto/cuántas veces) y Traces (dónde y cuánto tardó) — juntos dan visibilidad completa del sistema',
        3, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Zipkin/Jaeger en el contexto de Spring Boot?',
        'Frameworks de testing', 'Servidores de bases de datos', 'Sistemas de tracing distribuido que recopilan, almacenan y visualizan las trazas de las peticiones entre microservicios', 'Herramientas de deployment',
        2, 'OBSERVABILIDAD', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un health indicator custom en Spring Boot Actuator?',
        'Una clase que implementa HealthIndicator para verificar componentes específicos (conexión a API externa, espacio en disco, etc.) y reportar UP/DOWN en /actuator/health', 'Un indicador de salud del desarrollador', 'Un test automático', 'Un log de errores',
        0, 'OBSERVABILIDAD', 'MARRON', NOW());

-- =============================================
-- TESTCONTAINERS (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Testcontainers?',
        'Un framework para crear contenedores Docker en producción', 'Un framework de testing unitario', 'Una librería Java que levanta contenedores Docker reales (PostgreSQL, Redis, Kafka, etc.) durante los tests de integración — tests más realistas que con H2', 'Una alternativa a Docker Compose',
        2, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Por qué usar Testcontainers con PostgreSQL en vez de H2 para tests?',
        'Porque H2 está deprecated', 'H2 es más rápido, no hay razón', 'Porque Testcontainers es más fácil de configurar', 'Porque H2 tiene diferencias de comportamiento con PostgreSQL (funciones SQL, tipos de datos, constraints) que pueden ocultar bugs que sí aparecerían en producción',
        3, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué anotación de Testcontainers inicia el contenedor antes de los tests?',
        '@Testcontainers (en la clase) + @Container (en el campo GenericContainer)', '@StartContainer', '@AutoContainer', '@DockerContainer',
        0, 'TESTCONTAINERS', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @DynamicPropertySource en tests con Testcontainers?',
        'Inyecta dinámicamente propiedades de configuración (como la URL del contenedor) en el contexto de Spring antes de que arranque — necesario porque el puerto del contenedor es aleatorio', 'Genera propiedades aleatorias', 'Carga propiedades del sistema operativo', 'Fuente de datos dinámica',
        0, 'TESTCONTAINERS', 'VERDE', NOW());

-- =============================================
-- GRAALVM / NATIVE (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Boot Native (GraalVM)?',
        'Compilar la aplicación Spring Boot a un ejecutable nativo (AOT) que arranca en milisegundos y consume menos memoria — ideal para serverless/containers', 'Spring Boot sin JVM', 'Un perfil de Spring para producción', 'Spring Boot compilado a JavaScript',
        0, 'NATIVE', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la principal limitación de GraalVM Native Image con Spring?',
        'La reflexión, proxies dinámicos y class loading dinámico no funcionan sin configuración explícita (hints) — muchas librerías necesitan adaptaciones', 'Solo funciona con Linux', 'No soporta Java 17', 'No soporta Spring Security',
        0, 'NATIVE', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es AOT (Ahead-of-Time) processing en Spring Boot 3?',
        'Procesamiento en tiempo de compilación que analiza la app, genera código optimizado y metadata de reflexión para native image — reemplaza trabajo que antes hacía Spring en runtime', 'Compilación anticipada de HTML', 'Un tipo de caching', 'Análisis de seguridad automático',
        0, 'NATIVE', 'NEGRO', NOW());

-- =============================================
-- VIRTUAL THREADS / PROJECT LOOM (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué son los Virtual Threads de Java 21?',
        'Threads que corren en la nube', 'Threads para realidad virtual', 'Threads livianos gestionados por la JVM (no por el SO) que permiten crear millones de threads con bajo overhead — ideales para I/O blocking sin necesitar programación reactiva', 'Threads virtualizados en Docker',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se activan los Virtual Threads en Spring Boot 3.2+?',
        'Con la propiedad spring.threads.virtual.enabled=true — Spring Boot usa automáticamente virtual threads para manejar peticiones HTTP', 'Requiere código especial', 'Cambiando el servidor a Netty', 'Instalando un plugin',
        0, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuándo los Virtual Threads pueden reemplazar a WebFlux?',
        'Solo para aplicaciones batch', 'Nunca, son cosas diferentes', 'Cuando tu código es bloqueante (JDBC, RestTemplate) y necesitas alta concurrencia — virtual threads permiten el modelo thread-per-request sin agotar hilos, sin la complejidad reactiva', 'Siempre, WebFlux es obsoleto',
        2, 'JAVA_CORE', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué problema tienen los Virtual Threads con synchronized blocks?',
        'Lanza UnsupportedOperationException', 'synchronized es incompatible con virtual threads', 'synchronized "pinea" el virtual thread al platform thread del SO, bloqueándolo — se recomienda usar ReentrantLock en su lugar para no perder las ventajas', 'Ninguno, funcionan igual',
        2, 'JAVA_CORE', 'MARRON', NOW());

-- =============================================
-- REDIS / CACHING DISTRIBUIDO (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Redis en el contexto de Spring Boot?',
        'Un almacén de datos en memoria (key-value) usado como caché distribuido, session store o broker de mensajes — acceso sub-milisegundo', 'Un servidor HTTP', 'Un ORM alternativo', 'Un framework de testing',
        0, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @CacheEvict en Spring?',
        'Cachea el resultado', 'Elimina una o todas las entradas de una caché específica — se usa cuando los datos se modifican (update/delete) para invalidar la caché', 'Evita que se use la caché', 'Mueve datos de caché a BD',
        1, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre @Cacheable y @CachePut?',
        'Son lo mismo', '@Cacheable es para Redis, @CachePut para memoria', '@Cacheable NO ejecuta el método si el valor está en caché; @CachePut SIEMPRE ejecuta el método y actualiza la caché — @CachePut se usa para updates', 'CachePut es más rápido',
        2, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el cache-aside pattern?',
        'Un patrón para bases de datos', 'Un tipo de CDN', 'La app primero busca en caché; si no encuentra (cache miss), consulta la BD y guarda en caché. En escritura, actualiza BD e invalida caché', 'Un patrón de diseño visual',
        2, 'REDIS', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se configura Spring Session con Redis?',
        'Con @EnableRedisSession solamente', 'No es posible, las sesiones son locales', 'Implementando SessionFactory manualmente', 'Añadiendo spring-session-data-redis como dependencia y configurando spring.session.store-type=redis — las HttpSessions se almacenan automáticamente en Redis',
        3, 'REDIS', 'MARRON', NOW());

-- =============================================
-- OPENAPI / SWAGGER (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es OpenAPI (Swagger) en Spring Boot?',
        'Un protocolo de comunicación', 'Un framework de seguridad', 'Un tipo de test', 'Una especificación estándar para documentar APIs REST — genera documentación interactiva automáticamente desde tus controllers con springdoc-openapi',
        3, 'OPENAPI', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué dependencia se usa para OpenAPI 3 en Spring Boot 3?',
        'swagger-core', 'spring-boot-starter-swagger', 'openapi-spring-generator', 'springdoc-openapi-starter-webmvc-ui — genera la UI de Swagger en /swagger-ui.html automáticamente',
        3, 'OPENAPI', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve @Operation(summary="...") de OpenAPI?',
        'Para configurar rate limiting', 'Para ejecutar operaciones en la BD', 'Para crear operaciones CRUD automáticas', 'Para añadir descripción legible a un endpoint en la documentación generada de Swagger UI',
        3, 'OPENAPI', 'VERDE', NOW());

-- =============================================
-- PATRONES AVANZADOS (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón CQRS?',
        'Command Query Responsibility Segregation — separa el modelo de escritura (commands) del modelo de lectura (queries), permitiendo optimizar cada uno independientemente', 'Create-Query-Read-Store — patrón de cuatro operaciones que estandariza el acceso a datos en microservicios', 'Cross-service Query Resolution System — patrón que resuelve queries distribuidas entre múltiples servicios', 'Consistent Query Routing Service — patrón de routing inteligente de queries a la réplica de BD óptima',
        0, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Event Sourcing?',
        'Una técnica para procesar eventos en tiempo real usando Apache Kafka Streams o Spring Cloud Stream con windowing', 'Un sistema de logging estructurado que registra cada cambio de estado como un evento inmutable para auditoría completa', 'El patrón donde en lugar de guardar el estado actual, se guardan todos los eventos que han ocurrido — el estado se reconstruye reproduciéndolos', 'Un patrón para publicar eventos de dominio entre microservicios usando el ApplicationEventPublisher de Spring',
        2, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Outbox en microservicios?',
        'Una bandeja de salida que almacena temporalmente las respuestas HTTP cuando el servicio destino no está disponible', 'Un patrón de message queue donde los mensajes se almacenan en una tabla de BD en vez de en un broker externo', 'Un patrón de backup que guarda una copia de cada request en una tabla para poder reproducir operaciones fallidas', 'Guardar el evento y la entidad en la misma transacción de BD (tabla outbox), y un proceso aparte publica los eventos — garantiza consistencia entre BD y mensajería',
        3, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Strangler Fig para migración de monolito a microservicios?',
        'Migrar gradualmente funcionalidades del monolito a microservicios, redirigiendo tráfico progresivamente hasta que el monolito se vacía — sin big bang rewrite', 'Eliminar el monolito de golpe', 'Un tipo de load balancing', 'Un patrón de base de datos',
        0, 'PATRONES', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el patrón Bulkhead en microservicios?',
        'Aislar recursos (thread pools, conexiones) por servicio/funcionalidad para que el fallo de uno no agote los recursos de otros — como compartimentos estancos de un barco', 'Un patrón de autenticación que aísla los tokens de sesión por microservicio para prevenir token leaking', 'Un patrón de deployment que aísla cada versión del servicio en su propio contenedor para rollback inmediato', 'Un patrón de base de datos que particiona las tablas por servicio para aislar el impacto de queries lentas',
        0, 'PATRONES', 'NEGRO', NOW());

-- =============================================
-- CUSTOM AUTO-CONFIGURATION (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cómo se crea un custom Spring Boot starter?',
        'Creando un módulo con auto-configuración (@Configuration + @Conditional*), registrándola en META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports, y un starter POM que agrupa dependencias', 'Solo Spring puede crear starters', 'Con @StarterConfiguration', 'Con spring init --starter',
        0, 'SPRING_BOOT', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace @AutoConfiguration(after = DataSourceAutoConfiguration.class)?',
        'Desactiva DataSourceAutoConfiguration', 'Configuración automática de backups', 'Ejecuta después de la app', 'Ordena la auto-configuración para que se procese DESPUÉS de DataSourceAutoConfiguration — garantiza que el DataSource ya existe cuando tu config lo necesite',
        3, 'SPRING_BOOT', 'NEGRO', NOW());

-- =============================================
-- OAUTH2 / OIDC AVANZADO (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué diferencia hay entre OAuth2 y OpenID Connect (OIDC)?',
        'OAuth2 usa JSON Web Tokens; OIDC usa SAML assertions — ambos sirven para autenticación y autorización', 'Son protocolos independientes: OAuth2 para APIs REST y OIDC para aplicaciones web con sesión de usuario', 'OAuth2 es un framework de AUTORIZACIÓN (acceso a recursos); OIDC es una capa de AUTENTICACIÓN sobre OAuth2 que añade identidad del usuario (ID Token)', 'OIDC es la versión más reciente de OAuth2 (v3.0) con mejoras de seguridad y soporte para tokens opacos',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un ID Token vs un Access Token en OIDC?',
        'Access Token siempre es JWT', 'Son intercambiables', 'ID Token contiene información del usuario (quién es, JWT firmado); Access Token da permisos para acceder a recursos (autorización) — nunca usar ID Token para autorizar acceso a APIs', 'ID Token es para APIs, Access Token para login',
        2, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el flujo Authorization Code + PKCE en OAuth2?',
        'El flujo recomendado para SPAs y móviles: usa un code verifier/challenge para prevenir interceptación del authorization code — reemplaza al Implicit flow (deprecated)', 'Un flujo para aplicaciones de servidor', 'Un tipo de cifrado', 'Un flujo de autenticación con contraseña',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace spring-boot-starter-oauth2-resource-server?',
        'Configura tu API como Resource Server que valida tokens JWT o tokens opacos — verifica firma, expiración y claims antes de permitir acceso', 'Crea un servidor OAuth2', 'Gestiona usuarios OAuth2', 'Genera tokens OAuth2',
        0, 'SPRING_SECURITY', 'NEGRO', NOW());

-- =============================================
-- SPRING BATCH (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Spring Batch?',
        'Un framework de scheduling', 'Un framework para procesamiento de datos en lote (batch) — lee, procesa y escribe grandes volúmenes de datos con manejo de errores, restart y chunk processing', 'Una extensión de Spring MVC', 'Un framework para hacer commits en lote',
        1, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuál es la estructura de un Job en Spring Batch?',
        'Job → Queue → Worker', 'Job → Pipeline → Output', 'Job → Task → Run', 'Job → Step(s) → cada Step tiene un Reader (lee datos), Processor (transforma) y Writer (escribe resultado) — procesamiento chunk-oriented',
        3, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es chunk processing en Spring Batch?',
        'Dividir archivos en pedazos', 'Comprimir datos antes de procesarlos', 'Procesar todo de una vez', 'Leer N items (chunk size), procesarlos en memoria, y escribirlos juntos en una transacción — si falla, solo se pierde el chunk actual, no todo el job',
        3, 'SPRING_BATCH', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Para qué sirve el JobRepository en Spring Batch?',
        'Para persistir metadatos de ejecución (estado del job, step, restart info) — permite reiniciar jobs desde el punto donde fallaron', 'Para almacenar los datos del job', 'Para almacenar configuración del job', 'Para gestionar repositorios Git',
        0, 'SPRING_BATCH', 'MARRON', NOW());

-- =============================================
-- HIBERNATE AVANZADO (MARRÓN)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el second-level cache (L2) en Hibernate?',
        'El caché de queries JPQL', 'El caché del navegador', 'Un caché compartido entre sesiones/transacciones (a diferencia del L1 que es por sesión) — se configura con EhCache/Caffeine y reduce queries a la BD', 'El caché del connection pool',
        2, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es dirty checking en Hibernate?',
        'Verificar datos corruptos', 'Un tipo de validación', 'Verificar permisos de escritura', 'Hibernate compara automáticamente el estado de las entidades managed con su snapshot inicial al hacer flush — genera UPDATE solo para campos que realmente cambiaron',
        3, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es @BatchSize(size=N) en Hibernate?',
        'Optimización que carga N colecciones lazy a la vez usando IN clause en vez de N queries individuales — reduce el problema N+1 sin JOIN FETCH', 'Tamaño del batch de Spring Batch', 'Número de entidades en caché', 'Tamaño máximo del ResultSet',
        0, 'SPRING_DATA_JPA', 'MARRON', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Cuáles son los estados del ciclo de vida de una entidad JPA?',
        'New (transient), Managed (persistido en contexto), Detached (fuera del contexto), Removed (marcado para borrar)', 'Loaded, Modified, Saved', 'Created, Updated, Deleted', 'Activo e Inactivo',
        0, 'SPRING_DATA_JPA', 'MARRON', NOW());

-- =============================================
-- CI/CD Y DEPLOYMENT (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es CI/CD en el contexto de Spring Boot?',
        'Code Inspection / Code Documentation', 'Configuration Injection / Container Deployment', 'Continuous Integration (build + tests automáticos en cada push) y Continuous Delivery/Deployment (deploy automático a staging/producción)', 'Container Image / Container Distribution',
        2, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es GitHub Actions para un proyecto Spring Boot?',
        'Una plataforma CI/CD integrada en GitHub que ejecuta workflows (build, test, deploy) automáticamente en respuesta a eventos como push o pull requests', 'Un plugin de Maven', 'Un IDE online', 'Acciones de Git en el repositorio',
        0, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué estrategia de deployment minimiza downtime?',
        'Copiar el JAR manualmente', 'Blue-Green deployment: mantener dos entornos idénticos, desplegar en el inactivo (green) y redirigir tráfico cuando está listo — rollback instantáneo volviendo al anterior (blue)', 'Parar el servidor y redesplegar', 'Desplegar de madrugada',
        1, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un rolling deployment?',
        'Actualizar instancias gradualmente: se reemplazan una por una con la nueva versión mientras las demás siguen sirviendo tráfico — sin downtime pero con versiones mixtas temporalmente', 'Un deployment programado', 'Un deployment que puede deshacerse', 'Desplegar en un servidor a la vez de forma rotativa',
        0, 'DEVOPS', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un Canary deployment?',
        'Un deployment solo para testers', 'Un deployment nocturno', 'Enviar un pequeño porcentaje del tráfico (ej: 5%) a la nueva versión para validar su comportamiento antes de hacer rollout completo — detecta problemas con impacto mínimo', 'Un deployment de prueba en producción',
        2, 'DEVOPS', 'NEGRO', NOW());

-- =============================================
-- SPRING DATA REST / HATEOAS (VERDE)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué hace Spring Data REST automáticamente?',
        'Expone los repositorios JPA como endpoints REST completos (CRUD + paginación + búsqueda) sin necesidad de crear controllers — útil para prototipos rápidos', 'Genera tests automáticos', 'Crea la base de datos', 'Crea documentación Swagger',
        0, 'REST_API', 'VERDE', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es un RepresentationModel en Spring HATEOAS?',
        'Un modelo de datos de la BD', 'Un modelo de representación visual', 'Una clase base que añade links (_links) a los DTOs de respuesta, permitiendo navegar la API siguiendo enlaces como en una web — nivel 3 del Richardson Maturity Model', 'Una clase abstracta de Spring MVC',
        2, 'REST_API', 'VERDE', NOW());

-- =============================================
-- SEGURIDAD AVANZADA (NEGRO)
-- =============================================

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es Rate Limiting y cómo se implementa en Spring?',
        'Limitar el número de usuarios concurrentes en la aplicación usando un semáforo global en el SecurityFilterChain', 'Limitar la velocidad de las queries SQL para evitar sobrecarga de la base de datos en picos de tráfico', 'Limitar el tamaño máximo de la respuesta JSON para optimizar el ancho de banda entre cliente y servidor', 'Restringir el número de peticiones por cliente/IP en un periodo de tiempo — se implementa con Resilience4j @RateLimiter, Bucket4j, o en el API Gateway',
        3, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es JWT Refresh Token y por qué se usa?',
        'Un token que se regenera automáticamente cada N minutos sin intervención del usuario ni del servidor', 'Un token de larga duración que permite obtener nuevos Access Tokens sin re-autenticarse — el Access Token es de corta vida (minutos), el Refresh Token de larga vida (días/semanas)', 'Un token especial que refresca la caché del servidor de autenticación para mejorar el rendimiento de login', 'Un token que permite regenerar la contraseña del usuario cuando el Access Token original ha expirado',
        1, 'SPRING_SECURITY', 'NEGRO', NOW());

INSERT INTO quizzes (question, optiona, optionb, optionc, optiond, correct_option, category, difficulty, created_at)
VALUES ('¿Qué es el principio de least privilege en seguridad?',
        'Privilegiar las cuentas de servicio sobre las cuentas de usuario porque tienen mejor auditoría y rotación de credenciales', 'Dar acceso total inicialmente y restringir gradualmente según el comportamiento del usuario en la plataforma', 'Reducir el número total de usuarios con acceso al sistema para minimizar la superficie de ataque', 'Cada usuario/servicio debe tener SOLO los permisos mínimos necesarios para su función — nunca dar más acceso del necesario',
        3, 'SPRING_SECURITY', 'NEGRO', NOW());

