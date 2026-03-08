# 📖 GUIA-DESARROLLO.md — Cómo funciona y cómo modificar la Guía del Dojo

*Documento de referencia para futuros cambios en la sección "Guía" de la app.*

---

## ¿Dónde está la guía?

La guía se renderiza **dentro de la propia aplicación** (no es un archivo markdown externo).  
Los archivos involucrados son:

| Archivo | Qué hace |
|---------|----------|
| `dojo-frontend/src/.../controller/GuiaController.java` | Contiene TODO el contenido de la guía (pasos, secciones, texto, código) |
| `dojo-frontend/src/.../templates/guia.html` | Template Thymeleaf que renderiza la guía |
| `dojo-frontend/src/.../templates/fragments/layout.html` | Navbar con enlace a `/guia` |

---

## Arquitectura de la guía

### Estructura de datos

La guía es una **lista de pasos** (`List<Map<String, Object>> PASOS`), definida como variable estática en `GuiaController.java`.

Cada paso tiene:

```java
{
    "num": 1,                    // Número del paso (1-indexed)
    "title": "Título del paso",  // Se muestra en sidebar + header
    "icon": "bi-folder2-open",   // Icono Bootstrap Icons (clase CSS)
    "intro": "Texto intro...",   // Se muestra en un alert azul arriba
    "sections": [                // Lista de secciones dentro del paso
        {
            "title": "Nombre sección",
            "content": "<p>HTML aquí</p>"  // ⚠️ Se renderiza con th:utext (HTML crudo)
        }
    ]
}
```

### Cómo se navega

- URL: `/guia?paso=0` (0-indexed)
- Sidebar izquierdo con todos los pasos
- Botones "Anterior" / "Siguiente" abajo
- El paso activo se resalta en el sidebar

### Iconos disponibles

