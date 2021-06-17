%This routine analizes the effect of increasing and
%decreasing the number of points used to calculate a FFT
%The number of points must be at least the number of samples 
%of the signal

clear
close all
N=[5,10,500,1000]; %Number of points 
for i=1:length(N)
    L=10; %samples of the signal. We assume a rectangular signal

    x=ones(1,L); %Creation of the window
    
    Fou=fftshift(fft(x,N(i))); %calculation of the FFT
    Fou_M{i}=Fou;
    %Creation of the domain. The separation between samples ins 2pi/N
    %The domain extends from -pi to pi-2pi/N
    delta_f=(2*pi)/N(i); 
    dom=-pi:delta_f:pi-delta_f;
    subplot(2,2,i)
    plot(dom, (abs(Fou).^2),'Linewidth',2);
    title(strcat('N= ',num2str(N(i))))
    xlim([min(dom),max(dom)])
end
%Recovery of x using the inverse FFT.
%Notice that there is aliasing only for N=5
figure
for i=1:length(N)
    Fou=Fou_M{i};
    x=(ifft(Fou));
    x=abs(x);
    dom=0:length(x)-1;
    subplot(2,2,i)
    plot(dom,x)
    title(strcat('N= ',num2str(N(i))))
    xlim([0,9])
end
    