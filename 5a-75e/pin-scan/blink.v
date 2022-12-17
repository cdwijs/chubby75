
module blink(counter,
             reset,
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

  output reg [12:0] counter;
  input reset;
  input clk;
  output reg [3:0]preamble;
  output reg [3:0]col;
  output reg [3:0]row;
  output reg [3:0]pauze;
  output enable_preamble;
  output enable_col;
  output enable_row;
  output enable_pauze;
  output enable_colpauze;
  output led;

always@(posedge clk) 
  begin
    if (reset) begin
    	counter <= 0;
    	preamble <= 1;
      	col <= 7;
        row <= 5;
    	pauze <= 3; 
    end
    else
    	counter <= counter +1;
  end
  
  assign enable_preamble = ( counter[10:4] <= preamble);
  assign enable_col = ( counter[10:4] <= preamble+col  && counter[10:4] > preamble);
  assign enable_row = ( counter[10:4] <= preamble+col+pauze+row && counter[10:4] > preamble+col+pauze);
  assign led = ((counter[3] && ( enable_col || enable_row)) || (enable_preamble && counter[0])    );
  
  
endmodule
