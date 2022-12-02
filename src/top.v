module option23 (
    input [7:0] io_in,
    output reg [7:0] io_out
);

parameter WORD_COUNT = 20;

wire clk = io_in[0];
wire [6:0] din = io_in[7:1];

reg [2:0] counter;
reg [7 * WORD_COUNT - 1: 0] buffer;

always@(posedge clk) begin
    if(din == 7'b1111111) begin
        if(!buffer[6]) begin
            io_out <= {1'b0, buffer[5:0], 1'b0};
            buffer <= {buffer[6: 0], buffer[7 * WORD_COUNT - 1: 7]};
            counter <= 3'd0;
        end else begin
            if(counter == 3'b111) begin
                buffer <= {buffer[6: 0], buffer[7 * WORD_COUNT - 1: 7]};
                counter <= 3'd0;
            end else begin
                counter <= counter + 1'd1;
            end
            case({buffer[5:0], counter[2:0]})
				9'b000001010: io_out <= 8'b00000110;
				9'b000001011: io_out <= 8'b01011111;
				9'b000001100: io_out <= 8'b00000110;
				9'b000010010: io_out <= 8'b00000111;
				9'b000010101: io_out <= 8'b00000111;
				9'b000011001: io_out <= 8'b00010100;
				9'b000011010: io_out <= 8'b01111111;
				9'b000011011: io_out <= 8'b00010100;
				9'b000011100: io_out <= 8'b00010100;
				9'b000011101: io_out <= 8'b01111111;
				9'b000011110: io_out <= 8'b00010100;
				9'b000101001: io_out <= 8'b01000110;
				9'b000101010: io_out <= 8'b00100110;
				9'b000101011: io_out <= 8'b00010000;
				9'b000101100: io_out <= 8'b00001000;
				9'b000101101: io_out <= 8'b01100100;
				9'b000101110: io_out <= 8'b01100010;
				9'b000111010: io_out <= 8'b00000100;
				9'b000111011: io_out <= 8'b00000011;
				9'b001011001: io_out <= 8'b00001000;
				9'b001011010: io_out <= 8'b00001000;
				9'b001011011: io_out <= 8'b00111110;
				9'b001011100: io_out <= 8'b00001000;
				9'b001011101: io_out <= 8'b00001000;
				9'b001100010: io_out <= 8'b10000000;
				9'b001100011: io_out <= 8'b01100000;
				9'b001101001: io_out <= 8'b00001000;
				9'b001101010: io_out <= 8'b00001000;
				9'b001101011: io_out <= 8'b00001000;
				9'b001101100: io_out <= 8'b00001000;
				9'b001101101: io_out <= 8'b00001000;
				9'b001101110: io_out <= 8'b00001000;
				9'b001110011: io_out <= 8'b01100000;
				9'b001111001: io_out <= 8'b01000000;
				9'b001111010: io_out <= 8'b00100000;
				9'b001111011: io_out <= 8'b00010000;
				9'b001111100: io_out <= 8'b00001000;
				9'b001111101: io_out <= 8'b00000100;
				9'b001111110: io_out <= 8'b00000010;
				9'b010000001: io_out <= 8'b00111110;
				9'b010000010: io_out <= 8'b01100001;
				9'b010000011: io_out <= 8'b01010001;
				9'b010000100: io_out <= 8'b01001001;
				9'b010000101: io_out <= 8'b01000101;
				9'b010000110: io_out <= 8'b00111110;
				9'b010001001: io_out <= 8'b01000100;
				9'b010001010: io_out <= 8'b01000010;
				9'b010001011: io_out <= 8'b01111111;
				9'b010001100: io_out <= 8'b01000000;
				9'b010001101: io_out <= 8'b01000000;
				9'b010010001: io_out <= 8'b01100010;
				9'b010010010: io_out <= 8'b01010001;
				9'b010010011: io_out <= 8'b01010001;
				9'b010010100: io_out <= 8'b01001001;
				9'b010010101: io_out <= 8'b01001001;
				9'b010010110: io_out <= 8'b01100110;
				9'b010011001: io_out <= 8'b00100010;
				9'b010011010: io_out <= 8'b01000001;
				9'b010011011: io_out <= 8'b01001001;
				9'b010011100: io_out <= 8'b01001001;
				9'b010011101: io_out <= 8'b01001001;
				9'b010011110: io_out <= 8'b00110110;
				9'b010100000: io_out <= 8'b00010000;
				9'b010100001: io_out <= 8'b00011000;
				9'b010100010: io_out <= 8'b00010100;
				9'b010100011: io_out <= 8'b01010010;
				9'b010100100: io_out <= 8'b01111111;
				9'b010100101: io_out <= 8'b01010000;
				9'b010100110: io_out <= 8'b00010000;
				9'b010101001: io_out <= 8'b00100111;
				9'b010101010: io_out <= 8'b01000101;
				9'b010101011: io_out <= 8'b01000101;
				9'b010101100: io_out <= 8'b01000101;
				9'b010101101: io_out <= 8'b01000101;
				9'b010101110: io_out <= 8'b00111001;
				9'b010110001: io_out <= 8'b00111100;
				9'b010110010: io_out <= 8'b01001010;
				9'b010110011: io_out <= 8'b01001001;
				9'b010110100: io_out <= 8'b01001001;
				9'b010110101: io_out <= 8'b01001001;
				9'b010110110: io_out <= 8'b00110000;
				9'b010111001: io_out <= 8'b00000011;
				9'b010111010: io_out <= 8'b00000001;
				9'b010111011: io_out <= 8'b01110001;
				9'b010111100: io_out <= 8'b00001001;
				9'b010111101: io_out <= 8'b00000101;
				9'b010111110: io_out <= 8'b00000011;
				9'b011000001: io_out <= 8'b00110110;
				9'b011000010: io_out <= 8'b01001001;
				9'b011000011: io_out <= 8'b01001001;
				9'b011000100: io_out <= 8'b01001001;
				9'b011000101: io_out <= 8'b01001001;
				9'b011000110: io_out <= 8'b00110110;
				9'b011001001: io_out <= 8'b00000110;
				9'b011001010: io_out <= 8'b01001001;
				9'b011001011: io_out <= 8'b01001001;
				9'b011001100: io_out <= 8'b01001001;
				9'b011001101: io_out <= 8'b00101001;
				9'b011001110: io_out <= 8'b00011110;
				9'b011010011: io_out <= 8'b01100110;
				9'b011011010: io_out <= 8'b10000000;
				9'b011011011: io_out <= 8'b01100110;
				9'b011111001: io_out <= 8'b00000010;
				9'b011111010: io_out <= 8'b00000001;
				9'b011111011: io_out <= 8'b00000001;
				9'b011111100: io_out <= 8'b01010001;
				9'b011111101: io_out <= 8'b00001001;
				9'b011111110: io_out <= 8'b00000110;
				9'b100000001: io_out <= 8'b00111110;
				9'b100000010: io_out <= 8'b01000001;
				9'b100000011: io_out <= 8'b01011101;
				9'b100000100: io_out <= 8'b01010101;
				9'b100000101: io_out <= 8'b01010101;
				9'b100000110: io_out <= 8'b00011110;
				9'b100001001: io_out <= 8'b01111100;
				9'b100001010: io_out <= 8'b00010010;
				9'b100001011: io_out <= 8'b00010001;
				9'b100001100: io_out <= 8'b00010001;
				9'b100001101: io_out <= 8'b00010010;
				9'b100001110: io_out <= 8'b01111100;
				9'b100010001: io_out <= 8'b01000001;
				9'b100010010: io_out <= 8'b01111111;
				9'b100010011: io_out <= 8'b01001001;
				9'b100010100: io_out <= 8'b01001001;
				9'b100010101: io_out <= 8'b01001001;
				9'b100010110: io_out <= 8'b00110110;
				9'b100011001: io_out <= 8'b00011100;
				9'b100011010: io_out <= 8'b00100010;
				9'b100011011: io_out <= 8'b01000001;
				9'b100011100: io_out <= 8'b01000001;
				9'b100011101: io_out <= 8'b01000001;
				9'b100011110: io_out <= 8'b00100010;
				9'b100100001: io_out <= 8'b01000001;
				9'b100100010: io_out <= 8'b01111111;
				9'b100100011: io_out <= 8'b01000001;
				9'b100100100: io_out <= 8'b01000001;
				9'b100100101: io_out <= 8'b00100010;
				9'b100100110: io_out <= 8'b00011100;
				9'b100101001: io_out <= 8'b01000001;
				9'b100101010: io_out <= 8'b01111111;
				9'b100101011: io_out <= 8'b01001001;
				9'b100101100: io_out <= 8'b01011101;
				9'b100101101: io_out <= 8'b01000001;
				9'b100101110: io_out <= 8'b01100011;
				9'b100110001: io_out <= 8'b01000001;
				9'b100110010: io_out <= 8'b01111111;
				9'b100110011: io_out <= 8'b01001001;
				9'b100110100: io_out <= 8'b00011101;
				9'b100110101: io_out <= 8'b00000001;
				9'b100110110: io_out <= 8'b00000011;
				9'b100111001: io_out <= 8'b00011100;
				9'b100111010: io_out <= 8'b00100010;
				9'b100111011: io_out <= 8'b01000001;
				9'b100111100: io_out <= 8'b01010001;
				9'b100111101: io_out <= 8'b01010001;
				9'b100111110: io_out <= 8'b01110010;
				9'b101000001: io_out <= 8'b01111111;
				9'b101000010: io_out <= 8'b00001000;
				9'b101000011: io_out <= 8'b00001000;
				9'b101000100: io_out <= 8'b00001000;
				9'b101000101: io_out <= 8'b00001000;
				9'b101000110: io_out <= 8'b01111111;
				9'b101001010: io_out <= 8'b01000001;
				9'b101001011: io_out <= 8'b01111111;
				9'b101001100: io_out <= 8'b01000001;
				9'b101010001: io_out <= 8'b00110000;
				9'b101010010: io_out <= 8'b01000000;
				9'b101010011: io_out <= 8'b01000000;
				9'b101010100: io_out <= 8'b01000001;
				9'b101010101: io_out <= 8'b00111111;
				9'b101010110: io_out <= 8'b00000001;
				9'b101011001: io_out <= 8'b01000001;
				9'b101011010: io_out <= 8'b01111111;
				9'b101011011: io_out <= 8'b00001000;
				9'b101011100: io_out <= 8'b00010100;
				9'b101011101: io_out <= 8'b00100010;
				9'b101011110: io_out <= 8'b01000001;
				9'b101011111: io_out <= 8'b01000000;
				9'b101100001: io_out <= 8'b01000001;
				9'b101100010: io_out <= 8'b01111111;
				9'b101100011: io_out <= 8'b01000001;
				9'b101100100: io_out <= 8'b01000000;
				9'b101100101: io_out <= 8'b01000000;
				9'b101100110: io_out <= 8'b01100000;
				9'b101101001: io_out <= 8'b01111111;
				9'b101101010: io_out <= 8'b00000001;
				9'b101101011: io_out <= 8'b00000010;
				9'b101101100: io_out <= 8'b00000100;
				9'b101101101: io_out <= 8'b00000010;
				9'b101101110: io_out <= 8'b00000001;
				9'b101101111: io_out <= 8'b01111111;
				9'b101110001: io_out <= 8'b01111111;
				9'b101110010: io_out <= 8'b00000001;
				9'b101110011: io_out <= 8'b00000010;
				9'b101110100: io_out <= 8'b00000100;
				9'b101110101: io_out <= 8'b00001000;
				9'b101110110: io_out <= 8'b01111111;
				9'b101111001: io_out <= 8'b00011100;
				9'b101111010: io_out <= 8'b00100010;
				9'b101111011: io_out <= 8'b01000001;
				9'b101111100: io_out <= 8'b01000001;
				9'b101111101: io_out <= 8'b00100010;
				9'b101111110: io_out <= 8'b00011100;
				9'b110000001: io_out <= 8'b01000001;
				9'b110000010: io_out <= 8'b01111111;
				9'b110000011: io_out <= 8'b01001001;
				9'b110000100: io_out <= 8'b00001001;
				9'b110000101: io_out <= 8'b00001001;
				9'b110000110: io_out <= 8'b00000110;
				9'b110001001: io_out <= 8'b00011110;
				9'b110001010: io_out <= 8'b00100001;
				9'b110001011: io_out <= 8'b00100001;
				9'b110001100: io_out <= 8'b00110001;
				9'b110001101: io_out <= 8'b00100001;
				9'b110001110: io_out <= 8'b01011110;
				9'b110001111: io_out <= 8'b01000000;
				9'b110010001: io_out <= 8'b01000001;
				9'b110010010: io_out <= 8'b01111111;
				9'b110010011: io_out <= 8'b01001001;
				9'b110010100: io_out <= 8'b00011001;
				9'b110010101: io_out <= 8'b00101001;
				9'b110010110: io_out <= 8'b01000110;
				9'b110011001: io_out <= 8'b00100110;
				9'b110011010: io_out <= 8'b01001001;
				9'b110011011: io_out <= 8'b01001001;
				9'b110011100: io_out <= 8'b01001001;
				9'b110011101: io_out <= 8'b01001001;
				9'b110011110: io_out <= 8'b00110010;
				9'b110100001: io_out <= 8'b00000011;
				9'b110100010: io_out <= 8'b00000001;
				9'b110100011: io_out <= 8'b01000001;
				9'b110100100: io_out <= 8'b01111111;
				9'b110100101: io_out <= 8'b01000001;
				9'b110100110: io_out <= 8'b00000001;
				9'b110100111: io_out <= 8'b00000011;
				9'b110101001: io_out <= 8'b00111111;
				9'b110101010: io_out <= 8'b01000000;
				9'b110101011: io_out <= 8'b01000000;
				9'b110101100: io_out <= 8'b01000000;
				9'b110101101: io_out <= 8'b01000000;
				9'b110101110: io_out <= 8'b00111111;
				9'b110110001: io_out <= 8'b00001111;
				9'b110110010: io_out <= 8'b00010000;
				9'b110110011: io_out <= 8'b00100000;
				9'b110110100: io_out <= 8'b01000000;
				9'b110110101: io_out <= 8'b00100000;
				9'b110110110: io_out <= 8'b00010000;
				9'b110110111: io_out <= 8'b00001111;
				9'b110111001: io_out <= 8'b00111111;
				9'b110111010: io_out <= 8'b01000000;
				9'b110111011: io_out <= 8'b01000000;
				9'b110111100: io_out <= 8'b00111000;
				9'b110111101: io_out <= 8'b01000000;
				9'b110111110: io_out <= 8'b01000000;
				9'b110111111: io_out <= 8'b00111111;
				9'b111000001: io_out <= 8'b01000001;
				9'b111000010: io_out <= 8'b00100010;
				9'b111000011: io_out <= 8'b00010100;
				9'b111000100: io_out <= 8'b00001000;
				9'b111000101: io_out <= 8'b00010100;
				9'b111000110: io_out <= 8'b00100010;
				9'b111000111: io_out <= 8'b01000001;
				9'b111001001: io_out <= 8'b00000001;
				9'b111001010: io_out <= 8'b00000010;
				9'b111001011: io_out <= 8'b01000100;
				9'b111001100: io_out <= 8'b01111000;
				9'b111001101: io_out <= 8'b01000100;
				9'b111001110: io_out <= 8'b00000010;
				9'b111001111: io_out <= 8'b00000001;
				9'b111010001: io_out <= 8'b01000011;
				9'b111010010: io_out <= 8'b01100001;
				9'b111010011: io_out <= 8'b01010001;
				9'b111010100: io_out <= 8'b01001001;
				9'b111010101: io_out <= 8'b01000101;
				9'b111010110: io_out <= 8'b01000011;
				9'b111010111: io_out <= 8'b01100001;
				default: io_out <= 8'b00000000;            endcase;
        end
    end else begin
        buffer <= {din, buffer[7 * WORD_COUNT - 1: 7]};
        io_out <= 8'd0;
        counter <= 3'd0;
    end
end

endmodule
