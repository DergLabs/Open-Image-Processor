from PIL import Image
import cv2
import numpy as np
import tkinter as tk
import threading
import numba as nb


@nb.njit
def backCalcINT(H, S, V):
    E = 65535
    bitShift = 16
    RGB = [0, 0, 0]
    I = 0

    # Step 0 check for special case where S or V are 0
    if S == 0 or V == 0:
        RGB = [V, V, V]
        return RGB

    # Step 1 - Back Calculate d and m
    d = int(((S * V) >> bitShift) + 1)
    m = int(V - d)

    # Step 2 - Determine the Selector index based on the value of H
    if H < E:
        I = 0
    elif E <= H < (2 * E):
        I = 1
    elif (2 * E) <= H < (3 * E):
        I = 2
    elif (3 * E) <= H < (4 * E):
        I = 3
    elif (4 * E) <= H < (5 * E):
        I = 4
    elif H >= (5 * E):
        I = 5

    # Step 3 Calculate F, add 1 if F is equal to 0
    F = int(H - (E * I))
    if F == 0:
        F += 1

    # Step 3 If the selector index is 1,3, or 5, undo the inversion of F done in the RGB-HSV conversion
    if I % 2 != 0:
        F = int(E - F)

    # Step 4 Calculate C based on F and D
    c = int(((F * d) >> bitShift) + m)

    # Step 5 Output the RGB values according to the selector index
    if I == 0:
        RGB = [V, c, m]
    elif I == 1:
        RGB = [c, V, m]
    elif I == 2:
        RGB = [m, V, c]
    elif I == 3:
        RGB = [m, c, V]
    elif I == 4:
        RGB = [c, m, V]
    elif I == 5:
        RGB = [V, m, c]

    return RGB

@nb.njit
def calcHSVINT(R, G, B, divisor_inv, precision):
    E = 65535
    bitShift = 16

    # Step 1 find the min, max and mid of RGB
    rg = R-G
    rb = R-B
    gb = G-B
    muxsel = [0,0,0]

    if rg < 0:
        muxsel[0] = 1
    else:
        muxsel[0] = 0

    if rb < 0:
        muxsel[1] = 1
    else:
        muxsel[1] = 0

    if gb < 0:
        muxsel[2] = 1
    else:
        muxsel[2] = 0

    if muxsel == [0,0,0]:
        m = B
        M = R
        c = G
    elif muxsel == [0,0,1]:
        m = G
        M = R
        c = B
    elif muxsel == [0,1,0]:
        print("Impossible value!!")
    elif muxsel == [0,1,1]:
        m = G
        M = B
        c = R
    elif muxsel == [1,0,0]:
        m = B
        M = G
        c = R
    elif muxsel == [1,0,1]:
        m = R
        M = B
        c = G
    elif muxsel == [1,1,0]:
        m = R
        M = G
        c = B
    elif muxsel == [1,1,1]:
        m = R
        M = B
        c = G
    #temp_list = np.array([R, G, B], dtype=np.int64)
    #m = min(R, G, B)
    #M = max(R, G, B)
    #c = np.median(temp_list)

    # Step 2 Set V equal to M
    V = M

    # Step 3 calculate the difference between M and m, if its 0, set S to 0, and H to -1 (It is undefined in this case)
    d = int(M - m)
    if d == 0 or V == 0:
        S = 0
        H = -1
        return H, S, V

    # Step 4 calculate S using d and V
    S = int(((d << bitShift) - 1) * divisor_inv[V] >> precision)

    # Step 5 find the selector index based on which color is the Min/Max, special case is needed if two are the same
    if M == R and m == B:
        I = 0
    elif M == G and m == B:
        I = 1
    elif M == G and m == R:
        I = 2
    elif M == B and m == R:
        I = 3
    elif M == B and m == G:
        I = 4
    elif M == R and m == G:
        I = 5

    # Step 6 calculate F using c, m and d, check if I is 1,3,5 and set F to its inverse
    F = int(((int(c - m) << 16) * divisor_inv[d] >> precision) + 1)
    if I % 2 != 0:
        F = E - F

    # Step 7 calculate H using E, I and F
    H = (E * I) + F

    return H, S, V


