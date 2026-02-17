# Sistema de Gestão da Escola de Magia e Bruxaria de Hogwarts

---

Este projeto contém o schema para criação e populamento de um **banco de dados PostgreSQL** que gerencia Hogwarts, alunos, professores, notas e observações. Também possui as views necessárias para o funcionamento e um dataload simples para primeiras consultas.

---

## Estrutura do Banco

O banco é composto pelas seguintes **tabelas**:
| **Tabela** | **Descrição** |
|---|---|
|`administrador`|SuperADM que gerencia o banco com permissões extra.|
|`disciplina`|Matérias da escola.|
|`professor`|Professores com cargos e vinculação escola (como os diretores da casa).|
|`casa_hogwarts`|Representa as quatro casas de Hogwarts.|
|`aluno`|Alunos inscritos na escola.|
|`observacao`|Texto especial de professores para alunos.|
|`nota`|Notas em cada matéria|