function [ p ] = ProjectionF( pa )
%PROJECTÝONF Summary of this function goes here
%   Detailed explanation goes here
        a=size(pa);
       
         for i=1:a(2)
             for ii=1:a(1)-1
                 pa(ii,i)=pa(ii,i)/pa(a(1),i);
             end
         end
         pa(a(1),:)=1;
     p=pa;

end

