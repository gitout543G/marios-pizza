-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema marios_pizza_modell
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema marios_pizza_modell
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marios_pizza_modell` DEFAULT CHARACTER SET utf8 ;
USE `marios_pizza_modell` ;

-- -----------------------------------------------------
-- Table `marios_pizza_modell`.`bestellposition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza_modell`.`bestellposition` (
  `bestell_id` INT NOT NULL,
  `artikel_id` INT NOT NULL,
  `menge` INT NOT NULL,
  PRIMARY KEY (`bestell_id`, `artikel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marios_pizza_modell`.`Kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza_modell`.`Kategorie` (
  `kategorie_id` INT NOT NULL AUTO_INCREMENT,
  `bezeichnung` VARCHAR(45) NOT NULL,
  `bestellposition_bestell_id` INT NOT NULL,
  `bestellposition_artikel_artikel_id` INT NOT NULL,
  PRIMARY KEY (`kategorie_id`, `bestellposition_bestell_id`, `bestellposition_artikel_artikel_id`),
  INDEX `fk_Kategorie_bestellposition1_idx` (`bestellposition_bestell_id` ASC, `bestellposition_artikel_artikel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Kategorie_bestellposition1`
    FOREIGN KEY (`bestellposition_bestell_id`)
    REFERENCES `marios_pizza_modell`.`bestellposition` (`bestell_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marios_pizza_modell`.`kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza_modell`.`kunde` (
  `kunde_id` INT NOT NULL,
  `vorname` VARCHAR(45) NOT NULL,
  `nachname` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NULL,
  `strasse` VARCHAR(45) NULL,
  `plz` VARCHAR(45) NULL,
  `ort` VARCHAR(45) NULL,
  PRIMARY KEY (`kunde_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marios_pizza_modell`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza_modell`.`artikel` (
  `artikel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `beschreibung` VARCHAR(120) NULL,
  `preis` DECIMAL(6,2) NOT NULL,
  `kategorie_id` INT NOT NULL,
  `Kategorie_kategorie_id` INT NOT NULL,
  PRIMARY KEY (`artikel_id`),
  INDEX `fk_artikel_Kategorie_idx` (`Kategorie_kategorie_id` ASC) VISIBLE,
  CONSTRAINT `fk_artikel_Kategorie`
    FOREIGN KEY (`Kategorie_kategorie_id`)
    REFERENCES `marios_pizza_modell`.`Kategorie` (`kategorie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marios_pizza_modell`.`bestellung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marios_pizza_modell`.`bestellung` (
  `bestell_id` INT NOT NULL,
  `kunde_id` INT NOT NULL,
  `bestelldatum` DATETIME NOT NULL,
  `lieferart` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bestell_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
