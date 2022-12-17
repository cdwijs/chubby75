
module blink(
    clk,
    col,
    row,
    led,
    );

    /* Inputs */
    input clk;
    input reg [3:0]col;
    input reg [3:0]row;

    /* Outputs */
    output led;

    /* Parameters */

    /* State variables */
    reg [10:0] counter = 11'd0;
    reg [3:0] preamble = 4'd1;
    reg [3:0] pauze = 4'd3;

    reg enable_preamble;
    reg enable_col;
    reg enable_row;
    reg enable_pauze;
    reg enable_colpauze;
  
always@(posedge clk) 
  begin
    	counter <= counter +1;
  end
  
  assign enable_preamble = ( counter[10:4] <= preamble);
  assign enable_col = ( counter[10:4] <= preamble+col  && counter[10:4] > preamble);
  assign enable_row = ( counter[10:4] <= preamble+col+pauze+row && counter[10:4] > preamble+col+pauze);
  assign led = ((counter[3] && ( enable_col || enable_row)) || (enable_preamble && counter[0])    );
  
  
endmodule
