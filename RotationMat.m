function [ R ] = RotationMat( aci )
%ROTATÝONMAT Summary of this function goes here
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
    R=Rx*Ry*Rz;

end

