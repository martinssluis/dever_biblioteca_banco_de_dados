
/*1 - Mostrar toda a informação sobre todos os livros.*/
SELECT * FROM LIVROS;

/*2 - Listar código e nome dos leitores cujo código é menor que 5.*/

SELECT IDLEITOR, NOME FROM LEITOR
WHERE IDLEITOR < 5;

/*3 - Listar o nome e a cidade dos leitores com nome a começar por 'M' e código entre 2 e 5.*/
SELECT NOME, CIDADE FROM LEITOR
WHERE NOME LIKE 'M%'
AND IDLEITOR BETWEEN 2 AND 5 ;

/*4 - Selecionar as cidades com código postal superior a 2000.*/
SELECT CX_POSTAL, CIDADE FROM LEITOR
WHERE CX_POSTAL > 2000;

/*5 - Selecionar os livros do Eça com preço superior a 1000 e 
todos os livros de preço inferior a 750 indicando o autor, o título, o preço e o número.*/
SELECT * FROM livro
WHERE preco > 1000 or preco < 750
AND AUTOR = 'Eca de Queiroz';

/*6 - Escrever o número de dias que durou cada requisição nos casos em que duraram menos que 10 dias.*/
SELECT * FROM REQUISICAO
WHERE (DT_ENTREGA - DT_REQUISICAO ) < 10;

/*7 - Obtenha uma lista com os autores, livros e preço ordenada decrescentemente por autor 
e decrescentemente por preço.*/

select * from livro
order by PRECO desc;

select * from livro
order by AUTOR desc;

/*8 - Obtenha o preço médio, valor total e o número de livros da biblioteca, 
bem como o valor do livro mais caro e o do mais barato.*/
SELECT AVG(PRECO) AS 'PREÇO_MEDIO' FROM LIVRO;

SELECT SUM(PRECO) AS 'PREÇO_TOTAL' FROM LIVRO;

SELECT MAX(PRECO) AS 'LIVRO_MAIS_CARO' FROM LIVRO;

SELECT MIN(PRECO) AS 'LIVRO_MAIS_BARATO'FROM LIVRO;

SELECT COUNT(*) AS 'QUANTIDADE_LIVROS' FROM LIVRO;


/*9 - Calcule o preço médio dos livros de cada autor.*/
SELECT AUTOR, AVG(PRECO) AS 'PREÇO_MÉDIO' FROM LIVRO
group by  AUTOR ;

/*10 - Obtenha o título e preço do livro mais caro dos autores que começam por E.*/
SELECT MAX(PRECO) AS 'AUTOR_MAIS_CARO', TITULO FROM LIVRO
WHERE AUTOR LIKE 'E%';

/*11 - Selecione o título do segundo livro mais caro.*/
SELECT TITULO, PRECO FROM LIVRO
ORDER BY PRECO DESC
LIMIT 1 OFFSET 1; -- DESVIA O PRIMEIRO

/*12 - Escreva os títulos e datas de requisição dos livros requisitados depois de 95-01-01.*/
SELECT TITULO, DT_REQUISICAO
FROM LIVRO, REQUISICAO
WHERE IDLIVRO=ID_LIVRO
AND DT_REQUISICAO > '1995-01-01'
ORDER BY DT_REQUISICAO;

/*13 - Liste, para cada requisição, o título do livro e o nome do leitor, 
no caso de o código postal ser 1000, 4000 ou 4470.*/

SELECT  ID_LIVRO, ID_LEITOR, CX_POSTAL
FROM REQUISICAO, LEITOR
WHERE ID_LEITOR=IDLEITOR 
AND CX_POSTAL IN (1000,4000,4470) ;

/*14 - Quantos Antónios moram em Lisboa e quantos Zecas moram no Porto?*/
SELECT COUNT(CIDADE) AS 'Quantidade_Zeca' FROM LEITOR
WHERE NOME='Zeca'
AND CIDADE='Porto';

SELECT COUNT(CIDADE) AS 'Quantidade_Antonio' FROM LEITOR
WHERE NOME='António'
AND CIDADE='Lisboa';

/*15 - Procure o livro cujas requisições têm maior duração média, exceto 'Terra Fria’.*/
SELECT ID_LIVRO, AVG(DT_ENTREGA) AS 'MAIOR_MÉDIA'  FROM REQUISICAO
WHERE ID_LIVRO <> 140;

/*16 - Obtenha a lista dos pares de pessoas que moram na mesma cidade.*/
SELECT NOME, CIDADE FROM LEITOR
order by CIDADE;


/*17 - Obtenha os leitores que não requisitaram o livro 150.*/
SELECT * FROM REQUISICAO
WHERE ID_LIVRO <> 150;


