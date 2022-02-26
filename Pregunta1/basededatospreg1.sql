-- MySQL Script generated by MySQL Workbench
-- Sat Feb 26 16:40:25 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbventaspreg1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbventaspreg1` ;

-- -----------------------------------------------------
-- Schema dbventaspreg1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbventaspreg1` DEFAULT CHARACTER SET utf8 ;
USE `dbventaspreg1` ;

-- -----------------------------------------------------
-- Table `dbventaspreg1`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbventaspreg1`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `dbventaspreg1`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(100) NULL,
  `Ciudad` VARCHAR(50) NOT NULL,
  `Pais` VARCHAR(50) NOT NULL,
  `Celular` VARCHAR(15) NOT NULL,
  `Fax` VARCHAR(15) NULL,
  `Fecha_ingreso` DATE NOT NULL,
  `Ind_vigente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `Celular_UNIQUE` (`Celular` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventaspreg1`.`Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbventaspreg1`.`Vendedor` ;

CREATE TABLE IF NOT EXISTS `dbventaspreg1`.`Vendedor` (
  `idVendedor` INT NOT NULL,
  `Nombre` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventaspreg1`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbventaspreg1`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `dbventaspreg1`.`Pedido` (
  `idPedido` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idVendedor` INT NOT NULL,
  `Fecha_pedido` DATE NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  `impuesto` DECIMAL(11,2) NOT NULL,
  `total` DECIMAL(11,2) NOT NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`idPedido`, `idCliente`, `idVendedor`),
  INDEX `fk_pedido_cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_pedido_vendedor_idx` (`idVendedor` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `dbventaspreg1`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_vendedor`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `dbventaspreg1`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventaspreg1`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbventaspreg1`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `dbventaspreg1`.`Articulo` (
  `idArticulo` INT NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `precio_unitario` DECIMAL(8,2) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idArticulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventaspreg1`.`DetallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbventaspreg1`.`DetallePedido` ;

CREATE TABLE IF NOT EXISTS `dbventaspreg1`.`DetallePedido` (
  `idDetallePedido` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `idArticulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` DECIMAL(11,2) NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`idDetallePedido`, `idPedido`, `idArticulo`),
  INDEX `fk_detalle_pedido_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fj_detalle_articulo_idx` (`idArticulo` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_pedido`
    FOREIGN KEY (`idPedido`)
    REFERENCES `dbventaspreg1`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fj_detalle_articulo`
    FOREIGN KEY (`idArticulo`)
    REFERENCES `dbventaspreg1`.`Articulo` (`idArticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;