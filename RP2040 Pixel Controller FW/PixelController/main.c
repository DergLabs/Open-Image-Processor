#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "pico/stdlib.h"
#include "hardware/spi.h"



#define MCU_CLK 200 //Set clock to 200Mhz
#define REV "0.3" //Firmware Revision. Update when changed

#define MOSI 3 // To FPGA pin 
#define SCLK 2 // To FPGA pin
#define CS 5 // To FPGA pin 

#define SPI_PORT spi0
#define SPI_CLK 1 //Set bus clock to 1Mhz

//USER IO Definitions
const uint LED_PIN = PICO_DEFAULT_LED_PIN; //GPIO 25

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


void bus_sender(int16_t rValue, int16_t gValue, int16_t bValue, int32_t hValue, int32_t sValue, int16_t vValue){
    uint64_t rgb_word = 0;
    uint64_t hsv_word = 0;
    uint8_t rgb_bytes[8];
    uint8_t hsv_bytes[8];
    //print r, g, b, h, s and V values for debug
    printf("R: %d\n", rValue);
    printf("G: %d\n", gValue);
    printf("B: %d\n", bValue);
    printf("H: %d\n", hValue);
    printf("S: %d\n", sValue);
    printf("V: %d\n", vValue);

    // Construct RGB 64-bit word
    rgb_word = (bValue & 0x1FF) | (gValue & 0x1FF) << 9 | (rValue & 0x1FF) << 18;
    rgb_word |= ((uint64_t)1 << 63); // Bit-63: 1
    

    // Construct HSV 64-bit word
    hsv_word = ((uint64_t)(hValue & 0x1FFFFFF) << 26) | ((uint64_t)(sValue & 0x1FFFF) << 9) | (vValue & 0x1FF);
    hsv_word |= ((uint64_t)1 << 62); // Bit-62: 1
    hsv_word |= ((uint64_t)1 << 61); // Bit-61: 1
    //print out all bits for hsv_word
    for (int i = 63; i >= 0; --i) {
        printf("%llu", (hsv_word >> i) & 1);
    }
    printf("\n");
    
    //Print out 64-bit words for debug
    printf("RGB Word: %llu\n", rgb_word);
    printf("HSV Word: %llu\n", hsv_word);

    // Split words into 1-byte chunks
    for (int i = 7; i >= 0; --i) {
        rgb_bytes[i] = rgb_word & 0xFF;
        hsv_bytes[i] = hsv_word & 0xFF;
        rgb_word >>= 8;
        hsv_word >>= 8;
    }

    // Send RGB bytes
    gpio_put(CS, 0);
    spi_write_blocking(SPI_PORT, rgb_bytes, 8);
    gpio_put(CS, 1);

    sleep_us(10); // Delay between RGB and HSV bytes

    // Send HSV bytes
    gpio_put(CS, 0);
    spi_write_blocking(SPI_PORT, hsv_bytes, 8);
    gpio_put(CS, 1);
}


void initIO(){
    spi_init(SPI_PORT, SPI_CLK*1000000);
    gpio_set_function(MOSI, GPIO_FUNC_SPI);
    gpio_set_function(SCLK, GPIO_FUNC_SPI);

    gpio_init(CS);
    gpio_set_dir(CS, GPIO_OUT);
    gpio_put(CS, 1);

    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);
    sleep_ms(1500);
    printf("\n");
    printf("Pixel Controller Firmware Rev: %s\n", REV);
    sleep_ms(500);
    printf("MCU CLK is: %dMhz\n", MCU_CLK);
    sleep_ms(500);
    gpio_put(LED_PIN, 1);
}

int main() {
    
    set_sys_clock_khz((MCU_CLK*1000), true); //Increase clock from 133Mhz to 220Mhz
    stdio_init_all(); 
    initIO();
    
    char buffer[BUFFER_SIZE];
    int16_t rValue = 0;
    int16_t gValue = 0;
    int16_t bValue = 0;
    int32_t hValue = 0;
    int32_t sValue = 0;
    int16_t vValue = 0;
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
        else {
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