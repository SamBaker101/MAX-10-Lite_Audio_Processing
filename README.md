# MAX-10-Lite_Audio_Processing
 Digital audio processing using Max-10 FPGA
 
 In preperation for a future project I wanted to set up an environment to experiment with digital signal processing on FPGA. I am using a DE10-Lite FPGA from Altera with a 24 bit I2S based DAC/ADC Pmod from Diligent.
 
 #Modules
 Audio_Top - Top level module for this project
 Decode - Takes I2S bitstreams as input and outputs audio data
 Encode - Takes audio data and outputs I2S bitstream
 Clipping - Shifts audio sample left by one bit creating distortion
