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

conjuntoPacientes = array[1..10] of paciente;
    
{VAR-----------------------------------------------------------------}
    
var

opcion, cima, cima2: word;
pacientes, auxiliar: conjuntoPacientes;



{FUNCTION------------------------------------------------------------}

procedure leer_paciente();
var
    x: word;
    sonIguales: boolean;
begin
    writeln('Ingrese número de historia clínica:');
    readln(pacientes[cima].nroHist);
    writeln('Ingrese apellido del paciente:');
    readln(pacientes[cima].apellido);
    writeln('Ingrese fecha de visita:');
    writeln('Ingrese día (formato DD):');
    readln(pacientes[cima].fechaVisita.dd);
    writeln('Ingrese mes (formato MM):');
    readln(pacientes[cima].fechaVisita.mm);
    writeln('Ingrese año (formato AA):');
    readln(pacientes[cima].fechaVisita.aa);
    writeln('Indique si es privado:');
    readln(pacientes[cima].privado);
    writeln('Indique si tiene alergias:');
    readln(pacientes[cima].alergias);
    writeln('Observaciones:');
    readln(pacientes[cima].observaciones);
    
    
    sonIguales := false;
    
    for x := 1 to cima2 do 
    begin
        if pacientes[cima].nroHist = auxiliar[x].nroHist then
        begin
            auxiliar[x].observaciones := pacientes[cima].observaciones;
            sonIguales := true;
        end;
    end;
    
    if sonIguales = false then
    begin
        auxiliar[cima2].nroHist := pacientes[cima].nroHist;
        auxiliar[cima2].apellido := pacientes[cima].apellido;
        auxiliar[cima2].privado := pacientes[cima].privado;
        auxiliar[cima2].alergias := pacientes[cima].alergias;
        auxiliar[cima2].observaciones := pacientes[cima].observaciones;
        cima2 += 1;
    end;
    
end;

procedure mostrar_tabla(t: conjuntoPacientes);
var
    x: word;
begin
    if cima = 1 then
    begin
        writeln();
        writeln('No hay pacientes que mostrar. Cargue al menos uno.');
    end
    else
    begin
        writeln();
        writeln('-------------------------------------------------------------------------------');
        writeln('NroHist  |  Apellido  |  FechaVisita  |  Privado  |  Alergias  |  Observaciones');
        writeln('-------------------------------------------------------------------------------');
        writeln();
        for x := 1 to cima - 1 do
        begin
            write(pacientes[x].nroHist, '         ', pacientes[x].apellido, '         ', pacientes[x].fechaVisita.dd, '/', pacientes[x].fechaVisita.mm, '/',pacientes[x].fechaVisita.aa, '        ', pacientes[x].privado, '          ', pacientes[x].alergias, '           ', pacientes[x].observaciones);
            writeln();
        end;
    end;
    writeln();
    
    
end;

procedure mostrarObs();
var 
    x, opcion: word;
begin
    writeln();
    writeln('Seleccione un paciente según número:');
    writeln();
    writeln('Nro - Apellido');
    for x := 1 to cima2 - 1 do
    begin
        writeln();
        write(x, '   - ', auxiliar[x].apellido);
    end;
    writeln();
    readln(opcion);
    writeln('Observaciones de la última visita de ', auxiliar[x].apellido, ': ', auxiliar[opcion].observaciones);
    writeln();
end;

procedure listarAlergias();
var
    x: word;
begin
    writeln();
    writeln('Pacientes con alergias:');
    for x := 1 to cima2 - 1 do
    begin
        if auxiliar[x].alergias = 'si' then
            writeln(auxiliar[x].apellido);
    end;
    writeln();
end;

procedure listarPrivados();
var
    x: word;
begin
    writeln();
    writeln('Pacientes privados:');
    for x := 1 to cima2 - 1 do
    begin
        if auxiliar[x].privado = 'si' then
            writeln(auxiliar[x].apellido);
    end;
    writeln();
end;

    
{MAIN----------------------------------------------------------------}

begin
    
    cima  := 1;
    cima2 := 1;
    repeat 
        writeln();
        writeln('-------------------------------------------------------------------- ');
        writeln('----------------------- Sistema de Pacientes ----------------------- ');
        writeln('-------------------------------------------------------------------- ');
        writeln('1 -      Introducir nuevo registro');
        writeln('2 -      Mostrar todos los registros');
        writeln('3 -      Ver observaciones de última visita');
        writeln('4 -      Listar pacientes con alergias');
        writeln('5 -      Listar pacientes privados');
        writeln('0 -      Salir');
        writeln();
        readln(opcion);
        
        case opcion of
        1: 
        begin
            leer_paciente();
            cima += 1;
        end;
        2: 
        begin
            mostrar_tabla(pacientes);
        end;
        3: 
        begin
            mostrarObs();
        end;
        4: 
        begin
            listarAlergias();
        end;
        5: 
        begin
            listarPrivados();
        end;
        
        end; {Fin del case of}
        
         
    until opcion = 0;
    
   
    
end.
