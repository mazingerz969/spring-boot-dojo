export interface GuiaSection {
  title: string;
  content: string;
}

export interface GuiaChapter {
  id: number;
  title: string;
  intro: string;
  sections: GuiaSection[];
}

export const guiaContent: GuiaChapter[] = [
  {
    id: 1,
    title: "Preparación del Entorno",
    intro: `Antes de escribir una sola línea de código, necesitas tener tu máquina preparada. En este paso vamos a instalar y configurar todo lo necesario: Java 17, Maven, IntelliJ IDEA, plugins útiles y las configuraciones que te ahorrarán problemas más adelante.`,
    sections: [
      {
        title: `1. Instalar JDK 17`,
        content: `<p>Spring Boot 3.x requiere <b>Java 17 como mínimo</b>. No vale Java 8, ni 11. Tiene que ser 17 o superior.</p><p><b>¿Dónde descargarlo?</b></p><ul><li><a href='https://adoptium.net/' target='_blank'>Eclipse Adoptium (Temurin)</a> — Recomendado, gratuito, open source</li><li><a href='https://www.oracle.com/java/technologies/downloads/#java17' target='_blank'>Oracle JDK</a> — Oficial pero con licencia más restrictiva</li><li><a href='https://www.azul.com/downloads/?version=java-17-lts' target='_blank'>Azul Zulu</a> — Alternativa gratuita</li></ul><p><b>Instalación en Windows:</b></p><ol><li>Descarga el instalador <code>.msi</code> de Adoptium</li><li>Ejecuta el instalador — marca la opción <b>"Set JAVA_HOME variable"</b></li><li>Marca también <b>"Add to PATH"</b></li><li>Finaliza la instalación</li></ol><p><b>Instalación en Linux (Fedora/Ubuntu):</b></p><pre><code># Fedora
sudo dnf install java-17-openjdk-devel

# Ubuntu/Debian
sudo apt install openjdk-17-jdk</code></pre><p><b>Verificar la instalación:</b></p><pre><code>java -version
# Debe mostrar algo como: openjdk version "17.0.x"</code></pre><p>Si muestra otra versión, es que tienes varias instaladas. En Windows, revisa las variables de entorno. En Linux: <code>sudo alternatives --config java</code></p>`,
      },
      {
        title: `2. Instalar Maven (opcional)`,
        content: `<p>Maven es la herramienta que gestiona las dependencias y compila el proyecto. <b>IntelliJ ya trae Maven integrado</b>, así que no es obligatorio instalarlo aparte. Pero si quieres usarlo desde terminal (recomendado para scripts y Docker):</p><p><b>Windows:</b></p><ol><li>Descarga de <a href='https://maven.apache.org/download.cgi' target='_blank'>maven.apache.org</a></li><li>Descomprime en <code>C:\\Program Files\\Maven</code></li><li>Añade <code>C:\\Program Files\\Maven\\bin</code> al PATH del sistema</li></ol><p><b>Linux:</b></p><pre><code># Fedora
sudo dnf install maven

# Ubuntu/Debian
sudo apt install maven</code></pre><p><b>Verificar:</b></p><pre><code>mvn -version
# Debe mostrar Apache Maven 3.9.x y Java 17</code></pre><p>⚠️ Si <code>mvn -version</code> muestra Java 8 u 11, es que JAVA_HOME apunta a la versión antigua. Configura JAVA_HOME para que apunte a tu JDK 17.</p>`,
      },
      {
        title: `3. Instalar IntelliJ IDEA`,
        content: `<p><b>¿Community o Ultimate?</b></p><ul><li><b>Community (gratuita)</b> — Suficiente para este proyecto. Tiene soporte Java, Maven, Git. Le falta el soporte nativo de Spring, pero no lo necesitas porque lo hacemos todo manual.</li><li><b>Ultimate (de pago)</b> — Añade soporte Spring, Spring Boot run configs, endpoints viewer, database tools integrado. Si tienes licencia, úsalo. Si no, Community va perfecto.</li></ul><p><b>Descarga:</b> <a href='https://www.jetbrains.com/idea/download/' target='_blank'>jetbrains.com/idea</a></p><p>Si eres estudiante puedes pedir <a href='https://www.jetbrains.com/community/education/' target='_blank'>licencia educativa gratuita</a> de Ultimate.</p>`,
      },
      {
        title: `4. Plugins recomendados para IntelliJ`,
        content: `<p>Ve a <b>File → Settings → Plugins → Marketplace</b> e instala:</p><table class='table table-sm table-dark'><thead><tr><th>Plugin</th><th>Para qué</th><th>¿Obligatorio?</th></tr></thead><tbody><tr><td><b>Spring Boot Assistant</b></td><td>Autocompletado en application.yml, navegación a beans</td><td>Muy recomendado</td></tr><tr><td><b>Rainbow Brackets</b></td><td>Colorea los paréntesis/llaves por nivel — vida más fácil</td><td>Recomendado</td></tr><tr><td><b>.ignore</b></td><td>Ayuda a crear y gestionar archivos .gitignore</td><td>Recomendado</td></tr><tr><td><b>Database Navigator</b></td><td>Explorar la base de datos H2 desde IntelliJ (alternativa a la consola web)</td><td>Opcional</td></tr><tr><td><b>Key Promoter X</b></td><td>Te enseña atajos de teclado mientras trabajas</td><td>Opcional pero útil</td></tr></tbody></table><p>Después de instalarlos, <b>reinicia IntelliJ</b>.</p>`,
      },
      {
        title: `5. Configurar IntelliJ correctamente`,
        content: `<p>Antes de crear el proyecto, ajusta estas configuraciones:</p><p><b>A) Configurar JDK 17:</b></p><ol><li><b>File → Project Structure → Project</b></li><li>En "SDK" selecciona tu JDK 17 (si no aparece, click en "Add SDK" → busca la carpeta de instalación)</li><li>En "Language level" selecciona <b>17</b></li></ol><p><b>B) Encoding UTF-8:</b></p><ol><li><b>File → Settings → Editor → File Encodings</b></li><li>Pon TODO en <b>UTF-8</b>: Global Encoding, Project Encoding, y Default encoding for properties files</li><li>Esto evita problemas con tildes y eñes en el código</li></ol><p><b>C) Auto-import Maven:</b></p><ol><li><b>File → Settings → Build → Build Tools → Maven → Importing</b></li><li>Marca <b>"Reload project after changes in the build scripts"</b> → Selecciona "Any changes"</li><li>Así no tienes que recargar Maven manualmente cada vez que cambias el pom.xml</li></ol><p><b>D) Annotation Processing (importante para Lombok si lo usas):</b></p><ol><li><b>File → Settings → Build → Compiler → Annotation Processors</b></li><li>Marca <b>"Enable annotation processing"</b></li></ol>`,
      },
      {
        title: `6. Configurar Run Configurations`,
        content: `<p>Vas a tener <b>6 microservicios</b> que arrancar. Para no abrir 6 terminales manualmente cada vez:</p><p><b>Crear una Run Configuration por servicio:</b></p><ol><li><b>Run → Edit Configurations → + → Spring Boot</b> (en Ultimate) o <b>Application</b> (en Community)</li><li>Nombre: <code>Eureka Server</code></li><li>Main class: <code>com.dojo.eureka.EurekaServerApplication</code></li><li>Module classpath: <code>eureka-server</code></li><li>Repite para cada servicio</li></ol><table class='table table-sm table-dark'><thead><tr><th>Nombre</th><th>Main Class</th><th>Módulo</th><th>Puerto</th></tr></thead><tbody><tr><td>Eureka Server</td><td>com.dojo.eureka.EurekaServerApplication</td><td>eureka-server</td><td>8761</td></tr><tr><td>Auth Service</td><td>com.dojo.auth.AuthServiceApplication</td><td>auth-service</td><td>8081</td></tr><tr><td>Content Service</td><td>com.dojo.content.ContentServiceApplication</td><td>content-service</td><td>8083</td></tr><tr><td>Progress Service</td><td>com.dojo.progress.ProgressServiceApplication</td><td>progress-service</td><td>8084</td></tr><tr><td>API Gateway</td><td>com.dojo.gateway.ApiGatewayApplication</td><td>api-gateway</td><td>8080</td></tr><tr><td>Dojo Frontend</td><td>com.dojo.frontend.DojoFrontendApplication</td><td>dojo-frontend</td><td>8090</td></tr></tbody></table><p><b>Compound Run Configuration (arrancar todo junto):</b></p><ol><li><b>Run → Edit Configurations → + → Compound</b></li><li>Nombre: <code>All Services</code></li><li>Añade las 6 configuraciones anteriores</li><li>Ahora con un solo click arrancas todo</li></ol><p>⚠️ <b>Orden importa</b>: Eureka debe arrancar primero. IntelliJ arranca todos a la vez en Compound, pero como Eureka es rápido y los demás tardan más en registrarse, normalmente funciona. Si da problemas, arranca Eureka solo, espera 5 segundos y luego arranca el Compound con el resto.</p>`,
      },
      {
        title: `7. Instalar Git`,
        content: `<p>Si no tienes Git instalado:</p><p><b>Windows:</b> Descarga de <a href='https://git-scm.com/download/win' target='_blank'>git-scm.com</a></p><p><b>Linux:</b></p><pre><code># Fedora
sudo dnf install git

# Ubuntu
sudo apt install git</code></pre><p><b>Verificar:</b></p><pre><code>git --version</code></pre><p>IntelliJ detecta Git automáticamente. Cuando creemos el proyecto, inicializaremos el repo.</p>`,
      },
      {
        title: `8. Herramientas para probar APIs`,
        content: `<p>Para probar los endpoints de la API vas a necesitar algo más que el navegador:</p><ul><li><b>curl</b> — Viene en Linux y Windows 10+. Lo usaremos en los ejemplos de la guía.</li><li><b>Postman</b> — Interfaz gráfica muy cómoda. Descarga: <a href='https://www.postman.com/downloads/' target='_blank'>postman.com</a></li><li><b>IntelliJ HTTP Client</b> — Integrado en Ultimate. Archivos <code>.http</code> directamente en el proyecto.</li></ul><p>Ejemplo de petición con curl que usaremos más adelante:</p><pre><code>curl -X POST http://localhost:8081/api/auth/register \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto","password":"1234"}'</code></pre>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<p>Antes de pasar al siguiente capítulo, asegúrate de tener:</p><ul><li>☐ <code>java -version</code> muestra Java 17+</li><li>☐ <code>mvn -version</code> muestra Maven 3.9+ con Java 17 (si instalaste Maven)</li><li>☐ IntelliJ IDEA instalado y abierto</li><li>☐ Plugins instalados (al menos Spring Boot Assistant y Rainbow Brackets)</li><li>☐ JDK 17 configurado en Project Structure</li><li>☐ Encoding en UTF-8</li><li>☐ Git instalado</li></ul><p>Si todo está ✅, estás listo para crear el proyecto. ¡Vamos! 🚀</p>`,
      },
    ],
  },
  {
    id: 2,
    title: "Estructura del Proyecto",
    intro: `Vamos a crear la estructura base: una carpeta raíz que contenga todos los microservicios como proyectos independientes. Cada servicio tiene su propio pom.xml y se puede compilar y arrancar por separado. Esto es lo más parecido a cómo se trabaja en el mundo real con microservicios.`,
    sections: [
      {
        title: `1. Crear la carpeta del proyecto`,
        content: `<p>En tu terminal (o desde el explorador de archivos), crea la carpeta raíz:</p><pre><code># Crea la carpeta principal
mkdir spring-boot-dojo
cd spring-boot-dojo

# Inicializa Git desde el principio
git init</code></pre><p>Esta carpeta <b>no es un proyecto Maven en sí</b> — es simplemente el contenedor que agrupa todos los servicios. Cada microservicio será un proyecto Spring Boot independiente dentro de esta carpeta.</p>`,
      },
      {
        title: `2. Crear cada microservicio con Spring Initializr`,
        content: `<p>Vamos a crear cada servicio usando <a href='https://start.spring.io/' target='_blank'>Spring Initializr</a> (la herramienta oficial de Spring para generar proyectos). Puedes hacerlo desde la web o desde IntelliJ:</p><p><b>Desde IntelliJ:</b></p><ol><li><b>File → New → Module</b> (si ya abriste la carpeta spring-boot-dojo) o <b>File → New → Project</b></li><li>Selecciona <b>Spring Initializr</b> en el panel izquierdo</li><li>Server URL: <code>https://start.spring.io</code></li><li>Rellena: Group = <code>com.dojo</code>, Artifact = <code>eureka-server</code> (o el nombre del servicio)</li><li>Type: <b>Maven</b></li><li>Language: <b>Java</b></li><li>Java version: <b>17</b></li><li>Spring Boot version: <b>3.2.0</b></li><li>Next → Selecciona las dependencias necesarias (las veremos servicio por servicio)</li><li>Create → Se genera dentro de spring-boot-dojo/</li></ol><p><b>Desde la web</b> (<a href='https://start.spring.io/' target='_blank'>start.spring.io</a>):</p><ol><li>Configura lo mismo que arriba</li><li>Click en <b>Generate</b> → descarga un .zip</li><li>Descomprime dentro de <code>spring-boot-dojo/</code></li></ol>`,
      },
      {
        title: `3. Estructura final de carpetas`,
        content: `<p>Cuando tengamos todos los servicios creados, la estructura será:</p><pre><code>spring-boot-dojo/
├── eureka-server/          ← Service Discovery (puerto 8761)
│   ├── src/
│   │   └── main/
│   │       ├── java/com/dojo/eureka/
│   │       └── resources/
│   │           └── application.yml
│   └── pom.xml
│
├── auth-service/           ← Autenticación JWT (puerto 8081)
│   ├── src/main/java/com/dojo/auth/
│   │   ├── config/
│   │   ├── controller/
│   │   ├── dto/
│   │   ├── entity/
│   │   ├── repository/
│   │   └── service/
│   └── pom.xml
│
├── content-service/        ← Contenido: flashcards, quizzes (puerto 8083)
│   ├── src/main/java/com/dojo/content/
│   │   ├── config/         ← DataSeeder.java (datos iniciales)
│   │   ├── controller/
│   │   ├── dto/
│   │   ├── entity/
│   │   ├── repository/
│   │   └── service/
│   └── pom.xml
│
├── progress-service/       ← Progreso del usuario (puerto 8084)
│   ├── src/main/java/com/dojo/progress/
│   │   ├── controller/
│   │   ├── dto/
│   │   ├── entity/
│   │   ├── repository/
│   │   └── service/
│   └── pom.xml
│
├── api-gateway/            ← Punto de entrada único (puerto 8080)
│   ├── src/main/java/com/dojo/gateway/
│   │   └── filter/         ← JwtAuthFilter.java
│   └── pom.xml
│
├── dojo-frontend/          ← Frontend web (puerto 8090)
│   ├── src/main/java/com/dojo/frontend/
│   │   ├── config/
│   │   ├── controller/
│   │   └── dto/
│   ├── src/main/resources/
│   │   ├── templates/      ← HTMLs (Thymeleaf)
│   │   ├── static/css/     ← Estilos
│   │   └── application.yml
│   └── pom.xml
│
├── docker-compose.yml
├── start-all.sh            ← Script para arrancar todo
├── .gitignore
└── PROYECTO.md</code></pre><p>Cada carpeta es un proyecto Spring Boot completo e independiente. No hay un pom.xml padre — cada servicio gestiona sus propias dependencias.</p>`,
      },
      {
        title: `4. El pom.xml de cada servicio (estructura base)`,
        content: `<p>Todos los servicios comparten esta estructura base en su pom.xml. Lo que cambia son las dependencias específicas de cada uno:</p><pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

    &lt;!-- Hereda de Spring Boot --&gt;
    &lt;parent&gt;
        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
        &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;
        &lt;version&gt;3.2.0&lt;/version&gt;
        &lt;relativePath/&gt;
    &lt;/parent&gt;

    &lt;groupId&gt;com.dojo&lt;/groupId&gt;
    &lt;artifactId&gt;nombre-del-servicio&lt;/artifactId&gt;
    &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;

    &lt;properties&gt;
        &lt;java.version&gt;17&lt;/java.version&gt;
        &lt;spring-cloud.version&gt;2023.0.0&lt;/spring-cloud.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;!-- Dependencias específicas del servicio aquí --&gt;
    &lt;/dependencies&gt;

    &lt;!-- Gestión de versiones de Spring Cloud --&gt;
    &lt;dependencyManagement&gt;
        &lt;dependencies&gt;
            &lt;dependency&gt;
                &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
                &lt;artifactId&gt;spring-cloud-dependencies&lt;/artifactId&gt;
                &lt;version&gt;\${spring-cloud.version}&lt;/version&gt;
                &lt;type&gt;pom&lt;/type&gt;
                &lt;scope&gt;import&lt;/scope&gt;
            &lt;/dependency&gt;
        &lt;/dependencies&gt;
    &lt;/dependencyManagement&gt;

    &lt;build&gt;
        &lt;plugins&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
                &lt;artifactId&gt;spring-boot-maven-plugin&lt;/artifactId&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
&lt;/project&gt;</code></pre>`,
      },
      {
        title: `5. Crear el .gitignore`,
        content: `<p>Crea el archivo <code>.gitignore</code> en la raíz de <code>spring-boot-dojo/</code>. Esto evita subir archivos compilados, configuración del IDE y logs a Git:</p><pre><code># Compilados
**/target/
**/*.class
**/*.jar
**/*.war

# Maven wrapper (si no lo usas)
**/.mvn/
**/mvnw
**/mvnw.cmd

# IntelliJ IDEA
**/*.iml
**/.idea/

# Eclipse
**/.settings/
**/.classpath
**/.project
**/.factorypath

# Logs
**/logs/
**/*.log

# H2 Database files
**/*.db
**/*.mv.db
**/*.trace.db</code></pre><p>Para crear el archivo con el plugin <b>.ignore</b> de IntelliJ:</p><ol><li>Click derecho en la raíz del proyecto → New → .ignore File → .gitignore</li><li>Selecciona las plantillas: <b>Java, Maven, IntelliJ</b></li><li>Genera el archivo y ajústalo con el contenido de arriba</li></ol>`,
      },
      {
        title: `6. Abrir el proyecto en IntelliJ`,
        content: `<p>Ahora abre la carpeta <code>spring-boot-dojo/</code> en IntelliJ:</p><ol><li><b>File → Open</b> → selecciona la carpeta <code>spring-boot-dojo/</code></li><li>IntelliJ preguntará si quieres abrir como proyecto — di que <b>sí</b></li><li>Si detecta archivos pom.xml dentro, preguntará si quieres importarlos como Maven — di que <b>sí</b></li><li>Espera a que Maven descargue todas las dependencias (primera vez tarda unos minutos)</li></ol><p>En el panel izquierdo (Project) deberías ver todas las carpetas de los microservicios. Si alguna no se reconoce como módulo Maven, haz click derecho → <b>Add as Maven Project</b>.</p><p>⚠️ <b>Si ves errores rojos en todos los imports:</b> Es que Maven no descargó las dependencias. Abre la pestaña <b>Maven</b> (panel derecho) → click en el botón de <b>Reload</b> (🔄).</p>`,
      },
      {
        title: `7. Primer commit`,
        content: `<p>Antes de empezar a crear servicios, haz tu primer commit con la estructura base:</p><pre><code>cd spring-boot-dojo
git add .
git commit -m "Estructura inicial del proyecto"</code></pre><p>O desde IntelliJ: <b>VCS → Commit</b> (o Ctrl+K), selecciona todos los archivos y escribe el mensaje.</p><p>💡 <b>Consejo</b>: Haz commits frecuentes. Después de cada paso de esta guía que funcione, commitea. Así si algo se rompe más adelante, puedes volver atrás fácilmente.</p>`,
      },
      {
        title: `💡 ¿Por qué no usamos un pom.xml padre multi-módulo?`,
        content: `<p>En muchos tutoriales verás que se crea un <b>pom.xml padre</b> con <code>&lt;packaging&gt;pom&lt;/packaging&gt;</code> y <code>&lt;modules&gt;</code> que lista todos los servicios. Esto permite compilar todo con un solo <code>mvn clean install</code>.</p><p>En este proyecto <b>cada servicio es completamente independiente</b>. ¿Por qué?</p><ul><li><b>Más realista</b> — En producción, cada microservicio suele tener su propio repositorio Git</li><li><b>Independencia</b> — Puedes actualizar Spring Boot en un servicio sin afectar a los demás</li><li><b>Despliegue independiente</b> — Cada servicio se compila y despliega por separado</li><li><b>Menos acoplamiento</b> — No hay dependencias entre los pom.xml</li></ul><p>La desventaja es que tienes que gestionar versiones en cada pom.xml por separado. Para un proyecto de aprendizaje con 6 servicios, es perfectamente manejable.</p><p>Si en el futuro quisieras un pom padre, solo tendrías que crear un pom.xml en la raíz con <code>&lt;modules&gt;</code> y cambiar el <code>&lt;parent&gt;</code> de cada servicio para que apunte a él.</p>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Carpeta <code>spring-boot-dojo/</code> creada</li><li>☐ <code>git init</code> hecho</li><li>☐ <code>.gitignore</code> creado</li><li>☐ Proyecto abierto en IntelliJ</li><li>☐ Entiendes la estructura de carpetas que vamos a crear</li><li>☐ Primer commit hecho</li></ul><p>Ahora sí, vamos a crear el primer microservicio: <b>Eureka Server</b>. 🚀</p>`,
      },
    ],
  },
  {
    id: 3,
    title: "Eureka Server (Service Discovery)",
    intro: `El primer microservicio que vamos a crear es Eureka Server. Es el servicio de descubrimiento: el resto de microservicios se registran en él al arrancar, y cuando un servicio necesita hablar con otro, le pregunta a Eureka dónde está. Piensa en él como una guía telefónica: buscas por nombre ("auth-service") y Eureka te dice la dirección (IP + puerto).`,
    sections: [
      {
        title: `1. ¿Qué problema resuelve Eureka?`,
        content: `<p>Sin Eureka, cada servicio tendría que saber la URL exacta de los demás. Por ejemplo, el Gateway tendría hardcodeado <code>http://localhost:8081</code> para hablar con Auth. Esto funciona en desarrollo, pero en producción los servicios pueden cambiar de IP, tener varias instancias, o estar en diferentes máquinas.</p><p><b>Con Eureka:</b></p><ol><li>Cada servicio arranca y le dice a Eureka: "Hola, soy <code>auth-service</code> y estoy en <code>192.168.1.5:8081</code>"</li><li>Cuando el Gateway necesita llamar a Auth, pregunta a Eureka: "¿Dónde está <code>auth-service</code>?"</li><li>Eureka responde con la dirección actual</li><li>Si hay 3 instancias de auth-service, Eureka las devuelve todas y el Gateway puede hacer <b>balanceo de carga</b></li></ol><p>En Spring Cloud, esto se traduce en usar <code>lb://auth-service</code> en vez de <code>http://localhost:8081</code>. El prefijo <code>lb://</code> significa "load balanced" — busca en Eureka y elige una instancia.</p>`,
      },
      {
        title: `2. Crear el proyecto eureka-server`,
        content: `<p><b>Opción A — Desde IntelliJ (Spring Initializr):</b></p><ol><li><b>File → New → Module</b> (dentro de spring-boot-dojo)</li><li>Selecciona <b>Spring Initializr</b></li><li>Group: <code>com.dojo</code> / Artifact: <code>eureka-server</code></li><li>Type: Maven / Java 17 / Spring Boot 3.2.0</li><li>Next → En dependencias busca y selecciona: <b>Eureka Server</b> (dentro de Spring Cloud Discovery)</li><li>Create</li></ol><p><b>Opción B — Desde la web:</b></p><ol><li>Ve a <a href='https://start.spring.io/' target='_blank'>start.spring.io</a></li><li>Configura: Maven, Java 17, Spring Boot 3.2.0, Group: com.dojo, Artifact: eureka-server</li><li>ADD DEPENDENCIES → busca "Eureka Server" → añádelo</li><li>GENERATE → descarga el .zip → descomprime en <code>spring-boot-dojo/eureka-server/</code></li></ol><p>La estructura creada será:</p><pre><code>eureka-server/
├── src/
│   └── main/
│       ├── java/com/dojo/eureka/
│       │   └── EurekaServerApplication.java
│       └── resources/
│           └── application.properties  ← Lo cambiaremos a .yml
└── pom.xml</code></pre>`,
      },
      {
        title: `3. El pom.xml completo`,
        content: `<p>Spring Initializr genera el pom.xml con las dependencias que seleccionaste. Debe quedar así:</p><pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

    &lt;parent&gt;
        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
        &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;
        &lt;version&gt;3.2.0&lt;/version&gt;
        &lt;relativePath/&gt;
    &lt;/parent&gt;

    &lt;groupId&gt;com.dojo&lt;/groupId&gt;
    &lt;artifactId&gt;eureka-server&lt;/artifactId&gt;
    &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
    &lt;name&gt;eureka-server&lt;/name&gt;
    &lt;description&gt;Service Discovery - Spring Boot Dojo&lt;/description&gt;

    &lt;properties&gt;
        &lt;java.version&gt;17&lt;/java.version&gt;
        &lt;spring-cloud.version&gt;2023.0.0&lt;/spring-cloud.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;!-- La única dependencia: Eureka Server --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-cloud-starter-netflix-eureka-server&lt;/artifactId&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;

    &lt;!-- Gestión de versiones de Spring Cloud --&gt;
    &lt;dependencyManagement&gt;
        &lt;dependencies&gt;
            &lt;dependency&gt;
                &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
                &lt;artifactId&gt;spring-cloud-dependencies&lt;/artifactId&gt;
                &lt;version&gt;\${spring-cloud.version}&lt;/version&gt;
                &lt;type&gt;pom&lt;/type&gt;
                &lt;scope&gt;import&lt;/scope&gt;
            &lt;/dependency&gt;
        &lt;/dependencies&gt;
    &lt;/dependencyManagement&gt;

    &lt;build&gt;
        &lt;plugins&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
                &lt;artifactId&gt;spring-boot-maven-plugin&lt;/artifactId&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
&lt;/project&gt;</code></pre><p>📌 <b>Nota</b>: Fíjate en el bloque <code>&lt;dependencyManagement&gt;</code>. Esto NO añade dependencias — solo <b>gestiona las versiones</b> de Spring Cloud. Así cuando declaras <code>spring-cloud-starter-netflix-eureka-server</code> arriba, no necesitas especificar la versión porque ya la sabe por <code>spring-cloud-dependencies</code>.</p>`,
      },
      {
        title: `4. La clase principal: EurekaServerApplication.java`,
        content: `<p><b>Ruta</b>: <code>eureka-server/src/main/java/com/dojo/eureka/EurekaServerApplication.java</code></p><pre><code>package com.dojo.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer  // ← Esta anotación activa Eureka
public class EurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}</code></pre><p><b>¿Qué hace cada cosa?</b></p><ul><li><code>@SpringBootApplication</code> — Ya la conoces del capítulo anterior: configuración + auto-config + component scan</li><li><code>@EnableEurekaServer</code> — Le dice a Spring Boot que este servicio <b>ES</b> un servidor Eureka. Sin esta anotación, sería una app Spring Boot normal que no hace nada especial</li><li><code>SpringApplication.run(...)</code> — Arranca la aplicación. Standard en todos los servicios</li></ul><p>Sí, es todo. Solo 2 anotaciones y un main. Spring Boot se encarga del resto. Toda la magia está en las dependencias del pom.xml y la configuración del application.yml.</p>`,
      },
      {
        title: `5. Configuración: application.yml`,
        content: `<p><b>Ruta</b>: <code>eureka-server/src/main/resources/application.yml</code></p><p>⚠️ Spring Initializr genera <code>application.properties</code>. Renómbralo a <code>application.yml</code> — es más legible para configuraciones jerárquicas.</p><p>En IntelliJ: click derecho sobre el archivo → <b>Refactor → Rename</b> → cambia la extensión a <code>.yml</code></p><pre><code>server:
  port: 8761  # Puerto estándar de Eureka

spring:
  application:
    name: eureka-server  # Nombre del servicio

eureka:
  client:
    register-with-eureka: false  # No se registra a sí mismo
    fetch-registry: false        # No busca otros servidores Eureka
  server:
    enable-self-preservation: false  # Desactivar en desarrollo</code></pre><p><b>¿Por qué estas configuraciones?</b></p><table class='table table-sm table-dark'><thead><tr><th>Propiedad</th><th>Valor</th><th>¿Por qué?</th></tr></thead><tbody><tr><td><code>server.port</code></td><td>8761</td><td>Puerto estándar de Eureka. Todos los servicios buscan Eureka en este puerto por defecto</td></tr><tr><td><code>spring.application.name</code></td><td>eureka-server</td><td>Identifica al servicio. No es crítico aquí porque Eureka no se registra a sí mismo, pero es buena práctica</td></tr><tr><td><code>register-with-eureka</code></td><td>false</td><td>Eureka ES el servidor, no necesita registrarse en sí mismo. Si lo dejas en true, intenta registrarse y lanza errores en el log</td></tr><tr><td><code>fetch-registry</code></td><td>false</td><td>No necesita descargar el registro de otro Eureka (solo hay uno). En producción con múltiples Eureka, sería true</td></tr><tr><td><code>enable-self-preservation</code></td><td>false</td><td>En producción, Eureka no elimina servicios caídos por si es un problema de red temporal. En desarrollo esto es un incordio — desactívalo para que los servicios se limpien rápido</td></tr></tbody></table>`,
      },
      {
        title: `6. Arrancar y probar`,
        content: `<p><b>Desde IntelliJ:</b></p><ol><li>Abre <code>EurekaServerApplication.java</code></li><li>Click en el botón verde ▶ que aparece al lado del método <code>main</code></li><li>O usa la Run Configuration que creamos en el capítulo 1: <code>Eureka Server</code></li></ol><p><b>Desde terminal:</b></p><pre><code>cd eureka-server
mvn spring-boot:run</code></pre><p><b>¿Qué deberías ver en la consola?</b></p><pre><code>  .   ____          _            __ _ _
 /\\\\ / ___'_ __ _ _(_)_ __  __ _ \\ \\ \\ \\
( ( )\\___ | '_ | '_| | '_ \\/ _\` | \\ \\ \\ \\
 \\\\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.2.0)

... Started EurekaServerApplication in X.XXX seconds</code></pre><p>Cuando veas <code>Started EurekaServerApplication</code>, abre el navegador:</p><p>👉 <a href='http://localhost:8761' target='_blank'><b>http://localhost:8761</b></a></p><p>Verás el <b>dashboard de Eureka</b>: una página web con información del servidor. La sección <b>"Instances currently registered with Eureka"</b> estará vacía — es normal, todavía no hemos arrancado ningún otro servicio.</p><p>Cuando arranquemos los siguientes servicios, aparecerán listados ahí automáticamente. Deja Eureka corriendo mientras desarrollas los demás servicios.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td><code>Port 8761 already in use</code></td><td>Ya tienes algo corriendo en ese puerto (otra instancia de Eureka o cualquier otra app)</td><td>Cierra el proceso: <code>lsof -i :8761</code> (Linux/Mac) o <code>netstat -ano | findstr 8761</code> (Windows), luego mata el proceso. O cambia el puerto en application.yml</td></tr><tr><td><code>Cannot resolve spring-cloud-starter-netflix-eureka-server</code></td><td>Falta el bloque <code>dependencyManagement</code> con <code>spring-cloud-dependencies</code> en tu pom.xml</td><td>Copia el bloque <code>&lt;dependencyManagement&gt;</code> completo del paso anterior. Luego haz Maven Reload (🔄)</td></tr><tr><td><code>Connection refused</code> en el log (repetido)</td><td>Eureka intenta registrarse en sí mismo porque <code>register-with-eureka</code> no está en false</td><td>Asegúrate de tener <code>register-with-eureka: false</code> y <code>fetch-registry: false</code></td></tr><tr><td>Dashboard vacío</td><td>No hay otros servicios registrados</td><td>¡Es normal! Los verás cuando arranques auth-service, content-service, etc.</td></tr><tr><td><code>java.lang.NoSuchMethodError</code> o errores raros de classpath</td><td>Versiones incompatibles de Spring Boot y Spring Cloud</td><td>Spring Boot 3.2.x necesita Spring Cloud 2023.0.x. Verifica que ambas versiones coinciden en tu pom.xml. Consulta la <a href='https://spring.io/projects/spring-cloud#overview' target='_blank'>tabla de compatibilidad</a></td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<p>Si te preguntan sobre Eureka en una entrevista de Spring Boot, estos son los puntos clave:</p><ul><li><b>Service Discovery</b> — Patrón que permite a los servicios encontrarse entre sí sin URLs hardcodeadas</li><li><b>Eureka Server</b> — El registro central donde los servicios se apuntan</li><li><b>Eureka Client</b> — Cada microservicio que se registra en Eureka (lo veremos en los siguientes capítulos)</li><li><b>Heartbeat</b> — Los clientes envían un "ping" cada 30 segundos para decir que siguen vivos</li><li><b>Self-preservation</b> — Si Eureka deja de recibir heartbeats de muchos servicios a la vez, asume que es un problema de red (no que todos cayeron) y NO los elimina del registro</li><li><b>Alternativas</b> — Consul, Zookeeper, Kubernetes DNS. Eureka es el estándar de Netflix/Spring Cloud</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>eureka-server</code> creado dentro de <code>spring-boot-dojo/</code></li><li>☐ pom.xml con la dependencia <code>spring-cloud-starter-netflix-eureka-server</code></li><li>☐ <code>@EnableEurekaServer</code> en la clase principal</li><li>☐ <code>application.yml</code> configurado (puerto 8761, register false, fetch false)</li><li>☐ Arranca sin errores y ves el dashboard en <a href='http://localhost:8761'>localhost:8761</a></li><li>☐ Commit: <code>git commit -m "Add eureka-server"</code></li></ul><p>¡Primer microservicio funcionando! 🎉 Ahora vamos con el que más chicha tiene: <b>Auth Service</b>. 🔐</p>`,
      },
    ],
  },
  {
    id: 4,
    title: "Auth Service (Seguridad + JWT)",
    intro: `Este es el servicio más importante y complejo de la arquitectura. Gestiona el registro de usuarios, login y generación de tokens JWT. Cuando un usuario se identifica correctamente, recibe un token que debe enviar en cada petición posterior. El Gateway valida ese token sin consultar la base de datos.`,
    sections: [
      {
        title: `1. ¿Qué es JWT y cómo funciona?`,
        content: `<p><b>JWT (JSON Web Token)</b> es un estándar para transmitir información de forma segura entre dos partes. Es un string codificado que contiene tres partes separadas por puntos:</p><pre><code>eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiZXJ0byJ9.firma_aqui
│                      │                      │
└─ Header (algoritmo)  └─ Payload (datos)    └─ Firma (verificación)</code></pre><p><b>Flujo completo:</b></p><ol><li>El usuario envía <code>username + password</code> a <code>/auth/login</code></li><li>Auth Service busca el usuario en la base de datos</li><li>Compara la contraseña con BCrypt (hash seguro)</li><li>Si es correcta, genera un <b>JWT firmado</b> con una clave secreta</li><li>Devuelve el token al cliente</li><li>El cliente guarda el token y lo envía en el header <code>Authorization: Bearer &lt;token&gt;</code></li><li>El Gateway valida el token <b>sin llamar a Auth Service</b> — solo necesita la misma clave secreta</li></ol><p>💡 <b>¿Por qué no sesiones?</b> En microservicios, cada servicio es independiente. Las sesiones requieren un servidor centralizado o compartir estado. JWT es <b>stateless</b> — toda la info necesaria va dentro del token.</p>`,
      },
      {
        title: `2. Crear el proyecto auth-service`,
        content: `<p><b>Spring Initializr</b> (IntelliJ o web) con estas dependencias:</p><table class='table table-sm table-dark'><thead><tr><th>Dependencia</th><th>Para qué</th></tr></thead><tbody><tr><td><b>Spring Web</b></td><td>API REST (controllers, endpoints HTTP)</td></tr><tr><td><b>Spring Security</b></td><td>Proteger endpoints, encriptar contraseñas</td></tr><tr><td><b>Spring Data JPA</b></td><td>Acceso a base de datos con entidades y repositorios</td></tr><tr><td><b>H2 Database</b></td><td>Base de datos en memoria para desarrollo</td></tr><tr><td><b>Validation</b></td><td>Validar datos de entrada (@NotBlank, @Email, @Size)</td></tr><tr><td><b>Eureka Discovery Client</b></td><td>Registrarse en Eureka</td></tr></tbody></table><p>⚠️ <b>JJWT no está en Initializr</b> — hay que añadirla manualmente al pom.xml. Es la librería que genera y valida los tokens JWT.</p>`,
      },
      {
        title: `3. El pom.xml completo`,
        content: `<p><b>Ruta</b>: <code>auth-service/pom.xml</code></p><pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project ...&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

    &lt;parent&gt;
        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
        &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;
        &lt;version&gt;3.2.0&lt;/version&gt;
        &lt;relativePath/&gt;
    &lt;/parent&gt;

    &lt;groupId&gt;com.dojo&lt;/groupId&gt;
    &lt;artifactId&gt;auth-service&lt;/artifactId&gt;
    &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
    &lt;name&gt;auth-service&lt;/name&gt;
    &lt;description&gt;JWT Authentication Service - Spring Boot Dojo&lt;/description&gt;

    &lt;properties&gt;
        &lt;java.version&gt;17&lt;/java.version&gt;
        &lt;spring-cloud.version&gt;2023.0.0&lt;/spring-cloud.version&gt;
        &lt;jjwt.version&gt;0.12.3&lt;/jjwt.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;!-- API REST --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-web&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- Seguridad --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-security&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- Base de datos --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-data-jpa&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- Validación --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-validation&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- H2: BD en memoria para desarrollo --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;com.h2database&lt;/groupId&gt;
            &lt;artifactId&gt;h2&lt;/artifactId&gt;
            &lt;scope&gt;runtime&lt;/scope&gt;
        &lt;/dependency&gt;

        &lt;!-- Eureka Client --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-cloud-starter-netflix-eureka-client&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- JWT (3 librerías: API + implementación + serialización) --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-api&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-impl&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
            &lt;scope&gt;runtime&lt;/scope&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-jackson&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
            &lt;scope&gt;runtime&lt;/scope&gt;
        &lt;/dependency&gt;

        &lt;!-- Testing --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-test&lt;/artifactId&gt;
            &lt;scope&gt;test&lt;/scope&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;

    &lt;dependencyManagement&gt;
        &lt;dependencies&gt;
            &lt;dependency&gt;
                &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
                &lt;artifactId&gt;spring-cloud-dependencies&lt;/artifactId&gt;
                &lt;version&gt;\${spring-cloud.version}&lt;/version&gt;
                &lt;type&gt;pom&lt;/type&gt;
                &lt;scope&gt;import&lt;/scope&gt;
            &lt;/dependency&gt;
        &lt;/dependencies&gt;
    &lt;/dependencyManagement&gt;

    &lt;build&gt;
        &lt;plugins&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
                &lt;artifactId&gt;spring-boot-maven-plugin&lt;/artifactId&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
&lt;/project&gt;</code></pre><p>📌 <b>¿Por qué 3 dependencias de JJWT?</b></p><ul><li><code>jjwt-api</code> — La interfaz pública (lo que usas en tu código)</li><li><code>jjwt-impl</code> — La implementación (runtime, no la usas directamente)</li><li><code>jjwt-jackson</code> — Serialización JSON del token (runtime)</li></ul><p>La versión se define en <code>&lt;properties&gt;</code> con <code>\${jjwt.version}</code> para no repetirla tres veces.</p>`,
      },
      {
        title: `4. Estructura de carpetas del auth-service`,
        content: `<p>Crea estos paquetes dentro de <code>src/main/java/com/dojo/auth/</code>:</p><pre><code>com.dojo.auth/
├── AuthServiceApplication.java  ← Clase principal
├── config/
│   └── SecurityConfig.java       ← Configuración de seguridad
├── controller/
│   └── AuthController.java       ← Endpoints REST
├── dto/
│   ├── LoginRequest.java          ← Datos de login
│   ├── RegisterRequest.java       ← Datos de registro
│   └── AuthResponse.java          ← Respuesta con token
├── entity/
│   └── User.java                  ← Entidad JPA (tabla users)
├── repository/
│   └── UserRepository.java        ← Acceso a BD
└── service/
    ├── AuthService.java            ← Lógica de negocio
    └── JwtService.java             ← Generar/validar tokens</code></pre><p>En IntelliJ: click derecho en <code>com.dojo.auth</code> → <b>New → Package</b> → escribe <code>config</code>, luego repite para <code>controller</code>, <code>dto</code>, <code>entity</code>, <code>repository</code>, <code>service</code>.</p>`,
      },
      {
        title: `5. Clase principal: AuthServiceApplication.java`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/AuthServiceApplication.java</code></p><pre><code>package com.dojo.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient  // ← Se registra en Eureka al arrancar
public class AuthServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthServiceApplication.class, args);
    }
}</code></pre><p><code>@EnableDiscoveryClient</code> le dice a Spring que este servicio se registre automáticamente en Eureka. Cuando arranque, verás <code>AUTH-SERVICE</code> aparecer en el dashboard de Eureka (<a href='http://localhost:8761'>localhost:8761</a>).</p>`,
      },
      {
        title: `6. Entidad User (entity/User.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/entity/User.java</code></p><pre><code>package com.dojo.auth.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "users")  // Nombre de la tabla en la BD
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;  // Se guarda encriptada con BCrypt

    @Column(nullable = false)
    private String role;  // "USER" o "ADMIN"

    // Constructor vacío — OBLIGATORIO para JPA
    public User() {}

    public User(String username, String email, String password, String role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}</code></pre><p><b>Anotaciones clave:</b></p><ul><li><code>@Entity</code> — Marca esta clase como una tabla de BD. JPA crea la tabla automáticamente</li><li><code>@Table(name = "users")</code> — Nombre de la tabla. Sin esto, usaría "User" que es palabra reservada en algunos SQL</li><li><code>@Id + @GeneratedValue(IDENTITY)</code> — Clave primaria auto-incremental</li><li><code>@Column(unique = true)</code> — No puede haber dos usuarios con el mismo username o email</li><li><code>Constructor vacío</code> — JPA lo necesita para crear instancias por reflexión</li></ul>`,
      },
      {
        title: `7. DTOs (dto/)`,
        content: `<p>Los DTOs (Data Transfer Objects) son clases simples que representan los datos que viajan por la API. Nunca expones la entidad directamente — podrías filtrar el hash del password sin querer.</p><p><b>LoginRequest.java</b>:</p><pre><code>package com.dojo.auth.dto;

import jakarta.validation.constraints.NotBlank;

public class LoginRequest {

    @NotBlank  // No puede estar vacío ni ser solo espacios
    private String username;

    @NotBlank
    private String password;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}</code></pre><p><b>RegisterRequest.java</b>:</p><pre><code>package com.dojo.auth.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class RegisterRequest {

    @NotBlank
    @Size(min = 3, max = 50)  // Mínimo 3 caracteres
    private String username;

    @NotBlank
    @Email  // Valida formato email
    private String email;

    @NotBlank
    @Size(min = 6, max = 100)  // Mínimo 6 caracteres
    private String password;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}</code></pre><p><b>AuthResponse.java</b>:</p><pre><code>package com.dojo.auth.dto;

public class AuthResponse {

    private String token;     // El JWT
    private String username;  // Nombre del usuario
    private String role;      // "USER" o "ADMIN"

    public AuthResponse(String token, String username, String role) {
        this.token = token;
        this.username = username;
        this.role = role;
    }

    public String getToken() { return token; }
    public void setToken(String token) { this.token = token; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}</code></pre><p>📌 Las anotaciones <code>@NotBlank</code>, <code>@Email</code>, <code>@Size</code> son de <b>Bean Validation</b> (dependencia <code>spring-boot-starter-validation</code>). Se activan cuando usas <code>@Valid</code> en el controller.</p>`,
      },
      {
        title: `8. Repository (repository/UserRepository.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/repository/UserRepository.java</code></p><pre><code>package com.dojo.auth.repository;

import com.dojo.auth.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository&lt;User, Long&gt; {

    Optional&lt;User&gt; findByUsername(String username);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}</code></pre><p><b>¿Cómo funciona esto?</b> Spring Data JPA es MAGIA:</p><ul><li>Solo defines una <b>interface</b> (no una clase) que extiende <code>JpaRepository</code></li><li>Spring genera la implementación automáticamente al arrancar</li><li>Ya tienes gratis: <code>save()</code>, <code>findById()</code>, <code>findAll()</code>, <code>delete()</code>, etc.</li><li>Los métodos con nombre especial generan queries: <code>findByUsername</code> → <code>SELECT * FROM users WHERE username = ?</code></li><li><code>existsByEmail</code> → <code>SELECT COUNT(*) > 0 FROM users WHERE email = ?</code></li></ul><p>No escribes SQL. Spring lo deduce del nombre del método. Esto se llama <b>Derived Query Methods</b>.</p>`,
      },
      {
        title: `9. JwtService (service/JwtService.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/service/JwtService.java</code></p><pre><code>package com.dojo.auth.service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Service
public class JwtService {

    private final SecretKey key;
    private final long expiration;

    public JwtService(@Value("\${jwt.secret}") String secret,
                     @Value("\${jwt.expiration}") long expiration) {
        this.key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        this.expiration = expiration;
    }

    public String generateToken(String username, String role) {
        return Jwts.builder()
                .subject(username)           // Quién es
                .claim("role", role)        // Rol del usuario
                .issuedAt(new Date())        // Cuándo se creó
                .expiration(new Date(        // Cuándo expira
                    System.currentTimeMillis() + expiration))
                .signWith(key)               // Firma con clave secreta
                .compact();                  // Genera el string
    }

    public Claims extractClaims(String token) {
        return Jwts.parser()
                .verifyWith(key)             // Verifica la firma
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public String extractUsername(String token) {
        return extractClaims(token).getSubject();
    }

    public boolean isTokenValid(String token) {
        try {
            extractClaims(token);
            return true;
        } catch (Exception e) {
            return false;  // Token expirado, firma inválida, etc.
        }
    }
}</code></pre><p><b>Puntos clave:</b></p><ul><li><code>@Value("\${jwt.secret}")</code> — Lee la clave secreta del <code>application.yml</code></li><li><code>Keys.hmacShaKeyFor()</code> — Convierte el string en una clave criptográfica. La clave debe tener al menos 256 bits (32 caracteres) para HMAC-SHA256</li><li><code>generateToken()</code> — Crea el JWT con el username, rol, fecha de creación y expiración</li><li><code>isTokenValid()</code> — Intenta parsear el token. Si falla (expirado, firma incorrecta), devuelve false</li></ul>`,
      },
      {
        title: `10. AuthService (service/AuthService.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/service/AuthService.java</code></p><pre><code>package com.dojo.auth.service;

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

    // Inyección por constructor (las 3 dependencias)
    public AuthService(UserRepository userRepository,
                      PasswordEncoder passwordEncoder,
                      JwtService jwtService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    public AuthResponse register(RegisterRequest request) {
        // Validar que no exista el usuario
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new IllegalArgumentException("Username already exists");
        }
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("Email already exists");
        }

        // Crear usuario con contraseña encriptada
        User user = new User(
                request.getUsername(),
                request.getEmail(),
                passwordEncoder.encode(request.getPassword()),  // ← BCrypt
                "USER"
        );
        userRepository.save(user);

        // Generar token y responder
        String token = jwtService.generateToken(user.getUsername(), user.getRole());
        return new AuthResponse(token, user.getUsername(), user.getRole());
    }

    public AuthResponse login(LoginRequest request) {
        // Buscar usuario
        User user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new IllegalArgumentException("Invalid credentials"));

        // Verificar contraseña
        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new IllegalArgumentException("Invalid credentials");
        }

        String token = jwtService.generateToken(user.getUsername(), user.getRole());
        return new AuthResponse(token, user.getUsername(), user.getRole());
    }

    public boolean validateToken(String token) {
        return jwtService.isTokenValid(token);
    }
}</code></pre><p>📌 <b>¿Qué hace <code>passwordEncoder.encode()</code>?</b></p><p>BCrypt genera un hash irreversible de la contraseña. Si la contraseña es "1234", se guarda algo como <code>\$2a\$10\$N9qo8uLOickgx2ZMRZoMye...</code>. Nunca se guarda la contraseña en texto plano. <code>passwordEncoder.matches()</code> compara la contraseña introducida contra el hash guardado.</p>`,
      },
      {
        title: `11. AuthController (controller/AuthController.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/controller/AuthController.java</code></p><pre><code>package com.dojo.auth.controller;

import com.dojo.auth.dto.AuthResponse;
import com.dojo.auth.dto.LoginRequest;
import com.dojo.auth.dto.RegisterRequest;
import com.dojo.auth.service.AuthService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/register")
    public ResponseEntity&lt;AuthResponse&gt; register(
            @Valid @RequestBody RegisterRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(authService.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity&lt;AuthResponse&gt; login(
            @Valid @RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    @GetMapping("/validate")
    public ResponseEntity&lt;Map&lt;String, Boolean&gt;&gt; validateToken(
            @RequestParam String token) {
        boolean valid = authService.validateToken(token);
        return ResponseEntity.ok(Map.of("valid", valid));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity&lt;Map&lt;String, String&gt;&gt; handleIllegalArgument(
            IllegalArgumentException e) {
        return ResponseEntity.badRequest()
                .body(Map.of("error", e.getMessage()));
    }
}</code></pre><p><b>Anotaciones clave:</b></p><ul><li><code>@Valid</code> — Activa las validaciones de los DTOs (@NotBlank, @Email, @Size). Sin @Valid, las anotaciones no hacen nada</li><li><code>@RequestBody</code> — Lee el JSON del cuerpo de la petición y lo convierte en el DTO</li><li><code>ResponseEntity.status(CREATED)</code> — Devuelve código 201 (Created) en vez de 200</li><li><code>@ExceptionHandler</code> — Captura excepciones de este controller y devuelve un error limpio en JSON</li></ul>`,
      },
      {
        title: `12. SecurityConfig (config/SecurityConfig.java)`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/java/com/dojo/auth/config/SecurityConfig.java</code></p><pre><code>package com.dojo.auth.config;

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
    public SecurityFilterChain securityFilterChain(HttpSecurity http)
            throws Exception {
        http
            .csrf(csrf -> csrf.disable())              // 1
            .sessionManagement(session -> session
                .sessionCreationPolicy(
                    SessionCreationPolicy.STATELESS))  // 2
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/auth/register",
                    "/auth/login",
                    "/auth/validate").permitAll()     // 3
                .requestMatchers("/h2-console/**")
                    .permitAll()                       // 4
                .anyRequest().authenticated())         // 5
            .headers(headers -> headers
                .frameOptions(frame -> frame.disable())); // 6

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // 7
    }
}</code></pre><p><b>Explicación de cada punto:</b></p><ol><li><b>CSRF desactivado</b> — CSRF protege contra ataques en formularios web con sesión. Nosotros usamos JWT (stateless), así que no necesitamos CSRF</li><li><b>Stateless</b> — No crear sesiones HTTP. Cada petición se autentica por JWT</li><li><b>Rutas públicas</b> — Login, registro y validación no requieren token (obvio, aún no lo tienes)</li><li><b>H2 Console</b> — Permitir acceso a la consola de la BD en desarrollo</li><li><b>Todo lo demás requiere auth</b> — Cualquier otra ruta necesita estar autenticado</li><li><b>Frame Options desactivado</b> — La consola H2 usa iframes. Sin esto, el navegador los bloquea</li><li><b>BCryptPasswordEncoder</b> — El bean que se inyecta en AuthService para encriptar contraseñas</li></ol>`,
      },
      {
        title: `13. application.yml`,
        content: `<p><b>Ruta</b>: <code>auth-service/src/main/resources/application.yml</code></p><pre><code>server:
  port: 8081

spring:
  application:
    name: auth-service
  datasource:
    url: jdbc:h2:mem:authdb       # BD en memoria
    driver-class-name: org.h2.Driver
    username: sa
    password:                      # Sin contraseña
  jpa:
    hibernate:
      ddl-auto: create-drop        # Crea tablas al arrancar, borra al parar
    show-sql: true                  # Muestra las queries SQL en consola
  h2:
    console:
      enabled: true                 # Consola web de H2

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/

jwt:
  secret: dojo-secret-key-that-is-at-least-256-bits-long-for-hs256-algorithm-security
  expiration: 86400000              # 24 horas en milisegundos</code></pre><p><b>Propiedades importantes:</b></p><ul><li><code>jdbc:h2:mem:authdb</code> — Base de datos <b>en memoria</b>. Los datos se pierden al reiniciar. Para persistir: <code>jdbc:h2:file:./data/authdb</code></li><li><code>ddl-auto: create-drop</code> — Hibernate crea las tablas automáticamente a partir de las entidades @Entity. En producción usarías <code>validate</code> + migraciones Flyway</li><li><code>show-sql: true</code> — Muy útil para depurar. Ves cada query que ejecuta JPA en la consola</li><li><code>jwt.secret</code> — La clave para firmar tokens. DEBE ser la misma en Auth Service y en el API Gateway. Mínimo 32 caracteres para HS256</li><li><code>86400000</code> — 24h × 60min × 60seg × 1000ms = 86.400.000 milisegundos</li></ul>`,
      },
      {
        title: `14. Arrancar y probar`,
        content: `<p>⚠️ <b>Eureka debe estar corriendo</b> antes de arrancar Auth Service.</p><pre><code># Terminal 1 (si no está corriendo)
cd eureka-server && mvn spring-boot:run

# Terminal 2
cd auth-service && mvn spring-boot:run</code></pre><p>Cuando veas <code>Started AuthServiceApplication</code>, prueba con curl:</p><pre><code># 1. Registrar un usuario
curl -s -X POST http://localhost:8081/auth/register \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto","email":"berto@test.com","password":"123456"}'

# Respuesta:
# {"token":"eyJhbGci...","username":"berto","role":"USER"}

# 2. Login
curl -s -X POST http://localhost:8081/auth/login \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto","password":"123456"}'

# 3. Validar un token
curl -s 'http://localhost:8081/auth/validate?token=TU_TOKEN_AQUI'</code></pre><p><b>Consola H2</b>: Abre <a href='http://localhost:8081/h2-console' target='_blank'>localhost:8081/h2-console</a></p><ul><li>JDBC URL: <code>jdbc:h2:mem:authdb</code></li><li>User: <code>sa</code> / Password: (vacío)</li><li>Click Connect → Puedes ejecutar: <code>SELECT * FROM USERS;</code></li></ul><p>También verifica que aparece en <b>Eureka</b>: abre <a href='http://localhost:8761'>localhost:8761</a> y busca <code>AUTH-SERVICE</code> en la lista de instancias registradas.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td><code>403 Forbidden</code> en /auth/register o /auth/login</td><td>Spring Security bloquea todo por defecto</td><td>Revisa que <code>SecurityConfig</code> tiene <code>.requestMatchers("/auth/register", "/auth/login").permitAll()</code></td></tr><tr><td><code>There is no PasswordEncoder mapped</code></td><td>Falta el bean <code>PasswordEncoder</code></td><td>Añade el <code>@Bean passwordEncoder()</code> en SecurityConfig</td></tr><tr><td><code>io.jsonwebtoken.security.WeakKeyException</code></td><td>La clave JWT es demasiado corta</td><td>El secret debe tener al menos 32 caracteres (256 bits) para HS256</td></tr><tr><td>Los datos se pierden al reiniciar</td><td>H2 en memoria (<code>mem:authdb</code>) se borra al parar</td><td>Normal en desarrollo. Para persistir: <code>jdbc:h2:file:./data/authdb</code></td></tr><tr><td><code>H2 console: 404</code></td><td>La consola H2 no está habilitada</td><td>Asegúrate de tener <code>h2.console.enabled: true</code> en application.yml</td></tr><tr><td>No aparece en Eureka</td><td>Eureka no está arrancado o la URL es incorrecta</td><td>Verifica que Eureka está en :8761 y que <code>defaultZone</code> es correcto</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>JWT vs Sesiones</b> — JWT es stateless (info en el token), sesiones son stateful (info en el servidor). JWT escala mejor en microservicios</li><li><b>BCrypt</b> — Algoritmo de hash con salt. Cada vez que encriptas "1234" genera un hash diferente. Es unidireccional: no puedes desencriptar, solo comparar</li><li><b>@EnableWebSecurity</b> — Activa la configuración de seguridad personalizada en Spring Boot 3</li><li><b>SecurityFilterChain</b> — Reemplaza al antiguo <code>WebSecurityConfigurerAdapter</code> (deprecado en Spring Security 6)</li><li><b>CSRF</b> — Cross-Site Request Forgery. Se desactiva en APIs REST stateless porque no hay cookies de sesión que robar</li><li><b>PasswordEncoder</b> — Nunca guardar contraseñas en texto plano. BCrypt es el estándar actual</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>auth-service</code> creado con todas las dependencias</li><li>☐ Todos los archivos creados: Entity, DTOs, Repository, Services, Controller, SecurityConfig</li><li>☐ application.yml configurado (puerto 8081, H2, Eureka, JWT)</li><li>☐ Arranca sin errores (con Eureka corriendo)</li><li>☐ Registro funciona con curl → devuelve token</li><li>☐ Login funciona con curl → devuelve token</li><li>☐ Aparece en el dashboard de Eureka como AUTH-SERVICE</li><li>☐ Puedes acceder a la consola H2 y ver la tabla USERS</li><li>☐ Commit: <code>git commit -m "Add auth-service with JWT"</code></li></ul><p>¡Servicio de autenticación listo! 🔐 Ahora vamos con el <b>Content Service</b> — donde vive todo el contenido de aprendizaje. 📚</p>`,
      },
    ],
  },
  {
    id: 5,
    title: "Content Service (API REST + JPA)",
    intro: `El Content Service es el corazón del contenido de aprendizaje. Gestiona flashcards, quizzes y ejercicios de código. Aquí aprenderás el patrón completo de Spring Boot: Entity → Repository → Service → Controller → DTO. Es el servicio con más código, pero todo sigue la misma estructura.`,
    sections: [
      {
        title: `1. Crear el proyecto content-service`,
        content: `<p><b>Spring Initializr</b> con estas dependencias:</p><table class='table table-sm table-dark'><thead><tr><th>Dependencia</th><th>Para qué</th></tr></thead><tbody><tr><td><b>Spring Web</b></td><td>API REST</td></tr><tr><td><b>Spring Data JPA</b></td><td>Acceso a BD con entidades y repos</td></tr><tr><td><b>H2 Database</b></td><td>BD en memoria</td></tr><tr><td><b>Validation</b></td><td>Validar DTOs</td></tr><tr><td><b>Eureka Discovery Client</b></td><td>Registrarse en Eureka</td></tr></tbody></table><p>📌 A diferencia del Auth Service, aquí <b>NO necesitamos</b> Spring Security ni JWT. La seguridad la gestiona el Gateway — Content Service solo recibe peticiones ya validadas.</p>`,
      },
      {
        title: `2. Estructura de carpetas`,
        content: `<pre><code>com.dojo.content/
├── ContentServiceApplication.java
├── config/
│   └── DataSeeder.java          ← Carga datos iniciales al arrancar
├── controller/
│   ├── FlashcardController.java
│   ├── QuizController.java
│   └── CodeExerciseController.java
├── dto/
│   ├── FlashcardRequest.java
│   └── QuizRequest.java
├── entity/
│   ├── Flashcard.java
│   ├── Quiz.java
│   ├── CodeExercise.java
│   └── UserFlashcardHistory.java  ← Para repetición espaciada
├── repository/
│   ├── FlashcardRepository.java
│   ├── QuizRepository.java
│   ├── CodeExerciseRepository.java
│   └── UserFlashcardHistoryRepository.java
└── service/
    ├── FlashcardService.java
    ├── QuizService.java
    └── CodeExerciseService.java</code></pre><p>Es el servicio con más archivos — pero todos siguen el mismo patrón. Si entiendes la Flashcard (Entity→Repo→Service→Controller), entiendes Quiz y CodeExercise.</p>`,
      },
      {
        title: `3. El patrón: Entity → Repository → Service → Controller`,
        content: `<p>Antes de ver el código, entiende el patrón que se repite en <b>TODOS</b> los servicios Spring Boot:</p><pre><code>Petición HTTP
     │
     ▼
┌─────────────┐  Recibe la petición, valida entrada,
│ Controller  │  devuelve respuesta HTTP (200, 404, etc.)
└──────┬──────┘
       │
       ▼
┌─────────────┐  Lógica de negocio: reglas, cálculos,
│   Service   │  transformaciones, validaciones complejas
└──────┬──────┘
       │
       ▼
┌─────────────┐  Acceso a datos: queries SQL generadas
│ Repository  │  automáticamente por Spring Data
└──────┬──────┘
       │
       ▼
┌─────────────┐  Mapeo Java ↔ tabla de BD.
│   Entity    │  Cada campo = una columna
└─────────────┘

   DTO = lo que viaja por la API (no exponer Entity)</code></pre><p>Vamos a crear cada capa para Flashcard. Después, Quiz y CodeExercise son copy-paste con variaciones.</p>`,
      },
      {
        title: `4. Entity: Flashcard.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/entity/Flashcard.java</code></p><pre><code>package com.dojo.content.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "flashcards")
public class Flashcard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String question;

    @Column(nullable = false, length = 2000)
    private String answer;

    @Column(nullable = false)
    private String category;    // FUNDAMENTOS, REST_API, SECURITY...

    @Column(nullable = false)
    private String difficulty;   // BLANCO, AMARILLO, NARANJA...

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist  // Se ejecuta antes de guardar por primera vez
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    public Flashcard() {}

    public Flashcard(String question, String answer,
                    String category, String difficulty) {
        this.question = question;
        this.answer = answer;
        this.category = category;
        this.difficulty = difficulty;
    }

    // Getters y setters de todos los campos
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}</code></pre><p><b>Novedades respecto a User:</b></p><ul><li><code>@Column(length = 2000)</code> — Por defecto las columnas String son VARCHAR(255). Las respuestas pueden ser largas, así que le damos más espacio</li><li><code>@PrePersist</code> — Callback de JPA que se ejecuta automáticamente antes del primer <code>save()</code>. Así el <code>createdAt</code> se rellena solo sin que tú lo hagas</li><li><code>updatable = false</code> — La fecha de creación no se puede modificar después</li></ul>`,
      },
      {
        title: `5. Entity: Quiz.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/entity/Quiz.java</code></p><pre><code>package com.dojo.content.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String question;

    @Column(nullable = false)
    private String optionA;
    @Column(nullable = false)
    private String optionB;
    @Column(nullable = false)
    private String optionC;
    @Column(nullable = false)
    private String optionD;

    @Column(nullable = false)
    private int correctOption;  // 0=A, 1=B, 2=C, 3=D

    @Column(nullable = false)
    private String category;
    @Column(nullable = false)
    private String difficulty;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    public Quiz() {}

    public Quiz(String question, String optionA, String optionB,
               String optionC, String optionD, int correctOption,
               String category, String difficulty) {
        this.question = question;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.correctOption = correctOption;
        this.category = category;
        this.difficulty = difficulty;
    }

    // Getters y setters (todos los campos)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getOptionA() { return optionA; }
    public void setOptionA(String optionA) { this.optionA = optionA; }
    public String getOptionB() { return optionB; }
    public void setOptionB(String optionB) { this.optionB = optionB; }
    public String getOptionC() { return optionC; }
    public void setOptionC(String optionC) { this.optionC = optionC; }
    public String getOptionD() { return optionD; }
    public void setOptionD(String optionD) { this.optionD = optionD; }
    public int getCorrectOption() { return correctOption; }
    public void setCorrectOption(int correctOption) { this.correctOption = correctOption; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}</code></pre><p>Mismo patrón que Flashcard pero con 4 opciones y un <code>correctOption</code> (índice 0-3).</p>`,
      },
      {
        title: `6. Repositories`,
        content: `<p>Los repositorios son interfaces — Spring genera la implementación:</p><p><b>FlashcardRepository.java</b>:</p><pre><code>package com.dojo.content.repository;

import com.dojo.content.entity.Flashcard;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FlashcardRepository
        extends JpaRepository&lt;Flashcard, Long&gt; {

    List&lt;Flashcard&gt; findByCategory(String category);
    List&lt;Flashcard&gt; findByDifficulty(String difficulty);
    List&lt;Flashcard&gt; findByCategoryAndDifficulty(
            String category, String difficulty);
}</code></pre><p><b>QuizRepository.java</b>: Idéntico pero con <code>Quiz</code> en vez de <code>Flashcard</code>.</p><pre><code>package com.dojo.content.repository;

import com.dojo.content.entity.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface QuizRepository
        extends JpaRepository&lt;Quiz, Long&gt; {

    List&lt;Quiz&gt; findByCategory(String category);
    List&lt;Quiz&gt; findByDifficulty(String difficulty);
    List&lt;Quiz&gt; findByCategoryAndDifficulty(
            String category, String difficulty);
}</code></pre><p><b>CodeExerciseRepository.java</b>:</p><pre><code>package com.dojo.content.repository;

import com.dojo.content.entity.CodeExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CodeExerciseRepository
        extends JpaRepository&lt;CodeExercise, Long&gt; {
    List&lt;CodeExercise&gt; findByBelt(String belt);
}</code></pre><p>📌 <b>Derived Query Methods en acción:</b></p><ul><li><code>findByDifficulty("BLANCO")</code> → <code>SELECT * FROM flashcards WHERE difficulty = 'BLANCO'</code></li><li><code>findByCategoryAndDifficulty("REST_API", "AMARILLO")</code> → <code>WHERE category = 'REST_API' AND difficulty = 'AMARILLO'</code></li></ul><p>Spring lee el nombre del método y construye la query automáticamente. No escribes SQL.</p>`,
      },
      {
        title: `7. DTOs`,
        content: `<p><b>FlashcardRequest.java</b>:</p><pre><code>package com.dojo.content.dto;

import jakarta.validation.constraints.NotBlank;

public class FlashcardRequest {
    @NotBlank private String question;
    @NotBlank private String answer;
    @NotBlank private String category;
    @NotBlank private String difficulty;

    // Getters y setters de los 4 campos
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
}</code></pre><p><b>QuizRequest.java</b>:</p><pre><code>package com.dojo.content.dto;

import jakarta.validation.constraints.*;

public class QuizRequest {
    @NotBlank private String question;
    @NotBlank private String optionA;
    @NotBlank private String optionB;
    @NotBlank private String optionC;
    @NotBlank private String optionD;
    @Min(0) @Max(3) private int correctOption;
    @NotBlank private String category;
    @NotBlank private String difficulty;

    // Getters y setters de todos los campos...
}</code></pre><p><code>@Min(0) @Max(3)</code> valida que correctOption sea 0, 1, 2 o 3 (las 4 opciones A-D).</p>`,
      },
      {
        title: `8. FlashcardService.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/service/FlashcardService.java</code></p><pre><code>package com.dojo.content.service;

import com.dojo.content.dto.FlashcardRequest;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.repository.FlashcardRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FlashcardService {

    private final FlashcardRepository flashcardRepository;

    public FlashcardService(FlashcardRepository flashcardRepository) {
        this.flashcardRepository = flashcardRepository;
    }

    public List&lt;Flashcard&gt; findAll() {
        return flashcardRepository.findAll();
    }

    public Flashcard findById(Long id) {
        return flashcardRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException(
                "Flashcard not found with id: " + id));
    }

    public List&lt;Flashcard&gt; findByCategory(String category) {
        return flashcardRepository.findByCategory(category);
    }

    public List&lt;Flashcard&gt; findByDifficulty(String difficulty) {
        return flashcardRepository.findByDifficulty(difficulty);
    }

    public Flashcard create(FlashcardRequest request) {
        Flashcard flashcard = new Flashcard(
            request.getQuestion(), request.getAnswer(),
            request.getCategory(), request.getDifficulty());
        return flashcardRepository.save(flashcard);
    }

    public Flashcard update(Long id, FlashcardRequest request) {
        Flashcard flashcard = findById(id);
        flashcard.setQuestion(request.getQuestion());
        flashcard.setAnswer(request.getAnswer());
        flashcard.setCategory(request.getCategory());
        flashcard.setDifficulty(request.getDifficulty());
        return flashcardRepository.save(flashcard);
    }

    public void delete(Long id) {
        if (!flashcardRepository.existsById(id)) {
            throw new IllegalArgumentException(
                "Flashcard not found with id: " + id);
        }
        flashcardRepository.deleteById(id);
    }
}</code></pre><p>📌 El QuizService sigue exactamente el mismo patrón. Cambia <code>Flashcard</code> por <code>Quiz</code> y <code>FlashcardRequest</code> por <code>QuizRequest</code>. No lo repito aquí para no duplicar.</p>`,
      },
      {
        title: `9. FlashcardController.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/controller/FlashcardController.java</code></p><pre><code>package com.dojo.content.controller;

import com.dojo.content.dto.FlashcardRequest;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.service.FlashcardService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/flashcards")
public class FlashcardController {

    private final FlashcardService flashcardService;

    public FlashcardController(FlashcardService flashcardService) {
        this.flashcardService = flashcardService;
    }

    // GET /flashcards
    // GET /flashcards?category=REST_API
    // GET /flashcards?difficulty=BLANCO
    @GetMapping
    public ResponseEntity&lt;List&lt;Flashcard&gt;&gt; getAll(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String difficulty) {
        List&lt;Flashcard&gt; flashcards;
        if (category != null) {
            flashcards = flashcardService.findByCategory(category);
        } else if (difficulty != null) {
            flashcards = flashcardService.findByDifficulty(difficulty);
        } else {
            flashcards = flashcardService.findAll();
        }
        return ResponseEntity.ok(flashcards);
    }

    // GET /flashcards/5
    @GetMapping("/{id}")
    public ResponseEntity&lt;Flashcard&gt; getById(@PathVariable Long id) {
        return ResponseEntity.ok(flashcardService.findById(id));
    }

    // POST /flashcards
    @PostMapping
    public ResponseEntity&lt;Flashcard&gt; create(
            @Valid @RequestBody FlashcardRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(flashcardService.create(request));
    }

    // PUT /flashcards/5
    @PutMapping("/{id}")
    public ResponseEntity&lt;Flashcard&gt; update(
            @PathVariable Long id,
            @Valid @RequestBody FlashcardRequest request) {
        return ResponseEntity.ok(flashcardService.update(id, request));
    }

    // DELETE /flashcards/5
    @DeleteMapping("/{id}")
    public ResponseEntity&lt;Void&gt; delete(@PathVariable Long id) {
        flashcardService.delete(id);
        return ResponseEntity.noContent().build();  // 204
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity&lt;Map&lt;String, String&gt;&gt; handleNotFound(
            IllegalArgumentException e) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(Map.of("error", e.getMessage()));
    }
}</code></pre><p><b>Esto es un CRUD completo</b> (Create, Read, Update, Delete):</p><table class='table table-sm table-dark'><thead><tr><th>Método HTTP</th><th>URL</th><th>Acción</th><th>Código resp.</th></tr></thead><tbody><tr><td>GET</td><td>/flashcards</td><td>Listar todas (con filtros opcionales)</td><td>200</td></tr><tr><td>GET</td><td>/flashcards/5</td><td>Obtener una por ID</td><td>200 / 404</td></tr><tr><td>POST</td><td>/flashcards</td><td>Crear nueva</td><td>201</td></tr><tr><td>PUT</td><td>/flashcards/5</td><td>Actualizar existente</td><td>200 / 404</td></tr><tr><td>DELETE</td><td>/flashcards/5</td><td>Eliminar</td><td>204 / 404</td></tr></tbody></table>`,
      },
      {
        title: `10. DataSeeder: cargar datos iniciales`,
        content: `<p>Necesitamos flashcards y quizzes desde el primer arranque. El <code>DataSeeder</code> los crea automáticamente:</p><p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/config/DataSeeder.java</code></p><pre><code>package com.dojo.content.config;

import com.dojo.content.entity.Flashcard;
import com.dojo.content.entity.Quiz;
import com.dojo.content.repository.FlashcardRepository;
import com.dojo.content.repository.QuizRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.List;

@Configuration
public class DataSeeder {

    @Bean
    CommandLineRunner seedFlashcards(FlashcardRepository repo) {
        return args -> {
            if (repo.count() == 0) {  // Solo si no hay datos
                repo.saveAll(List.of(
                    new Flashcard(
                        "¿Qué hace @SpringBootApplication?",
                        "Combina @Configuration, @EnableAutoConfiguration "
                        + "y @ComponentScan. Marca la clase principal.",
                        "FUNDAMENTOS", "BLANCO"),
                    new Flashcard(
                        "¿Qué es la Inyección de Dependencias?",
                        "Patrón donde los objetos reciben sus dependencias "
                        + "desde fuera en vez de crearlas ellos.",
                        "FUNDAMENTOS", "BLANCO")
                    // ... más flashcards por cinturón
                ));
            }
        };
    }

    @Bean
    CommandLineRunner seedQuizzes(QuizRepository repo) {
        return args -> {
            if (repo.count() == 0) {
                repo.saveAll(List.of(
                    new Quiz(
                        "¿Qué anotación marca la clase principal?",
                        "@SpringBootApplication",  // A ✓
                        "@MainClass",              // B
                        "@StartApplication",       // C
                        "@RunApplication",         // D
                        0,  // Respuesta correcta: A (índice 0)
                        "FUNDAMENTOS", "BLANCO")
                    // ... más quizzes por cinturón
                ));
            }
        };
    }
}</code></pre><p><b>¿Cómo funciona?</b></p><ul><li><code>CommandLineRunner</code> — Interfaz que Spring ejecuta automáticamente al arrancar la app</li><li><code>repo.count() == 0</code> — Solo carga datos si la tabla está vacía (evita duplicados)</li><li>El archivo real del proyecto tiene 530+ líneas con flashcards y quizzes organizados por cinturón (BLANCO, AMARILLO, NARANJA, VERDE, MARRÓN, NEGRO)</li></ul><p>💡 <b>Consejo</b>: Los datos se pierden al reiniciar porque H2 es en memoria. El DataSeeder los recrea cada vez. En producción usarías migraciones Flyway/Liquibase.</p>`,
      },
      {
        title: `11. application.yml`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/resources/application.yml</code></p><pre><code>server:
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
  h2:
    console:
      enabled: true

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/</code></pre><p>Prácticamente igual que auth-service pero sin las propiedades JWT (no las necesita) y con su propia base de datos (<code>contentdb</code> vs <code>authdb</code>). Puerto: <b>8083</b>.</p>`,
      },
      {
        title: `12. Arrancar y probar`,
        content: `<p>Con Eureka corriendo:</p><pre><code>cd content-service && mvn spring-boot:run</code></pre><p>Prueba los endpoints directamente (sin Gateway por ahora):</p><pre><code># Todas las flashcards
curl -s http://localhost:8083/flashcards | jq

# Solo las del cinturón blanco
curl -s 'http://localhost:8083/flashcards?difficulty=BLANCO' | jq

# Todos los quizzes
curl -s http://localhost:8083/quizzes | jq

# Crear una flashcard nueva
curl -s -X POST http://localhost:8083/flashcards \\
  -H 'Content-Type: application/json' \\
  -d '{"question":"¿Qué es REST?",
       "answer":"Arquitectura para APIs web",
       "category":"REST_API",
       "difficulty":"AMARILLO"}' | jq</code></pre><p>📌 <code>| jq</code> formatea el JSON en la terminal. Si no tienes jq instalado: <code>sudo dnf install jq</code> (Fedora) o <code>sudo apt install jq</code> (Ubuntu).</p><p>Verifica en Eureka (<a href='http://localhost:8761'>localhost:8761</a>) que aparece <code>CONTENT-SERVICE</code>.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td><code>Column 'QUESTION' not found</code> o errores de mapeo</td><td>Los nombres de campos en la Entity no coinciden con lo que espera H2</td><td>Revisa que <code>ddl-auto: create-drop</code> esté activo — recrea las tablas al arrancar</td></tr><tr><td><code>DataSeeder</code> no carga datos</td><td>La condición <code>count() == 0</code> no se cumple o hay error en los datos</td><td>Revisa la consola por excepciones. Abre H2 console y haz <code>SELECT COUNT(*) FROM FLASHCARDS</code></td></tr><tr><td>Respuestas vacías <code>[]</code></td><td>Los datos no se cargaron</td><td>Comprueba que el DataSeeder se ejecuta (pon un <code>System.out.println</code> dentro del runner)</td></tr><tr><td><code>@RequestMapping</code> no incluye <code>/api/</code></td><td>En content-service las rutas son <code>/flashcards</code>, <code>/quizzes</code> sin prefijo. El Gateway añade el prefijo</td><td>Es correcto así. Al probar directamente: <code>localhost:8083/flashcards</code>. Vía Gateway: <code>localhost:8080/api/content/flashcards</code></td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>CRUD</b> — Create (POST), Read (GET), Update (PUT), Delete (DELETE). Las 4 operaciones básicas de cualquier API</li><li><b>DTO vs Entity</b> — Entity = mapeo de BD, puede tener campos sensibles. DTO = lo que expones en la API. Nunca exponer la Entity directamente (aunque en proyectos pequeños se hace)</li><li><b>@RequestParam vs @PathVariable</b> — <code>/flashcards?difficulty=BLANCO</code> (RequestParam) vs <code>/flashcards/5</code> (PathVariable). RequestParam para filtrar, PathVariable para identificar</li><li><b>CommandLineRunner</b> — Se ejecuta al arrancar. Útil para seed data, migraciones, o tareas de inicio</li><li><b>ResponseEntity</b> — Permite controlar el código HTTP de respuesta (200, 201, 204, 404...)</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>content-service</code> creado</li><li>☐ Entidades: Flashcard.java, Quiz.java</li><li>☐ Repositories: FlashcardRepository, QuizRepository</li><li>☐ Services: FlashcardService, QuizService</li><li>☐ Controllers: FlashcardController, QuizController</li><li>☐ DataSeeder carga flashcards y quizzes al arrancar</li><li>☐ <code>curl localhost:8083/flashcards</code> devuelve datos</li><li>☐ Aparece en Eureka como CONTENT-SERVICE</li><li>☐ Commit: <code>git commit -m "Add content-service with flashcards and quizzes"</code></li></ul><p>¡Content Service listo! 📚 Ahora vamos con el <b>API Gateway</b> — el que conecta todo. 🔌</p>`,
      },
    ],
  },
  {
    id: 6,
    title: "API Gateway",
    intro: `El API Gateway es el punto de entrada único a toda la arquitectura. Los clientes (frontend, apps) solo hablan con el Gateway en el puerto 8080, y este redirige las peticiones al servicio correcto consultando Eureka. Además, valida los tokens JWT antes de dejar pasar las peticiones. Es como la recepción de un hotel con control de acceso: verificas tu identidad y te conectan con quien necesites.`,
    sections: [
      {
        title: `1. ¿Qué hace el API Gateway?`,
        content: `<p>El Gateway tiene <b>tres funciones principales</b>:</p><ol><li><b>Routing</b> — Redirige peticiones al servicio correcto según la URL:<br><code>/api/auth/**</code> → auth-service<br><code>/api/content/**</code> → content-service<br><code>/api/progress/**</code> → progress-service</li><li><b>Seguridad</b> — Valida el token JWT en las peticiones. Si no hay token o es inválido, devuelve 401</li><li><b>Descubrimiento</b> — No necesita saber IPs. Pregunta a Eureka: "¿Dónde está content-service?" y Eureka le dice</li></ol><pre><code>Cliente → Gateway (:8080) → Eureka: ¿dónde está auth-service?
                                   → Eureka: está en localhost:8081
                          → auth-service (:8081)
                          ← respuesta
       ← respuesta al cliente</code></pre>`,
      },
      {
        title: `2. Crear el proyecto api-gateway`,
        content: `<p><b>Spring Initializr</b> con estas dependencias:</p><table class='table table-sm table-dark'><thead><tr><th>Dependencia</th><th>Para qué</th></tr></thead><tbody><tr><td><b>Gateway</b> (Spring Cloud Routing)</td><td>El core del Gateway — routing, filtros, predicates</td></tr><tr><td><b>Eureka Discovery Client</b></td><td>Buscar servicios en Eureka (<code>lb://</code>)</td></tr></tbody></table><p>⚠️ <b>Importante</b>: JJWT se añade manualmente al pom.xml (igual que en auth-service).</p><p>⚠️⚠️ <b>MUY IMPORTANTE</b>: NO añadas <code>spring-boot-starter-web</code>. El Gateway usa <b>WebFlux</b> (reactivo, no bloqueante). Si añades starter-web, da un conflicto de classpath y no arranca. Spring Cloud Gateway es incompatible con Spring MVC.</p>`,
      },
      {
        title: `3. pom.xml completo`,
        content: `<p><b>Ruta</b>: <code>api-gateway/pom.xml</code></p><pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project ...&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

    &lt;parent&gt;
        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
        &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;
        &lt;version&gt;3.2.0&lt;/version&gt;
        &lt;relativePath/&gt;
    &lt;/parent&gt;

    &lt;groupId&gt;com.dojo&lt;/groupId&gt;
    &lt;artifactId&gt;api-gateway&lt;/artifactId&gt;
    &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;

    &lt;properties&gt;
        &lt;java.version&gt;17&lt;/java.version&gt;
        &lt;spring-cloud.version&gt;2023.0.0&lt;/spring-cloud.version&gt;
        &lt;jjwt.version&gt;0.12.3&lt;/jjwt.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;!-- Spring Cloud Gateway (NO spring-boot-starter-web!) --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-cloud-starter-gateway&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- Eureka Client --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-cloud-starter-netflix-eureka-client&lt;/artifactId&gt;
        &lt;/dependency&gt;

        &lt;!-- JWT (para validar tokens en el filtro) --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-api&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-impl&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
            &lt;scope&gt;runtime&lt;/scope&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;io.jsonwebtoken&lt;/groupId&gt;
            &lt;artifactId&gt;jjwt-jackson&lt;/artifactId&gt;
            &lt;version&gt;\${jjwt.version}&lt;/version&gt;
            &lt;scope&gt;runtime&lt;/scope&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;

    &lt;dependencyManagement&gt;
        &lt;dependencies&gt;
            &lt;dependency&gt;
                &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
                &lt;artifactId&gt;spring-cloud-dependencies&lt;/artifactId&gt;
                &lt;version&gt;\${spring-cloud.version}&lt;/version&gt;
                &lt;type&gt;pom&lt;/type&gt;
                &lt;scope&gt;import&lt;/scope&gt;
            &lt;/dependency&gt;
        &lt;/dependencies&gt;
    &lt;/dependencyManagement&gt;

    &lt;build&gt;
        &lt;plugins&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
                &lt;artifactId&gt;spring-boot-maven-plugin&lt;/artifactId&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
&lt;/project&gt;</code></pre><p>Fíjate: solo 3 dependencias + JJWT. Es el servicio más ligero en código pero el más crítico en configuración.</p>`,
      },
      {
        title: `4. Estructura de carpetas`,
        content: `<pre><code>com.dojo.gateway/
├── ApiGatewayApplication.java
└── filter/
    └── JwtAuthFilter.java        ← El filtro de seguridad</code></pre><p>¡Solo 2 archivos Java! Toda la magia está en el <code>application.yml</code> (rutas) y el filtro JWT.</p>`,
      },
      {
        title: `5. Clase principal`,
        content: `<p><b>Ruta</b>: <code>api-gateway/src/main/java/com/dojo/gateway/ApiGatewayApplication.java</code></p><pre><code>package com.dojo.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ApiGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApiGatewayApplication.class, args);
    }
}</code></pre><p>Igual que los demás servicios — <code>@EnableDiscoveryClient</code> para registrarse en Eureka.</p>`,
      },
      {
        title: `6. El filtro JWT (filter/JwtAuthFilter.java)`,
        content: `<p>Este es el archivo más importante del Gateway. Intercepta cada petición y valida el token:</p><p><b>Ruta</b>: <code>api-gateway/src/main/java/com/dojo/gateway/filter/JwtAuthFilter.java</code></p><pre><code>package com.dojo.gateway.filter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory
        .AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;

@Component
public class JwtAuthFilter extends
        AbstractGatewayFilterFactory&lt;JwtAuthFilter.Config&gt; {

    private final SecretKey key;

    public JwtAuthFilter(@Value("\${jwt.secret}") String secret) {
        super(Config.class);
        this.key = Keys.hmacShaKeyFor(
            secret.getBytes(StandardCharsets.UTF_8));
    }

    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {

            // 1. Buscar el header Authorization
            String authHeader = exchange.getRequest()
                .getHeaders().getFirst(HttpHeaders.AUTHORIZATION);

            // 2. Si no hay token → 401 Unauthorized
            if (authHeader == null
                    || !authHeader.startsWith("Bearer ")) {
                exchange.getResponse()
                    .setStatusCode(HttpStatus.UNAUTHORIZED);
                return exchange.getResponse().setComplete();
            }

            // 3. Extraer el token (quitar "Bearer ")
            String token = authHeader.substring(7);

            try {
                // 4. Validar y parsear el token
                Claims claims = Jwts.parser()
                    .verifyWith(key)
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();

                // 5. Añadir datos del usuario como headers
                //    para que los servicios los lean
                ServerHttpRequest mutatedRequest = exchange
                    .getRequest().mutate()
                    .header("X-User-Username",
                        claims.getSubject())
                    .header("X-User-Role",
                        claims.get("role", String.class))
                    .build();

                // 6. Continuar con la petición modificada
                return chain.filter(
                    exchange.mutate()
                        .request(mutatedRequest).build());

            } catch (Exception e) {
                // 7. Token inválido o expirado → 401
                exchange.getResponse()
                    .setStatusCode(HttpStatus.UNAUTHORIZED);
                return exchange.getResponse().setComplete();
            }
        };
    }

    // Clase de configuración (vacía, pero necesaria)
    public static class Config {}
}</code></pre><p><b>Flujo paso a paso:</b></p><ol><li>Llega una petición al Gateway (ej: <code>GET /api/content/flashcards</code>)</li><li>El filtro busca el header <code>Authorization: Bearer eyJhbGci...</code></li><li>Si no hay header → 401 inmediato</li><li>Extrae el token y lo valida con la <b>misma clave secreta</b> que usó Auth Service para firmarlo</li><li>Si es válido, extrae el username y role del token y los añade como headers <code>X-User-*</code></li><li>La petición continúa hacia el servicio destino, que puede leer esos headers</li><li>Si el token es inválido o expirado → 401</li></ol><p>📌 <b>¿Por qué <code>AbstractGatewayFilterFactory</code> y no <code>GlobalFilter</code>?</b></p><p>Porque así podemos aplicar el filtro <b>solo a las rutas que lo necesiten</b>. Las rutas de auth (login, register) NO llevan filtro JWT — si no, no podrías loguearte sin estar logueado.</p>`,
      },
      {
        title: `7. application.yml — Las rutas`,
        content: `<p><b>Ruta</b>: <code>api-gateway/src/main/resources/application.yml</code></p><pre><code>server:
  port: 8080

spring:
  application:
    name: api-gateway
  cloud:
    gateway:
      routes:
        # Auth Service — SIN filtro JWT (rutas públicas)
        - id: auth-service
          uri: lb://auth-service
          predicates:
            - Path=/api/auth/**
          filters:
            - StripPrefix=1

        # Content Service — CON filtro JWT
        - id: content-service
          uri: lb://content-service
          predicates:
            - Path=/api/content/**
          filters:
            - StripPrefix=2
            - JwtAuthFilter

        # Exercises — CON filtro JWT
        - id: exercises-service
          uri: lb://content-service
          predicates:
            - Path=/api/exercises/**
          filters:
            - StripPrefix=1
            - JwtAuthFilter

        # Progress Service — CON filtro JWT
        - id: progress-service
          uri: lb://progress-service
          predicates:
            - Path=/api/progress/**
          filters:
            - StripPrefix=1
            - JwtAuthFilter

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/

jwt:
  secret: dojo-secret-key-that-is-at-least-256-bits-long-for-hs256-algorithm-security</code></pre><p><b>Desglose de cada ruta:</b></p><table class='table table-sm table-dark'><thead><tr><th>Petición al Gateway</th><th>StripPrefix</th><th>Llega al servicio como</th><th>JWT</th></tr></thead><tbody><tr><td><code>/api/auth/login</code></td><td>1 (quita <code>/api</code>)</td><td><code>/auth/login</code></td><td>❌ No</td></tr><tr><td><code>/api/content/flashcards</code></td><td>2 (quita <code>/api/content</code>)</td><td><code>/flashcards</code></td><td>✅ Sí</td></tr><tr><td><code>/api/exercises/1</code></td><td>1 (quita <code>/api</code>)</td><td><code>/exercises/1</code></td><td>✅ Sí</td></tr><tr><td><code>/api/progress/berto</code></td><td>1 (quita <code>/api</code>)</td><td><code>/progress/berto</code></td><td>✅ Sí</td></tr></tbody></table><p><b>Conceptos clave:</b></p><ul><li><code>lb://auth-service</code> — <b>Load Balanced</b> via Eureka. El Gateway pregunta a Eureka la IP real del servicio</li><li><code>predicates</code> — Condiciones para que la ruta aplique. <code>Path=/api/auth/**</code> = cualquier URL que empiece por /api/auth/</li><li><code>StripPrefix=1</code> — Quita N segmentos del path antes de enviar al servicio. <code>/api/auth/login</code> con StripPrefix=1 → <code>/auth/login</code></li><li><code>JwtAuthFilter</code> — Nuestro filtro. Se referencia por el nombre de la clase (sin el sufijo "GatewayFilterFactory")</li></ul><p>📌 <b>La clave JWT DEBE ser la misma</b> que en auth-service. Si no, Auth genera tokens que el Gateway no puede validar.</p>`,
      },
      {
        title: `8. Arrancar y probar`,
        content: `<p>Necesitas <b>Eureka + Auth + Content</b> corriendo antes de probar el Gateway:</p><pre><code># Si no están corriendo:
cd eureka-server && mvn spring-boot:run &
cd auth-service && mvn spring-boot:run &
cd content-service && mvn spring-boot:run &

# Ahora el Gateway:
cd api-gateway && mvn spring-boot:run</code></pre><p><b>Probar el flujo completo a través del Gateway:</b></p><pre><code># 1. Registrarse (va a auth-service, SIN token)
curl -s -X POST http://localhost:8080/api/auth/register \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto","email":"berto@test.com",
       "password":"123456"}' | jq

# 2. Login (guarda el token)
TOKEN=\$(curl -s -X POST http://localhost:8080/api/auth/login \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto","password":"123456"}' \\
  | jq -r '.token')

echo \$TOKEN  # Debería mostrar eyJhbGci...

# 3. Pedir flashcards CON token (va a content-service)
curl -s http://localhost:8080/api/content/flashcards \\
  -H "Authorization: Bearer \$TOKEN" | jq

# 4. Pedir SIN token → 401 Unauthorized
curl -s http://localhost:8080/api/content/flashcards
# (respuesta vacía = 401)</code></pre><p>Si el paso 3 devuelve flashcards y el paso 4 devuelve vacío/401, <b>¡el Gateway y el filtro JWT funcionan correctamente!</b> 🎉</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td><code>Spring MVC found on classpath</code> + error de arranque</td><td>Tienes <code>spring-boot-starter-web</code> en el pom</td><td><b>Quítalo</b>. El Gateway usa WebFlux, no MVC. Son incompatibles</td></tr><tr><td><code>503 Service Unavailable</code></td><td>El servicio destino no está registrado en Eureka</td><td>Verifica en <a href='http://localhost:8761'>Eureka dashboard</a> que el servicio aparece</td></tr><tr><td><code>404 Not Found</code> en rutas que deberían funcionar</td><td>El <code>StripPrefix</code> no es correcto — el servicio recibe una URL diferente a la esperada</td><td>Revisa la tabla de rutas. Prueba el servicio directamente (sin Gateway) para confirmar la URL real</td></tr><tr><td><code>401</code> en rutas de auth (login/register)</td><td>El filtro JWT se está aplicando a las rutas de auth</td><td>Las rutas de auth NO deben tener el filtro <code>JwtAuthFilter</code> en sus filters</td></tr><tr><td>Token válido en auth pero 401 en Gateway</td><td>Las claves JWT (<code>jwt.secret</code>) son diferentes</td><td>Copia exactamente la misma clave en el application.yml de auth-service y api-gateway</td></tr><tr><td><code>No qualifying bean of type JwtAuthFilter</code></td><td>El filtro no se detecta como componente</td><td>Verifica que tiene <code>@Component</code> y que está en un paquete que Spring escanea</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>API Gateway pattern</b> — Punto de entrada único para microservicios. Centraliza routing, seguridad, rate limiting, logging</li><li><b>Spring Cloud Gateway vs Zuul</b> — Gateway es reactivo (WebFlux, no bloqueante), Zuul es bloqueante (deprecated). Gateway es el estándar actual de Spring Cloud</li><li><b>WebFlux vs MVC</b> — MVC es el modelo clásico (un thread por petición). WebFlux es reactivo (pocos threads, muchas peticiones asíncronas). El Gateway usa WebFlux porque es un proxy: recibe muchas peticiones y las redirige</li><li><b>StripPrefix</b> — Los clientes usan URLs con prefijo (<code>/api/auth/login</code>) pero los servicios internos no saben de ese prefijo (<code>/auth/login</code>). StripPrefix hace la traducción</li><li><b>GatewayFilterFactory vs GlobalFilter</b> — Factory = filtro configurable por ruta. GlobalFilter = se aplica a todas las rutas</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>api-gateway</code> creado (SIN spring-boot-starter-web)</li><li>☐ JwtAuthFilter.java implementado</li><li>☐ application.yml con rutas a auth, content, exercises, progress</li><li>☐ <b>Misma clave JWT</b> que en auth-service</li><li>☐ Login vía Gateway funciona (<code>/api/auth/login</code>)</li><li>☐ Flashcards vía Gateway con token funciona (<code>/api/content/flashcards</code>)</li><li>☐ Sin token → 401</li><li>☐ Aparece en Eureka como API-GATEWAY</li><li>☐ Commit: <code>git commit -m "Add api-gateway with JWT filter"</code></li></ul><p>¡La infraestructura está completa! 🏗️ Eureka + Auth + Content + Gateway funcionando. Ahora toca darle cara: el <b>Frontend con Thymeleaf</b>. 🎨</p>`,
      },
    ],
  },
  {
    id: 7,
    title: "Frontend Base (Thymeleaf + Bootstrap)",
    intro: `Ahora le damos cara a la aplicación. El frontend usa Thymeleaf (motor de plantillas de Spring) + Bootstrap 5. No necesitas React ni Angular — Thymeleaf renderiza HTML en el servidor y lo envía al navegador. En este capítulo montamos la estructura base: layout compartido, login, registro y la conexión con el Gateway.`,
    sections: [
      {
        title: `1. ¿Cómo funciona el Frontend?`,
        content: `<p>A diferencia del resto de servicios (que son APIs REST que devuelven JSON), el frontend <b>devuelve HTML</b>. El flujo es:</p><ol><li>Usuario abre <code>http://localhost:8090</code> → ve la página de login</li><li>Rellena usuario + contraseña → el frontend <b>llama al Gateway</b> (<code>:8080/api/auth/login</code>)</li><li>Gateway → Auth Service → valida → devuelve JWT</li><li>El frontend guarda el JWT en la <b>sesión HTTP</b> del servidor</li><li>Para ver flashcards → frontend llama al Gateway <b>con el JWT en el header</b></li><li>Recibe el JSON → lo renderiza en HTML con Thymeleaf → envía al navegador</li></ol><pre><code>Browser ←HTML→ Frontend (:8090) ←JSON→ Gateway (:8080) ←→ Services
                  │
         Sesión HTTP (guarda JWT)
         Thymeleaf (renderiza HTML)</code></pre><p>📌 El frontend es un <b>@Controller</b> (no @RestController). Devuelve nombres de templates HTML en vez de JSON.</p>`,
      },
      {
        title: `2. Crear el proyecto dojo-frontend`,
        content: `<p><b>Spring Initializr</b> con:</p><table class='table table-sm table-dark'><thead><tr><th>Dependencia</th><th>Para qué</th></tr></thead><tbody><tr><td><b>Spring Web</b></td><td>Controllers, MVC, servir páginas</td></tr><tr><td><b>Thymeleaf</b></td><td>Motor de plantillas HTML</td></tr><tr><td><b>Eureka Discovery Client</b></td><td>Registrarse en Eureka</td></tr></tbody></table><p>No necesita JPA, H2, ni Security — es solo un cliente web que consume APIs.</p>`,
      },
      {
        title: `3. pom.xml completo`,
        content: `<p><b>Ruta</b>: <code>dojo-frontend/pom.xml</code></p><pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project ...&gt;
    &lt;parent&gt;
        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
        &lt;artifactId&gt;spring-boot-starter-parent&lt;/artifactId&gt;
        &lt;version&gt;3.2.0&lt;/version&gt;
        &lt;relativePath/&gt;
    &lt;/parent&gt;

    &lt;groupId&gt;com.dojo&lt;/groupId&gt;
    &lt;artifactId&gt;dojo-frontend&lt;/artifactId&gt;
    &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;

    &lt;properties&gt;
        &lt;java.version&gt;17&lt;/java.version&gt;
        &lt;spring-cloud.version&gt;2023.0.0&lt;/spring-cloud.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-web&lt;/artifactId&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;
            &lt;artifactId&gt;spring-boot-starter-thymeleaf&lt;/artifactId&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-cloud-starter-netflix-eureka-client&lt;/artifactId&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;

    &lt;!-- dependencyManagement con spring-cloud-dependencies --&gt;
    &lt;!-- build con spring-boot-maven-plugin --&gt;
&lt;/project&gt;</code></pre><p>El más ligero de todos: web + thymeleaf + eureka. Sin base de datos, sin security.</p>`,
      },
      {
        title: `4. Estructura de carpetas`,
        content: `<pre><code>dojo-frontend/
├── src/main/java/com/dojo/frontend/
│   ├── DojoFrontendApplication.java
│   ├── config/
│   │   └── AppConfig.java          ← Bean RestTemplate
│   ├── controller/
│   │   └── AuthController.java      ← Login, Register, Logout
│   └── dto/
│       ├── LoginRequest.java
│       ├── RegisterRequest.java
│       └── AuthResponse.java
│
├── src/main/resources/
│   ├── application.yml
│   ├── templates/                    ← HTMLs de Thymeleaf
│   │   ├── fragments/
│   │   │   └── layout.html           ← Head + Navbar + Footer compartidos
│   │   ├── login.html
│   │   └── register.html
│   └── static/css/
│       └── style.css                  ← Estilos personalizados
└── pom.xml</code></pre><p>📌 Thymeleaf busca los templates en <code>src/main/resources/templates/</code> automáticamente. Los archivos estáticos (CSS, JS, imágenes) van en <code>src/main/resources/static/</code>.</p>`,
      },
      {
        title: `5. application.yml`,
        content: `<p><b>Ruta</b>: <code>dojo-frontend/src/main/resources/application.yml</code></p><pre><code>server:
  port: 8090

spring:
  application:
    name: dojo-frontend
  thymeleaf:
    cache: false   # Desactivar caché en desarrollo
                   # (cambias el HTML y se ve al refrescar)

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/

gateway:
  url: http://localhost:8080   # URL del Gateway</code></pre><p><code>gateway.url</code> es una propiedad personalizada nuestra. No es de Spring — la leemos con <code>@Value("\${gateway.url}")</code> en los controllers para saber dónde llamar al Gateway.</p>`,
      },
      {
        title: `6. AppConfig.java (RestTemplate)`,
        content: `<p><b>Ruta</b>: <code>.../config/AppConfig.java</code></p><pre><code>package com.dojo.frontend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}</code></pre><p><b>RestTemplate</b> es el cliente HTTP de Spring para hacer llamadas a otros servicios. Es como un <code>curl</code> desde Java:</p><ul><li><code>restTemplate.postForEntity(url, body, ResponseType.class)</code> → POST</li><li><code>restTemplate.exchange(url, GET, headers, ResponseType.class)</code> → GET con headers</li></ul><p>Lo declaramos como <code>@Bean</code> para inyectarlo en cualquier controller.</p><p>📌 En Spring Boot 3, <code>RestTemplate</code> sigue funcionando pero hay una alternativa más moderna: <code>WebClient</code> (reactivo). Para este proyecto, RestTemplate es más que suficiente y más fácil de entender.</p>`,
      },
      {
        title: `7. DTOs del frontend`,
        content: `<p>El frontend necesita sus propios DTOs para comunicarse con el Gateway:</p><p><b>LoginRequest.java</b>:</p><pre><code>package com.dojo.frontend.dto;

public class LoginRequest {
    private String username;
    private String password;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}</code></pre><p><b>RegisterRequest.java</b>: Igual pero con campo <code>email</code> adicional.</p><p><b>AuthResponse.java</b>:</p><pre><code>package com.dojo.frontend.dto;

public class AuthResponse {
    private String token;
    private String username;
    private String role;

    // Getters y setters
}</code></pre><p>📌 Estos DTOs NO llevan <code>@NotBlank</code> ni validaciones — la validación la hace Auth Service. El frontend solo envía datos y recibe respuestas.</p>`,
      },
      {
        title: `8. AuthController del frontend`,
        content: `<p><b>Ruta</b>: <code>.../controller/AuthController.java</code></p><p>⚠️ Este es un <code>@Controller</code> (no @RestController) — devuelve nombres de templates HTML.</p><pre><code>package com.dojo.frontend.controller;

import com.dojo.frontend.dto.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
public class AuthController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public AuthController(RestTemplate restTemplate,
            @Value("\${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";  // → templates/login.html
    }

    @PostMapping("/login")
    public String login(@ModelAttribute LoginRequest loginRequest,
                       HttpSession session, Model model) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity&lt;LoginRequest&gt; entity =
                new HttpEntity&lt;&gt;(loginRequest, headers);

            // Llamar al Gateway → Auth Service
            ResponseEntity&lt;AuthResponse&gt; response =
                restTemplate.postForEntity(
                    gatewayUrl + "/api/auth/login",
                    entity, AuthResponse.class);

            // Guardar token en sesión HTTP
            AuthResponse auth = response.getBody();
            if (auth != null) {
                session.setAttribute("token", auth.getToken());
                session.setAttribute("username", auth.getUsername());
                session.setAttribute("role", auth.getRole());
            }
            return "redirect:/dashboard";

        } catch (HttpClientErrorException e) {
            model.addAttribute("error",
                "Invalid username or password");
            model.addAttribute("loginRequest", loginRequest);
            return "login";
        } catch (Exception e) {
            model.addAttribute("error",
                "Service unavailable. Please try again later.");
            model.addAttribute("loginRequest", loginRequest);
            return "login";
        }
    }

    // Register: mismo patrón que login
    // Logout: session.invalidate() + redirect a /login
    // GET /: redirect a /login
}</code></pre><p><b>Conceptos clave:</b></p><ul><li><code>@Controller</code> vs <code>@RestController</code> — Controller devuelve el <b>nombre del template</b> (<code>"login"</code> → <code>templates/login.html</code>). RestController devuelve datos JSON</li><li><code>Model model</code> — Objeto que pasa datos del controller al template. <code>model.addAttribute("error", "msg")</code> → en HTML: <code>th:text="\${error}"</code></li><li><code>HttpSession</code> — Sesión del servidor. Guarda el JWT para usarlo en peticiones futuras</li><li><code>@ModelAttribute</code> — Mapea los campos del formulario HTML al DTO de Java</li><li><code>"redirect:/dashboard"</code> — Redirige al navegador (cambia la URL)</li></ul>`,
      },
      {
        title: `9. Layout compartido (fragments/layout.html)`,
        content: `<p>Thymeleaf permite definir <b>fragmentos</b> reutilizables. Así no repites el head, navbar y footer en cada página:</p><p><b>Ruta</b>: <code>templates/fragments/layout.html</code></p><pre><code>&lt;!DOCTYPE html&gt;
&lt;html xmlns:th="http://www.thymeleaf.org"&gt;

&lt;!-- HEAD compartido --&gt;
&lt;head th:fragment="head(title)"&gt;
    &lt;meta charset="UTF-8"&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;
    &lt;title th:text="\${title}"&gt;Spring Boot Dojo&lt;/title&gt;
    &lt;link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"&gt;
    &lt;link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"
          rel="stylesheet"&gt;
    &lt;link th:href="@{/css/style.css}" rel="stylesheet"&gt;
&lt;/head&gt;

&lt;!-- NAVBAR --&gt;
&lt;nav th:fragment="navbar"
     class="navbar navbar-expand-lg navbar-dark bg-dark"&gt;
    &lt;div class="container"&gt;
        &lt;a class="navbar-brand" href="/dashboard"&gt;
            &lt;i class="bi bi-fire"&gt;&lt;/i&gt; Spring Boot Dojo
        &lt;/a&gt;
        &lt;div class="navbar-nav ms-auto"
             th:if="\${session.username != null}"&gt;
            &lt;a class="nav-link" href="/dashboard"&gt;Dashboard&lt;/a&gt;
            &lt;a class="nav-link" href="/exercises"&gt;Ejercicios&lt;/a&gt;
            &lt;a class="nav-link" href="/guia"&gt;Guía&lt;/a&gt;
            &lt;span class="navbar-text mx-3"
                  th:text="\${session.username}"&gt;User&lt;/span&gt;
            &lt;a class="nav-link" href="/logout"&gt;Logout&lt;/a&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/nav&gt;

&lt;!-- FOOTER (scripts) --&gt;
&lt;footer th:fragment="footer"&gt;
    &lt;script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"&gt;&lt;/script&gt;
&lt;/footer&gt;
&lt;/html&gt;</code></pre><p><b>Cómo se usa en otras páginas:</b></p><pre><code>&lt;!-- Incluir el head --&gt;
&lt;head th:replace="~{fragments/layout :: head('Mi Título')}"&gt;&lt;/head&gt;

&lt;!-- Incluir la navbar --&gt;
&lt;nav th:replace="~{fragments/layout :: navbar}"&gt;&lt;/nav&gt;

&lt;!-- Incluir el footer --&gt;
&lt;div th:replace="~{fragments/layout :: footer}"&gt;&lt;/div&gt;</code></pre><p>Así todas las páginas tienen el mismo head (Bootstrap CSS + icons), navbar y scripts de Bootstrap.</p>`,
      },
      {
        title: `10. Página de Login (templates/login.html)`,
        content: `<p><b>Ruta</b>: <code>templates/login.html</code></p><pre><code>&lt;!DOCTYPE html&gt;
&lt;html xmlns:th="http://www.thymeleaf.org"&gt;
&lt;head th:replace="~{fragments/layout :: head('Login - Spring Boot Dojo')}"&gt;&lt;/head&gt;
&lt;body class="bg-light"&gt;

&lt;div class="container"&gt;
  &lt;div class="row justify-content-center mt-5"&gt;
    &lt;div class="col-md-5"&gt;
      &lt;div class="card shadow"&gt;
        &lt;div class="card-body p-4"&gt;
          &lt;div class="text-center mb-4"&gt;
            &lt;h2&gt;&lt;i class="bi bi-fire text-danger"&gt;&lt;/i&gt;
              Spring Boot Dojo&lt;/h2&gt;
            &lt;p class="text-muted"&gt;Sign in to start training&lt;/p&gt;
          &lt;/div&gt;

          &lt;!-- Mensaje de error --&gt;
          &lt;div th:if="\${error}" class="alert alert-danger"
               th:text="\${error}"&gt;&lt;/div&gt;

          &lt;!-- Formulario --&gt;
          &lt;form th:action="@{/login}" method="post"
                th:object="\${loginRequest}"&gt;
            &lt;div class="mb-3"&gt;
              &lt;label class="form-label"&gt;Username&lt;/label&gt;
              &lt;input type="text" class="form-control"
                     th:field="*{username}" required&gt;
            &lt;/div&gt;
            &lt;div class="mb-3"&gt;
              &lt;label class="form-label"&gt;Password&lt;/label&gt;
              &lt;input type="password" class="form-control"
                     th:field="*{password}" required&gt;
            &lt;/div&gt;
            &lt;button type="submit" class="btn btn-dark w-100"&gt;
              Login
            &lt;/button&gt;
          &lt;/form&gt;

          &lt;div class="text-center mt-3"&gt;
            &lt;a th:href="@{/register}"&gt;Register here&lt;/a&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;div th:replace="~{fragments/layout :: footer}"&gt;&lt;/div&gt;
&lt;/body&gt;&lt;/html&gt;</code></pre><p><b>Thymeleaf cheatsheet:</b></p><table class='table table-sm table-dark'><thead><tr><th>Sintaxis</th><th>Qué hace</th></tr></thead><tbody><tr><td><code>th:text="\${variable}"</code></td><td>Muestra el valor de una variable (seguro, escapa HTML)</td></tr><tr><td><code>th:if="\${error}"</code></td><td>Solo muestra el elemento si la variable existe y no es null</td></tr><tr><td><code>th:action="@{/login}"</code></td><td>URL del action del formulario (con context-path)</td></tr><tr><td><code>th:object="\${loginRequest}"</code></td><td>Vincula el formulario al DTO</td></tr><tr><td><code>th:field="*{username}"</code></td><td>Vincula el input al campo del DTO (name + value)</td></tr><tr><td><code>th:replace="~{...}"</code></td><td>Reemplaza el elemento con un fragmento de otro archivo</td></tr><tr><td><code>th:each="item : \${list}"</code></td><td>Bucle — repite el elemento por cada item (lo usaremos en dashboard)</td></tr></tbody></table>`,
      },
      {
        title: `11. CSS personalizado (static/css/style.css)`,
        content: `<p><b>Ruta</b>: <code>src/main/resources/static/css/style.css</code></p><pre><code>/* Colores para cinturones que Bootstrap no tiene */
.bg-orange {
    background-color: #fd7e14 !important;
    color: white;
}
.bg-brown {
    background-color: #795548 !important;
    color: white;
}

/* Animación para las cards de cinturón */
.belt-card {
    transition: transform 0.2s;
}
.belt-card:hover {
    transform: translateY(-5px);
}

/* Hover para flashcards */
.flashcard:hover {
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
}</code></pre><p>Poco CSS propio — Bootstrap 5 hace casi todo. Solo añadimos colores de cinturones (naranja y marrón no existen en Bootstrap) y pequeñas animaciones.</p>`,
      },
      {
        title: `12. Arrancar y probar`,
        content: `<p>Necesitas <b>todos los servicios corriendo</b>: Eureka → Auth → Content → Gateway → Frontend</p><pre><code>cd dojo-frontend && mvn spring-boot:run</code></pre><p>Abre el navegador: 👉 <a href='http://localhost:8090' target='_blank'><b>http://localhost:8090</b></a></p><ol><li>Deberías ver la página de <b>login</b></li><li>Pulsa "Register here" → rellena datos → registra</li><li>Debería redirigir al <b>dashboard</b> (lo crearemos en el siguiente capítulo)</li></ol><p>Si ves un error "Service unavailable" → alguno de los servicios no está corriendo. Revisa la consola de cada servicio.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Página en blanco</td><td>Thymeleaf no encuentra el template</td><td>Verifica que el archivo está en <code>src/main/resources/templates/</code> (no <code>template</code> sin s)</td></tr><tr><td><code>Error resolving template "login"</code></td><td>El controller devuelve <code>"login"</code> pero no existe <code>templates/login.html</code></td><td>Crea el archivo. El nombre debe coincidir exactamente</td></tr><tr><td>Los estilos no cargan</td><td>El CSS no está en <code>static/</code></td><td>Archivos estáticos van en <code>src/main/resources/static/</code>. Accesibles como <code>/css/style.css</code></td></tr><tr><td><code>Connection refused</code> al login</td><td>El Gateway no está corriendo o la URL es incorrecta</td><td>Verifica <code>gateway.url</code> en application.yml → <code>http://localhost:8080</code></td></tr><tr><td>Cambios en HTML no se reflejan</td><td>Caché de Thymeleaf activado</td><td><code>thymeleaf.cache: false</code> en application.yml. Si usas IntelliJ, haz Build → Recompile (Ctrl+Shift+F9)</td></tr></tbody></table>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>dojo-frontend</code> creado</li><li>☐ AppConfig con bean RestTemplate</li><li>☐ DTOs: LoginRequest, RegisterRequest, AuthResponse</li><li>☐ AuthController con login, register, logout</li><li>☐ layout.html con head + navbar + footer fragments</li><li>☐ login.html y register.html</li><li>☐ style.css con colores de cinturones</li><li>☐ Puedes abrir <a href='http://localhost:8090'>localhost:8090</a> y ver la página de login</li><li>☐ Login funciona y redirige al dashboard</li><li>☐ Commit: <code>git commit -m "Add frontend with login and register"</code></li></ul><p>¡Ya tiene cara! 🎨 En el siguiente capítulo montamos el <b>Dashboard</b> con las tarjetas de cinturones y el <b>modo de estudio</b> de flashcards. 🥋</p>`,
      },
    ],
  },
  {
    id: 8,
    title: "Dashboard + Estudio de Flashcards",
    intro: `Con el login funcionando, ahora toca la página principal: el Dashboard. Aquí el usuario ve sus estadísticas, las tarjetas de cinturones con barras de progreso, y puede entrar a estudiar flashcards o hacer quizzes. Es la página con más lógica del frontend — conecta con Content Service y Progress Service.`,
    sections: [
      {
        title: `1. DashboardController.java`,
        content: `<p><b>Ruta</b>: <code>.../controller/DashboardController.java</code></p><p>Este controller hace varias llamadas al Gateway para montar la vista:</p><pre><code>package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Controller
public class DashboardController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    // Orden de cinturones
    private static final String[] BELT_ORDER =
        {"BLANCO","AMARILLO","NARANJA","VERDE","MARRON","NEGRO"};

    public DashboardController(RestTemplate restTemplate,
            @Value("\${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // Definir los cinturones
        String[][] belts = {
            {"BLANCO",  "White Belt",  "bg-light text-dark"},
            {"AMARILLO","Yellow Belt", "bg-warning text-dark"},
            {"NARANJA", "Orange Belt", "bg-orange"},
            {"VERDE",   "Green Belt",  "bg-success"},
            {"MARRON",  "Brown Belt",  "bg-brown"},
            {"NEGRO",   "Black Belt",  "bg-dark"}
        };
        model.addAttribute("belts", belts);

        // Headers con JWT
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity&lt;Void&gt; entity = new HttpEntity&lt;&gt;(headers);

        // Fetch flashcards para cada cinturón
        for (String[] belt : belts) {
            try {
                var response = restTemplate.exchange(
                    gatewayUrl + "/api/content/flashcards?difficulty="
                    + belt[0], HttpMethod.GET, entity,
                    new ParameterizedTypeReference
                        &lt;List&lt;Map&lt;String, Object&gt;&gt;&gt;() {});
                model.addAttribute("flashcards_" + belt[0],
                    response.getBody());
            } catch (Exception e) {
                model.addAttribute("flashcards_" + belt[0],
                    Collections.emptyList());
            }
        }

        // Fetch progreso del usuario
        // (más adelante en el capítulo de Progress Service)
        // ...

        return "dashboard";
    }
}</code></pre><p><b>¿Qué hace?</b></p><ol><li>Verifica que hay sesión (token). Si no → redirige a login</li><li>Define los 6 cinturones con su código, nombre y clase CSS</li><li>Para cada cinturón, pide las flashcards al Gateway (con JWT en el header)</li><li>Pasa todo al template con <code>model.addAttribute()</code></li></ol><p>📌 <code>ParameterizedTypeReference</code> — necesario cuando el tipo de respuesta es genérico (<code>List&lt;Map&gt;</code>). Java pierde la info genérica en runtime (type erasure), y esta clase la preserva.</p>`,
      },
      {
        title: `2. dashboard.html — Estadísticas`,
        content: `<p>El dashboard tiene dos zonas: <b>estadísticas arriba</b> y <b>tarjetas de cinturones abajo</b>.</p><p><b>Fila de estadísticas:</b></p><pre><code>&lt;!-- 4 tarjetas de stats --&gt;
&lt;div class="row g-3 mb-4"&gt;
  &lt;div class="col-md-3"&gt;
    &lt;div class="card shadow-sm"&gt;
      &lt;div class="card-body text-center"&gt;
        &lt;i class="bi bi-fire fs-2 text-danger"&gt;&lt;/i&gt;
        &lt;h4 th:text="\${currentStreak}"&gt;0&lt;/h4&gt;
        &lt;small class="text-muted"&gt;Current Streak&lt;/small&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- Repetir para: Best Streak, Total Correct, Accuracy --&gt;
&lt;/div&gt;</code></pre><p>Cuatro tarjetas: 🔥 Racha actual, 🏆 Mejor racha, ✅ Total aciertos, 🎯 % Precisión.</p>`,
      },
      {
        title: `3. dashboard.html — Tarjetas de cinturones`,
        content: `<p>La parte más compleja del template. Usa <code>th:each</code> para iterar los 6 cinturones:</p><pre><code>&lt;div th:each="belt : \${belts}" class="col-md-4"&gt;
  &lt;div class="card belt-card shadow-sm"
       th:classappend="\${!beltUnlocked} ? ' opacity-50' : ''"&gt;

    &lt;!-- Header con color del cinturón --&gt;
    &lt;div class="card-header text-center"
         th:classappend="\${belt[2]}"&gt;
      &lt;h5 th:text="\${belt[1]}"&gt;Belt Name&lt;/h5&gt;
    &lt;/div&gt;

    &lt;div class="card-body text-center"&gt;
      &lt;!-- Barra de progreso --&gt;
      &lt;div class="progress" style="height: 8px;"&gt;
        &lt;div class="progress-bar"
             th:style="'width: ' + \${beltPct} + '%'"&gt;&lt;/div&gt;
      &lt;/div&gt;

      &lt;!-- Botones Study + Quiz --&gt;
      &lt;div th:if="\${beltUnlocked}"&gt;
        &lt;a th:href="@{/study(difficulty=\${belt[0]})}"
           class="btn btn-outline-dark btn-sm"&gt;
          &lt;i class="bi bi-book"&gt;&lt;/i&gt; Study
        &lt;/a&gt;
        &lt;a th:href="@{/quiz(difficulty=\${belt[0]})}"
           class="btn btn-primary btn-sm"&gt;
          &lt;i class="bi bi-patch-question"&gt;&lt;/i&gt; Quiz
        &lt;/a&gt;
      &lt;/div&gt;

      &lt;!-- Bloqueado --&gt;
      &lt;div th:unless="\${beltUnlocked}"&gt;
        &lt;button class="btn btn-secondary btn-sm" disabled&gt;
          🔒 Master previous belt to unlock
        &lt;/button&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre><p>Cada tarjeta muestra: color del cinturón, nombre, barra de progreso, número de flashcards, y botones de Study/Quiz. Si el cinturón está bloqueado, se muestra semitransparente (<code>opacity-50</code>) con un candado.</p>`,
      },
      {
        title: `4. StudyController.java`,
        content: `<p><b>Ruta</b>: <code>.../controller/StudyController.java</code></p><pre><code>package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Controller
public class StudyController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public StudyController(RestTemplate restTemplate,
            @Value("\${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/study")
    public String study(@RequestParam String difficulty,
                       HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);
        model.addAttribute("difficulty", difficulty);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity&lt;Void&gt; entity = new HttpEntity&lt;&gt;(headers);

        try {
            // Pedir flashcards con repetición espaciada
            var response = restTemplate.exchange(
                gatewayUrl + "/api/content/flashcards/next"
                + "?difficulty=" + difficulty
                + "&userId=" + username,
                HttpMethod.GET, entity,
                new ParameterizedTypeReference
                    &lt;List&lt;Map&lt;String, Object&gt;&gt;&gt;() {});
            model.addAttribute("flashcards",
                response.getBody());
        } catch (Exception e) {
            model.addAttribute("flashcards",
                Collections.emptyList());
        }

        return "study";
    }

    @PostMapping("/study/answer")
    public String recordAnswer(
            @RequestParam Long flashcardId,
            @RequestParam String difficulty,
            @RequestParam boolean correct,
            HttpSession session) {
        String token = (String) session.getAttribute("token");
        String username = (String) session.getAttribute("username");
        if (token == null) return "redirect:/login";

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity&lt;Void&gt; entity = new HttpEntity&lt;&gt;(headers);

            // Registrar respuesta para repetición espaciada
            restTemplate.exchange(
                gatewayUrl + "/api/content/flashcards/"
                + flashcardId + "/answer?userId=" + username
                + "&correct=" + correct,
                HttpMethod.POST, entity,
                new ParameterizedTypeReference
                    &lt;Map&lt;String, Object&gt;&gt;() {});

            // Registrar en progress service
            HttpHeaders postHeaders = new HttpHeaders();
            postHeaders.set("Authorization", "Bearer " + token);
            postHeaders.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity&lt;Map&lt;String, Object&gt;&gt; progressEntity =
                new HttpEntity&lt;&gt;(Map.of(
                    "username", username,
                    "beltLevel", difficulty,
                    "correct", correct), postHeaders);
            restTemplate.postForEntity(
                gatewayUrl + "/api/progress/record",
                progressEntity, Object.class);
        } catch (Exception ignored) {
            // Best effort
        }

        return "redirect:/study?difficulty=" + difficulty;
    }
}</code></pre><p>El StudyController hace dos cosas:</p><ul><li><b>GET /study</b> — Pide flashcards priorizadas (las que más fallas primero)</li><li><b>POST /study/answer</b> — Cuando pulsas "Lo sabía" o "No lo sabía", registra la respuesta en dos sitios: content-service (para repetición espaciada) y progress-service (para racha/cinturones)</li></ul>`,
      },
      {
        title: `5. study.html — Modo estudio`,
        content: `<p>Muestra las flashcards como tarjetas con la respuesta oculta. Click para revelar:</p><pre><code>&lt;div th:each="card, iter : \${flashcards}" class="col-12"&gt;
  &lt;div class="card flashcard shadow-sm"&gt;
    &lt;div class="card-body"&gt;
      &lt;!-- Pregunta visible --&gt;
      &lt;h5 th:text="\${card['question']}"&gt;Question&lt;/h5&gt;

      &lt;!-- Respuesta oculta --&gt;
      &lt;div th:id="'answer-' + \${iter.index}"
           style="display: none;"&gt;
        &lt;p class="text-success"
           th:text="\${card['answer']}"&gt;Answer&lt;/p&gt;

        &lt;!-- Botones de feedback --&gt;
        &lt;form method="post" action="/study/answer"&gt;
          &lt;input type="hidden" name="flashcardId"
                 th:value="\${card['id']}"/&gt;
          &lt;input type="hidden" name="difficulty"
                 th:value="\${difficulty}"/&gt;
          &lt;input type="hidden" name="correct" value="true"/&gt;
          &lt;button class="btn btn-success btn-sm"&gt;
            ✅ Lo sabía&lt;/button&gt;
        &lt;/form&gt;
        &lt;form method="post" action="/study/answer"&gt;
          &lt;!-- mismo pero correct=false --&gt;
          &lt;button class="btn btn-danger btn-sm"&gt;
            ❌ No lo sabía&lt;/button&gt;
        &lt;/form&gt;
      &lt;/div&gt;

      &lt;!-- Botón para mostrar/ocultar --&gt;
      &lt;button onclick="toggleAnswer(index)"&gt;
        Show Answer
      &lt;/button&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;script&gt;
function toggleAnswer(index) {
    var el = document.getElementById('answer-' + index);
    el.style.display =
        el.style.display === 'none' ? 'block' : 'none';
}
&lt;/script&gt;</code></pre><p><b>Flujo del usuario:</b></p><ol><li>Ve la pregunta → piensa la respuesta</li><li>Click "Show Answer" → ve la respuesta</li><li>Click "Lo sabía" o "No lo sabía" → se registra y recarga con la siguiente flashcard prioritaria</li></ol><p>📌 <code>th:each="card, iter"</code> — <code>iter</code> es el iterador de Thymeleaf. Tiene <code>iter.index</code> (0-based), <code>iter.count</code> (1-based), etc.</p>`,
      },
      {
        title: `6. JavaScript mínimo`,
        content: `<p>El estudio usa una función JavaScript muy sencilla para mostrar/ocultar respuestas:</p><pre><code>function toggleAnswer(index) {
    var answerEl = document.getElementById('answer-' + index);
    var btn = answerEl.parentElement.querySelector('button');
    if (answerEl.style.display === 'none') {
        answerEl.style.display = 'block';
        btn.innerHTML = '&lt;i class="bi bi-eye-slash"&gt;&lt;/i&gt; Hide Answer';
    } else {
        answerEl.style.display = 'none';
        btn.innerHTML = '&lt;i class="bi bi-eye"&gt;&lt;/i&gt; Show Answer';
    }
}</code></pre><p>No necesitas React, Vue ni Angular. JavaScript vanilla para interacciones simples + formularios HTML para las acciones del servidor. Simple y efectivo.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Dashboard vacío (sin cinturones)</td><td>Content Service no está corriendo o no hay datos</td><td>Arranca content-service y verifica que el DataSeeder carga datos</td></tr><tr><td>Stats siempre en 0</td><td>Progress Service no está arrancado (lo crearemos en un capítulo posterior)</td><td>Normal por ahora. Los stats funcionarán cuando añadamos progress-service</td></tr><tr><td><code>401 Unauthorized</code> al cargar flashcards</td><td>Token expirado o sesión perdida</td><td>Haz logout y login de nuevo. El token expira a las 24h</td></tr><tr><td>"Lo sabía" / "No lo sabía" no hace nada</td><td>Progress Service o endpoint de answer no disponible</td><td>El registro es best-effort (ignora errores). Funcionará cuando todo esté arrancado</td></tr></tbody></table>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ DashboardController creado</li><li>☐ dashboard.html con stats + tarjetas de cinturones</li><li>☐ StudyController creado (GET /study + POST /study/answer)</li><li>☐ study.html con flashcards y botones Lo sabía / No lo sabía</li><li>☐ Puedes navegar: Login → Dashboard → Study → ver flashcards</li><li>☐ Commit: <code>git commit -m "Add dashboard and study mode"</code></li></ul><p>¡La app ya es usable! 🎉 Ahora vamos a añadir los <b>Quizzes</b> — preguntas tipo test con feedback. 📝</p>`,
      },
    ],
  },
  {
    id: 9,
    title: "Sistema de Quizzes",
    intro: `Los quizzes son preguntas tipo test con 4 opciones (A, B, C, D). A diferencia del modo estudio (flashcards), los quizzes evalúan al usuario con puntuación, feedback inmediato por pregunta y una página de resultados al final. La implementación usa la sesión HTTP del servidor para mantener el estado del quiz.`,
    sections: [
      {
        title: `1. Flujo del Quiz`,
        content: `<p>El quiz tiene <b>3 pantallas</b> y un flujo con estado en sesión:</p><pre><code>Dashboard → [Start Quiz]
         → GET /quiz?difficulty=BLANCO
         → (carga preguntas en sesión)
         → redirect → GET /quiz/question

Pregunta → quiz.html (muestra pregunta + 4 opciones)
         → POST /quiz/answer (selectedOption=2)
         → quiz-feedback.html (✅ o ❌ + respuesta correcta)
         → GET /quiz/next
         → redirect → GET /quiz/question (siguiente pregunta)

Última pregunta → [See Results]
                → GET /quiz/results
                → quiz-result.html (% + revisión)</code></pre><p>📌 El estado del quiz (preguntas, índice actual, aciertos) se guarda en la <b>HttpSession</b> del servidor. No se guarda en base de datos ni en el cliente.</p>`,
      },
      {
        title: `2. QuizController del frontend (resumen)`,
        content: `<p><b>Ruta</b>: <code>.../controller/QuizController.java</code></p><p>Este controller tiene 5 endpoints. Es el más largo del proyecto:</p><table class='table table-sm table-dark'><thead><tr><th>Endpoint</th><th>Qué hace</th></tr></thead><tbody><tr><td><code>GET /quiz?difficulty=BLANCO</code></td><td>Carga quizzes desde el Gateway, los guarda en sesión, redirige a /quiz/question</td></tr><tr><td><code>GET /quiz/question</code></td><td>Muestra la pregunta actual (lee el índice de sesión)</td></tr><tr><td><code>POST /quiz/answer</code></td><td>Recibe la respuesta, compara con la correcta, registra en progress-service, muestra feedback</td></tr><tr><td><code>GET /quiz/next</code></td><td>Incrementa el índice y redirige a /quiz/question</td></tr><tr><td><code>GET /quiz/results</code></td><td>Muestra resultados finales, limpia la sesión del quiz</td></tr></tbody></table>`,
      },
      {
        title: `3. Iniciar el quiz — GET /quiz`,
        content: `<pre><code>@GetMapping("/quiz")
public String startQuiz(@RequestParam String difficulty,
        HttpSession session, Model model) {
    String token = (String) session.getAttribute("token");
    if (token == null) return "redirect:/login";

    // Pedir quizzes al Gateway
    HttpHeaders headers = new HttpHeaders();
    headers.set("Authorization", "Bearer " + token);
    HttpEntity&lt;Void&gt; entity = new HttpEntity&lt;&gt;(headers);

    var response = restTemplate.exchange(
        gatewayUrl + "/api/content/quizzes?difficulty=" + difficulty,
        HttpMethod.GET, entity,
        new ParameterizedTypeReference
            &lt;List&lt;Map&lt;String, Object&gt;&gt;&gt;() {});

    List&lt;Map&lt;String, Object&gt;&gt; quizzes = response.getBody();

    // Guardar estado del quiz en sesión
    session.setAttribute("quizQuestions", quizzes);
    session.setAttribute("quizDifficulty", difficulty);
    session.setAttribute("quizCurrentIndex", 0);
    session.setAttribute("quizCorrect", 0);
    session.setAttribute("quizTotal", 0);
    session.setAttribute("quizAnswers", new ArrayList&lt;&gt;());

    return "redirect:/quiz/question";
}</code></pre><p>Carga todas las preguntas de una vez y las guarda en sesión. Así no necesitamos llamar al Gateway pregunta por pregunta.</p>`,
      },
      {
        title: `4. Mostrar pregunta — GET /quiz/question`,
        content: `<pre><code>@GetMapping("/quiz/question")
public String showQuestion(HttpSession session, Model model) {
    List&lt;Map&lt;String, Object&gt;&gt; quizzes =
        (List&lt;Map&lt;String, Object&gt;&gt;)
        session.getAttribute("quizQuestions");
    Integer currentIndex =
        (Integer) session.getAttribute("quizCurrentIndex");

    if (quizzes == null || currentIndex == null)
        return "redirect:/dashboard";

    // ¿Ya acabó?
    if (currentIndex >= quizzes.size())
        return "redirect:/quiz/results";

    Map&lt;String, Object&gt; currentQuiz = quizzes.get(currentIndex);

    model.addAttribute("quiz", currentQuiz);
    model.addAttribute("questionNumber", currentIndex + 1);
    model.addAttribute("totalQuestions", quizzes.size());
    model.addAttribute("correct",
        session.getAttribute("quizCorrect"));

    return "quiz";
}</code></pre>`,
      },
      {
        title: `5. Responder — POST /quiz/answer`,
        content: `<pre><code>@PostMapping("/quiz/answer")
public String submitAnswer(@RequestParam int selectedOption,
        HttpSession session, Model model) {
    // Leer estado de sesión
    List&lt;Map&lt;String, Object&gt;&gt; quizzes = ...;
    Integer currentIndex = ...;

    Map&lt;String, Object&gt; currentQuiz = quizzes.get(currentIndex);
    int correctOption =
        ((Number) currentQuiz.get("correctOption")).intValue();
    boolean isCorrect = selectedOption == correctOption;

    // Actualizar contador
    if (isCorrect) {
        session.setAttribute("quizCorrect",
            (Integer) session.getAttribute("quizCorrect") + 1);
    }
    session.setAttribute("quizTotal",
        (Integer) session.getAttribute("quizTotal") + 1);

    // Registrar en progress-service (best-effort)
    try {
        restTemplate.postForEntity(
            gatewayUrl + "/api/progress/record",
            Map.of("username", username,
                   "beltLevel", difficulty,
                   "correct", isCorrect),
            Object.class);
    } catch (Exception ignored) {}

    // Guardar respuesta para la revisión final
    answers.add(Map.of(
        "question", currentQuiz.get("question"),
        "correct", isCorrect,
        "correctAnswer", "A: " + correctOptionText));

    // Pasar datos al template de feedback
    model.addAttribute("isCorrect", isCorrect);
    model.addAttribute("selectedOption", selectedOption);
    model.addAttribute("correctOption", correctOption);
    model.addAttribute("hasNext",
        currentIndex + 1 < quizzes.size());

    return "quiz-feedback";
}</code></pre><p><b>Puntos clave:</b></p><ul><li>Compara <code>selectedOption</code> (del formulario) con <code>correctOption</code> (del quiz)</li><li>Actualiza contadores en sesión sin tocar base de datos</li><li>Registra en progress-service como <b>best-effort</b> (si falla, no importa — el quiz sigue)</li><li>Guarda cada respuesta en una lista para la revisión final</li></ul>`,
      },
      {
        title: `6. quiz.html — Pantalla de pregunta`,
        content: `<p>Muestra la pregunta con 4 opciones como radio buttons:</p><pre><code>&lt;form action="/quiz/answer" method="post"&gt;
  &lt;div class="list-group mb-4"&gt;

    &lt;label class="list-group-item list-group-item-action"&gt;
      &lt;input type="radio" name="selectedOption"
             value="0" required&gt;
      &lt;span class="badge bg-secondary"&gt;A&lt;/span&gt;
      &lt;span th:text="\${quiz['optionA']}"&gt;Option A&lt;/span&gt;
    &lt;/label&gt;

    &lt;!-- Repetir para B (value=1), C (value=2), D (value=3) --&gt;

  &lt;/div&gt;
  &lt;button type="submit" class="btn btn-primary btn-lg"&gt;
    Submit Answer
  &lt;/button&gt;
&lt;/form&gt;</code></pre><p>Incluye una barra de progreso arriba (<code>Question 3 / 5</code>) y un contador de aciertos.</p>`,
      },
      {
        title: `7. quiz-feedback.html — Feedback inmediato`,
        content: `<p>Después de cada respuesta, muestra si acertó o falló:</p><pre><code>&lt;!-- Header verde (correcto) o rojo (incorrecto) --&gt;
&lt;div class="card-header"
     th:classappend="\${isCorrect}
         ? 'bg-success text-white'
         : 'bg-danger text-white'"&gt;
  &lt;h5&gt;
    &lt;span th:text="\${isCorrect}
        ? 'Correct!' : 'Incorrect'"&gt;&lt;/span&gt;
  &lt;/h5&gt;
&lt;/div&gt;

&lt;!-- Lista de opciones con colores --&gt;
&lt;div th:each="opt, iter : \${optionKeys}"
     class="list-group-item"
     th:classappend="
         \${iter.index == correctOption}
             ? ' list-group-item-success'
         : (\${iter.index == selectedOption and !isCorrect}
             ? ' list-group-item-danger' : '')"&gt;
  &lt;span th:text="\${quiz[opt]}"&gt;Option&lt;/span&gt;
  &lt;i th:if="\${iter.index == correctOption}"
     class="bi bi-check-lg text-success"&gt;&lt;/i&gt;
  &lt;i th:if="\${iter.index == selectedOption and !isCorrect}"
     class="bi bi-x-lg text-danger"&gt;&lt;/i&gt;
&lt;/div&gt;

&lt;!-- Botón siguiente o ver resultados --&gt;
&lt;a th:if="\${hasNext}" href="/quiz/next"
   class="btn btn-primary"&gt;Next Question&lt;/a&gt;
&lt;a th:unless="\${hasNext}" href="/quiz/results"
   class="btn btn-success"&gt;See Results&lt;/a&gt;</code></pre><p>La respuesta correcta se pinta <span style='color:#198754'><b>verde</b></span>, la incorrecta seleccionada se pinta <span style='color:#dc3545'><b>roja</b></span>. Todas las opciones se muestran para que aprendas de los errores.</p>`,
      },
      {
        title: `8. quiz-result.html — Resultados finales`,
        content: `<p>La pantalla final del quiz muestra:</p><ul><li><b>Porcentaje</b> grande y coloreado (verde ≥80%, amarillo ≥50%, rojo &lt;50%)</li><li><b>Barra de progreso</b> visual</li><li><b>Mensaje motivacional</b> según el resultado</li><li><b>Botones</b>: Retry Quiz, Study Flashcards, Dashboard</li><li><b>Revisión de respuestas</b> — lista de todas las preguntas con ✅/❌ y la respuesta correcta</li></ul><pre><code>&lt;!-- Porcentaje grande --&gt;
&lt;div class="display-1 fw-bold"
     th:classappend="\${percentage >= 80}
         ? 'text-success'
         : (\${percentage >= 50}
             ? 'text-warning' : 'text-danger')"&gt;
  &lt;span th:text="\${percentage}"&gt;0&lt;/span&gt;%
&lt;/div&gt;

&lt;!-- Mensaje según resultado --&gt;
&lt;div th:if="\${percentage >= 80}" class="alert alert-success"&gt;
  ⭐ Excellent! You're mastering this belt level!
&lt;/div&gt;
&lt;div th:if="\${percentage >= 50 and percentage < 80}"
     class="alert alert-warning"&gt;
  ⚡ Good effort! Keep practicing.
&lt;/div&gt;
&lt;div th:if="\${percentage < 50}" class="alert alert-info"&gt;
  📚 Review the flashcards and try again!
&lt;/div&gt;</code></pre><p>La revisión de respuestas usa <code>th:each</code> sobre la lista <code>answers</code> que se fue construyendo pregunta a pregunta. El controller limpia la sesión al mostrar los resultados.</p>`,
      },
      {
        title: `9. Gestión de estado con HttpSession`,
        content: `<p>Los quizzes usan la sesión HTTP para mantener el estado entre peticiones. Es un patrón importante de entender:</p><table class='table table-sm table-dark'><thead><tr><th>Atributo de sesión</th><th>Tipo</th><th>Para qué</th></tr></thead><tbody><tr><td><code>quizQuestions</code></td><td>List&lt;Map&gt;</td><td>Todas las preguntas cargadas</td></tr><tr><td><code>quizCurrentIndex</code></td><td>Integer</td><td>Índice de la pregunta actual (0-based)</td></tr><tr><td><code>quizCorrect</code></td><td>Integer</td><td>Contador de aciertos</td></tr><tr><td><code>quizTotal</code></td><td>Integer</td><td>Contador de intentos</td></tr><tr><td><code>quizDifficulty</code></td><td>String</td><td>Cinturón actual (BLANCO, etc.)</td></tr><tr><td><code>quizAnswers</code></td><td>List&lt;Map&gt;</td><td>Historial para la revisión final</td></tr></tbody></table><p><b>¿Por qué sesión y no base de datos?</b></p><ul><li>El quiz es <b>efímero</b> — solo importa mientras lo estás haciendo</li><li>Lo que sí se persiste es el <b>progreso</b> (vía progress-service) — aciertos, racha, cinturones</li><li>Si cierras el navegador a mitad del quiz, se pierde. No es un problema — empiezas otro</li></ul><p>📌 En una app de producción podrías usar Redis para sesiones distribuidas. Aquí usamos la sesión en memoria de Tomcat (que viene con spring-boot-starter-web).</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Redirige al dashboard al entrar al quiz</td><td>No hay quizzes para ese cinturón en el DataSeeder</td><td>Verifica que <code>seedQuizzes()</code> tiene datos para ese nivel de dificultad</td></tr><tr><td>Siempre dice "Incorrect" aunque aciertes</td><td>El <code>correctOption</code> no coincide con el índice del radio button</td><td>Las opciones van de 0 a 3 (A=0, B=1, C=2, D=3). Revisa que el DataSeeder pone el índice correcto</td></tr><tr><td>El porcentaje final es NaN o raro</td><td>División por cero si no hay preguntas</td><td>El controller calcula <code>(correct * 100) / total</code>. Si total=0, devuelve 0</td></tr><tr><td>La sesión se pierde entre preguntas</td><td>Cookies deshabilitadas en el navegador</td><td>La sesión HTTP depende de una cookie (<code>JSESSIONID</code>). Verifica que las cookies están activas</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>HttpSession</b> — Almacenamiento por usuario en el servidor. Se identifica con una cookie (JSESSIONID). Útil para datos temporales que no merecen persistirse</li><li><b>PRG pattern (Post-Redirect-Get)</b> — Después de un POST (/quiz/answer), redirigimos con GET (/quiz/next → /quiz/question). Esto evita que al refrescar el navegador se reenvíe el POST</li><li><b>Best-effort</b> — El registro en progress-service está en try-catch con catch vacío. Si falla, el quiz sigue funcionando. Es un patrón válido cuando la acción secundaria no es crítica</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ QuizController.java creado (5 endpoints)</li><li>☐ quiz.html — muestra pregunta con 4 opciones</li><li>☐ quiz-feedback.html — feedback verde/rojo por pregunta</li><li>☐ quiz-result.html — resultados finales con revisión</li><li>☐ Puedes hacer un quiz completo: Dashboard → Quiz → responder → ver resultados</li><li>☐ Commit: <code>git commit -m "Add quiz system with feedback and results"</code></li></ul><p>¡Sistema de quizzes completo! 📝 Ahora vamos con el <b>Progress Service</b> — para que los aciertos, rachas y cinturones se persistan. 📊</p>`,
      },
    ],
  },
  {
    id: 10,
    title: "Progress Service",
    intro: `El Progress Service es un microservicio independiente que rastrea el progreso de cada usuario: total de aciertos, racha de días estudiados, y progreso por cinturón. Es el servicio que hace que el Dashboard tenga datos reales y que los cinturones se desbloqueen.`,
    sections: [
      {
        title: `1. ¿Por qué un servicio separado?`,
        content: `<p>Podríamos haber metido el progreso dentro de Content Service, pero lo separamos porque:</p><ul><li><b>Responsabilidad única</b> — Content gestiona el contenido (flashcards, quizzes). Progress gestiona el avance del usuario. Son dominios diferentes</li><li><b>Independencia</b> — Si Content Service cae, el progreso no se pierde</li><li><b>Escalabilidad</b> — En producción, el progreso podría recibir muchas escrituras (cada respuesta). Poder escalarlo por separado es una ventaja</li></ul><p>Es un buen ejemplo de cuándo separar un microservicio: <b>cuando el dominio y la carga son distintos</b>.</p>`,
      },
      {
        title: `2. Crear el proyecto progress-service`,
        content: `<p><b>Spring Initializr</b> con:</p><table class='table table-sm table-dark'><thead><tr><th>Dependencia</th><th>Para qué</th></tr></thead><tbody><tr><td><b>Spring Web</b></td><td>API REST</td></tr><tr><td><b>Spring Data JPA</b></td><td>Entidades y repositorios</td></tr><tr><td><b>H2 Database</b></td><td>BD en memoria</td></tr><tr><td><b>Validation</b></td><td>Validar requests</td></tr><tr><td><b>Eureka Discovery Client</b></td><td>Registrarse en Eureka</td></tr></tbody></table><p>Mismas dependencias que Content Service (sin Security ni JWT — la protección la hace el Gateway).</p>`,
      },
      {
        title: `3. Estructura de carpetas`,
        content: `<pre><code>com.dojo.progress/
├── ProgressServiceApplication.java
├── controller/
│   └── ProgressController.java
├── dto/
│   └── AnswerRequest.java
├── entity/
│   ├── UserProgress.java     ← Stats globales del usuario
│   └── BeltProgress.java      ← Stats por cinturón
├── repository/
│   ├── UserProgressRepository.java
│   └── BeltProgressRepository.java
└── service/
    └── ProgressService.java</code></pre>`,
      },
      {
        title: `4. Entity: UserProgress.java`,
        content: `<p><b>Ruta</b>: <code>.../entity/UserProgress.java</code></p><p>Almacena las estadísticas globales del usuario:</p><pre><code>package com.dojo.progress.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "user_progress")
public class UserProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String userId;          // Username

    @Column(nullable = false)
    private int totalCorrect;       // Total aciertos

    @Column(nullable = false)
    private int totalAttempted;      // Total intentos

    @Column(nullable = false)
    private int currentStreak;       // Racha actual (días seguidos)

    @Column(nullable = false)
    private int bestStreak;           // Mejor racha histórica

    private LocalDate lastStudyDate;  // Último día que estudió

    public UserProgress() {}

    public UserProgress(String userId) {
        this.userId = userId;
        this.totalCorrect = 0;
        this.totalAttempted = 0;
        this.currentStreak = 0;
        this.bestStreak = 0;
    }

    // Getters y setters de todos los campos...
}</code></pre><p>📌 <code>LocalDate</code> (no <code>LocalDateTime</code>) porque la racha se cuenta por <b>días</b>, no por horas. JPA convierte <code>LocalDate</code> a columna DATE automáticamente.</p>`,
      },
      {
        title: `5. Entity: BeltProgress.java`,
        content: `<p><b>Ruta</b>: <code>.../entity/BeltProgress.java</code></p><p>Progreso específico por cinturón:</p><pre><code>package com.dojo.progress.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "belt_progress",
    uniqueConstraints = {
        @UniqueConstraint(
            columnNames = {"userId", "beltLevel"})
    })
public class BeltProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String userId;

    @Column(nullable = false)
    private String beltLevel;   // BLANCO, AMARILLO...

    @Column(nullable = false)
    private int correctCount;    // Aciertos en este cinturón

    @Column(nullable = false)
    private int attemptCount;    // Intentos en este cinturón

    @Column(nullable = false)
    private boolean mastered;    // ¿Dominado?

    public BeltProgress() {}

    public BeltProgress(String userId, String beltLevel) {
        this.userId = userId;
        this.beltLevel = beltLevel;
        this.correctCount = 0;
        this.attemptCount = 0;
        this.mastered = false;
    }

    // Getters y setters...
}</code></pre><p><b>Novedad</b>: <code>@UniqueConstraint(columnNames = {"userId", "beltLevel"})</code> — Esto crea una <b>restricción compuesta</b> en la base de datos: no puede haber dos filas con el mismo userId + beltLevel. Así cada usuario tiene máximo una fila por cinturón.</p><p>La condición de <b>mastered</b> (cinturón dominado) se calcula así: <b>≥80% de acierto con mínimo 10 intentos</b>.</p>`,
      },
      {
        title: `6. Repositories`,
        content: `<p><b>UserProgressRepository.java</b>:</p><pre><code>public interface UserProgressRepository
        extends JpaRepository&lt;UserProgress, Long&gt; {

    Optional&lt;UserProgress&gt; findByUserId(String userId);
}</code></pre><p><b>BeltProgressRepository.java</b>:</p><pre><code>public interface BeltProgressRepository
        extends JpaRepository&lt;BeltProgress, Long&gt; {

    Optional&lt;BeltProgress&gt; findByUserIdAndBeltLevel(
        String userId, String beltLevel);

    List&lt;BeltProgress&gt; findByUserId(String userId);
}</code></pre><p>Simples y limpios. Spring Data genera las queries automáticamente.</p>`,
      },
      {
        title: `7. ProgressService.java — La lógica de negocio`,
        content: `<p>Este es el corazón del servicio. El método <code>recordAnswer()</code> hace varias cosas en una transacción:</p><pre><code>@Service
public class ProgressService {

    private final UserProgressRepository userProgressRepo;
    private final BeltProgressRepository beltProgressRepo;

    // Constructor con inyección...

    @Transactional  // Todo dentro de una transacción
    public UserProgress recordAnswer(AnswerRequest request) {

        // 1. Buscar o crear progreso del usuario
        UserProgress progress = userProgressRepo
            .findByUserId(request.getUsername())
            .orElse(new UserProgress(request.getUsername()));

        // 2. Actualizar contadores
        progress.setTotalAttempted(
            progress.getTotalAttempted() + 1);
        if (request.isCorrect()) {
            progress.setTotalCorrect(
                progress.getTotalCorrect() + 1);
        }

        // 3. Calcular racha
        LocalDate today = LocalDate.now();
        if (progress.getLastStudyDate() == null
                || !progress.getLastStudyDate().equals(today)) {

            if (progress.getLastStudyDate() != null
                && progress.getLastStudyDate()
                    .plusDays(1).equals(today)) {
                // Estudió ayer → incrementar racha
                progress.setCurrentStreak(
                    progress.getCurrentStreak() + 1);
            } else {
                // No estudió ayer → racha a 1
                progress.setCurrentStreak(1);
            }
            progress.setLastStudyDate(today);
        }

        // 4. Actualizar mejor racha
        if (progress.getCurrentStreak()
                > progress.getBestStreak()) {
            progress.setBestStreak(
                progress.getCurrentStreak());
        }

        userProgressRepo.save(progress);

        // 5. Actualizar progreso del cinturón
        BeltProgress belt = beltProgressRepo
            .findByUserIdAndBeltLevel(
                request.getUsername(), request.getBeltLevel())
            .orElse(new BeltProgress(
                request.getUsername(), request.getBeltLevel()));

        belt.setAttemptCount(belt.getAttemptCount() + 1);
        if (request.isCorrect()) {
            belt.setCorrectCount(belt.getCorrectCount() + 1);
        }

        // 6. ¿Cinturón dominado? (≥80% en 10+ intentos)
        if (belt.getAttemptCount() >= 10) {
            double pct = (double) belt.getCorrectCount()
                / belt.getAttemptCount() * 100;
            belt.setMastered(pct >= 80.0);
        }

        beltProgressRepo.save(belt);

        return progress;
    }
}</code></pre><p><b>Detalle del cálculo de racha:</b></p><ul><li>Si <b>nunca estudió</b> o <b>es un día nuevo</b> → comprobar si estudió ayer</li><li>Si estudió <b>ayer</b> (<code>lastStudyDate + 1 día == hoy</code>) → incrementar racha</li><li>Si NO estudió ayer → reiniciar racha a 1</li><li>Si ya estudió <b>hoy</b> → no tocar la racha (puede responder 50 preguntas en un día)</li></ul><p>📌 <code>@Transactional</code> — Si algo falla a mitad (por ejemplo al guardar BeltProgress), se hace rollback de todo. O se guardan los dos o ninguno.</p>`,
      },
      {
        title: `8. ProgressController.java`,
        content: `<p><b>Ruta</b>: <code>.../controller/ProgressController.java</code></p><pre><code>@RestController
@RequestMapping("/progress")
public class ProgressController {

    private final ProgressService progressService;

    // Constructor...

    // Registrar una respuesta
    @PostMapping("/record")
    public ResponseEntity&lt;UserProgress&gt; recordAnswer(
            @Valid @RequestBody AnswerRequest request) {
        return ResponseEntity.ok(
            progressService.recordAnswer(request));
    }

    // Obtener progreso completo de un usuario
    @GetMapping("/{username}")
    public ResponseEntity&lt;Map&lt;String, Object&gt;&gt; getProgress(
            @PathVariable String username) {
        UserProgress progress =
            progressService.getProgress(username);
        List&lt;BeltProgress&gt; belts =
            progressService.getBeltProgress(username);
        return ResponseEntity.ok(Map.of(
            "userProgress", progress,
            "beltProgress", belts));
    }

    // Obtener solo racha
    @GetMapping("/{username}/streak")
    public ResponseEntity&lt;Map&lt;String, Object&gt;&gt; getStreak(
            @PathVariable String username) { ... }

    // Obtener progreso de todos los cinturones
    @GetMapping("/{username}/belts")
    public ResponseEntity&lt;List&lt;BeltProgress&gt;&gt; getBeltProgress(
            @PathVariable String username) { ... }

    // Obtener progreso de un cinturón específico
    @GetMapping("/{username}/belts/{beltLevel}")
    public ResponseEntity&lt;BeltProgress&gt; getBeltProgressForLevel(
            @PathVariable String username,
            @PathVariable String beltLevel) { ... }
}</code></pre><table class='table table-sm table-dark'><thead><tr><th>Endpoint</th><th>Qué devuelve</th></tr></thead><tbody><tr><td><code>POST /progress/record</code></td><td>Registra respuesta → devuelve UserProgress actualizado</td></tr><tr><td><code>GET /progress/berto</code></td><td>Stats globales + progreso de todos los cinturones</td></tr><tr><td><code>GET /progress/berto/streak</code></td><td>Racha actual + mejor racha</td></tr><tr><td><code>GET /progress/berto/belts</code></td><td>Lista de BeltProgress</td></tr><tr><td><code>GET /progress/berto/belts/BLANCO</code></td><td>Progreso de un cinturón específico</td></tr></tbody></table>`,
      },
      {
        title: `9. AnswerRequest DTO`,
        content: `<pre><code>package com.dojo.progress.dto;

import jakarta.validation.constraints.NotBlank;

public class AnswerRequest {

    @NotBlank
    private String username;    // Quién respondió

    @NotBlank
    private String beltLevel;   // En qué cinturón

    private boolean correct;     // ¿Acertó?

    // Getters y setters...
}</code></pre><p>Solo 3 campos. El frontend envía este JSON cada vez que respondes una flashcard o quiz.</p>`,
      },
      {
        title: `10. application.yml`,
        content: `<pre><code>server:
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
    show-sql: true
  h2:
    console:
      enabled: true

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/</code></pre><p>Puerto <b>8084</b>, BD propia (<code>progressdb</code>). Mismo patrón que auth y content.</p>`,
      },
      {
        title: `11. Arrancar y probar`,
        content: `<pre><code>cd progress-service && mvn spring-boot:run</code></pre><p>Probar directamente:</p><pre><code># Registrar una respuesta
curl -s -X POST http://localhost:8084/progress/record \\
  -H 'Content-Type: application/json' \\
  -d '{"username":"berto",
       "beltLevel":"BLANCO",
       "correct":true}' | jq

# Ver progreso
curl -s http://localhost:8084/progress/berto | jq

# Ver racha
curl -s http://localhost:8084/progress/berto/streak | jq</code></pre><p>Vía Gateway (con token):</p><pre><code>curl -s http://localhost:8080/api/progress/berto \\
  -H "Authorization: Bearer \$TOKEN" | jq</code></pre><p>Verifica en Eureka que aparece <code>PROGRESS-SERVICE</code>.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Racha siempre en 1</td><td>Necesitas estudiar en <b>días consecutivos</b> para que suba</td><td>Normal. La racha solo incrementa si <code>lastStudyDate + 1 == today</code></td></tr><tr><td>Cinturón no se marca como mastered</td><td>Menos de 10 intentos o menos del 80% de acierto</td><td>Necesitas ≥10 intentos Y ≥80% correcto en ese cinturón</td></tr><tr><td><code>UniqueConstraint violation</code></td><td>Intentar crear dos BeltProgress con mismo userId + beltLevel</td><td>Usa <code>findByUserIdAndBeltLevel().orElse(new ...)</code> para buscar primero y crear solo si no existe</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>@Transactional</b> — Asegura que todas las operaciones dentro del método se ejecutan como una unidad. Si una falla, se hace rollback de todas. Esencial para consistencia de datos</li><li><b>Composite Unique Constraint</b> — <code>@UniqueConstraint(columnNames = {"userId", "beltLevel"})</code> crea un índice único compuesto. Cada combinación userId+beltLevel es única</li><li><b>orElse vs orElseThrow</b> — <code>orElse(new ...)</code> crea uno nuevo si no existe (upsert pattern). <code>orElseThrow()</code> lanza excepción si no existe (error 404)</li><li><b>LocalDate vs LocalDateTime</b> — Date para fechas sin hora. DateTime para timestamps completos. Aquí usamos Date porque la racha se cuenta por días</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Proyecto <code>progress-service</code> creado</li><li>☐ Entidades: UserProgress, BeltProgress</li><li>☐ Repositories: UserProgressRepository, BeltProgressRepository</li><li>☐ ProgressService con lógica de racha y mastered</li><li>☐ ProgressController con 5 endpoints</li><li>☐ Funciona vía curl directo y vía Gateway con token</li><li>☐ El Dashboard ahora muestra stats reales</li><li>☐ Commit: <code>git commit -m "Add progress-service with streaks and belt progress"</code></li></ul><p>¡Progreso funcionando! 📊 Ahora vamos con un feature más avanzado: <b>Repetición Espaciada</b> — para que las flashcards que más fallas aparezcan más. 🧠</p>`,
      },
    ],
  },
  {
    id: 11,
    title: "Repetición Espaciada",
    intro: `La repetición espaciada es una técnica de aprendizaje que prioriza el contenido que más fallas. En vez de mostrar las flashcards en orden aleatorio, las que marcas como "No lo sabía" aparecen antes y con más frecuencia. Las que ya dominas van bajando de prioridad. Es como el algoritmo de Anki pero simplificado.`,
    sections: [
      {
        title: `1. ¿Cómo funciona?`,
        content: `<p>Cada flashcard tiene una <b>prioridad</b> por usuario (de 0 a 10):</p><ul><li>Prioridad <b>alta (10)</b> → aparece primero (la fallas mucho)</li><li>Prioridad <b>baja (0)</b> → aparece al final (ya la dominas)</li><li>Prioridad <b>inicial (5)</b> → punto medio para flashcards nuevas</li></ul><pre><code>Cuando respondes una flashcard:

  ✅ "Lo sabía"     → prioridad - 1 (mínimo 0)
  ❌ "No lo sabía"  → prioridad + 2 (máximo 10)

Orden de aparición:
  1. Flashcards NO vistas (nuevas)
  2. Flashcards vistas, ordenadas por:
     - Mayor prioridad primero (las que más fallas)
     - Si misma prioridad → la que hace más tiempo que no ves</code></pre><p>📌 <b>¿Por qué +2 al fallar y -1 al acertar?</b> Porque es más importante repasar los errores que premiar los aciertos. Así las flashcards problemáticas "suben" rápido y las dominadas "bajan" lentamente.</p>`,
      },
      {
        title: `2. Entity: UserFlashcardHistory.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/entity/UserFlashcardHistory.java</code></p><p>Esta entidad registra el historial de cada usuario con cada flashcard:</p><pre><code>package com.dojo.content.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_flashcard_history",
    uniqueConstraints = {
        @UniqueConstraint(
            columnNames = {"userId", "flashcard_id"})
    })
public class UserFlashcardHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String userId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "flashcard_id", nullable = false)
    private Flashcard flashcard;  // Relación con Flashcard

    @Column(nullable = false)
    private int timesCorrect;   // Veces que acertó

    @Column(nullable = false)
    private int timesWrong;      // Veces que falló

    @Column(nullable = false)
    private int priority;         // 0-10 (más alto = más urgente)

    private LocalDateTime lastSeen;  // Última vez que la vio

    public UserFlashcardHistory() {}

    public UserFlashcardHistory(String userId, Flashcard flashcard) {
        this.userId = userId;
        this.flashcard = flashcard;
        this.timesCorrect = 0;
        this.timesWrong = 0;
        this.priority = 5;  // Prioridad inicial media
    }

    // Getters y setters de todos los campos...
}</code></pre><p><b>Novedades JPA:</b></p><ul><li><code>@ManyToOne(fetch = FetchType.LAZY)</code> — Relación muchos-a-uno con Flashcard. <b>LAZY</b> significa que la flashcard solo se carga de BD cuando accedes a ella (no al cargar el history). Esto mejora el rendimiento</li><li><code>@JoinColumn(name = "flashcard_id")</code> — La columna en la tabla que es foreign key hacia flashcards</li><li><code>@UniqueConstraint({"userId", "flashcard_id"})</code> — Un usuario solo tiene UN historial por flashcard (el mismo patrón que en BeltProgress)</li></ul>`,
      },
      {
        title: `3. Repository con Query personalizada`,
        content: `<p><b>Ruta</b>: <code>.../repository/UserFlashcardHistoryRepository.java</code></p><pre><code>package com.dojo.content.repository;

import com.dojo.content.entity.UserFlashcardHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.*;

public interface UserFlashcardHistoryRepository
        extends JpaRepository&lt;UserFlashcardHistory, Long&gt; {

    // Buscar historial de un usuario con una flashcard
    Optional&lt;UserFlashcardHistory&gt; findByUserIdAndFlashcardId(
        String userId, Long flashcardId);

    // Todo el historial de un usuario
    List&lt;UserFlashcardHistory&gt; findByUserId(String userId);

    // 🔑 La query clave: obtener historial ordenado por prioridad
    @Query("SELECT h FROM UserFlashcardHistory h "
         + "WHERE h.userId = :userId "
         + "AND h.flashcard.difficulty = :difficulty "
         + "ORDER BY h.priority DESC, h.lastSeen ASC")
    List&lt;UserFlashcardHistory&gt;
        findByUserIdAndDifficultyOrderByPriority(
            @Param("userId") String userId,
            @Param("difficulty") String difficulty);
}</code></pre><p><b>¿Por qué <code>@Query</code> en vez de Derived Query?</b></p><p>La última query necesita filtrar por un campo de la <b>relación</b> (<code>h.flashcard.difficulty</code>) y ordenar por dos campos. Esto es demasiado complejo para un Derived Query Method. Con <code>@Query</code> escribes JPQL directamente.</p><p><b>JPQL vs SQL</b>: JPQL usa nombres de <b>entidades y campos Java</b> (no tablas y columnas SQL). <code>UserFlashcardHistory</code> en vez de <code>user_flashcard_history</code>. Spring lo traduce a SQL automáticamente.</p><p><b>El ORDER BY:</b></p><ul><li><code>priority DESC</code> — Las de más prioridad primero (las que más fallas)</li><li><code>lastSeen ASC</code> — Si misma prioridad, la que hace más tiempo que no ves</li></ul>`,
      },
      {
        title: `4. Lógica en FlashcardService`,
        content: `<p>Dos métodos nuevos en <code>FlashcardService.java</code>:</p><p><b>findNextForUser()</b> — Decide el orden de las flashcards:</p><pre><code>public List&lt;Flashcard&gt; findNextForUser(
        String difficulty, String userId) {

    List&lt;Flashcard&gt; allFlashcards =
        flashcardRepository.findByDifficulty(difficulty);

    // Si no hay userId, devolver todas sin ordenar
    if (userId == null || userId.isBlank()) {
        return allFlashcards;
    }

    // Obtener historial ordenado por prioridad
    List&lt;UserFlashcardHistory&gt; history = historyRepository
        .findByUserIdAndDifficultyOrderByPriority(
            userId, difficulty);

    // Flashcards que el usuario YA ha visto
    Set&lt;Long&gt; seenIds = history.stream()
        .map(h -> h.getFlashcard().getId())
        .collect(Collectors.toSet());

    // 1. Primero las NO vistas (nuevas)
    List&lt;Flashcard&gt; unseen = allFlashcards.stream()
        .filter(f -> !seenIds.contains(f.getId()))
        .collect(Collectors.toList());

    // 2. Luego las vistas, ordenadas por prioridad
    List&lt;Flashcard&gt; seenSorted = history.stream()
        .map(UserFlashcardHistory::getFlashcard)
        .collect(Collectors.toList());

    // Combinar: nuevas primero, luego por prioridad
    List&lt;Flashcard&gt; result = new ArrayList&lt;&gt;(unseen);
    result.addAll(seenSorted);
    return result;
}</code></pre><p><b>recordFlashcardAnswer()</b> — Registra la respuesta y ajusta la prioridad:</p><pre><code>@Transactional
public UserFlashcardHistory recordFlashcardAnswer(
        Long flashcardId, String userId, boolean correct) {

    Flashcard flashcard = findById(flashcardId);

    // Buscar o crear historial
    UserFlashcardHistory history = historyRepository
        .findByUserIdAndFlashcardId(userId, flashcardId)
        .orElse(new UserFlashcardHistory(userId, flashcard));

    history.setLastSeen(LocalDateTime.now());

    if (correct) {
        history.setTimesCorrect(history.getTimesCorrect() + 1);
        // Bajar prioridad (mínimo 0)
        history.setPriority(
            Math.max(0, history.getPriority() - 1));
    } else {
        history.setTimesWrong(history.getTimesWrong() + 1);
        // Subir prioridad (máximo 10)
        history.setPriority(
            Math.min(10, history.getPriority() + 2));
    }

    return historyRepository.save(history);
}</code></pre>`,
      },
      {
        title: `5. Endpoints en FlashcardController`,
        content: `<p>Dos endpoints nuevos en <code>FlashcardController.java</code>:</p><pre><code>// Flashcards priorizadas para un usuario
// GET /flashcards/next?difficulty=BLANCO&userId=berto
@GetMapping("/next")
public ResponseEntity&lt;List&lt;Flashcard&gt;&gt; getNext(
        @RequestParam String difficulty,
        @RequestParam(required = false) String userId) {
    return ResponseEntity.ok(
        flashcardService.findNextForUser(difficulty, userId));
}

// Registrar respuesta de un usuario a una flashcard
// POST /flashcards/5/answer?userId=berto&correct=true
@PostMapping("/{id}/answer")
public ResponseEntity&lt;Map&lt;String, Object&gt;&gt; recordAnswer(
        @PathVariable Long id,
        @RequestParam String userId,
        @RequestParam boolean correct) {
    UserFlashcardHistory history =
        flashcardService.recordFlashcardAnswer(
            id, userId, correct);
    return ResponseEntity.ok(Map.of(
        "flashcardId", id,
        "priority", history.getPriority(),
        "timesCorrect", history.getTimesCorrect(),
        "timesWrong", history.getTimesWrong()));
}</code></pre><table class='table table-sm table-dark'><thead><tr><th>Endpoint</th><th>Qué hace</th></tr></thead><tbody><tr><td><code>GET /flashcards/next?difficulty=BLANCO&amp;userId=berto</code></td><td>Devuelve flashcards ordenadas: nuevas primero, luego las que más fallas</td></tr><tr><td><code>POST /flashcards/5/answer?userId=berto&amp;correct=false</code></td><td>Registra que el usuario falló la flashcard 5 → sube prioridad a 7</td></tr></tbody></table>`,
      },
      {
        title: `6. Cómo se conecta con el frontend`,
        content: `<p>El <code>StudyController</code> del frontend (capítulo 8) ya usa estos endpoints:</p><pre><code>// En GET /study:
// Pide flashcards priorizadas
restTemplate.exchange(
    gatewayUrl + "/api/content/flashcards/next"
    + "?difficulty=" + difficulty
    + "&userId=" + username, ...);

// En POST /study/answer:
// Registra la respuesta
restTemplate.exchange(
    gatewayUrl + "/api/content/flashcards/"
    + flashcardId + "/answer?userId=" + username
    + "&correct=" + correct, ...);</code></pre><p>Así cuando el usuario estudia:</p><ol><li>Entra a Study → frontend pide <code>/flashcards/next</code> → ve las que más necesita repasar</li><li>Responde "Lo sabía" → prioridad baja → la próxima vez aparece más abajo</li><li>Responde "No lo sabía" → prioridad sube → la próxima vez aparece arriba</li></ol>`,
      },
      {
        title: `7. Ejemplo de evolución de prioridades`,
        content: `<pre><code>Flashcard: "¿Qué es @Autowired?"
Usuario: berto

Intento 1: ❌ No lo sabía  → prioridad: 5 → 7
Intento 2: ❌ No lo sabía  → prioridad: 7 → 9
Intento 3: ✅ Lo sabía     → prioridad: 9 → 8
Intento 4: ✅ Lo sabía     → prioridad: 8 → 7
Intento 5: ✅ Lo sabía     → prioridad: 7 → 6
...
Intento 10: ✅ Lo sabía    → prioridad: 2 → 1

Flashcard: "¿Qué es Spring Boot?"
Intento 1: ✅ Lo sabía     → prioridad: 5 → 4
Intento 2: ✅ Lo sabía     → prioridad: 4 → 3

Orden de aparición:
  1. Flashcards nuevas (no vistas)
  2. "¿Qué es @Autowired?" (prioridad 1)
  3. ... (otras flashcards con prioridad &gt; 0)
  Nota: aunque @Autowired tiene prioridad 1,
  antes iba con 9 — el sistema se autocorrige</code></pre>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Las flashcards siempre aparecen en el mismo orden</td><td><code>userId</code> no se está pasando en la petición</td><td>Sin userId, el endpoint devuelve todas sin ordenar. Verifica que el frontend envía <code>&amp;userId=username</code></td></tr><tr><td><code>LazyInitializationException</code></td><td>Acceder a <code>history.getFlashcard()</code> fuera de una transacción</td><td>Usa <code>@Transactional</code> en el Service o cambia a <code>FetchType.EAGER</code> (no recomendado para listas grandes)</td></tr><tr><td>La prioridad no cambia</td><td>El endpoint <code>/answer</code> no se llama correctamente</td><td>Revisa en la consola de content-service que se ejecuta el INSERT/UPDATE en <code>user_flashcard_history</code></td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>Spaced Repetition</b> — Técnica de aprendizaje basada en el "efecto de espaciado": repasas más lo que no sabes y menos lo que ya dominas. Anki, Quizlet y Duolingo lo usan</li><li><b>@ManyToOne / @OneToMany</b> — Relaciones JPA. ManyToOne = muchos historiales apuntan a una flashcard. LAZY loading = no cargar la relación hasta que se acceda</li><li><b>@Query (JPQL)</b> — Cuando los Derived Query Methods no son suficientes, escribes JPQL directamente. Usa nombres de entidades Java, no tablas SQL</li><li><b>Math.max / Math.min</b> — Patrón simple para acotar valores: <code>Math.max(0, x)</code> asegura que nunca baje de 0, <code>Math.min(10, x)</code> asegura que nunca suba de 10</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ <code>UserFlashcardHistory.java</code> creada en content-service/entity/</li><li>☐ <code>UserFlashcardHistoryRepository.java</code> con @Query personalizada</li><li>☐ <code>findNextForUser()</code> en FlashcardService</li><li>☐ <code>recordFlashcardAnswer()</code> en FlashcardService</li><li>☐ Endpoints <code>/flashcards/next</code> y <code>/flashcards/{id}/answer</code></li><li>☐ El modo Study prioriza flashcards que fallas</li><li>☐ Commit: <code>git commit -m "Add spaced repetition for flashcards"</code></li></ul><p>¡Repetición espaciada funcionando! 🧠 Ahora vamos con el <b>Sistema de Cinturones</b> — desbloqueo progresivo basado en tu progreso. 🥋</p>`,
      },
    ],
  },
  {
    id: 12,
    title: "Sistema de Cinturones",
    intro: `Los cinturones dan estructura al aprendizaje: empiezas por el Blanco (fundamentos) y vas subiendo hasta el Negro (arquitectura avanzada). Cada cinturón se desbloquea cuando dominas el anterior. Este sistema se implementa conectando el Progress Service con el Dashboard del frontend.`,
    sections: [
      {
        title: `1. Los 6 cinturones`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Cinturón</th><th>Código</th><th>Temas</th><th>Requisito</th></tr></thead><tbody><tr><td>⬜ Blanco</td><td>BLANCO</td><td>Fundamentos Spring, IoC, DI, beans</td><td>Siempre desbloqueado</td></tr><tr><td>🟡 Amarillo</td><td>AMARILLO</td><td>REST APIs, controllers, HTTP</td><td>Dominar Blanco</td></tr><tr><td>🟠 Naranja</td><td>NARANJA</td><td>JPA, base de datos, entidades</td><td>Dominar Amarillo</td></tr><tr><td>🟢 Verde</td><td>VERDE</td><td>Security, JWT, autenticación</td><td>Dominar Naranja</td></tr><tr><td>🟤 Marrón</td><td>MARRON</td><td>Microservicios, Eureka, Gateway</td><td>Dominar Verde</td></tr><tr><td>⬛ Negro</td><td>NEGRO</td><td>Docker, testing, arquitectura avanzada</td><td>Dominar Marrón</td></tr></tbody></table><p><b>"Dominar"</b> = ≥80% de acierto con mínimo 10 intentos en ese cinturón (lo calculamos en Progress Service).</p>`,
      },
      {
        title: `2. Lógica de desbloqueo en el DashboardController`,
        content: `<p>El desbloqueo se calcula en el <b>frontend</b>, no en el backend. ¿Por qué? Porque es solo lógica de visualización — qué botones mostrar y cuáles desactivar. Los datos vienen del Progress Service.</p><pre><code>// En DashboardController.java

// Orden de cinturones (array constante)
private static final String[] BELT_ORDER =
    {"BLANCO","AMARILLO","NARANJA","VERDE","MARRON","NEGRO"};

// Después de obtener el progreso del Progress Service:
Map&lt;String, Boolean&gt; unlockedMap = new LinkedHashMap&lt;&gt;();
Map&lt;String, Boolean&gt; masteredMap = new LinkedHashMap&lt;&gt;();
Map&lt;String, Integer&gt; percentageMap = new LinkedHashMap&lt;&gt;();

boolean previousMastered = true; // BLANCO siempre desbloqueado

for (String beltCode : BELT_ORDER) {
    // Un cinturón se desbloquea si el anterior está dominado
    boolean unlocked = previousMastered;
    unlockedMap.put(beltCode, unlocked);

    // Obtener datos del Progress Service
    Map&lt;String, Object&gt; bp = beltProgressMap.get(beltCode);
    boolean mastered = false;
    int percentage = 0;

    if (bp != null) {
        int correctCount =
            ((Number) bp.getOrDefault("correctCount", 0))
            .intValue();
        int attemptCount =
            ((Number) bp.getOrDefault("attemptCount", 0))
            .intValue();
        mastered = bp.get("mastered") != null
            && (Boolean) bp.get("mastered");
        percentage = attemptCount > 0
            ? (correctCount * 100) / attemptCount : 0;
    }

    masteredMap.put(beltCode, mastered);
    percentageMap.put(beltCode, percentage);

    // Para el siguiente cinturón
    previousMastered = mastered;
}

model.addAttribute("unlockedMap", unlockedMap);
model.addAttribute("masteredMap", masteredMap);
model.addAttribute("percentageMap", percentageMap);</code></pre><p><b>La clave es <code>previousMastered</code>:</b> arranca en <code>true</code> (Blanco siempre desbloqueado), y para cada cinturón siguiente, solo se desbloquea si el anterior está dominado. Es un recorrido lineal del array de cinturones.</p>`,
      },
      {
        title: `3. Cómo se obtienen los datos del Progress Service`,
        content: `<p>El DashboardController llama al Gateway para obtener el progreso:</p><pre><code>// Llamar al Progress Service vía Gateway
try {
    var response = restTemplate.exchange(
        gatewayUrl + "/api/progress/" + username,
        HttpMethod.GET, entity,
        new ParameterizedTypeReference
            &lt;Map&lt;String, Object&gt;&gt;() {});

    Map&lt;String, Object&gt; progressData = response.getBody();

    // progressData contiene:
    // {
    //   "userProgress": {
    //     "totalCorrect": 45,
    //     "totalAttempted": 60,
    //     "currentStreak": 3,
    //     "bestStreak": 5
    //   },
    //   "beltProgress": [
    //     {"beltLevel":"BLANCO","correctCount":20,
    //      "attemptCount":22,"mastered":true},
    //     {"beltLevel":"AMARILLO","correctCount":5,
    //      "attemptCount":8,"mastered":false}
    //   ]
    // }

} catch (Exception ignored) {
    // Si Progress Service no está disponible,
    // todo queda en 0 — el dashboard funciona igual
}</code></pre><p>📌 El <code>catch</code> vacío es intencional: si Progress Service está caído, el Dashboard muestra todo en 0 pero sigue funcionando. No es crítico.</p>`,
      },
      {
        title: `4. Renderizado en dashboard.html`,
        content: `<p>Cada tarjeta de cinturón usa las 3 maps para mostrar el estado:</p><pre><code>&lt;div th:each="belt : \${belts}" class="col-md-4"&gt;
  &lt;div class="card belt-card"
    th:with="
      beltUnlocked=\${unlockedMap != null
        ? unlockedMap.getOrDefault(belt[0], true) : true},
      beltMastered=\${masteredMap != null
        ? masteredMap.getOrDefault(belt[0], false) : false},
      beltPct=\${percentageMap != null
        ? percentageMap.getOrDefault(belt[0], 0) : 0}"
    th:classappend="\${!beltUnlocked} ? ' opacity-50' : ''"&gt;

    &lt;!-- Badge: ⭐ Mastered o 🔒 Locked --&gt;
    &lt;span th:if="\${beltMastered}"
      class="badge bg-success"&gt;
      ⭐ Mastered&lt;/span&gt;
    &lt;span th:if="\${!beltUnlocked}"
      class="badge bg-secondary"&gt;
      🔒 Locked&lt;/span&gt;

    &lt;!-- Barra de progreso --&gt;
    &lt;div class="progress"&gt;
      &lt;div class="progress-bar"
        th:classappend="\${beltMastered} ? 'bg-success'
          : (\${beltPct >= 50} ? 'bg-warning' : 'bg-primary')"
        th:style="'width: ' + \${beltPct} + '%'"&gt;
      &lt;/div&gt;
    &lt;/div&gt;

    &lt;!-- Botones: Study + Quiz o Locked --&gt;
    &lt;div th:if="\${beltUnlocked}"&gt;
      &lt;a th:href="@{/study(difficulty=\${belt[0]})}"&gt;Study&lt;/a&gt;
      &lt;a th:href="@{/quiz(difficulty=\${belt[0]})}"&gt;Quiz&lt;/a&gt;
    &lt;/div&gt;
    &lt;div th:unless="\${beltUnlocked}"&gt;
      &lt;button disabled&gt;🔒 Master previous belt&lt;/button&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre><p><b>Thymeleaf: <code>th:with</code></b> — Crea variables locales dentro de un elemento. Así no repites <code>unlockedMap.getOrDefault(belt[0], true)</code> en cada uso.</p><p><b>Colores de la barra:</b></p><ul><li>Dominado (mastered) → <span style='color:#198754'><b>Verde</b></span></li><li>≥50% → <span style='color:#ffc107'><b>Amarillo</b></span> (warning)</li><li>&lt;50% → <span style='color:#0d6efd'><b>Azul</b></span> (primary)</li></ul>`,
      },
      {
        title: `5. El flujo completo de progresión`,
        content: `<pre><code>1. Usuario nuevo → todo en 0
   BLANCO: 🔓 desbloqueado (siempre)
   AMARILLO → NEGRO: 🔒 bloqueados

2. Estudia flashcards BLANCO, hace quizzes
   → Progress Service registra cada respuesta
   → BeltProgress BLANCO: correctCount=15, attemptCount=18
   → percentage = 83% → mastered = true ✅

3. Refresca el Dashboard
   → Frontend pide GET /api/progress/berto
   → Calcula: BLANCO mastered → AMARILLO se desbloquea 🔓
   → AMARILLO aparece con botones activos

4. Estudia AMARILLO...
   → Cuando mastered=true → NARANJA se desbloquea
   → Y así hasta NEGRO

5. Todos mastered → ¡Cinturón Negro! 🥋⬛</code></pre>`,
      },
      {
        title: `6. Integración: todas las piezas juntas`,
        content: `<p>El sistema de cinturones conecta <b>3 servicios</b>:</p><pre><code>┌─────────────────┐
│ Content Service  │  Tiene las flashcards/quizzes
│ (:8083)          │  por cinturón (difficulty)
└────────┬────────┘
         │
         │ Flashcards del cinturón X
         │
┌────────▼────────┐
│ Frontend (:8090) │  Muestra tarjetas, calcula
│                  │  desbloqueo, renderiza UI
└────────┬────────┘
         │
         │ Registra respuesta + pide progreso
         │
┌────────▼────────┐
│ Progress Service │  Calcula mastered (80%/10+)
│ (:8084)          │  Guarda racha, aciertos
└─────────────────┘</code></pre><p>Cada servicio hace una cosa. Ninguno sabe de los otros directamente — se comunican a través del Gateway.</p>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>Todos los cinturones desbloqueados</td><td>Progress Service no está corriendo → todo fallback a defaults</td><td>Arranca progress-service. Sin él, <code>unlockedMap</code> no se llena y todo queda desbloqueado por defecto</td></tr><tr><td>Barra de progreso siempre en 0%</td><td>Las respuestas no se registran en progress-service</td><td>Verifica que Study y Quiz llaman a <code>POST /api/progress/record</code></td></tr><tr><td>Cinturón no se desbloquea con 80%</td><td>Menos de 10 intentos</td><td>Necesitas ≥10 intentos. Haz más quizzes o estudia más flashcards de ese cinturón</td></tr><tr><td><code>ClassCastException</code> en <code>(Boolean) bp.get("mastered")</code></td><td>El JSON devuelve mastered como String en vez de boolean</td><td>Usa <code>Boolean.valueOf(bp.get("mastered").toString())</code> como defensa</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>Gamificación</b> — Aplicar mecánicas de juego (progresión, desbloqueo, rachas) al aprendizaje. Mejora la motivación y retención</li><li><b>LinkedHashMap</b> — Un HashMap que mantiene el <b>orden de inserción</b>. Importante aquí porque los cinturones deben estar en orden (Blanco→Negro)</li><li><b>Separación de responsabilidades</b> — Content Service no sabe nada de progreso. Progress Service no sabe nada de flashcards. El frontend orquesta ambos</li><li><b>Graceful degradation</b> — Si Progress Service cae, el Dashboard sigue funcionando (con todo en 0). Esto es un patrón de resiliencia en microservicios</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ DashboardController calcula unlockedMap, masteredMap, percentageMap</li><li>☐ dashboard.html muestra badges (Mastered/Locked) y barras de progreso</li><li>☐ Cinturones bloqueados tienen opacity-50 y botón desactivado</li><li>☐ BLANCO siempre desbloqueado</li><li>☐ Con ≥80% y ≥10 intentos en un cinturón → se marca mastered → siguiente se desbloquea</li><li>☐ Si Progress Service está caído → Dashboard funciona con defaults</li><li>☐ Commit: <code>git commit -m "Add belt unlock system"</code></li></ul><p>¡Sistema de cinturones completo! 🥋 Ahora vamos con los <b>Ejercicios de Código</b> — para practicar escribiendo Java directamente en la app. 💻</p>`,
      },
    ],
  },
  {
    id: 13,
    title: "Ejercicios de Código",
    intro: `Los ejercicios de código van un paso más allá de las flashcards y quizzes: el usuario escribe Java directamente en un editor dentro de la app. No se ejecuta el código (no hay sandbox Java en el backend), pero se valida que contenga las keywords necesarias. Es una forma simple pero efectiva de practicar.`,
    sections: [
      {
        title: `1. ¿Cómo funciona la validación?`,
        content: `<p>La validación es por <b>keywords</b> (palabras clave), no por ejecución:</p><pre><code>Ejercicio: "Crea un controller REST"
Keywords requeridas: @RestController, @GetMapping, ResponseEntity

El usuario escribe:
  @RestController
  public class MyController {
      @GetMapping("/hello")
      public ResponseEntity&lt;String&gt; hello() {
          return ResponseEntity.ok("Hello");
      }
  }

Validación:
  ✅ @RestController → encontrado
  ✅ @GetMapping     → encontrado
  ✅ ResponseEntity  → encontrado
  → Resultado: PASSED (100%)</code></pre><p><b>¿Por qué no ejecutar el código?</b></p><ul><li>Ejecutar Java requiere un sandbox seguro (compilador, JVM aislada) — complejidad enorme</li><li>La validación por keywords verifica que el usuario sabe <b>qué anotaciones y clases usar</b></li><li>Para un proyecto de aprendizaje es más que suficiente</li><li>Plataformas como HackerRank/LeetCode sí ejecutan código, pero tienen infraestructura dedicada</li></ul>`,
      },
      {
        title: `2. Entity: CodeExercise.java`,
        content: `<p><b>Ruta</b>: <code>content-service/src/main/java/com/dojo/content/entity/CodeExercise.java</code></p><pre><code>@Entity
@Table(name = "code_exercises")
public class CodeExercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;        // "Crea un Controller REST"

    @Column(nullable = false, length = 2000)
    private String description;   // Enunciado detallado

    @Column(nullable = false)
    private String belt;           // BLANCO, AMARILLO...

    @Column(nullable = false, length = 3000)
    private String starterCode;    // Código inicial (plantilla)

    @Column(nullable = false, length = 3000)
    private String solution;       // Solución completa

    @Column(nullable = false, length = 1000)
    private String requiredKeywords;  // "@RestController,@GetMapping,ResponseEntity"

    @Column(length = 1000)
    private String hints;          // Pistas para el usuario

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    // Constructor vacío + constructor completo + getters/setters
}</code></pre><p><b>Campos clave:</b></p><ul><li><code>starterCode</code> — El código que aparece en el editor al abrir el ejercicio (plantilla con huecos)</li><li><code>solution</code> — La solución completa (se puede mostrar al pulsar "Ver solución")</li><li><code>requiredKeywords</code> — String separado por comas: <code>"@RestController,@GetMapping,ResponseEntity"</code>. El validador busca que el código del usuario contenga TODAS estas palabras</li><li><code>hints</code> — Pistas que se muestran al pulsar "Pistas" (ocultas por defecto)</li></ul>`,
      },
      {
        title: `3. CodeExerciseService — La validación`,
        content: `<p><b>Ruta</b>: <code>.../service/CodeExerciseService.java</code></p><pre><code>@Service
public class CodeExerciseService {

    private final CodeExerciseRepository repository;

    // Constructor...

    public Map&lt;String, Object&gt; validateCode(
            Long id, String userCode) {

        CodeExercise exercise = findById(id);

        // Dividir keywords por coma
        String[] keywords = exercise
            .getRequiredKeywords().split(",");

        List&lt;String&gt; missing = new ArrayList&lt;&gt;();
        List&lt;String&gt; found = new ArrayList&lt;&gt;();

        for (String keyword : keywords) {
            String kw = keyword.trim();
            if (userCode.contains(kw)) {
                found.add(kw);
            } else {
                missing.add(kw);
            }
        }

        boolean passed = missing.isEmpty();
        int score = keywords.length > 0
            ? (found.size() * 100) / keywords.length : 0;

        Map&lt;String, Object&gt; result = new LinkedHashMap&lt;&gt;();
        result.put("passed", passed);
        result.put("score", score);
        result.put("foundKeywords", found);
        result.put("missingKeywords", missing);
        result.put("message", passed
            ? "¡Correcto! Tu código contiene todos "
            + "los elementos necesarios. 🥋"
            : "Faltan algunos elementos clave. "
            + "Revisa las pistas e inténtalo de nuevo.");

        return result;
    }
}</code></pre><p>La validación es sencilla: para cada keyword, comprueba si está en el código con <code>String.contains()</code>. Si faltan → devuelve cuáles faltan. Si están todas → 100%.</p>`,
      },
      {
        title: `4. CodeExerciseController`,
        content: `<p><b>Ruta</b>: <code>.../controller/CodeExerciseController.java</code></p><pre><code>@RestController
@RequestMapping("/exercises")
public class CodeExerciseController {

    private final CodeExerciseService service;

    // Constructor...

    @GetMapping
    public ResponseEntity&lt;List&lt;CodeExercise&gt;&gt; getAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity&lt;CodeExercise&gt; getById(
            @PathVariable Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/belt/{belt}")
    public ResponseEntity&lt;List&lt;CodeExercise&gt;&gt; getByBelt(
            @PathVariable String belt) {
        return ResponseEntity.ok(service.findByBelt(belt));
    }

    // 🔑 Validar código del usuario
    @PostMapping("/{id}/validate")
    public ResponseEntity&lt;Map&lt;String, Object&gt;&gt; validate(
            @PathVariable Long id,
            @RequestBody Map&lt;String, String&gt; body) {
        String userCode = body.getOrDefault("code", "");
        return ResponseEntity.ok(
            service.validateCode(id, userCode));
    }
}</code></pre><table class='table table-sm table-dark'><thead><tr><th>Endpoint</th><th>Qué hace</th></tr></thead><tbody><tr><td><code>GET /exercises</code></td><td>Listar todos los ejercicios</td></tr><tr><td><code>GET /exercises/5</code></td><td>Un ejercicio por ID</td></tr><tr><td><code>GET /exercises/belt/BLANCO</code></td><td>Ejercicios de un cinturón</td></tr><tr><td><code>POST /exercises/5/validate</code></td><td>Validar código → devuelve passed, score, missing</td></tr></tbody></table><p>📌 La ruta del Gateway para ejercicios es <code>/api/exercises/**</code> con StripPrefix=1, así que <code>/api/exercises/5/validate</code> llega a content-service como <code>/exercises/5/validate</code>.</p>`,
      },
      {
        title: `5. Frontend — exercises.html (listado)`,
        content: `<p>La página de listado muestra los ejercicios agrupados por cinturón:</p><pre><code>&lt;!-- Agrupados por cinturón --&gt;
&lt;div th:each="entry : \${exercisesByBelt}" class="mb-4"&gt;

  &lt;!-- Badge del cinturón con color --&gt;
  &lt;h4&gt;
    &lt;span th:switch="\${entry.key}"&gt;
      &lt;span th:case="'BLANCO'" class="badge"
          style="background:#f0f0f0;color:#333"&gt;
          ⬜ Blanco&lt;/span&gt;
      &lt;!-- ... otros cinturones --&gt;
    &lt;/span&gt;
  &lt;/h4&gt;

  &lt;!-- Tarjetas de ejercicios --&gt;
  &lt;div th:each="ex : \${entry.value}" class="col-md-4"&gt;
    &lt;div class="card bg-secondary text-light"&gt;
      &lt;h5 th:text="\${ex['title']}"&gt;Título&lt;/h5&gt;
      &lt;p th:text="\${#strings.abbreviate(
          ex['description'], 120)}"&gt;Desc&lt;/p&gt;
      &lt;a th:href="@{/exercises/{id}(id=\${ex['id']})}"&gt;
        Resolver
      &lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre><p><code>#strings.abbreviate(text, 120)</code> — Función de Thymeleaf que trunca el texto a 120 caracteres con "...".</p><p><code>th:switch / th:case</code> — Thymeleaf switch-case para asignar colores por cinturón.</p>`,
      },
      {
        title: `6. Frontend — exercise-detail.html (editor)`,
        content: `<p>La página de detalle es la más interactiva del proyecto:</p><pre><code>&lt;!-- Editor de código --&gt;
&lt;form th:action="@{/exercises/{id}/validate(
    id=\${exercise['id']})}" method="post"&gt;

  &lt;textarea name="code"
    class="form-control bg-dark text-success"
    rows="14"
    style="font-family:'Courier New',monospace;
           font-size:14px;tab-size:4;"
    th:text="\${userCode != null
        ? userCode : exercise['starterCode']}"
    spellcheck="false"&gt;&lt;/textarea&gt;

  &lt;button type="submit" class="btn btn-warning"&gt;
    ✅ Validar
  &lt;/button&gt;
  &lt;button onclick="toggle('hints')"&gt;
    💡 Pistas
  &lt;/button&gt;
  &lt;button onclick="toggle('solution')"&gt;
    👁 Ver solución
  &lt;/button&gt;
&lt;/form&gt;

&lt;!-- Pistas (ocultas por defecto) --&gt;
&lt;div id="hints" class="d-none alert alert-info"&gt;
  &lt;p th:text="\${exercise['hints']}"&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;!-- Solución (oculta por defecto) --&gt;
&lt;div id="solution" class="d-none"&gt;
  &lt;pre th:text="\${exercise['solution']}"&gt;&lt;/pre&gt;
&lt;/div&gt;</code></pre><p>El editor es un simple <code>&lt;textarea&gt;</code> con estilo monospace y fondo oscuro. No es un IDE completo (sin syntax highlighting), pero cumple su función.</p><p><b>Resultado de la validación</b> (panel lateral):</p><pre><code>&lt;!-- Panel de resultado (verde si passed, rojo si no) --&gt;
&lt;div th:if="\${result}"
     th:classappend="\${result['passed']}
         ? 'bg-success' : 'bg-danger'"&gt;
  &lt;h5 th:text="\${result['passed']}
      ? '✅ ¡Correcto!' : '❌ Incorrecto'"&gt;&lt;/h5&gt;
  &lt;p th:text="\${result['message']}"&gt;&lt;/p&gt;
  &lt;p&gt;Puntuación: &lt;span th:text="\${result['score']}
      + '%'"&gt;&lt;/span&gt;&lt;/p&gt;

  &lt;!-- Keywords que faltan --&gt;
  &lt;div th:if="\${!result['missingKeywords'].isEmpty()}"&gt;
    &lt;strong&gt;Te falta:&lt;/strong&gt;
    &lt;ul&gt;
      &lt;li th:each="kw : \${result['missingKeywords']}"&gt;
        &lt;code th:text="\${kw}"&gt;&lt;/code&gt;
      &lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre><p>Si fallas, te dice <b>exactamente qué keywords te faltan</b> — así sabes qué añadir.</p>`,
      },
      {
        title: `7. Datos iniciales en el DataSeeder`,
        content: `<p>Añade ejercicios al <code>DataSeeder</code> de content-service:</p><pre><code>@Bean
CommandLineRunner seedExercises(CodeExerciseRepository repo) {
    return args -> {
        if (repo.count() == 0) {
            repo.saveAll(List.of(
                new CodeExercise(
                    "Crea un Controller REST",
                    "Crea un controlador REST que tenga "
                    + "un endpoint GET en /hello que "
                    + "devuelva un ResponseEntity con "
                    + "un saludo.",
                    "BLANCO",
                    // Starter code (plantilla)
                    "// Añade la anotación del controller\\n"
                    + "public class HelloController {\\n"
                    + "    // Añade el endpoint GET\\n"
                    + "    public ??? hello() {\\n"
                    + "        // Devuelve un saludo\\n"
                    + "    }\\n"
                    + "}",
                    // Solución
                    "@RestController\\n"
                    + "public class HelloController {\\n"
                    + "    @GetMapping(\\"/hello\\")\\n"
                    + "    public ResponseEntity&lt;String&gt; "
                    + "hello() {\\n"
                    + "        return ResponseEntity"
                    + ".ok(\\"Hello World!\\");\\n"
                    + "    }\\n"
                    + "}",
                    // Keywords requeridas
                    "@RestController,@GetMapping,"
                    + "ResponseEntity",
                    // Pistas
                    "Usa @RestController para la clase. "
                    + "@GetMapping para el endpoint. "
                    + "ResponseEntity.ok() para la respuesta."
                )
                // ... más ejercicios por cinturón
            ));
        }
    };
}</code></pre>`,
      },
      {
        title: `⚠️ Errores comunes`,
        content: `<table class='table table-sm table-dark'><thead><tr><th>Error</th><th>Causa</th><th>Solución</th></tr></thead><tbody><tr><td>El editor no muestra el starterCode</td><td>El campo <code>starterCode</code> tiene caracteres especiales no escapados</td><td>Usa <code>th:text</code> en el textarea (no <code>th:value</code>). Thymeleaf escapa HTML automáticamente</td></tr><tr><td>Validación siempre falla</td><td>Las keywords tienen espacios extra (del <code>.split(",")</code>)</td><td>Usa <code>keyword.trim()</code> después del split para eliminar espacios</td></tr><tr><td>El código del usuario se pierde al validar</td><td>No se devuelve el <code>userCode</code> al template después del POST</td><td>En el controller, haz <code>model.addAttribute("userCode", code)</code> para mantener lo que escribió</td></tr><tr><td>Tab no funciona en el textarea</td><td>Por defecto Tab cambia el foco del campo</td><td>Añade JavaScript para capturar Tab e insertar espacios/tabs. O usa <code>tab-size: 4</code> en CSS</td></tr></tbody></table>`,
      },
      {
        title: `💡 Conceptos para la entrevista`,
        content: `<ul><li><b>Validación estática vs dinámica</b> — Estática = buscar patrones en texto (lo que hacemos). Dinámica = compilar y ejecutar. Estática es más segura y simple</li><li><b>String.contains()</b> — Case-sensitive. Si quisieras case-insensitive: <code>userCode.toLowerCase().contains(kw.toLowerCase())</code></li><li><b>@RequestBody Map</b> — Puedes recibir JSON como <code>Map&lt;String, String&gt;</code> en vez de crear un DTO dedicado. Útil para endpoints simples con pocos campos</li><li><b>Mejoras posibles</b> — Syntax highlighting (CodeMirror/Monaco editor), ejecución real en sandbox Docker, tests unitarios como validación</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ <code>CodeExercise.java</code> en content-service</li><li>☐ <code>CodeExerciseRepository.java</code></li><li>☐ <code>CodeExerciseService.java</code> con <code>validateCode()</code></li><li>☐ <code>CodeExerciseController.java</code> con 4 endpoints</li><li>☐ DataSeeder carga ejercicios de ejemplo</li><li>☐ Frontend: <code>exercises.html</code> (listado) + <code>exercise-detail.html</code> (editor)</li><li>☐ Puedes escribir código y validar → feedback con keywords</li><li>☐ Commit: <code>git commit -m "Add code exercises with validation"</code></li></ul><p>¡Ejercicios de código listos! 💻 Ahora algo meta: la <b>Guía Integrada</b> — esta misma guía dentro de la app. 📖</p>`,
      },
    ],
  },
  {
    id: 14,
    title: "Guía Integrada (esta guía)",
    intro: `Sí, esta guía que estás leyendo ahora mismo está dentro de la propia aplicación. Es un capítulo meta: vamos a documentar cómo se construyó el sistema de la guía. Así si en el futuro quieres añadir capítulos o modificar contenido, sabes exactamente cómo hacerlo.`,
    sections: [
      {
        title: `1. Arquitectura de la guía`,
        content: `<p>La guía NO usa archivos markdown ni base de datos — todo el contenido está <b>en código Java</b>:</p><pre><code>controller/
├── GuiaController.java          ← Routing + carga de pasos
└── guia/
    ├── GuiaHelper.java           ← Métodos crearPaso() y section()
    ├── GuiaCapitulo01.java       ← Preparación
    ├── GuiaCapitulo02.java       ← Estructura
    ├── ...
    └── GuiaCapitulo16.java       ← Arranque

templates/
└── guia.html                     ← Template que renderiza</code></pre><p><b>¿Por qué en Java y no en markdown o BD?</b></p><ul><li>Un solo JAR con todo — no necesitas archivos externos</li><li>Se compila — si hay errores de sintaxis, los detectas al compilar</li><li>Fácil de refactorizar con IntelliJ (buscar, reemplazar, renombrar)</li><li>La desventaja: editar HTML dentro de strings Java es verboso. Pero funciona</li></ul>`,
      },
      {
        title: `2. GuiaController.java (57 líneas)`,
        content: `<p>El controller es minimalista — solo carga los pasos y los pasa al template:</p><pre><code>@Controller
public class GuiaController {

    private static final List&lt;Map&lt;String, Object&gt;&gt;
        PASOS = new ArrayList&lt;&gt;();

    static {
        PASOS.add(GuiaCapitulo01.getPaso());
        PASOS.add(GuiaCapitulo02.getPaso());
        // ... hasta GuiaCapitulo16
    }

    @GetMapping("/guia")
    public String guia(HttpSession session, Model model,
            @RequestParam(defaultValue = "0") int paso) {

        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        model.addAttribute("pasos", PASOS);
        model.addAttribute("pasoActual", paso);
        model.addAttribute("totalPasos", PASOS.size());

        if (paso >= 0 && paso < PASOS.size()) {
            model.addAttribute("detalle", PASOS.get(paso));
        }

        return "guia";
    }
}</code></pre><p>URL: <code>/guia?paso=0</code> (0-indexed). Sin parámetro → paso 0 (primer capítulo).</p>`,
      },
      {
        title: `3. GuiaHelper.java — Utilidades`,
        content: `<pre><code>public class GuiaHelper {

    // Crea un paso completo
    public static Map&lt;String, Object&gt; crearPaso(
            int num, String title, String icon,
            String intro,
            List&lt;Map&lt;String, String&gt;&gt; sections) {
        Map&lt;String, Object&gt; paso = new LinkedHashMap&lt;&gt;();
        paso.put("num", num);
        paso.put("title", title);
        paso.put("icon", icon);
        paso.put("intro", intro);
        paso.put("sections", sections);
        return paso;
    }

    // Crea una sección dentro de un paso
    public static Map&lt;String, String&gt; section(
            String title, String content) {
        Map&lt;String, String&gt; s = new LinkedHashMap&lt;&gt;();
        s.put("title", title);
        s.put("content", content);
        return s;
    }
}</code></pre><p>Dos métodos estáticos que se importan con <code>import static</code> en cada capítulo.</p>`,
      },
      {
        title: `4. Estructura de un capítulo`,
        content: `<p>Cada capítulo (<code>GuiaCapituloXX.java</code>) sigue este patrón:</p><pre><code>package com.dojo.frontend.controller.guia;

import java.util.*;
import static com.dojo.frontend.controller.guia
    .GuiaHelper.*;

public class GuiaCapitulo01 {

    public static Map&lt;String, Object&gt; getPaso() {
        return crearPaso(
            1,                           // Número
            "Título del Capítulo",      // Título
            "bi-tools",                 // Icono Bootstrap
            "Texto de introducción...", // Intro
            List.of(
                section("1. Sección",
                    "&lt;p&gt;HTML aquí&lt;/p&gt;"),
                section("2. Otra sección",
                    "&lt;pre&gt;&lt;code&gt;código&lt;/code&gt;&lt;/pre&gt;")
            ));
    }
}</code></pre><p><b>Reglas del contenido HTML:</b></p><ul><li>Se renderiza con <code>th:utext</code> → acepta HTML crudo</li><li>Código: <code>&lt;pre&gt;&lt;code&gt;...&lt;/code&gt;&lt;/pre&gt;</code></li><li>Listas: <code>&lt;ul&gt;&lt;li&gt;...&lt;/li&gt;&lt;/ul&gt;</code></li><li>Tablas: <code>&lt;table class='table table-sm table-dark'&gt;</code></li><li>Escapar <code>&lt;</code> y <code>&gt;</code> en código Java/XML: usar <code>&amp;lt;</code> y <code>&amp;gt;</code></li><li>Comillas en Java strings: escapar con <code>\\"</code> o usar comillas simples en el HTML</li></ul>`,
      },
      {
        title: `5. Template guia.html`,
        content: `<p>El template tiene 3 zonas:</p><pre><code>&lt;div class="row"&gt;
  &lt;!-- SIDEBAR (col-md-3) --&gt;
  &lt;div class="col-md-3"&gt;
    &lt;div class="list-group"&gt;
      &lt;a th:each="p, iter : \${pasos}"
         th:href="@{/guia(paso=\${iter.index})}"
         th:classappend="\${iter.index == pasoActual}
             ? ' active' : ''"
         class="list-group-item"&gt;
        &lt;i th:class="\${p['icon']}"&gt;&lt;/i&gt;
        &lt;span th:text="\${p['title']}"&gt;&lt;/span&gt;
      &lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;

  &lt;!-- CONTENIDO (col-md-9) --&gt;
  &lt;div class="col-md-9"&gt;
    &lt;!-- Intro --&gt;
    &lt;div class="alert alert-info"
         th:utext="\${detalle['intro']}"&gt;&lt;/div&gt;

    &lt;!-- Secciones --&gt;
    &lt;div th:each="sec : \${detalle['sections']}"&gt;
      &lt;h5 class="text-warning"
          th:text="\${sec['title']}"&gt;&lt;/h5&gt;
      &lt;div class="guia-content"
           th:utext="\${sec['content']}"&gt;&lt;/div&gt;
    &lt;/div&gt;

    &lt;!-- Navegación Anterior/Siguiente --&gt;
    &lt;div class="d-flex justify-content-between"&gt;
      &lt;a th:if="\${pasoActual > 0}"
         th:href="@{/guia(paso=\${pasoActual - 1})}"&gt;
         ← Anterior&lt;/a&gt;
      &lt;a th:if="\${pasoActual < totalPasos - 1}"
         th:href="@{/guia(paso=\${pasoActual + 1})}"&gt;
         Siguiente →&lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre><p><code>th:utext</code> vs <code>th:text</code>: <code>th:text</code> escapa HTML (seguro). <code>th:utext</code> NO escapa (renderiza HTML crudo). Usamos <code>th:utext</code> porque el contenido incluye tags HTML intencionalmente.</p>`,
      },
      {
        title: `6. Estilos del tema oscuro`,
        content: `<p>Los estilos están inline en <code>guia.html</code>:</p><pre><code>&lt;style&gt;
.guia-content {
    color: #ffffff !important;
}
.guia-content pre code {
    color: #8be9fd !important;  /* Cyan tipo Dracula */
    background: #000;
}
.guia-content a {
    color: #58a6ff !important;   /* Azul tipo GitHub */
}
.guia-content h5 {
    color: #ffc107 !important;   /* Amarillo warning */
}
&lt;/style&gt;</code></pre>`,
      },
      {
        title: `7. Cómo añadir un capítulo nuevo`,
        content: `<ol><li>Crea <code>GuiaCapituloXX.java</code> en el paquete <code>guia/</code></li><li>Sigue el patrón: <code>getPaso()</code> con <code>crearPaso()</code> y <code>section()</code></li><li>En <code>GuiaController.java</code>, añade: <code>PASOS.add(GuiaCapituloXX.getPaso());</code></li><li>Compila: <code>mvn compile</code></li><li>Reinicia el frontend</li><li>El nuevo capítulo aparece automáticamente en el sidebar</li></ol><p>📌 Los capítulos se añaden en orden al <code>PASOS</code> list. El número de paso en la URL es el índice del array (0-based), no el número del capítulo.</p>`,
      },
      {
        title: `8. Documentación de referencia`,
        content: `<p>Para más detalles sobre cómo funciona y modificar la guía, consulta:</p><p><b><code>GUIA-DESARROLLO.md</code></b> — En la raíz del proyecto. Contiene:</p><ul><li>Estructura de datos de cada paso</li><li>Iconos Bootstrap disponibles</li><li>Reglas de contenido HTML</li><li>Cómo añadir, modificar y eliminar pasos</li><li>Estilos CSS del tema oscuro</li><li>Historial de versiones de la guía</li></ul>`,
      },
      {
        title: `✅ Checklist antes de continuar`,
        content: `<ul><li>☐ Entiendes la estructura: GuiaController → GuiaCapituloXX → GuiaHelper</li><li>☐ Entiendes el template: sidebar + contenido + navegación</li><li>☐ Sabes la diferencia entre <code>th:text</code> y <code>th:utext</code></li><li>☐ Sabrías añadir un capítulo nuevo</li><li>☐ Has consultado <code>GUIA-DESARROLLO.md</code></li><li>☐ Commit: <code>git commit -m "Document guide system"</code></li></ul><p>¡Capítulo meta completado! 📖 Ahora vamos con <b>Docker Compose</b> — containerizar toda la arquitectura. 🐳</p>`,
      },
    ],
  },
  {
    id: 15,
    title: "Docker Compose",
    intro: `Hasta ahora arrancábamos 5 terminales a mano. Docker Compose levanta todo el sistema con un solo comando: <code>docker compose up --build</code>. Vamos a ver cómo está configurado y por qué cada decisión importa.`,
    sections: [
      {
        title: `1. ¿Qué es Docker Compose?`,
        content: `<p>Docker Compose es una herramienta que define y ejecuta aplicaciones <b>multi-contenedor</b>. En vez de hacer <code>docker run</code> para cada servicio, describes todo en un archivo YAML y Docker se encarga del resto.</p><p>En nuestro caso tenemos <b>6 servicios</b>: Eureka, Gateway, Auth, Content, Progress y Frontend. Sin Compose necesitarías 6 terminales. Con Compose: un comando.</p><pre><code>docker compose up --build    # Construir y arrancar todo
docker compose down           # Parar y eliminar contenedores
docker compose logs -f        # Ver logs en tiempo real</code></pre>`,
      },
      {
        title: `2. Estructura del docker-compose.yml`,
        content: `<p>Nuestro archivo define los 6 servicios con sus puertos, variables de entorno y dependencias:</p><pre><code>services:
  eureka-server:       # Puerto 8761 — Service Discovery
  api-gateway:         # Puerto 8080 — Punto de entrada
  auth-service:        # Puerto 8081 — Autenticación + JWT
  content-service:     # Puerto 8083 — Flashcards y Quizzes
  progress-service:    # Puerto 8084 — Progreso y cinturones
  dojo-frontend:       # Puerto 8090 — Interfaz web</code></pre><p>Cada servicio tiene su propio <code>Dockerfile</code> en su carpeta. La directiva <code>build: ./nombre-servicio</code> le dice a Compose dónde encontrarlo.</p>`,
      },
      {
        title: `3. Eureka Server — El primero en arrancar`,
        content: `<p>Eureka es el <b>Service Discovery</b>: todos los demás servicios se registran aquí al arrancar. Por eso debe estar listo antes que nadie.</p><pre><code>eureka-server:
  build: ./eureka-server
  container_name: eureka-server
  ports:
    - "8761:8761"
  healthcheck:
    test: ["CMD", "curl", "-f",
           "http://localhost:8761/actuator/health"]
    interval: 10s
    timeout: 5s
    retries: 5
    start_period: 30s</code></pre><p><b>healthcheck</b>: Docker comprueba cada 10s si Eureka responde. Los demás servicios usan <code>depends_on</code> para no arrancar hasta que esté listo (aunque aquí usamos <code>service_started</code>, no <code>service_healthy</code> — Spring Boot se encarga de reintentar el registro).</p>`,
      },
      {
        title: `4. Los microservicios (Auth, Content, Progress)`,
        content: `<p>Los tres siguen el mismo patrón:</p><pre><code>auth-service:
  build: ./auth-service
  container_name: auth-service
  ports:
    - "8081:8081"
  environment:
    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=
        http://eureka-server:8761/eureka/
    - SPRING_DATASOURCE_URL=jdbc:h2:mem:authdb
  depends_on:
    eureka-server:
      condition: service_started</code></pre><p>Puntos clave:</p><ul><li><b>EUREKA_CLIENT_SERVICEURL_DEFAULTZONE</b> — En vez de <code>localhost</code>, usamos <code>eureka-server</code> (el nombre del contenedor). Docker Compose crea una red interna donde los contenedores se resuelven por nombre.</li><li><b>SPRING_DATASOURCE_URL</b> — Cada servicio tiene su propia base de datos H2 en memoria. Se pierden al parar los contenedores (igual que en desarrollo local).</li><li><b>depends_on</b> — Eureka arranca primero, pero <code>service_started</code> solo espera a que el contenedor <i>arranque</i>, no a que esté sano. Para producción usarías <code>service_healthy</code>.</li></ul>`,
      },
      {
        title: `5. API Gateway — El punto de entrada`,
        content: `<p>El Gateway es el <b>proxy inverso</b> que enruta peticiones a los microservicios:</p><pre><code>api-gateway:
  build: ./api-gateway
  container_name: api-gateway
  ports:
    - "8080:8080"
  environment:
    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=
        http://eureka-server:8761/eureka/
  depends_on:
    eureka-server:
      condition: service_started</code></pre><p>El Gateway descubre los servicios a través de Eureka y enruta automáticamente. El frontend habla con el Gateway (puerto 8080), nunca directamente con los microservicios.</p>`,
      },
      {
        title: `6. Frontend — La cara visible`,
        content: `<p>El frontend Thymeleaf necesita saber dónde está el Gateway:</p><pre><code>dojo-frontend:
  build: ./dojo-frontend
  container_name: dojo-frontend
  ports:
    - "8090:8090"
  environment:
    - EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=
        http://eureka-server:8761/eureka/
    - GATEWAY_URL=http://api-gateway:8080
  depends_on:
    - api-gateway
    - auth-service
    - content-service
    - progress-service</code></pre><p><b>GATEWAY_URL</b> le dice al frontend que las llamadas HTTP van a <code>api-gateway:8080</code> en vez de <code>localhost:8080</code>. Dentro de Docker la red es distinta.</p><p>Depende de <b>todos</b> los servicios porque necesita que todo esté arriba para funcionar.</p>`,
      },
      {
        title: `7. La red interna de Docker`,
        content: `<p>Docker Compose crea automáticamente una <b>red bridge</b> donde todos los contenedores se ven entre sí por nombre de servicio:</p><pre><code># Dentro de los contenedores:
eureka-server → 172.18.0.2
api-gateway   → 172.18.0.3
auth-service  → 172.18.0.4
...etc

# Pero no necesitas IPs, usas nombres:
http://eureka-server:8761/eureka/
http://api-gateway:8080</code></pre><p>Desde <b>fuera</b> (tu navegador), accedes por <code>localhost:puerto</code>. Desde <b>dentro</b> (entre contenedores), acceden por nombre de servicio.</p>`,
      },
      {
        title: `8. Comandos útiles`,
        content: `<pre><code># Arrancar todo (construir + ejecutar)
docker compose up --build

# Arrancar en segundo plano
docker compose up --build -d

# Ver logs de un servicio concreto
docker compose logs -f auth-service

# Parar todo
docker compose down

# Reconstruir solo un servicio
docker compose build auth-service
docker compose up auth-service

# Ver estado de los contenedores
docker compose ps

# Entrar en un contenedor
docker compose exec auth-service bash</code></pre>`,
      },
      {
        title: `9. Checklist`,
        content: `<ul><li>✅ <code>docker-compose.yml</code> define 6 servicios</li><li>✅ Eureka arranca primero con healthcheck</li><li>✅ Cada servicio tiene su Dockerfile</li><li>✅ Variables de entorno sobreescriben <code>application.properties</code></li><li>✅ Red interna: contenedores se comunican por nombre</li><li>✅ <code>depends_on</code> controla el orden de arranque</li><li>✅ Un comando lo levanta todo: <code>docker compose up --build</code></li></ul>`,
      },
    ],
  },
  {
    id: 16,
    title: "Arranque y Arquitectura",
    intro: `Este es el último capítulo. Aquí juntamos todo: la arquitectura completa del sistema, cómo arrancarlo paso a paso (con y sin Docker), el flujo de una petición de principio a fin, y un mapa mental para que nunca te pierdas.`,
    sections: [
      {
        title: `1. Arquitectura general`,
        content: `<p>Spring Boot Dojo es una aplicación de <b>microservicios</b> con 6 componentes:</p><pre><code>┌─────────────────────────────────────────────┐
│               NAVEGADOR (:8090)             │
│           dojo-frontend (Thymeleaf)         │
└──────────────────┬──────────────────────────┘
                   │ HTTP
                   ▼
┌──────────────────────────────────────────────┐
│            API GATEWAY (:8080)               │
│     Enruta /api/auth/** → auth-service       │
│     Enruta /api/content/** → content-service │
│     Enruta /api/progress/** → progress-svc   │
└──────┬──────────┬───────────┬────────────────┘
       │          │           │
       ▼          ▼           ▼
┌──────────┐ ┌──────────┐ ┌──────────────┐
│  AUTH    │ │ CONTENT  │ │  PROGRESS    │
│ :8081   │ │  :8083   │ │   :8084      │
│ JWT+H2  │ │ Cards+H2 │ │ Rachas+H2    │
└──────────┘ └──────────┘ └──────────────┘
       │          │           │
       └──────────┼───────────┘
                  ▼
       ┌─────────────────────┐
       │  EUREKA SERVER       │
       │  :8761 (Discovery)   │
       └─────────────────────┘</code></pre><p>Todos los servicios se registran en <b>Eureka</b>. El Gateway los descubre automáticamente y enruta las peticiones por prefijo de URL.</p>`,
      },
      {
        title: `2. Tabla de servicios`,
        content: `<table style='width:100%; border-collapse:collapse; margin:1rem 0;'><tr style='border-bottom:2px solid #6272a4;'><th style='text-align:left; padding:8px;'>Servicio</th><th style='text-align:left; padding:8px;'>Puerto</th><th style='text-align:left; padding:8px;'>Responsabilidad</th><th style='text-align:left; padding:8px;'>Base de datos</th></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'>eureka-server</td><td>8761</td><td>Service Discovery</td><td>—</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'>api-gateway</td><td>8080</td><td>Routing + Load Balancing</td><td>—</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'>auth-service</td><td>8081</td><td>Login, Registro, JWT</td><td>H2 (authdb)</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'>content-service</td><td>8083</td><td>Flashcards, Quizzes</td><td>H2 (contentdb)</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'>progress-service</td><td>8084</td><td>Progreso, Rachas, Cinturones</td><td>H2 (progressdb)</td></tr><tr><td style='padding:8px;'>dojo-frontend</td><td>8090</td><td>Interfaz web (Thymeleaf)</td><td>—</td></tr></table>`,
      },
      {
        title: `3. Arranque manual (sin Docker)`,
        content: `<p>Necesitas <b>5 terminales</b>. El orden importa:</p><pre><code># Terminal 1 — Eureka (SIEMPRE primero)
cd eureka-server
mvn spring-boot:run
# Espera a ver "Started EurekaServerApplication"

# Terminal 2 — Auth Service
cd auth-service
mvn spring-boot:run

# Terminal 3 — Content Service
cd content-service
mvn spring-boot:run

# Terminal 4 — Progress Service
cd progress-service
mvn spring-boot:run

# Terminal 5 — API Gateway
cd api-gateway
mvn spring-boot:run

# Terminal 6 — Frontend
cd dojo-frontend
mvn spring-boot:run</code></pre><p>Abre <code>http://localhost:8090</code> en el navegador.</p><p>⚠️ <b>H2 in-memory</b>: los datos se pierden al reiniciar cualquier servicio. Los seed data (flashcards, quizzes) se recargan automáticamente al arrancar.</p>`,
      },
      {
        title: `4. Arranque con Docker Compose`,
        content: `<p>Un solo comando desde la raíz del proyecto:</p><pre><code># Construir y arrancar todo
docker compose up --build

# En segundo plano
docker compose up --build -d

# Parar todo
docker compose down</code></pre><p>Docker se encarga del orden de arranque (via <code>depends_on</code>) y de la red interna entre contenedores.</p><p>Accede a <code>http://localhost:8090</code> igual que en modo manual.</p>`,
      },
      {
        title: `5. Flujo de una petición (Login → Estudio)`,
        content: `<p>Veamos qué pasa cuando un usuario hace login y estudia una flashcard:</p><pre><code>1. Usuario abre http://localhost:8090/login
   → Frontend sirve la página Thymeleaf

2. Usuario envía usuario + contraseña
   → Frontend POST → Gateway :8080/api/auth/login
   → Gateway descubre auth-service via Eureka
   → auth-service valida credenciales
   → Devuelve JWT token
   → Frontend guarda token en HttpSession

3. Usuario va a /study
   → Frontend GET → Gateway :8080/api/content/flashcards
   → Gateway → content-service
   → Devuelve lista de flashcards

4. Usuario marca "Lo sabía" en una flashcard
   → Frontend POST → Gateway :8080/api/progress/attempt
   → Gateway → progress-service
   → Actualiza racha, aciertos, cinturón
   → Repetición espaciada recalcula prioridad</code></pre>`,
      },
      {
        title: `6. Eureka Dashboard`,
        content: `<p>Puedes ver todos los servicios registrados en:</p><pre><code>http://localhost:8761</code></pre><p>Deberías ver 5 instancias registradas:</p><ul><li><b>API-GATEWAY</b> — UP</li><li><b>AUTH-SERVICE</b> — UP</li><li><b>CONTENT-SERVICE</b> — UP</li><li><b>PROGRESS-SERVICE</b> — UP</li><li><b>DOJO-FRONTEND</b> — UP</li></ul><p>Si alguno no aparece, revisa los logs: probablemente no pudo conectar con Eureka al arrancar.</p>`,
      },
      {
        title: `7. URLs importantes`,
        content: `<table style='width:100%; border-collapse:collapse; margin:1rem 0;'><tr style='border-bottom:2px solid #6272a4;'><th style='text-align:left; padding:8px;'>URL</th><th style='text-align:left; padding:8px;'>Descripción</th></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'><code>localhost:8090</code></td><td>Aplicación (login, dashboard, estudio, quizzes, guía)</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'><code>localhost:8761</code></td><td>Eureka Dashboard (servicios registrados)</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'><code>localhost:8080/api/auth/**</code></td><td>Auth API (via Gateway)</td></tr><tr style='border-bottom:1px solid #44475a;'><td style='padding:8px;'><code>localhost:8080/api/content/**</code></td><td>Content API (via Gateway)</td></tr><tr><td style='padding:8px;'><code>localhost:8080/api/progress/**</code></td><td>Progress API (via Gateway)</td></tr></table>`,
      },
      {
        title: `8. Tecnologías utilizadas`,
        content: `<ul><li><b>Java 17</b> — Lenguaje principal</li><li><b>Spring Boot 3.2</b> — Framework base</li><li><b>Spring Cloud</b> — Eureka (Discovery) + Gateway (Routing)</li><li><b>Spring Security + JWT</b> — Autenticación stateless</li><li><b>Spring Data JPA + H2</b> — Persistencia en memoria</li><li><b>Thymeleaf + Bootstrap 5</b> — Frontend server-side</li><li><b>Docker + Docker Compose</b> — Contenedores y orquestación</li><li><b>Maven</b> — Build tool</li></ul>`,
      },
      {
        title: `9. Checklist final`,
        content: `<ul><li>✅ 6 servicios: Eureka, Gateway, Auth, Content, Progress, Frontend</li><li>✅ Arranque manual: 6 terminales, Eureka primero</li><li>✅ Arranque Docker: <code>docker compose up --build</code></li><li>✅ Service Discovery con Eureka</li><li>✅ API Gateway enruta por prefijo de URL</li><li>✅ JWT para autenticación stateless</li><li>✅ H2 in-memory (datos se pierden al reiniciar)</li><li>✅ Seed data automáticos (30 flashcards, 30 quizzes, 6 cinturones)</li><li>✅ Repetición espaciada integrada en estudio</li><li>✅ Sistema de cinturones con progreso visual</li><li>✅ Guía integrada en la propia aplicación (16 capítulos)</li></ul><p style='margin-top:1.5rem; font-size:1.1em;'>🥋 <b>¡Enhorabuena!</b> Has completado la guía completa de Spring Boot Dojo. Ahora tienes una aplicación de microservicios funcional con Service Discovery, API Gateway, autenticación JWT, y una guía paso a paso para entenderlo todo.</p>`,
      },
    ],
  },
];
