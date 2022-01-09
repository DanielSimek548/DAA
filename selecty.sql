/*č.1 vyberie id a nazov knihy a vypocita celkovu cenu knih*/
SELECT id, nazov, cena * na_sklade AS celkova_cena_knih 
FROM kniha 
ORDER BY celkova_cena_knih ASC;

/*č.2 vyberie vsetko a vypocita celkovu zaplatenu cenu*/
SELECT *, cena_knih + cena_dorucenia  AS cena_spolu 
FROM faktura;

/*č.3 vyberie vsetko a zoradi zoznam podla abecedy*/
SELECT * 
FROM autor 
ORDER BY meno;

/*č.4 vyberie vsetko kde je autor s id 1*/
SELECT * 
FROM kniha 
WHERE id_autora IN ('1');

/*č.5 vyberie vsetko kde je kniha po slovensky, je urcena pre dospelych alebo nie je na sklade*/
SELECT *
FROM kniha
WHERE jazyk IN ('slovenčina') AND pre_koho = 4 
OR na_sklade = 0;

/*č.6 vyberie vsetko kde jazyk knih nie je slovencina*/
SELECT *
FROM kniha
WHERE jazyk != 'slovenčina';

/*č.7 vyberie vsetko kde sa v mene autora nachadza e*/
SELECT *
FROM autor
WHERE meno LIKE '%e%';

/*č.8 vypise kolko knih ma autor v knihkupectve*/
SELECT id_autora, COUNT(*) AS knihy_od_autora
FROM kniha
GROUP BY id_autora;

/*č.9 vypise kolko knih je v danom jazyku v knihkupectve*/
SELECT jazyk, COUNT(*) AS knihy_s_rovnakym_jazykom
FROM kniha
GROUP BY jazyk;

/*č.10 vyberie knihu s najnizsim poctom knih na sklde okrem nuli a je pisana v slovencine*/
SELECT MIN(na_sklade)
FROM kniha
WHERE na_sklade > 0
GROUP BY jazyk
HAVING jazyk IN ('slovenčina');

/*č.11 vypise autora a nazov knihy pricom musi byt drahsia ako 10 eur*/
SELECT meno, priezvisko, nazov, cena
FROM kniha
JOIN autor ON autor.id = id_autora
GROUP BY cena
HAVING cena > 10.0;

/*č.12 vypise knihu a pre koho je urcena pricom bola vydana v roku 2021 a musi byt na sklade*/
SELECT nazov, pre_koho.pre_koho, rok
FROM kniha
JOIN pre_koho ON pre_koho.id = kniha.pre_koho
WHERE rok = 2021
GROUP BY na_sklade
HAVING na_sklade > 0;

/*č.13 */

/*č.14 */