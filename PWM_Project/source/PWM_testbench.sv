`timescale 1ns / 1ns

module pwm_test;

    logic clk;
    logic en;
    logic rst_n;
    logic [7:0]  duty_cycle;
    logic [31:0] freq_div;
    logic        clk_o;
    PWM test (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .duty_cycle(duty_cycle),
        .freq_div(freq_div),
        .clk_o(clk_o));
//Tạo Clock 50Mhz
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        $dumpfile("dump.vcd");
      $dumpvars(0, pwm_test);
        rst_n = 1'b0; 
        #100;
        rst_n = 1'b1;
        en = 1'b0;
        duty_cycle = 127; 
        freq_div = 1000;
        #100;
        rst_n = 1'b1;
        en = 1'b1;
        duty_cycle = 127; 
        freq_div = 1000;
        #50000000;
        $finish;
    end
endmodule
    
