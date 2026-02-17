-- Extensão de criptografia
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Altera locale
ALTER DATABASE hogwartsdb SET lc_time = 'pt_BR.UTF-8';

-- Tabelas
CREATE TABLE administrador(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(70),
    email VARCHAR(60) UNIQUE NOT NULL CHECK (email ~ '^[a-z]+\.[a-z]+@hogwarts.com$'),
    senha CHAR(64) NOT NULL
);

CREATE TABLE professor(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(70),
    usuario VARCHAR(50) UNIQUE CHECK (usuario ~ '^[a-z]+\.[a-z]+$'),
    senha CHAR(64)
);

CREATE TABLE disciplina(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cod_professor INT REFERENCES professor (id)
);

CREATE TABLE casa_hogwarts(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    pontuacao INT,
    cod_professor INT REFERENCES professor (id)
);

CREATE TABLE aluno(
    matricula INT GENERATED ALWAYS AS IDENTITY
        (START WITH 10000 INCREMENT BY 1) PRIMARY KEY,
    nome VARCHAR(70),
    cpf CHAR(14) NOT NULL UNIQUE CHECK (cpf ~ '^\d{3}\.\d{3}\.\d{3}\-\d{2}$'),
    email VARCHAR(50) UNIQUE NOT NULL CHECK (email ~ '^[a-z]+\.[a-z]+@hogwarts.com$'),
    senha CHAR(64),
    cod_casa INT REFERENCES casa_hogwarts (id)
);

CREATE TABLE observacao(
    id SERIAL PRIMARY KEY,
    observacao TEXT NOT NULL,
    cod_aluno INT REFERENCES aluno (matricula),
    cod_disciplina INT REFERENCES disciplina (id)
);

CREATE TABLE nota(
    id SERIAL PRIMARY KEY,
    nota_um NUMERIC(10,2) NOT NULL,
    nota_dois NUMERIC(10,2) DEFAULT 0,
    cod_aluno INT REFERENCES aluno (matricula),
    cod_disciplina INT REFERENCES disciplina (id)
);
