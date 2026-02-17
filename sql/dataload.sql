INSERT INTO administrador (nome, email, senha)
VALUES ('Alvo Dumbledore', 'alvo.dumbledore@hogwarts.com', encode(digest('123', 'sha256'), 'hex'));

INSERT INTO professor (nome, usuario, senha) VALUES
('Minerva McGonagall', 'minerva.mcgonagall', encode(digest('123', 'sha256'), 'hex')),
('Severus Snape', 'severus.snape', encode(digest('123', 'sha256'), 'hex')),
('Pomona Sprout', 'pomona.sprout', encode(digest('123', 'sha256'), 'hex')),
('Filius Flitwick', 'filius.flitwick', encode(digest('123', 'sha256'), 'hex')),
('Rubeus Hagrid', 'rubeus.hagrid', encode(digest('123', 'sha256'), 'hex')),
('Sybill Trelawney', 'sybill.trelawney', encode(digest('123', 'sha256'), 'hex')),
('Rolanda Hooch', 'rolanda.hooch', encode(digest('123', 'sha256'), 'hex')),
('Remus Lupin', 'remus.lupin', encode(digest('123', 'sha256'), 'hex')),
('Gilderoy Lockhart', 'gilderoy.lockhart', encode(digest('123', 'sha256'), 'hex')),
('Marcelo Bixo', 'marcelo.bixo', encode(digest('123', 'sha256'), 'hex'));

INSERT INTO disciplina (nome, cod_professor) VALUES
('Transfiguração', (SELECT id FROM professor WHERE usuario='minerva.mcgonagall')),
('Poções', (SELECT id FROM professor WHERE usuario='severus.snape')),
('Herbologia', (SELECT id FROM professor WHERE usuario='pomona.sprout')),
('Feitiços', (SELECT id FROM professor WHERE usuario='filius.flitwick')),
('Trato das Criaturas Mágicas', (SELECT id FROM professor WHERE usuario='rubeus.hagrid')),
('Adivinhação', (SELECT id FROM professor WHERE usuario='sybill.trelawney')),
('Voo', (SELECT id FROM professor WHERE usuario='rolanda.hooch')),
('Defesa Contra as Artes das Trevas', (SELECT id FROM professor WHERE usuario='remus.lupin')),
('Celebridades Mágicas', (SELECT id FROM professor WHERE usuario='gilderoy.lockhart')),
('Bixos e Monstros', (SELECT id FROM professor WHERE usuario='marcelo.bixo'));

INSERT INTO casa_hogwarts (nome, pontuacao, cod_professor) VALUES
('Grifinória', 0, (SELECT id FROM professor WHERE usuario='minerva.mcgonagall')),
('Sonserina', 0, (SELECT id FROM professor WHERE usuario='marcelo.bixo')),
('Lufa-Lufa', 0, (SELECT id FROM professor WHERE usuario='pomona.sprout')),
('Corvinal', 0, (SELECT id FROM professor WHERE usuario='filius.flitwick'));

-- GRIFINÓRIA
INSERT INTO aluno (nome, cpf, email, senha, cod_casa) VALUES
('Harry Potter',       '100.000.000-01', 'harry.potter@hogwarts.com',       encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Hermione Granger',   '100.000.000-02', 'hermione.granger@hogwarts.com',   encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Ron Weasley',        '100.000.000-03', 'ron.weasley@hogwarts.com',        encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Neville Longbottom', '100.000.000-04', 'neville.longbottom@hogwarts.com', encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Ginny Weasley',      '100.000.000-05', 'ginny.weasley@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Dean Thomas',        '100.000.000-06', 'dean.thomas@hogwarts.com',        encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Seamus Finnigan',    '100.000.000-07', 'seamus.finnigan@hogwarts.com',    encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória')),
('Parvati Patil',      '100.000.000-08', 'parvati.patil@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Grifinória'));

