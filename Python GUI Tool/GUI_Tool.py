import tkinter as tk
import serial

# Initialize PySerial connection
ser = serial.Serial('COM6', 115200, timeout=1)
ser.flush()


def send_message(name, *args):
    # Determine which variable changed based on the name
    if name == var_r._name:
        message = f"R:{var_r.get()}|G:{var_g.get()}|B:{var_b.get()}"
    elif name == var_g._name:
        message = f"R:{var_r.get()}|G:{var_g.get()}|B:{var_b.get()}"
    elif name == var_b._name:
        message = f"R:{var_r.get()}|G:{var_g.get()}|B:{var_b.get()}"
    else:
        message = f"H:{var_h.get()}|S:{var_s.get()}|V:{var_v.get()}"

    # Append LF line ending
    message += '\n'

    # Send the constructed message via PySerial
    ser.write(message.encode('utf-8'))




# Create the main window
root = tk.Tk()
root.title("RGB & HSV Sliders")

# Create IntVar variables and bind them to the trace method
var_h = tk.IntVar()
var_h.trace("w", send_message)
var_s = tk.IntVar()
var_s.trace("w", send_message)
var_v = tk.IntVar()
var_v.trace("w", send_message)
var_r = tk.IntVar()
var_r.trace("w", send_message)
var_g = tk.IntVar()
var_g.trace("w", send_message)
var_b = tk.IntVar()
var_b.trace("w", send_message)

# Create sliders
h_slider = tk.Scale(root, from_=-195_000, to=195_000, length=500, label='Hue Adjust', orient='horizontal', variable=var_h)
h_slider.grid(row=0, column=1)
tk.Label(root, text="H:").grid(row=0, column=0)

s_slider = tk.Scale(root, from_=-65535, to=65535, length=500, label='Saturation Adjust', orient='horizontal', variable=var_s)
s_slider.grid(row=1, column=1)
tk.Label(root, text="S:").grid(row=1, column=0)

v_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Value Adjust', orient='horizontal', variable=var_v)
v_slider.grid(row=2, column=1)
tk.Label(root, text="V:").grid(row=2, column=0)

r_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Red CH Adjust', orient='horizontal', variable=var_r)
r_slider.grid(row=3, column=1)
tk.Label(root, text="R:").grid(row=3, column=0)

g_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Green CH Adjust', orient='horizontal', variable=var_g)
g_slider.grid(row=4, column=1)
tk.Label(root, text="G:").grid(row=4, column=0)

b_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Blue CH Adjust', orient='horizontal', variable=var_b)
b_slider.grid(row=5, column=1)
tk.Label(root, text="B:").grid(row=5, column=0)

root.mainloop()

# Close the serial connection
ser.close()
