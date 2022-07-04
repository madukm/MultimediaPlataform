--Inserção de dados para alimentar a base de dados

INSERT INTO mestre
    VALUES (
        -- Professores
        'elaine@email.com', -- email (PK)
        'Elaine',  -- nome 
        DATE '1980-03-29', -- data nascimento
        16981513674), -- telefone
        ('andre@email.com',
        'Andre',
        DATE '1994-09-17',
        16983547289),
        -- Chefs
        ('ciclano@email.com',
        'Ciclano',
        DATE '1980-09-09',
        16980987564),
        ('jacquin@email.com', 
        'Jacquin',   
        DATE '1998-12-01', 
        12981849378),
        ('paola@email.com',
        'Paola',
        DATE '1978-03-02',
        11987463098),
        -- Faxineiros
        ('sergio@email.com',
        'Sergio',
        DATE '1994-08-16',
        16983547229),
        ('beltrano@email.com', 
        'Beltrano',   
        DATE '1990-06-15', 
        12981870097),
        ('felipe@email.com',
        'Felipe',
        DATE '1990-09-17',
        16983547299),
        -- Farmaceuticos
        ('adrio@email.com',
        'Adrio',
        DATE '1994-08-16',
        16983547229),
        ('paulo@email.com',
        'Paulo',
        DATE '1995-09-16',
        16983547219)
;

INSERT INTO universitario
    VALUES 
    (
        'madu@email.com',
        'madu',
        DATE '2001-04-19',
        12976892123
    ),(
        'sene@email.com',
        'sene',
        DATE '2001-08-05',
        11987863098
    ),(
        'franca@email.com',
        'franca',
        DATE '2001-10-16',
        15984756478
    ),(
        'beatriz@email.com',
        'beatriz',
        DATE '2001-12-05',
        19984637485
    ),(
        'fred@email.com',
        'fred',
        DATE '2000-10-10',
        85984536278
    );

INSERT INTO coordenador
    VALUES
        ('elaine@email.com'),
        ('ciclano@email.com'),
        ('sergio@email.com'),
        ('adrio@email.com'),
        ('jacquin@email.com')
;

INSERT INTO termo
    VALUES
        ('elaine@email.com',
        DATE '2022-01-01',
        DATE '2024-01-01',
        'PROFESSOR'),
        ('ciclano@email.com',
        DATE '2021-07-01',
        DATE '2023-06-30',
        'CHEF'),
        ('jacquin@email.com',
        '01-06-2024',
        '01-07-2024',
        'CHEF'),
        ('sergio@email.com',
        DATE '2023-06-01',
        DATE '2023-07-01',
        'FAXINEIRO'),
        ('adrio@email.com',
        DATE '2022-06-04',
        DATE '2022-11-04',
        'FARMACEUTICO');

INSERT INTO chef
    VALUES
        ('ciclano@email.com'),
        ('jacquin@email.com'),
        ('paola@email.com');
;

INSERT INTO faxineiro
    VALUES
        ('felipe@email.com'),
        ('sergio@email.com'),
        ('beltrano@email.com'),
        ('adrio@email.com');
;

INSERT INTO farmaceutico
    VALUES
        ('adrio@email.com'),
        ('paulo@email.com'),
        ('felipe@email.com')
;

INSERT INTO professor
    VALUES
        ('elaine@email.com'),
        ('andre@email.com')
;

INSERT INTO areasAtuacao
    VALUES
        ('elaine@email.com',
        'Base de Dados'),
        ('elaine@email.com',
        'Ciencia de Dados')
;

INSERT INTO especialidades
    VALUES 
        ('jacquin@email.com',
        'francesa'),
        ('paola@email.com',
        'italiana'),
        ('paola@email.com',
        'argentina')
;

