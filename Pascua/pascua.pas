program pascua;
uses crt;
var
    A, B, C, D, E, N, annio, x: Integer;

begin
    annio += 2022;
    for x := 1 to 11 do
    begin
        annio += 1;
        A := annio mod 19;
        B := annio mod 4;
        C := annio mod 7;
        D := (19 * A + 24) mod 30;
        E := (2 * B + 4 * C + 6 * D + 5) mod 7;
        N := (22 + D + E);
        if N > 31 then
        begin
            N -= 31;
            WriteLn('La pascua es el ', N, ' de Abril de ', annio);
        end;
        else
        begin
            WriteLn('La pascua es el ', N, ' de Marzo de ', annio);
        end;
    end;



end;