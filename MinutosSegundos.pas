{ Escribir un programa que convierta un número dado en segundos, en el equivalente de minutos y segundos. }

program MinutosSegundos;
    
    var segundos, minutos: word;
    
    begin
        writeln('Ingrese los segundos:');
        readln(segundos);
        
        while segundos >= 60 do
            begin
                segundos := segundos - 60;
                minutos  += 1;
            end;
        writeln('El equivalente en minutos y segundos es: ', minutos, ':', segundos, '.');
        
        readln();
    end.