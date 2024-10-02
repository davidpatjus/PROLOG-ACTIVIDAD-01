% -------------------------- Ejercicio Ciudades (01) con Listas -------------------------- %

% Representación de conexiones y costos utilizando listas
conexiones([
    [vancouver, edmonton, 16],
    [vancouver, calgary, 13],
    [edmonton, saskatoon, 12],
    [saskatoon, winnipeg, 20],
    [saskatoon, calgary, 9],
    [calgary, edmonton, 4],
    [calgary, regina, 14],
    [regina, winnipeg, 4],
    [regina, saskatoon, 7]
]).

% Consulta para verificar si existe una conexión directa
existe_conexion(CiudadX, CiudadY) :-
    conexiones(Conexiones),
    (member([CiudadX, CiudadY, _], Conexiones);
     member([CiudadY, CiudadX, _], Conexiones)).

% Consulta para obtener el costo de una conexión directa
costo(CiudadX, CiudadY, Costo) :-
    conexiones(Conexiones),
    (member([CiudadX, CiudadY, Costo], Conexiones);
     member([CiudadY, CiudadX, Costo], Conexiones)).

% Costo de una ruta directa o con un nodo intermedio
costo_directo(CiudadA, CiudadB, Costo) :- costo(CiudadA, CiudadB, Costo).

costo_un_intermedio(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),
    costo(CiudadA, CiudadY, CostoA_Y),
    existe_conexion(CiudadY, CiudadB),
    costo(CiudadY, CiudadB, CostoY_B),
    CostoTotal is CostoA_Y + CostoY_B.

% Costo de ruta recursiva entre dos ciudades
costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    costo_directo(CiudadA, CiudadB, CostoTotal).

costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),
    CiudadY \= CiudadB,
    costo(CiudadA, CiudadY, CostoA_Y),
    costo_ruta_recursiva(CiudadY, CiudadB, CostoY_B),
    CostoTotal is CostoA_Y + CostoY_B.

% ---------------------------------------------------------------------------------------- %

% -------------------------- Ejercicio Ciudades (02) con Listas y Estructuras -------------------------- %

% Representación de conexiones y costos utilizando estructuras
conexiones([
    conexion(vancouver, edmonton, 16),
    conexion(vancouver, calgary, 13),
    conexion(edmonton, saskatoon, 12),
    conexion(saskatoon, winnipeg, 20),
    conexion(saskatoon, calgary, 9),
    conexion(calgary, edmonton, 4),
    conexion(calgary, regina, 14),
    conexion(regina, winnipeg, 4),
    conexion(regina, saskatoon, 7)
]).

% Consulta para verificar si existe una conexión directa
existe_conexion(CiudadX, CiudadY) :-
    conexiones(Conexiones),
    (member(conexion(CiudadX, CiudadY, _), Conexiones);
     member(conexion(CiudadY, CiudadX, _), Conexiones)).

% Consulta para obtener el costo de una conexión directa
costo(CiudadX, CiudadY, Costo) :-
    conexiones(Conexiones),
    (member(conexion(CiudadX, CiudadY, Costo), Conexiones);
     member(conexion(CiudadY, CiudadX, Costo), Conexiones)).

% Costo de una ruta directa o con un nodo intermedio
costo_directo(CiudadA, CiudadB, Costo) :- costo(CiudadA, CiudadB, Costo).

costo_un_intermedio(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),
    costo(CiudadA, CiudadY, CostoA_Y),
    existe_conexion(CiudadY, CiudadB),
    costo(CiudadY, CiudadB, CostoY_B),
    CostoTotal is CostoA_Y + CostoY_B.

% Costo de ruta recursiva entre dos ciudades
costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    costo_directo(CiudadA, CiudadB, CostoTotal).

costo_ruta_recursiva(CiudadA, CiudadB, CostoTotal) :-
    existe_conexion(CiudadA, CiudadY),
    CiudadY \= CiudadB,
    costo(CiudadA, CiudadY, CostoA_Y),
    costo_ruta_recursiva(CiudadY, CiudadB, CostoY_B),
    CostoTotal is CostoA_Y + CostoY_B.

% ------------------------------------------------------------------------------------------------------ %