#!/usr/bin/env python3
import sys
import os
import subprocess

# This script acts as a Rofi mode.
# Usage: ./rofi_category_mode.py <CategoryName>

if len(sys.argv) < 2:
    sys.exit(1)

category = sys.argv[1]
rofi_info = os.environ.get('ROFI_INFO')

# If ROFI_INFO is set, an item was selected
import datetime
with open('/tmp/rofi_log.txt', 'a') as f:
    f.write(f"{datetime.datetime.now()}: rofi_info='{rofi_info}', args={sys.argv}\n")

if rofi_info:
    # We must disown the process so rofi can exit cleanly
    try:
        subprocess.Popen(['gtk-launch', rofi_info], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, start_new_session=True)
    except Exception as e:
        with open('/tmp/rofi_log.txt', 'a') as f:
            f.write(f"Error launching: {e}\n")
    sys.exit(0)

# Otherwise, list the desktop files that match the category
dirs = [os.path.expanduser('~/.local/share/applications'), '/usr/share/applications']

desktop_files = {}
for d in dirs:
    if os.path.exists(d):
        for f in os.listdir(d):
            if f.endswith('.desktop'):
                if f not in desktop_files:
                    desktop_files[f] = os.path.join(d, f)

# Print out the entries
for basename, path in desktop_files.items():
    try:
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception:
        continue
        
    has_category = False
    no_display = False
    name = basename
    icon = ""
    
    # Fast parsing
    for line in content.splitlines():
        if line.startswith('Categories='):
            cats = line.split('=', 1)[1].split(';')
            if category in cats:
                has_category = True
        elif line.startswith('Name=') and name == basename: # only grab the first Name= (default locale)
            name = line.split('=', 1)[1].strip()
        elif line.startswith('Icon='):
            icon = line.split('=', 1)[1].strip()
        elif line.startswith('NoDisplay=') and line.split('=', 1)[1].strip().lower() == 'true':
            no_display = True
            
    if has_category and not no_display:
        # Output Rofi format: Name\0icon\x1fIconName\x1finfo\x1fbasename
        print(f"{name}\0icon\x1f{icon}\x1finfo\x1f{basename}")
