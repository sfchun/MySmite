
/* Drop Tables */

DROP TABLE IF EXISTS GODS;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS CONSUMABLES;
DROP TABLE IF EXISTS RELICS;
DROP TABLE IF EXISTS CLASSES;

/* Create Tables */

CREATE TABLE CLASSES
(
        class_name char(32) NOT NULL UNIQUE,
        class_damage_type char(32) NOT NULL,
	PRIMARY KEY (class_name)
) WITHOUT OIDS;

CREATE TABLE RELICS
(
        relic_name char(32) NOT NULL UNIQUE,
	PRIMARY KEY (relic_name)
) WITHOUT OIDS;

CREATE TABLE CONSUMABLES
(
        consumable_name char(32) NOT NULL UNIQUE,
	PRIMARY KEY (consumable_name)
) WITHOUT OIDS;

CREATE TABLE ITEMS
(
        item_name char(32) NOT NULL UNIQUE,
	PRIMARY KEY (item_name)
) WITHOUT OIDS;

CREATE TABLE GODS
(
        god_name char(32) NOT NULL UNIQUE,
        god_class_type char(32) NOT NULL,
        god_attack_type char(32) NOT NULL,
        god_pantheon char(32) NOT NULL,
	PRIMARY KEY (god_name)
) WITHOUT OIDS;

/* Create foreign keys */

ALTER TABLE GODS
        ADD FOREIGN KEY (god_class_type)
        REFERENCES CLASSES (class_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
