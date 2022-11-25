{Estructura de cola estática con sus operaciones básicas}

program Cola_Estatica;
 
{------CONSTANTES------}   
const
    max = 20; {Tamaño máximo de la cola}
  
{------TIPOS PERSONALIZADOS------}     
type
    tipo_elemento = char; {Este tipo se cambia dependiendo el problema}
    
    cola = record
            elemento_cola: array[1..max] of tipo_elemento;
            frente, fondo: 0..max;
        end; 
    
{------VARIABLES------} 
var
    c: cola;
     
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




{------MAIN------}
begin
    
end.