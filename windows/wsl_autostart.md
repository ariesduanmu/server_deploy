
* Example: auto start ssh service:

save as `sshserver.vbe` in `C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

```vbe
Set ws = CreateObject("Wscript.Shell") 
ws.run "wsl -d Ubuntu -u root service ssh start", vbhide
```
