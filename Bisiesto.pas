{ Escribir un programa que determine si un año es bisiesto. Un año es bisiesto si es múltiplo de 4. 
Los años múltiplos de 100 no son bisiestos, salvo si ellos también son múltiplos de 400. } 

program Bisiesto;
    var
        anio: integer;
    begin
        writeln('Ingrese un año:');
        readln(anio);
        if anio mod 4 = 0 then
            if (anio mod 100 = 0) and (anio mod 400 = 0) then
                writeln('El año ', anio, ' es bisiesto.')
            else
                writeln('El año ', anio, ' no es bisiesto.')
        else
            writeln('El año ', anio, ' no es bisiesto.');
        readln();
    end.