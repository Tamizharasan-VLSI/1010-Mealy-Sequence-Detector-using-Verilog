module tb;
  reg clk,rst,data_in;
  wire data_out;
  integer i;
  
  fsm_mealy_1010 dut (clk,rst,data_in,data_out);
  
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
  
  task random;
  repeat(20)begin
  @(posedge clk);
  data_in = $random & 1;
  end
  endtask
  
   task random_;
  repeat(30)begin
  @(posedge clk);
  data_in = $urandom;
  end
  endtask
    
    initial begin
      clk = 1;
      reset ();
      seq ();
      #10;
      reset();
      random ();
      #10;
      reset();
      random_();
    #10;$finish;
    end
    

endmodule
