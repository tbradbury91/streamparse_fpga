module testbench;

    reg clk;
    reg rst;
    reg [7:0] packet_in;
    wire action_trigger;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .packet_in(packet_in),
        .action_trigger(action_trigger)
    );

    always #5 clk = ~clk;  // 10ns period clock

    initial begin
        clk = 0;
        rst = 0;
        packet_in = 8'b00000000;

        rst = 1;
        #10 rst = 0;

        // test with some packets
        packet_in = 8'h10;  // First packet
        #10 packet_in = 8'h20;  // Second packet
        #10 packet_in = 8'hF0;  // Third packet
        #10 $finish;
    end

    // monitor the outputs
    initial begin
        $monitor("Time: %0t | packet_in: %h | action_trigger: %b", $time, packet_in, action_trigger);
    end

endmodule