/* 
* $psql -d db4app -U jean 
*/

SET ROLE admin;

/*
* Criação do usuário para aplicação, com direitos de DML e DDL (gerenciar dados e a estrutura) para base de dados.
*/
CREATE ROLE estadocidade_usr WITH LOGIN ENCRYPTED PASSWORD 'estadocidade_psw' INHERIT IN ROLE application ROLE admin;

/*
* Criação do usuário para aplicação em execução, que terá apenas direitos de DML.
*/
CREATE ROLE estadocidade_app WITH LOGIN ENCRYPTED PASSWORD 'estadocidade_app_psw' INHERIT IN ROLE application ROLE admin;

/*
* $postgres# \q
*/
