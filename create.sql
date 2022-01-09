CREATE DATABASE knihkupectvo;

CREATE TABLE `autor` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`meno` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`priezvisko` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `kategorie` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`kategorie` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `pre_koho` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pre_koho` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `vydavatelstvo` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`vydavatelstvo` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `zakaznik` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`meno` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`priezvisko` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`email` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`telefon` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`ulica` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`cislo_domu` INT(10) NULL DEFAULT NULL,
	`mesto` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`psc` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `faktura` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_zakaznika` INT(10) UNSIGNED NULL DEFAULT NULL,
	`cena_knih` FLOAT UNSIGNED NULL DEFAULT NULL,
	`dorucenie` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`cena_dorucenia` FLOAT NULL DEFAULT NULL,
	`datum` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_zakaznika` (`id_zakaznika`) USING BTREE,
	CONSTRAINT `FK_faktura_zakaznik` FOREIGN KEY (`id_zakaznika`) REFERENCES `knihkupectvo`.`zakaznik` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `kniha` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_autora` INT(10) UNSIGNED NOT NULL,
	`nazov` TINYTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`original_nazov` TINYTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`jazyk` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`kategorie` INT(10) UNSIGNED NOT NULL,
	`pre_koho` INT(10) UNSIGNED NULL DEFAULT NULL,
	`pocet_stran` INT(10) UNSIGNED NOT NULL,
	`vydavatelstvo` INT(10) UNSIGNED NULL DEFAULT NULL,
	`rok` YEAR NULL DEFAULT NULL,
	`cena` FLOAT NULL DEFAULT NULL,
	`na_sklade` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_autora` (`id_autora`) USING BTREE,
	INDEX `pre_koho` (`pre_koho`) USING BTREE,
	INDEX `FK_kniha_kategorie` (`kategorie`) USING BTREE,
	INDEX `vydavatelstvo` (`vydavatelstvo`) USING BTREE,
	CONSTRAINT `FK_kniha_autor` FOREIGN KEY (`id_autora`) REFERENCES `knihkupectvo`.`autor` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_kniha_kategorie` FOREIGN KEY (`kategorie`) REFERENCES `knihkupectvo`.`kategorie` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_kniha_pre_koho` FOREIGN KEY (`pre_koho`) REFERENCES `knihkupectvo`.`pre_koho` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_kniha_vydavatelstvo` FOREIGN KEY (`vydavatelstvo`) REFERENCES `knihkupectvo`.`vydavatelstvo` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;

CREATE TABLE `kosik` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_knihy` INT(10) UNSIGNED NULL DEFAULT NULL,
	`pocet` INT(10) NULL DEFAULT NULL,
	`faktura` INT(10) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_knihy` (`id_knihy`) USING BTREE,
	INDEX `faktura` (`faktura`) USING BTREE,
	CONSTRAINT `FK_kosik_faktura` FOREIGN KEY (`faktura`) REFERENCES `knihkupectvo`.`faktura` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_kosik_kniha` FOREIGN KEY (`id_knihy`) REFERENCES `knihkupectvo`.`kniha` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
AUTO_INCREMENT=1
;