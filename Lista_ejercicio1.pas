{ Dada una lista de enteros, diseñar un procedimiento que }
{ imprima la suma y el promedio de sus elementos.         }

program ListaSumaPromedio;
    
{TIPOS PERSONALIZADOS---------------------------}

type
lista = record
        elemento_lista: array[0..15] of word;
        ultimo, suma, promedio: word;
    end;
    

{VARIABLES--------------------------------------}

var
dato, x: word;
listaA: lista;


{FUNCIONES--------------------------------------}

procedure imprimirSumaPromedio();
begin
    
end;

{MAIN-------------------------------------------}

begin
    repeat 
        if listaA.ultimo > 0 then
        begin
            writeln();
            writeln('Lista');
            writeln('-------------------');
            for x := 1 to listaA.ultimo do
            begin
                write(listaA.elemento_lista[x], ' - ');
            end;
        end;
        writeln();
        writeln('Ingrese un entero o 0 para terminar:');
        readln(dato);
        listaA.ultimo += 1;
        listaA.elemento_lista[listaA.ultimo] := dato;
        
        
    until dato= 0;
end.