# 🖥️ Windows Maintenance Tool

![Version](https://img.shields.io/badge/version-v2.9.9-green)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![License: MIT](https://img.shields.io/badge/license-MIT-blue)

A powerful, all-in-one Windows maintenance toolkit built entirely in Batch.  
Designed for power users, sysadmins, and curious tinkerers – now smarter, safer, and fully offline-compatible.

---

# 🇪🇸 Herramienta de Mantenimiento para Windows

Un completo kit de herramientas de mantenimiento para Windows, hecho totalmente en Batch.  
Pensado para usuarios avanzados, administradores y curiosos – ahora más inteligente, seguro y compatible fuera de línea.

---

## 📸 Screenshot / Captura de Pantalla

![f562edf726d2e0880f1089c29136693d](https://github.com/user-attachments/assets/edb29f79-6e6b-43bf-bd12-6e5abd8da74a)

---

## ✅ Features / Características

- Run essential repair tools: `SFC`, `DISM`, `CHKDSK`  
  Ejecuta utilidades esenciales de reparación: `SFC`, `DISM`, `CHKDSK`
- Windows Update via `winget` (interactive selection)  
  Actualiza Windows usando `winget` (selección interactiva)
- View and upgrade individual packages (choose by ID)  
  Ver y actualizar paquetes individuales (elige por ID)
- Network diagnostics: `ipconfig`, routing table, DNS config, adapter reset  
  Diagnóstico de red: `ipconfig`, tabla de rutas, configuración DNS, reinicio de adaptadores
- Clean temp files, logs, and browser cache  
  Limpia archivos temporales, logs y caché de navegadores
- Save detailed reports to Desktop or custom folder:  
  Guarda informes detallados en el Escritorio o carpeta personalizada:
  - System Info, Network Info, Driver List  
    Info del sistema, info de red, lista de drivers
- Registry tools:  
  Herramientas del registro:
  - Safe cleanup, backup, corruption scan  
    Limpieza segura, respaldo, escaneo de corrupción
- Fully menu-driven interface with clean output  
  Interfaz completamente por menús, con salida clara
- All language/region support – no hardcoded adapter names  
  Soporte para todos los idiomas y regiones – sin nombres de adaptadores codificados
- No third-party dependencies required  
  Sin dependencias de terceros

---

## ⚙️ Installation / Instalación

1. Download the `.bat` file.  
   Descarga el archivo `.bat`.
2. **Right-click → Run as Administrator** (auto-elevation supported).  
   **Clic derecho → Ejecutar como administrador** (soporta auto-elevación).
3. Follow the interactive menu.  
   Sigue el menú interactivo.

> ⚠️ Script output may appear in your system language (e.g. English, Danish, etc). This is normal.  
> ⚠️ La salida del script puede aparecer en el idioma de tu sistema (inglés, danés, etc). Es normal.

---

## 📁 Output Files / Archivos Generados

Saved directly to your chosen folder (by default: Desktop\SystemReports):  
Guardados directamente en la carpeta que elijas (por defecto: Escritorio\SystemReports):

- `System_Info_YYYY-MM-DD.txt`
- `Network_Info_YYYY-MM-DD.txt`
- `Driver_List_YYYY-MM-DD.txt`
- `routing_table_YYYY-MM-DD.txt`

---

## 🧪 Troubleshooting & FAQ / Solución de Problemas & Preguntas Frecuentes

**Q: The script didn’t restart as Admin?**  
**P: ¿El script no se reinició como Administrador?**  
A: Make sure UAC is enabled. Right-click and select **Run as Administrator**.  
R: Asegúrate de que UAC está activado. Haz clic derecho y elige **Ejecutar como administrador**.

**Q: Why does it crash when selecting winget upgrades?**  
**P: ¿Por qué falla al seleccionar actualizaciones con winget?**  
A: Ensure you are running the latest version. All input is validated and error-handled.  
R: Asegúrate de tener la última versión. Todas las entradas se validan y gestionan errores.

**Q: Why was Registry Defrag removed?**  
**P: ¿Por qué se eliminó el desfragmentador del registro?**  
A: The feature depended on a third-party tool (NTREGOPT) which is no longer accessible.  
The script is now fully offline and native to Windows.  
R: Dependía de una herramienta externa (NTREGOPT) que ya no está disponible.  
El script ahora es completamente offline y nativo de Windows.

---

## ✍️ Changelog (v2.9.9) / Registro de Cambios

See `CHANGELOG.md` for full history.  
Consulta `CHANGELOG.md` para el historial completo.

- Major DNS tools rewrite: works on all language editions (adapter auto-detection)  
  Reescritura de herramientas DNS: funciona en todos los idiomas (detección automática de adaptadores)
- Reports now save to a dedicated folder (`SystemReports`) on Desktop (auto-created)  
  Los informes ahora se guardan en una carpeta del Escritorio (`SystemReports`, se crea automáticamente)
- Improved error logging: any script errors are saved to `Desktop\WMT_errorlog.txt`  
  Mejor registro de errores: cualquier error se guarda en `Escritorio\WMT_errorlog.txt`
- User can choose report save location or get a guided walkthrough  
  El usuario puede elegir la carpeta de guardado o seguir una guía
- Safer temp deletion, confirmation required  
  Eliminación de temporales más segura, requiere confirmación
- Registry cleanup improved, more backup and restore options  
  Limpieza de registro mejorada, más opciones de respaldo y restauración
- Bug fixes and performance tweaks throughout  
  Corrección de errores y mejoras de rendimiento

---

## 🤝 Contributing / Colabora

Pull requests, issues, and feedback are welcome!  
¡Pull requests, issues y sugerencias son bienvenidas!  
See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.  
Consulta [CONTRIBUTING.md](CONTRIBUTING.md) para las pautas.

---

## 📜 License / Licencia

Licensed under the **MIT License**.  
Bajo licencia **MIT**.  
See [`LICENSE`](LICENSE) for full details.  
Ver [`LICENSE`](LICENSE) para más detalles.

---

## 🔗 Related Projects / Proyectos Relacionados

- [🍎 MSS – Mac Service Script](https://github.com/ios12checker/MSS-Mac-Service-Script)
