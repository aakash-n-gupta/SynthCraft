`timescale 1ns / 1ns

// Initialize some program data into memory (instr.riscv) elf
// Cross verify contents through input file

module Memory_tb;

    logic clock, aresetn;
    logic rw_en;
    logic [7:0] address_in;
    logic [31:0] data_in;

    logic out_valid;
    logic [31:0] data_out;


    Memory #(.DEPTH(256), .WIDTH(32)) Mem ( .clk_i(clock),
                                .aresetn_i(aresetn),
                                .rw_en_i(rw_en),
                                .addr_i(address_in),
                                .data_i(data_in),

                                // .valid_o(out_valid),
                                .data_o(data_out) );

    always #5 clock = ~clock;

    initial begin
        clock = 0;
        #9;
        aresetn = 0;
        rw_en = 0;
        address_in = '0;
        data_in = '0;
    end

    task read_from_addr(logic[7:0] addr);
        #10;
        rw_en = 0;
        #10;
        address_in = addr;
        $display("Read from Address %d", addr);
        // if (!out_valid)
    endtask

    initial begin
        $dumpfile("output/Memory.vcd");
        $dumpvars(0, Memory_tb);

        #20;
        aresetn = '1;
        // Start putting data into memory
        for (int i = 0; i < 256; i++)
        begin
            data_in = $urandom;
            address_in = (i);
            rw_en = 1;
            $display("Write value %d into address %d",data_in, address_in);
            read_from_addr(i);
            if(data_in != data_out)
                $display("Mem read/write do not match for address %d", i);
        end

        #50;
        $finish;

    end
endmodule
