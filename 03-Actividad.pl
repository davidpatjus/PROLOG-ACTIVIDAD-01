% Representación de conexiones y costos
conectado(vancouver, edmonton, 16).
conectado(vancouver, calgary, 13).
conectado(edmonton, saskatoon, 12).
conectado(saskatoon, winnipeg, 20).
conectado(saskatoon, calgary, 9).
conectado(calgary, edmonton, 4).
conectado(calgary, regina, 14).
conectado(regina, winnipeg, 4).
conectado(regina, saskatoon, 7).

% Consulta para verificar si existe una conexión directa
existe_conexion(CiudadX, CiudadY) :-
    conectado(CiudadX, CiudadY, _);
    conectado(CiudadY, CiudadX, _).

% Consulta para obtener conexiones directas desde un nodo
conexiones(Nodo) :- existe_conexion(Nodo, _).

% Obtener el costo de una conexión directa
costo(CiudadX, CiudadY, Costo) :-
    conectado(CiudadX, CiudadY, Costo).
costo(CiudadX, CiudadY, Costo) :-
    conectado(CiudadY, CiudadX, Costo).

% --------------------------
% Costo de ruta directa o con un nodo intermedio
% --------------------------

% Costo directo entre dos ciudades (sin intermediarios)
costo_directo(CiudadA, CiudadB, Costo) :-
    costo(CiudadA, CiudadB, Costo).

% Costo de una ruta con un solo nodo intermedio
costo_un_intermedio(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),  % Ciudad intermedia Y
    costo(CiudadA, CiudadY, CostoA_Y),
    existe_conexion(CiudadY, CiudadB),  % Ciudad final B
    costo(CiudadY, CiudadB, CostoY_B),
    CostoTotal is CostoA_Y + CostoY_B.

% --------------------------
% Costo de ruta recursiva (con multiples intermediarios)
% --------------------------

% Costo de la ruta recursiva entre dos ciudades
costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    costo_directo(CiudadA, CiudadB, CostoTotal).  % Caso base: conexión directa

% Caso recursivo: CiudadA -> CiudadIntermedia -> CiudadB
costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),  % Encuentra una ciudad intermedia
    CiudadY \= CiudadB,                 % La ciudad intermedia no es la de destino
    costo(CiudadA, CiudadY, CostoA_Y),  % Costo hasta la ciudad intermedia
    costo_ruta_recursiva(CiudadY, CiudadB, CostoY_B),  % Llama recursivamente hasta CiudadB
    CostoTotal is CostoA_Y + CostoY_B.  % Suma los costos

% ------------------------------------------------------------- %

% ------------------------- Pruebas --------------------------- %

    costo_directo(vancouver, calgary, Costo).
    Costo = 13.

    costo_un_intermedio(vancouver, saskatoon, Costo).
    Costo = 25.  % Vancouver -> Calgary -> Saskatoon

    costo_ruta_recursiva(vancouver, winnipeg, Costo).
    Costo = 42.  % Vancouver -> Calgary -> Saskatoon -> Winnipeg



