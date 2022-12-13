{ Escribir una función que dadas dos listas de enteros, }
{ retorne una nueva lista que resulte de concatenar las }
{ dos listas originales.                                }

program ListaConcatenada;
    
{CONSTANTES-------------------------------------}

const
max = 5;
    
{TIPOS PERSONALIZADOS---------------------------}

type

tipo_elemento = word;

lista = record
        elemento_lista: array[0..max] of tipo_elemento;
        ultimo: word;
    end;
   
listaLarga = record
        elemento_lista: array[0..10] of tipo_elemento;
        ultimo: word;
    end;   
    

{VARIABLES--------------------------------------}

var
dato, x: word;
listaA, listaB: lista;
listaC: listaLarga;


{FUNCIONES--------------------------------------}

function estaVacia(q: lista): boolean;
begin
    estaVacia := q.ultimo = 0;
end;

function estaLlena(q: lista): boolean;
begin
    estaLlena := q.ultimo = max;
end;

function agregarElemento(e: tipo_elemento; var q: lista): boolean;
begin
    q.ultimo += 1;
    q.elemento_lista[q.ultimo] := e;
    agregarElemento := true;
end;

function agregarElementoLarga(e: tipo_elemento; var q: listaLarga): boolean;
begin
    q.ultimo += 1;
    q.elemento_lista[q.ultimo] := e;
    agregarElementoLarga := true;
end;

function concatenarListas(a,b: lista): listaLarga;
var
    listaAux: listaLarga;
    x: word;
begin
    for x := 1 to max do
    begin
        agregarElementoLarga(a.elemento_lista[x], listaAux);
    end;
    
    for x := 1 to max do
    begin
        agregarElementoLarga(b.elemento_lista[x], listaAux);
    end;
    
    concatenarListas := listaAux;
end;

{MAIN-------------------------------------------}

begin
    repeat 
        writeln();
        writeln('Ingrese un entero positivo para Lista A:');
        readln(dato);
        agregarElemento(dato, listaA);
        
        if not estaVacia(listaA) then
        begin
            writeln();
            writeln('Lista A -- Cantidad de elementos:', listaA.ultimo);
            writeln('------------------------------------------------');
            for x := 1 to listaA.ultimo do
                write(listaA.elemento_lista[x], ' - ');
        end;
    until estaLlena(listaA);
    
    repeat 
        writeln();
        writeln('Ingrese un entero positivo para Lista B:');
        readln(dato);
        agregarElemento(dato, listaB);
        
        if not estaVacia(listaB) then
        begin
            writeln();
            writeln('Lista B -- Cantidad de elementos:', listaB.ultimo);
            writeln('------------------------------------------------');
            for x := 1 to listaB.ultimo do
                write(listaB.elemento_lista[x], ' - ');
        end;
    until estaLlena(listaB);
    
    writeln();
    writeln();
    write('Lista A --> ');
    for x := 1 to listaA.ultimo do
        write(listaA.elemento_lista[x], ' - ');
    writeln();
    write('Lista B --> ');
    for x := 1 to listaB.ultimo do
        write(listaB.elemento_lista[x], ' - ');
    writeln();
    listaC := concatenarListas(listaA, listaB);
    write('Lista C --> ');
    for x := 1 to listaC.ultimo do
        write(listaC.elemento_lista[x], ' - ');
    
    readln();
    
end.


