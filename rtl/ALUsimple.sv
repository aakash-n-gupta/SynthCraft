`timescale 1ns / 1ps

// Simple ALU module, Targeted for 16-bit but parameterizable to any XLEN

typedef enum logic [3:0] {
            ADD  =  4'b0001,
            SUB  =  4'b0010,
            AND  =  4'b0011,
            SLL  =  4'b0100,
            SRL  =  4'b0101,
            SRA  =  4'b0110,
            SLT  =  4'b0111,
            SLTU =  4'b1000,
            SEXT =  4'b1001,
            ZEXT =  4'b1010,
            XOR  =  4'b1011,
            NEG  =  4'b1100
    } aluop_t;

module ALUsimple #(parameter WIDTH = 16) (
    input logic [WIDTH-1:0] rs1,
    input logic [WIDTH-1:0] rs2,
    input aluop_t           aluop_in,
    input logic             resetn,
    output logic [WIDTH-1:0] rd,
    output logic [2:0]       flag
);

    // aluop_t aluop;
    // assign aluop = aluop_in;

    logic [WIDTH:0] alu_result;

    assign rd = alu_result[WIDTH-1:0];

    always_comb begin
        if (resetn)
        begin
            alu_result = '0;
            flag = '0;
        end
        else
        begin
            alu_result = '0;
            flag = '0;
            case (aluop_in)
                ADD : begin
                    alu_result              = rs1 + rs2;
                    flag                    = {1'b0, alu_result[WIDTH], 1'b0};
                end
                SUB : begin
                    alu_result              = rs1 - rs2;
                    flag                    = {1'b0, 1'b0, alu_result[WIDTH]};
                end
                AND : begin
                    alu_result [WIDTH-1:0]  = {1'b0, rs1 & rs2};
                    flag                    = '0;
                end
                SLL : begin
                    alu_result [WIDTH-1:0]  = rs1 << rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                    flag                    = '0;
                end
                SRL : begin
                    alu_result  [WIDTH-1:0] = rs1 >> rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                    flag                    = '0;
                end
                SRA : begin
                    alu_result  [WIDTH-1:0] = rs1 >>> rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                    flag                    = '0;
                end
                SLT : begin
                     // if rs1 > rs2 MSB of alu_result will be 1
                    alu_result              = ($signed(rs1) < $signed(rs2)) ? 1: 0;
                    flag                    = {1'b0, 1'b0, alu_result[WIDTH]};
                end
                SLTU: begin
                    alu_result              = (rs1 < rs2) ? 1 : 0; // setting only LSB??
                    flag                    = '0;
                end
                // if 8th bit of rs1 is 1, the number is signed, so we extend 1 else 0
                SEXT: begin
                    alu_result              = (rs1[WIDTH/2 - 1]) ? {9'b11111_1111, rs1[WIDTH/2 - 1:0]} : {9'b0, rs1[WIDTH/2 - 1:0]};
                    flag                    = '0;
                end
                ZEXT: begin
                    alu_result              = {9'b0, rs1[WIDTH/2 - 1:0]}; // zero-extend
                    flag                    = '0;
                end
                XOR : begin
                    alu_result  [WIDTH-1:0] = rs1 ^ rs2;
                    flag                    = '0;
                end
                NEG : begin
                    alu_result  [WIDTH-1:0] = -(rs1); // will this work in syntesys?
                    flag                    = '0;
                end
                default: begin
                    alu_result = 'Z; // ILLEGAL opcode
                    flag = 3'b100; // SET ILLEGAL flag
                end
            endcase
        end
    end

endmodule
