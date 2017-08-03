function imgout=butterfilter(img,r0,n);

SAMPFREQ=1000;

if size(img,1)==1
    img=img';
end


simg=size(img);
size_stack=simg(2);
   
%imgout=squeeze(zeros(simg(1),size_stack));
%r=(-(simg(1)/2):simg(1)/2-1)';
 r=(-(simg(1)):simg(1)-1)';
   
%filtmask=exp(-((r)/FILTWIDTH).^2);
filtmask=1./(1+i*(r/r0).^n);

for jj=1:size_stack

imgp=zeros(2*simg(1),1);
%filtmaskp=imgp;
% zero pad
%imgp(fix(simg(1)/2+1)+(-simg(1)/2:(simg(1)-1)/2))=img(:,jj);
% make perioidic
imgp(1:simg(1))=img(:,jj);
imgp(simg(1)+1:2*simg(1))=img(end:-1:1,jj);

%filtmaskp(fix(simg(1)/2+1)+(-simg(1)/2:(simg(1)-1)/2))=filtmask;
%f=(fftshift(fft(fftshift(imgp(:,jj)))));
%rf=(real(fftshift(ifft(fftshift(f.*filtmaskp)))));
f=(fftshift(fft(fftshift(imgp))));
PLOTTEST=0;
if PLOTTEST==1
clf
fpl=f;
fpl(simg(1)-1:simg(1)+1,:)=0;

lfpl=length(fpl);

%plot((-(lfpl/2-1):lfpl/2)/lfpl*SAMPFREQ,abs(fpl));hold on;
%plot((-(lfpl/2-1):lfpl/2)/lfpl*SAMPFREQ,abs(filtmask)/max(abs(filtmask))*max(abs(fpl)),'r');pause

plot((-(lfpl/2-1):lfpl/2),abs(fpl));hold on;
plot((-(lfpl/2-1):lfpl/2),abs(filtmask)/max(abs(filtmask))*max(abs(fpl)),'r');pause

drawnow; 
hold off
end

rf=(real(fftshift(ifft(fftshift(f.*filtmask)))));
imgout(:,jj)=rf;
fprintf('.');
end

imgout=squeeze(imgout(1:simg(1),:));