### Custome regedit on Windows10

Example:

test.bat

```bat
python.exe test.py
```


test.reg

```reg
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\*\shell\test\command]
@="test.bat"
```

run test.reg as Administrator