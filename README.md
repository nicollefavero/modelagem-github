# Modelagem do GitHub

Trabalho final da disciplina de Fundamentos de Banco de Dados.

### Objetivo
Modelar o universo de discurso do GitHub e, a partir da modelagem, implementar o projeto lógico e físico.


### Roadmap

- [X] Ligar a entidade REPOSITORY à LANGUAGES?
- [X] FILES.Tipo pode ser .sql, .json, .py ou a palavra "diretório"?
- [X] Colocar TIPO (de FILES) uma entidade pré-definida?
- [ ] Falta colocar a cardinalidade em REPOSITORY -> LICENSE.
- [ ] Ver as coisas do marketplace e colocar a parte dos APPS em ORGS.
- [ ] Revisar os nomes dos relacionamentos.
- [ ] Acrescentar papéis.
- [ ] Trocar o relacionamento REPOSITORY -> CONTEM -> FILES para REPOSITORY -> COMMIT -> FILES??
- [X] O que é TOPICS IN REPOSITORY?

Com base na descrição do UdD, analisar:
- [ ] Relacionamento Possui (User/Repository): CreationDate deve migrar para Repository?
- [ ] Relacionamento Fork: O relacionamento Contribui já não abstrai o conceito do Fork?
- [ ] Relacionamento Follow: Ele representa uma ação realizada pelo Contributor. Auto-relacionamento.
- [ ] Nossa intenção é representar um "print" do repositório ou alguma hierarquia, juntamente com a representação de Branch?
- [ ] Com base do questionamento de cima, o relacionamento de Contribui e Issues são feitos no repositório e ou em arquivos do repositório?
- [ ] Relacionamento 'Star' -> (0,1) ?


### Perguntar para a professora
- [ ] REPOSITORY -> create -> USER???
- [ ] Files/Folders -> Languages/Type???