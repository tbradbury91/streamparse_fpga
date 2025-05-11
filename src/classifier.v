module classifier (
    input wire clk,
    input wire rst,
    input wire [15:0] data_in,    // parsed data
    input wire valid,             // indicates valid packet
    output reg action            // action signal -  such as "trade detected"
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            action <= 0;
        end else if (valid) begin
            // simple classifier - trigger action if data is greater than threshold
            if (data_in > 16'h0F00) begin  // example threshold
                action <= 1;  // action (trade detected)
            end else begin
                action <= 0;
            end
        end
    end

endmodule