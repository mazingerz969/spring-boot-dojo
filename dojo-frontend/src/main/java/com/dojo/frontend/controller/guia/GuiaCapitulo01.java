package com.dojo.frontend.controller.guia;

import java.util.*;
import static com.dojo.frontend.controller.guia.GuiaHelper.*;

public class GuiaCapitulo01 {

    public static Map<String, Object> getPaso() {
        return crearPaso(
            1, "Preparación del Entorno", "bi-tools",
                "Antes de escribir una sola línea de código, necesitas tener tu máquina preparada. "
                + "En este paso vamos a instalar y configurar todo lo necesario: "
                + "Java 17, Maven, IntelliJ IDEA, plugins útiles y las configuraciones que te ahorrarán problemas más adelante.",
                List.of(

                    section("1. Instalar JDK 17",
                        "<p>Spring Boot 3.x requiere <b>Java 17 como mínimo</b>. No vale Java 8, ni 11. Tiene que ser 17 o superior.</p>"
                        + "<p><b>¿Dónde descargarlo?</b></p>"
                        + "<ul>"
                        + "<li><a href='https://adoptium.net/' target='_blank'>Eclipse Adoptium (Temurin)</a> — Recomendado, gratuito, open source</li>"
                        + "<li><a href='https://www.oracle.com/java/technologies/downloads/#java17' target='_blank'>Oracle JDK</a> — Oficial pero con licencia más restrictiva</li>"
                        + "<li><a href='https://www.azul.com/downloads/?version=java-17-lts' target='_blank'>Azul Zulu</a> — Alternativa gratuita</li>"
                        + "</ul>"
                        + "<p><b>Instalación en Windows:</b></p>"
                        + "<ol>"
                        + "<li>Descarga el instalador <code>.msi</code> de Adoptium</li>"
                        + "<li>Ejecuta el instalador — marca la opción <b>\"Set JAVA_HOME variable\"</b></li>"
                        + "<li>Marca también <b>\"Add to PATH\"</b></li>"
                        + "<li>Finaliza la instalación</li>"
                        + "</ol>"
                        + "<p><b>Instalación en Linux (Fedora/Ubuntu):</b></p>"
                        + "<pre><code># Fedora\nsudo dnf install java-17-openjdk-devel\n\n# Ubuntu/Debian\nsudo apt install openjdk-17-jdk</code></pre>"
                        + "<p><b>Verificar la instalación:</b></p>"
                        + "<pre><code>java -version\n# Debe mostrar algo como: openjdk version \"17.0.x\"</code></pre>"
                        + "<p>Si muestra otra versión, es que tienes varias instaladas. En Windows, revisa las variables de entorno. "
                        + "En Linux: <code>sudo alternatives --config java</code></p>"),

                    section("2. Instalar Maven (opcional)",
                        "<p>Maven es la herramienta que gestiona las dependencias y compila el proyecto. "
                        + "<b>IntelliJ ya trae Maven integrado</b>, así que no es obligatorio instalarlo aparte. "
                        + "Pero si quieres usarlo desde terminal (recomendado para scripts y Docker):</p>"
                        + "<p><b>Windows:</b></p>"
                        + "<ol>"
                        + "<li>Descarga de <a href='https://maven.apache.org/download.cgi' target='_blank'>maven.apache.org</a></li>"
                        + "<li>Descomprime en <code>C:\\Program Files\\Maven</code></li>"
                        + "<li>Añade <code>C:\\Program Files\\Maven\\bin</code> al PATH del sistema</li>"
                        + "</ol>"
                        + "<p><b>Linux:</b></p>"
                        + "<pre><code># Fedora\nsudo dnf install maven\n\n# Ubuntu/Debian\nsudo apt install maven</code></pre>"
                        + "<p><b>Verificar:</b></p>"
                        + "<pre><code>mvn -version\n# Debe mostrar Apache Maven 3.9.x y Java 17</code></pre>"
                        + "<p>⚠️ Si <code>mvn -version</code> muestra Java 8 u 11, es que JAVA_HOME apunta a la versión antigua. "
                        + "Configura JAVA_HOME para que apunte a tu JDK 17.</p>"),

                    section("3. Instalar IntelliJ IDEA",
                        "<p><b>¿Community o Ultimate?</b></p>"
                        + "<ul>"
                        + "<li><b>Community (gratuita)</b> — Suficiente para este proyecto. Tiene soporte Java, Maven, Git. "
                        + "Le falta el soporte nativo de Spring, pero no lo necesitas porque lo hacemos todo manual.</li>"
                        + "<li><b>Ultimate (de pago)</b> — Añade soporte Spring, Spring Boot run configs, endpoints viewer, "
                        + "database tools integrado. Si tienes licencia, úsalo. Si no, Community va perfecto.</li>"
                        + "</ul>"
                        + "<p><b>Descarga:</b> <a href='https://www.jetbrains.com/idea/download/' target='_blank'>jetbrains.com/idea</a></p>"
                        + "<p>Si eres estudiante puedes pedir <a href='https://www.jetbrains.com/community/education/' target='_blank'>licencia educativa gratuita</a> de Ultimate.</p>"),

                    section("4. Plugins recomendados para IntelliJ",
                        "<p>Ve a <b>File → Settings → Plugins → Marketplace</b> e instala:</p>"
                        + "<table class='table table-sm table-dark'>"
                        + "<thead><tr><th>Plugin</th><th>Para qué</th><th>¿Obligatorio?</th></tr></thead>"
                        + "<tbody>"
                        + "<tr><td><b>Spring Boot Assistant</b></td>"
                        + "<td>Autocompletado en application.yml, navegación a beans</td>"
                        + "<td>Muy recomendado</td></tr>"
                        + "<tr><td><b>Rainbow Brackets</b></td>"
                        + "<td>Colorea los paréntesis/llaves por nivel — vida más fácil</td>"
                        + "<td>Recomendado</td></tr>"
                        + "<tr><td><b>.ignore</b></td>"
                        + "<td>Ayuda a crear y gestionar archivos .gitignore</td>"
                        + "<td>Recomendado</td></tr>"
                        + "<tr><td><b>Database Navigator</b></td>"
                        + "<td>Explorar la base de datos H2 desde IntelliJ (alternativa a la consola web)</td>"
                        + "<td>Opcional</td></tr>"
                        + "<tr><td><b>Key Promoter X</b></td>"
                        + "<td>Te enseña atajos de teclado mientras trabajas</td>"
                        + "<td>Opcional pero útil</td></tr>"
                        + "</tbody></table>"
                        + "<p>Después de instalarlos, <b>reinicia IntelliJ</b>.</p>"),

                    section("5. Configurar IntelliJ correctamente",
                        "<p>Antes de crear el proyecto, ajusta estas configuraciones:</p>"
                        + "<p><b>A) Configurar JDK 17:</b></p>"
                        + "<ol>"
                        + "<li><b>File → Project Structure → Project</b></li>"
                        + "<li>En \"SDK\" selecciona tu JDK 17 (si no aparece, click en \"Add SDK\" → busca la carpeta de instalación)</li>"
                        + "<li>En \"Language level\" selecciona <b>17</b></li>"
                        + "</ol>"
                        + "<p><b>B) Encoding UTF-8:</b></p>"
                        + "<ol>"
                        + "<li><b>File → Settings → Editor → File Encodings</b></li>"
                        + "<li>Pon TODO en <b>UTF-8</b>: Global Encoding, Project Encoding, y Default encoding for properties files</li>"
                        + "<li>Esto evita problemas con tildes y eñes en el código</li>"
                        + "</ol>"
                        + "<p><b>C) Auto-import Maven:</b></p>"
                        + "<ol>"
                        + "<li><b>File → Settings → Build → Build Tools → Maven → Importing</b></li>"
                        + "<li>Marca <b>\"Reload project after changes in the build scripts\"</b> → Selecciona \"Any changes\"</li>"
                        + "<li>Así no tienes que recargar Maven manualmente cada vez que cambias el pom.xml</li>"
                        + "</ol>"
                        + "<p><b>D) Annotation Processing (importante para Lombok si lo usas):</b></p>"
                        + "<ol>"
                        + "<li><b>File → Settings → Build → Compiler → Annotation Processors</b></li>"
                        + "<li>Marca <b>\"Enable annotation processing\"</b></li>"
                        + "</ol>"),

                    section("6. Configurar Run Configurations",
                        "<p>Vas a tener <b>6 microservicios</b> que arrancar. Para no abrir 6 terminales manualmente cada vez:</p>"
                        + "<p><b>Crear una Run Configuration por servicio:</b></p>"
                        + "<ol>"
                        + "<li><b>Run → Edit Configurations → + → Spring Boot</b> (en Ultimate) o <b>Application</b> (en Community)</li>"
                        + "<li>Nombre: <code>Eureka Server</code></li>"
                        + "<li>Main class: <code>com.dojo.eureka.EurekaServerApplication</code></li>"
                        + "<li>Module classpath: <code>eureka-server</code></li>"
                        + "<li>Repite para cada servicio</li>"
                        + "</ol>"
                        + "<table class='table table-sm table-dark'>"
                        + "<thead><tr><th>Nombre</th><th>Main Class</th><th>Módulo</th><th>Puerto</th></tr></thead>"
                        + "<tbody>"
                        + "<tr><td>Eureka Server</td><td>com.dojo.eureka.EurekaServerApplication</td><td>eureka-server</td><td>8761</td></tr>"
                        + "<tr><td>Auth Service</td><td>com.dojo.auth.AuthServiceApplication</td><td>auth-service</td><td>8081</td></tr>"
                        + "<tr><td>Content Service</td><td>com.dojo.content.ContentServiceApplication</td><td>content-service</td><td>8083</td></tr>"
                        + "<tr><td>Progress Service</td><td>com.dojo.progress.ProgressServiceApplication</td><td>progress-service</td><td>8084</td></tr>"
                        + "<tr><td>API Gateway</td><td>com.dojo.gateway.ApiGatewayApplication</td><td>api-gateway</td><td>8080</td></tr>"
                        + "<tr><td>Dojo Frontend</td><td>com.dojo.frontend.DojoFrontendApplication</td><td>dojo-frontend</td><td>8090</td></tr>"
                        + "</tbody></table>"
                        + "<p><b>Compound Run Configuration (arrancar todo junto):</b></p>"
                        + "<ol>"
                        + "<li><b>Run → Edit Configurations → + → Compound</b></li>"
                        + "<li>Nombre: <code>All Services</code></li>"
                        + "<li>Añade las 6 configuraciones anteriores</li>"
                        + "<li>Ahora con un solo click arrancas todo</li>"
                        + "</ol>"
                        + "<p>⚠️ <b>Orden importa</b>: Eureka debe arrancar primero. IntelliJ arranca todos a la vez en Compound, "
                        + "pero como Eureka es rápido y los demás tardan más en registrarse, normalmente funciona. "
                        + "Si da problemas, arranca Eureka solo, espera 5 segundos y luego arranca el Compound con el resto.</p>"),

                    section("7. Instalar Git",
                        "<p>Si no tienes Git instalado:</p>"
                        + "<p><b>Windows:</b> Descarga de <a href='https://git-scm.com/download/win' target='_blank'>git-scm.com</a></p>"
                        + "<p><b>Linux:</b></p>"
                        + "<pre><code># Fedora\nsudo dnf install git\n\n# Ubuntu\nsudo apt install git</code></pre>"
                        + "<p><b>Verificar:</b></p>"
                        + "<pre><code>git --version</code></pre>"
                        + "<p>IntelliJ detecta Git automáticamente. Cuando creemos el proyecto, inicializaremos el repo.</p>"),

                    section("8. Herramientas para probar APIs",
                        "<p>Para probar los endpoints de la API vas a necesitar algo más que el navegador:</p>"
                        + "<ul>"
                        + "<li><b>curl</b> — Viene en Linux y Windows 10+. Lo usaremos en los ejemplos de la guía.</li>"
                        + "<li><b>Postman</b> — Interfaz gráfica muy cómoda. Descarga: <a href='https://www.postman.com/downloads/' target='_blank'>postman.com</a></li>"
                        + "<li><b>IntelliJ HTTP Client</b> — Integrado en Ultimate. Archivos <code>.http</code> directamente en el proyecto.</li>"
                        + "</ul>"
                        + "<p>Ejemplo de petición con curl que usaremos más adelante:</p>"
                        + "<pre><code>curl -X POST http://localhost:8081/api/auth/register \\\n  -H 'Content-Type: application/json' \\\n  -d '{\"username\":\"berto\",\"password\":\"1234\"}'</code></pre>"),

                    section("✅ Checklist antes de continuar",
                        "<p>Antes de pasar al siguiente capítulo, asegúrate de tener:</p>"
                        + "<ul>"
                        + "<li>☐ <code>java -version</code> muestra Java 17+</li>"
                        + "<li>☐ <code>mvn -version</code> muestra Maven 3.9+ con Java 17 (si instalaste Maven)</li>"
                        + "<li>☐ IntelliJ IDEA instalado y abierto</li>"
                        + "<li>☐ Plugins instalados (al menos Spring Boot Assistant y Rainbow Brackets)</li>"
                        + "<li>☐ JDK 17 configurado en Project Structure</li>"
                        + "<li>☐ Encoding en UTF-8</li>"
                        + "<li>☐ Git instalado</li>"
                        + "</ul>"
                        + "<p>Si todo está ✅, estás listo para crear el proyecto. ¡Vamos! 🚀</p>")
                ));

    }
}
