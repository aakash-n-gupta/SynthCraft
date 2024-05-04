`timescale 1ns / 1ns

// 2 port vs dual port memory difference
// Byte addressable with 32-bit IO

module Memory #(parameter DEPTH = 256, parameter WIDTH = 32) (
    input                       clk_i,
    input                       aresetn_i,
    input                       rw_en_i,
    input [$clog2(DEPTH)-1:0]   addr_i,
    input [WIDTH-1:0]           data_i,

    // output                      valid_o,
    output [WIDTH-1:0]          data_o
);

    // Need to make it byte addressable
    logic [WIDTH-1:0] Mem [DEPTH];
    logic [WIDTH-1:0] data;
    // logic valid;

    always_ff @(posedge clk_i or negedge aresetn_i) begin
        // valid <= '0;
        if (!aresetn_i)
        begin
            data <= '0;
        end
        else
        begin
            // rw_en -- 0 for Read en, 1 for write en
            if (rw_en_i)
                Mem[addr_i] <= data_i;
            else begin
                data <= Mem[addr_i];
                // valid <= '1;
            end
        end
    end

    // valid is asserted for when data is outputed
    // assign valid_o = valid;
    assign data_o = data;

endmodule
