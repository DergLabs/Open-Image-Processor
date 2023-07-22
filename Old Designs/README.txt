The logisim simulations are not fully representative of the implemented processor. They were very early versions of the image processing core.

A sample image png has been provided along with its Hex file generated using my PNG to Hex python script. The two files are titled "Contrast"

The processor architecture is relatively simple, consisting of three 8-bit integer ALU's (one for each color channel). Each ALU can perform Add, Subtract, Multiply, Divide, Bit shift left/right, AND, OR, NOT, NOR, NAND, XOR, XNOR, Passthrough A, and Passthrough B.

A 32-bit instruction word is used, allowing each ALU to perform a unique operation for its respective color channel. Each ALU has two inputs A and B. Input A is designated for the pixel color data to be processed, input B is a control data input used to perform operations on the pixel data and can be any 8-bit data input. 

The PLU can perform one operation per clock cycle. A minimum of 2 clock cycles are needed for the current configuration due to the registered inputs and outputs. This can be changed by removing the input/output registers allowing for single clock cycle operation. 

The input/output registers allow for multiple operations to be performed per pixel. The current design supports up to 16 operations per pixel. An excel file has been created to assemble 32-bit hex instructions that can be loaded into the instruction ROM. The PNG-To-HEX project can be used to generate hex files that can be loaded into the image ROM. The visual basic functions used in the excel file have also been provided. Macros are required for the excel file to work (A proper C assembler will be developed once the PLU architecture is finalized)

The following setup is REQUIRED for anything to happen:
- The first instruction (LOAD) in the instruction ROM MUST be 0x3F190410 - This loads a pixel into the input registers
- The last instruction (NEXT) MUST be 0x3F1B0C30 - This sends the loaded pixel into the output register and toggles the pixel clk high, allowing the pixel to be displayed
- If you do not need 16 instructions, you can use the "NEXT_JUMP" instruction to reset the program counter. 
- ALL unused instructions between the "LOAD" and "NEXT" instructions must be 0x3F180000 - This is a simple "do nothing" instruction that passes the input to the output with no operations performed. 