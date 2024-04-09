`timescale 1ns / 10ps

module MTime_Interrupter #(parameter int XLEN = 32) (
    // Inputs
    input           clock,
    input           mtie,
    input           reset,
    input           load,
    // input [3:0]prescalar,
    input [XLEN-1:0] mtimecmp,

    // Outputs
    output [XLEN-1:0] mtime,
    output            mtip
);

    logic [XLEN-1:0] mtime_reg = '0;
    logic [XLEN-1:0] mtimecmp_reg = '0;
    logic interrupt;

// output assignments
    assign mtime = mtime_reg;

    // output is given when mtie is set (enabled)
    assign mtip = mtie ? interrupt : 1'b0;

// Set MTIME to always run until reset
    always_ff @(posedge clock) begin
        if (reset) begin
            mtime_reg       <= '0;
        end
        else begin
            mtime_reg <= mtime_reg + 1'b1;
        end
    end

// Load mtimecmp synchronously
always_ff @(posedge clock) begin
    if (reset) begin
        mtimecmp_reg <= '0;
    end
    else begin
        if (load)
            mtimecmp_reg <= mtimecmp;
        else
            mtimecmp_reg <= mtimecmp_reg;
        end
    end

// set interrupt when mtime runs over
    always_comb begin
        if ((mtime_reg >= mtimecmp_reg))
            interrupt = '1;
        else
            interrupt = '0;
    end

endmodule

