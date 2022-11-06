{ se desea crear un array de registros con los datos de los estudiantes  }
{ de un determinado colegio. los campos de los registros son: nombre,    }
{ código, sexo, edad, curso, notas de las asignaturas del curso anterior.}
{ a continuación, escribir un programa que lea y escriba este array, así }
{ como en las opciones: ordernar por orden alfabético según nombre,      }
{ calcular la media de cada alumno y visualizar la lista de alumnos por  }
{ curso ordenador alfabéticamente según nombre.                          }


program registros;
    
    { tipos personalizados }
    
    type
    
    datos = record
        nombre: string[15];
        apellido: string[15];
        codigo: word;
        genero: string[1];
        edad: word;
        curso: string[1];
        notasasignatura: record
            asignatura1: word;
            asignatura2: word;
            asignatura3: word;
            asignatura4: word;
        end;
    end;
    
    tabla = array[1..10] of datos;
        
    { variables }
    
    var
        alumno: datos;
        alumnos: tabla;
        opcion, numeroalumno, i: word;
        
    
    { funciones }    
        
    function ordenar(a: tabla): tabla;
        var
            r: word;
            aux: datos;
    begin
        for r := 1 to length(a) do
        begin
            if a[r].nombre > a[r+1].nombre then
            begin
                aux := a[r+1];
                a[r+1] := a[r];
                a[r] := aux;
            end;
        end;
    end;
        
    
    
    { main }

    begin
        numeroalumno := 1;
        
        repeat 
            
        writeln();    
        writeln('>>>>> estudiantes - colegio santa trinidad <<<<<');
        writeln();
        writeln('1. ingresar nuevo alumno');
        writeln('2. mostrar lista de alumnos');
        writeln('3. mostrar promedio de cada alumno');
        writeln('4. lista de alumnos por curso');
        writeln('0. salir');
        writeln();
        readln(opcion);
        
        case opcion of
            1:
            begin
                if numeroalumno = 11 then
                    writeln('lista de alumnos completa')   
                else
                begin
                    writeln('ingrese el nombre del alumno ', numeroalumno);
                    readln(alumnos[numeroalumno].nombre);
                    writeln('ingrese el apellido de ', alumnos[numeroalumno].nombre);
                    readln(alumnos[numeroalumno].apellido);
                    writeln('ingrese el código de ', alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido);
                    readln(alumnos[numeroalumno].codigo);
                    writeln('ingrese el género de ', alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido, ' (m=masculino/f=femenino/b=binario/i=indefinido)');
                    readln(alumnos[numeroalumno].genero);
                    writeln('ingrese la edad de ', alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido);
                    readln(alumnos[numeroalumno].edad);
                    writeln('ingrese el curso de ', alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido, ' (1-primero/2-segundo/3-tercero)');
                    readln(alumnos[numeroalumno].curso);
                    writeln('ingrese las notas de las asignaturas del curso anterior de ', alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido);
                    writeln('ciencias sociales: ');
                    readln(alumnos[numeroalumno].notasasignatura.asignatura1);
                    writeln('matemáticas: ');
                    readln(alumnos[numeroalumno].notasasignatura.asignatura2);
                    writeln('ciencias naturales: ');
                    readln(alumnos[numeroalumno].notasasignatura.asignatura3);
                    writeln('arte: ');
                    readln(alumnos[numeroalumno].notasasignatura.asignatura4);
                    writeln();
                    writeln(alumnos[numeroalumno].nombre, ' ', alumnos[numeroalumno].apellido, ' agregado con éxito!');
                    numeroalumno += 1;
                end;
                    
                 
            end;
            
            2:
            begin
                ordenar(alumnos);
                if numeroalumno = 1 then
                    begin
                        writeln();
                        writeln('no hay alumnos que mostrar.');
                    end
                else
                for i := 1 to (numeroalumno - 1) do
                    begin
                        writeln();
                        writeln('>>>> alumno: ', alumnos[i].nombre,' ', alumnos[i].apellido);
                        writeln('código: ', alumnos[i].codigo, ' - género: ', alumnos[i].genero, ' - edad: ', alumnos[i].edad, ' - curso: ', alumnos[i].curso);
                        writeln();
                        writeln('notas de asignaturas del curso anterior:');
                        writeln('ciencias sociales: ', alumnos[i].notasasignatura.asignatura1);
                        writeln('matemáticas: ', alumnos[i].notasasignatura.asignatura2);
                        writeln('ciencias naturales: ', alumnos[i].notasasignatura.asignatura3);
                        writeln('arte: ', alumnos[i].notasasignatura.asignatura4);
                    end;
                    
                
                
            end;
            
            
            3:
            begin
               writeln();
               writeln('promedios'); 
            end;
            
            
            4:
            begin
                writeln();
                writeln('lista por curso');
            end;
            
            
            
        end;    
        until opcion = 0;
    
    end.