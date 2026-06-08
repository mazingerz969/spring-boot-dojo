# Política de seguridad — Spring Boot Dojo

## Reportar vulnerabilidades

Si encuentras un problema de seguridad, **no abras un issue público**. Contacta al mantenedor por mensaje privado (LinkedIn / GitHub).

---

## Medidas implementadas

| Área | Medida |
|------|--------|
| **Contraseñas** | BCrypt (Spring Security) |
| **Sesiones** | JWT stateless, sin cookies de sesión |
| **API** | Endpoints `/api/**` requieren token (excepto auth) |
| **Rate limiting** | 5 req/min en login/registro, 30 req/min general (monolito) |
| **CORS** | Orígenes configurables vía `CORS_ALLOWED_ORIGINS` |
| **H2 console** | Desactivada en perfil `prod` |
| **Secretos** | `JWT_SECRET`, `DB_PASSWORD` solo por variables de entorno |
| **Frontend** | JWT en `localStorage` (ver nota abajo) |

---

## Antes de desplegar (obligatorio)

1. **Genera secretos nuevos** — nunca uses los del `.env.production.example`
   ```bash
   openssl rand -base64 64   # JWT_SECRET
   openssl rand -base64 32   # DB_PASSWORD
   ```

2. **Rota credenciales expuestas** — si alguna API key o password estuvo en Git:
   - Regenera la key en Google Cloud (si aplicaba)
   - Cambia `JWT_SECRET` (invalida tokens antiguos)
   - Cambia `DB_PASSWORD`

3. **Verifica `.gitignore`**
   ```bash
   git check-ignore -v .env.production dojo-frontend-next/.env.local
   ```

4. **CORS en producción** — solo tu dominio:
   ```env
   CORS_ALLOWED_ORIGINS=https://dojo.tudominio.com
   ```

5. **HTTPS** — no expongas login sin TLS en producción

6. **PostgreSQL** — no expongas el puerto 5432 a Internet (Docker internal network only)

---

## Para usuarios de la demo pública

- Usa una **contraseña única** (no reutilices la de email/banco)
- La app es **educativa**; no introduzcas datos personales reales
- Los progresos se guardan en la base de datos del servidor

---

## Limitaciones conocidas

| Tema | Detalle |
|------|---------|
| JWT en localStorage | Vulnerable a XSS; aceptable para demo. Producción enterprise usaría httpOnly cookies |
| Rate limit in-memory | Se reinicia al reiniciar el contenedor; suficiente para demo |
| Microservicios en dev | `auth-service` permite `/h2-console` en dev; usar monolito en prod |

---

## Checklist del mantenedor

- [ ] Secretos solo en `.env.production` (servidor)
- [ ] Repo sin `.env`, `.env.local`, passwords hardcodeados
- [ ] HTTPS activo
- [ ] Backups periódicos de PostgreSQL
- [ ] `docker compose` actualizado tras `git pull`

### Backup PostgreSQL

```bash
docker compose -f docker-compose.prod.yml exec postgres \
  pg_dump -U dojo dojo > backup_$(date +%Y%m%d).sql
```

---

## Dependencias

Actualiza regularmente:

```bash
# Java
mvn versions:display-dependency-updates

# Node
cd dojo-frontend-next && npm audit
```
