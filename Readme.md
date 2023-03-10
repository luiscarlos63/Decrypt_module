# Derypt modeule test in Hardware

* This hardware module takes a memory address and size and decrypts the data in 128 bit chuncks and writes it to memory.
* The ROM memory used is a simple register matrix instantiation. The data is loaded using **readmemh** verilog primitive.

* For a better understanting of the Loader plus Decrypt see the UML.
* The Decrypt module is taken from - https://github.com/michaelehab/AES-Verilog

## Next step is to use BRAM insted of register matrix. 
