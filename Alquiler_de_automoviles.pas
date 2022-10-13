{  Una empresa de alquiler de automóviles sin conductor               }
{  desea un programa para emitir las facturas de sus clientes,        }
{  teniendo presente los siguientes puntos:                           }                                                   
{  Primero: cantidad fija de 5000 pesos si no se rebasan los 300 km.  }
{  Segundo: distancia recorrida mayor de 300 km                       }
{   - Si distancia > 300 km y <= 1000 km  -->                         }
{      5000 pesos + kilometraje (a razón de 30 pesos sobre kilómetro) }
{   - Si distancia > 1000 km --> 5000 pesos + kilometraje (a razón    }
{      de 30 pesos por kilómetro para distancias comprendidas entre   }
{      300 y 1000) y 20 pesos por kilómetro para distancias mayores a }
{      1000 km                                                        }

program ALquilerDeAutomoviles;
    
    var
        distancia, factura, excedente: longint;
        
    begin
        writeln('Ingrese la distancia recorrida:');
        readln(distancia);
        factura := 5000;
        if (distancia > 300) and (distancia <= 1000) then
            begin
                excedente := distancia - 300;
                excedente := excedente * 30;  
                factura := factura + excedente;
            end    
        else if distancia > 1000 then 
            begin
                factura   := 26000;
                excedente := distancia - 1000;
                excedente := excedente * 20;
                factura   := factura + excedente;
            end; 
        
        
        writeln('El monto a abonar es de ', factura, ' pesos.');  
        readln();
    end.
    
    
    
    
    
    