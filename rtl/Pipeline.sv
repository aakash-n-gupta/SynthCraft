`timescale 1ns / 1ns

module Pipeline #(parameter int XLEN = 32)
(
    input clock,
    input resetn,
    input stall,
    input [XLEN-1:0] data_in,

    output [XLEN-1:0] data_out
);

    // Create register stages for data_in
    logic [XLEN-1:0] data_stage0;
    logic [XLEN-1:0] data_stage1;
    logic [XLEN-1:0] data_stage2;
    logic [XLEN-1:0] data_stage3;

    assign data_out = data_stage3;

    always_ff @(posedge clock) begin
        if (!resetn)
        begin
            data_stage0 <= '0;
        end
        else
        begin
            data_stage0 <= data_stage0;
            if (!stall)
                data_stage0 <= data_in;
        end
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            data_stage1 <= '0;
        end
        else
        begin
            data_stage1 <= data_stage1;
            if(!stall)
                data_stage1 <= data_stage0;
        end
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            data_stage2 <= '0;
        end
        else
        begin
            data_stage2 <= data_stage2;
            if(!stall)
                data_stage2 <= data_stage1;
        end
    end

    always_ff @(posedge clock) begin
        if (!resetn) begin
            data_stage3 <= '0;
        end
        else
        begin
            data_stage3 <= data_stage3;
            if(!stall)
                data_stage3 <= data_stage2;
        end
    end
endmodule
