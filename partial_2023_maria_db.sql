-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 24-11-2023 a las 10:15:24
-- Versión del servidor: 10.10.2-MariaDB
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `partial_2023_maria_db`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `generate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate` ()   BEGIN

SET @dni = (SELECT dni FROM registro WHERE id=1);

/*Create tables*/

-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00'),
('12121', 'Wu', 'Finance', '90000.00'),
('15151', 'Mozart', 'Music', '40000.00'),
('22222', 'Einstein', 'Physics', '95000.00'),
('32343', 'El Said', 'History', '60000.00'),
('33456', 'Gold', 'Physics', '87000.00'),
('45565', 'Katz', 'Comp. Sci.', '75000.00'),
('58583', 'Califieri', 'History', '62000.00'),
('76543', 'Singh', 'Finance', '80000.00'),
('76766', 'Crick', 'Biology', '72000.00'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00'),
('98345', 'Kim', 'Elec. Eng.', '80000.00');


--
-- Volcado de datos para la tabla `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('10101', 'CS-101', '1', 'Fall', '2017'),
('10101', 'CS-315', '1', 'Spring', '2018'),
('10101', 'CS-347', '1', 'Fall', '2017'),
('12121', 'FIN-201', '1', 'Spring', '2018'),
('15151', 'MU-199', '1', 'Spring', '2018'),
('22222', 'PHY-101', '1', 'Fall', '2017'),
('32343', 'HIS-351', '1', 'Spring', '2018'),
('45565', 'CS-101', '1', 'Spring', '2018'),
('45565', 'CS-319', '1', 'Spring', '2018'),
('76766', 'BIO-101', '1', 'Summer', '2017'),
('76766', 'BIO-301', '1', 'Summer', '2018'),
('83821', 'CS-190', '1', 'Spring', '2017'),
('83821', 'CS-190', '2', 'Spring', '2017'),
('83821', 'CS-319', '2', 'Spring', '2018'),
('98345', 'EE-181', '1', 'Spring', '2017');

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

INSERT INTO `ddl_2023` ( `enunciado`,ddl_2023.dni,ddl_2023.user) VALUES
('Modifique la estructura de la relación “instructor” de la base de datos sabiendo  que el atributo ID identifica unívocamente a cada instructor y no puede  ser nulo ni negativo, y preservando la data registrada correspondiente de forma óptima. Resuelva los problemas que aparezcan con sus conocimientos de SQL.',@dni,USER()),
('Rectifique el error cometido al definir el atributo name con una longitud máxima de 20 -de forma tal que quede optimizado y no pueda ser nulo - y prepare la relación "instructor" para ejecutar búsquedas por letras mayúsculas en la columna name, definiendo un charset de utf8mb4 y su collate correspondiente a la última versión de mysql.',@dni,USER()),
('Una nueva regla del Negocio permite a los instructores dar clases en varios departamentos. Configure la relación "instructor" para que esto sea posible,  utilizando el nombre de los departamentos dados definiendo un charset en utf8mb4, un collate en unicode_ci y considerando que de forma predeterminada la data puede ser null.',@dni,USER()),
('Se requiere modificar el campo "year" para adecuarlo a un formato de fecha que solo considere el año y que no sea null;',@dni,USER()),
('Se ha acordado eliminar el atributo de sec_id perteneciente a la relación teaches. Ejecute la operación.',@dni,USER()),
('Coloque el campo ID al final de las columnas de la tabla teaches.',@dni,USER()),
('Modifique la estructura de la relación “teaches” de la base de datos sabiendo  que el atributo ID identifica unívocamente a cada instructor y no puede  ser nulo. Modifique el atributo ID de acuerdo a  los cambios realizados en la tabla "instructor" pero teniendo en cuenta el índice correspondiente.',@dni,USER()),
('Cree una vista vertical de forma tal que se pueda visualizar el edificio (building) donde dan clases los instructores.',@dni,USER()),
('Cree una vista "increment" que permita visualizar el incremento que recibirá cada instructor ante una subida salarial del 5%.',@dni,USER());

INSERT INTO `dml_2023` (`enunciado`,dni,dml_2023.user) VALUES
('Realice una búsqueda de los instructores cuyo nombre comience con S',@dni,USER()),
('Los profesores Wu y Gold han sido asignados para dar clases en los departamentos de Finance, Music e History. Actualice la relación instructor con estos nuevos datos.',@dni,USER()),
('Se desea encontrar el conjunto  de todos los instructores que pertenecen al departamento de historia que cobran menos de 62000 euros.',@dni,USER()),
('Crear una vista "instructor_semester" con todos los instructores con los semestres de las asignaturas que enseñan.',@dni,USER()),
('Crear una vista instructor_semester_ii con todos los profesores y semestres registrados.',@dni,USER()),
('Lista todos los instructores que han dado clases en el semestre de Otoño (Fall) entre el  2017 y 2018.',@dni,USER()),
('Crea una función que permita contar el número de instructores que trabajan en cualquier semestre dado.',@dni,USER()),
('Cree un procedimiento almacenado que permita introducir incrementos procentuales al salario de un profesor.',@dni,USER()),
('Cree un disparador que muestre un mensaje si se intenta introducir un valor nulo en el campo de dept_name de la tabla departamento',@dni,USER());

END$$

DROP PROCEDURE IF EXISTS `generateTables`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateTables` ()   BEGIN
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 ,
  `name` varchar(20) CHARACTER SET utf8mb4 ,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 ,
  `salary` decimal(8,2) DEFAULT NULL,
  `student_lastname` varchar(100) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `teaches`;
CREATE TABLE IF NOT EXISTS `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 ,
  `course_id` varchar(8) CHARACTER SET utf8mb4 ,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 ,
  `semester` varchar(6) CHARACTER SET utf8mb4 ,
  `year` decimal(4,0) NOT NULL,
    `student_lastname` varchar(100) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 ,
  `building` varchar(15) CHARACTER SET utf8mb4 ,
  `budget` decimal(12,2) DEFAULT NULL,
    `student_lastname` varchar(100) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ;



END$$

DROP PROCEDURE IF EXISTS `logs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logs` ()   BEGIN 
DECLARE instructor varchar(20);
SET @bd_name = DATABASE();
SET instructor = (SELECT DISTINCT`TABLE_NAME` FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @bd_name AND COLUMNS.TABLE_NAME = 'instructor');
 -- SELECT instructor;
IF(instructor='instructor') THEN 
     INSERT INTO reg_conf  SELECT  `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `DATETIME_PRECISION`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY` FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = @bd_name AND COLUMNS.TABLE_NAME = 'instructor';
ELSE
INSERT INTO `reg_conf`(`TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `DATETIME_PRECISION`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`) VALUES ('No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor','No hay tabla instructor');
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ddl_2023`
--

DROP TABLE IF EXISTS `ddl_2023`;
CREATE TABLE IF NOT EXISTS `ddl_2023` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `enunciado` text NOT NULL,
  `query` text NOT NULL,
  `created_in` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_in` timestamp NOT NULL DEFAULT current_timestamp(),
  `dni` varchar(100) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dml_2023`
--

DROP TABLE IF EXISTS `dml_2023`;
CREATE TABLE IF NOT EXISTS `dml_2023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` longtext DEFAULT NULL,
  `conjuntos` text DEFAULT NULL,
  `operations` varchar(50) DEFAULT NULL,
  `query_ar` text DEFAULT NULL,
  `query_sql` text DEFAULT NULL,
  `created_in` timestamp NOT NULL,
  `updated_in` timestamp NOT NULL DEFAULT current_timestamp(),
  `dni` varchar(255) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `dml_2023`
--
DROP TRIGGER IF EXISTS `updated_in`;
DELIMITER $$
CREATE TRIGGER `updated_in` BEFORE UPDATE ON `dml_2023` FOR EACH ROW BEGIN
SET NEW.updated_in = NOW();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `created_in` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `registro`
--
DROP TRIGGER IF EXISTS `generate`;
DELIMITER $$
CREATE TRIGGER `generate` AFTER INSERT ON `registro` FOR EACH ROW BEGIN
SET @count_id =(SELECT COUNT(id) FROM registro);
SET @id =(SELECT id FROM registro WHERE id=1);
SET @bd_name = DATABASE();
CALL generate();
IF(@count_id=1 AND @id=1)THEN
SET @instructor_table = (SELECT CREATE_TIME FROM information_schema.TABLES WHERE TABLE_SCHEMA = @bd_name AND TABLES.TABLE_NAME = 'instructor'); 
UPDATE instructor SET student_lastname = NEW.nombre, student_lastname = NEW.apellidos , dni = NEW.dni , instructor.user = USER(),created_in = @instructor_table;

SET @department_table = (SELECT CREATE_TIME FROM information_schema.TABLES WHERE TABLE_SCHEMA = @bd_name AND TABLES.TABLE_NAME = 'department'); 
UPDATE department SET student_lastname = NEW.nombre, student_lastname = NEW.apellidos , dni = NEW.dni ,  department.user = USER(),created_in = @department_table;

SET @teaches_table = (SELECT CREATE_TIME FROM information_schema.TABLES WHERE TABLE_SCHEMA = @bd_name AND TABLES.TABLE_NAME = 'teaches'); 
UPDATE teaches SET student_lastname = NEW.nombre, student_lastname = NEW.apellidos , dni = NEW.dni ,  teaches.user = USER(),created_in = @teaches_table;
ELSE
DELETE FROM instructor;
DELETE FROM department;
DELETE FROM teaches;
DELETE FROM ddl_2023;
DELETE FROM dml_2023;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_conf`
--

DROP TABLE IF EXISTS `reg_conf`;
CREATE TABLE IF NOT EXISTS `reg_conf` (
  `TABLE_SCHEMA` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TABLE_NAME` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ORDINAL_POSITION` int(10) UNSIGNED NOT NULL,
  `COLUMN_DEFAULT` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IS_NULLABLE` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DATA_TYPE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NUMERIC_PRECISION` bigint(20) UNSIGNED DEFAULT NULL,
  `NUMERIC_SCALE` bigint(20) UNSIGNED DEFAULT NULL,
  `DATETIME_PRECISION` int(10) UNSIGNED DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `COLLATION_NAME` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `COLUMN_TYPE` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `COLUMN_KEY` enum('','PRI','UNI','MUL') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$
--
-- Eventos
--
DROP EVENT IF EXISTS `config_event`$$
CREATE DEFINER=`root`@`localhost` EVENT `config_event` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-11-24 14:22:00' ENDS '2023-11-24 16:00:00' ON COMPLETION PRESERVE ENABLE DO CALL logs()$$

DROP EVENT IF EXISTS `generate`$$
CREATE DEFINER=`root`@`localhost` EVENT `generate` ON SCHEDULE AT '2023-11-24 14:22:00' ON COMPLETION PRESERVE ENABLE DO CALL generateTables()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
