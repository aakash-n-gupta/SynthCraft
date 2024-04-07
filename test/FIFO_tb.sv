`timescale 1ns / 1ps

module FIFO_tb;
    parameter DATA_WIDTH = 32;

    reg clock, resetn;
    reg wr_en, rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full, empty;
  
  // Queue to push data_in
  reg [DATA_WIDTH-1:0] wdata_q[$], wdata;

  FIFO s_fifo ( clock,
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
        data_in = 0;

        repeat(10) @(posedge clock);
            resetn = 1'b1;

    repeat(2) begin
        for (int i=0; i<30; i++) begin
            @(posedge clock);
                wr_en = (i%2 == 0)? 1'b1 : 1'b0;
                if (wr_en & !full) begin
                    data_in = $urandom;
                    wdata_q.push_back(data_in);
                end
            end
      #50;
    end
  end

  initial begin
    clock = 1'b0;
    resetn = 1'b0;
    rd_en = 1'b0;

    repeat(20) @(posedge clock);
        resetn = 1'b1;

    repeat(2) begin
      for (int i=0; i<30; i++) begin
        @(posedge clock);
        rd_en = (i%2 == 0)? 1'b1 : 1'b0;
        if (rd_en & !empty) begin
          #1;
          wdata = wdata_q.pop_front();
          if(data_out !== wdata) $error("Time = %0t: Comparison Failed: expected wr_data = %h, rd_data = %h", $time, wdata, data_out);
          else $display("Time = %0t: Comparison Passed: wr_data = %h and rd_data = %h",$time, wdata, data_out);
        end
      end
      #50;
    end

    $finish;
  end
  
  initial begin 
    $dumpfile("output/FIFO.vcd");
    $dumpvars(0, FIFO_tb);
  end
endmodule
