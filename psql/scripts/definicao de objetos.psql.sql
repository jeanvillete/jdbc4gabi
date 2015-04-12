/* $psql -d template1 -U jean */
SET ROLE admin;

/*
* Criação da base de dados (instância de base de dados).
* É facultativo a definição de uma base de dados para cada aplicação, ou seja, com SGDBs como Oracle e Postgres onde a definição de SCHEMAS é forte e seguro, pode-se criar apenas uma base de dados, e para cada aplicação, definir seus objetos como tabelas, etc, dentro dos schemas, sem a necessidade de ter uma base de dados para cada aplicação.
* A idéia então seria, definir uma única base de dados para aplicações (poderíamos definir categorias de bases de dados) e nesta base de dados, subdividir SCHEMAS como agrupadores de objetos específicos para cada aplicação. Assim uma aplicação com seu usuário específico pode ser owner de um SCHEMA específico, dando a idéia que aquele SCHEMA é um escopo bem definido de base de dados para a aplicação em questão.
* Não há impedimento de se fazer como SGDBs como SQLServer ou MySQL, onde cada aplicação deve ter sua própria base de dados, mas no Oracle ou Postgres, seria quase um disperdicio de recurso, uma vez que a definição de SCHEMAS para estes casos seria irrelevante.
*/
CREATE DATABASE db4app WITH OWNER admin;

/*
* CREATE: For databases, allows new schemas to be created within the database.
*/
REVOKE CREATE ON DATABASE db4app FROM public;

RESET ROLE;

/*
* $postgres# \q
*/
