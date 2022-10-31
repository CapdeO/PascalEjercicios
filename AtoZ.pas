{ Generar e informar todas las combinaciones de tres letras desde la ‘a’ hasta la ‘z’. }

program AtoZ;
    
    var 
        letra: char;
        contador, h, i, j, k, puntero: integer;
        abc: array[1..26] of char;
        combinacion: string[3];
        combinaciones: array[1..20000] of string;
    
    // Jugando un poco con procedimiento  
    procedure cargarLetras;
        
    begin
        i := 1;
        // Tengamos en cuenta que en pascal a la hora de hacer a to z, no se tiene en cuenta la ñ
        // Por lo tanto son 26 letras (entonces el cálculo final es correcto-->17576)
        for letra := 'a' to 'z' do
            begin
                abc[i] := letra; 
                i += 1; 
            end;
            
    end;
        
        
    begin   
        
        puntero := 1;
        cargarLetras();
       
        for k := 1 to 26 do
        begin
            insert(abc[k], combinacion, 1);
            
            for h := 1 to 26 do
            begin
                insert(abc[h], combinacion, 2);
                
                for i := 1 to 26 do
                begin
                    insert(abc[i], combinacion, 3);
                    
                    
                    combinaciones[puntero] := combinacion;
                    puntero += 1;
                    contador += 1;
                end;
                
            end;
            
        end;
        
        for j := 1 to contador do
        begin
            writeln(combinaciones[j]);
             
        end;
        writeln('Las combinaciones posibles son ', contador);
        readln();
        
    end.