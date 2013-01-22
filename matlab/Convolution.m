f = [zeros(1,10) ones(1,5) zeros(1,10)];
h = [zeros(1,10) ones(1,5) zeros(1,10)];

lf = length(f);
lh = length(h);
lg = lf+lh-1;
g = zeros(1,lg);

for x = 1:lf+lh-1
    t = 0;
    start = max(1,x+1-lh);
    ende = min(x,lh);
    for y = start:ende
        t = t + f(y)*h(x-y+1);
    end
    g(x) = t;
end
subplot(2,1,1)
stem(g);title('Convolution');grid on;

subplot(2,1,2)
result=real(fftshift(ifft(fft(f).*fft(h))));
stem(result); title('Circular Convolution');grid on;
