# Verilog Audio Equalizer

## Overview

This project implements a simple digital Audio Equalizer using Verilog HDL.
The equalizer processes signed audio samples and provides independent
gain control for bass, midrange, and treble frequency bands.

The project demonstrates basic digital signal processing concepts using
Verilog and is intended for FPGA/RTL learning and simulation.

## Features

- Verilog HDL implementation
- Signed digital audio sample processing
- Bass, Midrange, and Treble controls
- Configurable gain for each band
- Testbench verification
- Simulation waveform
- Expected simulation output

## Frequency Bands

| Band | Description |
|------|-------------|
| Bass | Low-frequency audio components |
| Mid | Middle-frequency audio components |
| Treble | High-frequency audio components |

## Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `clk` | 1 | System clock |
| `reset` | 1 | Reset signal |
| `audio_in` | 16 | Signed audio input sample |
| `bass_gain` | 4 | Bass gain control |
| `mid_gain` | 4 | Midrange gain control |
| `treble_gain` | 4 | Treble gain control |

## Output

| Signal | Width | Description |
|--------|-------|-------------|
| `audio_out` | 16 | Processed audio sample |

## Processing

The equalizer applies gain controls to the audio sample:

    audio_out = audio_in × total_gain

For this educational RTL implementation, the three gain controls are
combined to demonstrate adjustable audio amplification.

## Tools Used

- Verilog HDL
- ModelSim / Vivado / Icarus Verilog
- GTKWave

## Project Files

- `audio_equalizer.v` - Audio equalizer RTL design
- `audio_equalizer_tb.v` - Testbench
- `simulation/waveform.png` - Simulation waveform
- `simulation/output.log` - Simulation output

## Simulation

The testbench applies different audio sample values and gain settings
and verifies the corresponding processed output.

