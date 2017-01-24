
/* Drop Tables */

DROP TABLE IF EXISTS CLASSES;
DROP TABLE IF EXISTS RELICS;
DROP TABLE IF EXISTS CONSUMABLES;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS GODS;

/* Create Tables */

CREATE TABLE CLASSES
(
        class_name char(32) NOT NULL UNIQUE,
        class_damage_type char(32)
) WITHOUT OIDS;

CREATE TABLE RELICS
(
        relic_name char(32) NOT NULL UNIQUE
) WITHOUT OIDS;

CREATE TABLE CONSUMABLES
(
        consumable_name char(32) NOT NULL UNIQUE
) WITHOUT OIDS;

CREATE TABLE ITEMS
(
        item_name char(32) NOT NULL UNIQUE
) WITHOUT OIDS;

CREATE TABLE GODS
(
        god_name char(32) NOT NULL UNIQUE,
        god_class_class char(32),
        god_attack_type char(32),
        god_pantheon char(32)
) WITHOUT OIDS;


