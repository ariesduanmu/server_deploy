# @Author: Li Qin
# @Date:   2020-05-06 15:30:38
# @Last Modified by:   Li Qin

# @Last Modified time: 2020-05-06 19:09:27

import winreg
import win32con

def register_desktop():
    key_path = 'DesktopBackground\\Shell\\Test'
    reg_flags = winreg.KEY_WRITE | win32con.KEY_WOW64_64KEY | win32con.KEY_SET_VALUE
    reg_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, key_path, access=reg_flags)
    winreg.SetValueEx(reg_key, 'MUIVerb', 0, winreg.REG_SZ, '测试')
    winreg.SetValueEx(reg_key, 'SubCommands', 0, winreg.REG_SZ, '')
    winreg.CloseKey(reg_key)

    shell_key_path = f'{key_path}\\Shell'
    reg_shell_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, shell_key_path, access=reg_flags)
    
    module_key_path = f'{shell_key_path}\\TEST'
    reg_module_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, module_key_path, access=reg_flags)
    winreg.SetValueEx(reg_module_key, '', 0, winreg.REG_SZ, 'sub')
    reg_module_key_command = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, f'{module_key_path}\\command', access=reg_flags)
    command = r'C:\Users\mayn\AppData\Local\Programs\Python\Python37\python.exe F:\test.py'
    winreg.SetValueEx(reg_module_key_command, '', 0, winreg.REG_SZ, command)
    winreg.CloseKey(reg_module_key_command)
    winreg.CloseKey(reg_module_key)

    print('注册完成...')

register_desktop()