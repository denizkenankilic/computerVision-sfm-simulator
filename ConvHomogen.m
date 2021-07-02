function [ P ] = ConvHomogen( PN1 )
%CONVHOMOGEN Summary of this function goes here
%   Detailed explanation goes here

a=size(PN1);
P=[PN1'  ones(a(2),1)]';
end

