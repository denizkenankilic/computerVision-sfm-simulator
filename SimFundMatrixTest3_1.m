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

   PN=[  1   1   8  ;  4  7   12 ;  3  4  8
       2  5  9  ;  2  2  8  ;  4   8   22
       4 3  22  ; 5   3  8  ;  5  2  12
       3  7  8  ; 7  1  9   ;  9  12  8
      12 11 22  ; 7  5  22  ; 5   9   8
      14   10   8  ]';

RT1=RTMatrix(aci1,T1);PN1=RT1*ConvHomogen(PN); %PN1=RT1*PN
RT2=RTMatrix(aci2,T2); PN2=RT2*ConvHomogen(PN1);
RT3=RTMatrix(aci3,T3); PN3=RT3*ConvHomogen(PN2);
RT4=RTMatrix(aci4,T4); PN4=RT4*ConvHomogen(PN3)

p1=ProjectionF(PN1)';
p2=ProjectionF(PN2)';
p3=ProjectionF(PN3)';
p4=ProjectionF(PN4)';

R2=RotationMat(aci2);
R3=RotationMat(aci3);
R4=RotationMat(aci4);

R=R2; T=T2';                %ba�lang�� sonras� hareket noktas�ndaki R, T
R=R3*R; T=R3*T+T3';         %sonraki R, T
R=R4*R; T=R4*T+T4';         %sonraki R, T

TransFormPointCalculate( R,T,PN ) %PN=(R*PN);%P=[eye(3,3) T]*ConvHomogen(PN)
