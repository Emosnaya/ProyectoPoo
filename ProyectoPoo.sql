-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sucursales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(90) NULL,
  `precio` DECIMAL(10,2) NULL,
  `imagen` VARCHAR(200) NULL,
  `stock` INT NULL,
  `inventario` VARCHAR(45) NULL,
  `Sucursales_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Productos_Sucursales_idx` (`Sucursales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Sucursales`
    FOREIGN KEY (`Sucursales_id`)
    REFERENCES `mydb`.`Sucursales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleados` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidoPa` VARCHAR(45) NULL,
  `apellidoMa` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `rfc` VARCHAR(45) NULL,
  `numeroTrabajador` VARCHAR(45) NULL,
  `gerente` TINYINT(1) NULL,
  `Sucursales_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Empleados_Sucursales1_idx` (`Sucursales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Empleados_Sucursales1`
    FOREIGN KEY (`Sucursales_id`)
    REFERENCES `mydb`.`Sucursales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidoPa` VARCHAR(45) NULL,
  `apellidoMa` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `direccion` VARCHAR(90) NULL,
  `cp` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `nombreUsuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `id` INT NOT NULL,
  `Empleados_id` INT(11) NOT NULL,
  `Productos_id` INT(11) NOT NULL,
  `Usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ventas_Empleados1_idx` (`Empleados_id` ASC) VISIBLE,
  INDEX `fk_Ventas_Productos1_idx` (`Productos_id` ASC) VISIBLE,
  INDEX `fk_Ventas_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Empleados1`
    FOREIGN KEY (`Empleados_id`)
    REFERENCES `mydb`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Productos1`
    FOREIGN KEY (`Productos_id`)
    REFERENCES `mydb`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
