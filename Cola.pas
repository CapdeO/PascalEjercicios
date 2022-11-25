program Cola_Estatica;
 
{------CONSTANTES------}   
const
    max = 20; {Tamaño máximo de la cola}
  
{------TIPOS PERSONALIZADOS------}     
type
    tipo_elemento = char;
    
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
function ver_frente(e:)


{------MAIN------}
begin
    
end.