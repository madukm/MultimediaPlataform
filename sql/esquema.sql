/* 
Projeto - Plataformas Multimídia
SCC0240 - Bases de Dados - 1º semestre de 2022
Prof. Dra. Elaine Parros Machado de Sousa
Estagiário PAE André Moreira Souza

Plataforma de tutoriais para apoio a universitários

Grupo:
Beatriz Aparecida Diniz - 11925430
Frederico Bulhões de Souza Ribeiro - 11208440
João Victor Sene Araújo - 11796382
Maria Eduarda Kawakami Moreira - 11218751
*/

-- psql -U postgres -a -q -f sql/esquema.sql
-- psql -U postgres -d multimedia_db -a -q -f sql/dados.sql 

-- Esquema

-- Deletando a base caso já exista
DROP DATABASE IF EXISTS multimedia_db;

-- Crianda database
CREATE DATABASE multimedia_db;

-- Conectando
\c multimedia_db;

-- Criando as tabelas
-- Mestre
CREATE TABLE mestre(
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE,
    telefone NUMERIC(11, 0) CHECK(telefone > 0), 
    CONSTRAINT pk_mestre PRIMARY KEY(email)
);

-- Universitário
CREATE TABLE universitario(
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE,
    telefone NUMERIC(11, 0) CHECK(telefone > 0), 
    CONSTRAINT pk_universitario PRIMARY KEY(email)
);

