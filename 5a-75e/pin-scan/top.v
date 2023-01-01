`include "uart_tx.v"
`include "blink.v"

/* baudrate: 9600 */
/* Top level module for keypad + UART demo */
module top (
    // input hardware clock (25 MHz)
    input clk_i, 
    // UART lines

/* LED Header PIN's not yet identified: 
 J1 pin 3
 J1 pin 8
 J1 pin 12
 J1 pin 14
 J1 pin 15

 J2 pin 3
 J2 pin 8
 J2 pin 12
 J2 pin 14
 J2 pin 15 

 J3 pin 3
 J3 pin 8
 J3 pin 12
 J3 pin 14
 J3 pin 15 

 J4 pin 3
 J4 pin 8
 J4 pin 12
 J4 pin 14
 J4 pin 15 
 
 J5 pin 3
 J5 pin 8
 J5 pin 12
 J5 pin 14
 J5 pin 15

 J6 pin 3 
 J6 pin 5 
 J6 pin 8 
 J6 pin 12 
 J6 pin 14 
 J6 pin 15

 J7 pin 3
 J7 pin 8
 J7 pin 12
 J7 pin 14
 J7 pin 15

 J8 pin 3
 J8 pin 6
 J8 pin 8
 J8 pin 12
 J8 pin 14
 J8 pin 15

 J9 pin 1
 J9 pin 2
 J9 pin 3
 J9 pin 5
 J9 pin 8
 J9 pin 12
 J9 pin 14
 J9 pin 15

 J10 pin 2
 J10 pin 3
 J10 pin 8
 J10 pin 12
 J10 pin 14
 J10 pin 15

 J11 pin 3
 J11 pin 5
 J11 pin 6
 J11 pin 8
 J11 pin 12
 J11 pin 14
 J11 pin 15

 J12 pin 1
 J12 pin 3
 J12 pin 6
 J12 pin 8
 J12 pin 12
 J12 pin 14
 J12 pin 15

 J13 pin 3
 J13 pin 8
 J13 pin 12
 J13 pin 14
 J13 pin 15

 J14 pin 3
 J14 pin 5
 J14 pin 8
 J14 pin 12
 J14 pin 14
 J14 pin 15

 J15 pin 3
 J15 pin 8
 J15 pin 12
 J15 pin 14
 J15 pin 15

 J16 pin 3
 J16 pin 8
 J16 pin 12
 J16 pin 14
 J16 pin 15
  

*/
    //output BALL_A2, //not on LED headers
    //output BALL_A3, //not on LED headers
    //output BALL_A4, //not on LED headers
    //output BALL_A5, //not on LED headers
    //output BALL_A6, //not on LED headers
    //output BALL_A7, //not on LED headers
    //output BALL_A8, //not on LED headers
    //output BALL_A9, //not on LED headers
    //output BALL_A10, //not on LED headers
    //output BALL_A11, //not on LED headers
    //output BALL_A12, //not on LED headers
    //output BALL_A13, //not on LED headers
    //output BALL_A14, //not on LED headers
    //output BALL_A15, //not on LED headers

    output BALL_B1, 
    //output BALL_B2, //not on LED headers
    //output BALL_B3, //not on LED headers
    //output BALL_B4, //not on LED headers
    //output BALL_B5, //not on LED headers
    //output BALL_B6, //not on LED headers
    //output BALL_B7, //not on LED headers
    //output BALL_B8, //not on LED headers
    //output BALL_B9, //not on LED headers
    //output BALL_B10, //not on LED headers
    //output BALL_B11, //not on LED headers
    //output BALL_B12, //not on LED headers
    //output BALL_B13, //not on LED headers
    //output BALL_B14, //not on LED headers
    output BALL_B15, 
    //output BALL_B16, //not on LED headers

    output BALL_C1, 
    //output BALL_C2, //not on LED headers
    //output BALL_C3, //not on LED headers
    output BALL_C4, 
    //output BALL_C5, //not on LED headers
    //output BALL_C6, //not on LED headers
    //output BALL_C7, //not on LED headers
    //output BALL_C8, //not on LED headers
    //output BALL_C9, //not on LED headers
    //output BALL_C10, //not on LED headers
    //output BALL_C11, //not on LED headers
    //output BALL_C12, //not on LED headers
    //output BALL_C13, //not on LED headers
    output BALL_C14,
    output BALL_C15,
    output BALL_C16,

    output BALL_D1, 
    output BALL_D3, 
    output BALL_D4, 
    //output BALL_D5, //not on LED headers
    //output BALL_D6, //not on LED headers
    //output BALL_D7, //not on LED headers
    //output BALL_D8, //not on LED headers
    //output BALL_D9, //not on LED headers
    //output BALL_D10, //not on LED headers
    //output BALL_D11, //not on LED headers
    //output BALL_D12, //not on LED headers
    //output BALL_D13, //not on LED headers
    //output BALL_D14, //not on LED headers
    //output BALL_D16, //not on LED headers

    output BALL_E1, 
    //output BALL_E2, //not on LED headers
    output BALL_E3, 
    //output BALL_E4, //not on LED headers
    //output BALL_E5, //not on LED headers
    //output BALL_E6, //not on LED headers
    //output BALL_E7, //not on LED headers
    //output BALL_E8, //not on LED headers
    //output BALL_E9, //not on LED headers
    //output BALL_E10, //not on LED headers
    //output BALL_E11, //not on LED headers
    //output BALL_E12, //not on LED headers
    //output BALL_E13, //not on LED headers
    //output BALL_E14, //not on LED headers
    output BALL_E15, 
    output BALL_E16, 

    //output BALL_F1,  //not on LED headers
    output BALL_F2, 
    output BALL_F3,  
    //output BALL_F4, //not on LED headers
    output BALL_F5, 
    //output BALL_F12, //not on LED headers
    output BALL_F13, 
    output BALL_F14, 
    //output BALL_F15,  //not on LED headers
    output BALL_F16,  

    output BALL_G1,  
    output BALL_G2, 
    //output BALL_G3,  //not on LED headers
    output BALL_G4, 
    output BALL_G5, 
    //output BALL_G12, //not on LED headers
    output BALL_G13, 
    output BALL_G14, 
    output BALL_G15,  
    //output BALL_G16,  //not on LED headers

    //output BALL_H2, //not on LED headers
    output BALL_H3, 
    //output BALL_H4, //not on LED headers
    output BALL_H5, 
    output BALL_H12, 
    output BALL_H13, 
    output BALL_H14, 
    output BALL_H15,  

    //output BALL_J1, //not on LED headers
    //output BALL_J2, //not on LED headers
    //output BALL_J3, //not on LED headers
    output BALL_J4, 
    //output BALL_J5, //not on LED headers
    //output BALL_J12, //not on LED headers
    output BALL_J13, 
    //output BALL_J14, //not on LED headers
    //output BALL_J15,  //not on LED headers
    //output BALL_J16,  //not on LED headers

    //output BALL_K1, //not on LED headers
    //output BALL_K2, //not on LED headers
    //output BALL_K3, //not on LED headers
    output BALL_K4, 
    output BALL_K5, 
    //output BALL_K12, //not on LED headers
    output BALL_K13, 
    //output BALL_K14, //not on LED headers
    //output BALL_K15,  //not on LED headers
    //output BALL_K16,  //not on LED headers

    //output BALL_L1,  //not on LED headers
    //output BALL_L2, //not on LED headers
    //output BALL_L3,  //not on LED headers
    output BALL_L4, 
    output BALL_L5, 
    //output BALL_L12, //not on LED headers
    output BALL_L13, 
    //output BALL_L14, //not on LED headers
    //output BALL_L15,  //not on LED headers
    //output BALL_L16,  //not on LED headers

    //output BALL_M1, //not on LED headers
    //output BALL_M2, //not on LED headers
    //output BALL_M3, //not on LED headers
    output BALL_M4, //output enable, low-active
    //output BALL_M5, //not on LED headers
    //output BALL_M6, //not on LED headers
    output BALL_M7, 
    output BALL_M8, 
    //output BALL_M9, //not on LED headers
    //output BALL_M10, //=TDO on 'CABGA256'
    //output BALL_M11, //not on LED headers
    //output BALL_M12, //not on LED headers
    //output BALL_M13, //not on LED headers
    //output BALL_M14, //not on LED headers
    //output BALL_M15, //not on LED headers
    //output BALL_M16, //not on LED headers

    output BALL_N1, 
    output BALL_N3, 
    output BALL_N4, 
    output BALL_N5, 
    output BALL_N6, 
    //output BALL_N7, //not on LED headers
    //output BALL_N8, //not on LED headers
    //output BALL_N9,  //=CCLK on package 'CABGA256'
    //output BALL_N10,  //=CFG_0 on package 'CABGA256'
    //output BALL_N11, //not on LED headers
    //output BALL_N12, //not on LED headers
    //output BALL_N13, //not on LED headers
    //output BALL_N14, //not on LED headers
    //output BALL_N16, //not on LED headers
    
    //output BALL_P1, //not on LED headers
    //output BALL_P2, //not on LED headers
    //output BALL_P3, //not on LED headers
    output BALL_P4,
    output BALL_P5,
    //output BALL_P6, //used as clk_i
    output BALL_P7, 
    //output BALL_P8, //not on LED headers
    //output BALL_P9, //DONE on package 'CABGA256'
    //output BALL_P10, //CFG_1 on package 'CABGA256'
    //output BALL_P11, //not on LED headers
    output BALL_P12, 
    output BALL_P13,
    output BALL_P14, 
    //output BALL_P15, //not on LED headers
    output BALL_P16,

    //output BALL_R1, //not on LED headers
    //output BALL_R2, //not on LED headers
    //output BALL_R3, //not on LED headers
    //output BALL_R4, //not on LED headers
    //output BALL_R5, //not on LED headers
    //output BALL_R6, //not on LED headers
    //output BALL_R7,  //not on LED headers
    //output BALL_R8, //not on LED headers
    //output BALL_R9, //PROGRAMN on package 'CABGA256'
    //output BALL_R10, //CFG_2 on package 'CABGA256'
    //output BALL_R11, //TDI on package 'CABGA256'
    //output BALL_R12,  //not on LED headers
    //output BALL_R13, //not on LED headers
    //output BALL_R14,  //not on LED headers
    //output BALL_R15, //not on LED headers
    //output BALL_R16, //not on LED headers

    output BALL_T2,
    output BALL_T3,
    //output BALL_T4, //not on LED headers
    output BALL_T6,
    //output BALL_T7,  //not on LED headers
    //output BALL_T8, //not on LED headers
    //output BALL_T9, //INITN on package 'CABGA256'
    //output BALL_T10, //TCK on package 'CABGA256'
    //output BALL_T11, //TMS on package 'CABGA256'
    output BALL_T13,
    output BALL_T14,
    //output BALL_T15, //not on LED headers
    );

    parameter clk_freq = 25000000;
    parameter baudrate = 75;

    /* 9600 Hz clock generation (from 25 MHz) */
    reg clk_9600 = 0;
    reg [31:0] cntr_9600 = 32'b0;
    //parameter period_9600 = /* 2500 */; /* clk_freq / 2 / baudrate */
    parameter period_9600 = (clk_freq / 2 / baudrate);

    /* 1 Hz clock generation (from 25 MHz) */
    reg clk_1 = 0;
    reg [31:0] cntr_1 = 32'b0;
    parameter period_1 = 250000;

    // Note: could also use "0" or "9" below, but I wanted to
    // be clear about what the actual binary value is.
    parameter ASCII_0 = 8'd48;
    parameter ASCII_9 = 8'd57;

    /* UART registers */
    reg [7:0] uart_txbyte = ASCII_0;
    reg uart_send = 1'b1;
    wire uart_txed;

    /* LED register */
    reg ledval = 0;

    parameter A = 7'd01;
    parameter B = 7'd02;
    parameter C = 7'd03;
    parameter D = 7'd04;
    parameter E = 7'd05;
    parameter F = 7'd06;
    parameter G = 7'd07;
    parameter H = 7'd08;
    parameter I = 7'd09;
    parameter J = 7'd10;
    parameter K = 7'd11;
    parameter L = 7'd12;
    parameter M = 7'd13;
    parameter N = 7'd14;
    parameter O = 7'd15;
    parameter P = 7'd16;
    parameter Q = 7'd17;
    parameter R = 7'd18;
    parameter S = 7'd19;
    parameter T = 7'd20;
    parameter Q = 7'd21;

    //blink blinkA2 (clk_1,A,2,BALL_A2); //not on LED headers
    //blink blinkA3 (clk_1,A,3,BALL_A3); //not on LED headers
    //blink blinkA4 (clk_1,A,4,BALL_A4); //not on LED headers
    //blink blinkA5 (clk_1,A,5,BALL_A5); //not on LED headers
    //blink blinkA6 (clk_1,A,6,BALL_A6); //not on LED headers
    //blink blinkA7 (clk_1,A,7,BALL_A7); //not on LED headers
    //blink blinkA8 (clk_1,A,8,BALL_A8); //not on LED headers
    //blink blinkA9 (clk_1,A,9,BALL_A9); //not on LED headers
    //blink blinkA10 (clk_1,A,10,BALL_A10); //not on LED headers
    //blink blinkA11 (clk_1,A,11,BALL_A11); //not on LED headers
    //blink blinkA12 (clk_1,A,12,BALL_A12); //not on LED headers
    //blink blinkA13 (clk_1,A,13,BALL_A13); //not on LED headers
    //blink blinkA14 (clk_1,A,14,BALL_A14); //not on LED headers
    //blink blinkA15 (clk_1,A,15,BALL_A15); //not on LED headers

    blink blinkB1 (clk_1,B,1,BALL_B1); //J4 pin 5
    //blink blinkB2 (clk_1,B,2,BALL_B2); //not on LED headers
    //blink blinkB3 (clk_1,B,3,BALL_B3); //not on LED headers
    //blink blinkB4 (clk_1,B,4,BALL_B4); //not on LED headers
    //blink blinkB5 (clk_1,B,5,BALL_B5); //not on LED headers
    //blink blinkB6 (clk_1,B,6,BALL_B6); //not on LED headers
    //blink blinkB7 (clk_1,B,7,BALL_B7); //not on LED headers
    //blink blinkB8 (clk_1,B,8,BALL_B8); //not on LED headers
    //blink blinkB9 (clk_1,B,9,BALL_B9); //not on LED headers
    //blink blinkB10 (clk_1,B,10,BALL_B10); //not on LED headers
    //blink blinkB11 (clk_1,B,11,BALL_B11); //not on LED headers
    //blink blinkB12 (clk_1,B,12,BALL_B12); //not on LED headers
    //blink blinkB13 (clk_1,B,13,BALL_B13); //not on LED headers
    //blink blinkB14 (clk_1,B,14,BALL_B14); //not on LED headers
    blink blinkB15 (clk_1,B,15,BALL_B15); //J11 pin 2
    //blink blinkA16 (clk_1,B,16,BALL_A16); //not on LED headers

    blink blinkC1 (clk_1,C,1,BALL_C1); //J4 pin 2
    //blink blinkC2 (clk_1,C,2,BALL_C2); //not on LED headers
    //blink blinkC3 (clk_1,C,3,BALL_C3); //not on LED headers
    blink blinkC4 (clk_1,C,4,BALL_C4); //J1 pin 2
    //blink blinkC5 (clk_1,C,5,BALL_C5); //not on LED headers
    //blink blinkC6 (clk_1,C,6,BALL_C6); //not on LED headers
    //blink blinkC7 (clk_1,C,7,BALL_C7); //not on LED headers
    //blink blinkC8 (clk_1,C,8,BALL_C8); //not on LED headers
    //blink blinkC9 (clk_1,C,9,BALL_C9); //not on LED headers
    //blink blinkC10 (clk_1,C,10,BALL_C10); //not on LED headers
    //blink blinkC11 (clk_1,C,11,BALL_C11); //not on LED headers
    //blink blinkC12 (clk_1,C,12,BALL_C12); //not on LED headers
    //blink blinkC13 (clk_1,C,13,BALL_C13); //not on LED headers
    blink blinkC14 (clk_1,C,14,BALL_C14); //J12 pin 1
    blink blinkC15 (clk_1,C,15,BALL_C15); //J10 pin 6
    blink blinkC16 (clk_1,C,16,BALL_C16); //J10 pin 5

    blink blinkD1 (clk_1,D,1,BALL_D1); //J4 pin 1
    blink blinkD3 (clk_1,D,3,BALL_D3); //J1 pin 6
    blink blinkD4 (clk_1,D,4,BALL_D4); //J1 pin 4
    //blink blinkD5 (clk_1,D,5,BALL_D5); //not on LED headers
    //blink blinkD6 (clk_1,D,6,BALL_D6); //not on LED headers
    //blink blinkD7 (clk_1,D,7,BALL_D7); //not on LED headers
    //blink blinkD8 (clk_1,D,8,BALL_D8); //not on LED headers
    //blink blinkD9 (clk_1,D,9,BALL_D9); //not on LED headers
    //blink blinkD10 (clk_1,D,10,BALL_D10); //not on LED headers
    //blink blinkD11 (clk_1,D,11,BALL_D11); //not on LED headers
    //blink blinkD12 (clk_1,D,12,BALL_D12); //not on LED headers
    //blink blinkD13 (clk_1,D,13,BALL_D13); //not on LED headers
    //blink blinkD14 (clk_1,D,14,BALL_D14); //not on LED headers
    //blink blinkD16 (clk_1,D,16,BALL_D16); //not on LED headers

    blink blinkE1 (clk_1,E,1,BALL_E1); //J4 pin 6
    //blink blinkE2 (clk_1,E,2,BALL_E2); //not on LED headers
    blink blinkE3 (clk_1,E,3,BALL_E3); //J1 pin 5
    //blink blinkE4 (clk_1,E,4,BALL_E4); //not on LED headers
    //blink blinkE5 (clk_1,E,5,BALL_E5); //not on LED headers
    //blink blinkE6 (clk_1,E,6,BALL_E6); //not on LED headers
    //blink blinkE7 (clk_1,E,7,BALL_E7); //not on LED headers
    //blink blinkE8 (clk_1,E,8,BALL_E8); //not on LED headers
    //blink blinkE9 (clk_1,E,9,BALL_E9); //not on LED headers
    //blink blinkE10 (clk_1,E,10,BALL_E10); //not on LED headers
    //blink blinkE11 (clk_1,E,11,BALL_E11); //not on LED headers
    //blink blinkE12 (clk_1,E,12,BALL_E12); //not on LED headers
    //blink blinkE13 (clk_1,E,13,BALL_E13); //not on LED headers
    //blink blinkE14 (clk_1,E,14,BALL_E14); //not on LED headers
    blink blinkE15 (clk_1,E,15,BALL_E15); //J14 pin 2
    blink blinkE16 (clk_1,E,16,BALL_E16); //J14 pin 1

    //blink blinkF1 (clk_1,F,1,BALL_F1); //not on LED headers
    blink blinkF2 (clk_1,F,2,BALL_F2); //J4 pin 5
    blink blinkF3 (clk_1,F,3,BALL_F3); //J2 pin 2
    //blink blinkF4 (clk_1,F,4,BALL_F4); //not on LED headers
    blink blinkF5 (clk_1,F,5,BALL_F5); //J2 pin 1
    //blink blinkF12 (clk_1,F,12,BALL_F12); //not on LED headers
    blink blinkF13 (clk_1,F,13,BALL_F13); //J16 pin 6
    blink blinkF14 (clk_1,F,14,BALL_F14); //J16 pin 5
    //blink blinkF15 (clk_1,F,15,BALL_F15); //not on LED headers
    blink blinkF16 (clk_1,F,16,BALL_F16); //J13 pin 6

    blink blinkG1 (clk_1,G,1,BALL_G1); //J5 pin 1
    blink blinkG2 (clk_1,G,2,BALL_G2); //J5 pin 2
    //blink blinkG3 (clk_1,G,3,BALL_G3); //not on LED headers
    blink blinkG4 (clk_1,G,4,BALL_G4); //J2 pin 6
    blink blinkG5 (clk_1,G,5,BALL_G5); //J3 pin 2
    //blink blinkG12 (clk_1,G,12,BALL_G12); //not on LED headers
    blink blinkG13 (clk_1,G,13,BALL_G13); //J16 pin 1
    blink blinkG14 (clk_1,G,14,BALL_G14); //J16 pin 2
    blink blinkG15 (clk_1,G,15,BALL_G15); //J13 pin 5
    //blink blinkG16 (clk_1,G,16,BALL_G16); //not on LED headers

    //blink blinkH2 (clk_1,H,2,BALL_H2); //not on LED headers
    blink blinkH3 (clk_1,H,3,BALL_H3);  //J2 pin 5
    //blink blinkH4 (clk_1,H,4,BALL_H4); //not on LED headers
    blink blinkH5 (clk_1,H,5,BALL_H5); //J3 pin 1
    blink blinkH12 (clk_1,H,12,BALL_H12); //J15 pin 5 
    blink blinkH13 (clk_1,H,13,BALL_H13); //J15 pin 6
    blink blinkH14 (clk_1,H,14,BALL_H14); //J13 pin 1
    blink blinkH15 (clk_1,H,15,BALL_H15); //J13 pin 2  

    //blink blinkJ1 (clk_1,J,1,BALL_J1); //not on LED headers
    //blink blinkJ2 (clk_1,J,2,BALL_J2); //not on LED headers
    //blink blinkJ3 (clk_1,J,3,BALL_J3); //not on LED headers
    blink blinkJ4 (clk_1,J,4,BALL_J4); //J3 pin 6
    //blink blinkJ5 (clk_1,J,5,BALL_J5); //not on LED headers
    //blink blinkJ12 (clk_1,J,12,BALL_J12); //not on LED headers
    blink blinkJ13 (clk_1,J,13,BALL_J13); //J15 pin 2
    //blink blinkJ14 (clk_1,J,14,BALL_J14); //not on LED headers
    //blink blinkJ15 (clk_1,J,15,BALL_J15); //not on LED headers
    //blink blinkJ16 (clk_1,J,16,BALL_J16); //not on LED headers

    //blink blinkK1 (clk_1,K,1,BALL_K1); //not on LED headers
    //blink blinkK2 (clk_1,K,2,BALL_K2); //not on LED headers
    //blink blinkK3 (clk_1,K,3,BALL_K3); //not on LED headers
    blink blinkK4 (clk_1,K,4,BALL_K4); //J5 pin 5 
    blink blinkK5 (clk_1,K,5,BALL_K5); //J5 pin 6
    //blink blinkK12 (clk_1,K,12,BALL_K12); //not on LED headers
    blink blinkK13 (clk_1,K,13,BALL_K13); //J15 pin 1
    //blink blinkK14 (clk_1,K,14,BALL_K14); //not on LED headers
    //blink blinkK15 (clk_1,K,15,BALL_K15); //not on LED headers
    //blink blinkK16 (clk_1,K,16,BALL_K16); //not on LED headers

    //blink blinkL1 (clk_1,L,1,BALL_L1); //not on LED headers
    //blink blinkL2 (clk_1,L,2,BALL_L2); //not on LED headers
    //blink blinkL3 (clk_1,L,3,BALL_L3); //not on LED headers
    blink blinkL4 (clk_1,L,4,BALL_L4); //J6 pin 2
    blink blinkL5 (clk_1,L,5,BALL_L5); //J6 pin 1
    //blink blinkL12 (clk_1,L,12,BALL_L12); //not on LED headers
    blink blinkL13 (clk_1,L,13,BALL_L13); //J14 6 
    //blink blinkL14 (clk_1,L,14,BALL_L14); //not on LED headers
    //blink blinkL15 (clk_1,L,15,BALL_L15); //not on LED headers
    //blink blinkL16 (clk_1,L,16,BALL_L16); //not on LED headers

    //blink blinkM1 (clk_1,M,1,BALL_M1); //not on LED headers
    //blink blinkM2 (clk_1,M,2,BALL_M2); //not on LED headers
    //blink blinkM3 (clk_1,M,3,BALL_M3); //not on LED headers
    assign BALL_M4 = 1'b0; //blink blinkM4 (clk_1,M,4,BALL_M4); //output enable, low-active
    //blink blinkM5 (clk_1,M,5,BALL_M5); //not on LED headers
    //blink blinkM6 (clk_1,M,6,BALL_M6); //not on LED headers
    blink blinkM7 (clk_1,M,7,BALL_M7); //J8 pin 1
    blink blinkM8 (clk_1,M,8,BALL_M8); //J8 pin 5
    //blink blinkM9 (clk_1,M,9,BALL_M9); //not on LED headers
    //blink blinkM10 (clk_1,M,10,BALL_M10); //not on package 'CABGA256'
    //blink blinkM11 (clk_1,M,11,BALL_M11); //not on LED headers
    //blink blinkM12 (clk_1,M,12,BALL_M12); //not on LED headers
    //blink blinkM13 (clk_1,M,13,BALL_M13); //not on LED headers
    //blink blinkM14 (clk_1,M,14,BALL_M14); //not on LED headers
    //blink blinkM15 (clk_1,M,15,BALL_M15); //not on LED headers
    //blink blinkM16 (clk_1,M,16,BALL_M16); //not on LED headers

    blink blinkN1 (clk_1,N,1,BALL_N1); //Shared, pin 13
    blink blinkN3 (clk_1,N,3,BALL_N3); //Shared, pin 9
    blink blinkN4 (clk_1,N,4,BALL_N4); //Shared, pin 7
    blink blinkN5 (clk_1,N,5,BALL_N5); //Shared, pin 10
    blink blinkN6 (clk_1,N,6,BALL_N6); //J7 pin 5
    //blink blinkN7 (clk_1,N,7,BALL_N7); //not on LED headers
    //blink blinkN8 (clk_1,N,8,BALL_N8);  //not on LED headers
    //blink blinkN11 (clk_1,N,11,BALL_N11); //not on LED headers
    //blink blinkN12 (clk_1,N,12,BALL_N12); //not on LED headers
    //blink blinkN13 (clk_1,N,13,BALL_N13); //not on LED headers
    //blink blinkN14 (clk_1,N,14,BALL_N14); //not on LED headers
    //blink blinkN16 (clk_1,N,16,BALL_N16); //not on LED headers

    //blink blinkP1 (clk_1,P,1,BALL_P1); //not on LED headers
    //blink blinkP2 (clk_1,P,2,BALL_P2); //not on LED headers
    //blink blinkP3 (clk_1,P,3,BALL_P3); //not on LED headers
    blink blinkP4 (clk_1,P,4,BALL_P4); //Shared, pin 11
    blink blinkP5 (clk_1,P,5,BALL_P5); //J7 pin 6
    //blink blinkP6 (clk_1,P,6,BALL_P6); //used as clk_i
    blink blinkP7 (clk_1,P,7,BALL_P7); //J8 pin 2
    //blink blinkP8 (clk_1,P,8,BALL_P8); //not on LED headers
    //blink blinkP9 (clk_1,P,9,BALL_P9); //DONE on package 'CABGA256'
    //blink blinkP10 (clk_1,P,10,BALL_P10); //CFG_1 on package 'CABGA256'
    //blink blinkP11 (clk_1,P,11,BALL_P11); //not on LED headers
    blink blinkP12 (clk_1,P,12,BALL_P12); //J9 pin 2
    blink blinkP13 (clk_1,P,13,BALL_P13); //J12 pin 2
    blink blinkP14 (clk_1,P,14,BALL_P14); //J12 pin 5
    blink blinkP15 (clk_1,P,15,BALL_P15); //J14 pin 6
    //blink blinkP16 (clk_1,P,16,BALL_P16); //not on LED headers

    //blink blinkR1 (clk_1,R,1,BALL_R1); //not on LED headers
    //blink blinkR2 (clk_1,R,2,BALL_R2); //not on LED headers
    //blink blinkR3 (clk_1,R,3,BALL_R3); //not on LED headers
    //blink blinkR4 (clk_1,R,4,BALL_R4); //not on LED headers
    //blink blinkR5 (clk_1,R,5,BALL_R5); //not on LED headers
    //blink blinkR6 (clk_1,R,6,BALL_R6); //not on LED headers
    //blink blinkR7 (clk_1,R,7,BALL_R7); //not on LED headers
    //blink blinkR8 (clk_1,R,8,BALL_R8); //not on LED headers
    //blink blinkR9 (clk_1,R,9,BALL_R9); //PROGRAMN on package 'CABGA256'
    //blink blinkR10 (clk_1,R,10,BALL_R10); //CFG_2 on package 'CABGA256'
    //blink blinkR11 (clk_1,R,11,BALL_R11); //TDI on package 'CABGA256'
    //blink blinkR12 (clk_1,R,12,BALL_R12); //not on LED headers
    //blink blinkR13 (clk_1,R,13,BALL_R13); //not on LED headers
    //blink blinkR14 (clk_1,R,14,BALL_R14); //not on LED headers
    //blink blinkR15 (clk_1,R,15,BALL_R15); //not on LED headers
    //blink blinkR16 (clk_1,R,16,BALL_R16); //not on LED headers

    blink blinkT2 (clk_1,T,2,BALL_T2); //J6 pin 5
    blink blinkT3 (clk_1,T,3,BALL_T3); //J7 pin 2
    //blink blinkT4 (clk_1,T,4,BALL_T4); //not on LED headers
    blink blinkT6 (clk_1,T,6,BALL_T6); //On board LED, low-active
    //blink blinkT7 (clk_1,T,7,BALL_T7); //not on LED headers
    //blink blinkT8 (clk_1,T,8,BALL_T8); //not on LED headers
    //blink blinkT9 (clk_1,T,9,BALL_T9); //INITN on package 'CABGA256'
    //blink blinkT10 (clk_1,T,10,BALL_T10); //TCK on package 'CABGA256'
    //blink blinkT11 (clk_1,T,11,BALL_T11); //TMS on package 'CABGA256'
    blink blinkT13 (clk_1,T,13,BALL_T13); //J9 pin 6
    blink blinkT14 (clk_1,T,14,BALL_T14); //J10 pin 1
    //blink blinkT15 (clk_1,T,15,BALL_T15); //not on LED headers

    /* Wiring */
    assign LED=ledval;
    //assign BALL_T6=ledval;
    
    /* Low speed clock generation */
    always @ (posedge clk_i) begin
        /* generate 500K Hz clock */
        cntr_9600 <= cntr_9600 + 1;
        if (cntr_9600 == period_9600) begin
            clk_9600 <= ~clk_9600;
            cntr_9600 <= 32'b0;
        end

        /* generate 1 Hz clock */
        cntr_1 <= cntr_1 + 1;
        if (cntr_1 == period_1) begin
            clk_1 <= ~clk_1;
            cntr_1 <= 32'b0;
        end
    end

    /* Increment ASCII digit and blink LED */
    always @ (posedge clk_1 ) begin
        ledval <= ~ledval;
        if (uart_txbyte == ASCII_9) begin
            uart_txbyte <= ASCII_0;
        end else begin
            uart_txbyte <= uart_txbyte + 1;
        end
    end

endmodule
