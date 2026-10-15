' ======================================================================
'   ZILEX VIRUS - VERSION BROMA (WINDOWS) v3
'   100% INOFENSIVO. Banco de 30 mensajes, cantidad configurable,
'   titulos disfrazados, beep, "escaneo" falso y resumen final.
'   Uso opcional: cscript Zilex_Virus.vbs 16   (cantidad, max 30)
' ======================================================================

Dim shell, pool, indices, colores, titulos, i, j, n, temp, idx, cantidad, elegidos

Set shell = CreateObject("WScript.Shell")
Randomize

pool = Array( _
    "Zilex ha poseido tu mouse (es broma, todo sigue bien)", _
    "Descargando mas RAM desde la nube...", _
    "Tu teclado aprendio a escribir con acento chileno", _
    "Alerta: nivel de awesomeness critico detectado", _
    "Invocando al Zilex supremo...", _
    "Tu PC ahora cree que es una tostadora", _
    "Cargando chiste malo numero 4...", _
    "Buscando el sentido de la vida en la Papelera de reciclaje", _
    "Entrenando una IA para que te haga la tarea", _
    "Zilex Virus dice: hola!", _
    "Probabilidad altisima de que esto sea solo una broma", _
    "Autodestruyendo este mensaje en 3, 2, 1... (mentira)", _
    "Sincronizando tus calcetines perdidos...", _
    "Tu mouse ha solicitado vacaciones", _
    "Compilando excusas para no hacer la tarea", _
    "El antivirus se rie de este virus", _
    "Zilex esta pensando en un numero del 1 al infinito", _
    "Reiniciando el sentido comun de tu PC", _
    "Tu wifi ahora transmite buenas vibras", _
    "Nivel de bromas: supremo desbloqueado", _
    "Verificando si tu cafe sigue caliente...", _
    "Tu impresora fantasma imprimio un meme", _
    "Actualizando el firmware de tu buen humor", _
    "Zilex encontro un bug... en tu jardin", _
    "Calculando cuantos memes caben en 1GB", _
    "Tu mouse gano una medalla de oro", _
    "Version instalada: Zilex Ultra Broma Edition", _
    "Nada que ver aqui, solo risas", _
    "Tu PC solicito una siesta de 5 minutos (denegada)", _
    "Fin del escaneo: 0 virus reales encontrados" _
)

titulos = Array("ZILEX VIRUS [BROMA]", "definitely_not_a_virus.exe", "zilex_core.sys", "totally_safe.bat", "100porciento_broma.exe", "no_panic.dll")
colores = Array("0A","0B","0C","0D","0E","0F")

' --- Cantidad de mensajes (opcional por argumento, min 1, max banco) ---
cantidad = 12
If WScript.Arguments.Count > 0 Then
    If IsNumeric(WScript.Arguments(0)) Then cantidad = CInt(WScript.Arguments(0))
End If
If cantidad < 1 Then cantidad = 1
If cantidad > UBound(pool) + 1 Then cantidad = UBound(pool) + 1

' --- Barajar indices (Fisher-Yates) ---
n = UBound(pool) + 1
ReDim indices(n - 1)
For i = 0 To n - 1
    indices(i) = i
Next
For i = n - 1 To 1 Step -1
    j = Int(Rnd() * (i + 1))
    temp = indices(i) : indices(i) = indices(j) : indices(j) = temp
Next

' --- "Escaneo" + banner inicial ---
shell.Run "cmd /c title ZILEX VIRUS [BROMA] && color 0A && echo ************************** && echo *      ZILEX VIRUS       * && echo *  (es solo una broma)   * && echo ************************** && echo. && echo Escaneando amenazas (todas falsas)... && timeout /t 1 >nul && echo 0 amenazas reales encontradas && timeout /t 1 >nul", 1, False
WScript.Sleep 2600

' --- Ventanas con mensajes ---
elegidos = ""
For i = 0 To cantidad - 1
    idx = indices(i)
    shell.Run "cmd /c title " & titulos(i Mod 6) & " && color " & colores(i Mod 6) & " && echo. && echo " & pool(idx) & Chr(7) & " && echo. && timeout /t 2 >nul", 1, False
    WScript.Sleep 400
    elegidos = elegidos & "- " & pool(idx) & vbCrLf
Next

WScript.Sleep 2500

MsgBox "(^_^) Zilex te saluda" & vbCrLf & vbCrLf & _
       "Tranquilo/a, esto fue el ZILEX VIRUS: una broma 100% inofensiva." & vbCrLf & _
       "No se borro ni se modifico nada en tu PC." & vbCrLf & vbCrLf & _
       "Bromas entregadas: " & cantidad & "/" & cantidad & vbCrLf & vbCrLf & _
       "Resumen:" & vbCrLf & elegidos, vbInformation, "Zilex Virus - Era solo una broma"
