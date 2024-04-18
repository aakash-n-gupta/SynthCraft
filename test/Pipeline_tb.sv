`timescale 1ns / 10ps

module Pipeline_tb;

  parameter XLEN = 32;

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
    for (int i = 0; i < 4; i++ ) begin
      data_in = $urandom;
      data_pipeline[i] = data_in;
      #10;
      // data pushed in every cycle
      // compare output data with data_in from 4 cycles ago
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

    // Test manual inputs
    // #10;
    // data_in = 32'hdeadbeef;
    // #10;

    // data_in = 32'h12345678;
    // #10;

    // data_in = 32'h98765432;
    // #10;

    // data_in = 32'hcafebabe;
    // #10;
    // if(!(data_out == 32'hdeadbeef))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // data_in = 32'hdecafbad;
    // #10;
    // if(!(data_out == 32'h12345678))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // data_in = 32'hbabafafa;
    // #10;
    // if(!(data_out == 32'h98765432))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // data_in = 32'hcabfaced;
    // #10;
    // if(!(data_out == 32'hcafebabe))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // data_in = 32'hdeafaced;
    // #10;
    // if(!(data_out == 32'hdecafbad))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // #10;
    // if(!(data_out == 32'hbabafafa))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // #10;
    // if(!(data_out == 32'hcabfaced))
    //   $display("Test Failed! Actual Output = %d", data_out);

    // #10;
    // if(!(data_out == 32'hdeafaced))
    //   $display("Test Failed! Actual Output = %d", data_out);

    #10;
    test_output(100);

    #100;
    $display("Pipeline Module Test Completed");
    $finish;
  end

endmodule
