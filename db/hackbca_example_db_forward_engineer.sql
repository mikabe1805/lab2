-- MySQL Script generated by MySQL Workbench
-- Mon Jan 24 14:27:46 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hackbca_example
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hackbca_example
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hackbca_example` DEFAULT CHARACTER SET latin1 ;
USE `hackbca_example` ;

-- -----------------------------------------------------
-- Table `hackbca_example`.`event_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`event_location` (
  `event_location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `event_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`event_location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`event_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`event_type` (
  `event_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `event_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`event_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`event` (
  `event_id` INT(11) NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(45) NOT NULL,
  `event_location_id` INT(11) NULL DEFAULT NULL,
  `event_type_id` INT(11) NULL DEFAULT NULL,
  `event_dt` DATETIME NULL DEFAULT NULL,
  `event_duration` INT(11) NULL DEFAULT NULL,
  `event_description` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `event_type_idx` (`event_type_id` ASC) ,
  INDEX `event_location_idx` (`event_location_id` ASC) ,
  CONSTRAINT `event_location`
    FOREIGN KEY (`event_location_id`)
    REFERENCES `hackbca_example`.`event_location` (`event_location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event_type`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `hackbca_example`.`event_type` (`event_type_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `hackbca_example`.`project_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`project_location` (
  `project_location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`project_location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`project_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`project_type` (
  `project_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`project_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`project` (
  `project_id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `project_location_id` INT(11) NULL DEFAULT NULL,
  `project_type_id` INT(11) NULL DEFAULT NULL,
  `project_dt` DATETIME NULL DEFAULT NULL,
  `project_owner` VARCHAR(45) NULL DEFAULT NULL,
  `project_dt_proposed` DATETIME NULL DEFAULT NULL,
  `project_description` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  INDEX `project_type_idx` (`project_type_id` ASC) ,
  INDEX `project_location_idx` (`project_location_id` ASC) ,
  CONSTRAINT `project_location`
    FOREIGN KEY (`project_location_id`)
    REFERENCES `hackbca_example`.`project_location` (`project_location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `project_type`
    FOREIGN KEY (`project_type_id`)
    REFERENCES `hackbca_example`.`project_type` (`project_type_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `hackbca_example`.`user_type_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`user_type_code` (
  `user_type_code` INT(11) NOT NULL AUTO_INCREMENT,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_type_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  `academy` VARCHAR(45) NULL DEFAULT NULL,
  `class` INT(11) NULL DEFAULT NULL,
  `user_type_code` INT(11) NULL DEFAULT NULL,
  `admin` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_type_code_idx` (`user_type_code` ASC) ,
  CONSTRAINT `user_type_code`
    FOREIGN KEY (`user_type_code`)
    REFERENCES `hackbca_example`.`user_type_code` (`user_type_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hackbca_example`.`event_user_registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`event_user_registration` (
  `user_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `event_id_registration_idx` (`event_id` ASC) ,
  CONSTRAINT `event_id_registration`
    FOREIGN KEY (`event_id`)
    REFERENCES `hackbca_example`.`event` (`event_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_id_registration`
    FOREIGN KEY (`user_id`)
    REFERENCES `hackbca_example`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `hackbca_example`.`project_user_registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackbca_example`.`project_user_registration` (
  `user_id` INT(11) NOT NULL,
  `project_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `project_id`),
  INDEX `project_id_registration_idx` (`project_id` ASC) ,
  CONSTRAINT `project_id_registration`
    FOREIGN KEY (`project_id`)
    REFERENCES `hackbca_example`.`project` (`project_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_id_registration`
    FOREIGN KEY (`user_id`)
    REFERENCES `hackbca_example`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
