function [ P ] =RTMatrix( aci, T )
%3DPROJECTION Summary of this function goes here
%   Detailed explanation goes here
Rx=[ 1            0                 0 
        0       cos(aci(1))   -sin(aci(1))
        0      sin(aci(1))      cos(aci(1)) ];
    
  Ry=[ cos(aci(2))            0        sin(aci(2)) 
        0                         1                0  
        - sin(aci(2))        0          cos(aci(2)) ] ;
    
  Rz=[ cos(aci(3))      -sin(aci(3))    0
         sin(aci(3))      cos(aci(3))     0
        0                         0                1] ;
    
       Tx=[0   0   0 T(1)
             0   0   0   T(2)
             0   0   1   T(3)];
      
      R=Rx*Ry*Rz;
      P= [R(:,1)  R(:,2) R(:,3) T'];
            

end