-- SONSERINA
INSERT INTO aluno (nome, cpf, email, senha, cod_casa) VALUES
('Draco Malfoy',       '100.000.000-09', 'draco.malfoy@hogwarts.com',       encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Pansy Parkinson',    '100.000.000-10', 'pansy.parkinson@hogwarts.com',    encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Blaise Zabini',      '100.000.000-11', 'blaise.zabini@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Theodore Nott',      '100.000.000-12', 'theodore.nott@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Vincent Crabbe',     '100.000.000-13', 'vincent.crabbe@hogwarts.com',     encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Gregory Goyle',      '100.000.000-14', 'gregory.goyle@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Millicent Bulstrode','100.000.000-15', 'millicent.bulstrode@hogwarts.com',encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina')),
('Daphne Greengrass',  '100.000.000-16', 'daphne.greengrass@hogwarts.com',  encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Sonserina'));

-- LUFA-LUFA
INSERT INTO aluno (nome, cpf, email, senha, cod_casa) VALUES
('Cedric Diggory',     '100.000.000-17', 'cedric.diggory@hogwarts.com',     encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Nymphadora Tonks',   '100.000.000-18', 'nymphadora.tonks@hogwarts.com',   encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Hannah Abbott',      '100.000.000-19', 'hannah.abbott@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Susan Bones',        '100.000.000-20', 'susan.bones@hogwarts.com',        encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Ernie Macmillan',    '100.000.000-21', 'ernie.macmillan@hogwarts.com',    encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Justin Finch-Fletchley','100.000.000-22','justin.finchfletchley@hogwarts.com', encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Zacharias Smith',    '100.000.000-23', 'zacharias.smith@hogwarts.com',    encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa')),
('Leanne',             '100.000.000-24', 'leanne.lufa@hogwarts.com',         encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Lufa-Lufa'));

-- CORVINAL
INSERT INTO aluno (nome, cpf, email, senha, cod_casa) VALUES
('Luna Lovegood',      '100.000.000-25', 'luna.lovegood@hogwarts.com',      encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Cho Chang',          '100.000.000-26', 'cho.chang@hogwarts.com',          encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Padma Patil',        '100.000.000-27', 'padma.patil@hogwarts.com',        encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Terry Boot',         '100.000.000-28', 'terry.boot@hogwarts.com',         encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Michael Corner',     '100.000.000-29', 'michael.corner@hogwarts.com',     encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Anthony Goldstein',  '100.000.000-30', 'anthony.goldstein@hogwarts.com',  encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Marietta Edgecombe', '100.000.000-31', 'marietta.edgecombe@hogwarts.com', encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal')),
('Roger Davies',       '100.000.000-32', 'roger.davies@hogwarts.com',       encode(digest('123', 'sha256'), 'hex'), (SELECT id FROM casa_hogwarts WHERE nome='Corvinal'));

INSERT INTO observacao (observacao, cod_aluno, cod_disciplina) VALUES
('Participação excelente em aula.', (SELECT matricula FROM aluno WHERE email='hermione.granger@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Feitiços')),
('Precisa revisar movimentos de varinha.', (SELECT matricula FROM aluno WHERE email='ron.weasley@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Transfiguração')),
('Evolução consistente ao longo do bimestre.', (SELECT matricula FROM aluno WHERE email='harry.potter@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Defesa Contra as Artes das Trevas')),
('Atenção aos detalhes em preparo de poções.', (SELECT matricula FROM aluno WHERE email='draco.malfoy@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Poções')),
('Boa curiosidade e perguntas relevantes.', (SELECT matricula FROM aluno WHERE email='luna.lovegood@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Bixos e Monstros')),
('Faltas impactaram o desempenho.', (SELECT matricula FROM aluno WHERE email='seamus.finnigan@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Transfiguração')),
('Ótima prática em campo.', (SELECT matricula FROM aluno WHERE email='cedric.diggory@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Voo')),
('Precisa melhorar organização do material.', (SELECT matricula FROM aluno WHERE email='cho.chang@hogwarts.com'), (SELECT id FROM disciplina WHERE nome='Feitiços'));

INSERT INTO nota (nota_um, nota_dois, cod_aluno, cod_disciplina)
SELECT
    0.00::numeric(10,2) AS nota_um,
    0.00::numeric(10,2) AS nota_dois,
    a.matricula,
    d.id
FROM aluno a
CROSS JOIN disciplina d
ORDER BY a.matricula, d.id;