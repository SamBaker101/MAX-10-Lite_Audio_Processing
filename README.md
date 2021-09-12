# MAX-10-Lite_Audio_Processing
 Digital audio processing using Max-10 FPGA
 
 In preperation for a future project I wanted to set up an environment to experiment with digital signal processing on FPGA. I am using a DE10-Lite FPGA from Altera with a 24 bit I2S based DAC/ADC Pmod from Diligent.
 
 Note that the DAC and ADC used in this program have 24 bit resolution but use a word length of 32. This means each word transmitted has 8 unused bits (at the MSB end). I have kept a 32 bit resolution in the project to simplify the datapath but only 24 are being used.
 
 # Modules 
 
 Audio_Top - Top level module for this project 
 
 Decode - Takes I2S bitstreams as input and outputs audio data 
 
 Encode - Takes audio data and outputs I2S bitstream 
 
 Clipping - Shifts audio sample left by one bit creating distortion 
