{ Un médico almacena la siguiente información de sus pacientes:     }
{ - Nro historia clínica                                            }
{ - Apellido                                                        }
{ - Fecha de visita                                                 }
{ - Si es o no privado                                              }
{ - Si tiene alergias                                               }
{ - Un campo de observaciones                                       }
{ Se desea un programa con las siguientes opciones:                 }
{ a) Introducir los registros                                       }
{ b) Imprimir en pantalla todos los registros en forma de tabla     }
{ c) Dado un apellido mostrar las observaciones de la última visita }
{ d) Listar a todos los pacientes con alergias                      }
{ e) Listar a todos los pacientes privados                          }

program Registros;
    
{TYPE----------------------------------------------------------------}

type

paciente = record
    nroHist: word;
    apellido, privado, alergias, observaciones: string;
    fechaVisita: record
        dd, mm, aa: word;
        end;
    end;
    
{VAR-----------------------------------------------------------------}
    
var

opcion: word;



    
{MAIN----------------------------------------------------------------}

begin
    
    repeat 
        writeln();
        writeln('-------------------------------------------- ');
        writeln('----------- Sistema de Pacientes ----------- ');
        writeln('-------------------------------------------- ');
        writeln('1 -      Introducir nuevo registro');
        writeln('2 -      Mostrar tabla de pacientes');
        writeln('3 -      Ver observaciones de última visita');
        writeln('4 -      Listar pacientes con alergias');
        writeln('5 -      Listar pacientes privados');
        writeln();
        readln(opcion);
        
        case opcion of
        1: 
        begin
            
        end;
        2: 
        begin
            
        end;
        3: 
        begin
            
        end;
        4: 
        begin
            
        end;
        5: 
        begin
            
        end;
        
        end; {Fin del case of}
        
        
        
        
        
        
        
    until opcion = 0;
    
    
    
    
    
    
    
    
    
    
    
end.