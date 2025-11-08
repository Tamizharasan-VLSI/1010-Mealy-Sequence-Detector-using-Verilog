// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,data_in;
  wire data_out;
  integer i;
  
  fsm_moore_1010 dut (clk,rst,data_in,data_out);
  
  initial begin
    forever begin
      #5 clk = ~clk;
    end
  end
  
  task reset;
    begin
      rst = 1;
      #10;
      rst = 0;
    end
  endtask
  
  task seq;
    reg [10:0] pattern = 11'b10011010101;
    begin
      for(i = 10;i >= 0;i=i-1)begin
        @(posedge clk);
        data_in = pattern[i];
        #10;
      end
    end
  endtask
    
    initial begin
      $monitor("time=%0t,data_in=%0b,data_out=%0b,state = %b",$time,  data_in,  data_out,  dut.current_state);
      $dumpfile("dump.vcd");
      $dumpvars(0,tb);
      clk = 1;
      reset ();
      seq ();
    #10;$finish;
    end
    
endmodule