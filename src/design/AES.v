/*
    Valete
    AES modules
    Board: ZyboZ7-7010

*/


/*
    Teste 2
    
    O teste consiste em 2 testes mais pequenos
    
    teste 1 - referente ao decrypt 128
                sera usado para tetsar o error injection
    
    teste 2 - referente ao decrypt 256
                sera usado para testar o algoritmo de decrypt (com uma mensagem encryptada por uma intidade oficial)
*/
module AES(enable, e128, d128, e192, d192, e256, d256, ERR_INJ);

output wire e128;
output wire d128;
output wire e192;
output wire d192;
output wire e256;
output wire d256;
input enable;
input ERR_INJ;

// The plain text used as input
wire[127:0] in = 128'h_d0112233445566778899aabbccddeeff;

// The different keys used for testing (one of each type)
wire[127:0] key128 = 128'h_000102030405060708090a0b0c0d0e0f;
wire[191:0] key192 = 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
wire[255:0] key256 = 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e15;

// The expected outputs from the encryption module
wire[127:0] expected128 = 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;   //69	c4	e0	d8	6a	7b	04	30	d8	cd	b7	80	70	b4	c5	5a   ---CERTO
wire[127:0] expected192 = 128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
wire[127:0] expected256 = 128'h_8ea2b7ca516745bfeafc49904b496089;   //8e	a2	b7	ca	51	67	45	bf	ea	fc	49	90	4b	49	60	89   ---CERTO

// The result of the encryption module for every type
reg[127:0] encrypted128;
reg[127:0] encrypted192;
reg[127:0] encrypted256;
reg[127:0] encrypted256_2 = 128'ha2f9c04303885371cbd315a1ff0926ab;

assign e128 = (encrypted128 == expected128 && enable) ? 1'b1 : 1'b0;
assign e192 = (encrypted192 == expected192 && enable) ? 1'b1 : 1'b0;
assign e256 = (encrypted256 == expected256 && enable) ? 1'b1 : 1'b0;
    
// The result of the decryption module for every type
wire[127:0] decrypted128;
wire[127:0] decrypted192;
wire[127:0] decrypted256;

//Encrypt
AES_Encrypt a(in,key128,encrypted128[0:126]);
AES_Encrypt #(192,12,6) b(in,key192,encrypted192);
AES_Encrypt #(256,14,8) c(in,key256,encrypted256);
//error injection on 127º bit of encrypted128. Como o ultimo bit é suposto ser 0 (numero par)
    assign encrypted128[127] = (ERR_INJ)?  1'b1 : 1'b0;


//Decrypt
AES_Decrypt a2(encrypted128,key128,decrypted128);
AES_Decrypt #(192,12,6) b2(encrypted192,key192,decrypted192);
AES_Decrypt #(256,14,8) c2(encrypted256_2,key256,decrypted256);

assign d128 = (decrypted128 == in && enable) ? 1'b1 : 1'b0;
assign d192 = (decrypted192 == in && enable) ? 1'b1 : 1'b0;
assign d256 = (decrypted256 == in && enable) ? 1'b1 : 1'b0;

endmodule