@nb.njit(fastmath=True, parallel=True)
def process_pixels(pixels, h_adjust, s_adjust, v_adjust, r_adjust, g_adjust, b_adjust, processFormat, divisor_inv, precision):
    for y in nb.prange(pixels.shape[1]):
        for x in range(pixels.shape[0]):
            R, G, B = pixels[x, y]

            R += r_adjust
            G += g_adjust
            B += b_adjust

            if R >= 255:
                R = 255
            if R <= 0:
                R = 0

            if G >= 255:
                G = 255
            if G <= 0:
                G = 0

            if B >= 255:
                B = 255
            if B <= 0:
                B = 0

            H, S, V = calcHSVINT(R, G, B, divisor_inv, precision)

            H += h_adjust
            S += s_adjust
            V += v_adjust

            if H >= 390_000:
                H = 390_000
            if H <= 0:
                H = 0

            if S >= 65535:
                S = 65535
            if S <= 0:
                S = 0

            if V >= 255:
                V = 255
            if V <= 0:
                V = 0

            R_new, G_new, B_new = backCalcINT(H, S, V)

            pixels[x, y] = (R_new, G_new, B_new)  # Moved inside the loop

    return pixels


def process_image_live(input_filename, h_adjust, s_adjust, v_adjust, r_adjust, g_adjust, b_adjust, processFormat, divisor_inv, precision):
    image = Image.open(input_filename)
    image = image.convert("RGB")
    pixels = np.array(image, dtype=np.int32)
    cv2.namedWindow('Image', cv2.WINDOW_NORMAL)

    while True:
        processed_pixels = process_pixels(pixels.copy(), h_adjust.get(), s_adjust.get(), v_adjust.get(), r_adjust.get(), g_adjust.get(), b_adjust.get(), processFormat, divisor_inv, precision)
        processed_pixels = np.clip(processed_pixels, 0, 255).astype('uint8')
        cv2.imshow('Image', cv2.cvtColor(processed_pixels, cv2.COLOR_RGB2BGR))
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cv2.destroyAllWindows()


def tkinterWindow(imageName, divisor_inv, precision):
    window = tk.Tk()
    processFormat = "INT"
    if processFormat == "INT":
        h_adjust = tk.Scale(window, from_=-195_000, to=195_000, length=500, label='Hue Adjust', orient='horizontal')
        s_adjust = tk.Scale(window, from_=-65535, to=65535, length=500, label='Saturation Adjust', orient='horizontal')
        v_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Value Adjust', orient='horizontal')
    elif processFormat == "FP":
        h_adjust = tk.Scale(window, from_=-180, to=180, length=500, label='Hue Adjust', orient='horizontal')
        s_adjust = tk.Scale(window, from_=-100, to=100, length=500, label='Saturation Adjust', orient='horizontal')
        v_adjust = tk.Scale(window, from_=-100, to=100, length=500, label='Value Adjust', orient='horizontal')

    r_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Red CH Adjust', orient='horizontal')
    g_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Green CH Adjust', orient='horizontal')
    b_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Blue CH Adjust', orient='horizontal')

    h_adjust.pack()
    s_adjust.pack()
    v_adjust.pack()
    r_adjust.pack()
    g_adjust.pack()
    b_adjust.pack()

    threading.Thread(target=process_image_live, args=(imageName, h_adjust, s_adjust, v_adjust, r_adjust, g_adjust, b_adjust, processFormat, divisor_inv, precision)).start()

    window.mainloop()

if __name__ == '__main__':
    precision = 17
    # Find the inverse of v
    divisor_inv = [0] * 256
    # Populate array with the inverse of each value
    for i in range(1, 256):
        divisor_inv[i] = (1 << precision) // i
    imageName = "colors.jpg" # EDIT ME
    tkinterWindow(imageName, divisor_inv, precision)