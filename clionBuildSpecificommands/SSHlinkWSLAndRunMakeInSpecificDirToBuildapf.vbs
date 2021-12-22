Dim WshShell 
Set WshShell=WScript.CreateObject("WScript.Shell") 
WshShell.Run "cmd.exe"
WScript.Sleep 150
WshShell.SendKeys "ssh tridu33@127.0.0.1 -p 2222"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 150
WshShell.SendKeys "12345678"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500 
WshShell.SendKeys "cd /mnt/d/tridu33/apfmakefile"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500 
WshShell.SendKeys "make"
WshShell.SendKeys "{ENTER}"











