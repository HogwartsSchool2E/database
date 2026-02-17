-- Alunos com maior nota
CREATE VIEW ranking_util AS
SELECT a.nome as "aluno", (COALESCE(n.nota_um, 0) + COALESCE(n.nota_dois, 0)) / 2 as media
FROM aluno a
         JOIN nota n on n.cod_aluno = a.matricula
         JOIN disciplina d on d.id = n.cod_disciplina;

CREATE VIEW ranking AS
SELECT aluno, MAX(media) as "media"
FROM ranking_util
GROUP BY aluno
ORDER BY media DESC
LIMIT 3;

-- Quantidades de alunos
SELECT COUNT(*) FROM aluno;

-- Média das casas
CREATE VIEW media_util AS
SELECT a.nome as "aluno", c.nome as "casa_hogwarts", SUM(r.media) as media
FROM aluno a
         JOIN casa_hogwarts c on c.id = a.cod_casa
         JOIN ranking_util r on r.aluno = a.nome
GROUP BY a.nome, c.nome
ORDER BY media DESC;

CREATE VIEW casa_util AS
SELECT c.nome AS casa, count(*) AS total_registros
FROM aluno a
         JOIN nota n ON n.cod_aluno = a.matricula
         JOIN casa_hogwarts c ON a.cod_casa = c.id
GROUP BY c.nome;

CREATE VIEW media_casas AS
SELECT mu.casa_hogwarts, SUM(mu.media) / ca.total_registros as "media_casas"
FROM media_util mu
         JOIN casa_util ca ON ca.casa = mu.casa_hogwarts
group by mu.casa_hogwarts, ca.total_registros;

-- Quadro de Observações
CREATE VIEW quadro_observacoes AS
SELECT a.nome as "aluno", c.nome as "casa", p.nome as "professor", o.observacao
FROM observacao o
         JOIN aluno a ON a.matricula = o.cod_aluno
         JOIN disciplina d ON d.id = o.cod_disciplina
         JOIN professor p ON p.id = d.cod_professor
         JOIN casa_hogwarts c ON c.id = a.cod_casa;

SELECT * FROM ranking;
SELECT COUNT(*) FROM aluno;
SELECT * FROM media_casas;
SELECT * FROM quadro_observacoes;