function [ PN,p1,R ] = GetTransform( aci,T,P )
%GETTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
PN=RTMatrix(aci,T)*ConvHomogen(P);  
p1=ProjectionF(PN)';
R=RotationMat(aci);

end

