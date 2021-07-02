clc;
clear all;
aci1=[0 0 0 ] * pi / 180;
T1=[ 0 0 0  ];
aci2=[ 5 2 2] * pi / 180;
T2=[ 1 1.5 2];

k = [ 532.574 0 318.264;
        0 531.361 228.96;
        0 0 1];

 W=[ 0  -1    0
         1    0    0
         0    0    1];
  Z=[ 0    1   0
        -1  0  0
        0  0  0];

[TxR2, Ra, Ta] =EssentialMatrix(aci2,T2)
[U,S,V]=svd(TxR2);
R1=U*W*V';  %R2=U*W'*V'-0.7340
T=-S(1,1)*U*Z*U'; %T_1=V*W*S*V'
TT1=RTMatrix(aci1,T1);
TT2=RTMatrix(aci2,T2);


   PN=[  1   1   8    1
             4  7   12  1
             3  4  8   1
             2 5  9    1
             2  2  8  1
             4   8   22 1
             4 3  22  1
             5   3   8    1
             5  2  12  1
             3  7  8   1
             7 1  9    1
             9  12  8  1
             12   11  22 1
             7  5  22  1
             5   9   8    1
             14   10   8    1 ]';

     P=[PN(1,:) ;  PN(2,:) ; PN(3,:)];

     Pa1= TT2*PN;
     Pa2 = TT1*PN;

 p1=  ProjectinFunc( TT1, PN )';
 p2= ProjectinFunc( TT2, PN )';



 point1 = p1(:,1:2);
 point2 = p2(:,1:2)

 F = estimateFundamentalMatrix(p1(:,1:2),p2(:,1:2),'Method','RANSAC')
E= k'*F*k;

Fopencv = [0.9092414915142122, 13.26918430034962, -11.92127997599782;
  -14.50025618380732, 1.13981770280261, 6.59410613888767;
  10.42443796654693, -7.474338706047154, 1];

[U,S,V]= svd(Fopencv)

W = [0 -1 0;1 0 0;0 0 1];
Z = [0 1 0; -1 0 0; 0 0 0 ];

Rtext = U*S*V;
Ttext = U(:,3);


R1 = U*W*V'
R2 = U*W'*V';
R3 = -U*W*V';
R4 = -U*W'*V';


T1 = U*Z*U';
T2 = -U*Z*U';
