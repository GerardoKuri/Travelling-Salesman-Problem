%Función que recibe una población no ordenada por aptitud, el nombre del
%tipo de selección que desea realizarse y la matriz descriptiva de distancias. 
%Se ordena la población en caso de ser necesario.
%Devuelve la población con las parejas ordenadas de la siguiente manera: 
%1ra y 2da, 3ra y 4ta y así sucesivamente.
function P=selecTSP(name,P,C_Mat)
Plen=size(P.chromosome(:),1);
switch name
    case 'Rank'
        [F,P,Prob]=fitTSP(P,C_Mat);
    case 'Tournament'
        [F,P,Prob]=fitTSP(P,C_Mat);
        for i = 1:2:Plen
            T.chromosome(i)=P.chromosome(i);
            T.chromosome(i+1)=P.chromosome(Plen-i+1);
        end
        P=T;
    case 'Poli'
        for i = 1:Plen
            r=randi([1,Plen]);
            Poli.chromosome(i)=P.chromosome(r);
        end
        P=Poli;
    case 'Mono'
        for i = 1:Plen-1
            r=randi([1,Plen-i+1]);
            Mono.chromosome(i)=P.chromosome(r);
            P=remove(P,r);
        end
        Mono.chromosome(Plen)=P.chromosome(1);
        P=Mono;
    case'Roulette'
        [F,P,Prob]=fitTSP(P,C_Mat);
        for i = 1:Plen
            n=rouletteWheel(Prob)
            rul.chromosome(i)=P.chromosome(n);
        end
        P=rul;
end
end