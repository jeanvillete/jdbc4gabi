/* 
* $psql -d db4app -U jean
*/
SET ROLE estadocidade_usr;

/*
* O usuário/role 'estadocidade_app' deve ter privilégios de acesso para a aplicação que estará em execução. Este usuário não pode ter privilégios de DDL, mas apenas de DML.
* Para isto, definimos grants e synonyms para este usuário.
* GRANTS se refere ao privilégio dado ao usuário/role 'estadocidade_app' para acesso aos objetos do schema (e owner) 'estadocidade_usr'.
*/

/*
* GRANT para uso/referencia a partir do 'estadocidade_app' ao schema 'estadocidade_schm'.
*/
GRANT USAGE ON SCHEMA estadocidade_schm TO estadocidade_app;

/*
* GRANTS
* Sequences estado_seq e cidade_seq
*/
GRANT USAGE ON estadocidade_schm.estado_seq TO estadocidade_app;
GRANT USAGE ON estadocidade_schm.cidade_seq TO estadocidade_app;

/*
* GRANTS
* Tabelas estado e cidade
*/
GRANT SELECT, INSERT, UPDATE, DELETE ON estadocidade_schm.estado TO estadocidade_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON estadocidade_schm.cidade TO estadocidade_app;

/*
* $postgres# \q
*/
