module top_module (
    input wire clk,
    input wire rst,
    input wire [7:0] packet_in,  
    output wire action_trigger   
);

    // internal signals
    wire packet_valid;
    wire [15:0] parsed_data;

    // instant packet parser module
    packet_parser pp (
        .clk(clk),
        .rst(rst),
        .packet_in(packet_in),
        .parsed_data(parsed_data),
        .packet_valid(packet_valid)
    );

    // instant classifier module
    classifier clf (
        .clk(clk),
        .rst(rst),
        .data_in(parsed_data),
        .valid(packet_valid),
        .action(action_trigger)
    );

endmodule