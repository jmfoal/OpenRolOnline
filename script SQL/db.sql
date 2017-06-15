-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ORO
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ORO` ;

-- -----------------------------------------------------
-- Schema ORO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ORO` DEFAULT CHARACTER SET utf8 ;
USE `ORO` ;

-- -----------------------------------------------------
-- Table `ORO`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`User` ;

CREATE TABLE IF NOT EXISTS `ORO`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(250) NULL,
  `tag` INT NULL,
  `password` VARCHAR(250) NULL,
  `email` VARCHAR(250) NULL,
  `avatar` VARCHAR(250) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ORO`.`Partida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`Partida` ;

CREATE TABLE IF NOT EXISTS `ORO`.`Partida` (
  `idPartida` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NULL,
  `descripcion` VARCHAR(250) NULL,
  `juego` VARCHAR(250) NULL,
  `ambientacion` VARCHAR(250) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idPartida`),
  INDEX `fk_Partida_User_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Partida_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `ORO`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ORO`.`Ficha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`Ficha` ;

CREATE TABLE IF NOT EXISTS `ORO`.`Ficha` (
  `idFicha` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NULL,
  `ruta` VARCHAR(250) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idFicha`),
  INDEX `fk_Ficha_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Ficha_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `ORO`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ORO`.`Asset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`Asset` ;

CREATE TABLE IF NOT EXISTS `ORO`.`Asset` (
  `idAsset` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NULL,
  `tipo` INT NULL,
  `ruta` VARCHAR(250) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idAsset`),
  INDEX `fk_Asset_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Asset_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `ORO`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ORO`.`Partida_Ficha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`Partida_Ficha` ;

CREATE TABLE IF NOT EXISTS `ORO`.`Partida_Ficha` (
  `Partida_idPartida` INT NOT NULL,
  `Ficha_idFicha` INT NOT NULL,
  PRIMARY KEY (`Partida_idPartida`, `Ficha_idFicha`),
  INDEX `fk_Partida_has_Ficha_Ficha1_idx` (`Ficha_idFicha` ASC),
  INDEX `fk_Partida_has_Ficha_Partida1_idx` (`Partida_idPartida` ASC),
  CONSTRAINT `fk_Partida_has_Ficha_Partida1`
    FOREIGN KEY (`Partida_idPartida`)
    REFERENCES `ORO`.`Partida` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partida_has_Ficha_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `ORO`.`Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ORO`.`Partida_Asset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORO`.`Partida_Asset` ;

CREATE TABLE IF NOT EXISTS `ORO`.`Partida_Asset` (
  `Partida_idPartida` INT NOT NULL,
  `Asset_idAsset` INT NOT NULL,
  PRIMARY KEY (`Partida_idPartida`, `Asset_idAsset`),
  INDEX `fk_Partida_has_Asset_Asset1_idx` (`Asset_idAsset` ASC),
  INDEX `fk_Partida_has_Asset_Partida1_idx` (`Partida_idPartida` ASC),
  CONSTRAINT `fk_Partida_has_Asset_Partida1`
    FOREIGN KEY (`Partida_idPartida`)
    REFERENCES `ORO`.`Partida` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partida_has_Asset_Asset1`
    FOREIGN KEY (`Asset_idAsset`)
    REFERENCES `ORO`.`Asset` (`idAsset`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

