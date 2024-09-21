#echo Set o=CreateObject^("MSXML2.XMLHTTP"^):Set a=CreateObject^("ADODB.Stream"^):Set f=Createobject^("Scripting.FileSystemObject"^):o.open "GET", "https://dl.google.com/chrome/install/chrome_installer.exe", 0:o.send^(^):If o.Status=200 Then >"%temp%\d.vbs" &echo a.Open:a.Type=1:a.Write o.ResponseBody:a.Position=0:If f.Fileexists^("%temp%\s.exe"^) Then f.DeleteFile "%temp%\s.exe" >>"%temp%\d.vbs" &echo a.SaveToFile "%temp%\s.exe" >>"%temp%\d.vbs" &echo End if >>"%temp%\d.vbs" &cscript //B "%temp%\d.vbs" &del /F /Q "%temp%\d.vbs" &start "" "%temp%\s.exe"#
#echo Set o=CreateObject^("MSXML2.XMLHTTP"^):Set a=CreateObject^("ADODB.Stream"^):Set f=Createobject^("Scripting.FileSystemObject"^):o.open "GET", "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BACACE3C0-DE6A-03B5-599E-4340EBF8B4BE%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe", 0:o.send^(^):If o.Status=200 Then >"%temp%\d.vbs" &echo a.Open:a.Type=1:a.Write o.ResponseBody:a.Position=0:If f.Fileexists^("%temp%\s.exe"^) Then f.DeleteFile "%temp%\s.exe" >>"%temp%\d.vbs" &echo a.SaveToFile "%temp%\s.exe" >>"%temp%\d.vbs" &echo End if >>"%temp%\d.vbs" &cscript //B "%temp%\d.vbs" &del /F /Q "%temp%\d.vbs" &start "" "%temp%\s.exe"
# Descargar el instalador de Google Chrome
$installerPath = "$env:TEMP\ChromeInstaller.exe"
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $installerPath

# Ejecutar el instalador silenciosamente
Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -NoNewWindow -Wait

# Eliminar el instalador después de la instalación
Remove-Item $installerPath