function [Pback ] = BackTransformCalculate( R,T,PN )
%BACKTRANSFORMCALCULATE Summary of this function goes here
%   Detailed explanation goes here
P=[eye(3,3) -T]*ConvHomogen(PN);
Pback=inv(R)*P

end

