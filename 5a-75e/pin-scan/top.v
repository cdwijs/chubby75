`include "uart_tx.v"
`include "blink.v"

/* baudrate: 9600 */
/* Top level module for keypad + UART demo */
module top (
    // input hardware clock (25 MHz)
    clk_i, 
    // UART lines
    TX,
    BALL_T6, //LED
    BALL_N5,
    );

    parameter clk_freq = 25000000;
    parameter baudrate = 75;

    /* Clock input */
    input clk_i;

    /* FTDI I/O */
    output TX;
    output BALL_T6; //LED

    /* BLINK I/O */
    output BALL_N5;

    /* 9600 Hz clock generation (from 25 MHz) */
    reg clk_9600 = 0;
    reg [31:0] cntr_9600 = 32'b0;
    //parameter period_9600 = /* 2500 */; /* clk_freq / 2 / baudrate */
    parameter period_9600 = (clk_freq / 2 / baudrate);

    /* 1 Hz clock generation (from 25 MHz) */
    reg clk_1 = 0;
    reg [31:0] cntr_1 = 32'b0;
    parameter period_1 = 2500000;

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

    /* UART transmitter module designed for
       8 bits, no parity, 1 stop bit. 
    */
    uart_tx_8n1 transmitter (
        // 9600 baud rate clock
        .clk (clk_9600),
        // byte to be transmitted
        .txbyte (uart_txbyte),
        // trigger a UART transmit on baud clock
        .senddata (uart_send),
        // input: tx is finished
        .txdone (uart_txed),
        // output UART tx pin
        .tx (TX),
    );

    blink myblink (
        counter (),
        reset ()
        clk,
        col,
        row,
        pauze,
        enable_col,
        enable_row,
        enable_pauze,
        enable_colpauze,
        led,
        enable_preamble,
        preamble
    );

    /* Wiring */
    assign LED=ledval;
    assign BALL_T6=ledval;
    
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
