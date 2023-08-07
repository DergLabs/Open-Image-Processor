#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "pico/stdlib.h"
#include "hardware/i2c.h"
#include "hardware/irq.h"
#include "hardware/pwm.h"


#define MCU_CLK 200 //Set clock to 200Mhz
#define BUS_CLK 10 //Set bus clock to 10Mhz
#define REV "0.1" //Firmware Revision. Update when changed

//USER IO Definitions
const uint LED_PIN = PICO_DEFAULT_LED_PIN; //GPIO 25

//BUS IO Definitions
const uint cs = 9; 
const uint sck = 8;
const uint D0 = 7; 
const uint D1 = 6;
const uint D2 = 5;
const uint D3 = 4;
const uint D4 = 3;
const uint D5 = 2;
const uint D6 = 1;
const uint D7 = 0;
const uint BUS[8] = {D0, D1, D2, D3, D4, D5, D6, D7};

#define BUFFER_SIZE 33  // Buffer size including space for null terminator

void readInput(char *buffer) {
    int i = 0;
    int ch;

    // Read characters until we fill the buffer, reach EOF, or encounter a newline
    while (i < BUFFER_SIZE - 1 && (ch = getchar()) != EOF && ch != '\n') {
        buffer[i++] = tolower((char) ch); // convert all characters to lowercase
    }

    // Null-terminate the string
    buffer[i] = '\0';
    //printf("Buffer: %s\n", buffer); debug only
}

void bus_sender(int rValue, int gValue, int bValue, int hValue, int sValue, int vValue){
    uint64_t rgb_word = 0;
    uint64_t hsv_word = 0;
    uint8_t rgb_bytes[8];
    uint8_t hsv_bytes[8];

    // Construct RGB 64-bit word
    rgb_word |= ((uint64_t)1 << 63); // Bit-63: 1
    rgb_word |= ((uint64_t)rValue << 18); // Bits 26-18: Red
    rgb_word |= ((uint64_t)gValue << 9); // Bits 17-9: Green
    rgb_word |= (uint64_t)bValue; // Bits 8-0: Blue

    // Construct HSV 64-bit word
    hsv_word |= ((uint64_t)1 << 62); // Bit-62: 1
    hsv_word |= ((uint64_t)1 << 61); // Bit-61: 1
    hsv_word |= ((uint64_t)hValue << 26); // Bits 50-26: H
    hsv_word |= ((uint64_t)sValue << 9); // Bits 25-9: S
    hsv_word |= (uint64_t)vValue; // Bits 8-0: V

    // Split words into 1-byte chunks
    for (int i = 7; i >= 0; --i) {
        rgb_bytes[i] = rgb_word & 0xFF;
        hsv_bytes[i] = hsv_word & 0xFF;
        rgb_word >>= 8;
        hsv_word >>= 8;
    }

    // Send RGB bytes
    gpio_put(cs, 1);
    sleep_us(50);
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            gpio_put(BUS[j], (rgb_bytes[i] >> (7-j)) & 0x1);
        }
        gpio_put(sck, 1);
        sleep_us(1);
        gpio_put(sck, 0);
    }
    gpio_put(cs, 0);

    sleep_us(100); // Delay between RGB and HSV bytes

    // Send HSV bytes
    gpio_put(cs, 1);
    sleep_us(50);
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            gpio_put(BUS[j], (hsv_bytes[i] >> (7-j)) & 0x1);
        }
        gpio_put(cs, 1);
        gpio_put(sck, 1);
        sleep_us(1);
        gpio_put(sck, 0);
    }
    gpio_put(cs, 0);
}


int main() {
    
    set_sys_clock_khz((MCU_CLK*1000), true); //Increase clock from 133Mhz to 220Mhz
    stdio_init_all(); 
    gpio_init(cs);
    gpio_init(sck);
    gpio_init(D0);
    gpio_init(D1);
    gpio_init(D2);
    gpio_init(D3);
    gpio_init(D4);
    gpio_init(D5);
    gpio_init(D6);
    gpio_init(D7);
    gpio_set_dir(cs, GPIO_OUT);
    gpio_set_dir(sck, GPIO_OUT);
    gpio_set_dir(D0, GPIO_OUT);
    gpio_set_dir(D1, GPIO_OUT);
    gpio_set_dir(D2, GPIO_OUT);
    gpio_set_dir(D3, GPIO_OUT);
    gpio_set_dir(D4, GPIO_OUT);
    gpio_set_dir(D5, GPIO_OUT);
    gpio_set_dir(D6, GPIO_OUT);
    gpio_set_dir(D7, GPIO_OUT);
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);
    sleep_ms(1500);
    printf("\n");
    printf("Pixel Controller Firmware Rev: %s\n", REV);
    sleep_ms(500);
    printf("MCU CLK is: %dMhz\n", MCU_CLK);
    sleep_ms(500);
    gpio_put(LED_PIN, 1);



    char buffer[BUFFER_SIZE];
    int rValue = 0;
    int gValue = 0;
    int bValue = 0;
    int hValue = 0;
    int sValue = 0;
    int vValue = 0;
    char *token;
    token = strtok(buffer, "|");

    while (1){
        printf("Enter command (help for command options): ");
        fflush(stdout);
        readInput(buffer);


      if (strcmp(buffer, "help") == 0){
            printf("RGB/HSV adjustment values are formatted as follows:\n",
                    "R:Value|G:Value|B:Value or H:Value|S:Value|V:Value\n",
                    "Values can be + or -\n",
                    "Limit RGB values to +/- 255. Limit H value to +/- 390,000, S value to +/- 65,536 and V value to +/- 255\n");
        }
        else{
            token = strtok(buffer, "|");
            while (token != NULL){
                 char *value_string = strchr(token, ':');

                 if (value_string){
                    int value = atoi(value_string + 1);

                    if (token[0] == 'r') {
                        rValue = value;
                    } else if (token[0] == 'g') {
                        gValue = value;
                    } else if (token[0] == 'b') {
                        bValue = value;
                    } else if (token[0] == 'h') {
                        hValue = value;
                    } else if (token[0] == 's') {
                        sValue = value;
                    } else if (token[0] == 'v') {
                        vValue = value;
                    }
                 }

                 token = strtok(NULL, "|");                 
            }

            bus_sender(rValue, gValue, bValue, hValue, sValue, vValue);
            printf("R: %d, G: %d, B: %d, H: %d, S: %d, V: %d\n", rValue, gValue, bValue, hValue, sValue, vValue);
        }

    }

    return 0;
}