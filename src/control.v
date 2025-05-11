module control (
    input wire clk,
    input wire rst,
    input wire action_trigger,  // action signal from classifier
    output wire [7:0] control_signal // control signal for further processing
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            control_signal <= 8'b0;
        end else begin
            if (action_trigger) begin
                control_signal <= 8'b11111111;  // trigger control logic
            end else begin
                control_signal <= 8'b0;
            end
        end
    end

endmodule