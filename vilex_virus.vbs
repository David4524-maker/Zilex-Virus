' ======================================================================
'   ZILEX VIRUS - VERSION BROMA (WINDOWS)
'   100% INOFENSIVO. No borra archivos, no modifica el sistema,
'   no se instala ni se repite para siempre. Abre 12 ventanas con
'   mensajes graciosos (que se cierran solas) y termina con un aviso.
' ======================================================================

Dim shell, mensajes, i
Set shell = CreateObject("WScript.Shell")

mensajes = Array( _
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
    "Autodestruyendo este mensaje en 3, 2, 1... (mentira)" _
)

For i = 0 To UBound(mensajes)
    shell.Run "cmd /c title ZILEX VIRUS [BROMA] && color 0A && echo. && echo " & mensajes(i) & " && echo. && timeout /t 2 >nul", 1, False
    WScript.Sleep 450
Next

WScript.Sleep 2500

MsgBox "Tranquilo/a :)" & vbCrLf & vbCrLf & _
       "Esto fue el ZILEX VIRUS, una broma 100% inofensiva." & vbCrLf & _
       "No se borro ni se modifico nada en tu PC." & vbCrLf & vbCrLf & _
       "Fin de la broma.", vbInformation, "Zilex Virus - Era solo una broma"
