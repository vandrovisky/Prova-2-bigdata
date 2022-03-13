-- -----------------------------------------------------
-- Schema Eric Robertson Ribeiro Pires 2 Prova
-- -----------------------------------------------------
-- Prova 2 de Bigdata 

-- -----------------------------------------------------
-- Schema Eric Robertson Ribeiro Pires 2 Prova
--
-- Prova 2 de Bigdata 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci ;
USE `Eric Robertson Ribeiro Pires 2 Prova` ;

-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Cliente` (
  `Nro_CPF` VARCHAR(30) NOT NULL,
  `Nom_Cliente` VARCHAR(45) NOT NULL,
  `Dat_Nascimento` DATE NOT NULL,
  PRIMARY KEY (`Nro_CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Preço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Preço` (
  `Cod_Preco` INT NOT NULL,
  `Vlr_Locacao` DECIMAL(3) NOT NULL,
  PRIMARY KEY (`Cod_Preco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Locação`
-- -----------------------------------------------------
x
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Genero` (
  `Cod_Genero` VARCHAR(25) NOT NULL,
  `Des_Genero` VARCHAR(50) NULL,
  PRIMARY KEY (`Cod_Genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Filme` (
  `ID_Filme` INT NOT NULL,
  `Nom_Título` VARCHAR(45) NOT NULL,
  `Ano_Lancto` YEAR(1) NULL,
  `Cod_Preco` DECIMAL(3) NOT NULL,
  `Genero_Cod_Genero` VARCHAR(25) NOT NULL,
  `Preço_Cod_Preco` INT NOT NULL,
  PRIMARY KEY (`ID_Filme`),
  INDEX `fk_Filme_Genero_idx` (`Genero_Cod_Genero` ASC) VISIBLE,
  INDEX `fk_Filme_Preço1_idx` (`Preço_Cod_Preco` ASC) VISIBLE,
  CONSTRAINT `fk_Filme_Genero`
    FOREIGN KEY (`Genero_Cod_Genero`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Genero` (`Cod_Genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_Preço1`
    FOREIGN KEY (`Preço_Cod_Preco`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Preço` (`Cod_Preco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`DVD - Exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`DVD - Exemplar` (
  `Seq_DVD` INT NOT NULL,
  `Ano_aquisição` YEAR(1) NOT NULL,
  `Filme_ID_Filme` INT NOT NULL,
  `Locação_Dat_Locacao` DATE NOT NULL,
  INDEX `fk_DVD - Exemplar_Filme1_idx` (`Filme_ID_Filme` ASC) VISIBLE,
  PRIMARY KEY (`Ano_aquisição`),
  INDEX `fk_DVD - Exemplar_Locação1_idx` (`Locação_Dat_Locacao` ASC) VISIBLE,
  CONSTRAINT `fk_DVD - Exemplar_Filme1`
    FOREIGN KEY (`Filme_ID_Filme`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Filme` (`ID_Filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DVD - Exemplar_Locação1`
    FOREIGN KEY (`Locação_Dat_Locacao`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Locação` (`Dat_Locacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Ator` (
  `ID_Ator` INT NOT NULL,
  `Nom_Ator` VARCHAR(45) NOT NULL,
  `Idt_Sexo` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID_Ator`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Eric Robertson Ribeiro Pires 2 Prova`.`Filme_has_Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Eric Robertson Ribeiro Pires 2 Prova`.`Filme_has_Ator` (
  `Filme_ID_Filme` INT NOT NULL,
  `Ator_ID_Ator` INT NOT NULL,
  PRIMARY KEY (`Filme_ID_Filme`, `Ator_ID_Ator`),
  INDEX `fk_Filme_has_Ator_Ator1_idx` (`Ator_ID_Ator` ASC) VISIBLE,
  INDEX `fk_Filme_has_Ator_Filme1_idx` (`Filme_ID_Filme` ASC) VISIBLE,
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_ID_Filme`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Filme` (`ID_Filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_ID_Ator`)
    REFERENCES `Eric Robertson Ribeiro Pires 2 Prova`.`Ator` (`ID_Ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

