#!/bin/bash
# ======================================================================
#   ZILEX VIRUS - VERSION BROMA (LINUX) v3
#   100% INOFENSIVO. Banco de 30 mensajes, cantidad configurable,
#   disfraces de "proceso", beep, escaneo falso y resumen final.
#   Uso opcional: ./zilex_virus_linux.sh 16   (cantidad, max 30)
# ======================================================================

pool=(
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
  "Sincronizando tus calcetines perdidos..."
  "Tu mouse ha solicitado vacaciones"
  "Compilando excusas para no hacer la tarea"
  "El antivirus se rie de este virus"
  "Zilex esta pensando en un numero del 1 al infinito"
  "Reiniciando el sentido comun de tu PC"
  "Tu wifi ahora transmite buenas vibras"
  "Nivel de bromas: supremo desbloqueado"
  "Verificando si tu cafe sigue caliente..."
  "Tu impresora fantasma imprimio un meme"
  "Actualizando el firmware de tu buen humor"
  "Zilex encontro un bug... en tu jardin"
  "Calculando cuantos memes caben en 1GB"
  "Tu mouse gano una medalla de oro"
  "Version instalada: Zilex Ultra Broma Edition"
  "Nada que ver aqui, solo risas"
  "Tu PC solicito una siesta de 5 minutos (denegada)"
  "Fin del escaneo: 0 virus reales encontrados"
)
titulos=("zilex_core.sys" "definitely_not_a_virus" "totally_safe.bat" "100porciento_broma" "no_panic.dll" "zilex_virus_broma")
colores=(32 33 34 35 36 95)

# --- Cantidad de mensajes (argumento opcional, min 1, max banco) ---
n_msgs="${1:-12}"
[[ "$n_msgs" =~ ^[0-9]+$ ]] || n_msgs=12
(( n_msgs < 1 )) && n_msgs=1
(( n_msgs > ${#pool[@]} )) && n_msgs=${#pool[@]}

# --- Barajar indices (Fisher-Yates) ---
idxs=($(seq 0 $(( ${#pool[@]} - 1 ))))
for ((i=${#idxs[@]}-1; i>0; i--)); do
  j=$(( RANDOM % (i+1) ))
  tmp=${idxs[i]}; idxs[i]=${idxs[j]}; idxs[j]=$tmp
done
elegidos=()
for ((i=0; i<n_msgs; i++)); do elegidos+=("${pool[${idxs[i]}]}"); done

abrir_terminal() {
  local msg="$1" color="$2" titulo="$3"
  local linea1 linea2
  linea1=$(printf "\033[2m[%s]\033[0m" "$titulo")
  linea2=$(printf "\a\033[1;%sm%s\033[0m" "$color" "$msg")
  if command -v gnome-terminal >/dev/null 2>&1; then
    gnome-terminal -- bash -c "echo -e \"$linea1\"; echo -e \"$linea2\"; sleep 2" &
  elif command -v konsole >/dev/null 2>&1; then
    konsole -e bash -c "echo -e \"$linea1\"; echo -e \"$linea2\"; sleep 2" &
  elif command -v xfce4-terminal >/dev/null 2>&1; then
    xfce4-terminal -e "bash -c \"echo -e '$linea1'; echo -e '$linea2'; sleep 2\"" &
  elif command -v xterm >/dev/null 2>&1; then
    xterm -e bash -c "echo -e \"$linea1\"; echo -e \"$linea2\"; sleep 2" &
  else
    echo -e "$linea1"; echo -e "$linea2"; sleep 0.5
  fi
}

echo "╔══════════════════════════╗"
echo "║      ZILEX VIRUS         ║"
echo "║   (es solo una broma)    ║"
echo "╚══════════════════════════╝"

echo -n "Escaneando amenazas (todas falsas) "
for i in $(seq 1 10); do echo -n "."; sleep 0.1; done
echo " 0 encontradas"

for i in "${!elegidos[@]}"; do
  abrir_terminal "${elegidos[$i]}" "${colores[$((i % 6))]}" "${titulos[$((i % 6))]}"
  sleep 0.4
done

sleep 2
echo
echo "   (^_^)  Zilex te saluda"
echo "Tranquilo/a :) Esto fue el ZILEX VIRUS, una broma 100% inofensiva."
echo "No se borro ni se modifico nada en tu sistema."
echo
echo "Resumen de la broma:"
for m in "${elegidos[@]}"; do echo " - $m"; done
echo "Bromas entregadas: ${#elegidos[@]}/${#elegidos[@]}"
