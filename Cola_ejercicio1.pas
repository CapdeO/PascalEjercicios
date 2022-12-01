{   La entrega de números de atención para la inscripción de aspirantes a una institución se realiza en el      }
{ horario de 8 a 12 hs. Se estima que a partir de las 7 hs. empiezan a llegar los aspirantes con una frecuencia }
{ promedio de 1 persona por minuto. Para el operativo se asignaron los siguientes empleados:                    }
{ - Dos administrativos para inscripción.                                                                       }
{ - Un portero para la entrega de números.                                                                      }
{ - Un preceptor para la distribución de aspirantes a las oficinas de inscripción.                              }
{ A continuación se detalla el procedimiento de inscripción:                                                    }
{ El aspirante que llega a la entrada del establecimiento se le entrega un número de atención correlativo. El   }
{ aspirante ingresa y es dirigido por un pasillo a la oficina de alumnos. Dentro de la sala de espera de la     }
{ oficina de alumnos se encuentra el preceptor en cual distribuye a los aspirantes a dos oficinas contrapuestas }
{ entre sí. En cada oficina se crea una cola con una capacidad máxima de 10 personas. Cada empleado atiende al  }
{ aspirante para realizar la inscripción. El administrativo “A” realiza una inscripción cada 2 minutos y el     }
{ administrativo “B” cada 3 minutos.                                                                            }
{ Se desea realizar la simulación correspondiente para poder determinar lo siguiente:                           }
{ - Cuantas personas atendió cada empleado.                                                                     }
{ - Hasta que hora duro la inscripción.                                                                         }
{ - Cuanto tiempo demoro para ser atendido en ultimo aspirante en la cola.                                      }

program Cola_ejercicio1;

    
    {------CONSTANTES------}   
const
    max = 10; {Tamaño máximo de la cola}
  
{------TIPOS PERSONALIZADOS------}     
type
    tipo_elemento = word; 
    
    cola = record
            elemento_cola: array[1..max] of tipo_elemento;
            frente, fondo: 0..max;
        end; 
    
{------VARIABLES------} 
var
    adm_A, adm_B, fila: cola;
    nro, asp, minutos, ultimo, cont_A, cont_B, x: tipo_elemento;
     
{------FUNCIONES------} 
procedure crear_cola(var q:cola);
begin
    q.frente := 1;
    q.fondo  := 0; {si es cero está vacía}
end;
{--------------------}
function esta_vacia(q:cola): boolean;
begin
    esta_vacia := q.fondo = 0;
end;
{--------------------}
function esta_llena(q:cola): boolean;
begin
    esta_llena := q.fondo = max;
end;
{--------------------}
function agregar_elemento(e: tipo_elemento; var q:cola): boolean;
begin
    agregar_elemento := false;
    if not esta_llena(q) then
    begin
        q.fondo := q.fondo +1;
        q.elemento_cola[q.fondo] := e;
        agregar_elemento := true;
    end;
end;
{--------------------}
function ver_frente(var e:tipo_elemento; var q:cola): boolean;
begin
    ver_frente := false;
    if not esta_vacia(q) then
    begin
        e          := q.elemento_cola[q.frente];
        ver_frente := true;
    end;
end;
{--------------------}
function eliminar_frente(var q:cola):boolean;
var
    x: integer;
begin
    eliminar_frente := false;
    if not esta_vacia(q) then
    begin
        for x:= 1 to q.fondo do
            q.elemento_cola[x] := q.elemento_cola[x+1];
        q.fondo         := q.fondo - 1;
        eliminar_frente := true;
    end;
end;
{--------------------}
function sacar_elemento(var e:tipo_elemento; var q:cola): boolean;
begin
    sacar_elemento := false;
    if ver_frente(e,q) then
    begin
        eliminar_frente(q);
        sacar_elemento := true;
    end;
end;
{--------------------}
procedure destruir_cola(var q:cola);
begin
    crear_cola(q);
end;


{----------------------}
{FUNCIONES DEL PROBLEMA}
{----------------------}

procedure carga_cola(minutos, frecuencia:word; var nro:word; var q:cola);
var
    x, y:word;
begin
    for x := 1 to minutos do
        for y := 1 to frecuencia do
        begin
            nro := nro + 1;
            agregar_elemento(nro, q);
        end;
end;

{ Minutos sería el tiempo en minutos en que se efectua la carga 
de la fila. Frecuencia sería los elementos que se cargan en
cada minuto (en el ejemplo de la llegada de los aspirantes es
un promedio de uno por minuto). En nro le asignamos un numero a cada
aspirante para ir cargando a la cola. Cola es la cola elegida
para realizar la carga}

{------MAIN------}
begin
    {Creamos las colas de las dos oficinas y la cola general que
    se forma en la entrada del instituto}
    crear_cola(adm_A);
    crear_cola(adm_B);
    crear_cola(fila);
    nro :=  0;
    {Cargamos los aspirantes que llegaron de 7 a 8 en la cola general}
    carga_cola(60, 1, nro, fila);
    {Los madrugadores ya pueden ir haciendo fila en las oficinas}
    {Recordemos que el máximo de la fila era 10}
    for x := 1 to 10 do
    begin
        sacar_elemento(asp, fila);
        agregar_elemento(asp, adm_A);
        sacar_elemento(asp, fila);
        agregar_elemento(asp, adm_B);
    end;
    
    {Este es el instante en donde las oficinas comienzan
    a atender(8 am). El tiempo y los contadores comienzan en cero}
    minutos := 0;
    cont_A  := 0;
    cont_B  := 0;
    
    repeat 
        minutos += 1;
        
        {Mientras sea antes de las 12 siguen llegando aspirantes a hacer fila}
        if minutos <= 240 then
        begin
            carga_cola(1, 1, nro, fila);
            ultimo := minutos;
        end;
        
        {Cada dos minutos el Administrador A atiende un aspirante,
        por lo tanto uno de la fila general se suma a la fila de la
        oficina A}
        if (minutos mod 2) = 0 then 
        begin
            if eliminar_frente(adm_A) then
                cont_A += 1;
            if sacar_elemento(asp, fila) then
                agregar_elemento(asp, adm_A);
        end;
        
        {Lo mismo pero cada tres minutos, para la cola de la oficina B}
        if (minutos mod 3) = 0 then
        begin
            if eliminar_frente(adm_B) then
                cont_B += 1;
            if sacar_elemento(asp, fila) then 
                agregar_elemento(asp, adm_B);
        end;
        
        
    {Los empleados de las oficinas atienden hasta que no queden
    más aspirantes en las colas correspondientes}    
    until esta_vacia(adm_A) and esta_vacia(adm_B);
    
    writeln('El empleado A atendió la cantidad de: ', cont_A);
    writeln('El empleado B atendió la cantidad de: ', cont_B);
    writeln('El operativo terminó a las ', 8 + minutos div 60:2, ':', minutos mod 60:2);
    writeln('El último aspirante espero ', (minutos - ultimo) div 60:2, ':', (minutos - ultimo) mod 60:2);
    readln();
end.