INSERT INTO solicitacao
    VALUES
        ('sene@email.com',
        'elaine@email.com',
        DATE '2022-04-16',
        'elaine@email.com',
        'Facilitar o trabalho.'),
        ('franca@email.com',
        'elaine@email.com',
        DATE '2022-05-07',
        'elaine@email.com',
        'Cancelar a materia.'),
        ('madu@email.com',
        'ciclano@email.com',
        DATE '2021-08-17',
        'paola@email.com',
        'Gostaria de ver videos sobre cortes de carne.'),
        ('beatriz@email.com',
        'ciclano@email.com',
        DATE '2022-02-01',
        'jacquin@email.com',
        'Gostaria de uma receita de Petit Gateau.'),
        ('fred@email.com',
        'elaine@email.com',
        DATE '2023-09-09',
        'andre@email.com',
        'Revisao no material postado.')
;

INSERT INTO tutorial
    VALUES
        -- Receitas
        (DEFAULT,
        'Como fazer um macarrão gostoso',
        DATE '2022-07-02',
        'Comida Italiana',
        'RECEITA',
        0),
        (DEFAULT,
        'Como fazer um crepe',
        DATE '2022-07-03',
        'Comida Francesa',
        'RECEITA',
        5),
        -- Video-Aulas
        (DEFAULT,
        'Como criar uma Tabela em SQL',
        DATE '2022-07-04',
        'Computacao',
        'VIDEOAULA',
        0),
        (DEFAULT,
        'Como criar uma base de dados usando Postgre',
        DATE '2022-07-05',
        'Computacao',
        'VIDEOAULA',
        5),
        -- Tecnica de Limpeza
        (DEFAULT,
        'Como lavar mancha de suco na roupa',
        DATE '2022-07-06',
        'Roupa',
        'TECNICALIMPEZA',
        4),
        (DEFAULT,
        'Como lavar o seu banheiro sem desperdicar agua',
        DATE '2022-07-07',
        'Comodo',
        'TECNICALIMPEZA',
        5),
        (DEFAULT,
        'Como lavar o seu chao',
        '10-07-2022',
        'Comodo',
        'TECNICALIMPEZA',
        4),
        -- Assistencia Farmaceutica
        (DEFAULT,
        'O que fazer quando sentir enjoo?',
        DATE '2022-07-08',
        'Saude',
        'ASSISTENCIA',
        0),
        (DEFAULT,
        'Quais produtos que ajudam a hidratar a pele?',
        DATE '2022-07-09',
        'Estetica',
        'ASSISTENCIA',
        5),
        (DEFAULT,
        'QuaL remedio para enxaqueca?',
        '11-07-2022',
        'Saude',
        'ASSISTENCIA',
        3)
;

INSERT INTO receita
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = '2022-07-02'::date)),
        2,
        1200,
        'paola@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = '2022-07-03'::date)),
        1,
        500,
        'jacquin@email.com'
        )
;

INSERT INTO ingredientes
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = '2022-07-02'::date)),
        'Macarrao espaguete 500g'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = '2022-07-02'::date)),
        'Molho de tomate 240g'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = '2022-07-03'::date)),
        'Massa de Crepe'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = '2022-07-03'::date)),
        'Carne Moida 200g')
;

INSERT INTO videoaula
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma Tabela em SQL' AND T.data = '2022-07-04'::date)),
        'SQL',
        'Banco de Dados',
        'elaine@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = '2022-07-05'::date)),
        'SQL',
        'Banco de Dados',
        'andre@email.com'
        )
;

INSERT INTO materiais
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = '2022-07-05'::date)),
        'Computador com Postgre instalado.')
;

INSERT INTO tecnicaLimpeza
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = '2022-07-06'::date)),
        'felipe@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = '2022-07-07'::date)),
        'sergio@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu chao' AND T.data = '2022-07-10'::date)),
        'adrio@email.com'
        )
;

INSERT INTO produtos
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data ='2022-07-06'::date)),
        'Sabao em Po Omo Lavagem Perfeita'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data ='2022-07-07'::date)),
        'Limpador Perfumado Veja Lavanda da Franca'
        )
;

