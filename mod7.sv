module mod7 (
  input  logic       clk,
  input  logic       rst,      // synchronous, active-high
  input  logic       dir,      // 1=up, 0=down
  input  logic       now,      // tick enable
  output logic [2:0] value
);

  logic [2:0] count, ncount;

  // State register (sync reset)
  always_ff @(posedge clk) begin
    if (rst) begin
      count <= 3'd0;
    end
    else begin
      count <= ncount;
    end
  end

  // Next-state logic
  always_comb begin
    ncount = count;                  // hold by default
    if (now) begin
      if (dir) begin                       // count up
        ncount = (count == 3'd6) ? 3'd0 : count + 3'd1;
      end
      else begin                          // count down
        ncount = (count == 3'd0) ? 3'd6 : count - 3'd1;
        end
    end
  end

  // Separate assignment to output
  assign value = count;

endmodule
