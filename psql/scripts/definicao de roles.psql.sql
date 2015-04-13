/*
* Nota: Comandos após cerquilha (jogo da velha)
*
* Dica 1: Para abrir uma sessão com psql, digite o comando a seguir e então pressione o Enter, após você será questionado sobre a senha correspondente;
*   psql -d meubancodedados -U meuusuario
*
* Dica 2: Quando quiser sair do programa psql, o comando é;
* # \q
*
* Dica 3: Quando dentro de uma sessão com o psql, se quiser trocar de banco de dados na sessão já aberta (change database) use um dos comandos;
* # \c meubancodedados
* # \connect meubancodedados
*
* Nota 4: Pra listar as tabelas existentes via psql, digite um dos dois comandos;
* # \dt
* # \d
*
* Nota 5: Para ver detalhes da estrutura de uma tabela;
* # \d nometabela;
* 
* Nota 6: Para ver as bases de dados disponíveis para o usuário corrente;
* # \l
*
* Nota 6: Para ver quais são as grants atuais para determinada tabela;
* # \dp nometabela;
*/

/*
* Definição role admin, com direitos/privilégios de criação de bases de dados, criação de novas roles e replicação, porém sem privilégio de LOGIN com esta role.
* Lembrando que esta é a definição de uma role e não um usuário de fato. A role neste sentindo é a definição de privilégios para um grupo, onde o meu usuário (com privilégio de LOGIN) em um segundo momento será inserido neste grupo.
* http://www.postgresql.org/docs/9.4/static/sql-createrole.html
*/
CREATE ROLE admin WITH NOSUPERUSER CREATEDB CREATEROLE REPLICATION NOINHERIT NOLOGIN;

/*
* Criação do meu usuário, que antes de mais nada tenha permissão de fazer login.
* Neste momento já defino o meu password, uma vez que vou precisar deste na hora de efetuar login.
*/
CREATE ROLE jean WITH LOGIN ENCRYPTED PASSWORD 'jbadm6711269' INHERIT;

/*
* Dica 7: Depois da criação de cada role, você pode verificar como as roles estão armazenadas no banco de dados usando um dos dois comandos;
* # \du
* # select * from pg_roles;
*/

/*
* Definição de grant (privilégios) de criação de bancos de dados e criação de novas roles, uma vez que vou associar meu usuário (role jean) ao grupo/role admin.
* Até este momento, se eu tentasse fazer login com meu usuário, eu consiguiria, porém não conseguiria fazer operações como criar uma base de dados, mas depois do comando abaixo eu poderei.
*
* Nota: Isto poderia ter sido feito com 'IN ROLE admin' no comando de definição da role 'jean', mas deixei assim para mostrar uma outra maneira de atingir o mesmo objetivo. 
*/
GRANT admin TO jean;

/*
* O comando abaixo é para garantir que usuários não autorizados, não possam fazer conexão na base de dados postgres.
* Esta base de dados deve receber acesso apenas do usuário/role 'postgres', sendo este o único superuser.
* Estas definições ajudam a garantir uma certa segurança na instância da base de dados.
* Se fizessemos uma comparação com SO linux, o usuário/role 'postgres' seria como o usuário root, e a base de dados 'postgres' como o sistema principal de arquivos: i.e: os diretórios /bin, /etc, /root, entre outros que não deveriam ser expostos ordinariamente.
*/
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM public;

/*
* Neste momento não deveríamos mais usar o usuário postgres(root/superuser), mas sim passar a usar o novo usuário/role com privilégios de admin.
* Lembrando que este usuário pode até ser usado para criação de novos usuários, então deveríamos deixar usuário postgres(que é um superuser) para realização de operações realmente necessárias, o que são bastante raras.
*
* Fazer logoff do usuário postgres, e a partir de agora fazer login (para fins de administração) com usuário para este fim, no meu caso, usuário 'jean'. 
* $postgres# \q
* $psql -d template1 -U jean
*/

/* Dica 8: Quando conectado com um usuário que herda atributos de outro, e tiver a necessidade de utilizar um privilégio da role pai, deve-se carregar temporariamente a role desejada com;
* # SET ROLE minharolepai;
* e.g: # SET ROLE admin;
* ... e pra abandonar esta role temporaria;
* # RESET ROLE;
*/
SET ROLE admin;

/*
* Definição de role (group/grupo) application.
* Este role não é utilizada para fazer login, mas apenas para agrupar privilégios referentes a outras roles que serão usuários de login para aplicações.
* Todos os usuários (roles com direito de login) devem herdar as definições deste grupo 'application'.
*
* http://www.postgresql.org/docs/9.4/static/sql-createrole.html
* IN ROLE role_name
*   The IN ROLE clause lists one or more existing roles to which the new role will be immediately added as a new member. (Note that there is no option to add the new role as an administrator; use a separate GRANT command to do that.)
* ROLE role_name
*   The ROLE clause lists one or more existing roles which are automatically added as members of the new role. (This in effect makes the new role a "group".)
*/
CREATE ROLE application WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT NOLOGIN ROLE admin;

/*
* Libera a sessão do admin, volta para a role anterior (no caso, jean).
*/
RESET ROLE;

/*
* $postgres# \q
*/
