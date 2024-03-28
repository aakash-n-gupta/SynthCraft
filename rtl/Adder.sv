`timescale 1ns / 1ps

// Adder Module

module Adder #(parameter WIDTH = 8) (
    input logic [WIDTH-1:0] in_a,
    input logic [WIDTH-1:0] in_b,
    input logic             cin,
    output logic [WIDTH:0] sum
);

    always_comb begin
        sum = in_a + in_b + {8'b0, cin};
    end
endmodule
