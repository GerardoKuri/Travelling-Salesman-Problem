%Esta función recibe una población en orden de emparejamiento y regresa una
%población con el doble de pobladores en la cual la segunda mitad se
%refiere a hijos obtenidos por el método Ordered Crossover
function [P]=Ox(P)
Plen=size(P.chromosome(:),1);
len=size(P.chromosome(1).gene(:),1);
xPoint=randi([1,round(len/2)]);
xPoint2=xPoint+round(len/3);
for i = 1:2:Plen
     P.chromosome(i+Plen).gene(1:xPoint)=0;
     P.chromosome(i+Plen).gene(xPoint+1:xPoint2)=P.chromosome(i).gene(xPoint+1:xPoint2);
     P.chromosome(i+Plen).gene(xPoint2+1:len)=0;
     P.chromosome(i+1+Plen).gene(1:xPoint)=0;
     P.chromosome(i+1+Plen).gene(xPoint+1:xPoint2)=P.chromosome(i+1).gene(xPoint+1:xPoint2);
     P.chromosome(i+1+Plen).gene(xPoint2+1:len)=0;
     j=1;
     posAct=0;
    while j<=18
        k=1;
        while k<=18
            if  P.chromosome(i+1+Plen).gene(k)==P.chromosome(i).gene(j)
                j=j+1;
                break;
            else 
                k=k+1;
                if k==18
                    if posAct==xPoint
                        posAct=posAct+6;
                    end
                    
                    posAct=posAct+1;
                    P.chromosome(i+1+Plen).gene(posAct)=P.chromosome(i).gene(j);
                    if posAct==19
                        j=19;
                        break;
                    end
                end
            end    
        end
    end
        j=1;
        posAct=0;
    while j<=18
        k=1;
        while k<=18
            if  P.chromosome(i+Plen).gene(k)==P.chromosome(i+1).gene(j)
                j=j+1;
                break;
            else 
                k=k+1;
                if k==18
                    if posAct==xPoint
                        posAct=posAct+6;
                    end
                    posAct=posAct+1;
                    P.chromosome(i+Plen).gene(posAct)=P.chromosome(i+1).gene(j);
                    if posAct==19
                        j=19;
                        break;
                    end
                end
            end    
        end    
    end
end
end
