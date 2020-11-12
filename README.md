# Modelagem do GitHub

Trabalho final da disciplina de Fundamentos de Banco de Dados.

### Objetivo
Modelar o universo de discurso do GitHub e, a partir da modelagem, implementar o projeto lógico e físico.


### Roadmap

#### Universo de Discurso
- [X] Acrescentar prints do GitHub
- [X] Dizer que email e nickname são únicos
- [X] Especificar de que modo as informações armazenadas são usadas na timeline e na timeline de quem.
- [X] Acrescentar print da timeline para facilitar o entendimento.
- [X] Explicar o que é terminação
- [X] Acrescentar conteúdo (atributo ou relacionamento?) aos Arquivos.
- [X] Ressaltar que um item do tipo pasta sempre deverá conter algum outro item, no mínimo um arquivo.
- [X] Acrescentar que 1 contribuidor pode commit 1 item (1,n) em 1 repositório. (duvida da sora na modelagem)
- [X] Adicionar restrição do Hashcode

##### Dúvidas para perguntar para a sora
- [X] Qual a dúvida dela sobre o commit e a relação dos itens com o repositório.

#### Github Modelagem
- [X] Acrescentar o (t,e) na especificação da entidade User
- [X] Acrescentar atributo text no relacionamento comment.
- [X] Confirmar que Folder <- save (1,n) -> Item
- [X] Acrescentar o atributo descrição opcional no Repository
- [ ] Retirar restrição do Hashcode e adicionar o Dicionário de Dados e no Universo de Discurso
- [X] Acrescentar o atributo "name" na entidade Language

##### Dúvidas para perguntar para a sora
- [X] Perguntar o que ela quis dizer com o hashcode
- [X] Perguntar sobre o relacionamento ternário Commit.

#### Regras de Mapeamento
- [X] Revisar junto
- [X] Ir call com a sora dia 05/11
- [X] Retirar a tabela Openings? Por que podemos colocar a data, idRepo, idContrib, description e number na própria tabela do Issue
- [X] Colocar um print novo em Comments incluindo o novo atributo "text" em ENTIDADE ISSUE E SEUS RELACIONAMENTOS
- [X] Colocar um print novo em Files incluindo o novo atirbuto "content" em ENTIDADE LANGUAGE
- [X] Colocar um print novo em Language incluindo o atirbuto "name"
- [X] Colocar um print novo em ESTRUTURAÇÃO DO REPOSITÓRIO, trocando o nome do relacionamento save para commit e o relacionamento full-with para save como está na modelagem  

##### Dúvidas para perguntar para a sora
- [X] Fazer 3 tabelas (User, Contributor, Organization) X fazer apenas tabela User com atributo "type"?? Optamos pela primeira por que não sabíamos como garantir na tabela Membros que o primeiro id seria de Org e o segundo id seria de Contributor na segunda opção.

#### Dicionário de Dados
- [X] Acrescentar os novos atributos da modelagem
- [ ] Adicionar a restrição do Hashcode

#### Tabelas SQL
- [ ] Modificar as tabelas conforme as novas regras de mapeamento
- [ ] Adicionar os novos atributos
- [ ] Organizar o arquivo sql de criação de tabelas
- [ ] Organizar o arquivo sql de inserção de dados
- [ ] Organizar o arquivo sql de consultas de dados (10 consultas, eu acho)

#### Implementação do Projeto Físico
- [X] Escolher o SGBD
- [X] Abrir conexão com o Banco
- [ ] Implementar classes (todas???)
- [ ] Implementar as 10 consultas e ver como printar os resultados na tela

#### Outras tarefas
- [ ] Organizar as pastas com os pdfs corrigidos

### Etapas

- [X] Modelagem Conceitual
- [X] Projeto Lógico
- [ ] Correção da Modelagem Conceitual
- [ ] Correção do Projeto Lógico
- [ ] Projeto Físico


