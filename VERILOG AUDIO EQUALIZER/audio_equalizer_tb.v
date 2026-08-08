`timescale 1ns/1ps

module audio_equalizer_tb;

reg clk;
reg reset;

reg signed [15:0] audio_in;

reg [3:0] bass_gain;
reg [3:0] mid_gain;
reg [3:0] treble_gain;

wire signed [15:0] audio_out;

audio_equalizer uut (
    .clk(clk),
    .reset(reset),
    .audio_in(audio_in),
    .bass_gain(bass_gain),
    .mid_gain(mid_gain),
    .treble_gain(treble_gain),
    .audio_out(audio_out)
);

// Clock generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin

    $display("------------------------------------------------");
    $display("          VERILOG AUDIO EQUALIZER");
    $display("------------------------------------------------");
    $display("Time | Audio In | Bass | Mid | Treble | Audio Out");
    $display("------------------------------------------------");

    // Reset
    reset = 1'b1;
    audio_in = 16'sd0;
    bass_gain = 4'd0;
    mid_gain = 4'd0;
    treble_gain = 4'd0;

    #10;

    reset = 1'b0;

    // Test 1
    audio_in = 16'sd100;
    bass_gain = 4'd1;
    mid_gain = 4'd1;
    treble_gain = 4'd2;

    #10;

    $display("%4t | %8d | %4d | %3d | %6d | %9d",
             $time, audio_in, bass_gain, mid_gain,
             treble_gain, audio_out);

    // Test 2
    audio_in = 16'sd200;
    bass_gain = 4'd2;
    mid_gain = 4'd2;
    treble_gain = 4'd4;

    #10;

    $display("%4t | %8d | %4d | %3d | %6d | %9d",
             $time, audio_in, bass_gain, mid_gain,
             treble_gain, audio_out);

    // Test 3
    audio_in = 16'sd300;
    bass_gain = 4'd3;
    mid_gain = 4'd3;
    treble_gain = 4'd6;

    #10;

    $display("%4t | %8d | %4d | %3d | %6d | %9d",
             $time, audio_in, bass_gain, mid_gain,
             treble_gain, audio_out);

    // Test 4
    audio_in = 16'sd400;
    bass_gain = 4'd4;
    mid_gain = 4'd4;
    treble_gain = 4'd8;

    #10;

    $display("%4t | %8d | %4d | %3d | %6d | %9d",
             $time, audio_in, bass_gain, mid_gain,
             treble_gain, audio_out);

    $display("------------------------------------------------");
    $display("Simulation Completed Successfully.");
    $display("------------------------------------------------");

    $finish;

end

endmodule