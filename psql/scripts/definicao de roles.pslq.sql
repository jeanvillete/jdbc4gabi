/*
* Nota 1: Depois da criação de cada role, você pode verificar como as roles estão armazenadas no banco de dados usando um dos dois comandos (comando após cerquilha/jogo da velha);
* # \du
* # select * from pg_roles;
* 
* Nota 2: Quando quiser sair do programa psql, o comando é;
* # \q
*
* Nota 3: Quando dentro de uma sessão com o psql, se quiser trocar de banco de dados (change database) use um dos comandos;
* # \c meubancodedados
* # \connect meubancodedados
* 
* Nota 4: Para abrir uma sessão com psql, digite o comando a seguir e então pressione o Enter, após você será questionado sobre a senha em questão;
*   psql -d meubancodedados -U meuusuario
* 
* Nota 5: Quando conectado com um usuário que herda atributos de outro, e tiver a necessidade de utilizar a um privilégio da role pai, deve-se carregar temporariamente a role desejada com;
* # SET ROLE minharole;
* e.g: # SET ROLE admin;
* ... pra abandonar esta role temporaria;
* # RESET ROLE;
*
* Nota 6: Pra listar as tabelas existentes via psql, digite um dos dois comandos;
* # \dt
* # \d
*
* Nota 7: Para ver detalhes da estrutura de uma tabela;
* # \d nometabela;
* 
* Nota 8: Para ver as bases de dados disponíveis para o usuário corrente;
* # \l
*/

/*
* Definição role admin, com direitos de criação de bases de dados, criação de novas roles e replicação, mas não pode fazer LOGIN com este.
* Lembrando que esta é a definição de uma role e não um usuário de fato. A role neste sentindo é a definição de direitos para um grupo, onde o meu usuário em um segundo momento será inserido no grupo.
*/
CREATE ROLE admin NOSUPERUSER CREATEDB CREATEROLE CREATEUSER NOLOGIN REPLICATION NOINHERIT;

/*
* Criação do meu usuário, que antes de mais nada tenha permissão de fazer login.
* Neste momento já defino o meu password, uma vez que vou precisar deste na hora de efetuar login.
*/
CREATE ROLE jean LOGIN ENCRYPTED PASSWORD 'jbadm6711269' INHERIT;

/*
* Definição de grant (privilégios) de criação de bancos de dados e criação de novas roles, uma vez que vou associar meu usuário (role jean) ao grupo (role) admin.
* Até este momento, se eu tentar fazer login com meu usuário, eu consigo, mas não consigo fazer as operações que desejos por momento, como criar uma base de dados, mas depois do comando abaixo eu poderei.
*/
GRANT admin TO jean;
