# Zilex Virus

Un "virus" de broma inofensivo. No borra archivos, no modifica el sistema, no se replica ni corre para siempre: cada versión muestra una serie **fija** (12) de mensajes graciosos y luego se detiene sola.

> ⚠️ **Importante:** esto está pensado para ejecutarlo **en tu propia PC** o con el conocimiento y consentimiento de la persona dueña del equipo. No lo instales en la computadora de alguien sin avisarle; aunque es inofensivo, puede asustar o generar desconfianza si la persona no sabe que es una broma.

## Archivos incluidos

| Archivo | Sistema | Qué hace |
|---|---|---|
| `zilex_virus.vbs` | Windows | Abre 12 ventanas de consola (CMD) con mensajes, cada una se cierra sola a los 2 segundos |
| `zilex_virus_linux.sh` | Linux | Abre 12 ventanas de terminal (gnome-terminal / konsole / xfce4-terminal / xterm); si no hay entorno gráfico, imprime los mensajes directo en la terminal |
| `zilex_virus_macos.sh` | macOS | Abre hasta 12 ventanas de Terminal.app vía AppleScript, una por mensaje |
| `index.html` | Cualquiera (navegador) | Simulador visual: una animación tipo "terminal hackeada" que corre dentro del navegador, sin tocar nada del sistema real |

## Cómo ejecutar cada versión

### Windows — `Zilex_Virus.vbs`
1. Descarga el archivo `zilex_virus.vbs`.
2. Haz doble clic sobre él.
3. Si Windows SmartScreen muestra una advertencia (normal en scripts `.vbs` descargados), elige "Más información" → "Ejecutar de todas formas".
4. Verás 12 ventanas de consola aparecer una tras otra con mensajes, y al final un cuadro de diálogo confirmando que fue una broma.

### Linux — `zilex_virus_linux.sh`
```bash
chmod +x zilex_virus_linux.sh
./zilex_virus_linux.sh
```
Necesita alguno de estos emuladores de terminal instalados: `gnome-terminal`, `konsole`, `xfce4-terminal` o `xterm`. Si no encuentra ninguno, simplemente imprime los mensajes en la terminal donde lo ejecutaste.

### macOS — `zilex_virus_macos.sh`
```bash
chmod +x zilex_virus_macos.sh
./zilex_virus_macos.sh
```
La primera vez, macOS puede pedir permiso para que Terminal controle otras ventanas de Terminal (vía AppleScript/osascript) — acepta el permiso para que funcione.

### Simulador — `zilex_simulator.html`
Solo ábrelo con doble clic en cualquier navegador (Chrome, Firefox, Safari, Edge) y presiona "Ejecutar Zilex Virus". No requiere instalación ni permisos.

## Personalizar los mensajes

En las tres versiones de script, los mensajes están en un arreglo cerca del inicio del archivo:

- VBS: variable `mensajes = Array(...)`
- Linux/macOS: variable `mensajes=(...)`
- Simulador HTML: arreglo `const mensajes = [...]` dentro de `<script>`

Puedes editar, agregar o quitar líneas ahí. Evita usar los caracteres `& | < > ^ %` dentro de los mensajes en la versión Windows, ya que son símbolos especiales para `cmd.exe` y pueden romper el script.

## Por qué es seguro

- El número de ventanas/mensajes está **fijo** (12), nunca es infinito.
- Ninguna versión borra, mueve, cifra ni modifica archivos.
- Ninguna versión instala nada ni se agrega al inicio del sistema.
- Cada ventana se cierra sola después de 2 segundos (Windows y Linux) o puede cerrarse manualmente si el sistema operativo no lo permite automáticamente (macOS).
- El simulador web no interactúa con el sistema operativo en absoluto: es solo HTML/CSS/JS dentro del navegador.

## Licencia / uso

Libre para usar y modificar con fines de broma inofensiva entre amigos o para aprender scripting. Licencia: MIT
