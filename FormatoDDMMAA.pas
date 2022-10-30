{ Dada una fecha en una variable en el formato DDMMAA obtener el día, mes y año correspondiente en 3 variables en formato entero. }

program FormatoDDMMAA;
    uses sysutils;
    var
        fecha, dia, mes, anio: string;
        dia2, mes2, anio2: integer;
    begin
        writeln('Ingrese una fecha en formato DDMMAA:');
        readln(fecha);
        dia   := copy(fecha, 1, 2);
        dia2  := StrToInt(dia);
        mes   := copy(fecha, 3, 2);
        mes2  := StrToInt(mes);
        anio  := copy(fecha, 5, 2);
        anio2 := StrToInt(anio);
        writeln('Día: ', dia2, ' Mes: ', mes2, ' Año: ', anio2);
        readln();
    end.