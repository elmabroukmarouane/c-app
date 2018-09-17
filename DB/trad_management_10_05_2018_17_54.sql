-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 10 mai 2018 à 17:54
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
(1, 1, 1, 'Bank', 2, '2018-11-10', 26724.00, 26724.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 2, 1, 'Wallet', 8, '2019-03-10', 28048.00, 14024.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 3, 1, 'Wallet', 8, '2018-10-10', 29451.00, 14725.50, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 4, 1, 'Bank', 4, '2019-03-10', 19400.00, 9700.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 5, 1, 'Bank', 6, '2018-08-10', 11659.00, 5829.50, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 6, 1, 'Wallet', 10, '2019-01-10', 29321.00, 14660.50, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 7, 1, 'Bank', 7, '2018-12-10', 5956.00, 2978.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 8, 1, 'Bank', 4, '2019-02-10', 15736.00, 7868.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 9, 1, 'Wallet', 3, '2018-09-10', 8601.00, 4300.50, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 10, 1, 'Wallet', 8, '2018-11-10', 4342.00, 2171.00, 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(11, 1, 1, 'Wallet', 1, '1981-09-18', 27477.00, 27477.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(12, 2, 1, 'Bank', 7, '1986-10-04', 6378.00, 6378.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(13, 3, 1, 'Bank', 3, '1973-04-06', 25850.00, 25850.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(14, 4, 1, 'Bank', 5, '2014-07-08', 14864.00, 14864.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(15, 5, 1, 'Bank', 4, '2018-03-30', 29699.00, 29699.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(16, 6, 1, 'Bank', 8, '1979-10-09', 19684.00, 19684.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(17, 7, 1, 'Wallet', 3, '2010-01-09', 26303.00, 26303.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(18, 8, 1, 'Bank', 7, '1975-10-15', 20259.00, 20259.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(19, 9, 1, 'Wallet', 5, '2003-08-17', 26562.00, 26562.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(20, 10, 1, 'Wallet', 5, '2008-11-25', 23138.00, 23138.00, 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 'Bronze', 1000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 'Silver', 2000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 'Gold', 5000.00, 'Between 130% and 300%', 'Depending to your Rank', 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 'Platinum', 10000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 'Diamond', 25000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
(1, 1, 1, '948273908', 'Nicaragua', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 1, 2, '120870273388', 'Mongolia', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 1, 3, '3425093296502', 'Togo', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 1, 4, '3030019374711', 'Albania', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 1, 5, '481107', 'United Arab Emirates', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 2, 1, '35781421993198880', 'Northern Mariana Islands', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 2, 2, '03991980613', 'Portugal', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 2, 3, '06418359', 'Cape Verde', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 2, 4, '832773727971047', 'Bhutan', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 2, 5, '97712598301700', 'Pitcairn Islands', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(11, 3, 1, '5122678870760', 'Vietnam', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(12, 4, 5, '82976786738', 'Turkey', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(13, 5, 5, '38018320', 'Moldova', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(14, 6, 5, '6772681329104', 'Burkina Faso', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(15, 7, 3, '4216292197', 'Hungary', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(16, 8, 2, '86850117980', 'Spain', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(17, 9, 4, '597886008', 'Netherlands Antilles', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(18, 10, 1, '52743280266696', 'Nigeria', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 'BANK 1', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 'BANK 2', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 'BANK 3', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 'BANK 4', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 'BANK 5', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 1, 1, 'voluptatem', '9593277473750886', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 1, 2, 'rerum', '1469060664', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 1, 3, 'ut', '71959065139', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 1, 4, 'et', '10756879821504', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 1, 5, 'qui', '046979526485725', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 2, 1, 'perferendis', '020506090658', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 2, 2, 'ea', '5405649', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 2, 3, 'voluptatem', '526685603706', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 2, 4, 'ut', '28886905912671', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 2, 5, 'ipsam', '5532346954975', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(11, 3, 2, 'laudantium', '0633585288424', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(12, 4, 2, 'quia', '2378447716', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(13, 5, 2, 'aspernatur', '656171310115', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(14, 6, 4, 'sed', '529798914646', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(15, 7, 3, 'quia', '15426647941412', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(16, 8, 4, 'at', '66441960422093', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(17, 9, 2, 'expedita', '8656647', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(18, 10, 3, 'quo', '82289544637431', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 5, '523350095', 'Pakistan', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 1, '0229802190', 'Mongolia', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 5, '4816478033', 'Cuba', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 4, '78032041', 'Uganda', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 3, '2302145213', 'Niger', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 5, '3201245118305', 'Mexico', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 3, '263169597', 'British Indian Ocean Territory (Chagos Archipelago)', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 3, '612651176348', 'Cayman Islands', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 5, '82624711523', 'Benin', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 3, '7630208953', 'Reunion', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 2, 'aperiam', '38115112154847', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 4, 'praesentium', '05183134383', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 3, 'natus', '19379565907', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 2, 'illum', '12602556116', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 5, 'enim', '5771186971', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 2, 'quidem', '46809042347', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 5, 'tempore', '3994651401', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 5, 'quidem', '339479148729', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 2, 'et', '893197644077', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 1, 'veritatis', '0973924508', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 'Currencie 1', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 'Currencie 2', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 'Currencie 3', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 'Currencie 4', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 'Currencie 5', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 1, 6, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(2, 2, 6, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(3, 3, 3, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(4, 4, 10, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(5, 5, 2, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(6, 6, 3, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(7, 7, 7, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(8, 8, 5, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(9, 9, 1, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(10, 10, 7, '2018-05-10 16:13:06', '2018-05-10 16:13:06');

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
(1, 1, 'Accusamus doloremque sapiente aliquam autem. Expedita enim sed eos corporis alias neque nam. Vero voluptatibus ad illum rerum magnam nostrum sunt.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 1, 'Nesciunt nam debitis porro itaque minima reiciendis. Corporis consequatur id facilis et sint voluptatem numquam. Autem quas quis voluptatum quia atque ut ea. Velit enim quo eligendi quidem dolorem. Quibusdam culpa voluptate nemo eaque voluptate.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 2, 'Architecto vitae quia sunt aut et aspernatur reprehenderit. Et ex beatae ratione. Eos ut a incidunt velit et perspiciatis eum officia. Quae eveniet dolorem explicabo.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 2, 'Consequatur et rerum repudiandae est. Illum et similique quaerat nihil. Tenetur perspiciatis ab commodi dolor.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 3, 'Quae ipsa iste ea quae et accusantium. Aut est eos id eius tempore velit. Soluta quia culpa corrupti corrupti ea.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 3, 'Aspernatur et et quo architecto. Consequatur quod pariatur eius voluptates qui. Voluptatem suscipit aut minus et laborum explicabo vero. Perferendis animi totam itaque consequuntur ratione rem.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 4, 'Cum dicta aut magni voluptas. Deserunt eveniet sequi magnam ut ut quod. Rerum necessitatibus minus non. Rerum dicta temporibus molestias quia.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 4, 'Ratione necessitatibus modi repellat facilis quaerat ratione ratione. Maxime omnis magni id corporis id dolores voluptatem. Rerum autem ut non libero earum. Autem ipsa et voluptatum accusamus rem cumque velit.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 5, 'Enim ut at incidunt architecto harum praesentium. Maxime cupiditate dolor ipsam vel commodi. Iure et et iste ut. Sed consequatur omnis aut architecto. Qui aut veniam et tenetur.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(10, 5, 'Repellendus amet perferendis aliquam illo delectus. Ut enim enim quasi optio sint. Eius dignissimos sunt consequuntur enim non. Laudantium ullam sunt aut et hic provident.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(11, 6, 'Aliquid sunt voluptates omnis earum magni excepturi qui. Ullam necessitatibus totam repellat eius. Voluptatem expedita provident voluptatem officia consequatur dignissimos. Ullam officiis nam eaque saepe architecto ipsam itaque.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(12, 6, 'Accusamus laboriosam vero deleniti ut iure praesentium qui. Quibusdam natus ratione consequatur inventore. Aut tempora necessitatibus odio possimus.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(13, 7, 'Accusamus est illo totam quidem excepturi unde. Delectus eligendi quia non. Neque maiores eaque voluptatem omnis facilis.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(14, 7, 'Nulla eius facere non excepturi sit ullam. Qui voluptatibus minus neque veritatis voluptates omnis ut.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(15, 8, 'Sapiente quos facilis autem modi esse illo. Et explicabo amet consequatur qui libero atque facilis sed. Modi fuga vitae aut cum.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(16, 8, 'Pariatur aperiam totam dignissimos architecto ut maiores. Id numquam tempore explicabo voluptatem soluta. Esse velit possimus ut voluptatum totam sed. Fuga quaerat ab distinctio autem.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(17, 9, 'Est quo tempora in et sit aut qui. Quia totam nulla ab velit qui. Est eligendi consequatur aut sit accusamus quaerat voluptatem aliquam.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(18, 9, 'Dolorum velit distinctio culpa harum doloribus. Ut veritatis mollitia vel facilis excepturi non nulla. Quis quasi quisquam quo similique.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(19, 10, 'Quia magni non nihil laborum quaerat quas occaecati non. Quos itaque qui totam soluta. Explicabo aperiam voluptatem alias natus nobis quasi dignissimos. Est atque eaque illo quia aliquid. At libero non consectetur dolore.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(20, 10, 'Consequuntur in quidem atque. Quaerat rerum iste ad et repellendus reprehenderit laborum. Facere sint inventore aliquid cum non.', 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(175, '2018_01_12_231851_create_tpersonnes_table', 1),
(176, '2018_01_12_232552_create_statuscomptes_table', 1),
(177, '2018_01_12_232652_create_personnes_table', 1),
(178, '2018_01_12_233833_create_membres_table', 1),
(179, '2018_01_13_000000_create_users_table', 1),
(180, '2018_01_13_004621_create_userlogs_table', 1),
(181, '2018_01_31_142753_create_niveau1s_table', 1),
(182, '2018_01_31_163901_create_niveau2s_table', 1),
(183, '2018_02_03_170527_create_rankings_table', 1),
(184, '2018_02_04_124133_create_abonnements_table', 1),
(185, '2018_02_04_143905_create_ontradings_table', 1),
(186, '2018_02_05_213041_create_posts_table', 1),
(187, '2018_02_06_134459_create_messages_table', 1),
(188, '2018_02_15_141303_create_banks_table', 1),
(189, '2018_02_15_145402_create_currencies_table', 1),
(190, '2018_02_17_133948_create_bankaccounts_table', 1),
(191, '2018_02_17_164232_create_companyaccounts_table', 1),
(192, '2018_02_17_230622_create_bankwallets_table', 1),
(193, '2018_02_18_002414_create_companywallets_table', 1),
(194, '2018_02_18_101437_create_supporttickets_table', 1),
(195, '2018_02_18_102145_create_supportticketmessages_table', 1),
(196, '2018_03_13_202938_create_questions_table', 1),
(197, '2018_03_13_205307_create_questreps_table', 1),
(198, '2018_03_18_144738_create_packabonnementplatforms_table', 1),
(199, '2018_03_18_165713_create_abonnementplatforms_table', 1),
(200, '2018_10_12_100000_create_password_resets_table', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau1s`
--

INSERT INTO `niveau1s` (`id`, `id_parrain`, `id_parraine`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 1, 3, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 1, 4, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 1, 5, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 2, 6, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 2, 7, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 2, 8, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 2, 9, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 2, 10, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
(1, 1, 2, 6, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 1, 2, 7, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 1, 2, 8, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 1, 2, 9, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 1, 2, 10, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ontradings`
--

INSERT INTO `ontradings` (`id`, `id_personne`, `id_abonnement`, `periode`, `type_payment`, `id_payment`, `type_get_paid`, `id_get_paid`, `total_profit`, `paid`, `finished`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2000-10-03', 'Bank', 2, 'Wallet', 4, 16569.00, 8284.50, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 1, 1, '2018-06-01', 'Bank', 4, 'Wallet', 4, 22957.00, 22957.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 1, 2, '2015-11-26', 'Bank', 10, 'Bank', 1, 4095.00, 2047.50, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 1, 2, '2018-12-10', 'Bank', 6, 'Bank', 3, 28027.00, 14013.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 1, 3, '2008-03-24', 'Bank', 3, 'Wallet', 6, 26040.00, 13020.00, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 1, 3, '2018-11-10', 'Bank', 6, 'Wallet', 2, 2427.00, 1213.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 1, 4, '2017-04-08', 'Wallet', 1, 'Bank', 7, 24650.00, 12325.00, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 1, 4, '2018-07-10', 'Wallet', 9, 'Wallet', 3, 4341.00, 2170.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 1, 5, '1977-09-21', 'Wallet', 2, 'Wallet', 2, 4621.00, 2310.50, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(10, 1, 5, '2018-11-10', 'Bank', 9, 'Bank', 9, 28728.00, 14364.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(11, 2, 1, '2009-12-08', 'Wallet', 5, 'Wallet', 5, 3101.00, 1550.50, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(12, 2, 1, '2018-06-10', 'Wallet', 4, 'Bank', 1, 9367.00, 4683.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(13, 2, 2, '1971-06-26', 'Bank', 3, 'Wallet', 1, 18751.00, 9375.50, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(14, 2, 2, '2018-07-10', 'Wallet', 6, 'Bank', 4, 17732.00, 8866.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(15, 2, 3, '2014-06-22', 'Wallet', 9, 'Wallet', 5, 24478.00, 12239.00, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(16, 2, 3, '2018-06-10', 'Bank', 1, 'Wallet', 8, 11094.00, 5547.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(17, 2, 4, '1989-03-18', 'Wallet', 6, 'Wallet', 5, 26550.00, 13275.00, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(18, 2, 4, '2018-11-10', 'Bank', 9, 'Bank', 5, 7478.00, 3739.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(19, 2, 5, '2003-02-03', 'Bank', 5, 'Bank', 10, 18190.00, 9095.00, 1, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(20, 2, 5, '2019-03-10', 'Bank', 6, 'Wallet', 1, 16417.00, 8208.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(21, 3, 5, '2019-01-10', 'Bank', 6, 'Bank', 1, 26135.00, 13067.50, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(22, 4, 3, '2018-12-10', 'Wallet', 2, 'Bank', 4, 15200.00, 7600.00, 0, 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(23, 5, 4, '2019-01-10', 'Wallet', 6, 'Wallet', 7, 23878.00, 11939.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(24, 6, 2, '2018-07-10', 'Wallet', 5, 'Wallet', 9, 29506.00, 14753.00, 0, 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(25, 7, 1, '2019-01-10', 'Bank', 4, 'Wallet', 3, 20976.00, 10488.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(26, 8, 3, '2018-10-10', 'Wallet', 5, 'Bank', 7, 18918.00, 9459.00, 0, 1, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(27, 9, 5, '2019-02-10', 'Bank', 3, 'Wallet', 7, 19791.00, 9895.50, 0, 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(28, 10, 1, '2018-10-10', 'Bank', 1, 'Wallet', 3, 18985.00, 9492.50, 0, 0, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
(1, 'Pack Abonnement Platform 1', 86.80, '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personnes_id_tpersonne_foreign` (`id_tpersonne`),
  KEY `personnes_id_statuscompte_foreign` (`id_statuscompte`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id`, `id_tpersonne`, `id_statuscompte`, `nom`, `prenom`, `date_naissance`, `telephone`, `adresse`, `pays`, `ville`, `zipcode`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Donny', 'Cartwright', '19/10/1981', '471-696-7238 x46913', '6685 Arne Hill Suite 655\nSydnietown, SD 51056-0457', 'Libyan Arab Jamahiriya', 'Floshire', '02933', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(2, 1, 4, 'Sylvia', 'Bogisich', '21/12/1992', '721.578.3647 x349', '570 Laron Station\nNew Henrystad, KS 52939', 'United Kingdom', 'Selenafurt', '72227-4516', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(3, 2, 1, 'Luther', 'Lindgren', '21/02/1976', '+19134494943', '103 Botsford Course Suite 936\nSouth Asha, NH 69309', 'Gambia', 'South Kaleymouth', '74608', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(4, 2, 1, 'Justice', 'Hessel', '04/01/1979', '585-365-6930 x710', '6794 Muller Union\nNorth Loyce, VA 72715-2862', 'British Virgin Islands', 'Bretbury', '59756', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(5, 3, 1, 'Tremayne', 'Olson', '07/11/1990', '+1-858-252-8531', '2849 O\'Connell Isle Apt. 147\nWest Mia, IL 95403', 'Philippines', 'Lake Louisa', '75976-3391', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(6, 3, 4, 'Jordan', 'Mitchell', '21/05/1980', '467-768-0043 x57938', '75070 Tressie Summit\nSalvadorton, MI 96712-2721', 'French Polynesia', 'Balistreriview', '61972', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(7, 4, 1, 'Winfield', 'Buckridge', '07/03/1981', '656.789.2988 x08104', '894 Kihn Run\nLake Letitiabury, UT 21584', 'India', 'Lake Karianne', '09456-3777', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(8, 4, 3, 'Coby', 'Witting', '03/09/1977', '414.671.9385', '510 Harber Island\nJuniusland, IN 98544', 'Pitcairn Islands', 'Lake Rustyton', '01984-4074', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(9, 5, 3, 'Dolly', 'Skiles', '18/03/1984', '+1-417-937-0365', '924 Gregoria Greens Apt. 846\nEast Chasemouth, MN 91362-1221', 'Vietnam', 'Lednerstad', '24585', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(10, 5, 2, 'Antonia', 'Emmerich', '08/02/1977', '(901) 208-2990 x1587', '7395 Beahan Curve\nJuanitaton, MS 45830-3510', 'Poland', 'North Louveniaport', '90522', 'avatar.png', '2018-05-10 16:13:06', '2018-05-10 16:13:06');

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
(1, 'est', 'Molestias aliquid aspernatur maiores quo omnis vel cumque. Dolores autem amet consequatur.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 'beatae', 'Placeat voluptatem ut aspernatur molestiae dignissimos quia. Nam et ex voluptatibus qui facere. Corrupti ducimus qui sed dolore corporis iste. Numquam ab velit non eveniet rerum omnis non.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 'aliquid', 'Voluptates eos culpa quibusdam minima voluptate consequatur. Fugit velit ipsa ea molestias laudantium illum est nihil. Ab nihil corrupti hic aut porro.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 'molestias', 'Facilis esse nobis accusantium. Est ea totam esse illo dicta officia nesciunt recusandae. Consectetur ut possimus at nobis ratione consectetur tempora aut.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 'quo', 'Reiciendis aut autem quidem et asperiores pariatur quam. Et sed perspiciatis et amet ea. Quos voluptatum excepturi tenetur repudiandae minus.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 'exercitationem', 'Totam iure ratione et dolorum illo iure. Qui nostrum dignissimos illum dolor illum fugiat. Aperiam vel aut officia. Qui inventore rem et ut.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 'consequatur', 'Eum voluptas ratione ipsum molestias facilis explicabo. Sunt asperiores ducimus ullam nisi aliquid quia nostrum. Qui et excepturi itaque qui minus impedit.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 'rerum', 'Esse ut non laboriosam. Qui commodi adipisci quo natus molestiae voluptas ut. Illum consequatur aliquam ut sint amet velit. Voluptates esse hic dolor sit.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 'unde', 'Qui enim mollitia soluta recusandae. Debitis est consequatur distinctio nihil culpa culpa. Ut voluptates quo ut et dolorem. Rem vitae rerum recusandae.', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(10, 'quidem', 'Dolor sint fugiat voluptatem optio enim. Ut recusandae hic fuga et. Maiores animi molestiae voluptas reiciendis autem repellat sit. Nesciunt et modi consectetur error.', '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
(1, 'QUESTION 1', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 'QUESTION 2', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 'QUESTION 3', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 'QUESTION 4', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 'QUESTION 5', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questreps`
--

INSERT INTO `questreps` (`id`, `user_id`, `question_id`, `reponse`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'OK 1', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 1, 2, 'OK 2', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 1, 3, 'OK 3', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 1, 4, 'OK 4', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 1, 5, 'OK 5', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 2, 1, 'OK 1', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 2, 2, 'OK 2', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 2, 3, 'OK 3', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 2, 4, 'OK 4', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 2, 5, 'OK 5', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 'RANK 1', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 'RANK 2', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 'RANK 3', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 'RANK 4', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 'RANK 5', '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
(1, 'Active', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(2, 'Canceled', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(3, 'Pending Validation', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(4, 'Suspended', '2018-05-10 16:13:06', '2018-05-10 16:13:06');

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
(1, 1, 1, 3, 'Hello, I have a problem !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 1, 3, 1, 'Hello, which kind of problems ?', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 1, 1, 3, 'The profil did not updated !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 1, 3, 1, 'OK,  go to profil and refresh page and then click update !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 1, 1, 3, 'OK, Thanks it works, you saved my day !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 1, 3, 1, 'No problem, Thank you for using this platform :) !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 2, 2, 3, 'Hello, I have a problem !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 2, 3, 2, 'Hello, which kind of problems ?', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 2, 2, 3, 'The pack did not buyed :s !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 2, 3, 2, 'OK,  go to pack page and refresh it and then click Take it another time !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(11, 2, 2, 3, 'OK, Thanks it works, you saved my day !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(12, 2, 3, 2, 'No problem, Thank you for using this platform :) !', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(13, 3, 3, 3, 'Est sed fuga et. Nihil aut at ducimus maxime. Libero tempore qui sed recusandae et porro ut. Id quos occaecati tenetur quia sed impedit voluptas et.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(14, 4, 4, 3, 'Necessitatibus ullam nihil quibusdam eligendi accusantium ipsam neque. Quos ab impedit nam rem. Animi cumque tempora et rerum.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(15, 5, 5, 3, 'Porro enim dolorem quis sed. Tempore illo eveniet quo inventore. Quod ea quia perspiciatis.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(16, 6, 6, 3, 'Impedit assumenda ut temporibus delectus possimus ipsa omnis non. Libero molestiae sunt sit animi provident. Exercitationem officiis quod fugit dignissimos eos. Sit possimus ut quidem quo odio aut.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(17, 7, 7, 3, 'Amet consequatur dolor enim optio vero repudiandae. Voluptas nostrum dolor cumque. Molestias hic provident quia beatae ipsum sequi. Facilis fugiat recusandae officiis possimus debitis veritatis.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(18, 8, 8, 3, 'Et rerum quia asperiores sunt. Animi qui voluptatem quia consequatur sed quibusdam consequatur. Id cupiditate eum inventore dolorem voluptas modi. Vero autem omnis dolor est molestias eum.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(19, 9, 9, 3, 'Quia et rerum accusantium voluptas quas enim quia. Eum porro natus nisi accusamus voluptas natus. Debitis a eos vitae rerum sapiente. Fugit sed quaerat a unde.', '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(20, 10, 10, 3, 'Dicta mollitia eius cupiditate tempora tempora quam omnis. Voluptatem vel illum culpa quae et. Error et autem aliquam enim velit officiis non. Et similique consequatur iste.', '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 1, 'Problem Update Profil !', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(2, 2, 'Problem Buying packs !', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(3, 3, 'rerum', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(4, 4, 'facere', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(5, 5, 'nam', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(6, 6, 'voluptas', 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(7, 7, 'quia', 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(8, 8, 'sapiente', 0, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(9, 9, 'dolore', 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08'),
(10, 10, 'placeat', 1, '2018-05-10 16:13:08', '2018-05-10 16:13:08');

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
(1, 'Member', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(2, 'Admin', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(3, 'Super Admin', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(4, 'officiis', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(5, 'aut', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(6, 'ut', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(7, 'voluptas', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(8, 'accusamus', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(9, 'quia', '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(10, 'ut', '2018-05-10 16:13:06', '2018-05-10 16:13:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `userlogs`
--

INSERT INTO `userlogs` (`id`, `user_id`, `activite`, `ip_address`, `status_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'Connected successfully', '192.168.0.1', 'success', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(2, 1, 'Disconnected successfully', '192.168.0.1', 'danger', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(3, 2, 'Connected successfully', '192.168.0.2', 'success', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(4, 2, 'Disconnected successfully', '192.168.0.2', 'danger', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 3, 'Connected successfully', '192.168.0.3', 'success', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 3, 'Disconnected successfully', '192.168.0.3', 'danger', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 4, 'Connected successfully', '192.168.0.4', 'success', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 4, 'Disconnected successfully', '192.168.0.4', 'danger', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 1, 'Connected successfully', '192.168.0.5', 'success', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(10, 1, 'Disconnected successfully', '192.168.0.5', 'danger', '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(11, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-05-10 16:15:32', '2018-05-10 16:15:32'),
(12, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-05-10 16:21:00', '2018-05-10 16:21:00'),
(13, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-05-10 16:21:49', '2018-05-10 16:21:49'),
(14, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-05-10 16:22:21', '2018-05-10 16:22:21');

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
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `id_personne`, `email`, `password`, `online`, `active_security_questions`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'emo@mail.com', '$2y$10$U6F.rmayXTa1EKmTv9qs0.vkriAAOOKXYlrfoHixUcHDMYH397.o6', 0, 0, 'MzI1fo9mH93CeKxwyO5fbpcSFMR0fHmu6UjYO9vQocF3AyA04dDCkrHz4LhG', '2018-05-10 16:13:06', '2018-05-10 16:22:21'),
(2, 2, 'lowe.nicolas@hotmail.com', '$2y$10$j7KzFbnqm.ew9NVT3S2HBem7HJU6BqtolMWU5iD897ly/CoB5yeSK', 0, 0, NULL, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(3, 3, 'admin@mail.com', '$2y$10$xJF2gh8AV7CKuxX.KpPriuTr3mcLbPf8Yt4o7n7EbJtGz0nN1o0hi', 0, 1, NULL, '2018-05-10 16:13:06', '2018-05-10 16:13:06'),
(4, 4, 'vbergnaum@okon.com', '$2y$10$7piNbThr8sD4I0eOOtuoh.wOD6kSwU75iPBWitCij4siEZPoKqKNm', 0, 1, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(5, 5, 'gibson.dayne@jacobs.com', '$2y$10$sw4LvCcur6KZR329Ki/4hOZgUFjv7bZ1pOCi/Uub3tiiY7wzpwBi.', 0, 1, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(6, 6, 'pamela47@gmail.com', '$2y$10$vDGT8d1FI5nnJiGIl10s1u2PSyKPUuCj86Lk7FMev2fLvHwUQEXCe', 0, 1, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(7, 7, 'troy09@ward.info', '$2y$10$S9yXOFL8x//3p2FtWG45GufZIgtCMoIP3.UNhhtJ9C0hX3/ixxL9.', 0, 0, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(8, 8, 'carlee.orn@yahoo.com', '$2y$10$9tvMNjATMW6k.im3CqGcCOYM6cxRsDW510CAfMatZj8YF2xskkYZ2', 0, 0, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(9, 9, 'myrtie.emmerich@feil.info', '$2y$10$mFPJKctjKkHyvF6qmE.j8ekDRi6ST7fFHEntUnnquBVTJeDyd1EGm', 0, 0, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07'),
(10, 10, 'vivian.oreilly@yahoo.com', '$2y$10$0gsoTGa2F9yC6b5gIxkuRODQdqnSVYHkowaGqBqtsWoygz2ux9CYK', 0, 1, NULL, '2018-05-10 16:13:07', '2018-05-10 16:13:07');

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
