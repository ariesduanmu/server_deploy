# @Author: Li Qin
# @Date:   2020-05-06 15:30:38
# @Last Modified by:   Li Qin

# @Last Modified time: 2020-05-07 11:33:01

import winreg


def register_desktop():
    key_path = 'DesktopBackground\\Shell\\Test'
    shell_key_path = f'{key_path}\\Shell'
    module_key_path = f'{shell_key_path}\\TEST'

    test = '测试'
    sub = 'sub'
    command = r'C:\Users\mayn\AppData\Local\Programs\Python\Python37\python.exe F:\test.py'

    reg_flags = winreg.KEY_WRITE | winreg.KEY_WOW64_64KEY | winreg.KEY_SET_VALUE
    
    reg_set_father_value_ex(reg_flags, key_path, test, shell_key_path)
    reg_set_value_ex(reg_flags, module_key_path, sub, command)

    print('注册完成...')

def reg_set_father_value_ex(reg_flags, key_path, value, shell_key_path):
    # 父级菜单
    reg_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, key_path, access=reg_flags)
    winreg.SetValueEx(reg_key, 'MUIVerb', 0, winreg.REG_SZ, value)
    winreg.SetValueEx(reg_key, 'SubCommands', 0, winreg.REG_SZ, '')
    winreg.CloseKey(reg_key)

    # 子级菜单
    reg_shell_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, shell_key_path, access=reg_flags)
    winreg.CloseKey(reg_shell_key)

def reg_set_value_ex(reg_flags, key_path, value, command):
    command_key_path = f'{key_path}\\command'

    reg_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, key_path, access=reg_flags)
    winreg.SetValueEx(reg_key, 'MUIVerb', 0, winreg.REG_SZ, value)
    reg_command_key = winreg.CreateKeyEx(winreg.HKEY_CLASSES_ROOT, command_key_path, access=reg_flags)
    winreg.SetValueEx(reg_command_key, '', 0, winreg.REG_SZ, command)
    winreg.CloseKey(reg_command_key)
    winreg.CloseKey(reg_key)

register_desktop()