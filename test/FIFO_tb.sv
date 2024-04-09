`timescale 1ns / 1ns

module FIFO_tb;

  parameter DATA_WIDTH = 32;
  parameter MAX = 1024;

  logic clock, resetn;
  logic wr_en, rd_en;
  logic [DATA_WIDTH-1:0] data_in;
  logic [DATA_WIDTH-1:0] data_out;
  logic full, empty;

  // Queue to push data_in
  logic [DATA_WIDTH-1:0] wdata_q[$], wdata;

  FIFO #(.DEPTH(1024)) s_fifo
                (clock,
                resetn,
                wr_en,
                rd_en,
                data_in,

                full,
                empty,
                data_out);

    always #5ns clock = ~clock;

    initial begin
      clock = 1'b0;
      resetn = 1'b0;
      wr_en = 1'b0;
      rd_en = '0;
      data_in = '0;
      wdata = '0;
  end

  initial begin
    $dumpfile("output/FIFO.vcd");
    $dumpvars(0, FIFO_tb);
  end

  task push(int MAX);
    if(!full) begin
      for (int i = 0; i < MAX; ++i) begin
        wr_en = 1;
        rd_en = 0;
        data_in = $urandom;
        wdata_q.push_back(data_in);
        #10;
        $display("Push In: wr_en = %d, rd_en = %d, data_in = %d", wr_en, rd_en, data_in);
      end
    end
    else if(full)
      $display("FIFO Full!! Can not push data_in = %d ", data_in);
  endtask


  task pop(int MAX);
    if(!empty) begin
      for (int i = 0; i < MAX; ++i) begin
        rd_en = 1;
        wr_en = 0;
        #10;
        if (data_out != wdata_q.pop_front()) begin
          $display("Test Failed, wdata = %d data_out = %d", wdata_q.pop_front(), data_out);
        end
        $display("Pop Out: wr_en = %d, rd_en = %d, data_out = %d", wr_en, rd_en, data_out);
      end
    end
    else if (empty)
      $display("FIFO Empty!! Can not pop data_out");
  endtask

  initial begin
    #10;
    resetn = '1;
    #10;
    $display("Push 24 data in");
    push(24);
    $display("Pop 20 data out");
    pop(20);
    $display("Pop 4 data out");
    pop(4);
    rd_en = '0;
    wr_en  = '0;
    data_in = '0;
    #100;
    $display("--------------------------------");
    $display("TEST1: Fill fifo to 127");
    push(1023);
    $display("Pushed 127 words into FIFO");
    $display("Starting to read data from fifo");
    pop(1023);
    $display("--------------------------------");
    $display("TEST1: Fill fifo to 127 Complete");


    // Test reset\
    $display("TEST2: TEST RESET");
    resetn = '0;
    rd_en = '0;
    #50;
    resetn = '1;
    #100;
    $display("FIFO State|| Full = %d  Empty = %d", full, empty);
    $display("");
    $display("--------------------------------");
    $display("TEST3: fifo Overflow");
    $display("Push 1030 words into FIFO");
    push(1030);
    // $display("Overflow FIFO");
    $display("Starting to read data from fifo, after overflow");
    pop(1023);
    $display("--------------------------------");
    $display("TEST3: fifo Overflow completed");

    // push(1024);
    // pop(1);
    // push(98);
    #10
    $finish;
  end

endmodule
