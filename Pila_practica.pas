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
    p, r: pila; 
    opcion, x, elemento: tipo_elemento;
    
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
procedure pasar_elemento(var q, s:pila);
var
    k: tipo_elemento;
begin
    if not esta_vacia(q) then
    begin
       k := q.elemento_pila[q.cima];
       q.cima -= 1;
       apilar(k, s); 
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
    crear_pila(r);
    repeat 
        writeln();
        writeln('Pila A');
        writeln('//------------------------------//');
        write('//');
        
        for x := 1 to p.cima do
        begin
            write(' ');
            write(p.elemento_pila[x]);
            write(' ');
        end;
        write('//');
        writeln();
        writeln('//------------------------------//');
        
        writeln();
        writeln('Pila B');
        writeln('//------------------------------//');
        write('//');
        
        for x := 1 to r.cima do
        begin
            write(' ');
            write(r.elemento_pila[x]);
            write(' ');
        end;
        write('//');
        writeln();
        writeln('//------------------------------//');
        
        writeln();
        writeln('    >> PILA A <<                      >> PILA B <<     ');
        writeln();
        writeln('1- Apilar                  //    8- Apilar         ');
        writeln('2- Desapilar               //    9- Desapilar      ');
        writeln('3- Pila vacía              //    10- Pila vacía    ');
        writeln('4- Pila llena              //    11- Pila llena     ');
        writeln('5- Cantidad de elementos   //    12- Cantidad de elementos');
        writeln('6- Mirar cima              //    13- Mirar cima');
        writeln('7- Eliminar pila           //    14- Eliminar pila');
        writeln('77- Pasar de A a B         //    15- Pasar de B a A');
        writeln('                  0- Salir');
        writeln();
        readln(opcion);
        
        case opcion of
            1: 
            begin
                writeln();
                writeln('Ingrese elemento para A: ');
                readln(elemento);
                apilar(elemento, p);
            end;
            2:
            begin
                writeln();
                desapilar(p);
            end;
            3:
            begin
                writeln();
                writeln('Pila A vacía --> ', esta_vacia(p));
            end;
            4:
            begin
                writeln();
                writeln('Pila A llena --> ', esta_llena(p));
            end;
            5:
            begin
                writeln();
                writeln('La cantidad de elementos de A es: ', p.cima);
            end;
            6:
            begin
                writeln();
                writeln('La cima de A es: ', p.elemento_pila[p.cima]);
            end;
            7:
            begin
                writeln();
                destruir_pila(p);
                writeln('Pila A destruida');
            end;
            77:
            begin
                writeln();
                pasar_elemento(p, r);
            end;
            8:
            begin
                writeln();
                writeln('Ingrese elemento para B: ');
                readln(elemento);
                apilar(elemento, r);
            end;
            9:
            begin
                writeln();
                desapilar(r);
            end;
            10:
            begin
                writeln();
                writeln('Pila B vacía --> ', esta_vacia(r));
            end;
            11:
            begin
                writeln();
                writeln('Pila B llena --> ', esta_llena(r));
            end;
            12:
            begin
                writeln();
                writeln('La cantidad de elementos de B es: ', r.cima);
            end;
            13:
            begin
                writeln();
                writeln('La cima de B es: ', r.elemento_pila[r.cima]);
            end;
            14:
            begin
                writeln();
                destruir_pila(r);
                writeln('Pila B destruida');
            end;
            15:
            begin
                writeln();
                pasar_elemento(r, p);
            end;
            
        end;
        
    until opcion = 0;
end.