INSERT INTO assistencia
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data ='2022-07-08'::date)),
        'adrio@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Quais produtos que ajudam a hidratar a pele?' AND T.data ='2022-07-09'::date)),
        'paulo@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'QuaL remedio para enxaqueca?' AND T.data = '2022-07-11'::date)),
        'felipe@email.com'
        )
;

INSERT INTO remedios
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = '2022-07-08'::date)),
        'Dramin B6 50mg/10mg'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Quais produtos que ajudam a hidratar a pele?' AND T.data = '2022-07-09'::date)),
        'NIVEA Locao Hidratante Milk'
        )
;

INSERT INTO comentario
    VALUES 
        ('madu@email.com',
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date)),
        '2022-07-03'::date,
         'Excelente receita!'),
        ('fred@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data ='2022-07-08'::date)),
        '2022-07-11'::date, 
         'Otimo tutorial!'),
        ('sene@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data ='2022-07-06'::date)),
        '2022-07-21'::date,
         'Gostei')
;

INSERT INTO recomendar
    VALUES
        ('madu@email.com',
         'franca@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date))),
        ('madu@email.com',
         'fred@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date))),
        ('madu@email.com',
         'sene@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date))),
        ('beatriz@email.com', 
         'madu@email.com',
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data ='2022-07-05'::date)))
;

INSERT INTO avaliar
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date)), 
         'madu@email.com', 
         5),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data ='2022-07-02'::date)), 
         'fred@email.com', 
         4),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data ='2022-07-08'::date)),
         'fred@email.com', 
         4),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data ='2022-07-05'::date)),
         'sene@email.com', 
         4)
;

INSERT INTO seguir
    VALUES
        ('madu@email.com', 'paola@email.com'),
        ('madu@email.com', 'jacquin@email.com'),
        ('madu@email.com', 'ciclano@email.com'),
        ('sene@email.com', 'elaine@email.com'),
        ('fred@email.com', 'adrio@email.com'),
        ('fred@email.com', 'paulo@email.com'),
        ('franca@email.com', 'sergio@email.com')
    VALUES
        ('sene@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = '2022-07-06'::date)),
        '16-07-2022',
        'Gostei Bastante.'),
        ('sene@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = '2022-07-07'::date)),
        '17-07-2022',
        'Muito bom!'),
        ('sene@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu chao' AND T.data = '2022-07-10'::date)),
        '16-07-2022',
        'Podia melhorar.'),
        ('madu@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = '2022-07-06'::date)),
        '16-07-2022',
        'Interessante.'),
        ('madu@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = '2022-07-07'::date)),
        '18-07-2022',
        'Vai ter continuacao?'),
        ('madu@email.com',
        (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = '2022-07-08'::date)),
        '19-07-2022',
        'Achei meio sem sal.')
;

INSERT INTO classes
    VALUES(
        -- Professores
        'elaine@email.com',
        'PROFESSOR'
        ),
        ('andre@email.com',
        'PROFESSOR'
        ),
        -- Chefs
        ('ciclano@email.com',
        'CHEF'
        ),
        ('jacquin@email.com',
        'CHEF'
        ),
        ('paola@email.com',
        'CHEF'
        ),
        -- Faxineiros
        ('sergio@email.com',
        'FAXINEIRO'
        ),
        ('beltrano@email.com',
        'FAXINEIRO'
        ),
        ('felipe@email.com',
        'FAXINEIRO'
        ),
        ('adrio@email.com',
        'FAXINEIRO'
        ),
        -- Farmaceuticos
        ('adrio@email.com',
        'FARMACEUTICO'
        ),
        ('paulo@email.com',
        'FARMACEUTICO'
        )
        ('felipe@email.com',
        'FARMACEUTICO'
        )
        -- Coordenadores
        ('elaine@email.com',
        'COORDENADOR'
        ),
        ('ciclano@email.com',
        'COORDENADOR'
        ),
        ('sergio@email.com',
        'COORDENADOR'
        ),
        ('adrio@email.com',
        'COORDENADOR'
        ),
        ('jacquin@email.com',
        'COORDENADOR'
        )
;