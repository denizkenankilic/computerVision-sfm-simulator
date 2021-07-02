clc;
clear all;
aci1=[0 0 0 ] * pi / 180;
T1=[ 0 0 0  ];                    %Kamera Ba�lang�� Noktas� (0,0,0,0,0,0)
aci2=[ 20 -20 10] * pi / 180;
T2=[ 12 4 3];                      %Kameran�n hareket etti�i sonraki nokta
aci3=[ 5 10 -5] * pi / 180;
T3=[ 1 2 1.5];                    %Kameran�n hareket etti�i sonraki nokta
aci4=[ 10 10 -5] * pi / 180;
T4=[ 1 2 1.5];                    %Kameran�n hareket etti�i sonraki nokta
k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];

W = [0 -1 0;  1 0 0; 0 0 1 ];
Z = [0 1 0 ; -1 0 0; 0 0 0 ];

[TxR2, Ra, Ta] =EssentialMatrix(aci2,T2);
%[U,S,V]=svd(TxR2);
%R1=U*W*V';  %R2=U*W'*V'-0.7340
%T=-S(1,1)*U*Z*U'; %T_1=V*W*S*V'


   PN=[  1   1   8    1 ;  4  7   12  1 ;  3  4  8   1
             2 5  9   1 ;  2  2  8  1   ;  4   8   22 1
             4 3  22  1 ; 5   3  8  1   ;  5  2  12  1
             3  7  8  1 ; 7  1  9   1   ;  9  12  8  1
             12 11 22 1 ; 7  5  22  1   ; 5   9   8    1
             14   10   8    1 ]';

RT1=RTMatrix(aci1,T1);
RT2=RTMatrix(aci2,T2);
RT3=RTMatrix(aci3,T3);
RT4=RTMatrix(aci4,T4);


 p1=  ProjectinFunc( RT1, PN )';
 p2=  ProjectinFunc( RT2, PN )';
 p3=  ProjectinFunc( RT3, PN )';
 p4=  ProjectinFunc( RT4, PN )';

 a=size(PN);

 point1 = [p1(:,1:2) ones(a(2),2)] ;
 point2 = [p2(:,1:2) ones(a(2),2)] ;

F = estimateFundamentalMatrix(p1(:,1:2),p2(:,1:2),'Method','RANSAC');
%E= k'*F*k;
E=F;
P4=get4possibleP(E);
inX = [k*p1(4,:)',  k*p2(4,:)'];
P1 = [eye(3) zeros(3,1)];
P2 = getCorrectCameraMatrix(P4, k, k, inX);
Xw1 = Triangulation(point1',P1, point2',P2);
Xw2 = Triangulation(point1',P1, point2',RT2)
Lam=PN(3,8)/Xw1(3,8) %PN(3,8) daha �nce bulunmu� olan bir Lazer noktas� Z de�erdir.
Xw1=Xw1*Lam          % Bu durumda s�reklili�in oldu�u ve laser noktas�n�n her iki d�zlemde de
                     % g�r�ld��� varsay�l�rsa, bir transformasyon olu�acak
                     % ve derinlik hesaplanacakt�r. 
