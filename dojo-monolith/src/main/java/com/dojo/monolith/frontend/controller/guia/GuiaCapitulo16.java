package com.dojo.monolith.frontend.controller.guia;

import java.util.*;
import static com.dojo.monolith.frontend.controller.guia.GuiaHelper.*;

public class GuiaCapitulo16 {

    public static Map<String, Object> getPaso() {
        return crearPaso(
            16, "Arranque y Arquitectura", "bi-diagram-3",
            "Este es el último capítulo. Aquí juntamos todo: la arquitectura completa del sistema, "
            + "cómo arrancarlo paso a paso (con y sin Docker), el flujo de una petición de principio a fin, "
            + "y un mapa mental para que nunca te pierdas.",
            List.of(

                section("1. Arquitectura general",
                    "<p>Spring Boot Dojo es una aplicación de <b>microservicios</b> con 6 componentes:</p>"
                    + "<pre><code>"
                    + "┌─────────────────────────────────────────────┐\n"
                    + "│               NAVEGADOR (:8090)             │\n"
                    + "│           dojo-frontend (Thymeleaf)         │\n"
                    + "└──────────────────┬──────────────────────────┘\n"
                    + "                   │ HTTP\n"
                    + "                   ▼\n"
                    + "┌──────────────────────────────────────────────┐\n"
                    + "│            API GATEWAY (:8080)               │\n"
                    + "│     Enruta /api/auth/** → auth-service       │\n"
                    + "│     Enruta /api/content/** → content-service │\n"
                    + "│     Enruta /api/progress/** → progress-svc   │\n"
                    + "└──────┬──────────┬───────────┬────────────────┘\n"
                    + "       │          │           │\n"
                    + "       ▼          ▼           ▼\n"
                    + "┌──────────┐ ┌──────────┐ ┌──────────────┐\n"
                    + "│  AUTH    │ │ CONTENT  │ │  PROGRESS    │\n"
                    + "│ :8081   │ │  :8083   │ │   :8084      │\n"
                    + "│ JWT+H2  │ │ Cards+H2 │ │ Rachas+H2    │\n"
                    + "└──────────┘ └──────────┘ └──────────────┘\n"
                    + "       │          │           │\n"
                    + "       └──────────┼───────────┘\n"
                    + "                  ▼\n"
                    + "       ┌─────────────────────┐\n"
                    + "       │  EUREKA SERVER       │\n"
                    + "       │  :8761 (Discovery)   │\n"
                    + "       └─────────────────────┘"
                    + "</code></pre>"
                    + "<p>Todos los servicios se registran en <b>Eureka</b>. "
                    + "El Gateway los descubre automáticamente y enruta las peticiones por prefijo de URL.</p>"),

                section("2. Tabla de servicios",
                    "<table style='width:100%; border-collapse:collapse; margin:1rem 0;'>"
                    + "<tr style='border-bottom:2px solid #6272a4;'>"
                    + "<th style='text-align:left; padding:8px;'>Servicio</th>"
                    + "<th style='text-align:left; padding:8px;'>Puerto</th>"
                    + "<th style='text-align:left; padding:8px;'>Responsabilidad</th>"
                    + "<th style='text-align:left; padding:8px;'>Base de datos</th></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'>eureka-server</td><td>8761</td>"
                    + "<td>Service Discovery</td><td>—</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'>api-gateway</td><td>8080</td>"
                    + "<td>Routing + Load Balancing</td><td>—</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'>auth-service</td><td>8081</td>"
                    + "<td>Login, Registro, JWT</td><td>H2 (authdb)</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'>content-service</td><td>8083</td>"
                    + "<td>Flashcards, Quizzes</td><td>H2 (contentdb)</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'>progress-service</td><td>8084</td>"
                    + "<td>Progreso, Rachas, Cinturones</td><td>H2 (progressdb)</td></tr>"
                    + "<tr>"
                    + "<td style='padding:8px;'>dojo-frontend</td><td>8090</td>"
                    + "<td>Interfaz web (Thymeleaf)</td><td>—</td></tr>"
                    + "</table>"),

                section("3. Arranque manual (sin Docker)",
                    "<p>Necesitas <b>5 terminales</b>. El orden importa:</p>"
                    + "<pre><code># Terminal 1 — Eureka (SIEMPRE primero)\n"
                    + "cd eureka-server\n"
                    + "mvn spring-boot:run\n"
                    + "# Espera a ver \"Started EurekaServerApplication\"\n\n"
                    + "# Terminal 2 — Auth Service\n"
                    + "cd auth-service\n"
                    + "mvn spring-boot:run\n\n"
                    + "# Terminal 3 — Content Service\n"
                    + "cd content-service\n"
                    + "mvn spring-boot:run\n\n"
                    + "# Terminal 4 — Progress Service\n"
                    + "cd progress-service\n"
                    + "mvn spring-boot:run\n\n"
                    + "# Terminal 5 — API Gateway\n"
                    + "cd api-gateway\n"
                    + "mvn spring-boot:run\n\n"
                    + "# Terminal 6 — Frontend\n"
                    + "cd dojo-frontend\n"
                    + "mvn spring-boot:run</code></pre>"
                    + "<p>Abre <code>http://localhost:8090</code> en el navegador.</p>"
                    + "<p>⚠️ <b>H2 in-memory</b>: los datos se pierden al reiniciar cualquier servicio. "
                    + "Los seed data (flashcards, quizzes) se recargan automáticamente al arrancar.</p>"),

                section("4. Arranque con Docker Compose",
                    "<p>Un solo comando desde la raíz del proyecto:</p>"
                    + "<pre><code># Construir y arrancar todo\n"
                    + "docker compose up --build\n\n"
                    + "# En segundo plano\n"
                    + "docker compose up --build -d\n\n"
                    + "# Parar todo\n"
                    + "docker compose down</code></pre>"
                    + "<p>Docker se encarga del orden de arranque (via <code>depends_on</code>) "
                    + "y de la red interna entre contenedores.</p>"
                    + "<p>Accede a <code>http://localhost:8090</code> igual que en modo manual.</p>"),

                section("5. Flujo de una petición (Login → Estudio)",
                    "<p>Veamos qué pasa cuando un usuario hace login y estudia una flashcard:</p>"
                    + "<pre><code>"
                    + "1. Usuario abre http://localhost:8090/login\n"
                    + "   → Frontend sirve la página Thymeleaf\n\n"
                    + "2. Usuario envía usuario + contraseña\n"
                    + "   → Frontend POST → Gateway :8080/api/auth/login\n"
                    + "   → Gateway descubre auth-service via Eureka\n"
                    + "   → auth-service valida credenciales\n"
                    + "   → Devuelve JWT token\n"
                    + "   → Frontend guarda token en HttpSession\n\n"
                    + "3. Usuario va a /study\n"
                    + "   → Frontend GET → Gateway :8080/api/content/flashcards\n"
                    + "   → Gateway → content-service\n"
                    + "   → Devuelve lista de flashcards\n\n"
                    + "4. Usuario marca \"Lo sabía\" en una flashcard\n"
                    + "   → Frontend POST → Gateway :8080/api/progress/attempt\n"
                    + "   → Gateway → progress-service\n"
                    + "   → Actualiza racha, aciertos, cinturón\n"
                    + "   → Repetición espaciada recalcula prioridad"
                    + "</code></pre>"),

                section("6. Eureka Dashboard",
                    "<p>Puedes ver todos los servicios registrados en:</p>"
                    + "<pre><code>http://localhost:8761</code></pre>"
                    + "<p>Deberías ver 5 instancias registradas:</p>"
                    + "<ul>"
                    + "<li><b>API-GATEWAY</b> — UP</li>"
                    + "<li><b>AUTH-SERVICE</b> — UP</li>"
                    + "<li><b>CONTENT-SERVICE</b> — UP</li>"
                    + "<li><b>PROGRESS-SERVICE</b> — UP</li>"
                    + "<li><b>DOJO-FRONTEND</b> — UP</li>"
                    + "</ul>"
                    + "<p>Si alguno no aparece, revisa los logs: probablemente no pudo conectar con Eureka al arrancar.</p>"),

                section("7. URLs importantes",
                    "<table style='width:100%; border-collapse:collapse; margin:1rem 0;'>"
                    + "<tr style='border-bottom:2px solid #6272a4;'>"
                    + "<th style='text-align:left; padding:8px;'>URL</th>"
                    + "<th style='text-align:left; padding:8px;'>Descripción</th></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'><code>localhost:8090</code></td>"
                    + "<td>Aplicación (login, dashboard, estudio, quizzes, guía)</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'><code>localhost:8761</code></td>"
                    + "<td>Eureka Dashboard (servicios registrados)</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'><code>localhost:8080/api/auth/**</code></td>"
                    + "<td>Auth API (via Gateway)</td></tr>"
                    + "<tr style='border-bottom:1px solid #44475a;'>"
                    + "<td style='padding:8px;'><code>localhost:8080/api/content/**</code></td>"
                    + "<td>Content API (via Gateway)</td></tr>"
                    + "<tr>"
                    + "<td style='padding:8px;'><code>localhost:8080/api/progress/**</code></td>"
                    + "<td>Progress API (via Gateway)</td></tr>"
                    + "</table>"),

                section("8. Tecnologías utilizadas",
                    "<ul>"
                    + "<li><b>Java 17</b> — Lenguaje principal</li>"
                    + "<li><b>Spring Boot 3.2</b> — Framework base</li>"
                    + "<li><b>Spring Cloud</b> — Eureka (Discovery) + Gateway (Routing)</li>"
                    + "<li><b>Spring Security + JWT</b> — Autenticación stateless</li>"
                    + "<li><b>Spring Data JPA + H2</b> — Persistencia en memoria</li>"
                    + "<li><b>Thymeleaf + Bootstrap 5</b> — Frontend server-side</li>"
                    + "<li><b>Docker + Docker Compose</b> — Contenedores y orquestación</li>"
                    + "<li><b>Maven</b> — Build tool</li>"
                    + "</ul>"),

                section("9. Checklist final",
                    "<ul>"
                    + "<li>✅ 6 servicios: Eureka, Gateway, Auth, Content, Progress, Frontend</li>"
                    + "<li>✅ Arranque manual: 6 terminales, Eureka primero</li>"
                    + "<li>✅ Arranque Docker: <code>docker compose up --build</code></li>"
                    + "<li>✅ Service Discovery con Eureka</li>"
                    + "<li>✅ API Gateway enruta por prefijo de URL</li>"
                    + "<li>✅ JWT para autenticación stateless</li>"
                    + "<li>✅ H2 in-memory (datos se pierden al reiniciar)</li>"
                    + "<li>✅ Seed data automáticos (30 flashcards, 30 quizzes, 6 cinturones)</li>"
                    + "<li>✅ Repetición espaciada integrada en estudio</li>"
                    + "<li>✅ Sistema de cinturones con progreso visual</li>"
                    + "<li>✅ Guía integrada en la propia aplicación (16 capítulos)</li>"
                    + "</ul>"
                    + "<p style='margin-top:1.5rem; font-size:1.1em;'>"
                    + "🥋 <b>¡Enhorabuena!</b> Has completado la guía completa de Spring Boot Dojo. "
                    + "Ahora tienes una aplicación de microservicios funcional con Service Discovery, "
                    + "API Gateway, autenticación JWT, y una guía paso a paso para entenderlo todo.</p>")
            )
        );
    }
}
