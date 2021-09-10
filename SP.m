a1=0.5; a2=0.1;
b1=0.5; b2=0.1;
T=2; r=5; d=5;
 
dt = 0.1;
maxt = 30;
n = maxt/dt;
t = 1:n; t(1) = 0;
 
x1 = NaN(1, n); x2 = NaN(1, n);
x1(1) = 2; x2(1) = 1.2;
 
U = @(y, z) (b1*z*y - y - r*z - r*dt*(-a2*z + b2*y*z) + d - (y + r*z - d)/T)/(y*dt);
 
for i = 1:n-1
    x1(i+1)= x1(i) + dt*(U(x1(i),x2(i))*x1(i) - b1*x1(i)*x2(i));
    x2(i+1)= x2(i) + dt*(-a2*x2(i) + b2*x1(i)*x2(i));
    t(i+1) = t(i) + dt;
end
 
 
plot(t, x1)
hold on
plot(t, x2);
