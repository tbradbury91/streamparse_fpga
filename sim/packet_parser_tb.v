`timescale 1ns/1ps

module packet_stream_tb;

    // testbench signals
    reg clk;
    reg rst;
    reg [7:0] packet_in;
    wire [15:0] parsed_data;
    wire packet_valid;

    // instantiate the DUT (Device Under Test)
    packet_parser uut (
        .clk(clk),
        .rst(rst),
        .packet_in(packet_in),
        .parsed_data(parsed_data),
        .packet_valid(packet_valid)
    );

    // clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // initialise
        clk = 0;
        rst = 1;
        packet_in = 8'h00;

        // hold reset
        #10;
        rst = 0;

        // apply packets
        #10 packet_in = 8'hA5; // test packet
        #10 packet_in = 8'h3C; // test packet
        #10 packet_in = 8'hFF; // test packet
        #10;

        $finish;
    end

    // monitor output
    initial begin
        $monitor("Time: %0t | packet_in: %h | parsed_data: %h | valid: %b",
                 $time, packet_in, parsed_data, packet_valid);
    end

endmodule