% -------------------------- Ejercicio 2.1 -------------------------- %

    % Definir la relación maximo(+X, +Y, ?Z) para que Z sea el maximo de X y Y.

    % Caso cuando X es mayor o igual que Y, entonces Z = X
    maximo(X, Y, X) :- X >= Y.

    % Caso cuando Y es mayor que X, entonces Z = Y
    maximo(X, Y, Y) :- Y > X.

% -------------------------- Ejercicio 2.2 -------------------------- %

    % Definir la relación factorial(+X, ?Y) que se verifique si Y es el factorial de X.

    % Caso base: el factorial de 0 es 1
    factorial(0, 1).

    % Regla recursiva: factorial(N) = N * factorial(N-1)
    factorial(N, F) :-
        N > 0,                     % Aseguramos que N sea mayor que 0
        N1 is N - 1,                % Calculamos N-1
        factorial(N1, F1),          % Llamada recursiva para calcular factorial(N-1)
        F is N * F1.                % El factorial de N es N * factorial(N-1)

% -------------------------- Ejercicio 4.1 -------------------------- %

    % 1. Definir la relación f(X, Y) de acuerdo con las siguientes reglas:
    % - Si X < 3, entonces Y = 0
    % - Si 3 ≤ X < 6, entonces Y = 2
    % - Si 6 ≤ X, entonces Y = 4

    f(X, 0) :- X < 3.               
    f(X, 2) :- X >= 3, X < 6.       
    f(X, 4) :- X >= 6.              

    % 2. Construir el árbol de deducción para ?- f(1, Y), 2 < Y.
    % Este árbol muestra que para f(1, Y), Y = 0 (debido a X < 3).
    % La consulta "2 < Y" falla, ya que 2 no es menor que 0.

    % 3. Definir la relación f_1(X, Y) con un corte "!" después de las dos primeras cláusulas
    % El corte (!) garantiza que cuando se cumpla una condición, no se evaluarán mas reglas.

    f_1(X, 0) :- X < 3, !.          
    f_1(X, 2) :- X >= 3, X < 6, !.  
    f_1(X, 4) :- X >= 6.            

    % 4. Construir el árbol de deducción para ?- f_1(1, Y), 2 < Y.
    % Al evaluar f_1(1, Y), obtenemos Y = 0, y luego la consulta "2 < Y" falla.

    % 5. Construir el árbol de deducción para ?- f_1(7, Y).
    % Al evaluar f_1(7, Y), obtenemos Y = 4 (ya que 7 >= 6).

% -------------------------- Pruebas -------------------------- %

?- maximo(3, 2, X).   % devuelve X = 3
?- factorial(4, Y).   % devuelve Y = 24
?- f(5, Y).           % devuelve Y = 2
?- f_1(7, Y).         % devuelve Y = 4

% ------------------------------------------------------------- %

