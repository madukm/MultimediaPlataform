INSERT INTO mestre
    VALUES (
        'elaine@email.com', -- email (PK)
        'elaine',  -- nome 
        '30-03-1980', -- data nascimento
        16981513674), -- telefone
        ('jacquin@email.com', 
        'jacquin',   
        '01-12-1998', 
        12981849378),
        ('paola@email.com',
        'paola',
        '02-03-1978',
        11987463098),
        ('beltrano@email.com', 
        'beltrano',   
        '15-06-1990', 
        12981870097),
        ('ciclano@email.com',
        'ciclano',
        '09-09-1980',
        16980987564),
        ('andre@email.com',
        'andre',
        '17-09-1994',
        16983547209);

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
        ('ciclano@email.com');

INSERT INTO termo
    VALUES
        ('elaine@email.com',
        '01-01-2022',
        '01-01-2024',
        'PROFESSOR'),
        ('ciclano@email.com',
        '01-07-2021',
        '30-06-2023',
        'CHEF');

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

INSERT INTO chef
    VALUES 
        ('jacquin@email.com'),
        ('paola@email.com');

INSERT INTO especialidades
    VALUES 
        ('jacquin@email.com',
        'francesa'),
        ('paola@email.com',
        'italiana'),
        ('paola@email.com',
        'argentina');


