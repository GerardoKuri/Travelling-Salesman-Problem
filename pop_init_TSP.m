%Función que recibe dos números pNo y cNo que corresponden al número de
%cromosomas y número de genes en el cromosoma sucesivamente.
%Devuelve la población de cromosomas que consiste en permutaciones de 1 a cNo.
function [poblacion]=pop_init_TSP(cNo,pNo)
poblacion.len=pNo;
for i = 1:pNo
    p=randperm(cNo);
    poblacion.chromosome(i).gene(:)=p;
end
end