#include <iostream>
#include <cmath>
#include <ctime>
#include <algorithm>

#define E 65535
#define bitShift 16


void backCalcINT(int H, int S, int V, int* RGB) {


    int I = 0;
    int d, m, F, c;

    if (S == 0 || V == 0) {
        RGB[0] = V;
        RGB[1] = V;
        RGB[2] = V;
        return;
    }

    // Step 1 - Back Calculate d and m
    d = ((S * V) >> bitShift) + 1;
    m = V - d;

    // Step 2 - Determine the Selector index based on the value of H
    if (H < E) {
        I = 0;
    } else if (E <= H && H < (2 * E)) {
        I = 1;
    } else if ((2 * E) <= H && H < (3 * E)) {
        I = 2;
    } else if ((3 * E) <= H && H < (4 * E)) {
        I = 3;
    } else if ((4 * E) <= H && H < (5 * E)) {
        I = 4;
    } else if (H >= (5 * E)) {
        I = 5;
    }

    // Step 3 Calculate F, add 1 if F is equal to 0
    F = H - (E * I);
    if (F == 0) {
        F += 1;
    }

    // Step 3 If the selector index is 1,3, or 5, undo the inversion of F done in the RGB-HSV conversion
    if (I % 2 != 0) {
        F = E - F;
    }

    // Step 4 Calculate C based on F and D
    c = ((F * d) >> bitShift) + m;

    // Step 5 Output the RGB values according to the selector index
    if (I == 0) {
        RGB[0] = V;
        RGB[1] = c;
        RGB[2] = m;
    } else if (I == 1) {
        RGB[0] = c;
        RGB[1] = V;
        RGB[2] = m;
    } else if (I == 2) {
        RGB[0] = m;
        RGB[1] = V;
        RGB[2] = c;
    } else if (I == 3) {
        RGB[0] = m;
        RGB[1] = c;
        RGB[2] = V;
    } else if (I == 4) {
        RGB[0] = c;
        RGB[1] = m;
        RGB[2] = V;
    } else if (I == 5) {
        RGB[0] = V;
        RGB[1] = m;
        RGB[2] = c;
    }
}

void calcHSVINT(int R, int G, int B, int* HSV) {
    // Step 1 calculate the min, max values for RGB
    int M = std::max({R, G, B});
    int m = std::min({R, G, B});

    // Step 2 Set V equal to M
    int V = M;

    // Step 3 calculate the difference between M and m, if its 0, set S to 0, and H to -1 (It is undefined in this case)
    int d = M - m;
    int S, H, I, c, F;

    if (d == 0 || V == 0) {
        S = 0;
        H = -1;
        HSV[0] = H;
        HSV[1] = S;
        HSV[2] = V;
        return;
    }

    // Step 4 calculate S using d and V
    S = (((d << bitShift) - 1) / V);

    // Step 5 find the selector index based on which color is the Min/Max, special case is needed if two are the same
    if (M == R && m == B) {
        I = 0;
        c = G;
    } else if (M == G && m == B) {
        I = 1;
        c = R;
    } else if (M == G && m == R) {
        I = 2;
        c = B;
    } else if (M == B && m == R) {
        I = 3;
        c = G;
    } else if (M == B && m == G) {
        I = 4;
        c = R;
    } else if (M == R && m == G) {
        I = 5;
        c = B;
    }

    // Step 6 calculate F using c, m and d, check if I is 1,3,5 and set F to its inverse
    F = ((((c - m) << 16) / d) + 1);

    if (I % 2 != 0) {
        F = E - F;
    }

    // Step 7 calculate H using E, I and F
    H = (E * I) + F;

    HSV[0] = H;
    HSV[1] = S;
    HSV[2] = V;
}

void backCalcFP(double H, double S, double V, double RGB[]) {
    int h_sub_i = (int) std::floor(H) / 60 % 6;
    double var_f = (H / 60.0) - std::floor(H / 60.0);
    double var_p = V * (1.0 - S);
    double var_q = V * (1.0 - var_f * S);
    double var_t = V * (1.0 - (1.0 - var_f) * S);

    if (h_sub_i == 0) {
        RGB[0] = V;
        RGB[1] = var_t;
        RGB[2] = var_p;
    } else if (h_sub_i == 1) {
        RGB[0] = var_q;
        RGB[1] = V;
        RGB[2] = var_p;
    } else if (h_sub_i == 2) {
        RGB[0] = var_p;
        RGB[1] = V;
        RGB[2] = var_t;
    } else if (h_sub_i == 3) {
        RGB[0] = var_p;
        RGB[1] = var_q;
        RGB[2] = V;
    } else if (h_sub_i == 4) {
        RGB[0] = var_t;
        RGB[1] = var_p;
        RGB[2] = V;
    } else if (h_sub_i == 5) {
        RGB[0] = V;
        RGB[1] = var_p;
        RGB[2] = var_q;
    }
}

