
/* Drop Tables */
DROP TABLE IF EXISTS GODS;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS ITEMSSUBCATEGORIES;
DROP TABLE IF EXISTS ITEMSBIGCATEGORIES;
DROP TABLE IF EXISTS CONSUMABLES;
DROP TABLE IF EXISTS RELICS;
DROP TABLE IF EXISTS CLASSES;


/* Create Tables */
CREATE TABLE ITEMSBIGCATEGORIES
(
        item_bcategory char(32) NOT NULL UNIQUE,
	PRIMARY KEY (item_bcategory)
) WITHOUT OIDS;

CREATE TABLE ITEMSSUBCATEGORIES
(
        item_scategory char(32) NOT NULL UNIQUE,
	item_bcategory char(32) NOT NULL,
	PRIMARY KEY (item_scategory)
) WITHOUT OIDS;

CREATE TABLE CLASSES
(
        class_name char(32) NOT NULL UNIQUE,
        class_damage_type char(32) NOT NULL,
	PRIMARY KEY (class_name)
) WITHOUT OIDS;

CREATE TABLE RELICS
(
        relic_name char(32) NOT NULL UNIQUE,
        relic_level smallint NOT NULL,
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
	item_starter char(3) NOT NULL,
	item_level smallint NOT NULL,
	item_parent_name char(32),
	item_stat_1 char(32) NOT NULL,
	item_stat_1_value smallint NOT NULL,
	item_stat_2 char(32),
	item_stat_2_value smallint,
	item_stat_3 char(32),
	item_stat_3_value smallint,
	item_stat_4 char(32),
	item_stat_4_value smallint,
	item_passif char(256),
	item_passif_subcat char(32),
	item_passif_subcat_2 char(32),
	item_passif_subcat_3 char(32)
) WITHOUT OIDS;

CREATE TABLE GODS
(
        god_name char(32) NOT NULL UNIQUE,
        god_pantheon char(32) NOT NULL,
        god_attack_type char(32) NOT NULL,
        /* god_power_type char(32) NOT NULL, */ /* Defined in Table CLASSES @class_damage_type */
        god_class_type char(32) NOT NULL,
	god_ability_1 char(32) NOT NULL,
	god_ability_2 char(32) NOT NULL,
	god_ability_3 char(32) NOT NULL,
	god_ability_4 char(32) NOT NULL, /* elite ability */
	PRIMARY KEY (god_name)
) WITHOUT OIDS;


/* Create foreign keys */
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_parent_name)
        REFERENCES ITEMS (item_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_stat_1)
        REFERENCES ITEMSSUBCATEGORIES (item_scategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_stat_2)
        REFERENCES ITEMSSUBCATEGORIES (item_scategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_stat_3)
        REFERENCES ITEMSSUBCATEGORIES (item_scategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_stat_4)
        REFERENCES ITEMSSUBCATEGORIES (item_scategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
ALTER TABLE ITEMS
        ADD FOREIGN KEY (item_passif_subcat)
        REFERENCES ITEMSSUBCATEGORIES (item_scategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;

ALTER TABLE ITEMSSUBCATEGORIES
        ADD FOREIGN KEY (item_bcategory)
        REFERENCES ITEMSBIGCATEGORIES (item_bcategory)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;

ALTER TABLE GODS
        ADD FOREIGN KEY (god_class_type)
        REFERENCES CLASSES (class_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
;
