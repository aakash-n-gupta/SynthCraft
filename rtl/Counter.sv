`timescale 1ns / 1ps


module Counter #(parameter int WIDTH = 8) (
    input logic                 clock,
    output logic [WIDTH-1:0]    count = '0
);

    always_ff @(posedge clock) begin
        count <= count + 1;
    end

endmodule
