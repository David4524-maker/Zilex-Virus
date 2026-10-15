#!/bin/bash
# ======================================================================
#   ZILEX VIRUS - VERSION BROMA (macOS)
#   100% INOFENSIVO. No borra archivos, no modifica el sistema,
#   no se repite para siempre. Abre como mucho 12 ventanas de Terminal
#   con mensajes graciosos y luego se detiene solo.
# ======================================================================

mensajes=(
  "Zilex ha poseido tu mouse (es broma, todo sigue bien)"
  "Descargando mas RAM desde la nube..."
  "Tu Mac penso que era un iPhone gigante"
  "Alerta: nivel de awesomeness critico detectado"
  "Invocando al Zilex supremo..."
  "Tu PC ahora cree que es una tostadora"
  "Cargando chiste malo numero 4..."
  "Buscando el sentido de la vida en la Papelera"
  "Entrenando una IA para que te haga la tarea"
  "Zilex Virus dice: hola!"
  "Probabilidad altisima de que esto sea solo una broma"
  "Autodestruyendo este mensaje en 3, 2, 1... (mentira)"
)

echo "=== ZILEX VIRUS [BROMA] activado ==="

for msg in "${mensajes[@]}"; do
  osascript -e "tell application \"Terminal\" to do script \"echo '$msg'; sleep 2; exit\"" >/dev/null 2>&1
  sleep 0.4
done

sleep 2
echo
echo "Tranquilo/a :) Esto fue el ZILEX VIRUS, una broma 100% inofensiva."
echo "No se borro ni se modifico nada en tu sistema. Fin de la broma."
echo "(Puedes cerrar las ventanas de Terminal que hayan quedado abiertas)"
