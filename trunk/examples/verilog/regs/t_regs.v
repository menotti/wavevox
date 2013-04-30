`timescale 1ns / 100ps
module t_regs;
  reg clock;
  wire [7:0] a;
  wire [7:0] b;

  regs dut (clock, a, b);

  initial begin
    clock = 0;
    #100 $finish;
  end

  always begin
    #10 clock = !clock;
  end


  initial  begin
    $dumpfile ("t_regs.vcd"); 
    $dumpvars; 
  end 

endmodule
