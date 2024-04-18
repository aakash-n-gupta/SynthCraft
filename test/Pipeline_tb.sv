`timescale 1ns / 10ps

module Pipeline_tb;

  parameter XLEN = 32;

  int push = 0;

  logic rstn;
  logic stall;
  logic [XLEN-1:0] data_in;

  logic [XLEN-1:0] data_out;

  // Queue to push data_in
  logic [XLEN-1:0] data_pipeline[$];

  // $display("Before Module Instanciation");

  // Clock Generation
  logic clk = 0;
  always #5 clk = ~clk;

  Pipeline #(XLEN) DUT (
      .clock(clk),
      .resetn(rstn),
      .stall(stall),
      .data_in(data_in),
      .data_out(data_out)
  );

  task test_output(int TEST_CYCLES);

    $display("Starting Test: %d cycles", TEST_CYCLES);
    push = 0;
    rstn = '1;
    for (int i = 0; i < TEST_CYCLES; i++) begin
      data_in = $urandom;
      data_pipeline.push_back(data_in);
      push++;
      #10;
      // data pushed in every cycle
      // compare output data with data_in from 4 cycles ago
      // pop data from 4th cycle onwards
      if (push > 3) begin
        if(!(data_out == data_pipeline.pop_front()))
          $display("Test Failed");
      end
    end
  endtask

  initial begin


    $dumpfile("output/Pipeline.vcd");
    $dumpvars(0, Pipeline_tb);

    #5;
    rstn  = 1'b0;
    data_in = '0;
    stall = '0;
    #10;
    rstn = '1;
    #10;

    $display("Start Test");

    #10;
    test_output(100);

    // Test reset
    #9;
    rstn = '0;
    #10;
    test_output(10);
    #10;

    // Test Stall
    stall = '1;
    #10;
    test_output(10);
    stall = '0;
    test_output(20);


    #100;
    $display("Pipeline Module Test Completed");
    $finish;
  end

endmodule
