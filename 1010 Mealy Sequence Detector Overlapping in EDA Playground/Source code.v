
module fsm_moore_1010(
  input clk,rst,data_in,
  output reg data_out);
  
  parameter s0 = 2'b00,
  s1 = 2'b01,
  s2 = 2'b10,
  s3 = 2'b11;
  
  reg [1:0] current_state,next_state;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      current_state = s0;
    else
      current_state = next_state;
  end
  
  always@(*)begin
    data_out = 0;
    
    case(current_state) //1
      s0: begin
        if(data_in)
          next_state = s1;
        else
          next_state = s0;
      end
      
       s1: begin
         if(!data_in)  //10
          next_state = s2;
        else
          next_state = s1;
      end
      
       s2: begin   //101
        if(data_in)
          next_state = s3;
        else
          next_state = s0;
      end
      
       s3: begin    //1010
         if(!data_in)begin
           data_out = 1;
          next_state = s2;
         end
           else begin
          next_state = s0;
      end
      end
    endcase
  end
endmodule