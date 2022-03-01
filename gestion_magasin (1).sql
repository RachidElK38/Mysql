-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 fév. 2022 à 16:51
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CodeClient` char(4) NOT NULL,
  `NomClient` char(12) DEFAULT NULL,
  `PrenomClient` char(12) DEFAULT NULL,
  `AdrClient` varchar(50) DEFAULT NULL,
  `TeleClient` varchar(15) DEFAULT NULL,
  `EmailClient` varchar(50) DEFAULT NULL,
  `MDPClient` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CodeClient`, `NomClient`, `PrenomClient`, `AdrClient`, `TeleClient`, `EmailClient`, `MDPClient`) VALUES
('C001', 'Bari', 'Zakaria', 'Rue de la Buanderie, 1 - 1000, Bruxelles-Bélgique', '+212694163887', 'zakariabari213@gmail.com', '*********'),
('C002', 'Salmi', 'Amine', 'Quariter de la banlieue, Naples-Italie', '+212981682334', 'aminesalmi2@gmail.com', '**********'),
('C003', 'El Amrani', 'Mouad', 'Quartier Bir Chifa, Hay Bendibane n°22 Tanger-Maro', '+212616304098', 'mouad435@gmail.com', '**********'),
('C004', 'Fichtali', 'Zakaria', 'Rsd HAY RIYAD, Batiment Al Warda n°75, Rabat-Maroc', '+212700331230', 'zaaxfichtali2@gmail.com', '********'),
('C005', 'Nabile', 'Ibnhaqqi', 'Punta Diamante, Acapulco-Mexique', '+212791940215', 'nabiledubendo@gmail.com', '**********');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `NumComd` char(5) NOT NULL,
  `AdrLiv` varchar(250) DEFAULT NULL,
  `DateComd` date DEFAULT NULL,
  `idClient` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`NumComd`, `AdrLiv`, `DateComd`, `idClient`) VALUES
('Cm01', 'Rsd HAY RIYAD, Batiment Al Warda n°75, Rabat-Maroc', '2021-10-22', 'C001'),
('Cm02', 'Rsd HAY RIYAD, Batiment Al Warda n°75, Rabat-Maroc', '2021-11-01', 'C001'),
('Cm03', 'Rsd HAY RIYAD, Batiment Al Warda n°75, Rabat-Maroc', '2021-12-15', 'C001'),
('Cm14', 'Punta Diamante, Acapulco-Mexique', '2021-12-24', 'C002'),
('Cm15', 'Punta Diamante, Acapulco-Mexique', '2021-12-26', 'C002'),
('Cm16', 'Punta Diamante, Acapulco-Mexique', '2021-12-29', 'C002'),
('Cm17', 'Punta Diamante, Acapulco-Mexique', '2021-12-30', 'C002'),
('Cm20', 'Rue de la Buanderie, 1 - 1000, Bruxelles-Bélgique', '2022-01-04', 'C003'),
('Cm21', 'Rue de la Buanderie, 1 - 1000, Bruxelles-Bélgique', '2022-01-11', 'C003'),
('Cm33', 'Quartier Bir Chifa, Hay Bendibane n°22 Tanger-Maro', '2022-01-31', 'C004'),
('Cm40', 'Quariter de la banlieue, Naples-Italie', '2022-02-13', 'C005'),
('Cm42', 'Quariter de la banlieue, Naples-Italie', '2022-02-20', 'C005');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `idCom` char(5) NOT NULL,
  `idProd` char(4) NOT NULL,
  `QteCommande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`idCom`, `idProd`, `QteCommande`) VALUES
('Cm01', '01B5', 2),
('Cm02', '12K0', 5),
('Cm03', '96P2', 9),
('Cm14', '65G0', 1),
('Cm15', '17M8', 6),
('Cm16', '12K0', 3),
('Cm17', '01B5', 11),
('Cm20', '17M8', 4),
('Cm21', '96P2', 7),
('Cm33', '01B5', 1),
('Cm40', '65G0', 10),
('Cm42', '12K0', 8);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `IDProduit` char(4) NOT NULL,
  `NomProduit` varchar(30) DEFAULT NULL,
  `DescProduit` varchar(255) DEFAULT NULL,
  `PrixProduit` decimal(10,0) DEFAULT NULL,
  `QteStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`IDProduit`, `NomProduit`, `DescProduit`, `PrixProduit`, `QteStock`) VALUES
('01B5', 'COVER COCO', 'COVER COCO  Fondation liquide, Fond de teint chang', '195', 30),
('12K0', 'Cinema Shampoing', 'Cinema Hair Color Shampoo est un nouveau produit de soins capillaires dans la formule des médicaments à base des plantes français de luxe naturels, développé par Yucaitang Centre international de recherche sur la base des caractéristiques de cheveux orien', '980', 100),
('17M8', 'Ducray Neo', 'Ducray Neoptide Lotion Anti-Chute Femme 3 x 30 ml ', '420', 2),
('65G0', 'Cinema Sha', 'Cinema Hair Color Shampoo est un nouveau produit d', '97', 12),
('96P2', 'DaQan ', 'Cette huile est enrichie de multiples ingrédients ', '82', 10);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CodeClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`NumComd`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`idCom`,`idProd`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`IDProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
