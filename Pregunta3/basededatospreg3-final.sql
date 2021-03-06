CREATE SCHEMA IF NOT EXISTS `dbcolegio_preg3_1` DEFAULT CHARACTER SET utf8 ;
USE `dbcolegio_preg3` ;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Curso` (
  `idCurso` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(256) NULL,
  `Precio` DECIMAL(11,2) NOT NULL,
  `Horario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `Nombre` VARCHAR(200) NOT NULL,
  `Foto` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(256) NULL,
  PRIMARY KEY (`idPofesor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Nosotros` (
  `idNosotros` INT NOT NULL,
  `Profesor` INT NOT NULL,
  PRIMARY KEY (`idNosotros`, `Profesor`),
  INDEX `fk_nosotros_profesor_idx` (`Profesor` ASC) VISIBLE,
  CONSTRAINT `fk_nosotros_profesor`
    FOREIGN KEY (`Profesor`)
    REFERENCES `dbcolegio_preg3`.`Pofesor` (`idPofesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Alumno` (
  `DNI` CHAR(8) NOT NULL,
  `Nombre` VARCHAR(200) NOT NULL,
  `Celular` VARCHAR(9) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `Celular_UNIQUE` (`Celular` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `IdAlumno` CHAR(8) NOT NULL,
  `Fecha_Matricula` DATE NOT NULL,
  `Total` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`idMatricula`, `IdAlumno`),
  UNIQUE INDEX `IdAlumno_UNIQUE` (`IdAlumno` ASC) VISIBLE,
  UNIQUE INDEX `idMatriculas_UNIQUE` (`idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_alumno`
    FOREIGN KEY (`IdAlumno`)
    REFERENCES `dbcolegio_preg3`.`Alumno` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`DetalleMatricula` (
  `idDetalleMatricula` INT NOT NULL,
  `IdMatricula` INT NOT NULL,
  `IdCurso` INT NOT NULL,
  `Horario` VARCHAR(45) NOT NULL,
  `Subtotal` DECIMAL(11,2) NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NOT NULL,
  PRIMARY KEY (`idDetalleMatricula`, `IdMatricula`, `IdCurso`),
  UNIQUE INDEX `idDetalleMatricula_UNIQUE` (`idDetalleMatricula` ASC) VISIBLE,
  INDEX `fk_detalle_matricula_idx` (`IdMatricula` ASC) VISIBLE,
  INDEX `fk_detalle_curso_idx` (`IdCurso` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_matricula`
    FOREIGN KEY (`IdMatricula`)
    REFERENCES `dbcolegio_preg3`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_curso`
    FOREIGN KEY (`IdCurso`)
    REFERENCES `dbcolegio_preg3`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`alumno_curso` (
  `idAlumno` CHAR(8) NOT NULL,
  `idCurso` INT NOT NULL,
  INDEX `fk_alumnocurso_alumno_idx` (`idAlumno` ASC) VISIBLE,
  INDEX `fk_alumnocurso_curso_idx` (`idCurso` ASC) VISIBLE,
  PRIMARY KEY (`idCurso`, `idAlumno`),
  CONSTRAINT `fk_alumnocurso_alumno`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `dbcolegio_preg3`.`Alumno` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnocurso_curso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `dbcolegio_preg3`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbcolegio_preg3`.`Curso_has_Profesor` (
  `Curso_idCurso` INT NOT NULL,
  `Profesor_idProfesor` INT NOT NULL,
  PRIMARY KEY (`Curso_idCurso`, `Profesor_idProfesor`),
  INDEX `fk_Curso_has_Profesor_Profesor1_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  INDEX `fk_Curso_has_Profesor_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Profesor_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `dbcolegio_preg3`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Profesor_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `dbcolegio_preg3`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
