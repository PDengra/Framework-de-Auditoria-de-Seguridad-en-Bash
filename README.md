# Security Audit Framework (Bash)

Framework modular de auditoría de seguridad para sistemas Linux. Diseñado para entornos de desarrollo, servidores y pipelines CI/CD, permite realizar auditorías automáticas con logs estructurados y alertas inmediatas por correo electrónico y Telegram.

---

## Características

- Arquitectura modular:
  - `core/`: núcleo del framework (logger, utils, dispatcher, notifier)
  - `checks/`: módulos de auditoría independientes
  - `profiles/`: perfiles de ejecución (`ci`, `server`, `hardened`)
- Auditorías configurables por perfil:
  - **CI**: checks no intrusivos
  - **Server**: auditoría completa de servidor
  - **Hardened**: auditoría completa con políticas estrictas
- Logging estructurado en JSON (`output/audit.json`)
- Notificaciones automáticas:
  - Correo electrónico (usando `msmtp` o similar)
  - Telegram (bot + chat ID)
- Sistema de severidad y scoring: identifica hallazgos críticos y asigna puntuación de riesgo
- Extensible: permite añadir nuevos checks sin modificar el núcleo

---

## Requisitos

- Linux (Ubuntu, Debian, CentOS, Raspberry Pi OS…)
- Bash ≥ 4.x
- Comandos básicos: `sha256sum`, `awk`, `grep`, `curl`, `systemctl` (según checks habilitados)
- Opcional para notificaciones:
  - `msmtp` o `mailx` para correo electrónico
  - Bot de Telegram y `curl` para enviar mensajes

---

## Instalación

```bash
1. Clona el repositorio:

git clone https://github.com/tuusuario/audit-framework.git
cd audit-framework

---

2. Da permisos de ejecución a los scripts:

chmod +x audit.sh
chmod +x checks/*.sh

3. Configura las notificaciones (opcional):

export EMAIL="tucorreo@dominio.com"
export TELEGRAM_BOT_TOKEN="TU BOT TOKEN"
export TELEGRAM_CHAT_ID="TU CHAT ID"

4. Ajusta el perfil de ejecución (opcional):

export AUDIT_MODE="server"    # ci | server | hardened

---

## Ejecutar el framework:

./audit.sh




