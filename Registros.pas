{ se desea crear un array de registros con los datos de los estudiantes  }
{ de un determinado colegio. los campos de los registros son: nombre,    }
{ código, sexo, edad, curso, notas de las asignaturas del curso anterior.}
{ a continuación, escribir un programa que lea y escriba este array, así }
{ como en las opciones: ordernar por orden alfabético según nombre,      }
{ calcular la media de cada alumno y visualizar la lista de alumnos por  }
{ curso ordenador alfabéticamente según nombre.                          }


program registros;
    
    { TIPOS PERSONALIZADOS }
    
    type
    
    datos = record
        nombre: string[15];
        apellido: string[15];
        codigo: word;
        genero: string[1];
        edad: word;
        curso: string[1];
        notasAsignatura: record
            asignatura1: word;
            asignatura2: word;
            asignatura3: word;
            asignatura4: word;
        end;
    end;
    
    { VARIABLES }
    
    var
        //alumno: datos;
        alumnos: array[1..10] of datos;
        opcion, numeroAlumno: word;
    
    
    { MAIN }

    begin
        numeroAlumno := 1;
        
        repeat 
            
        writeln();    
        writeln('Estudiantes - Colegio Santa Trinidad');
        writeln();
        writeln('1. Ingresar nuevo alumno');
        writeln('2. Mostrar lista de alumnos');
        writeln('3. Mostrar promedio de cada alumno');
        writeln('4. Lista de alumnos por curso');
        writeln('0. Salir');
        writeln();
        readln(opcion);
        
        case opcion of
            1:
            begin
                if numeroAlumno = 10 then
                    writeln('Lista de alumnos completa')
                else
                    writeln('Ingrese el nombre del alumno ', numeroAlumno);
                    readln(alumnos[numeroAlumno].nombre);
                    writeln('Ingrese el apellido de ', alumnos[numeroAlumno].nombre);
                    readln(alumnos[numeroAlumno].apellido);
                    writeln('Ingrese el código de ', alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido);
                    readln(alumnos[numeroAlumno].codigo);
                    writeln('Ingrese el género de ', alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido, ' (M=Masculino/F=Femenino/B=Binario/I=Indefinido)');
                    readln(alumnos[numeroAlumno].genero);
                    writeln('Ingrese la edad de ', alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido);
                    readln(alumnos[numeroAlumno].edad);
                    writeln('Ingrese el curso de ', alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido, ' (1-Primero/2-Segundo/3-Tercero)');
                    readln(alumnos[numeroAlumno].curso);
                    writeln('Ingrese las notas de las asignaturas del curso anterior de ', alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido);
                    writeln('Ciencias Sociales: ');
                    readln(alumnos[numeroAlumno].notasAsignatura.asignatura1);
                    writeln('Matemáticas: ');
                    readln(alumnos[numeroAlumno].notasAsignatura.asignatura2);
                    writeln('Ciencias Naturales: ');
                    readln(alumnos[numeroAlumno].notasAsignatura.asignatura3);
                    writeln('Arte: ');
                    readln(alumnos[numeroAlumno].notasAsignatura.asignatura4);
                    writeln();
                    writeln(alumnos[numeroAlumno].nombre, ' ', alumnos[numeroAlumno].apellido, ' AGREGADO CON ÉXITO!');
                    numeroAlumno += 1;
                 
            end;
            
            2:
            begin
               writeln();
               writeln('Lista'); 
            end;
            
            
            3:
            begin
               writeln();
               writeln('Promedios'); 
            end;
            
            
            4:
            begin
                writeln();
                writeln('Lista por curso');
            end;
            
            
            
        end;    
        until opcion = 0;
    
    end.