void calcHSVFP(double R, double G, double B, double HSV[]) {
    double M = std::max({R, G, B});
    double m = std::min({R, G, B});
    double S, H;

    if (M == m) {
        H = 0.0;
    } else if (M == R) {
        H = std::fmod((60.0 * ((G - B) / (M - m)) + 360), 360.0);
    } else if (M == G) {
        H = 60.0 * ((B - R) / (M - m)) + 120;
    } else if (M == B) {
        H = 60.0 * ((R - G) / (M - m)) + 240.0;
    }

    if (M == 0) {
        S = 0;
    } else {
        S = 1.0 - (m / M);
    }

    double V = M;

    HSV[0] = H;
    HSV[1] = S;
    HSV[2] = V;
}

void testInts(){
    std::cout << "Testing Integer V1 Conversion..." << std::endl;
    int match = 0, fuzzy = 0, mismatch = 0;
    int HSV[3], RGB[3];

    std::clock_t start = std::clock();

    for (int R = 0; R < 255; R++) {
        for (int G = 0; G < 255; G++) {
            for (int B = 0; B < 255; B++) {
                calcHSVINT(R, G, B, HSV);
                backCalcINT(HSV[0], HSV[1], HSV[2], RGB);

                if (R == RGB[0] && G == RGB[1] && B == RGB[2]) {
                    match++;
                } else if ((abs(R - RGB[0])) <= 1 && (abs(G - RGB[1])) <= 1 && (abs(B - RGB[2])) <= 1) {
                    fuzzy++;
                } else {
                    mismatch++;
                }
            }
        }
    }

    double duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
    std::cout << "Time to execute 255^3 operations: " << duration << " sec | " << (255 * 255 * 255) / duration << " operations/sec" << std::endl;
    std::cout << "Percentage of colors that match: " << (match / (double)(255 * 255 * 255)) * 100 << "% | " << match << " Colors" << std::endl;
    std::cout << "Percentage of colors that are near perfect (+/- <2%): " << (fuzzy / (double)(255 * 255 * 255)) * 100 << "% | " << fuzzy << " Colors" << std::endl;
    std::cout << "Percentage of colors that don't match: " << (mismatch / (double)(255 * 255 * 255)) * 100 << "% | " << mismatch << " Colors" << std::endl;
}

void testFloats(){
    // Floating Point Version
    std::cout << "----------------------------------------------------------------------------------------" << std::endl;
    std::cout << "Testing Floating Point Converter...\n" << std::endl;

    int matchFP = 0, fuzzyFP = 0, mismatchFP = 0;
    double HSVFP[3], RGBFP[3];

    std::clock_t startFP = std::clock();

    for (int R = 0; R < 255; R++) {
        for (int G = 0; G < 255; G++) {
            for (int B = 0; B < 255; B++) {
                calcHSVFP((double)R, (double)G, (double)B, HSVFP);
                backCalcFP(HSVFP[0], HSVFP[1], HSVFP[2], RGBFP);

                if (R == RGBFP[0] && G == RGBFP[1] && B == RGBFP[2]) {
                    matchFP++;
                } else if (std::abs(R - RGBFP[0]) <= 1 && std::abs(G - RGBFP[1]) <= 1 && std::abs(B - RGBFP[2]) <= 1) {
                    fuzzyFP++;
                } else {
                    mismatchFP++;
                }
            }
        }
    }

    double durationFP = (std::clock() - startFP) / (double) CLOCKS_PER_SEC;

    std::cout << "Time to execute 255^3 operations: " << durationFP << " sec | " << (255 * 255 * 255) / durationFP << " operations/sec" << std::endl;
    std::cout << "Percentage of colors that match: " << (matchFP / (double)(255 * 255 * 255)) * 100 << "% | " << matchFP << " Colors" << std::endl;
    std::cout << "Percentage of colors that are near perfect (+/- <2%): " << (fuzzyFP / (double)(255 * 255 * 255)) * 100 << "% | " << fuzzyFP << " Colors" << std::endl;
    std::cout << "Percentage of colors that don't match: " << (mismatchFP / (double)(255 * 255 * 255)) * 100 << "% | " << mismatchFP << " Colors" << std::endl;

}

int main() {
    testInts();
    testFloats();
    return 0;
}
