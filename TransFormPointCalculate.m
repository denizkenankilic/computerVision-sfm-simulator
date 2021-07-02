function [ P ] = TransFormPointCalculate( R,T,PN )
%TRANSFORMPO�NTCALCULATE Summary of this function goes here
%   Detailed explanation goes here
PN=(R*PN);
P=[eye(3,3) T]*ConvHomogen(PN);

end
