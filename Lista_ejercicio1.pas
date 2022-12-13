{ Dada una lista de enteros, diseñar un procedimiento que }
{ imprima la suma y el promedio de sus elementos.         }

program ListaSumaPromedio;
    
{TIPOS PERSONALIZADOS---------------------------}

type
lista = record
        elemento_lista: array[0..15] of word;
        ultimo: word;
    end;
    

{VARIABLES--------------------------------------}

var
dato, x: word;
listaA: lista;


{FUNCIONES--------------------------------------}

procedure imprimirSumaPromedio(q: lista);
var
    suma, x: word;
    promedio: single;
begin
    suma     := 0;
    promedio := 0;
    for x := 1 to q.ultimo  do
    begin
        suma := suma + q.elemento_lista[x];
    end;
    promedio := suma / (q.ultimo - 1);
    writeln('La suma de los elementos de la lista es ', suma);
    writeln('El promedio de los elementos de la lista es ', promedio:8:1);
end;

{MAIN-------------------------------------------}

begin
    repeat 
        if listaA.ultimo > 0 then
        begin
            writeln();
            writeln('LISTA -- Cantidad de elementos:', listaA.ultimo);
            writeln('------------------------------------------------');
            for x := 1 to listaA.ultimo do
            begin
                write(listaA.elemento_lista[x], ' - ');
            end;
            
        end;
        writeln();
        writeln('Ingrese un entero o 0 para terminar:');
        readln(dato);
        if listaA.ultimo < 15 then
        begin
            listaA.ultimo += 1;
            listaA.elemento_lista[listaA.ultimo] := dato;
        end;
        
        
        
    until dato= 0;
    imprimirSumaPromedio(listaA);
    readln();
     
end.