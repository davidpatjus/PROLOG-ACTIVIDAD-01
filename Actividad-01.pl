% -------------------------- Ejercicio Simpsons (01) -------------------------- %

% Definimos Los Hechos %

  % Padres %
    padre_de(abraham, homero).
    padre_de(homero, bart).
    padre_de(homero, lisa).
    padre_de(homero, maggie).
    padre_de(clancy, patty).
    padre_de(clancy, selma).
    padre_de(clancy, marge).

  % Madres %
    madre_de(mona, herbert).
    madre_de(mona, homero).
    madre_de(jacqueline, marge).
    madre_de(jacqueline, patty).
    madre_de(jacqueline, selma).
    madre_de(selma, ling).
    madre_de(patty, ling).
    madre_de(marge, bart).
    madre_de(marge, lisa).
    madre_de(marge, maggie).

  % Hombres %
    es_hombre(abraham).
    es_hombre(herbert).
    es_hombre(homero).
    es_hombre(bart).
    es_hombre(clancy).

  % Mujeres %
    es_mujer(mona).
    es_mujer(marge).
    es_mujer(lisa).
    es_mujer(maggie).
    es_mujer(ling).
    es_mujer(patty).
    es_mujer(selma).
    es_mujer(jacqueline).

% Definimos Las Relaciones %

	% Relacion Abuelos
		abuelo_de(Abuelo, Nieto) :- 
				(padre_de(Abuelo, Padre), padre_de(Padre, Nieto)); 
				(padre_de(Abuelo, Madre), madre_de(Madre, Nieto)).

		abuela_de(Abuela, Nieto) :- 
				(madre_de(Abuela, Padre), padre_de(Padre, Nieto)); 
				(madre_de(Abuela, Madre), madre_de(Madre, Nieto)).

	% Relacion Hermanos
		hermano_de(Hermano1, Hermano2) :- 
				padre_de(Padre, Hermano1), padre_de(Padre, Hermano2), 
				es_hombre(Hermano1),
				Hermano1 \= Hermano2.

		hermano_de(Hermano1, Hermano2) :- 
				madre_de(Madre, Hermano1), madre_de(Madre, Hermano2), 
				es_hombre(Hermano1),
				Hermano1 \= Hermano2.

		hermana_de(Hermana, Hermano) :- 
				padre_de(Padre, Hermana), padre_de(Padre, Hermano), 
				es_mujer(Hermana),
				Hermana \= Hermano.

		hermana_de(Hermana, Hermano) :- 
				madre_de(Madre, Hermana), madre_de(Madre, Hermano), 
				es_mujer(Hermana),
				Hermana \= Hermano.

	% Relacion Primos
		primo_de(Primo1, Primo2) :- 
				(padre_de(Padre1, Primo1), padre_de(Padre2, Primo2), hermano_de(Padre1, Padre2));
				(madre_de(Madre1, Primo1), madre_de(Madre2, Primo2), hermana_de(Madre1, Madre2)),
				es_hombre(Primo1),
				Primo1 \= Primo2.

		prima_de(Prima, Primo) :- 
				(padre_de(Padre1, Prima), padre_de(Padre2, Primo), hermano_de(Padre1, Padre2));
				(madre_de(Madre1, Prima), madre_de(Madre2, Primo), hermana_de(Madre1, Madre2)),
				es_mujer(Prima),
				Prima \= Primo.

	% Relacion Tios
		tio_de(Tio, Sobrino) :- 
				padre_de(Padre, Sobrino), hermano_de(Padre, Tio).

		tio_de(Tio, Sobrino) :- 
				madre_de(Madre, Sobrino), hermano_de(Madre, Tio).

		tia_de(Tia, Sobrino) :- 
				madre_de(Madre, Sobrino), hermana_de(Madre, Tia).

		tia_de(Tia, Sobrino) :- 
				padre_de(Padre, Sobrino), hermana_de(Padre, Tia).

% -------------------------- Pruebas -------------------------- %

% Prueba 1: ¿Quienes son los abuelos de Bart?
	% abuelo_de(Abuelo, bart).
	% Resultado: Abuelo = abraham.

% Prueba 2: ¿Quienes son los abuelos de Lisa?
	% abuelo_de(Abuelo, lisa).
	% Resultado: Abuelo = abraham.

% Prueba 3: ¿Quienes son los abuelos de Maggie?
	% abuelo_de(Abuelo, maggie).
	% Resultado: Abuelo = abraham.

% Prueba 4: ¿Quienes son los abuelos de Ling?
	% abuelo_de(Abuelo, ling).
	% Resultado: Abuelo = clancy.

% Prueba 5: ¿Quienes son los hermanos de Bart?
	% hermano_de(Hermano, bart).
	% Resultado: Hermano = lisa.

% Prueba 6: ¿Quienes son las hermanas de Bart?
	% hermana_de(Hermana, bart).
	% Resultado: Hermana = lisa.

% Prueba 7: ¿Quienes son los primos de Bart?
	% primo_de(Primo, bart).
	% Resultado: Primo = ling.

% Prueba 8: ¿Quienes son las primas de Bart?
	% prima_de(Prima, bart).
	% Resultado: Prima = ling.

% Prueba 9: ¿Quienes son los tios de Bart?
	% tio_de(Tio, bart).
	% Resultado: Tio = clancy.

% Prueba 10: ¿Quienes son las tias de Bart?
	% tia_de(Tia, bart).
	% Resultado: Tia = selma.

% ------------------------------------------------------------- %

% -------------------------- Ejercicio de la Guerra (02) -------------------------- %

% Definimos los hechos
	estadounidense(colonel_west).
	enemigo(corea_del_sur, eeuu).
	misil(misil_1).
	tiene(corea_del_sur, misil_1).
	vendio(colonel_west, misil_1, corea_del_sur).

% Definimos lo que significa vender armas a una nación hostil
	vende_armas(Persona, Nacion) :-
			vendio(Persona, Arma, Nacion),
			misil(Arma).

% Definimos lo que significa que una nación es hostil
	nacion_hostil(Nacion) :-
			enemigo(Nacion, eeuu).

% Definimos la ley que dice que es un crimen que un estadounidense venda armas a naciones hostiles
	criminal(Persona) :-
			estadounidense(Persona),
			vende_armas(Persona, Nacion),
			nacion_hostil(Nacion).

% -------------------------- Pruebas -------------------------- %

% Prueba 1: ¿Es criminal el coronel West?
	% criminal(colonel_west).
	% Resultado: true.

% ------------------------------------------------------------- %





