`timescale 1ns / 1ps

module Adder_tb;

    // Parameters
    parameter int WIDTH = 8;

    // Inputs
    logic [WIDTH-1:0] in_a;
    logic [WIDTH-1:0] in_b;
    logic cin;

    // Outputs
    logic [WIDTH:0] sum;

    // Instantiate Adder module
    Adder #(WIDTH) DUT (
        .in_a(in_a),
        .in_b(in_b),
        .cin(cin),
        .sum(sum)
    );

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize inputs
        in_a = '0;   // Example values, change as needed
        in_b = '0;
        cin = '0;

        // Apply stimulus for a few clock cycles
        #12;

        // Dump VCD output
        $dumpfile("output/Adder.vcd");
        $dumpvars(0, Adder_tb);

        // Print header
        $display("Time\t in_a\t in_b\t cin\t sum\t cout");

        // Iterate through test cases
        repeat (100) begin
            // Print inputs
            $display("%0t\t %d\t %d\t %d\t %d", $time, in_a, in_b, cin, sum);

            // Change inputs for next iteration (Example: increment in_a)
            in_a = $urandom % (2**WIDTH);
            in_b = $urandom % (2**WIDTH);
            cin  = $urandom %  2;
            #10;

            if ((sum != in_a + in_b + cin))
            begin
                $display("Error: Unexpected result at time %0t", $time);
                $display("in_a = %d, in_b = %d, cin = %b", in_a, in_b, cin);
                $display("Expected: sum = %d ", in_a+in_b+cin, (in_a+in_b+cin > ((2**WIDTH)-1)));
                $display("Actual: sum = %d ", sum);
            end
            // Manual Edge case tests
            // Error out as soon as the test fails

            // Wait for some time
        end
        // End simulation
        $finish;
    end

endmodule
