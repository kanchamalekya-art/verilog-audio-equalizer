module audio_equalizer (
    input                   clk,
    input                   reset,
    input  signed [15:0]    audio_in,
    input         [3:0]     bass_gain,
    input         [3:0]     mid_gain,
    input         [3:0]     treble_gain,
    output reg signed [15:0] audio_out
);

reg signed [19:0] gain_sum;
reg signed [31:0] processed_audio;

always @(posedge clk or posedge reset) begin

    if (reset) begin
        audio_out <= 16'sd0;
    end

    else begin

        // Combine the three frequency-band gains
        gain_sum = bass_gain + mid_gain + treble_gain;

        // Apply combined gain to input audio sample
        processed_audio = audio_in * gain_sum;

        // Scale the result back to 16-bit range
        audio_out <= processed_audio >>> 2;

    end

end

endmodule