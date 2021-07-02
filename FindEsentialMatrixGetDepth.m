function [ Xw1, P2 ] = FindEsentialMatrixGetDepth( p1,p2,k )
%FÝNDESTÝMATEMATRÝXGETDEPTH Summary of this function goes here
%   Detailed explanation goes here
p1=p1*inv(k') ; p2=p2*inv(k');
a=size(p1);  point1 = [p1(:,1:2) ones(a(1),2)] ; point2 = [p2(:,1:2) ones(a(1),2)] ;
F = estimateFundamentalMatrix(p1(:,1:2),p2(:,1:2),'Method','RANSAC');
E=F;   
%E= k'*F*k;   
P4=get4possibleP(E); inX = [k*p1(4,:)',  k*p2(4,:)']; 
P1 = [eye(3) zeros(3,1)]; P2 = getCorrectCameraMatrix(P4, k, k, inX);
Xw1 = Triangulation(point1',P1, point2',P2);
end

