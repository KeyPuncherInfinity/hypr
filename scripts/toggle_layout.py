import os
from pathlib import Path

file_path = Path("~/.config/hypr/variables/layout.conf").expanduser()

def write_variable(data):
    try: 
        with open(file_path, 'w', encoding='utf-8') as file:
                file.write(data)
    except FileNotFoundError:
        print(f"Error: The file '{file_path}' was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")


try:
    with open(file_path, 'r+', encoding='utf-8') as file:
        content = file.read()
        items = content.split(" ") # ["$layout", "=", "scrolling"]
        if len(items) != 3:
            write_variable("$layout = scrolling")

        if items[2] == "scrolling":
            write_variable("$layout = dwindle")
        elif items[2] == "dwindle":
            write_variable("$layout = scrolling")
        else:
            write_variable("$layout = dwindle")

except FileNotFoundError:
    print(f"Error: The file '{file_path}' was not found.")
except Exception as e:
    print(f"An error occurred: {e}")
