% Title: Speech Recognition
% Aim: Perform Speech recognition using correlation method.
% Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
% Department: Department of Electronics Engineering
% Mentor: Dr. Nirmal, HOD
% Department: Department of Electronics Engineering
% Date: 01/12/2017

% ***************Program starts here*************************

% Please note: To run this code, type "SpeechRecognition('test.wav')"
% or "SpeechRecognition('test2.wav')" or "SpeechRecognition('Lion.wav')"
% in Command Window. The code will read the content in file, then it will
% compare it with all the loaded samples and after successful recognition
% of the file, it will tell the input recognized file by playing it.
% test.wav stores the audio signal for word "Two"
% test2.wav stores the audio signal for word "Three"
% Lion.wav stores the audio signal for "Roar of a lion".

function SpeechRecognition(input_audio) % function created to read audio file from command window
voice = audioread(input_audio);           % Reading input audio file
x = voice;
x = x';
x = x(1,:);
x = x';

% Loading 1st Sample
y1 = audioread('one.wav');
y1 = y1';
y1 = y1(1,:);
y1 = y1';
z1 = xcorr(x,y1);   % taking correlation of 1st sample and input audio file
m1 = max(z1);
l1 = length(z1);
t1 = -((l1-1)/2):1:((l1-1)/2);
t1 = t1';
subplot(3,2,1);
plot(t1,z1,'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Sample 1 Spectrum Graph");

% Loading 2nd Sample
y2 = audioread('two.wav');
y2 = y2';
y2 = y2(1,:);
y2 = y2';
z2 = xcorr(x,y2);	% taking correlation of 2nd sample and input audio file
m2 = max(z2);
l2 = length(z2);
t2 = -((l2-1)/2):1:((l2-1)/2);
t2 = t2';
subplot(3,2,2);
plot(t2,z2,'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Sample 2 Spectrum Graph");

% Loading 3rd Sample
y3 = audioread('three.wav');
y3 = y3';
y3 = y3(1,:);
y3 = y3';
z3 = xcorr(x,y3);	% taking correlation of 3rd sample and input audio file
m3 = max(z3);
l3 = length(z3);
t3 = -((l3-1)/2):1:((l3-1)/2);
t3 = t3';
subplot(3,2,3);
plot(t3,z3,'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Sample 3 Spectrum Graph");

% Loading 4th Sample
y4 = audioread('four.wav');
y4 = y4';
y4 = y4(1,:);
y4 = y4';
z4 = xcorr(x,y4);	% taking correlation of 4th sample and input audio file
m4 = max(z4);
l4 = length(z4);
t4 = -((l4-1)/2):1:((l4-1)/2);
t4 = t4';
subplot(3,2,4);
plot(t4,z4,'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Sample 4 Spectrum Graph");

% Loading 5th Sample
y5 = audioread('five.wav');
y5 = y5';
y5 = y5(1,:);
y5 = y5';
z5 = xcorr(x,y5);	% taking correlation of 5th sample and input audio file
m5 = max(z5);
l5 = length(z5);
t5 = -((l5-1)/2):1:((l5-1)/2);
t5 = t5';
subplot(3,2,5);
plot(t5,z5,'r');
xlabel("Time [S]");
ylabel("Amplitude [V]");
title("Sample 5 Spectrum Graph");

m6 = 300;
a = [m1 m2 m3 m4 m5 m6];
m = max(a);
h = audioread('InputFileIs.wav');
if m <= m1
    soundsc(h,50000)
    pause(1)
    soundsc(audioread('one.wav'),50000)
elseif m <= m2
    soundsc(h,50000)
    pause(1)
    soundsc(audioread('two.wav'),50000)    
elseif m <= m3
    soundsc(h,50000)
    pause(1)
    soundsc(audioread('three.wav'),50000)
elseif m <= m4
    soundsc(h,50000)
    pause(1)
    soundsc(audioread('four.wav'),50000)
elseif m <= m5
    soundsc(h,50000)
    pause(1)
    soundsc(audioread('five.wav'),50000)
else
    soundsc(audioread('NotMatching.wav'),50000)   
end
% ***************Program ends here***************************
