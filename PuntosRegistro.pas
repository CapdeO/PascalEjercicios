{ Leer dos puntos p1 y p2 representados como registro, calcular la longitud del segmento que los une y la pendiente  }
{                                   de la recta que pasa por dichos puntos.                                          }
{                     p1(x1,y1) p2(x2,y2) y la longitud es raiz de (x2-x1)2 + (y2-y1)2                               } 
{                                     pendiente es (y2-y1) / (x2 - x1)                                               }
    
program puntosRegistro;
    
    { TIPOS PERSONALIZADOS }
    
    type
    
    punto = record
        x: integer;
        y: integer;
        end;
    
    { VARIABLES }
    
    var
    
    p1: punto;
    p2: punto;
    longitudCalculada : real;
    pendienteCalculada: real;
    
    { FUNCIONES }
    
    function longitud(a, b, c, d: integer): real;
    begin
        longitud := sqrt( sqr(c-a) + sqr(d-b) );
    end;
    
    function pendiente(a, b, c, d: integer): real;
    begin
        pendiente := (d - b) / (c - a);
    end;
    
    
    { MAIN }
    
    begin
        writeln('Ingrese el valor de X del punto 1: ');
        readln(p1.x);
        writeln('Ingrese el valor de Y del punto 1: ');
        readln(p1.y);
        writeln('Ingrese el valor de X del punto 2: ');
        readln(p2.x);
        writeln('Ingrese el valor de Y del punto 2: ');
        readln(p2.y);
        
        longitudCalculada := longitud(p1.x, p1.y, p2.x, p2.y);
        
        writeln();
        writeln('La longitud del segmento entre los puntos p1(', p1.x, ', ', p1.y, 
        ') y p2(', p2.x, ', ', p2.y,  ') es: ', longitudCalculada:3:1);
        
        pendienteCalculada := pendiente(p1.x, p1.y, p2.x, p2.y);
        writeln('La pendiente de la recta que pasa entre dichos puntos es: ', pendienteCalculada:3:1);
        
        writeln();
        writeln();
        
        
        readln();
    end.