Se usa [Bootstrap Icons](https://icons.getbootstrap.com/). Formato: `bi-nombre-icono`.

Algunos útiles:
- `bi-folder2-open` — Carpetas/proyecto
- `bi-broadcast` — Red/discovery
- `bi-diagram-3` — Gateway/rutas
- `bi-shield-lock` — Seguridad/auth
- `bi-database` — Base de datos
- `bi-graph-up-arrow` — Progreso
- `bi-window-desktop` — Frontend
- `bi-box-seam` — Docker
- `bi-rocket-takeoff` — Arranque
- `bi-gear` — Configuración
- `bi-code-slash` — Código
- `bi-book` — Documentación
- `bi-tools` — Herramientas
- `bi-puzzle` — Plugins
- `bi-arrow-repeat` — Repetición
- `bi-trophy` — Logros/cinturones
- `bi-terminal` — Terminal/comandos

---

## Cómo añadir un paso nuevo

### 1. En `GuiaController.java`, dentro del bloque `static { }`:

```java
addPaso(10, "Mi Nuevo Paso", "bi-icono",
    "Texto de introducción que explica de qué va este paso.",
    List.of(
        section("Título Sección 1", "Contenido HTML aquí"),
        section("Título Sección 2", "<pre><code>código aquí</code></pre>"),
        section("💡 Conceptos clave", "<ul><li>Punto 1</li><li>Punto 2</li></ul>")
    ));
```

### 2. Reglas del contenido HTML:

- Se renderiza con `th:utext` → acepta **HTML crudo**
- Para código: usar `<pre><code>...</code></pre>`
- Para listas: usar `<ul><li>...</li></ul>` o `<ol>`
- Para links: `<a href='url' target='_blank'>texto</a>`
- Para tablas: `<table class='table table-sm'>...</table>`
- Escapar `<` y `>` dentro de código XML/Java: usar `&lt;` y `&gt;`
- Los saltos de línea en `<pre>` se respetan

### 3. Cuidado con las comillas:

En Java, las comillas dobles dentro de strings se escapan:
```java
section("Ejemplo", "Usa <code>\"mi-valor\"</code> para configurar")
// O mejor, usa comillas simples en el HTML:
section("Ejemplo", "Usa <code>'mi-valor'</code> para configurar")
```

---

## Cómo modificar un paso existente

1. Busca el `addPaso(N, ...)` correspondiente en `GuiaController.java`
2. Modifica el título, intro o secciones
3. No cambies el número (`N`) sin actualizar los demás — son secuenciales
4. Recompila y reinicia el frontend: `mvn spring-boot:run` en `dojo-frontend/`

---

## Cómo eliminar un paso

1. Borra el `addPaso(N, ...)` del bloque `static { }`
2. **Renumera** los pasos siguientes (o deja huecos, pero queda feo en el sidebar)
3. La navegación se ajusta automáticamente (usa `PASOS.size()`)

---

## Estilo visual

- **Tema oscuro** — fondo `bg-dark`, texto `text-light`
- **Código** — fondo negro (`bg-black`), texto cyan (`#8be9fd`)
- **Links** — azul GitHub (`#58a6ff`)
- **Títulos de sección** — amarillo (`text-warning`)
- **Intro** — alert con borde info sobre fondo oscuro

Los estilos están inline en `guia.html` dentro de un `<style>`:
```css
.guia-content { color: #ffffff !important; }
.guia-content pre code { color: #8be9fd !important; }
.guia-content a { color: #58a6ff !important; }
```

---

## Estructura de capítulos (v2 — Marzo 2026)

La guía se reorganizó en 16 capítulos para cubrir TODO el proyecto paso a paso:

| # | Capítulo | Descripción |
|---|----------|-------------|
| 1 | Preparación del entorno | JDK 17, Maven, IntelliJ, plugins, configuración |
| 2 | Proyecto Padre Maven | Multi-módulo, pom.xml padre, estructura carpetas |
| 3 | Eureka Server | Service Discovery, qué es, configuración |
| 4 | Auth Service | Spring Security, JWT, login, registro, H2 |
| 5 | Content Service | Entidades, repos, services, controllers, DataSeeder |
| 6 | API Gateway | Rutas, filtros JWT, WebFlux vs MVC |
| 7 | Frontend Base | Thymeleaf, Bootstrap, login, register, AppConfig |
| 8 | Dashboard + Estudio | Dashboard con cinturones, modo estudio flashcards |
| 9 | Sistema de Quizzes | Quiz, feedback, resultados, sesión HTTP |
| 10 | Progress Service | UserProgress, racha, BeltProgress |
| 11 | Repetición Espaciada | UserFlashcardHistory, prioridad, algoritmo |
| 12 | Sistema de Cinturones | Desbloqueo progresivo, mastered, progress bars |
| 13 | Ejercicios de Código | CodeExercise, editor, validación por keywords |
| 14 | Guía Integrada | Esta guía dentro de la app (meta!) |
| 15 | Docker Compose | Containerización, healthchecks, orden arranque |
| 16 | Errores Comunes | Compilación de problemas y soluciones |

### Versión anterior (v1)

La v1 tenía 9 pasos más resumidos, sin cubrir la preparación del entorno ni las funcionalidades avanzadas (quizzes, repetición espaciada, cinturones, ejercicios). Se reescribió completamente en marzo 2026 para ser un tutorial paso a paso completo.

---

## Testing

Después de modificar la guía:

1. Recompila: `cd dojo-frontend && mvn spring-boot:run`
2. Abre http://localhost:8090/guia
3. Navega por TODOS los pasos (anterior/siguiente)
4. Verifica que el código se ve bien (indentación, colores)
5. Comprueba que los links funcionan
6. Revisa en móvil (responsive) — el sidebar se apila arriba en pantallas pequeñas

---

## Notas importantes

- **Todo el contenido está en Java** — no en archivos markdown externos. Esto simplifica el deployment (un solo JAR) pero hace que editar contenido largo sea verboso.
- **Alternativa futura**: Mover el contenido a archivos `.md` o `.json` en `resources/` y cargarlos dinámicamente. Pero por ahora, hardcodeado en Java funciona bien.
- **El HTML no se sanitiza** — cuidado con inyección si algún día el contenido viene de usuarios (ahora es estático, no hay riesgo).

---

*Última actualización: 1 de marzo de 2026*
