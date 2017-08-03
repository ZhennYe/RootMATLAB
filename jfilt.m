function y = jfilt(x,n,wn)

[A,B] = butter(n,wn);
y = filtfilt(A,B,x);