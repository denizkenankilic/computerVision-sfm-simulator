function [ TxR , R, Tx] = EssentialMatrix( aci, T)

Rx=[ 1            0                 0 
        0       cos(aci(1))   -sin(aci(1))
        0      sin(aci(1))      cos(aci(1)) ];
    
  Ry=[ cos(aci(2))            0        sin(aci(2)) 
        0                         1                0  
        - sin(aci(2))        0          cos(aci(2)) ] ;
    
  Rz=[ cos(aci(3))      -sin(aci(3))    0
         sin(aci(3))      cos(aci(3))     0
        0                         0                1] ;
    
    Tx=[ 0           -T(3)           T(2) 
          T(3)          0            -T(1)
          -T(2)        T(1)            0 ];
      
      R=Rx*Ry*Rz;
      TxR=-Tx*R;
end

