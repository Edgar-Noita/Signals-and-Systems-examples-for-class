
%This function can be used to explain the dailing tones
function my_dial2(number)

%creation of the coding frequencies for the numbers
tonesy=[1209,1326,1477]; 
tonesx=[697,770,852,941];
number_el=num2str(number)-'0';
for i=1:length(number_el)
    
    if (number_el(i)~=0)
        %choosig the frequencies according to the number
        delta=0.0001;
        fm=1/delta;
        fil=floor((number_el(i)-1)/3)+1;
        col=mod(number_el(i)-1,3)+1;
    else
        fil=4;
        col=2;
    end

t=0:delta:0.5;
y1=sin(2*pi*t*tonesx(fil));
y2=sin(2*pi*t*tonesy(col));
y3=y1+y2; %summation of the two sines

sound(y3,fm) %playing the sound for each number
pause(0.7)
end