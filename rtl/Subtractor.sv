`timescale 1ns / 1ps

// Simple Subtractor Module

module Subtractor #(parameter WIDTH = 8) (
    input logic  [WIDTH-1:0] in_a,
    input logic  [WIDTH-1:0] in_b,
    output logic signed [WIDTH:0] result
);

    always_comb begin
        result = in_a - in_b;
    end

endmodule
