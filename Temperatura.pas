{ Una temperatura Celsius puede ser convertida a una temperatura }
{ Fahrenheit de acuerdo a la siguiente fórmula F=(9/5)*C+32.     }

program Temperatura;
    var
        celsius, fahrenheit: real;
        
    begin
        writeln('Ingrese la temperatura en grados Celsius:');
        readln(Celsius);
        fahrenheit := ((9/5)*celsius)+32;
        writeln('La temperatura ingresada en grados Fahrenheit es: ', fahrenheit:8:1);
        readln();
        
        
    end.