`timescale 1ns / 1ps

module Counter_tb;

    // Parameters
    parameter int WIDTH = 8;
    int errors = 0;
    int cycles = 0;

    // Outputs
    logic [WIDTH-1:0]    count;

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Instantiate Adder module
    Counter #(WIDTH) DUT (
        .clock(clk),
        .count(count)
    );


    // Test stimulus
    initial begin

        // Dump VDC file
        $dumpfile("output/Counter.vcd");
        $dumpvars(0, Counter_tb);

        $display("Counter value: %d", count);

        #10000

        // End simulation
        $finish;
    end

endmodule

/***l
Notes

when rs1 is WIDTH/2, say 8-bits and $signed is used, would it sign extend the rs1 value to required bits when reading and comparing?
*/
