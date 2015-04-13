/* 
* $psql -d db4app -U jean
*/

/*
* Criação do schema.
* Por questões de facilidades e clareza, o schema PODERIA corresponder exatamente ao nome do usuário em questão.
*/
\c db4app;
CREATE SCHEMA estadocidade_schm AUTHORIZATION estadocidade_usr;
/*
* Existe a possibilidade da definição do nome do schema de outras maneiras; http://www.postgresql.org/docs/9.4/static/sql-createschema.html
* e.g: CREATE SCHEMA AUTHORIZATION estadocidade_usr;
*/

SET ROLE estadocidade_usr;
/*
* Note que continuamos com a sessão aberta com o usuário 'jean', porém como participamos do grupo 'admin', e este por sua vez pode administrar a role 'estadocidade_usr', então, indiretamente podemos administrar esta role também a partir de 'jean', com o comando acima carregaremos o perfil que nos permite administrar todos os objetos do schema 'estadocidade_usr'.
*/

/*
* Criação de sequences.
* http://www.postgresql.org/docs/9.4/static/sql-createsequence.html
*/
/* estado */
CREATE SEQUENCE estadocidade_schm.estado_seq
INCREMENT BY 1
MINVALUE 1
START WITH 1;

/* cidade */
CREATE SEQUENCE estadocidade_schm.cidade_seq
INCREMENT BY 1
MINVALUE 1
START WITH 1;

/*
* Criação de tabelas
*/
/* estado */
CREATE TABLE estadocidade_schm.estado (
  estado_id INT NOT NULL PRIMARY KEY DEFAULT nextval('estadocidade_schm.estado_seq'),
  nome VARCHAR(255) NOT NULL CHECK (nome <> ''),
  uf CHAR(2) NOT NULL CHECK (uf <> '')
);

/* cidade */
CREATE TABLE estadocidade_schm.cidade (
  cidade_id INT NOT NULL PRIMARY KEY DEFAULT nextval('estadocidade_schm.cidade_seq'),
  nome VARCHAR(255) NOT NULL CHECK (nome <> ''),
  estado_id INT REFERENCES estadocidade_schm.estado(estado_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

/*
* Definindo quem são os owners das sequences criadas.
*/
/* estado */
ALTER SEQUENCE estadocidade_schm.estado_seq OWNED BY estadocidade_schm.estado.estado_id;
/* cidade */
ALTER SEQUENCE estadocidade_schm.cidade_seq OWNED BY estadocidade_schm.cidade.cidade_id;

/*
* Nota: Da maneira como estruturamos a base, os objetos pertencem ao schema estadocidade_schm, mas nós conseguimos administrar este schema quando com uma sessão aberta através do usuário 'jean', uma vez que podemos executar as seguintes atribuições (carregamento de privilégios);
* #SET ROLE admin;
* #SET ROLE estadocidade_usr;
* ... e a partir deste ponto, conseguiriamos fazer qualquer coisa no schema estadocidade_schm.
*/

/*
* $postgres# \q
*/
