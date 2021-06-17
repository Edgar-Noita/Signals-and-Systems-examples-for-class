
%This file can be used to generate a voice with echo

close all
%Recording of the voice using a sample frequency of 8000Hz, 8 bits of
%quantization and 1 chanel
recObj=audiorecorder(8000,8,1);
disp('inicio')
recordblocking(recObj,3); %recorsing for 3 seconds
disp('Fin')
y=getaudiodata(recObj);
%Save the voice as a .wav file
audiowrite('original.wav',y,8000)

%Creation of the vector that adds echo
x=zeros(1,32001); %32001..around 4 seconds
x(1)=1; %First repetition, at 0 seconds
x(16001)=0.5; %Secons repetition, at 2 seconds
z=conv(x,y); %convolution of the two signals
audiowrite('eco.wav',z,8000) %saving the signal with echo as .wav

dom=0:1/8000:7-1/8000; %domain of echo signal.. 3 seconds + 4 seconds
plot(dom,z); 
sound(z,8000) %reproduction of the echo signal

