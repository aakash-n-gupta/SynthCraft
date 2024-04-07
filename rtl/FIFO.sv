`timescale 1ns / 1ps

module FIFO #(parameter int DEPTH = 1024) (
    input clock,
    input resetn,
    input wr_en,
    input rd_en,
    input logic [31:0] data_in,

    output full,
    output empty,
    output logic [31:0] data);

    logic [31:0] fifo [DEPTH];

    // Keep track of fifo
    logic [($clog2(DEPTH) - 1):0] rd_ptr;
    logic [($clog2(DEPTH) - 1):0] wr_ptr;

    // if wr_ptr = 1024, fifo full, if 0, fifo empty
    assign full     = (wr_ptr == DEPTH) ? '1 : '0;
    assign empty    = (wr_ptr == '0) ? '1 : '0;

    // move data_in into FIFO current wr_ptr,
    always_ff @(posedge clock)
    begin
        if (!resetn) begin
            // flush all fifo data??
            data <= '0;
            wr_ptr <= '0;
            rd_ptr <= '0;

        end

        else
        begin
            if (wr_en && !full)
                fifo[wr_ptr] <= data_in;
        end
    end

    always_ff @(posedge clock)
    begin
        // write 0 to FIFO during reset
        if (!resetn) begin
            fifo[rd_ptr] <= '0;
        end
        else begin
            if (rd_en && !empty) begin
                data <= fifo[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end


endmodule
