{ Calcular e informar el factorial de un numero entero positivo. }

program Factorial;
    
    var
    numero, multip, indicador: longint;
        
    begin
        writeln('Ingrese un número entero positivo:');
        readln(numero);
        multip    := numero;
        indicador := numero;
        
        if numero <= 0 then
            writeln('El número ingresado debe ser positivo.')
        else
            begin
                while numero > 2 do
                    begin
                        numero -= 1;
                        
                        writeln(multip, ' * ', numero);
                        
                        multip := multip * numero;
                        
                        writeln(multip);
              
                    end;
                    writeln('El factorial de ', indicador, ' es ', multip);
            end;
        readln();
    end.