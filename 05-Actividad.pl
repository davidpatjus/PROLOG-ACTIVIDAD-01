% -------------------------- Ejercicio Simpsons (05) con Listas y Estructuras -------------------------- %

% Definimos las familias como estructuras
    familia(persona(abraham, mona), [homero, herbert]).
    familia(persona(homero, marge), [bart, lisa, maggie]).
    familia(persona(clancy, jacqueline), [marge, patty, selma]).
    familia(persona(selma, patty), [ling]).

% Definimos las relaciones familiares con estructuras
    padre_de(Padre, Hijo) :- familia(persona(Padre, _), Hijos), member(Hijo, Hijos).
    madre_de(Madre, Hijo) :- familia(persona(_, Madre), Hijos), member(Hijo, Hijos).

% Definimos el género con estructuras
    es_hombre(Persona) :- member(Persona, [abraham, homero, herbert, bart, clancy]).
    es_mujer(Persona) :- member(Persona, [mona, marge, lisa, maggie, patty, selma, ling, jacqueline]).

% Relación de abuelos
    abuelo_de(Abuelo, Nieto) :- padre_de(Abuelo, Padre), padre_de(Padre, Nieto); padre_de(Abuelo, Madre), madre_de(Madre, Nieto).
    abuela_de(Abuela, Nieto) :- madre_de(Abuela, Padre), padre_de(Padre, Nieto); madre_de(Abuela, Madre), madre_de(Madre, Nieto).

% Relación de hermanos
    hermano_de(Hermano1, Hermano2) :- padre_de(Padre, Hermano1), padre_de(Padre, Hermano2), es_hombre(Hermano1), Hermano1 \= Hermano2.
    hermana_de(Hermana, Hermano) :- padre_de(Padre, Hermana), padre_de(Padre, Hermano), es_mujer(Hermana), Hermana \= Hermano.

% Relación de primos
    primo_de(Primo1, Primo2) :- padre_de(Padre1, Primo1), padre_de(Padre2, Primo2), hermano_de(Padre1, Padre2), es_hombre(Primo1).
    prima_de(Prima, Primo) :- padre_de(Padre1, Prima), padre_de(Padre2, Primo), hermano_de(Padre1, Padre2), es_mujer(Prima).

% Relación de tíos
    tio_de(Tio, Sobrino) :- padre_de(Padre, Sobrino), hermano_de(Padre, Tio); madre_de(Madre, Sobrino), hermano_de(Madre, Tio.
    tia_de(Tia, Sobrino) :- padre_de(Padre, Sobrino), hermana_de(Padre, Tia); madre_de(Madre, Sobrino), hermana_de(Madre, Tia).

% ------------------------------------------------------------------------------------------------------ %