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
        ('adrio@email.com');

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
        ('sergio@email.com');
;

INSERT INTO farmaceutico
    VALUES
        ('adrio@email.com'),
        ('paulo@email.com');
;

INSERT INTO professor
    VALUES
        ('elaine@email.com'),
        ('andre@email.com');

INSERT INTO areasAtuacao
    VALUES
        ('elaine@email.com',
        'Base de Dados'),
        ('elaine@email.com',
        'Ciencia de Dados');

INSERT INTO especialidades
    VALUES 
        ('jacquin@email.com',
        'francesa'),
        ('paola@email.com',
        'italiana'),
        ('paola@email.com',
        'argentina');


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
        'Revisao no material postado.');

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
        0),
        (DEFAULT,
        'Como lavar o seu banheiro sem desperdicar agua',
        DATE '2022-07-07',
        'Comodo',
        'TECNICALIMPEZA',
        5),
        -- Assistencia Farmaceutica
        (DEFAULT,
        'O que fazer quando sentir enjoo?',
        DATE '2022-07-08',
        'Saude',
        'TECNICALIMPEZA',
        0),
        (DEFAULT,
        'Quais produtos que ajudam a hidratar a pele?',
        DATE '2022-07-09',
        'Estetica',
        'TECNICALIMPEZA',
        5)
;

INSERT INTO receita
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')),
        2,
        1200,
        'paola@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = DATE '2022-07-03')),
        1,
        500,
        'jacquin@email.com'
        )
;

INSERT INTO ingredientes
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')),
        'Macarrao espaguete 500g'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')),
        'Molho de tomate 240g'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = DATE '2022-07-03')),
        'Massa de Crepe'),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um crepe' AND T.data = DATE '2022-07-03')),
        'Carne Moida 200g')
;

INSERT INTO videoaula
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma Tabela em SQL' AND T.data = DATE '2022-07-04')),
        'SQL',
        'Banco de Dados',
        'elaine@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = DATE '2022-07-05')),
        'SQL',
        'Banco de Dados',
        'andre@email.com'
        )
;

INSERT INTO materiais
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = DATE '2022-07-05')),
        'Computador com Postgre instalado.')
;

INSERT INTO tecnicaLimpeza
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = DATE '2022-07-06')),
        'felipe@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = DATE '2022-07-07')),
        'sergio@email.com'
        )
;

INSERT INTO produtos
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = DATE '2022-07-06')),
        'Sabao em Po Omo Lavagem Perfeita'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = DATE '2022-07-07')),
        'Limpador Perfumado Veja Lavanda da Franca'
        )
;

INSERT INTO assistencia
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = DATE '2022-07-08')),
        'adrio@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Quais produtos que ajudam a hidratar a pele?' AND T.data = DATE '2022-07-09')),
        'paulo@email.com'
        )
;

INSERT INTO remedios
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = DATE '2022-07-08')),
        'Dramin B6 50mg/10mg'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Quais produtos que ajudam a hidratar a pele?' AND T.data = DATE '2022-07-09')),
        'NIVEA Locao Hidratante Milk'
        )
;

INSERT INTO comentario
    VALUES 
        ('madu@email.com',
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')),
         DATE '2022-07-03',
         'Excelente receita!'),
        ('fred@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = DATE '2022-07-08')),
         DATE '2022-07-11', 
         'Otimo tutorial!'),
        ('sene@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = DATE '2022-07-06')),
         DATE '2022-07-21',
         'Gostei')
;

INSERT INTO recomendar
    VALUES
        ('madu@email.com',
         'franca@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02'))),
        ('madu@email.com',
         'fred@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02'))),
        ('madu@email.com',
         'sene@email.com', 
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02'))),
        ('beatriz@email.com', 
         'madu@email.com',
         (SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = DATE '2022-07-05')))
;

INSERT INTO avaliar
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')), 
         'madu@email.com', 
         5),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como fazer um macarrão gostoso' AND T.data = DATE '2022-07-02')), 
         'fred@email.com', 
         4),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = DATE '2022-07-08')),
         'fred@email.com', 
         4),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como criar uma base de dados usando Postgre' AND T.data = DATE '2022-07-05')),
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
;