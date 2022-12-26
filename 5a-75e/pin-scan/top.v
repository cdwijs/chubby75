`include "uart_tx.v"
`include "blink.v"

/* baudrate: 9600 */
/* Top level module for keypad + UART demo */
module top (
    // input hardware clock (25 MHz)
    input clk_i, 
    // UART lines
    output BALL_T6, //LED
    output BALL_N5,
    output BALL_N3,
    //output BALL_P3, //not on LED headers
    output BALL_P4,
    output BALL_N4,
    //output BALL_M3, //not on LED headers
    output BALL_N1,
    //output BALL_M4, //output enable, seems to be low-active

    output BALL_C4,
    output BALL_D4,
    //output BALL_E4, //not on LED headers
    output BALL_D3,
    output BALL_E3, 
    //output BALL_F4, //not on LED headers

    output BALL_F3,
    output BALL_F5,
    //output BALL_G3, //not on LED headers
    output BALL_G4,
    output BALL_H3,
    //output BALL_H4,
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

    blink blinkT6 (clk_1,T,6,BALL_T6); //LED (low-active)

    blink blinkN5 (clk_1,N,5,BALL_N5); //global pin 10
    blink blinkN3 (clk_1,N,3,BALL_N3); //global pin 9
    //blink blinkP3 (clk_1,P,3,BALL_P3); //not on LED headers
    blink blinkP4 (clk_1,P,4,BALL_P4); //global pin 11
    blink blinkN4 (clk_1,N,4,BALL_N4); //global pin 7
    //blink blinkM3 (clk_1,M,3,BALL_M3); //not on LED headers
    blink blinkN1 (clk_1,N,1,BALL_N1);  //global pin 13
    //blink blinkM4 (clk_1,M,4,BALL_M4); //output enable, seems to be low-active

    blink blinkC4 (clk_1,C,4,BALL_C4); //J1 pin 2
    blink blinkD4 (clk_1,D,4,BALL_D4); //J1 pin 1
    //blink blinkE4 (clk_1,E,4,BALL_E4); //not on LED headers
    blink blinkD3 (clk_1,D,3,BALL_D3); //J1 pin 6 
    blink blinkE3 (clk_1,E,3,BALL_E3); //J1 pin 5
    //blink blinkF4 (clk_1,F,4,BALL_F4); //not on LED headers

    blink blinkF3 (clk_1,F,3,BALL_F3); //J2 pin 2
    blink blinkF5 (clk_1,F,5,BALL_F5); //J2 pin 1
    //blink blinkG3 (clk_1,G,3,BALL_G3); //not on LED headers
    blink blinkG4 (clk_1,G,4,BALL_G4); //J2 pin 6
    blink blinkH3 (clk_1,H,3,BALL_H3); //J2 pin 5
    //blink blinkH4 (clk_1,H,4,BALL_H4);


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
