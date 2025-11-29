#!/usr/bin/env python3
import os
from i3ipc import Connection, Event

# Caminho do arquivo que você quer modificar
CACHE_DIR = os.path.expanduser("~/.cache/i3")
SPLIT_FILE = os.path.join(CACHE_DIR, "split_mode")

# Garante que a pasta existe
os.makedirs(CACHE_DIR, exist_ok=True)

def update_split_file(status):
    """Escreve HORIZONTAL ou VERTICAL no arquivo"""
    try:
        with open(SPLIT_FILE, "w") as f:
            f.write(status)
    except Exception as e:
        print(f"Erro ao escrever arquivo: {e}")

def on_window_focus(i3, event):
    container = event.container
    
    # Ignora janelas flutuantes, tabbed, stacked ou fullscreen
    if (container.floating or 
        container.fullscreen_mode or 
        container.parent.layout in ['tabbed', 'stacked']):
        print(container.floating)
        return

    # Lógica de geometria (Fibonacci/Espiral)
    if container.rect.height > container.rect.width:
        container.command('split v')
        update_split_file("VERTICAL")
    
    else:
        container.command('split h')
        update_split_file("HORIZONTAL")

def on_window_focus(i3, event):
    c = event.container

    # Detecta se está flutuando corretamente
    floating = getattr(c, "floating", "")
    is_floating = isinstance(floating, str) and floating.endswith("_on")

    # Fullscreen
    is_fullscreen = getattr(c, "fullscreen_mode", 0) == 1

    if is_floating or is_fullscreen:
        return

    # Sobe na árvore para verificar se tem um ancestor tabbed ou stacked
    ancestor = c.parent
    while ancestor:
        layout = getattr(ancestor, "layout", None)
        # Se encontrar tabbed ou stacked, ignora (retorna)
        if layout in ("tabbed", "stacked"):
            print("Ancestor layout é", layout, "- ignorando split")
            return

        # Se chegou num workspace, pode parar de subir (ou seguir, se quiser)
        if getattr(ancestor, "type", None) == "workspace":
            break

        ancestor = ancestor.parent

    # Se chegou aqui, não está em tabbed/stacked nem flutuando/fullscreen
    # Agora decide o split baseado na geometria
    rect = getattr(c, "rect", None)
    if not rect:
        return

    if rect.height > rect.width:
        c.command("split v")
        update_split_file("VERTICAL")  # sua função externa
    else:
        c.command("split h")
        update_split_file("HORIZONTAL")



i3 = Connection()
i3.on(Event.WINDOW_FOCUS, on_window_focus)
i3.main()