-- Consultas realizadas na base de dados

-- Selecionar o texto de uma solicitação realizada a um tal
-- coordenador 'X' que era coordenador durante um período de
-- vigência 16/12/2021 - 01/01/2025, ordenados pela data;

SELECT S.texto,S.data,C.mestre
	FROM solicitacao S
		JOIN coordenador C
		ON S.coordenador = C.mestre
			JOIN termo T
			ON C.mestre = T.coordenador
    WHERE ((T.iniVigencia > '2021-12-16'::date) AND (T.fimVigencia < '2025-01-01'::date))
    ORDER BY S.data
;

-- Listar todos os mestres que possuem algum tutorial com 
-- nota menor ou igual a 3 (nome e dataNasc) de forma
-- ordenada (pelo nome do mestre);

SELECT M.nome,M.data_nasc
    FROM mestre M
        JOIN
        (
            SELECT tutorial,chef as mestre FROM receita
            UNION
            SELECT tutorial,professor FROM videoaula
            UNION
            SELECT tutorial,faxineiro FROM tecnicalimpeza
            UNION
            SELECT tutorial,farmaceutico FROM assistencia
        ) Trs
        ON M.email = Trs.mestre
            JOIN tutorial T
            ON T.id = Trs.tutorial
	WHERE T.Nota <= 3
	ORDER BY (M.nome)
;

-- Consultar todos os coordenadores que possuem tempo de
-- vigencia menor ou igual a 6 meses (nome e telefone)
-- das classes Professor e Chef;

SELECT M.nome, M.telefone
    FROM mestre M
        JOIN termo T
        ON M.email = T.coordenador
    WHERE ((T.fimVigencia - T.iniVigencia)/30 <= 6 AND (T.classe = 'PROFESSOR' OR T.classe = 'CHEF'))
;

-- Consultar todas as Tecnicas de Limpeza de faxineiros que
-- também são farmaceuticos(listar nome e nota média,
-- seguido de uma ordenação decrescente);


SELECT M.nome, AVG(T1.nota) as Media_Faxina, AVG(T2.nota) as Media_Assistencia
    FROM mestre M
        JOIN tecnicaLimpeza TL
		ON TL.faxineiro = M.email
		
        JOIN assistencia ASSIS
        ON TL.faxineiro = ASSIS.farmaceutico
		
		JOIN tutorial T1
		ON T1.id = TL.tutorial
		
		JOIN tutorial T2
		ON T2.id = ASSIS.tutorial
					
    GROUP BY (M.nome)
    ORDER BY AVG(T1.nota) DESC, AVG(T2.nota) DESC
;

-- Selecionar quais universitários fizeram mais de 2
-- comentários em tutoriais de faxina;

SELECT U.nome,COUNT(Cm.data) as Quantidade_Comentarios
    FROM universitario U 
        JOIN comentario Cm 
        ON U.email = Cm.universitario
            JOIN tecnicaLimpeza Tl
            ON Cm.tutorial = Tl.tutorial
    GROUP BY (U.nome)
    HAVING COUNT(Cm.data)>2
;