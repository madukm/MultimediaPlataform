
-- Selecionar o texto de uma solicitação realizada a um tal
-- coordenador 'X' que era coordenador durante um período de
-- vigência Y-Z. Ordene por data;

SELECT S.texto,S.data
    FROM coordenador C
        JOIN termo T
        on C.mestre = T.coordenador
    WHERE (T.iniVigencia < 'YYYYMMDD' && T.fimVigencia > 'YYYYMMDD')
    ORDER BY S.data

-- Listar todos os mestres que possuem os tutoriais com 
-- nota maior ou igual a 4 (nome e dataNasc);

SELECT M.nome,M.data_nasc
    FROM mestre M
        JOIN
        (
            SELECT tutorial,chef as mestre FROM receita
            LEFT JOIN
            SELECT tutorial,professor FROM videoaula
            LEFT JOIN
            SELECT tutorial,faxineiro FROM tecnicalimpeza
            LEFT JOIN
            SELECT tutorial,farmaceutico FROM assistencia
        ) Trs
        ON M.email = Trs.mestre
            JOIN tutorial T
            ON T.id = Trs.tutorial
        WHERE T.Nota > 4
;

-- Consultar todos os coordenadores que possuem tempo de
-- vigencia menor ou igual a 6 meses (nome e telefone)
-- das classes Professor e Chef;

SELECT M.nome, M.telefone
    FROM mestre M
        JOIN termo T
        ON M.email = T.coordenador
    WHERE (DATEDIFF(DAY,T.iniVigencia,T.fimVigencia)/30 && (T.classe == "PROFESSOR" || T.classe == "CHEF"))

;
-- Consultar todas as Tecnicas de Limpeza de faxineiros que
-- também são farmaceuticos(listar nome e nota média,
-- seguido de uma ordenação decrescente);

-- (Média por classe)

SELECT M.nome, AVG(T.nota) as Media_1, AVG(T2.nota) as Media_2
    FROM mestre M
        JOIN 
            (tecnicaLimpeza T1
            JOIN assistencia T2
            ON T1.faxineiro = T2.farmaceutico
            )
        ON T1.faxineiro = M.email
    GROUP BY (M.nome)
    ORDER BY AVG(T1.nota) DESC,AVG(T2.nota) DESC
;

-- Selecionar quais universitários fizeram mais de 3
-- comentários em tutoriais de faxina;

SELECT U.nome,COUNT(Cm.data) as Quantidade_Comentários
    FROM universitario U 
        JOIN comentario Cm 
        ON U.email = Cm.universitario
            JOIN tecnicaLimpeza Tl
            ON Cm.tutorial = Tl.tutorial
    GROUP BY (U.nome)
    HAVING COUNT(Cm.data)>3
;