# MAX-10-Lite_Audio_Processing
 Digital audio processing using Max-10 FPGA
 
 In preperation for a future project I wanted to set up an environment to experiment with digital signal processing on FPGA. I am using a DE10-Lite FPGA from Altera with a 24 bit I2S based DAC/ADC Pmod from Diligent.
 
 Altera DE10-Lite: https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&No=1021
 
 I2S2 PMOD by Diligent: https://digilent.com/reference/pmod/pmodi2s2/reference-manual?redirect=1
 
The DAC/ADC uses a 22.579MHz master clock which is divided by 8 to provide a 2.822MHz serial clock. The I2S interface uses a 32-bit word length and switches between sending a words for the left and right audio channels. This means the sample frequency is 44.099kHz (2822kHz/64).
 
 # Modules 
 
 Audio_Top - Top level module for this project 
 
 Decode - Takes I2S bitstreams as input and outputs audio data 
 
 Encode - Takes audio data and outputs I2S bitstream 
 
 Flip_Flop_Data - Delays output by one sample (22 microseconds) to allow signal time to travel through circuit
 
 Effects - Handles instantiation and datapath for effects modules to simplify top level
 
 Clipping - Shifts audio sample left by one bit creating distortion 
 
 Echo - adds a delayed sample to the current output sample to create an echo
