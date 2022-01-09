INSERT INTO `autor`(
	meno,
	priezvisko
)
VALUES('Agatha', 'Christie'),
		('Stephen', 'King'),
		('Vlastimil', 'Vondruška'),
		('Arthur Connan', 'Doyle'),
		('William', 'Shakespeare'),
		('Danielle', 'Steel'),
		('Terry', 'Pratchett'),
		('Dominik', 'Dán'),
		('Jo', 'Nesbo'),
		('James', 'Patterson'),
		('Paula', 'Hawkins');
	
INSERT INTO kategorie(
	`kategorie`
)
VALUES('Detektívky, trilery a horory'),
		('Sci-fi a fantasy'),
		('Komiksy'),
		('Romantika'),
		('Spoločenská beletria'),
		('Poézia'),
		('Dráma a divadelné hry'),
		('Mýty, povesti a legendy'),
		('Citáty a aforizmy');	

INSERT INTO pre_koho(
	`pre_koho`
)
VALUES('pre deti'),
		('pre mužov'),
		('pre ženy'),
		('pre dospelých'),
		('pre mládež'),
		('pre dievčatá'),
		('pre chlapcov');

INSERT INTO vydavatelstvo(
	`vydavatelstvo`
)
VALUES('Ikar'),
		('Slovart'),
		('BB/art'),
		('Moba'),
		('Argo'),
		('Ikar CZ'),
		('Slovensý spisovateľ'),
		('XYZ'),
		('HarperCollins'),
		('Kalibr'),
		('Talpress'),
		('Odeon');

INSERT INTO zakaznik(
	`meno`,
	`priezvisko`,
	`email`,
	`telefon`,
	`ulica`,
	`cislo_domu`,
	`mesto`,
	`psc`
)
VALUES('Daniel', 'Šimek', 'simekdaniel36@gmail.com', '0915605355', 'Blažkov', '583', 'Krásno nad Kysucou', '02302'),
		('Martin', 'Vysoký', 'mvysoky@gmail.com', '0908564368', 'Rieka', '184', 'Čadca', '02204'),
		('Andrej', 'Richtár', 'richand@gmail.com', '0905786345', 'Nový Dom', '56', 'Oščadnica', '02323'),
		('Mária', 'Orieščíková', 'mories@gmail.com', '0934678134', 'Modrá', '456', 'Poprad', '02603'),
		('Igor', 'Lapaj', 'lapaji@gmail.com', '0990594270', 'Sv. Ondreja', '7', 'Liptovský Mikuláš', '02780'),
		('Jana', 'Vlhká', 'javavlhka@gmail.com', '0908409786', 'Rieka', '18', 'Čadca', '02204');

INSERT INTO faktura(
	`id_zakaznika`,
	`cena_knih`,
	`dorucenie`,
	`cena_dorucenia`,
	`datum`
)
VALUES('1', '15.9', 'kuriér', '5', '2021-12-06'),
		('2', '46.3', 'pošta', '3', '2021-11-23'),
		('3', '12.17', 'kuriér', '5', '2021-12-10'),
		('4', '15.9', 'kuriér', '5', '2021-12-11'),
		('5', '14.95', 'pošta', '3', '2021-12-18'),
		('6', '18.8', 'pošta', '3', '2021-12-22');	

INSERT INTO kniha(
	`id_autora`,
	`nazov`,
	`original_nazov`,
	`jazyk`,
	`kategorie`,
	`pre_koho`,
	`pocet_stran`,
	`vydavatelstvo`,
	`rok`,
	`cena`,
	`na_sklade`
)	
VALUES('8', 'Mačacia stopa', '', 'slovenčina', '1', '4', '296', '2', '2021', '14.95', '0'),
		('1', 'Pomalý oheň', 'A Slow Fire Burning', 'slovenčina', '1', '4', '312', '2', '2021', '13.95', '28'),
		('1', 'A Murder is Announced', '', 'angličtina', '1', NULL, '240', '9', '2017', '10.95', '4'),
		('1', 'A pak nebyl žádný', 'And Then There Were None', 'čeština', '1', '4', '224', '10', '2021', '12.17', '103'),
		('7', 'Pod parou', 'Raising Steam', 'čeština', '2', NULL, '510', '11', '2015', '17.3', '45'),
		('1', 'Vražda na fare', '', 'slovenčina', '1', NULL, '208', '7', '2021', '11.9', '0'),
		('6', 'Bod zlomu', 'Turning Point', 'čeština', '4', '3', '272', '6', '2021', '14.05', '69'),
		('8', 'Bremeno Minulosti', '', 'slovenčina', '1', NULL, '328', '2', '2021', '14.95', '9'),
		('9', 'Ostrov potkanov a iné príbehy', '', 'slovenčina', '1', NULL, '336', '1', '2021', '15.9', '13'),
		('9', 'Žiarlivec a iné príbehy', '', 'slovenčina', '1', '4', '288', '1', '2021', '14.9', '32'),
		('5', 'Hamlet', '', 'slovenčina', '7', NULL, '184', '12', '2006', '9.9', '3'),
		('5', 'Romeo a Júlia', 'Romeo and Juliet', 'slovenčina', '7', NULL, '144', '12', '2006', '8.9', '11');


INSERT INTO kosik(
	`id_knihy`,
	`pocet`,
	`faktura`
)
VALUES('9', '1', '1'),
		('5', '1', '2'),
		('7', '1', '2'),
		('9', '1', '2'),
		('4', '1', '3'),
		('9', '1', '4'),
		('8', '1', '5'),
		('11', '1', '6'),
		('12', '1', '6');