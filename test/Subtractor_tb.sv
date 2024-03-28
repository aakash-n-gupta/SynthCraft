`timescale 1ns / 1ps

module Subtractor_tb;

    // Parameters
    parameter WIDTH = 8;

    // Inputs
    logic [WIDTH-1:0] in_a;
    logic [WIDTH-1:0] in_b;

    // Outputs
    logic [WIDTH:0] result;

    // Instantiate Adder module
    Subtractor #(WIDTH) DUT (
        .in_a(in_a),
        .in_b(in_b),
        .result(result)
    );

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize inputs
        in_a = '0;   // Example values, change as needed
        in_b = '0;

        // Apply stimulus for a few clock cycles
        #12;

        // Dump VDC file
        $dumpfile("output/Subtractor.vcd");
        $dumpvars(0, Subtractor_tb);

        // Print header
        $display("Time\t in_a\t in_b\t difference");

        // Manual tests for edge cases
        in_a = '0;
        in_b = 255;
        #20;


        // Iterate through test cases
        repeat (100) begin
            // Print inputs
            $display("%0t\t %d\t %d\t %d", $time, in_a, in_b, result);

            // Change inputs for next iteration (Example: increment in_a)
            in_a = $urandom % (2**WIDTH);
            in_b = $urandom % (2**WIDTH);
            #10;

            if ((result != in_a - in_b))
            begin
                $display("Error: Unexpected result at time %0t", $time);
                $display("in_a = %d, in_b = %d ", in_a, in_b);
                $display("Expected: Difference = %d ", (in_a - in_b));
                $display("Actual: Difference = %d ", $signed(result));
            end
            // Wait for some time
        end
        // End simulation
        $finish;
    end

endmodule
