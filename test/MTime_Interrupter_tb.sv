`timescale 1ns / 10ps

module MTime_Interrupter_tb;

    // Parameters
    parameter XLEN = 8;
    int errors = 0;
    int cycles = 0;

    // Inputs
    logic             mtie;
    logic             reset;
    logic             load;
    logic [XLEN-1:0]  mtimecmp;

    // Outputs
    logic [XLEN-1:0]    mtime;
    logic               mtip;

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Instantiate Adder module
    MTime_Interrupter #(XLEN) MTIME (
        .clock(clk),
        .mtie(mtie),
        .reset(reset),
        .load(load),
        .mtimecmp(mtimecmp),
        .mtime(mtime),
        .mtip(mtip)
    );

    // Test stimulus
    initial begin

        // Dump VDC file
        $dumpfile("output/MTime_Interrupter.vcd");
        $dumpvars(0, MTime_Interrupter_tb);

        // Initialize inputs
        mtie        = '0;
        reset       = '1;
        load        = '0;
        mtimecmp    = '0;
        // Apply stimulus for a few (3) clock cycles
        #17;

        $display("MTIME is: ", mtime);
        // De-assert reset to apply inputs
        reset = '0;
        mtie = 1;
        #10;

        load = '1;
        mtimecmp = 8'b1111_0000;
        #10;

        load = '0;
        mtimecmp = '0;
        #1000;

        reset = 1;
        #10


        // De-assert reset to apply inputs
        reset = '0;
        mtie = 1;
        #10;

        load = '1;
        mtimecmp = 8'b1000_0000;
        #10;

        load = '0;
        mtimecmp = '0;
        #5000;

        // End simulation
        $finish;
    end

endmodule

/***l
Notes

when rs1 is WIDTH/2, say 8-bits and $signed is used, would it sign extend the rs1 value to required bits when reading and comparing?
*/
