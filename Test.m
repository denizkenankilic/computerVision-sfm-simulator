clc;
clear all; 
aci1=[0 0 0 ] * pi / 180;
T1=[ 0 0 0  ];                    %Kamera Baþlangýç Noktasý (0,0,0,0,0,0)
aci2=[ 5 10 -5] * pi / 180;
T2=[ 1 2 1.5];                      %Kameranýn hareket ettiði sonraki nokta
aci3=[ 5 10 -5] * pi / 180;
T3=[ 1 2 1.5];                    %Kameranýn hareket ettiði sonraki nokta
aci4=[ 10 10 -5] * pi / 180; 
T4=[ 1 2 1.5];                    %Kameranýn hareket ettiði sonraki nokta
k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];

   PN=[  1   1   8  ;  4  7   12 ;  3  4  8 
       2  5  9  ;  2  2  8  ;  4   8   22 
       4 3  22  ; 5   3  8  ;  5  2  12 
       3  7  8  ; 7  1  9   ;  9  12  8 
      12 11 22  ; 7  5  22  ; 5   9   8 
      14   10   8  ]';

[PN1 p1 R1]=GetTransform(aci1,T1,PN);
[PN2 p2 R2]=GetTransform(aci2,T2,PN1);
[PN3 p3 R3]=GetTransform(aci3,T3,PN2);
[PN4 p4 R4]=GetTransform(aci4,T4,PN3); 


R=R2; T=T2';                %baþlangýç sonrasý hareket noktasýndaki R, T
R=R3*R; T=R3*T+T3';         %sonraki R, T 
R=R4*R; T=R4*T+T4';         %sonraki R, T 

TransFormPointCalculate( R,T,PN ) %PN=(R*PN);%P=[eye(3,3) T]*ConvHomogen(PN)
PN4

BackTransformCalculate( R,T,PN4 )