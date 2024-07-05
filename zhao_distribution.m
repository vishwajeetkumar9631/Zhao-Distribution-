clc;
clear all;
close all;
% sig=fmlin(128,0.1,0.4); 
% % t=0:0.001:0.1;
% % sig=[cos(2*pi*250*t) cos(2*pi*50*t)]';
% % Y=fft(sig);
% % plot(abs(Y));
% % plot(sig)
% % plot(abs(sig))
%  
g=tftb_window(31,'Kaiser'); 
h=tftb_window(63,'Kaiser'); 
% tfrmhs(sig,1:64,64,g,h,1);
var1=load('D:\ASU\Vowels\Vowels\sub_4b_ch80_v_eog_removed_256Hz.mat');
CA=[];
Fs=256; 
 
for ij=1:100
BA=[];
AB=var1.eeg_data_wrt_task_rep_no_eog_256Hz_last_beep{3,ij};
for i1 = 1:64
if ((i1~=1)&&(i1~=10)&&(i1~=33)&&(i1~=64))
sig1=AB(i1,:)';
% signalLength=length(sig);
% sig1=exp(j*2.0*pi*sig);
% g=tftb_window(21,'Kaiser'); 
% h=tftb_window(63,'Kaiser'); 
[tfr,t,f]=dftfilt(sig1,1:length(sig1),128,g,h,1);
% tfrmhs(sig1,1:length(sig1),128,g,h,1);
% fb = cwtfilterbank('SignalLength',signalLength,'VoicesPerOctave',12);
% cfs = abs(fb.wt(sig));
im = ind2rgb(im2uint8(rescale(tfr)),jet(256));
% [~, fileNameWithoutExtension, ~] = fileparts(files(ii).name);
imFileName=strcat('D:\ASU\eeg_images\word3\','Trail',int2str(ij),'_',int2str(i1),'.jpg');
% imwrite(imresize(im,[256 256]),imFileName)
% imshow(imresize(im,[256 256]))
imwrite(im, imFileName);
imshow(im)
end
end
end    
%    
% end
%        g=tftb_window(21,'Kaiser'); 
% 	 h=tftb_window(63,'Kaiser'); tfrmhs(sig,length(sig),64,g,h,1);
% end