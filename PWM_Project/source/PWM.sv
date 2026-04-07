module PWM (
   input clk,
   input rst_n,
   input en,
   input [7:0]duty_cycle,
   input  [31:0]freq_div,
   output logic clk_o);
   logic [31:0]count;
   logic [31:0]high;
   logic [7:0]duty_cycle_present;
   logic [31:0]freq_div_present;
   assign high = (duty_cycle_present*freq_div_present)>>8;
  
  always_ff@(posedge clk, negedge rst_n)
    begin
      if (!rst_n) begin
        count <= 0;
        duty_cycle_present <= 0;
        freq_div_present <= 0;
      end
      else if (en) begin
        if (count >= freq_div_present-1 || freq_div_present == 0)
          begin
          count <= 0;
          duty_cycle_present <= duty_cycle;
          freq_div_present <= freq_div;
          end
        else count <= count + 1;    
      end
    end
  
   always_comb
    begin
      if (!en) clk_o = 1'b0;
		else begin
          if (count <= high) clk_o = 1'b1;
      else clk_o = 1'b0;
		end
    end
endmodule