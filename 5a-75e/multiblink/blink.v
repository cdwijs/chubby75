
module blink(
  input clk,
  input [6:0] col,
  input [6:0] row,
  output led
);
  reg [10:0] counter = 11'd0;
  reg [6:0] preamble = 7'd2;
  reg [6:0] pauze = 7'd2;

    reg enable_preamble;
    reg enable_col;
    reg enable_row;
  	reg reset;
  
always@(posedge clk) 
  begin
    if (reset)
      	counter <= 0;
	else
  		counter <= counter +1;
  end
  
  assign enable_preamble = ( counter[10:4] <= preamble);
  assign enable_col = ( counter[10:4] <= preamble+col  && counter[10:4] > preamble);
  assign enable_row = ( counter[10:4] <= preamble+col+pauze+row && counter[10:4] > preamble+col+pauze);
  assign led = ((counter[3] && ( enable_col || enable_row)) || (enable_preamble && counter[0])    );
  assign reset = (counter[10:4] > preamble+col+pauze+row+pauze);
endmodule
