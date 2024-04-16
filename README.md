O Arquivo segue a estrutura de MVC, POO, SOLID e DAO.



Desenvolva um programa em Delphi:


1- Utilize componentes nativos do Delphi;

1.1- Utilize VCL para fazer o layout;

1.2- Utilizar para conexão com o banco o TFDConnection

1.3- Utilizar controle de transação com o banco de dados


2- Crie o banco BDCANDITADO no SQLite com as seguintes tabelas:

 

TbClientes

(IdCliente identity,

NomeReduzido varchar(20),

RazaoSocial varchar(60),

CNPJ varchar(14),

CPF varchar(11),

DtNascimento smalldatetime

DtTmCadastro datetime) 

 

TbContatos

(IdContato identity,

IdCliente int (fk com a TbClientes),

Nome varchar(60))


3- Crie um programa que insira, altere, delete e consulte os dados da TbClientes e TbContatos;

 

4- Fica a seu critério como será o layout da tela e sua regra de negócio – Use sua criatividade / padrões de mercado;

4.1- Descreva no fonte, como comentário, qual foi a sua regra de negócio. Exemplo: Data de nascimento aceita apenas para maiores de 18 anos, a partir da data do cadastro; Por que colocou determinada validação; Por que determinado campo é obrigatório e outro não; Etc.


Peço que me envie os arquivos *.dpr, *.pas e *.dfm deste projeto e o banco de dados SQLite.
