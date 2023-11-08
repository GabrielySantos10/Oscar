
-- Quantas vezes Natalie Portman foi indicada ao Oscar?
-- ou SELECT nome_indicado from oscar_database.filmes
SELECT * FROM oscar_database.filmes
WHERE nome_do_indicado like '%Natalie Portman%';

-- Quantos Oscars Natalie Portman ganhou?
SELECT 
nome_do_indicado,
vencedor
FROM oscar_database.filmes
WHERE nome_do_indicado like '%Natalie Portman%' 
AND VENCEDOR like '%SIM%';

-- Amy Adams já ganhou algum Oscar?
SELECT 
nome_do_indicado,
vencedor
FROM oscar_database.filmes
WHERE nome_do_indicado like '%Amy Adams%' 
AND VENCEDOR like '%SIM%';

--  A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT 
ano_cerimonia,
nome_filme,
vencedor
FROM OSCAR_DATABASE.FILMES 
WHERE NOME_FILME LIKE '%Toy Story%'
AND VENCEDOR LIKE '%SIM%';

-- A partir de que ano que a categoria "Actress" deixa de existir? 
SELECT 
ano_cerimonia,
categoria
FROM OSCAR_DATABASE.FILMES 
WHERE categoria = 'ACTRESS'
ORDER BY categoria DESC LIMIT 1;

-- O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT 
ano_cerimonia,
categoria,
nome_do_indicado
FROM OSCAR_DATABASE.FILMES 
WHERE categoria = 'ACTRESS' AND VENCEDOR LIKE '%SIM%'
ORDER BY categoria ASC LIMIT 1;

-- Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
SELECT 
VENCEDOR,
CASE WHEN VENCEDOR LIKE '%SIM%' THEN '1'
     WHEN VENCEDOR LIKE '%NÃO%'THEN '0' 
     END 
     FROM OSCAR_DATABASE.FILMES;
     
-- Em qual edição do Oscar "Crash" ganhou o prêmio principal
SELECT 
edicao_cerimonia,
categoria,
nome_filme,
vencedor
FROM OSCAR_DATABASE.FILMES 
WHERE categoria like  '%Best Picture%' AND nome_filme like  '%Crash%'
AND vencedor like '%Sim%';

--  Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
UPDATE filmes
 SET vencedor = 'Sim' 
 WHERE nome_filme like  '%Central Station%' and categoria like '%FOREIGN LANGUAGE FILM%';

 SELECT *
FROM OSCAR_DATABASE.FILMES 
WHERE nome_filme like  '%Central Station%' and categoria like '%FOREIGN LANGUAGE FILM%';

 
--  O filme Central do Brasil aparece no Oscar?
SELECT 
nome_filme
FROM OSCAR_DATABASE.FILMES 
WHERE nome_filme like  '%Central Station%'
ORDER BY categoria ASC LIMIT 1;

-- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) 
VALUES 
('2004', '2005', '77', 'ACTOR', 'Denzel Washington', 'Main on Fire', 'Não'),
('2007', '2008', '80', 'FOREIGN LANGUAGE FILM', 'Brazil', 'Elite Squad', 'Não'),
('2016', '2017', '89', 'FOREIGN LANGUAGE FILM', 'Brazil', 'My Mom Is a Character 2', 'Não');

UPDATE filmes SET ano_filmagem = '2004', ano_cerimonia = '2005', edicao_cerimonia = '77', categoria = 'ACTOR', nome_do_indicado ='Denzel Washington', nome_filme ='Main on Fire', vencedor = 'Não';
UPDATE filmes SET ano_filmagem = '2007', ano_cerimonia = '2008', edicao_cerimonia = '80', categoria = 'FOREIGN LANGUAGE FILM', nome_do_indicado ='Brazil', nome_filme ='Elite Squad', vencedor = 'Não';
UPDATE filmes SET ano_filmagem = '2016', ano_cerimonia = '2017', edicao_cerimonia = '89', categoria = 'FOREIGN LANGUAGE FILM', nome_do_indicado ='Brazil', nome_filme ='My Mom Is a Character 2', vencedor = 'Não';
-- Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT 
ano_cerimonia,
categoria,
nome_filme,
vencedor
FROM OSCAR_DATABASE.FILMES 
WHERE ano_cerimonia like  '%2004%' AND categoria like  '%Best Picture%'
AND vencedor like '%Sim%';

SELECT 
ano_cerimonia,
categoria,
nome_do_indicado,
vencedor
FROM OSCAR_DATABASE.FILMES 
WHERE ano_cerimonia like  '%2004%' AND categoria like  '%ACTRESS%'
AND vencedor like '%Sim%'
ORDER BY categoria ASC LIMIT 1;

SELECT 
ano_cerimonia,
categoria,
nome_do_indicado,
vencedor
FROM OSCAR_DATABASE.FILMES 
WHERE ano_cerimonia like  '%2004%' AND categoria like  '%DIRECTING%'
AND vencedor like '%Sim%'
ORDER BY categoria ASC LIMIT 1;

-- Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras.  Vamos cadastrá-los no nosso banco com o prêmio que você quiser. 


