`timescale 1ns / 1ns

module FIFO #(parameter int DEPTH = 128) (
    input clock,
    input resetn,
    input wr_en,
    input rd_en,
    input [31:0] data_in,

    output full,
    output empty,
    output logic [31:0] data);

    logic [31:0] fifo [DEPTH];
    // mem [31:0] fifo[DEPTH];
    logic [31:0] data_read_out;

    // Keep track of fifo
    logic [($clog2(DEPTH) - 1):0] rd_ptr;
    logic [($clog2(DEPTH) - 1):0] wr_ptr;
    logic [($clog2(DEPTH) - 1):0] counter;

    // Keep track of counter
    always_ff @(posedge clock)
    begin
        if (!resetn) begin
            // FIFO will be reset, data will not be available
            counter <= '0;
            wr_ptr <= '0;
        end
        else begin
            case ({rd_en, wr_en})
            2'b00: begin
                counter <= counter;
                wr_ptr <= wr_ptr;
            end

            2'b01: begin
                if (!full) begin
                    counter <= counter + 1;
                    wr_ptr <= wr_ptr + 1;
                end
            end

            2'b10: begin
                if(!empty) begin
                    counter <= counter - 1;
                    wr_ptr <= wr_ptr - 1;
                end
            end

            2'b11: begin
                counter <= counter;
                wr_ptr <= wr_ptr;
            end
            endcase
        end
    end



    //  Push data into FIFO @wr_ptr
    always_ff @(posedge clock)
    begin
        if (!full && wr_en) begin
            fifo[wr_ptr] <= data_in;
        end
    end

    // Pop data from FIFO head
    always_ff @(posedge clock)
    begin
        if (!resetn)
            rd_ptr <= '0;

        rd_ptr <= '0;
        data_read_out <= '0;
        if (!empty && rd_en) begin

            data_read_out <= fifo[rd_ptr];

            // need to test this in synthesis,
            // Commenting out the line below does not affect the fuctionality of the design,
            // but if the read is implicitly not from the HEAD, is it really a fifo?
            // I suspect, when the data is not moved up the fifo, a decoder will be needed
            // which will access the fifo as a memory

            fifo[rd_ptr] <= fifo[rd_ptr + 1];
            rd_ptr <= rd_ptr + 1;


            // To get an actual fifo, for loop should be used:
        //     for (int i = 0; i < DEPTH; i++) begin
        //         fifo[i] <= fifo[i+1];
        //     end
        //     data_read_out <= fifo[0];
        end
    end

    // if wr_ptr = 1024, fifo full, if 0, fifo empty
    assign full     = (counter == '1);
    assign empty    = (counter == '0);

    assign data = rd_en ? data_read_out: 'Z;

endmodule
