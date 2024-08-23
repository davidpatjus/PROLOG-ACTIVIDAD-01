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

  % Relacion Abuelos %
    abuelo_de(Abuelo,Nieto):-(   padre_de(Abuelo, Madre), madre_de(Madre, Nieto));
        (   padre_de(Abuelo, Padre), padre_de(Padre, Nieto)).

    abuela_de(Abuela,Nieto):-(   madre_de(Abuela, Madre), madre_de(Madre, Nieto));
        (   madre_de(Abuela, Padre), padre_de(Padre, Nieto)).

  % Relacion Hermanos %
    hermano_de(Hermano1,Hermano2):-(  padre_de(Padre, Hermano1), padre_de(Padre, Hermano2), es_hombre(Hermano1)	);
                                   (   madre_de(Madre, Hermano1), madre_de(Madre, Hermano2), es_hombre(Hermano1) ).

    hermana_de(Hermana,Hermano):-(  padre_de(Padre, Hermana), padre_de(Padre, Hermano), es_mujer(Hermana)	);
                                   (   madre_de(Madre, Hermana), madre_de(Madre, Hermano), es_mujer(Hermana) ).

  % Relacion Primos %
    primo_de(Primo1, Primo2):- (   (   padre_de(Padre1, Primo1), padre_de(Padre2, Primo2), hermano_de(Padre1, Padre2) );
                                (   madre_de(Madre1, Primo1), madre_de(Madre2, Primo2), hermana_de(Madre1, Madre2) )	),
                                    es_hombre(Primo1).

    prima_de(Prima, Primo):-(    (   padre_de(Padre1, Prima), padre_de(Padre2, Primo), hermano_de(Padre1, Padre2) );
                                (   madre_de(Madre1, Prima), madre_de(Madre2, Primo), hermana_de(Madre1, Madre2) )	),
                                    es_mujer(Prima).

  % Relacion Tios %
	tio_de(Tio, Sobrino):-(   padre_de(Padre, Sobrino), hermano_de(Padre, Tio) ).
	tia_de(Tia, sobrino):-(   madre_de(Madre, Sobrino), hermana_de(Madre, Tia) ).




