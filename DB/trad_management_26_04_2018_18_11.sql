-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 26 avr. 2018 à 17:11
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `trad_management`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnementplatforms`
--

DROP TABLE IF EXISTS `abonnementplatforms`;
CREATE TABLE IF NOT EXISTS `abonnementplatforms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_packabonnementplatform` int(10) UNSIGNED NOT NULL,
  `type_payment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_payment` int(11) NOT NULL,
  `periode` date NOT NULL,
  `total_pay` double(8,2) NOT NULL DEFAULT '0.00',
  `paid` double(8,2) NOT NULL DEFAULT '0.00',
  `finished` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abonnementplatforms_id_personne_foreign` (`id_personne`),
  KEY `abonnementplatforms_id_packabonnementplatform_foreign` (`id_packabonnementplatform`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonnementplatforms`
--

INSERT INTO `abonnementplatforms` (`id`, `id_personne`, `id_packabonnementplatform`, `type_payment`, `id_payment`, `periode`, `total_pay`, `paid`, `finished`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Bank', 2, '2018-06-20', 10803.68, 10803.68, 0, '2018-03-20 22:24:26', '2018-04-14 14:03:53'),
(2, 2, 1, 'Wallet', 8, '2019-01-20', 26166.00, 13083.00, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(3, 3, 1, 'Wallet', 8, '2019-01-20', 19218.00, 9609.00, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(4, 4, 1, 'Wallet', 9, '2018-05-20', 14973.00, 7486.50, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(5, 5, 1, 'Wallet', 8, '2018-06-20', 1121.00, 560.50, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(6, 6, 1, 'Wallet', 10, '2018-10-20', 17216.00, 8608.00, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(7, 7, 1, 'Bank', 2, '2019-01-20', 11813.00, 5906.50, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(8, 8, 1, 'Wallet', 10, '2018-07-20', 15060.00, 7530.00, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(9, 9, 1, 'Bank', 4, '2018-06-20', 3031.00, 1515.50, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(10, 10, 1, 'Wallet', 3, '2019-01-20', 2953.00, 1476.50, 0, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(11, 1, 1, 'Wallet', 8, '1989-03-28', 27721.00, 27721.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(12, 2, 1, 'Wallet', 10, '1984-04-19', 16650.00, 16650.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(13, 3, 1, 'Bank', 6, '1988-09-03', 17416.00, 17416.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(14, 4, 1, 'Wallet', 1, '2004-10-17', 13052.00, 13052.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(15, 5, 1, 'Wallet', 4, '2007-01-05', 19211.00, 19211.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(16, 6, 1, 'Bank', 1, '2005-10-12', 16123.00, 16123.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(17, 7, 1, 'Bank', 1, '2010-06-17', 12176.00, 12176.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(18, 8, 1, 'Bank', 5, '2014-12-16', 8044.00, 8044.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(19, 9, 1, 'Wallet', 3, '2008-03-12', 25068.00, 25068.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27'),
(20, 10, 1, 'Wallet', 1, '1989-10-03', 8187.00, 8187.00, 1, '2018-03-20 22:24:27', '2018-03-20 22:24:27');

-- --------------------------------------------------------

--
-- Structure de la table `abonnements`
--

DROP TABLE IF EXISTS `abonnements`;
CREATE TABLE IF NOT EXISTS `abonnements` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double(8,2) NOT NULL,
  `description_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `popular` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonnements`
--

INSERT INTO `abonnements` (`id`, `titre`, `prix`, `description_1`, `description_2`, `popular`, `created_at`, `updated_at`) VALUES
(1, 'Bronze', 1000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(2, 'Silver', 2000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(3, 'Gold', 5000.00, 'Between 130% and 300%', 'Depending to your Rank', 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(4, 'Platinum', 10000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(5, 'Diamond', 25000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-03-20 22:24:20', '2018-03-20 22:24:20');

-- --------------------------------------------------------

--
-- Structure de la table `bankaccounts`
--

DROP TABLE IF EXISTS `bankaccounts`;
CREATE TABLE IF NOT EXISTS `bankaccounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_bank` int(10) UNSIGNED NOT NULL,
  `bank_account_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bankaccounts_id_personne_foreign` (`id_personne`),
  KEY `bankaccounts_id_bank_foreign` (`id_bank`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bankaccounts`
--

INSERT INTO `bankaccounts` (`id`, `id_personne`, `id_bank`, `bank_account_number`, `bank_account_country`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '4777216845123', 'Guyana', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(2, 1, 2, '52415326288202783', 'Haiti', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(3, 1, 3, '0474368140144', 'Zimbabwe', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(4, 1, 4, '904100', 'Portugal', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(5, 1, 5, '35352422', 'Pakistan', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(6, 2, 1, '128743243', 'Macao', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(7, 2, 2, '9166169041315', 'Peru', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(8, 2, 3, '998385672828653', 'Yemen', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(9, 2, 4, '063527079805', 'Greenland', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(10, 2, 5, '5564757737232', 'French Polynesia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(11, 3, 3, '0278999191249', 'Saint Martin', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(12, 4, 1, '05558600559', 'El Salvador', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(13, 5, 3, '6705380610', 'Indonesia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(14, 6, 3, '534877733219', 'Bolivia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(15, 7, 5, '4287479', 'Central African Republic', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(16, 8, 3, '7279844249477950', 'Somalia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(17, 9, 5, '1343434', 'Yemen', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(18, 10, 1, '3340915232408', 'Solomon Islands', '2018-03-20 22:24:23', '2018-03-20 22:24:23');

-- --------------------------------------------------------

--
-- Structure de la table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `banks`
--

INSERT INTO `banks` (`id`, `bank`, `created_at`, `updated_at`) VALUES
(1, 'BANK 1', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(2, 'BANK 2', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(3, 'BANK 3', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(4, 'BANK 4', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(5, 'BANK 5', '2018-03-20 22:24:22', '2018-03-20 22:24:22');

-- --------------------------------------------------------

--
-- Structure de la table `bankwallets`
--

DROP TABLE IF EXISTS `bankwallets`;
CREATE TABLE IF NOT EXISTS `bankwallets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_currencie` int(10) UNSIGNED NOT NULL,
  `wallet_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_adresse` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bankwallets_id_personne_foreign` (`id_personne`),
  KEY `bankwallets_id_currencie_foreign` (`id_currencie`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bankwallets`
--

INSERT INTO `bankwallets` (`id`, `id_personne`, `id_currencie`, `wallet_name`, `wallet_adresse`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ex', '5631800735760', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(2, 1, 2, 'possimus', '0611903194', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(3, 1, 3, 'ea', '0419534', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(4, 1, 4, 'necessitatibus', '413677285383', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(5, 1, 5, 'rerum', '00222621', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(6, 2, 1, 'unde', '6443238100', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(7, 2, 2, 'est', '79464595302', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(8, 2, 3, 'ipsa', '85604754', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(9, 2, 4, 'dolor', '2430353916', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(10, 2, 5, 'sapiente', '30790134466116', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(11, 3, 4, 'neque', '080823306965', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(12, 4, 4, 'nihil', '5950854918', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(13, 5, 4, 'exercitationem', '5490501', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(14, 6, 2, 'ut', '80524130', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(15, 7, 2, 'quibusdam', '65286847943935', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(16, 8, 2, 'ut', '02872709', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(17, 9, 5, 'in', '662707982244468', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(18, 10, 2, 'excepturi', '290307714', '2018-03-20 22:24:24', '2018-03-20 22:24:24');

-- --------------------------------------------------------

--
-- Structure de la table `companyaccounts`
--

DROP TABLE IF EXISTS `companyaccounts`;
CREATE TABLE IF NOT EXISTS `companyaccounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_bank` int(10) UNSIGNED NOT NULL,
  `bank_account_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyaccounts_id_bank_foreign` (`id_bank`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `companyaccounts`
--

INSERT INTO `companyaccounts` (`id`, `id_bank`, `bank_account_number`, `bank_account_country`, `created_at`, `updated_at`) VALUES
(1, 1, '3611953928', 'Cambodia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(2, 5, '39398209721', 'Swaziland', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(3, 2, '063715813083', 'Bahamas', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(4, 2, '835972010', 'Saint Pierre and Miquelon', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(5, 5, '40299285400158', 'Netherlands Antilles', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(6, 5, '68253358', 'Indonesia', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(7, 4, '579686831848', 'Christmas Island', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(8, 2, '9116190', 'Saint Martin', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(9, 2, '580551', 'Cyprus', '2018-03-20 22:24:23', '2018-03-20 22:24:23'),
(10, 3, '312982203550', 'Ukraine', '2018-03-20 22:24:23', '2018-03-20 22:24:23');

-- --------------------------------------------------------

--
-- Structure de la table `companywallets`
--

DROP TABLE IF EXISTS `companywallets`;
CREATE TABLE IF NOT EXISTS `companywallets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_currencie` int(10) UNSIGNED NOT NULL,
  `wallet_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_adresse` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companywallets_id_currencie_foreign` (`id_currencie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `companywallets`
--

INSERT INTO `companywallets` (`id`, `id_currencie`, `wallet_name`, `wallet_adresse`, `created_at`, `updated_at`) VALUES
(1, 1, 'occaecati', '871792050853', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(2, 5, 'dolor', '7677951239', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(3, 3, 'non', '52735411', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(4, 3, 'corrupti', '1805410933182', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(5, 3, 'ratione', '51781366596', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(6, 1, 'omnis', '497616', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(7, 3, 'deleniti', '496286284', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(8, 3, 'consequatur', '1888028900', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(9, 1, 'perspiciatis', '920793228', '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(10, 1, 'maxime', '218950719352', '2018-03-20 22:24:24', '2018-03-20 22:24:24');

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currencie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currencies`
--

INSERT INTO `currencies` (`id`, `currencie`, `created_at`, `updated_at`) VALUES
(1, 'Currencie 1', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(2, 'Currencie 2', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(3, 'Currencie 3', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(4, 'Currencie 4', '2018-03-20 22:24:22', '2018-03-20 22:24:22'),
(5, 'Currencie 5', '2018-03-20 22:24:22', '2018-03-20 22:24:22');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_parrain` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `membres_id_personne_foreign` (`id_personne`),
  KEY `membres_id_parrain_foreign` (`id_parrain`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id`, `id_personne`, `id_parrain`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(2, 2, 2, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(3, 3, 3, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(4, 4, 3, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(5, 5, 4, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(6, 6, 4, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(7, 7, 10, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(8, 8, 8, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(9, 9, 6, '2018-03-20 22:24:16', '2018-03-20 22:24:16'),
(10, 10, 1, '2018-03-20 22:24:16', '2018-03-20 22:24:16');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `id_personne`, `message`, `read`, `created_at`, `updated_at`) VALUES
(1, 1, 'Eveniet ad modi doloribus et exercitationem saepe. Rem optio voluptas dolorem inventore quia hic voluptatum. Eaque eos et occaecati. Nisi sed voluptas quia.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(2, 1, 'Enim est provident sequi perspiciatis. Quia voluptatem quibusdam hic est. Aspernatur ad eos eum. Debitis exercitationem voluptatibus error reiciendis. Unde qui facere laboriosam autem tempora.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(3, 2, 'Deserunt sit qui rerum repudiandae. Sed at rerum optio accusamus dolorum voluptatem possimus magni.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(4, 2, 'Quasi commodi eius sunt veritatis consequatur omnis. Deleniti est eum recusandae at repellat. Voluptas voluptatem qui rem deserunt voluptatum. Molestiae quia nostrum numquam qui. Quam et rerum facilis velit delectus.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(5, 3, 'Enim ducimus aut officia assumenda. Odit enim porro unde ex. Non debitis nulla perferendis et dignissimos est.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(6, 3, 'Officia quis unde exercitationem incidunt debitis a eos. Debitis ducimus minima temporibus non rerum. Laudantium quasi dolorem non molestiae delectus assumenda distinctio. Ut corporis impedit commodi ipsum.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(7, 4, 'Occaecati perspiciatis nesciunt sunt quo asperiores quo itaque. A qui ratione ab dolor. Consequatur consequatur perspiciatis eligendi.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(8, 4, 'Alias voluptatem perferendis nulla eum sit quam enim nisi. Veritatis illo cupiditate excepturi sed vel rerum aliquam. Distinctio aut at alias sed maxime sequi provident.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(9, 5, 'Nesciunt ducimus repudiandae nihil ut voluptatibus voluptates. Iure sunt repellendus dolores vel. Quibusdam atque provident ut laboriosam animi aut harum. Consequuntur error qui quaerat officia quis.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(10, 5, 'Quis expedita error voluptas soluta. Omnis quas doloribus ducimus illo ut. Possimus et qui quia doloremque nemo quaerat. Quidem suscipit sit quos dolore sit nemo deleniti consequatur.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(11, 6, 'Incidunt laudantium et aut est quo quaerat. Illum quas odio iure quis quia. Aspernatur sunt velit enim error deleniti. Nemo itaque aut ut nam minima.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(12, 6, 'Dolorem tenetur ex unde consequatur est blanditiis eum. Qui dolor ab quis architecto officia doloremque. Voluptatibus unde facere officia quaerat necessitatibus.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(13, 7, 'Quam voluptatibus ipsa ut. Eveniet accusantium magni quas assumenda temporibus deleniti laboriosam. Laudantium excepturi et libero qui incidunt temporibus possimus. Cupiditate quo id odio.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(14, 7, 'Aut nemo consequuntur et inventore voluptas. Ullam perferendis assumenda aliquam laborum. Dolorum voluptatibus quasi incidunt quasi aliquid harum rerum. Similique ad odio quia dignissimos.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(15, 8, 'Laudantium est omnis quia quibusdam non. Ut minima velit qui ipsam nulla dicta consequatur. Quia ut officiis sit repellendus non et natus molestiae. Et blanditiis quia recusandae minima rerum sequi aperiam in. Distinctio rem nisi unde aliquam.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(16, 8, 'Eos voluptate illo et velit. Voluptas qui aliquam itaque eos a. Quia repellendus quia ut sed magni placeat et. Laudantium iure officiis nam minus illum eveniet quasi.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(17, 9, 'Est veniam necessitatibus dolorem perspiciatis ut. Incidunt magni sequi voluptatum eum error dolores esse assumenda. Ut vel quis ad voluptatem. Aut nam et illo quod possimus maxime reprehenderit veritatis.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(18, 9, 'Nulla eaque quo quae quasi molestiae libero atque quas. In temporibus vel sint placeat. Est et eum quia voluptas sapiente.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(19, 10, 'Iure non amet consequatur error enim error. Et autem voluptates et.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(20, 10, 'Cupiditate natus illum labore nam magnam tempora est expedita. In est distinctio dicta illum. Et reprehenderit ipsa corrupti aut officiis saepe ut.', 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(149, '2018_01_12_231851_create_tpersonnes_table', 1),
(150, '2018_01_12_232552_create_statuscomptes_table', 1),
(151, '2018_01_12_232652_create_personnes_table', 1),
(152, '2018_01_12_233833_create_membres_table', 1),
(153, '2018_01_13_000000_create_users_table', 1),
(154, '2018_01_13_004621_create_userlogs_table', 1),
(155, '2018_01_31_142753_create_niveau1s_table', 1),
(156, '2018_01_31_163901_create_niveau2s_table', 1),
(157, '2018_02_03_170527_create_rankings_table', 1),
(158, '2018_02_04_124133_create_abonnements_table', 1),
(159, '2018_02_04_143905_create_ontradings_table', 1),
(160, '2018_02_05_213041_create_posts_table', 1),
(161, '2018_02_06_134459_create_messages_table', 1),
(162, '2018_02_15_141303_create_banks_table', 1),
(163, '2018_02_15_145402_create_currencies_table', 1),
(164, '2018_02_17_133948_create_bankaccounts_table', 1),
(165, '2018_02_17_164232_create_companyaccounts_table', 1),
(166, '2018_02_17_230622_create_bankwallets_table', 1),
(167, '2018_02_18_002414_create_companywallets_table', 1),
(168, '2018_02_18_101437_create_supporttickets_table', 1),
(169, '2018_02_18_102145_create_supportticketmessages_table', 1),
(170, '2018_03_13_202938_create_questions_table', 1),
(171, '2018_03_13_205307_create_questreps_table', 1),
(172, '2018_03_18_144738_create_packabonnementplatforms_table', 1),
(173, '2018_03_18_165713_create_abonnementplatforms_table', 1),
(174, '2018_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `niveau1s`
--

DROP TABLE IF EXISTS `niveau1s`;
CREATE TABLE IF NOT EXISTS `niveau1s` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_parrain` int(10) UNSIGNED NOT NULL,
  `id_parraine` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `niveau1s_id_parrain_foreign` (`id_parrain`),
  KEY `niveau1s_id_parraine_foreign` (`id_parraine`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau1s`
--

INSERT INTO `niveau1s` (`id`, `id_parrain`, `id_parraine`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(2, 1, 3, '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(3, 1, 4, '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(4, 1, 5, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(5, 2, 6, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(6, 2, 7, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(7, 2, 8, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(8, 2, 9, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(9, 2, 10, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(10, 1, 11, '2018-04-09 12:24:23', '2018-04-09 12:24:23');

-- --------------------------------------------------------

--
-- Structure de la table `niveau2s`
--

DROP TABLE IF EXISTS `niveau2s`;
CREATE TABLE IF NOT EXISTS `niveau2s` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_parrain_base` int(10) UNSIGNED NOT NULL,
  `id_parrain_direct` int(10) UNSIGNED NOT NULL,
  `id_parraine` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `niveau2s_id_parrain_base_foreign` (`id_parrain_base`),
  KEY `niveau2s_id_parrain_direct_foreign` (`id_parrain_direct`),
  KEY `niveau2s_id_parraine_foreign` (`id_parraine`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau2s`
--

INSERT INTO `niveau2s` (`id`, `id_parrain_base`, `id_parrain_direct`, `id_parraine`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 6, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(2, 1, 2, 7, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(3, 1, 2, 8, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(4, 1, 2, 9, '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(5, 1, 2, 10, '2018-03-20 22:24:19', '2018-03-20 22:24:19');

-- --------------------------------------------------------

--
-- Structure de la table `ontradings`
--

DROP TABLE IF EXISTS `ontradings`;
CREATE TABLE IF NOT EXISTS `ontradings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_abonnement` int(10) UNSIGNED NOT NULL,
  `periode` date NOT NULL,
  `type_payment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_payment` int(11) NOT NULL,
  `type_get_paid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_get_paid` int(11) NOT NULL,
  `total_profit` double(8,2) NOT NULL DEFAULT '0.00',
  `paid` double(8,2) NOT NULL DEFAULT '0.00',
  `finished` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ontradings_id_personne_foreign` (`id_personne`),
  KEY `ontradings_id_abonnement_foreign` (`id_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ontradings`
--

INSERT INTO `ontradings` (`id`, `id_personne`, `id_abonnement`, `periode`, `type_payment`, `id_payment`, `type_get_paid`, `id_get_paid`, `total_profit`, `paid`, `finished`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1970-02-13', 'Wallet', 1, 'Wallet', 2, 9896.00, 4948.00, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(2, 1, 1, '2018-09-20', 'Bank', 6, 'Wallet', 5, 19713.00, 9856.50, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(3, 1, 2, '2004-04-30', 'Bank', 7, 'Wallet', 9, 7543.00, 3771.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(4, 1, 2, '2018-08-20', 'Wallet', 9, 'Bank', 2, 8000.00, 4000.00, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(5, 1, 3, '1973-06-05', 'Wallet', 9, 'Bank', 7, 18660.00, 9330.00, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(6, 1, 3, '2018-05-20', 'Wallet', 8, 'Bank', 6, 26131.00, 13065.50, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(7, 1, 4, '1982-02-13', 'Bank', 1, 'Wallet', 6, 26415.00, 13207.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(8, 1, 4, '2018-11-20', 'Bank', 3, 'Wallet', 10, 18170.00, 9085.00, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(9, 1, 5, '1990-10-22', 'Bank', 5, 'Bank', 2, 15671.00, 7835.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(10, 1, 5, '2018-04-05', 'Wallet', 6, 'Bank', 7, 20639.00, 10319.50, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(11, 2, 1, '2005-01-15', 'Bank', 5, 'Wallet', 3, 27773.00, 13886.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(12, 2, 1, '2018-04-20', 'Wallet', 5, 'Wallet', 4, 3242.00, 1621.00, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(13, 2, 2, '1978-03-30', 'Bank', 10, 'Wallet', 7, 29729.00, 14864.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(14, 2, 2, '2018-10-20', 'Bank', 1, 'Wallet', 8, 2173.00, 1086.50, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(15, 2, 3, '1995-01-28', 'Bank', 2, 'Bank', 10, 21462.00, 10731.00, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(16, 2, 3, '2018-06-20', 'Wallet', 3, 'Wallet', 8, 17813.00, 8906.50, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(17, 2, 4, '1983-01-22', 'Bank', 3, 'Bank', 8, 6567.00, 3283.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(18, 2, 4, '2018-10-20', 'Wallet', 3, 'Wallet', 3, 1072.00, 536.00, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(19, 2, 5, '2000-06-03', 'Bank', 9, 'Bank', 3, 11003.00, 5501.50, 1, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(20, 2, 5, '2018-07-20', 'Bank', 3, 'Bank', 3, 2534.00, 1267.00, 0, 1, '2018-03-20 22:24:20', '2018-03-20 22:24:20'),
(21, 3, 3, '2018-07-20', 'Bank', 1, 'Wallet', 8, 5671.00, 2835.50, 0, 1, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(22, 4, 4, '2019-01-20', 'Wallet', 9, 'Wallet', 9, 26430.00, 13215.00, 0, 1, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(23, 5, 1, '2018-09-20', 'Wallet', 9, 'Bank', 8, 22910.00, 11455.00, 0, 1, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(24, 6, 3, '2018-12-20', 'Bank', 6, 'Bank', 7, 21030.00, 10515.00, 0, 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(25, 7, 5, '2018-04-20', 'Wallet', 6, 'Bank', 1, 3840.00, 1920.00, 0, 1, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(26, 8, 2, '2018-12-20', 'Wallet', 5, 'Bank', 5, 27200.00, 13600.00, 0, 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(27, 9, 4, '2018-09-20', 'Bank', 8, 'Wallet', 2, 19258.00, 9629.00, 0, 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(28, 10, 2, '2019-01-20', 'Wallet', 7, 'Wallet', 5, 14595.00, 7297.50, 0, 0, '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(29, 1, 4, '2018-06-20', 'Bank', 10, 'Wallet', 2, 30000.00, 0.00, 0, 0, '2018-03-20 22:55:08', '2018-03-20 22:55:08');

-- --------------------------------------------------------

--
-- Structure de la table `packabonnementplatforms`
--

DROP TABLE IF EXISTS `packabonnementplatforms`;
CREATE TABLE IF NOT EXISTS `packabonnementplatforms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_pack_abonnement_platform` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_ut` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `packabonnementplatforms`
--

INSERT INTO `packabonnementplatforms` (`id`, `nom_pack_abonnement_platform`, `prix_ut`, `created_at`, `updated_at`) VALUES
(1, 'Pack Abonnement Platform 1', 71.34, '2018-03-20 22:24:26', '2018-03-20 22:24:26');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_tpersonne` int(10) UNSIGNED NOT NULL,
  `id_statuscompte` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_naissance` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` text COLLATE utf8mb4_unicode_ci,
  `adresse` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personnes_id_tpersonne_foreign` (`id_tpersonne`),
  KEY `personnes_id_statuscompte_foreign` (`id_statuscompte`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id`, `id_tpersonne`, `id_statuscompte`, `nom`, `prenom`, `date_naissance`, `telephone`, `adresse`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'O. Isom', 'David', '19/05/1999', '+1-706-831-9672', '2078 Riverside Drive\r\nAugusta, GA 30902', 'avatar.png', '2018-03-20 22:24:15', '2018-04-26 15:59:36'),
(2, 1, 4, 'Rylee', 'Smitham', '19/04/1974', '+1 (915) 725-9780', '51394 Rosalinda Keys Apt. 324\nPadbergport, KS 78560-7785', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(3, 2, 1, 'Arnulfo', 'Wiza', '03/01/1986', '+1-424-897-3592', '74297 Becker Extensions\nKshlerinland, OR 00548', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(4, 2, 4, 'Elody', 'Renner', '20/06/1996', '(550) 717-8195', '19795 Curtis Radial\nPfannerstillland, DE 27733-0497', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(5, 3, 1, 'Keenan', 'Gaylord', '26/06/1996', '945-846-0344 x1719', '24044 Garrett Place\nNew Rocioville, WY 61474', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(6, 3, 3, 'Catharine', 'Purdy', '01/06/1972', '647-707-4261 x130', '4045 Sanford Tunnel\nJasonhaven, VT 35544-9270', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(7, 4, 1, 'Velda', 'Gusikowski', '28/01/1976', '430-454-4015 x79626', '558 Silas Keys Suite 459\nSouth Tatyana, AL 81559-5510', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(8, 4, 2, 'Alice', 'Schmitt', '09/10/1993', '327-673-2541', '97763 Heathcote Crossroad\nLake Angeline, MA 76405', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(9, 5, 1, 'Haleigh', 'Schulist', '20/11/1987', '1-217-277-1730', '113 Myriam Glen Suite 795\nOndrickaville, OK 77246-3362', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(10, 5, 1, 'Leann', 'Hackett', '13/08/1982', '273.313.6648 x1079', '600 Simonis Green Suite 503\nIsidroville, KS 74052', 'avatar.png', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(11, 1, 3, 'BENAMMAR', 'Imad', '21/06/1990', '+212661123456', 'Rabat', 'avatar.png', '2018-04-09 12:24:22', '2018-04-09 12:27:05'),
(17, 1, 3, NULL, NULL, NULL, NULL, NULL, 'avatar.png', '2018-04-09 15:06:10', '2018-04-09 15:06:10');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'ea', 'Atque nesciunt aperiam doloremque ad aut quaerat inventore velit. Doloremque modi occaecati placeat laudantium exercitationem ad totam. Dolor neque eum velit doloremque quis. Eligendi repellendus qui nisi natus.', '2018-04-13 21:24:21', '2018-04-13 21:24:21'),
(2, 'dolores', 'Maxime quam quae occaecati perspiciatis. Est dolorem sed asperiores. Ea consequatur necessitatibus sunt similique aut dolores aspernatur. Ab officiis enim nisi natus officiis repellendus ipsum rerum.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(3, 'consectetur', 'Ab ut nam id laudantium sit. Dolore nisi sapiente animi est. Sunt nihil maxime reprehenderit unde quia et et. Id eum commodi et sed maxime quae doloremque.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(4, 'autem', 'Assumenda aut id odit sapiente. Illum autem aut eaque. Aut consequuntur expedita a praesentium saepe officia.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(5, 'sint', 'Deleniti deleniti aperiam laudantium non mollitia praesentium. Facere officiis veniam tempore nulla exercitationem quia omnis. Est provident consequuntur repudiandae. Et eaque voluptatem et perspiciatis.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(6, 'aut', 'Reprehenderit quia animi magni odio. Id suscipit nam assumenda dolorem quos. Aut consequatur quisquam soluta unde. Rem similique eveniet nihil eos. Earum voluptates aspernatur sed eos nam.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(7, 'minus', 'Fugiat voluptates aut dolor assumenda laborum illo eveniet. Quae maxime sapiente cum optio libero sit voluptas rerum. Qui consectetur harum dicta minus qui reprehenderit similique laboriosam. Ut maiores amet magni occaecati quaerat omnis est.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(8, 'nostrum', 'Sed aut rerum eos in est et pariatur mollitia. Quam ut voluptatum ullam laudantium et ut aut corporis. Officiis necessitatibus nam in sunt non commodi modi. Reiciendis aperiam dignissimos dolor ipsa.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(9, 'rerum', 'Quos nisi dolores dolores ut placeat. Ut totam est eius reiciendis ipsa.', '2018-03-20 22:24:21', '2018-03-20 22:24:21'),
(10, 'voluptatem', 'Explicabo enim voluptas sit exercitationem quisquam illum. Placeat est asperiores eum. Qui fuga molestiae repellendus error consequuntur et id itaque. Sed ipsa nihil blanditiis eius iste.', '2018-03-20 22:24:21', '2018-03-20 22:24:21');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `question`, `created_at`, `updated_at`) VALUES
(1, 'QUESTION 1', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(2, 'QUESTION 2', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(3, 'QUESTION 3', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(4, 'QUESTION 4', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(5, 'QUESTION 5', '2018-03-20 22:24:26', '2018-03-20 22:24:26');

-- --------------------------------------------------------

--
-- Structure de la table `questreps`
--

DROP TABLE IF EXISTS `questreps`;
CREATE TABLE IF NOT EXISTS `questreps` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `reponse` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questreps_user_id_foreign` (`user_id`),
  KEY `questreps_question_id_foreign` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questreps`
--

INSERT INTO `questreps` (`id`, `user_id`, `question_id`, `reponse`, `created_at`, `updated_at`) VALUES
(35, 1, 5, 'OK 5', '2018-04-26 11:46:45', '2018-04-26 11:46:45'),
(34, 1, 3, 'OK 3', '2018-04-26 11:46:45', '2018-04-26 11:46:45'),
(33, 1, 1, 'OK 1', '2018-04-26 11:46:45', '2018-04-26 11:53:26'),
(6, 2, 1, 'OK 1', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(7, 2, 2, 'OK 2', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(8, 2, 3, 'OK 3', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(9, 2, 4, 'OK 4', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(10, 2, 5, 'OK 5', '2018-03-20 22:24:26', '2018-03-20 22:24:26');

-- --------------------------------------------------------

--
-- Structure de la table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
CREATE TABLE IF NOT EXISTS `rankings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ranking` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rankings`
--

INSERT INTO `rankings` (`id`, `ranking`, `created_at`, `updated_at`) VALUES
(1, 'RANK 1', '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(2, 'RANK 2', '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(3, 'RANK 3', '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(4, 'RANK 4', '2018-03-20 22:24:19', '2018-03-20 22:24:19'),
(5, 'RANK 5', '2018-03-20 22:24:19', '2018-03-20 22:24:19');

-- --------------------------------------------------------

--
-- Structure de la table `statuscomptes`
--

DROP TABLE IF EXISTS `statuscomptes`;
CREATE TABLE IF NOT EXISTS `statuscomptes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_compte` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statuscomptes`
--

INSERT INTO `statuscomptes` (`id`, `status_compte`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(2, 'Canceled', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(3, 'Pending Validation', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(4, 'Suspended', '2018-03-20 22:24:15', '2018-03-20 22:24:15');

-- --------------------------------------------------------

--
-- Structure de la table `supportticketmessages`
--

DROP TABLE IF EXISTS `supportticketmessages`;
CREATE TABLE IF NOT EXISTS `supportticketmessages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_supportticket` int(10) UNSIGNED NOT NULL,
  `id_sender` int(10) UNSIGNED NOT NULL,
  `id_receiver` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supportticketmessages_id_sender_foreign` (`id_sender`),
  KEY `supportticketmessages_id_receiver_foreign` (`id_receiver`),
  KEY `supportticketmessages_id_supportticket_foreign` (`id_supportticket`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `supportticketmessages`
--

INSERT INTO `supportticketmessages` (`id`, `id_supportticket`, `id_sender`, `id_receiver`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'Hello, I have a problem !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(2, 1, 3, 1, 'Hello, which kind of problems ?', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(3, 1, 1, 3, 'The profil did not updated !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(4, 1, 3, 1, 'OK,  go to profil and refresh page and then click update !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(5, 1, 1, 3, 'OK, Thanks it works, you saved my day !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(6, 1, 3, 1, 'No problem, Thank you for using this platform :) !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(7, 2, 2, 3, 'Hello, I have a problem !', '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(8, 2, 3, 2, 'Hello, which kind of problems ?', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(9, 2, 2, 3, 'The pack did not buyed :s !', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(10, 2, 3, 2, 'OK,  go to pack page and refresh it and then click Take it another time !', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(11, 2, 2, 3, 'OK, Thanks it works, you saved my day !', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(12, 2, 3, 2, 'No problem, Thank you for using this platform :) !', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(13, 3, 3, 3, 'Earum et eum ipsum id reprehenderit. Incidunt eum qui ab et. Sed fugit dolore et perspiciatis et aspernatur.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(14, 4, 4, 3, 'Deserunt molestiae ratione doloribus voluptatem quia ab assumenda. Sapiente dolorum alias sit. Corporis corporis quo sed tempore rerum autem. Nihil quo sed sunt eaque.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(15, 5, 5, 3, 'Quis numquam modi dolorem quia. Esse quam delectus odio odio veniam.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(16, 6, 6, 3, 'Aut assumenda in dolorem id in rerum id. Voluptatum repellat voluptate rerum nobis magni itaque eos. Sint ipsa totam asperiores architecto quia asperiores aliquid. Et iusto sed ipsa quia.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(17, 7, 7, 3, 'Culpa modi impedit tempora commodi quis illum odio eius. Iure blanditiis ducimus aut. Voluptatem maiores eum nobis. Voluptas repudiandae fugit quae dolor.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(18, 8, 8, 3, 'Ut aut vel a quibusdam. Ut neque ducimus tempore temporibus. Fugit sed esse est tenetur.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(19, 9, 9, 3, 'Esse eum soluta assumenda. Nesciunt soluta rerum culpa consequatur. Corporis aut unde assumenda pariatur voluptatum aut quos.', '2018-03-20 22:24:26', '2018-03-20 22:24:26'),
(20, 10, 10, 3, 'Qui quibusdam cupiditate pariatur aut nesciunt. Placeat neque sapiente facilis exercitationem facere. Accusantium dolor in modi asperiores.', '2018-03-20 22:24:26', '2018-03-20 22:24:26');

-- --------------------------------------------------------

--
-- Structure de la table `supporttickets`
--

DROP TABLE IF EXISTS `supporttickets`;
CREATE TABLE IF NOT EXISTS `supporttickets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supporttickets_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `supporttickets`
--

INSERT INTO `supporttickets` (`id`, `id_personne`, `subject`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Problem Update Profil !', 0, '2018-03-20 22:24:24', '2018-03-20 22:24:24'),
(2, 2, 'Problem Buying packs !', 0, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(3, 3, 'doloremque', 0, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(4, 4, 'inventore', 1, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(5, 5, 'ut', 1, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(6, 6, 'quae', 1, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(7, 7, 'possimus', 1, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(8, 8, 'iure', 0, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(9, 9, 'dolorum', 1, '2018-03-20 22:24:25', '2018-03-20 22:24:25'),
(10, 10, 'sapiente', 0, '2018-03-20 22:24:25', '2018-03-20 22:24:25');

-- --------------------------------------------------------

--
-- Structure de la table `tpersonnes`
--

DROP TABLE IF EXISTS `tpersonnes`;
CREATE TABLE IF NOT EXISTS `tpersonnes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tpersonne` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tpersonnes`
--

INSERT INTO `tpersonnes` (`id`, `tpersonne`, `created_at`, `updated_at`) VALUES
(1, 'Member', '2018-03-20 22:24:14', '2018-03-20 22:24:14'),
(2, 'Admin', '2018-03-20 22:24:14', '2018-03-20 22:24:14'),
(3, 'Super Admin', '2018-03-20 22:24:14', '2018-03-20 22:24:14'),
(4, 'iure', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(5, 'occaecati', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(6, 'ut', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(7, 'vero', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(8, 'ab', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(9, 'explicabo', '2018-03-20 22:24:15', '2018-03-20 22:24:15'),
(10, 'aspernatur', '2018-03-20 22:24:15', '2018-03-20 22:24:15');

-- --------------------------------------------------------

--
-- Structure de la table `userlogs`
--

DROP TABLE IF EXISTS `userlogs`;
CREATE TABLE IF NOT EXISTS `userlogs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `activite` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_class` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userlogs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `userlogs`
--

INSERT INTO `userlogs` (`id`, `user_id`, `activite`, `ip_address`, `status_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'Connected successfully', '192.168.0.1', 'success', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(2, 1, 'Disconnected successfully', '192.168.0.1', 'danger', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(3, 2, 'Connected successfully', '192.168.0.2', 'success', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(4, 2, 'Disconnected successfully', '192.168.0.2', 'danger', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(5, 3, 'Connected successfully', '192.168.0.3', 'success', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(6, 3, 'Disconnected successfully', '192.168.0.3', 'danger', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(7, 4, 'Connected successfully', '192.168.0.4', 'success', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(8, 4, 'Disconnected successfully', '192.168.0.4', 'danger', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(9, 1, 'Connected successfully', '192.168.0.5', 'success', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(10, 1, 'Disconnected successfully', '192.168.0.5', 'danger', '2018-03-20 22:24:18', '2018-03-20 22:24:18'),
(11, 3, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-20 22:24:45', '2018-03-20 22:24:45'),
(12, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-03-20 22:25:56', '2018-03-20 22:25:56'),
(13, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-20 23:12:49', '2018-03-20 23:12:49'),
(14, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-20 23:14:09', '2018-03-20 23:14:09'),
(15, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-23 00:16:18', '2018-03-23 00:16:18'),
(16, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-23 00:16:41', '2018-03-23 00:16:41'),
(17, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-23 00:16:52', '2018-03-23 00:16:52'),
(18, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-23 00:28:15', '2018-03-23 00:28:15'),
(19, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-23 00:28:37', '2018-03-23 00:28:37'),
(20, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-23 00:55:11', '2018-03-23 00:55:11'),
(21, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-23 01:23:58', '2018-03-23 01:23:58'),
(22, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-23 01:24:05', '2018-03-23 01:24:05'),
(23, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-03-23 01:24:09', '2018-03-23 01:24:09'),
(24, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-03-28 18:52:35', '2018-03-28 18:52:35'),
(25, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 10:11:40', '2018-04-02 10:11:40'),
(26, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 10:12:00', '2018-04-02 10:12:00'),
(27, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 10:12:07', '2018-04-02 10:12:07'),
(28, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 11:34:43', '2018-04-02 11:34:43'),
(29, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 11:51:23', '2018-04-02 11:51:23'),
(30, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 11:57:37', '2018-04-02 11:57:37'),
(31, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 11:57:56', '2018-04-02 11:57:56'),
(32, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 11:58:48', '2018-04-02 11:58:48'),
(33, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 11:59:06', '2018-04-02 11:59:06'),
(34, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 11:59:10', '2018-04-02 11:59:10'),
(35, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 11:59:58', '2018-04-02 11:59:58'),
(36, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 12:01:45', '2018-04-02 12:01:45'),
(37, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 12:06:13', '2018-04-02 12:06:13'),
(38, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:04:01', '2018-04-02 13:04:01'),
(39, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 13:06:57', '2018-04-02 13:06:57'),
(40, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:07:08', '2018-04-02 13:07:08'),
(41, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:07:30', '2018-04-02 13:07:30'),
(42, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:09:18', '2018-04-02 13:09:18'),
(43, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:11:12', '2018-04-02 13:11:12'),
(44, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:12:14', '2018-04-02 13:12:14'),
(45, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 13:13:00', '2018-04-02 13:13:00'),
(46, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:13:04', '2018-04-02 13:13:04'),
(47, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 13:13:42', '2018-04-02 13:13:42'),
(48, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:13:45', '2018-04-02 13:13:45'),
(49, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:13:57', '2018-04-02 13:13:57'),
(50, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 13:14:30', '2018-04-02 13:14:30'),
(51, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 13:14:33', '2018-04-02 13:14:33'),
(52, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 13:27:28', '2018-04-02 13:27:28'),
(53, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 15:24:51', '2018-04-02 15:24:51'),
(54, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 15:25:06', '2018-04-02 15:25:06'),
(55, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 15:39:32', '2018-04-02 15:39:32'),
(56, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 15:39:52', '2018-04-02 15:39:52'),
(57, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 15:41:58', '2018-04-02 15:41:58'),
(58, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 15:42:03', '2018-04-02 15:42:03'),
(59, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 16:35:52', '2018-04-02 16:35:52'),
(60, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 16:36:23', '2018-04-02 16:36:23'),
(61, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 16:36:36', '2018-04-02 16:36:36'),
(62, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-02 16:36:45', '2018-04-02 16:36:45'),
(63, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-02 16:36:51', '2018-04-02 16:36:51'),
(64, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 11:13:26', '2018-04-09 11:13:26'),
(65, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 12:27:43', '2018-04-09 12:27:43'),
(66, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 12:36:32', '2018-04-09 12:36:32'),
(67, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 13:06:00', '2018-04-09 13:06:00'),
(68, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 13:13:44', '2018-04-09 13:13:44'),
(69, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 13:38:43', '2018-04-09 13:38:43'),
(71, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 13:46:12', '2018-04-09 13:46:12'),
(72, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 14:24:55', '2018-04-09 14:24:55'),
(73, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 14:45:59', '2018-04-09 14:45:59'),
(75, 11, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 14:47:11', '2018-04-09 14:47:11'),
(76, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 14:47:21', '2018-04-09 14:47:21'),
(77, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 15:00:22', '2018-04-09 15:00:22'),
(78, 17, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 15:07:40', '2018-04-09 15:07:40'),
(79, 17, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 15:08:26', '2018-04-09 15:08:26'),
(80, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 15:11:44', '2018-04-09 15:11:44'),
(81, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 15:51:45', '2018-04-09 15:51:45'),
(82, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 15:51:56', '2018-04-09 15:51:56'),
(83, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:08:13', '2018-04-09 16:08:13'),
(84, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 16:08:52', '2018-04-09 16:08:52'),
(85, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:08:57', '2018-04-09 16:08:57'),
(86, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 16:26:06', '2018-04-09 16:26:06'),
(87, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:26:10', '2018-04-09 16:26:10'),
(88, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 16:27:58', '2018-04-09 16:27:58'),
(89, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:28:07', '2018-04-09 16:28:07'),
(90, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 16:28:25', '2018-04-09 16:28:25'),
(91, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:28:33', '2018-04-09 16:28:33'),
(92, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-09 16:29:28', '2018-04-09 16:29:28'),
(93, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:29:35', '2018-04-09 16:29:35'),
(94, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-09 16:47:44', '2018-04-09 16:47:44'),
(95, 3, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-14 12:59:28', '2018-04-14 12:59:28'),
(96, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-14 13:00:35', '2018-04-14 13:00:35'),
(97, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-04-14 13:43:10', '2018-04-14 13:43:10'),
(98, 3, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-14 14:46:15', '2018-04-14 14:46:15'),
(99, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 11:54:37', '2018-04-26 11:54:37'),
(100, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 11:54:56', '2018-04-26 11:54:56'),
(101, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 11:55:09', '2018-04-26 11:55:09'),
(102, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 11:58:31', '2018-04-26 11:58:31'),
(103, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 12:26:34', '2018-04-26 12:26:34'),
(104, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 12:26:45', '2018-04-26 12:26:45'),
(105, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:15:39', '2018-04-26 13:15:39'),
(106, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:16:29', '2018-04-26 13:16:29'),
(107, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:18:06', '2018-04-26 13:18:06'),
(108, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:18:15', '2018-04-26 13:18:15'),
(109, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:21:55', '2018-04-26 13:21:55'),
(110, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:23:11', '2018-04-26 13:23:11'),
(111, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:25:36', '2018-04-26 13:25:36'),
(112, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:28:55', '2018-04-26 13:28:55'),
(113, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:29:26', '2018-04-26 13:29:26'),
(114, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:29:31', '2018-04-26 13:29:31'),
(115, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:30:13', '2018-04-26 13:30:13'),
(116, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:30:18', '2018-04-26 13:30:18'),
(117, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:30:40', '2018-04-26 13:30:40'),
(118, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:53:17', '2018-04-26 13:53:17'),
(119, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:53:36', '2018-04-26 13:53:36'),
(120, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:53:47', '2018-04-26 13:53:47'),
(121, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:56:46', '2018-04-26 13:56:46'),
(122, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:57:55', '2018-04-26 13:57:55'),
(123, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:58:10', '2018-04-26 13:58:10'),
(124, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 13:58:13', '2018-04-26 13:58:13'),
(125, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 13:58:24', '2018-04-26 13:58:24'),
(126, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:27:21', '2018-04-26 14:27:21'),
(127, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:29:12', '2018-04-26 14:29:12'),
(128, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:29:20', '2018-04-26 14:29:20'),
(129, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:29:41', '2018-04-26 14:29:41'),
(130, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:29:53', '2018-04-26 14:29:53'),
(131, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:30:28', '2018-04-26 14:30:28'),
(132, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:30:38', '2018-04-26 14:30:38'),
(133, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:31:58', '2018-04-26 14:31:58'),
(134, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:32:20', '2018-04-26 14:32:20'),
(135, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:32:33', '2018-04-26 14:32:33'),
(136, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:34:02', '2018-04-26 14:34:02'),
(137, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:34:19', '2018-04-26 14:34:19'),
(138, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:36:15', '2018-04-26 14:36:15'),
(139, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:36:28', '2018-04-26 14:36:28'),
(140, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:45:15', '2018-04-26 14:45:15'),
(141, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:45:30', '2018-04-26 14:45:30'),
(142, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:46:12', '2018-04-26 14:46:12'),
(143, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:48:38', '2018-04-26 14:48:38'),
(144, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 14:53:51', '2018-04-26 14:53:51'),
(145, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 14:55:06', '2018-04-26 14:55:06'),
(146, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:18:12', '2018-04-26 15:18:12'),
(147, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:18:17', '2018-04-26 15:18:17'),
(148, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:20:42', '2018-04-26 15:20:42'),
(149, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:20:57', '2018-04-26 15:20:57'),
(150, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:23:05', '2018-04-26 15:23:05'),
(151, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:23:10', '2018-04-26 15:23:10'),
(152, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:23:33', '2018-04-26 15:23:33'),
(153, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:23:46', '2018-04-26 15:23:46'),
(154, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:24:38', '2018-04-26 15:24:38'),
(155, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:24:51', '2018-04-26 15:24:51'),
(156, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:40:05', '2018-04-26 15:40:05'),
(157, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:40:35', '2018-04-26 15:40:35'),
(158, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:41:52', '2018-04-26 15:41:52'),
(159, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:41:58', '2018-04-26 15:41:58'),
(160, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:57:23', '2018-04-26 15:57:23'),
(161, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:57:30', '2018-04-26 15:57:30'),
(162, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:58:04', '2018-04-26 15:58:04'),
(163, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:58:09', '2018-04-26 15:58:09'),
(164, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:58:56', '2018-04-26 15:58:56'),
(165, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:59:05', '2018-04-26 15:59:05'),
(166, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 15:59:46', '2018-04-26 15:59:46'),
(167, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 15:59:59', '2018-04-26 15:59:59'),
(168, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 16:00:14', '2018-04-26 16:00:14'),
(169, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 16:04:28', '2018-04-26 16:04:28'),
(170, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 16:05:58', '2018-04-26 16:05:58'),
(171, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 16:06:05', '2018-04-26 16:06:05'),
(172, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-04-26 16:06:19', '2018-04-26 16:06:19'),
(173, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-04-26 16:06:30', '2018-04-26 16:06:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `online` int(11) NOT NULL DEFAULT '0',
  `active_security_questions` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `id_personne`, `email`, `password`, `online`, `active_security_questions`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'imad_benammar@hotmail.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, 'eEew4g9WPTIltCRnwRtsdCpvCMcPDdtrW9FX1nbR88chMGqmzbFduqUl3bRA', '2018-03-20 22:24:16', '2018-04-26 16:06:30'),
(2, 2, 'nakia03@yahoo.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 1, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(3, 3, 'admin@mail.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 1, 1, 's3pmjIhMfBRLuUQyjlXmKsJBlcdavBve4ydNg09BCo3Kfdu7mDIBkkn9cuFm', '2018-03-20 22:24:17', '2018-04-26 11:58:31'),
(4, 4, 'mspencer@hotmail.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(5, 5, 'johnson.andres@gmail.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(6, 6, 'kirlin.joshua@hotmail.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(7, 7, 'catharine52@ryan.com', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 1, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(8, 8, 'esther.champlin@jacobson.net', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(9, 9, 'sam44@rice.org', '$2y$10$Cshm47NJrIZYtv0xhxlgjej3VrjHvSMvoKKuN8hqAHp2ApNKbKlp.', 0, 0, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(10, 10, 'schiller.judge@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, NULL, '2018-03-20 22:24:17', '2018-03-20 22:24:17'),
(11, 11, 'imad_benammar@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, '3a7C6KygpMiwe9UgeL9dG4ksJ6lt4MOEdlFdlvTO87AA1y98BlSXHVsYRXHa', '2018-04-09 12:24:23', '2018-04-09 14:47:11'),
(17, 17, 'imadbenammar1@gmail.com', '$2y$10$BIhb2nH/BXqguo.T1uUTo.AvOl20DeBB4PfBceWIxXOLyqMfb4in.', 0, 0, 'Ozkvjdditsv6soeUlfvlMeuRKUWK4Mq5b49jRHT2ECSH6hGwaCevhnEfA6pU', '2018-04-09 15:06:10', '2018-04-09 15:08:26');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnementplatforms`
--
ALTER TABLE `abonnementplatforms`
  ADD CONSTRAINT `abonnementplatforms_id_packabonnementplatform_foreign` FOREIGN KEY (`id_packabonnementplatform`) REFERENCES `packabonnementplatforms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `abonnementplatforms_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD CONSTRAINT `bankaccounts_id_bank_foreign` FOREIGN KEY (`id_bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bankaccounts_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bankwallets`
--
ALTER TABLE `bankwallets`
  ADD CONSTRAINT `bankwallets_id_currencie_foreign` FOREIGN KEY (`id_currencie`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bankwallets_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `companyaccounts`
--
ALTER TABLE `companyaccounts`
  ADD CONSTRAINT `companyaccounts_id_bank_foreign` FOREIGN KEY (`id_bank`) REFERENCES `banks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `companywallets`
--
ALTER TABLE `companywallets`
  ADD CONSTRAINT `companywallets_id_currencie_foreign` FOREIGN KEY (`id_currencie`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `membres`
--
ALTER TABLE `membres`
  ADD CONSTRAINT `membres_id_parrain_foreign` FOREIGN KEY (`id_parrain`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `membres_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `niveau1s`
--
ALTER TABLE `niveau1s`
  ADD CONSTRAINT `niveau1s_id_parrain_foreign` FOREIGN KEY (`id_parrain`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `niveau1s_id_parraine_foreign` FOREIGN KEY (`id_parraine`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `niveau2s`
--
ALTER TABLE `niveau2s`
  ADD CONSTRAINT `niveau2s_id_parrain_base_foreign` FOREIGN KEY (`id_parrain_base`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `niveau2s_id_parrain_direct_foreign` FOREIGN KEY (`id_parrain_direct`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `niveau2s_id_parraine_foreign` FOREIGN KEY (`id_parraine`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ontradings`
--
ALTER TABLE `ontradings`
  ADD CONSTRAINT `ontradings_id_abonnement_foreign` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ontradings_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD CONSTRAINT `personnes_id_statuscompte_foreign` FOREIGN KEY (`id_statuscompte`) REFERENCES `statuscomptes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `personnes_id_tpersonne_foreign` FOREIGN KEY (`id_tpersonne`) REFERENCES `tpersonnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `supportticketmessages`
--
ALTER TABLE `supportticketmessages`
  ADD CONSTRAINT `supportticketmessages_id_receiver_foreign` FOREIGN KEY (`id_receiver`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supportticketmessages_id_sender_foreign` FOREIGN KEY (`id_sender`) REFERENCES `personnes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supportticketmessages_id_supportticket_foreign` FOREIGN KEY (`id_supportticket`) REFERENCES `supporttickets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `supporttickets`
--
ALTER TABLE `supporttickets`
  ADD CONSTRAINT `supporttickets_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `userlogs`
--
ALTER TABLE `userlogs`
  ADD CONSTRAINT `userlogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