-- Coordenador
CREATE TABLE coordenador(
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_coordenador PRIMARY KEY(mestre),
    CONSTRAINT fk_coordenador FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Termo do coordenador
CREATE TABLE termo(
    coordenador VARCHAR(50) NOT NULL,
    iniVigencia DATE NOT NULL,
    fimVigencia DATE NOT NULL,
    classe VARCHAR(50) NOT NULL,
    CONSTRAINT pk_termo PRIMARY KEY(coordenador, iniVigencia),
    CONSTRAINT fk_termo FOREIGN KEY(coordenador)
        REFERENCES coordenador(mestre)
        ON DELETE CASCADE,
    CONSTRAINT check_termo_classe 
        CHECK(UPPER(classe) IN ('PROFESSOR', 'CHEF', 'FAXINEIRO', 'FARMACEUTICO'))
);

-- Professor
CREATE TABLE professor(
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_professor PRIMARY KEY(mestre),
    CONSTRAINT fk_professor FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Areas de atuacao do professor
CREATE TABLE areasAtuacao(
    professor VARCHAR(50) NOT NULL,
    area VARCHAR(70) NOT NULL,
    CONSTRAINT pk_areasAtuacao PRIMARY KEY(professor, area),
    CONSTRAINT fk_areasAtuacao FOREIGN KEY(professor)
        REFERENCES professor(mestre)
        ON DELETE CASCADE
);

-- Chef
CREATE TABLE chef(
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_chef PRIMARY KEY(mestre),
    CONSTRAINT fk_chef FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Especialidades do chef
CREATE TABLE especialidades(
    chef VARCHAR(50) NOT NULL,
    especialidade VARCHAR(70) NOT NULL,
    CONSTRAINT pk_especialidades PRIMARY KEY(chef, especialidade),
    CONSTRAINT fk_especialidades FOREIGN KEY(chef)
        REFERENCES chef(mestre)
        ON DELETE CASCADE
);

-- Faxineiro
CREATE TABLE faxineiro(
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_faxineiro PRIMARY KEY(mestre),
    CONSTRAINT fk_faxineiro FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Farmaceutico
CREATE TABLE farmaceutico(
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_farmaceutico PRIMARY KEY(mestre),
    CONSTRAINT fk_farmaceutico FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Classes
CREATE TABLE classes(
    mestre VARCHAR(50) NOT NULL,
    classe VARCHAR(15) NOT NULL,
    CONSTRAINT pk_classes PRIMARY KEY(mestre, classe),
    CONSTRAINT fk_classes FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE,
    CONSTRAINT check_classe 
        CHECK(UPPER(classe) IN ('COORDENADOR', 'PROFESSOR', 'CHEF', 'FAXINEIRO', 'FARMACEUTICO'))
);

-- Tutorial
CREATE TABLE tutorial(
    id SERIAL NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    data TIMESTAMP NOT NULL,
    tema VARCHAR(100),
    categoria VARCHAR(15) NOT NULL,
    nota NUMERIC(3, 1),
    CONSTRAINT pk_tutorial PRIMARY KEY(id),
    CONSTRAINT sk_tutorial UNIQUE(titulo, data),
    CONSTRAINT check_categoria 
        CHECK(UPPER(categoria) IN ('VIDEOAULA', 'RECEITA', 'TECNICALIMPEZA', 'ASSISTENCIA'))
);

-- Video aula
CREATE TABLE videoaula(
    tutorial INTEGER NOT NULL,
    assunto VARCHAR(100),
    disciplina VARCHAR(100),
    professor VARCHAR(50) NOT NULL,
    CONSTRAINT pk_videoaula PRIMARY KEY(tutorial),
    CONSTRAINT fk_videoaula_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_videoaula_professor FOREIGN KEY(professor)
        REFERENCES professor(mestre)
        ON DELETE CASCADE
);

-- Materias da video aula
CREATE TABLE materiais(
    videoaula INTEGER NOT NULL,
    material VARCHAR(100) NOT NULL,
    CONSTRAINT pk_materiais PRIMARY KEY(videoaula, material),
    CONSTRAINT fk_materiais FOREIGN KEY(videoaula)
        REFERENCES videoaula(tutorial)
        ON DELETE CASCADE
);

-- Receita
CREATE TABLE receita(
    tutorial INTEGER NOT NULL,
    numPorcoes INTEGER CHECK(numPorcoes > 0),
    calorias INTEGER CHECK(calorias > 0),
    chef VARCHAR(50) NOT NULL,
    CONSTRAINT pk_receita PRIMARY KEY(tutorial),
    CONSTRAINT fk_receita_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_receita_chef FOREIGN KEY(chef)
        REFERENCES chef(mestre)
        ON DELETE CASCADE
);

-- Ingredientes da receita
CREATE TABLE ingredientes(
    receita INTEGER NOT NULL,
    ingrediente VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ingredientes PRIMARY KEY(receita, ingrediente),
    CONSTRAINT fk_ingredientes FOREIGN KEY(receita)
        REFERENCES receita(tutorial)
        ON DELETE CASCADE
);

-- Tecnica de Limpeza
CREATE TABLE tecnicaLimpeza(
    tutorial INTEGER NOT NULL,
    faxineiro VARCHAR(50) NOT NULL,
    CONSTRAINT pk_tecnicaLimpeza PRIMARY KEY(tutorial),
    CONSTRAINT fk_tecnicaLimpeza_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_tecnicaLimpeza_faxineiro FOREIGN KEY(faxineiro)
        REFERENCES faxineiro(mestre)
        ON DELETE CASCADE
);

-- Lista de produtos para limpeza
CREATE TABLE produtos(
    tecnicaLimpeza INTEGER NOT NULL,
    produto VARCHAR(100) NOT NULL,
    CONSTRAINT pk_produtos PRIMARY KEY(tecnicaLimpeza, produto),
    CONSTRAINT fk_produtos FOREIGN KEY(tecnicaLimpeza)
        REFERENCES tecnicaLimpeza(tutorial)
        ON DELETE CASCADE
);

-- Assistencia
CREATE TABLE assistencia(
    tutorial INTEGER NOT NULL,
    farmaceutico VARCHAR(50) NOT NULL,
    CONSTRAINT pk_assistencia PRIMARY KEY(tutorial),
    CONSTRAINT fk_assistencia_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_assistencia_farmaceutico FOREIGN KEY(farmaceutico)
        REFERENCES farmaceutico(mestre)
        ON DELETE CASCADE
);

-- Lista de remedios
CREATE TABLE remedios(
    assistencia INTEGER NOT NULL,
    remedio VARCHAR(100) NOT NULL,
    CONSTRAINT pk_remedios PRIMARY KEY(assistencia, remedio),
    CONSTRAINT fk_remedios FOREIGN KEY(assistencia)
        REFERENCES assistencia(tutorial)
        ON DELETE CASCADE
);

-- Seguir
CREATE TABLE seguir(
    universitario VARCHAR(50) NOT NULL,
    mestre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_seguir PRIMARY KEY(universitario, mestre),
    CONSTRAINT fk_seguir_universitario FOREIGN KEY(universitario)
        REFERENCES universitario(email)
        ON DELETE CASCADE,
    CONSTRAINT fk_seguir_mestre FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE CASCADE
);

-- Avaliar
CREATE TABLE avaliar(
    tutorial INTEGER NOT NULL,
    universitario VARCHAR(50) NOT NULL,
    nota INTEGER NOT NULL,
    CONSTRAINT pk_avaliar PRIMARY KEY(tutorial, universitario),
    CONSTRAINT pk_avaliar_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE,
    CONSTRAINT pk_avaliar_universitario FOREIGN KEY(universitario)
        REFERENCES universitario(email)
        ON DELETE CASCADE,
    CONSTRAINT check_5_star CHECK(nota > 0 AND nota <= 5)
);

-- Recomendar
CREATE TABLE recomendar(
    recomenda VARCHAR(50) NOT NULL,
    recebe VARCHAR(50) NOT NULL,
    tutorial INTEGER NOT NULL,
    CONSTRAINT pk_recomendar PRIMARY KEY(recomenda, recebe, tutorial),
    CONSTRAINT fk_recomendar_recomenda FOREIGN KEY(recomenda)
        REFERENCES universitario(email)
        ON DELETE CASCADE,
    CONSTRAINT fk_recomendar_recebe FOREIGN KEY(recebe)
        REFERENCES universitario(email)
        ON DELETE CASCADE,
    CONSTRAINT fk_recomendar_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE
);

-- Comentario
CREATE TABLE comentario(
    universitario VARCHAR(50) NOT NULL,
    tutorial INTEGER NOT NULL,
    data TIMESTAMP NOT NULL,
    texto VARCHAR(200) NOT NULL,
    CONSTRAINT pk_comentario PRIMARY KEY(universitario, tutorial, data),
    CONSTRAINT fk_comentario_universitario FOREIGN KEY(universitario)
        REFERENCES universitario(email)
        ON DELETE CASCADE,
    CONSTRAINT fk_comentario_tutorial FOREIGN KEY(tutorial)
        REFERENCES tutorial(id)
        ON DELETE CASCADE
);

-- Solicitacao
CREATE TABLE solicitacao(
    universitario VARCHAR(50) NOT NULL,
    coordenador VARCHAR(50) NOT NULL,
    data TIMESTAMP NOT NULL,
    mestre VARCHAR(50),
    texto VARCHAR(200) NOT NULL,
    CONSTRAINT pk_solicitacao PRIMARY KEY(universitario, coordenador, data),
    CONSTRAINT fk_solicitacao_universitario FOREIGN KEY(universitario)
        REFERENCES universitario(email)
        ON DELETE SET NULL,
    CONSTRAINT fk_solicitacao_coordenador FOREIGN KEY(coordenador)
        REFERENCES coordenador(mestre)
        ON DELETE SET NULL,
    CONSTRAINT fk_solicitacao_mestre FOREIGN KEY(mestre)
        REFERENCES mestre(email)
        ON DELETE SET NULL
);

-- Trigger checar período do termo do coordenador
CREATE FUNCTION check_termo_overlap() RETURNS trigger AS
$BODY$
DECLARE
	d record;
BEGIN
	FOR d IN SELECT iniVigencia, fimVigencia FROM termo
	WHERE classe = NEW.classe
  	LOOP
	IF ((NEW.iniVigencia >= d.iniVigencia AND NEW.iniVigencia < d.fimVigencia) OR
        (NEW.fimVigencia > d.iniVigencia AND NEW.fimVigencia <= d.fimVigencia)) THEN 
			raise exception 'Já existe um coordenador dessa classe coordenando nesse período!';
	END IF;
  	END LOOP;
	RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER termo_overlap
BEFORE INSERT
ON termo
FOR EACH ROW
EXECUTE PROCEDURE check_termo_overlap();