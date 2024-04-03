`timescale 1ns / 1ps

module ALUsimple_tb;

    // Parameters
    parameter WIDTH = 16;
    parameter logWIDTH = $clog2(WIDTH);
    int errors = 0;
    int cycles = 0;

enum logic [3:0] {
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
} aluops;

    // aluop_t aluop_v;

    // Inputs
    logic             resetn;
    logic [WIDTH-1:0] rs1;
    logic [WIDTH-1:0] rs2;
    logic [3:0]       aluop_v;

    // Outputs
    logic [WIDTH-1:0] result;
    logic [2:0]       flag;

    // for signed comparisons
    logic [WIDTH-1:0] signed_rs1 = $signed(rs1);
    logic [WIDTH-1:0] signed_rs2 = $signed(rs2);


    // Instantiate Adder module
    ALUsimple #(WIDTH) ALU0 (
        .rs1(rs1),
        .rs2(rs2),
        .aluop_in(aluop_v),
        .resetn(resetn),
        .rd(result),
        .flag(flag)
    );

    // Clock generation
    logic clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin

        // Dump VDC file
        $dumpfile("ALUsimple.vcd");
        $dumpvars(0, ALUsimple_tb);

        // Initialize inputs
        rs1 = '0;   // Example values, change as needed
        rs2 = '0;
        aluop_v = ADD;
        resetn = 1; // Hold in reset when starting simulation

        // Apply stimulus for a few (3) clock cycles
        #17;

        // Check outputs in waveform only

        // Manual tests for edge cases
        // Test reset and illegal opcode case

        // inputs here should be ignored since ALU is held in reset
        repeat (10) begin
        rs1 = $urandom % (2**WIDTH);
        rs2 = $urandom % (2**WIDTH);
        aluop_v = SUB;
        if (result == 0 && flag == 0)
            $display("Reset test passed!");
        else
            $display("Reset test failed");
        #10;
        end

        // De-assert resetn to apply inputs
        #10;
        resetn = 0;
        #10;

        // Test illegal opcodes
        // Output result should be Z, and flag ILLEGAL = 1
        rs1 = '0;
        rs2 = 255;
        aluop_v = 4'b1111;
        #10;
        if (result == 'Z && flag[2] == 1)
            $display("Illegal aluop_v test passed!");
        else
            $display("Illegal aluop_v test failed");

        #10;

        rs1 = 1834;
        rs2 = 3745;
        aluop_v = 4'b1111;
        #10;
        if (result == 'Z && flag[2] == 1)
            $display("Illegal aluop_v test passed!");
        else
            $display("Illegal aluop_v test failed");

        // Add test cases for overflow and underflow

        // Iterate through test cases
        repeat (100)
        begin
            // ADD
            rs1 = $urandom % (2**(WIDTH-1));
            rs2 = $urandom % (2**(WIDTH-1));
            aluop_v = ADD;
            #10;
            if((result != rs1 + rs2)) begin
                $display("Test ADD: Fail | Result is %d", result);
            end
        end
        $display("Test ADD: 100 cycles passed!");

        repeat (100)
        begin
            // SUB
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = SUB;
            #10;
            if(result != rs1 - rs2)
                $display("Test SUB: Failed");
        end
        $display("Test SUB: 100 cycles passed!");

        repeat (100)
        begin
            // AND bitwise
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = AND;
            #10;
            if(result != rs1 & rs2)
                $display("Test AND: Failed");
        end
        $display("Test AND: 100 cycles passed!");

        repeat (10)
        begin
            // SLL
            rs1 = $urandom % (2**(WIDTH/2));
            rs2 = $urandom % WIDTH; // max shamt will be log2(WIDTH)
            aluop_v = SLL;
            #10;
            if(result != rs1 << rs2[logWIDTH-1:0])
                $display("Test SLL: Failed");
        end
        $display("Test SSL: 10 cycles passed!");

        repeat (10)
        begin
            // SRL
            rs1 = $urandom % (2**(WIDTH/2));
            rs2 = $urandom % WIDTH; // max shamt will be log2(WIDTH)
            aluop_v = SRL;
            #10;
            if(result != rs1 >> rs2[logWIDTH-1:0])
                $display("Test SRL: Failed");
        end
        $display("Test SRL: 10 cycles passed!");

        repeat (50)
        begin
            // SRA
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = SRA;
            #10;
            if(result != rs1 >>> rs2[logWIDTH-1:0])
                $display("Test SRA: Failed");
        end
        $display("Test SRA: 50 cycles passed!");

        repeat (100)
        begin
            // SLT bitwise
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = SLT;
            #10;
            if(! ((signed_rs2 > signed_rs1) && (result == 1)) )
                $display("Test SLT: Failed");
            if (! ((signed_rs2 < signed_rs1) && (result == 0)) )
                $display("Test SLT: Failed");
        end
        $display("Test SLT: 100 cycles passed!");


        repeat (100)
        begin
            // SLTU bitwise
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = SLTU;
            #10;
            if(! ((rs2 > rs1) && (result == 1)) )
                $display("Test SLTU: Failed");
            if (! ((rs2 < rs1) && (result == 0)) )
                $display("Test SLTU: Failed");
        end
        $display("Test SLTU: 100 cycles passed!");

        repeat (100)
        begin
            // SEXT bitwise
            rs1 = $urandom % (2**(WIDTH/2));
            rs2 = '0;
            aluop_v = SEXT;
            #10;
            if(result !=  signed_rs1) // Would this work?? check notes
                $display("Test SEXT: Failed");
        end
        $display("Test SEXT: 100 cycles passed!");

        // SEXT manual test cases
        rs1 = 16'b00000000_10101100; //
        #10;
        if(result == 16'b11111111_10101100)
            $display("Test SEXT: Manual test passed");

        rs1 = 16'b00000000_00101100; //
        #10;
        if(result == 16'b00000000_00101100)
            $display("Test SEXT: Manual test passed");

        repeat (100)
        begin
            // ZEXT bitwise
            rs1 = $urandom % (2**(WIDTH/2));
            rs2 = '0;
            aluop_v = ZEXT;
            #10;
            if(result !=  signed_rs1) // Would this work?? check notes
                $display("Test ZEXT: Failed");
        end
        $display("Test ZEXT: 100 cycles passed!");

        repeat (100)
        begin
            // XOR bitwise
            rs1 = $urandom % (2**WIDTH);
            rs2 = $urandom % (2**WIDTH);
            aluop_v = XOR;
            #10;
            if((result != rs1 ^ rs2)) begin
                $display("Test XOR: Failed");
                $display("%d",rs1);
                $display("%d",rs2);
                $display("%d",result);
                display("");
            end
        end
        $display("Test XOR: 100 cycles passed!");

        repeat (100)
        begin
            // NEG bitwise
            rs1 = $urandom % (2**WIDTH);
            rs2 = '0;
            aluop_v = NEG;
            #10;
            if((result != -(rs1))) // Will this work for synthesys? signed values?
                $display("Test NEG: Failed");
        end
        $display("Test NEG: 100 cycles passed!");

        // End simulation
        $finish;
    end

endmodule

/***l
Notes

when rs1 is WIDTH/2, say 8-bits and $signed is used, would it sign extend the rs1 value to required bits when reading and comparing?
*/
