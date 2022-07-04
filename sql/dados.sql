--Inserção de dados para alimentar a base de dados

INSERT INTO mestre
    VALUES (
        -- Professores
        'elaine@email.com', -- email (PK)
        'Elaine',  -- nome 
        '30-03-1980', -- data nascimento
        16981513674), -- telefone
        ('andre@email.com',
        'Andre',
        '17-09-1994',
        16983547289),
        -- Chefs
        ('ciclano@email.com',
        'Ciclano',
        '09-09-1980',
        16980987564),
        ('jacquin@email.com', 
        'Jacquin',   
        '01-12-1998', 
        12981849378),
        ('paola@email.com',
        'Paola',
        '02-03-1978',
        11987463098),
        -- Faxineiros
        ('sergio@email.com',
        'Sergio',
        '16-08-1994',
        16983547229),
        ('beltrano@email.com', 
        'Beltrano',   
        '15-06-1990', 
        12981870097),
        ('felipe@email.com',
        'Felipe',
        '17-09-1990',
        16983547299),
        -- Farmaceuticos
        ('adrio@email.com',
        'Adrio',
        '16-08-1994',
        16983547229),
        ('paulo@email.com',
        'Paulo',
        '16-09-1995',
        16983547219)
;

INSERT INTO universitario
    VALUES 
    (
        'madu@email.com',
        'madu',
        '19-04-2001',
        12976892123
    ),(
        'sene@email.com',
        'sene',
        '05-08-2001',
        11987863098
    ),(
        'franca@email.com',
        'franca',
        '16-10-2001',
        15984756478
    ),(
        'beatriz@email.com',
        'beatriz',
        '05-12-2001',
        19984637485
    ),(
        'fred@email.com',
        'fred',
        '10-10-2000',
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
        '01-01-2022',
        '01-01-2024',
        'PROFESSOR'),
        ('ciclano@email.com',
        '01-07-2021',
        '30-06-2023',
        'CHEF'),
        ('jacquin@email.com',
        '01-06-2024',
        '01-07-2024',
        'CHEF'),
        ('sergio@email.com',
        '01-06-2023',
        '01-07-2023',
        'FAXINEIRO'),
        ('adrio@email.com',
        '04-06-2022',
        '04-11-2022',
        'FARMACEUTICO')
;

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

INSERT INTO chef
    VALUES 
        ('jacquin@email.com'),
        ('paola@email.com')
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
        '16-04-2022',
        'elaine@email.com',
        'Facilitar o trabalho.'),
        ('franca@email.com',
        'elaine@email.com',
        '07-05-2022',
        'elaine@email.com',
        'Cancelar a materia.'),
        ('madu@email.com',
        'ciclano@email.com',
        '17-08-2021',
        'paola@email.com',
        'Gostaria de ver videos sobre cortes de carne.'),
        ('beatriz@email.com',
        'ciclano@email.com',
        '01-02-2022',
        'jacquin@email.com',
        'Gostaria de uma receita de Petit Gateau.'),
        ('fred@email.com',
        'elaine@email.com',
        '09-09-2023',
        'andre@email.com',
        'Revisao no material postado.')
;

INSERT INTO tutorial
    VALUES
        -- Receitas
        (DEFAULT,
        'Como fazer um macarrão gostoso',
        '02-07-2022',
        'Comida Italiana',
        'RECEITA',
        0),
        (DEFAULT,
        'Como fazer um crepe',
        '03-07-2022',
        'Comida Francesa',
        'RECEITA',
        5),
        -- Video-Aulas
        (DEFAULT,
        'Como criar uma Tabela em SQL',
        '04-07-2022',
        'Computacao',
        'VIDEOAULA',
        0),
        (DEFAULT,
        'Como criar uma base de dados usando Postgre',
        '05-07-2022',
        'Computacao',
        'VIDEOAULA',
        5),
        -- Tecnica de Limpeza
        (DEFAULT,
        'Como lavar mancha de suco na roupa',
        '06-07-2022',
        'Roupa',
        'TECNICALIMPEZA',
        4),
        (DEFAULT,
        'Como lavar o seu banheiro sem desperdicar agua',
        '07-07-2022',
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
        '08-07-2022',
        'Saude',
        'ASSISTENCIA',
        0),
        (DEFAULT,
        'Quais produtos que ajudam a hidratar a pele?',
        '09-07-2022',
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
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar mancha de suco na roupa' AND T.data = '2022-07-06'::date)),
        'Sabao em Po Omo Lavagem Perfeita'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Como lavar o seu banheiro sem desperdicar agua' AND T.data = '2022-07-07'::date)),
        'Limpador Perfumado Veja Lavanda da Franca'
        )
;

INSERT INTO assistencia
    VALUES
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'O que fazer quando sentir enjoo?' AND T.data = '2022-07-08'::date)),
        'adrio@email.com'
        ),
        ((SELECT T.id FROM tutorial T WHERE ( T.titulo = 'Quais produtos que ajudam a hidratar a pele?' AND T.data = '2022-07-09'::date)),
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