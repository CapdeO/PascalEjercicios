{  Escribir un programa que lea la hora de un día en notación de 24 horas }
{  y la respuesta en notación de 12 horas. Por ejemplo si la entrada es   }
{  de 13:45 la salida será 1:45 pm. El programa pedirá al usuario que     }
{  introduzca exactamente 5 carácteres. Por ejemplo las nueve en punto    }
{  se introduce como 09:00                                                }

program Notacion12hs24hs;
    uses sysutils;
    var hora, primerParte, segundaParte, minutos: string;
    var primerParte2, minutos2: integer;
    
    begin
        writeln('Ingrese una hora en exactamente cinco carácteres (ejemplo 09:00):');
        readln(hora);
        primerParte  := copy(hora,1,2);
        primerParte2 := StrToInt(primerParte);
        segundaParte := copy(hora,3,3);
        minutos      := copy(hora,4,2);
        minutos2     := StrToInt(minutos);
        if (primerParte2 > 12) and (primerParte2 < 25) and (minutos2 < 60) then
            begin
               primerParte2 := primerParte2 - 12;
               writeln('La hora ingresada en notación de 12 horas es ', primerParte2, segundaParte, ' pm');
            end
       else if (primerParte2 < 13) then
               writeln('La hora ingresada en notación de 12 horas es ', hora, ' am')
       else
               writeln('Ingrese la hora correctamente.');
        
        readln();
    end.
   