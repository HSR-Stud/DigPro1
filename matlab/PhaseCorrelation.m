I = imread('pout.tif');
colormap('gray');

% Bildausschnitt 1
I1 = I(1:201,1:201);
% Bildauschnitt 2
I2 = I(50:250,30:230);
subplot(2,3,1);
imshow(I1,[0,255]); title('Bildausschnitt 1');

subplot(2,3,2);
imshow(I2,[0,255]); title('Bildausschnitt 2');

f1 = fft2(I1);
subplot(2,3,4);
imshow(log(abs(f1)), []); title('FFT Auschnitt 1');

f2 = fft2(I2);
subplot(2,3,5);
imshow(log(abs(f2)), []); title('FFT Auschnitt 2');

f3 = (f1.*conj(f2))./abs(f1.*conj(f2));
subplot(2,3,6);
imshow(log(abs(f3)), []); title('Phase Correlation');

I3 = ifft2(f3);
subplot(2,3,3);
imshow(I3); title('IFFT von unten: Nur 1 Pixel weiss');