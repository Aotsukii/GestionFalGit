-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 08, 2018 at 03:13 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionfal`
--

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

CREATE TABLE `filiere` (
  `ID_FILIERE` int(11) NOT NULL,
  `LIB_FILIERE` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`ID_FILIERE`, `LIB_FILIERE`) VALUES
(1, 'Sciences'),
(2, 'Droit'),
(3, 'Pharmacie'),
(4, 'Sage-Femme'),
(5, 'Lettres'),
(6, 'Medecine'),
(7, 'Dentaire'),
(8, 'STAPS');

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `FRIEND_FROM` int(11) NOT NULL,
  `FRIEND_TO` int(11) NOT NULL,
  `FRIEND_STATUS` tinyint(1) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `ID_USER` int(11) NOT NULL,
  `NOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `PRENOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `SURNOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin NOT NULL,
  `DATEBAPT_USER` date NOT NULL,
  `TEL_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `MAIL_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `MAILAUTH_USER` tinyint(1) NOT NULL,
  `ID_FILIERE` int(11) DEFAULT NULL,
  `ID_ROLE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`ID_USER`, `NOM_USER`, `PRENOM_USER`, `SURNOM_USER`, `PASSWORD`, `DATEBAPT_USER`, `TEL_USER`, `MAIL_USER`, `MAILAUTH_USER`, `ID_FILIERE`, `ID_ROLE`) VALUES
(1, 'GAZEL', 'Elie', 'Geekeloro', '3df177c2ae459f462ec6338dac917a1728cba040', '2017-05-20', '0676894068', 'elie@gazel.net', 1, 1, 1),
(2, 'ROUBY', 'Damien', 'GSSM', 'f23f6d6e2b8f6a684a164266b8c891e344b62116', '2017-05-30', '0123456789', 'damien.rouby@test.test', 0, 1, 2),
(3, 'TEISSIER', 'ORIANE', 'TORNADO', 'c01e8fbff72ac35cbfd9d4640bc1628c504cbc1a', '2014-01-01', '0123456897', 'TEISSIER.ORIANE@TEST.TEST', 1, 2, 1),
(4, 'ELHALW', 'Mohammed', 'Novice', '16ca44702a9bce35349783e2780b3564876b28c6', '0000-00-00', '3216549870', 'novice@novice.novice', 1, 6, 3),
(5, 'qsdqsd', 'qsdqsdqs', '', '0dc9946c1158e7a9bdca0c59c98e89d559ffba8d', '0000-00-00', '', 'dffdggfd@hjkjjkh', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_ROLE` int(11) NOT NULL,
  `LIB_ROLE` varchar(1000) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID_ROLE`, `LIB_ROLE`) VALUES
(1, 'Croix'),
(2, 'Faluchard'),
(3, 'Impetrant');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `NOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `PRENOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `SURNOM_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin NOT NULL,
  `DATEBAPT_USER` date NOT NULL,
  `TEL_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `MAIL_USER` varchar(50) COLLATE utf8_bin NOT NULL,
  `MAILAUTH_USER` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_USER`, `NOM_USER`, `PRENOM_USER`, `SURNOM_USER`, `PASSWORD`, `DATEBAPT_USER`, `TEL_USER`, `MAIL_USER`, `MAILAUTH_USER`) VALUES
(1, 'GAZEL', 'Elie', 'Geekeloro', '3df177c2ae459f462ec6338dac917a1728cba040', '2017-05-20', '0676894068', 'elie@gazel.net', 1),
(2, 'ROUBY', 'Damien', 'GSSM', 'f23f6d6e2b8f6a684a164266b8c891e344b62116', '2017-05-30', '0123456789', 'damien.rouby@test.test', 0),
(3, 'TEISSIER', 'ORIANE', 'TORNADO', 'c01e8fbff72ac35cbfd9d4640bc1628c504cbc1a', '2014-01-01', '0123456897', 'TEISSIER.ORIANE@TEST.TEST', 1),
(4, 'ELHALW', 'Mohammed', 'Novice', '16ca44702a9bce35349783e2780b3564876b28c6', '0000-00-00', '3216549870', 'novice@novice.novice', 1),
(5, 'qsdqsd', 'qsdqsdqs', '', '0dc9946c1158e7a9bdca0c59c98e89d559ffba8d', '0000-00-00', '', 'dffdggfd@hjkjjkh', 0);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `ins_on_membre` AFTER INSERT ON `user` FOR EACH ROW BEGIN
INSERT INTO membre (ID_USER,NOM_USER,PRENOM_USER,SURNOM_USER,PASSWORD,DATEBAPT_USER,TEL_USER,MAIL_USER,MAILAUTH_USER) VALUE (new.ID_USER,new.NOM_USER,new.PRENOM_USER,new.SURNOM_USER,new.PASSWORD,new.DATEBAPT_USER,new.TEL_USER,new.MAIL_USER,new.MAILAUTH_USER);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

CREATE TABLE `user_post` (
  `ID_POST` int(11) NOT NULL,
  `TITLE_POST` varchar(50) COLLATE utf8_bin NOT NULL,
  `CONTENT_POST` varchar(1000) COLLATE utf8_bin NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`ID_FILIERE`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`FRIEND_FROM`,`FRIEND_TO`),
  ADD KEY `FRIEND_USER_FK` (`ID_USER`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `MEMBRE_FILIERE0_FK` (`ID_FILIERE`),
  ADD KEY `MEMBRE_ROLE1_FK` (`ID_ROLE`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_ROLE`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`ID_POST`),
  ADD KEY `USER_POST_USER_FK` (`ID_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `ID_FILIERE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_post`
--
ALTER TABLE `user_post`
  MODIFY `ID_POST` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `FRIEND_USER_FK` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `MEMBRE_FILIERE0_FK` FOREIGN KEY (`ID_FILIERE`) REFERENCES `filiere` (`ID_FILIERE`),
  ADD CONSTRAINT `MEMBRE_ROLE1_FK` FOREIGN KEY (`ID_ROLE`) REFERENCES `role` (`ID_ROLE`),
  ADD CONSTRAINT `MEMBRE_USER_FK` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);

--
-- Constraints for table `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `USER_POST_USER_FK` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
