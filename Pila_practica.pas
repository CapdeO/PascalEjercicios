{Práctica del uso de estructura de pila estática}

program Pila_Estatica;
    
const
    max = 10; {Tamaño máximo de la pila}
    
{TIPOS PERSONALIZADOS-------------------------}
type
    tipo_elemento = word; 
    
    pila = record
            elemento_pila: array[1..max] of tipo_elemento;
            cima: 0..max;
        end;
        
{VARIABLES------------------------------------}
var
    p: pila; 
    opcion: word;
    
{FUNCIONES------------------------------------}
procedure crear_pila(var q:pila);
begin
    q.cima := 0; {Si es cero está vacía}
end;
{----------------------}
function esta_vacia(q:pila):boolean;
begin
    esta_vacia := q.cima = 0;
end;
{----------------------}
function esta_llena(q:pila):boolean;
begin
    esta_llena := q.cima = max;
end;
{----------------------}
function apilar(e: tipo_elemento; var q:pila):boolean;
begin
    apilar := false;
    if not esta_llena(q) then
    begin
        q.cima += 1;
        q.elemento_pila[q.cima] := e;
        apilar := true;
    end;
end;
{----------------------}
function ver_cima(var e: tipo_elemento; var q: pila):boolean;
begin
    ver_cima := false;
    if not esta_vacia(q) then
    begin
        e        := q.elemento_pila[q.cima];
        ver_cima := true;
    end;
end;
{----------------------}
function desapilar(var q:pila):boolean;
begin
    desapilar := false;
    if not esta_vacia(q) then
    begin
        q.cima -= 1;
        desapilar := true;
    end;
end;
{----------------------}
{En el caso que sea necesario sacar el elemento para agregarlo en otro lado}
{Ejemplo de uso: if sacar_elemento(num, pilaB) then 
                    apilar(num, pilaC);                 }
function sacar_elemento(var e:tipo_elemento; var q:pila): boolean;
begin
    sacar_elemento := false;
    if ver_cima(e,q) then
    begin
        desapilar(q);
        sacar_elemento := true;
    end;
end;
{----------------------}
procedure destruir_pila(var q:pila);
begin
    crear_pila(q);
end;

{MAIN------------------------------------------}

begin
    crear_pila(p);
    repeat 
        writeln();
        writeln('PILA');
        writeln('-----------------------------');
        writeln('1- Apilar');
        writeln('2- Desapilar');
        writeln('3- Pila vacía');
        writeln('4- Pila llena');
        writeln('5- Cantidad de elementos');
        writeln('6- Mirar cima');
        writeln('7- Eliminar pila');
        writeln('0- Salir');
        writeln();
        readln(opcion);
        
        case opcion of
            1: 
            begin
                writeln();
            end;
            2:
            begin
                writeln();
            end;
            3:
            begin
                writeln();
            end;
            4:
            begin
                writeln();
            end;
            5:
            begin
                writeln();
            end;
            6:
            begin
                writeln();
            end;
            7:
            begin
                writeln();
            end;
        end;
        
    until opcion = 0;
end.






 