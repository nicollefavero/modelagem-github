# Modelagem do GitHub

Trabalho final da disciplina de Fundamentos de Banco de Dados.

### Objetivo
Modelar o universo de discurso do GitHub e, a partir da modelagem, implementar o projeto lógico e físico.


### Roadmap

#### Universo de Discurso - Nicolle
- [ ] Acrescentar uma imagem do octocat
- [X] Acrescentar prints do GitHub
- [X] Dizer que email e nickname são únicos
- [X] Especificar de que modo as informações armazenadas são usadas na timeline e na timeline de quem.
- [X] Acrescentar print da timeline para facilitar o entendimento.
- [X] Explicar o que é terminação
- [X] Acrescentar conteúdo (atributo ou relacionamento?) aos Arquivos.
- [X] Ressaltar que um item do tipo pasta sempre deverá conter algum outro item, no mínimo um arquivo.
- [X] Acrescentar que 1 contribuidor pode commit 1 item (1,n) em 1 repositório. (duvida da sora na modelagem)

##### Dúvidas para perguntar para a sora
- [ ] Qual a dúvida dela sobre o commit e a relação dos itens com o repositório.

#### Github Modelagem - Matheus
- [X] Acrescentar o (t,e) na especificação da entidade User
- [X] Acrescentar atributo text no relacionamento comment.
- [X] Confirmar que Folder <- save (1,n) -> Item
- [X] Acrescentar o atributo descrição opcional no Repository

##### Dúvidas para perguntar para a sora
- [ ] Perguntar o que ela quis dizer com o hashcode
- [ ] Perguntar sobre o relacionamento ternário Commit.

#### Regras de Mapeamento - Matheus & Nicolle
- [X] Revisar junto
- [ ] Ir call com a sora dia 05/11

##### Dúvidas para perguntar para a sora
- [ ] Fazer 3 tabelas (User, Contributor, Organization) X fazer apenas tabela User com atributo "type"?? Optamos pela primeira por que não sabíamos como garantir na tabela Membros que o primeiro id seria de Org e o segundo id seria de Contributor na segunda opção.

#### Dicionário de Dados
- [X] Acrescentar os novos atributos da modelagem

#### Tabelas SQL
- [ ] Modificar as tabelas conforme as novas regras de mapeamento
- [ ] Adicionar os novos atributos


#### Implementação

- [X] Modelagem Conceitual
- [X] Projeto Lógico
- [ ] Correção da Modelagem Conceitual
- [ ] Correção do Projeto Lógico
- [ ] Projeto Físico


