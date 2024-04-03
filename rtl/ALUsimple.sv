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


    always_comb begin
        if (resetn)
        begin
            alu_result = '0;
            flag = '0;
        end
        else
        begin
            alu_result = '0;
            flag = {1'b0, alu_result[WIDTH], alu_result[WIDTH]};
            case (aluop_in)
                ADD : alu_result             = rs1 + rs2;
                SUB : alu_result             = rs1 - rs2;
                AND : alu_result [WIDTH-1:0] = rs1 & rs2;
                SLL : alu_result [WIDTH-1:0] = rs1 << rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                SRL : alu_result [WIDTH-1:0] = rs1 >> rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                SRA : alu_result [WIDTH-1:0] = rs1 >>> rs2 [WIDTH/4 -1: 0]; // for 16-bit ALU
                SLT : alu_result             = rs1 - rs1; // if b > a MSB of alu_result will be 1
                SLTU: alu_result             = (rs1 < rs2) ? 1 : 0; // setting only LSB??
                // if 8th bit of rs1 is 1, the number is signed, so we extend 1 else 0
                SEXT: alu_result             = (rs1[WIDTH/2 - 1]) ? {9'b11111_1111, rs1[WIDTH/2 - 1:0]} : {9'b0, rs1[WIDTH/2 - 1:0]};
                ZEXT: alu_result             = {9'b0, rs1[WIDTH/2 - 1:0]}; // zero-extend
                XOR : alu_result [WIDTH-1:0] = rs1 ^ rs2;
                NEG : alu_result [WIDTH-1:0] = -(rs1); // will this work in syntesys?
                default: begin
                    alu_result = 'Z; // ILLEGAL opcode
                    flag = 3'b100; // SET ILLEGAL flag
                end
            endcase
        end
    end

    assign rd = alu_result[WIDTH-1:0];

endmodule
