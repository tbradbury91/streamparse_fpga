module packet_parser (
    input wire clk,
    input wire rst,
    input wire [7:0] packet_in,   // 8-bit input  - could represent a byte in a stream
    output reg [15:0] parsed_data, // parsed data -  could be a header or trade info
    output reg packet_valid        // flag to indicate valid packet
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            parsed_data <= 16'b0;
            packet_valid <= 0;
        end else begin
            // simple example of parsing
            parsed_data <= {8'b0, packet_in};  // extend packet for simplicity
            packet_valid <= 1;
        end
    end

endmodule