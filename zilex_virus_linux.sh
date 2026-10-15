#!/bin/bash
# ======================================================================
#   ZILEX VIRUS - VERSION BROMA (LINUX)
#   100% INOFENSIVO. No borra archivos, no consume recursos sin control,
#   no se repite para siempre. Abre como mucho 12 ventanas/mensajes
#   y luego se detiene solo.
# ======================================================================

mensajes=(
  "Zilex ha poseido tu mouse (es broma, todo sigue bien)"
  "Descargando mas RAM desde la nube..."
  "Tu terminal penso que era una nave espacial"
  "Alerta: nivel de awesomeness critico detectado"
  "Invocando al Zilex supremo..."
  "Tu PC ahora cree que es una tostadora"
  "Cargando chiste malo numero 4..."
  "Buscando el sentido de la vida en /dev/null"
  "Entrenando una IA para que te haga la tarea"
  "Zilex Virus dice: hola!"
  "Probabilidad altisima de que esto sea solo una broma"
  "Autodestruyendo este mensaje en 3, 2, 1... (mentira)"
)

abrir_terminal() {
  local msg="$1"
  if command -v gnome-terminal >/dev/null 2>&1; then
    gnome-terminal -- bash -c "echo; echo '$msg'; sleep 2" &
  elif command -v konsole >/dev/null 2>&1; then
    konsole -e bash -c "echo; echo '$msg'; sleep 2" &
  elif command -v xfce4-terminal >/dev/null 2>&1; then
    xfce4-terminal -e "bash -c \"echo; echo '$msg'; sleep 2\"" &
  elif command -v xterm >/dev/null 2>&1; then
    xterm -e bash -c "echo; echo '$msg'; sleep 2" &
  else
    # Sin entorno grafico disponible: solo imprime el mensaje
    echo "$msg"
    sleep 0.5
  fi
}

echo "=== ZILEX VIRUS [BROMA] activado ==="
for msg in "${mensajes[@]}"; do
  abrir_terminal "$msg"
  sleep 0.4
done

sleep 2
echo
echo "Tranquilo/a :) Esto fue el ZILEX VIRUS, una broma 100% inofensiva."
echo "No se borro ni se modifico nada en tu sistema. Fin de la broma."
