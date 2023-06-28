def backCalc(H, S, V, E):
    d = ((S * V) >> 16) + 1
    print("Value of d:{}\n".format(d))

    m = V - d
    print("Value of m:{}\n".format(m))

    I = 0

    if H < E:
        I = 0
    elif H >= E and H < 2 * E:
        I = 1
    elif H >= 2 * E and H < 3 * E:
        I = 2
    elif H >= 3 * E and H < 4 * E:
        I = 3
    elif H >= 4 * E and H < 5 * E:
        I = 4
    elif H >= 5 * E:
        I = 5

    print("Value of I:{}\n".format(I))

    F = H - E * I
    print("Value of F:{}\n".format(F))

    c = int(((F * d) >> 16) + m)
    print("Value of c:{}\n".format(c))

    RGB = [0, 0, 0]

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

    print("Value of RGB:{}\n".format(RGB))

def calcHSV(R, G, B):
    M = max(R, G, B)
    m = min(R, G, B)
    c = int((M-m)/2)
    print("Max: {}, Min: {}, Mid: {}\n".format(M,m,c))

    V = M

    d = int(M - m)
    print("Value of d:{}\n".format(d))

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

    print("Value of I:{}\n".format(I))

    S = int(((d<<16)-1)/V)
    print("S Intermediate: {}\n".format(d<<16))
    print("Value of S:{}\n".format(S))

    if d == 0:
        S = 0
        return V, S, 0

    F = int(((c-m)<<16)/d + 1)
    print("c-m intermediate: {}".format(c-m))
    print("<<16 intermediate: {}".format(((c - m)<<16)))
    print("/d intermediate: {}".format(((c - m) << 16)/d))
    print("+1 intermediate: {}".format((((c - m) << 16) / d)+1))

    if I == 1 or I == 3 or I == 5:
        F = E - F
    print("Value of F:{}\n".format(F))

    H = E * I + F
    print("E*I intermediate: {}".format(E*I))
    print("Value of H:{}\n".format(H))

    return H, S, V



# Simple python script to test the functionality of the Hardware based RGB-HSV Converter
if __name__ == '__main__':
    while True:
        R = int(input("Enter a R Value to test (or 999 to exit): "))
        if R == 999:
            exit()
        G = int(input("Enter a G Value to test: "))
        B = int(input("Enter a B Value to test: "))
        E = 65536

        print("Hex Values for RGB: {} {} {}\n".format(hex(R), hex(G), hex(B)))

        print("Calculating HSV values from RGB")
        H, S, V = calcHSV(R, G, B)
        print("H: {} | S: {} | V: {}\n".format(H, S, V))

        # If the HSV conversion is correct, then it should perfectly back calculate to the original RGB values
        print("---------------------------------------------------------------")
        print("Back Calculating RGB values from HSV")
        backCalc(H, S, V, E)