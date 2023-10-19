-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema farmacia_ebenezer
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema farmacia_ebenezer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farmacia_ebenezer` DEFAULT CHARACTER SET utf8 ;
USE `farmacia_ebenezer` ;

-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`Estado` (
  `idEstado` INT NOT NULL,
  `nombreEstado` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`TipoSN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`TipoSN` (
  `idTipoSN` INT NOT NULL,
  `tipoSN` VARCHAR(45) NULL,
  `abreviatura` VARCHAR(4) NULL,
  PRIMARY KEY (`idTipoSN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`SocioDeNegocio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`SocioDeNegocio` (
  `idSocioDeNegocio` INT NOT NULL,
  `nit` VARCHAR(15) NULL,
  `nombre1` VARCHAR(15) NULL,
  `nombre2` VARCHAR(15) NULL,
  `apellido1` VARCHAR(15) NULL,
  `apellido2` VARCHAR(15) NULL,
  `direccion` VARCHAR(100) NULL,
  `codigoPostal` VARCHAR(7) NULL,
  `telefono1` VARCHAR(15) NULL,
  `telefono2` VARCHAR(15) NULL,
  `email` VARCHAR(30) NULL,
  `fechaCreacion` DATETIME NULL,
  `Estado_idEstado` INT NOT NULL,
  `TipoSN_idTipoSN` INT NOT NULL,
  PRIMARY KEY (`idSocioDeNegocio`, `TipoSN_idTipoSN`),
  /*INDEX `fk_SocioDeNegocio_Estado_idx` (`Estado_idEstado` ASC) VISIBLE,
  INDEX `fk_SocioDeNegocio_TipoSN1_idx` (`TipoSN_idTipoSN` ASC) VISIBLE,*/
  CONSTRAINT `fk_SocioDeNegocio_Estado`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `farmacia_ebenezer`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SocioDeNegocio_TipoSN1`
    FOREIGN KEY (`TipoSN_idTipoSN`)
    REFERENCES `farmacia_ebenezer`.`TipoSN` (`idTipoSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nickname` VARCHAR(15) NULL,
  `nombreUsuario` VARCHAR(15) NULL,
  `apellidoUsuario` VARCHAR(15) NULL,
  `contrasena` VARCHAR(100) NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  /*INDEX `fk_Usuario_Estado1_idx` (`Estado_idEstado` ASC) VISIBLE,*/
  CONSTRAINT `fk_Usuario_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `farmacia_ebenezer`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`Serie` (
  `idSerie` INT NOT NULL,
  `nombreSerie` VARCHAR(3) NULL,
  `Seriecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idSerie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`FacturaVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`FacturaVenta` (
  `idFacturaVenta` INT NOT NULL,
  `fechaEmision` DATETIME NULL,
  `nitCliente` VARCHAR(15) NULL,
  `nombreCliente` VARCHAR(60) NULL,
  `direccionCliente` VARCHAR(100) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Serie_idSerie` INT NOT NULL,
  PRIMARY KEY (`idFacturaVenta`, `Serie_idSerie`),
  /*INDEX `fk_FacturaVenta_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_FacturaVenta_Serie1_idx` (`Serie_idSerie` ASC) VISIBLE,*/
  CONSTRAINT `fk_FacturaVenta_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `farmacia_ebenezer`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaVenta_Serie1`
    FOREIGN KEY (`Serie_idSerie`)
    REFERENCES `farmacia_ebenezer`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`FacturaCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`FacturaCompra` (
  `idFacturaCompra` INT NOT NULL,
  `fechaEmision` DATETIME NULL,
  `nitProveedor` VARCHAR(15) NULL,
  `nombreProveedor` VARCHAR(60) NULL,
  `direccionProveedor` VARCHAR(100) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Serie_idSerie` INT NOT NULL,
  PRIMARY KEY (`idFacturaCompra`, `Serie_idSerie`),
  /*INDEX `fk_FacturaCompra_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_FacturaCompra_Serie1_idx` (`Serie_idSerie` ASC) VISIBLE,*/
  CONSTRAINT `fk_FacturaCompra_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `farmacia_ebenezer`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaCompra_Serie1`
    FOREIGN KEY (`Serie_idSerie`)
    REFERENCES `farmacia_ebenezer`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`UnidadDeMedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`UnidadDeMedida` (
  `idUnidadDeMedida` INT NOT NULL,
  `unidadDeMedida` VARCHAR(20) NULL,
  PRIMARY KEY (`idUnidadDeMedida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`Inventario` (
  `sku` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  `cantidadDisponible` FLOAT NULL,
  `precioVenta` FLOAT NULL,
  `UnidadDeMedida_idUnidadDeMedida` INT NOT NULL,
  PRIMARY KEY (`sku`),
  /*INDEX `fk_Inventario_UnidadDeMedida1_idx` (`UnidadDeMedida_idUnidadDeMedida` ASC) VISIBLE,*/
  CONSTRAINT `fk_Inventario_UnidadDeMedida1`
    FOREIGN KEY (`UnidadDeMedida_idUnidadDeMedida`)
    REFERENCES `farmacia_ebenezer`.`UnidadDeMedida` (`idUnidadDeMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`DetalleFacturaVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`DetalleFacturaVenta` (
  `FacturaVenta_idFacturaVenta` INT NOT NULL,
  `FacturaVenta_Serie_idSerie` INT NOT NULL,
  `Inventario_sku` INT NOT NULL,
  `cantidad` FLOAT NULL,
  `descuento` FLOAT NULL,
  `totalLinea` VARCHAR(45) NULL,
  /*INDEX `fk_DetalleFacturaVenta_FacturaVenta1_idx` (`FacturaVenta_idFacturaVenta` ASC, `FacturaVenta_Serie_idSerie` ASC) VISIBLE,
  INDEX `fk_DetalleFacturaVenta_Inventario1_idx` (`Inventario_sku` ASC) VISIBLE,*/
  CONSTRAINT `fk_DetalleFacturaVenta_FacturaVenta1`
    FOREIGN KEY (`FacturaVenta_idFacturaVenta` , `FacturaVenta_Serie_idSerie`)
    REFERENCES `farmacia_ebenezer`.`FacturaVenta` (`idFacturaVenta` , `Serie_idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFacturaVenta_Inventario1`
    FOREIGN KEY (`Inventario_sku`)
    REFERENCES `farmacia_ebenezer`.`Inventario` (`sku`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia_ebenezer`.`DetalleFacturaCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia_ebenezer`.`DetalleFacturaCompra` (
  `FacturaCompra_idFacturaCompra` INT NOT NULL,
  `FacturaCompra_Serie_idSerie` INT NOT NULL,
  `Inventario_sku` INT NOT NULL,
  `cantidad` FLOAT NULL,
  `precioCompra` FLOAT NULL,
  `totalLinea` FLOAT NULL,
  /*INDEX `fk_DetalleFacturaCompra_FacturaCompra1_idx` (`FacturaCompra_idFacturaCompra` ASC, `FacturaCompra_Serie_idSerie` ASC) VISIBLE,
  INDEX `fk_DetalleFacturaCompra_Inventario1_idx` (`Inventario_sku` ASC) VISIBLE,*/
  CONSTRAINT `fk_DetalleFacturaCompra_FacturaCompra1`
    FOREIGN KEY (`FacturaCompra_idFacturaCompra` , `FacturaCompra_Serie_idSerie`)
    REFERENCES `farmacia_ebenezer`.`FacturaCompra` (`idFacturaCompra` , `Serie_idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFacturaCompra_Inventario1`
    FOREIGN KEY (`Inventario_sku`)
    REFERENCES `farmacia_ebenezer`.`Inventario` (`sku`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
