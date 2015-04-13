/* 
* $psql -d db4app -U jean
*/

SET ROLE admin;

/*
* Criação do usuário para aplicação, com direitos de DML e DDL (gerenciar dados e a estrutura) para base de dados.
*/
CREATE ROLE estadocidade_usr WITH LOGIN ENCRYPTED PASSWORD 'estadocidade_pw' INHERIT IN ROLE application ROLE admin;

/*
* Criação do usuário para aplicação em execução, que terá apenas direitos de DML.
*/
CREATE ROLE estadocidade_app WITH LOGIN ENCRYPTED PASSWORD 'estadocidade_app_pw' INHERIT IN ROLE application ROLE admin;

/*
* Na definição/criação das roles acima, fornecemos os parâmetros 'IN ROLE' e também apenas 'ROLE';
* IN ROLE: significa que a role corrente, sendo criada está no grupo da role em questão, ou seja, herda as definições da role/grupo, no caso, application.
* ROLE: significa que a role corrente, que está sendo criada é pai da role fornecida, no caso, admin. Isto permite que 'admin' seja um membro da role que está sendo criada. Como definimos que 'admin' é uma role que não herda de uma role pai (NOINHERIT) isto significa que os usuários que herdam de 'admin' poderão gerenciar a role em questão, pois novamente, ela é membro de (member of) de 'admin'.
* 
* Esta ultima é confusa mas mandatória, uma vez que definimos a base de dados 'db4app' com o owner 'admin', então só admin pode criar SCHEMAS dentro desta base, e para criar um SCHEMA com um owner específico, precisamos que o usuário logado na sessão seja um membro (member of) do owner do SCHEMA.
*/

/*
* $postgres# \q
*/
