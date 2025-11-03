module tb_mod7;

  logic       clk, rst, dir, now;
  logic [2:0] value;

  mod7 dut (
    .clk(clk), 
    .rst(rst), 
    .dir(dir), 
    .now(now), 
    .value(value));

  // initiat clk
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  initial begin
    // Defaults
    rst = 0; dir = 1; now = 0;

    //Reset 
    #2   rst = 1;   
    #10  rst = 0;  

    // Count UP with enable: run long enough to wrap 6 -> 0 
    now = 1; dir = 1;
    #90;        

    // Not Counting
    now = 0;
    #40;           
    rst = 1;  
    
    //Reset 
    // Count DOWN with enable: run long enough to wrap 0-> 6
    #12  rst = 0;  
    dir = 0; now = 1;
    #80;         

   
$finish;
  end

endmodule
