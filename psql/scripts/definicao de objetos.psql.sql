/*
* $psql -d template1 -U jean

-->A criação de um banco de dados no PostgreSQL é um pouco diferente dos outros SGBDs conhecidos.
Quando criamos um novo banco o que estamos fazendo na realidade é uma cópia da estrutura de um outro banco.
Na instalação do PostgreSQL ele traz dois bancos templates, template0 que é o banco "vazio", ou seja, com a estrutura mais básica
e o template1 que traz consigo todas as opções que foram escolhidas no momento da instalação do PostgreSQL.
*/

SET ROLE admin;

/*
* Criação da base de dados (instância de base de dados).
* É facultativo a definição de uma base de dados para cada aplicação, ou seja, com SGDBs (RDBMS) como Oracle e Postgres onde a definição de SCHEMAS é forte e seguro, pode-se criar apenas uma base de dados, e para cada aplicação, definir seus objetos como tabelas, etc, dentro dos schemas, sem a necessidade de ter uma base de dados para cada aplicação.
* A idéia então seria, definir uma única base de dados para aplicações (poderíamos definir categorias de bases de dados) e nesta base de dados, subdividir SCHEMAS como agrupadores de objetos específicos para cada aplicação. Assim uma aplicação com seu usuário específico pode ser owner de um SCHEMA específico, dando a idéia que aquele SCHEMA é um escopo bem definido de base de dados para a aplicação em questão.
* Não há impedimento nenhum de se fazer como SGDBs SQLServer ou MySQL fazem, onde cada aplicação deve ter sua própria base de dados, mas no Oracle ou Postgres, seria quase um disperdício de recurso, uma vez que a definição de SCHEMAS para estes casos seria irrelevante.
*/
CREATE DATABASE db4app WITH OWNER admin;
/*
* Eu criei a base de dados db4app com o owner setado para a role 'admin', para permitir que os usuários que herdam as propriedades da role 'admin', possam facilmente gerenciar esta base de dados realmente com a idéia de admin, ou seja, auxiliar com outros usuários com permissões menores.
*/

/*
* A revogação de privilégios abaixo, é para não permitir que schemas sejam criadas por usuários com permissões menores.
* Apenas usuários que herdam de admin poderão fazê-lo (uma vez que admin é o owner da base de dados).
*
* REVOKE CREATE: For databases, allows new schemas to be created within the database.
*/
REVOKE CREATE ON DATABASE db4app FROM public;

RESET ROLE;

/*
* $postgres# \q
*/
