import threading
import subprocess
from pynput import keyboard
from pystray import Icon as icon, Menu as menu, MenuItem as item
import PIL.Image

def on_press(key):
    if key == keyboard.Key.f2:
        # Run the specified script
        subprocess.run(["python", "C:\\Users\\danewagenhoffer\\pyrq\\2bing.py"])

def keyboard_listener():
    with keyboard.Listener(on_press=on_press) as listener:
        listener.join()

def create_icon(icon):
    icon.visible = True
    icon.run()

if __name__ == '__main__':
    # Thread for keyboard listener
    listener_thread = threading.Thread(target=keyboard_listener)
    listener_thread.start()

    # System tray icon
    image = PIL.Image.open(r"C:\Users\danewagenhoffer\Downloads\DALL·E 2023-11-29 10.45.34 - A simple and modern icon design, suitable for a Python script. The icon should have a stylized Python snake, coiled or looping, in shades of green and.png")  # Path to your icon image
    tray_icon = icon('test_icon', image, menu=menu(item('Exit', lambda: exit())))

    # Thread for system tray icon
    icon_thread = threading.Thread(target=create_icon, args=(tray_icon,))
    icon_thread.start()
