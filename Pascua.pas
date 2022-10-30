{ La fecha del domingo de pascua corresponde al primer domingo después     }
{ de la primera luna llena que sigue el equinocio de primavera. Los        }
{ cálculos que permiten conocer esta fecha son:                            }
{ A = annio MOD 19                                                         }
{ B = annio MOD 4                                                          }
{ C = annio MOD 7                                                          }
{ D = (19 * A + 24) MOD 30                                                 }
{ E = (2 * B + 4 * C + 6 * D + 5) MOD 7                                    }
{ N = (22 + D + E)                                                         }
{ Donde N indica el nro. del día del mes de Marzo (o abril si N > 31)      }
{ correspondiente al Domingo de pascua. Realizar un programa que determine }
{ esta fecha para los años comprendidos entre 2023 y 2033.                 }


program pascua;
   
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
        end
        else
        begin
            WriteLn('La pascua es el ', N, ' de Marzo de ', annio);
        end;
    end;
    readln();
end.