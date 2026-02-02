-- Extensão de criptografia
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Altera locale
ALTER DATABASE hogwartsdb SET lc_time = 'pt_BR.UTF-8';

-- Tabelas
CREATE TABLE administrador(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(70),
    email VARCHAR(60) UNIQUE NOT NULL,
    senha CHAR(64) NOT NULL
);

CREATE TABLE disciplina(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE professor(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(70),
    usuario VARCHAR(50) UNIQUE CHECK (usuario ~ '^[a-z]\.[a-z]'),
    senha CHAR(64),
    cod_disciplina INT REFERENCES disciplina (id)
);

CREATE TABLE casa_hogwarts(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    pontuacao INT,
    cod_professor REFERENCES professor (id)
);

CREATE TABLE aluno(
    matricula INT PRIMARY KEY,
    nome VARCHAR(70),
    cpf CHAR(14) NOT NULL UNIQUE CHECK (cpf ~ '^\d{3}\.\d{3}\.\d{3}\-\d{2}$'),
    email VARCHAR(50) UNIQUE NOT NULL,
    senha CHAR(64),
    cod_casa INT REFERENCES casa_hogwarts (id)
);

CREATE TABLE observacao(
    id SERIAL PRIMARY KEY,
    observacao TEXT NOT NULL,
    cod_aluno INT REFERENCES aluno (id),
    cod_disciplina INT REFERENCES disciplina (id)
);

CREATE TABLE nota(
    id SERIAL PRIMARY KEY,
    nota NUMERIC(10,2) NOT NULL,
    cod_aluno INT REFERENCES aluno (id),
    cod_disciplina INT REFERENCES disciplina (id)
);

-- Altera a matrícula para começar do 10000
SELECT 