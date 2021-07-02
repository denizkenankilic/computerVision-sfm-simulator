clc;
clear all;
aci1=[0 0 0 ] * pi / 180;
T1=[ 0 0 0  ];                    %Kamera Ba�lang�� Noktas� (0,0,0,0,0,0)
aci2=[ 15 20 -10] * pi / 180;
T2=[ 2 4 3];                      %Kameran�n hareket etti�i sonraki nokta
aci3=[ 5 10 -5] * pi / 180;
T3=[ 1 2 1.5];                    %Kameran�n hareket etti�i sonraki nokta
aci4=[ 10 10 -5] * pi / 180;
T4=[ 1 2 1.5];                    %Kameran�n hareket etti�i sonraki nokta
k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];


k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];

 PN=[  1   1   8    1 ;  4  7   12  1 ;  3  4  8   1
       2 5  9   1 ;  2  2  8  1   ;  4   8   22 1
       4 3  22  1 ; 5   3  8  1   ;  5  2  12  1
       3  7  8  1 ; 7  1  9   1   ;  9  12  8  1
      12 11 22 1 ; 7  5  22  1   ; 5   9   8    1
      14   10   8    1 ]';

RT1=RTMatrix(aci1,T1); PN1=RT1*PN;
RT2=RTMatrix(aci2,T2); PN2=RT2*PN;
RT3=RTMatrix(aci2,T2); PN3=RT3*PN;
p1=  ProjectinFunc( RT1, PN )';
p2=  ProjectinFunc( RT2, PN )';
p3=  ProjectinFunc( RT2, PN )';

p1=p1*k'; p2=p2*k'; % iki boyutlu kordinattan Kamera frame'e gecir.
[Xw1 P2]=FindEsentialMatrixGetDepth( p1,p3,k );
P2
RT3

Lam=PN(3,8)/Xw1(3,8) %PN(3,8) daha �nce bulunmu� olan bir Lazer noktas� Z de�erdir.
Xw1=Xw1*Lam          % Bu durumda s�reklili�in oldu�u ve laser noktas�n�n her iki d�zlemde de
                     % g�r�ld��� varsay�l�rsa, bir transformasyon olu�acak
                     % ve derinlik hesaplanacakt�r. 
