clear

R1 = 1;
Cap = 0.25;
R2 = 2;
L = 0.2;
R3 = 2; %10;
a = 100;
R4 = 0.1;
Ro = 1000;

G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
Go = 1/Ro;

G = zeros(7,7);
C = zeros(7,7);

G(1,1) = G1;
G(1,2) = -G2-G1;
G(1,3) = -G3;
G(2,2) = 1;
G(2,3) = -1;
G(3,3) = G3;
G(3,6) = -1;
G(4,4) = 1;
G(4,6) = -a;
G(5,4) = G4;
G(5,5) = -G4-Go;
G(6,1) = 1;
G(7,1) = -G1;
G(7,2) = G1;
G(7,7) = 1;

C(1,1) = Cap;
C(1,2) = -Cap;
C(2,6) = -L;
C(7,1) = -Cap;
C(7,2) = Cap;

freq = 0;
%freq = 

Vin = [-10:1:10];
Vin = Vin';
Vout = zeros(length(Vin),1);
F = zeros(7,1);
for i = 1:1:length(Vin)
%     Vout = V3
    F(6) = Vin(i);
    V =(G+(1i*freq*C))\F; %F\(G+(1i*freq*C));
    Vout(i,1)= V(6,1);
    
end
figure(1)
plot(Vin,Vout)


freq = linspace(0,100,100);
Vout = zeros(length(freq),1);
for i = 1:1:100
%     Vout = V3
    F(6) = 10;
    V =(G+(1i*2*pi*freq(i)*C))\F; %F\(G+(1i*freq*C));
    Vout(i)= real(V(5));
    
end
figure(2)
plot(2*pi*freq,Vout)

Gain = db(Vout./10);
figure(3)
plot(2*pi*freq,Gain)
