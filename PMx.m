%Esta función recibe una población en orden de emparejamiento y regresa una
%población con el doble de pobladores en la cual la segunda mitad se
%refiere a hijos obtenidos por el método Partially Mapped Crossover
function [P]=PMx(P)
Plen=size(P.chromosome(:),1);
len=size(P.chromosome(1).gene(:),1);
xPoint=randi([1,round(2*len/3)]);
xPoint2=xPoint+round(len/3);
for i = 1:2:Plen
     f=0;
     P.chromosome(i+Plen).gene(1:xPoint)=0;
     P.chromosome(i+1+Plen).gene(xPoint+1:xPoint2)=P.chromosome(i).gene(xPoint+1:xPoint2);
     P.chromosome(i+Plen).gene(xPoint2+1:len)=0;
     P.chromosome(i+1+Plen).gene(1:xPoint)=0;
     P.chromosome(i+Plen).gene(xPoint+1:xPoint2)=P.chromosome(i+1).gene(xPoint+1:xPoint2);
     P.chromosome(i+1+Plen).gene(xPoint2+1:len)=0;
     Mat=[P.chromosome(i+1+Plen).gene(xPoint+1:xPoint2);P.chromosome(i+Plen).gene(xPoint+1:xPoint2)];
     j=1;

    while j<=len
        if f==0
            var=P.chromosome(i).gene(j);
        else 
            f=0;
        end
        if P.chromosome(i+Plen).gene(:) ~= var
            P.chromosome(i+Plen).gene(j)=var;
        else
            for k=1:round(len/3)
                Mat(2,:);
                if Mat(2,k)==var & f==0
                    var=P.chromosome(i+1+Plen).gene(xPoint+k);
                    f=1;
                    j=j-1;
                    break;
                elseif Mat(1,k)==var & f==1
                    var=P.chromosome(i+Plen).gene(xPoint+k);
                end
            end
        end
        if j == xPoint
            j=xPoint2;
        end
        j=j+1;
    end
    f=0;
    j=1;
    while j<=len
        if f==0
            var=P.chromosome(i+1).gene(j);
        else 
            f=0;
        end
        if P.chromosome(i+1+Plen).gene(:) ~= var
            P.chromosome(i+1+Plen).gene(j)=var;
        else
            for k=1:round(len/3)
                Mat(2,:);
                if Mat(1,k)==var & f==0
                    var=P.chromosome(i+Plen).gene(xPoint+k);
                    f=1;
                    j=j-1;
                    break;
                elseif Mat(2,k)==var & f==1
                    var=P.chromosome(i+1+Plen).gene(xPoint+k);
                end
            end
        end
        if j == xPoint
            j=xPoint2;
        end
        j=j+1;
    end
end
end
