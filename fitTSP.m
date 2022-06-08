%Función que recibe una población de n cromosomas con una permutación de 18 genes
%y matriz descriptiva de las distancias.
%Devuelve la población ordenada por aptitud, arreglo de aptitudes
%ordenadas y arreglo de probabilidades de cada cromosoma según aptitud (este
%último arreglo solo se utiliza para la selección de ruleta.
function [fit,P,Prob]=fitTSP(P,C_Mat)
C_len=size(C_Mat,1);
len=size(P.chromosome(:),1);
for i=1:len
    P.chromosome(i).distance=0;
    for j=1:C_len-1
        ciudadAct=P.chromosome(i).gene(j);
        ciudadNext=P.chromosome(i).gene(j+1);
        P.chromosome(i).distance=C_Mat(ciudadAct,ciudadNext)+P.chromosome(i).distance;
    end
    P.chromosome(i).distance=C_Mat(P.chromosome(i).gene(18),P.chromosome(i).gene(1))+P.chromosome(i).distance;
end
for i=1:len
    P.chromosome(i).fitness=1/P.chromosome(i).distance;
end
[k,I]=sort([P.chromosome(:).distance]);
P.chromosome(:)=P.chromosome(I);
Max=max([P.chromosome(:).fitness]);
Min=min([P.chromosome(:).fitness]);
delta=Max-Min;
Prob=[];
fit=[];
for i=1:len
   %fit(i)=(P.chromosome(i).fitness-Min)/delta;
   fit(i)=P.chromosome(i).fitness;
end

for i=1:len
   Prob(i)=fit(i)./sum(fit);
end
end