-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 mai 2018 à 23:47
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
(1, 1, 1, 'Wallet', 3, '2019-03-23', 20476.00, 10238.00, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 2, 1, 'Wallet', 9, '2019-01-23', 23499.00, 11749.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 3, 1, 'Bank', 6, '2018-09-23', 27289.00, 13644.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 4, 1, 'Wallet', 2, '2019-02-23', 24715.00, 12357.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 5, 1, 'Bank', 4, '2018-10-23', 17099.00, 8549.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 6, 1, 'Bank', 7, '2018-11-23', 20634.00, 10317.00, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 7, 1, 'Wallet', 2, '2018-08-23', 23739.00, 11869.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 8, 1, 'Wallet', 2, '2019-01-23', 24979.00, 12489.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 9, 1, 'Wallet', 2, '2018-10-23', 4987.00, 2493.50, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 10, 1, 'Wallet', 9, '2019-01-23', 3110.00, 1555.00, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 1, 1, 'Bank', 7, '1996-11-26', 6084.00, 6084.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 2, 1, 'Wallet', 7, '1986-07-10', 24073.00, 24073.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 3, 1, 'Wallet', 1, '1988-06-07', 4564.00, 4564.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 4, 1, 'Wallet', 6, '1985-06-30', 24379.00, 24379.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 5, 1, 'Wallet', 9, '1978-11-04', 21477.00, 21477.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 6, 1, 'Bank', 1, '1972-01-24', 20500.00, 20500.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 7, 1, 'Wallet', 3, '1985-01-01', 10698.00, 10698.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 8, 1, 'Bank', 9, '2013-09-09', 11862.00, 11862.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(19, 9, 1, 'Bank', 8, '2001-04-04', 19037.00, 19037.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(20, 10, 1, 'Bank', 4, '1974-12-26', 21703.00, 21703.00, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'Bronze', 1000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'Silver', 2000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'Gold', 5000.00, 'Between 130% and 300%', 'Depending to your Rank', 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'Platinum', 10000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'Diamond', 25000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

-- --------------------------------------------------------

--
-- Structure de la table `balanceaffiliationparameters`
--

DROP TABLE IF EXISTS `balanceaffiliationparameters`;
CREATE TABLE IF NOT EXISTS `balanceaffiliationparameters` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `newcomer_parameter` double(8,2) NOT NULL DEFAULT '0.00',
  `affiliate_parameter` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `balanceaffiliationparameters`
--

INSERT INTO `balanceaffiliationparameters` (`id`, `newcomer_parameter`, `affiliate_parameter`, `created_at`, `updated_at`) VALUES
(1, 50.00, 15.00, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

-- --------------------------------------------------------

--
-- Structure de la table `balanceaffiliations`
--

DROP TABLE IF EXISTS `balanceaffiliations`;
CREATE TABLE IF NOT EXISTS `balanceaffiliations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `balance_affiliation` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balanceaffiliations_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `balanceaffiliations`
--

INSERT INTO `balanceaffiliations` (`id`, `id_personne`, `balance_affiliation`, `created_at`, `updated_at`) VALUES
(1, 1, 150.00, '2018-05-23 13:56:41', '2018-05-23 23:46:25'),
(2, 2, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 3, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 4, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(5, 5, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(6, 6, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(7, 7, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(8, 8, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(9, 9, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(10, 10, 0.00, '2018-05-23 13:56:41', '2018-05-23 13:56:41');

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
(1, 1, 1, '106688765625', 'Gambia', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 2, '88622971141', 'Suriname', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 3, '869444573', 'Djibouti', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 4, '1347212171', 'Bosnia and Herzegovina', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 5, '23896542217056', 'Samoa', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 2, 1, '027280376220', 'Turkey', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 2, 2, '1951151206', 'Korea', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 2, 3, '468424495377239', 'Marshall Islands', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, 4, '25149513054', 'Guinea', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 2, 5, '37288819025', 'Hong Kong', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 3, 1, '26944709384', 'South Georgia and the South Sandwich Islands', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 4, 4, '21447242480', 'Cameroon', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 5, 5, '159675915', 'Egypt', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 6, 2, '120858061197', 'Netherlands Antilles', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 7, 3, '51674264266', 'Northern Mariana Islands', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 8, 2, '415472937461', 'Portugal', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 9, 4, '205094049698511', 'Aruba', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 10, 2, '73735009', 'Brazil', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'BANK 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'BANK 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'BANK 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'BANK 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'BANK 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 1, 'aut', '654362951', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 2, 'commodi', '262857879', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 3, 'quibusdam', '8850515175', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 4, 'tenetur', '74831977224', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 5, 'perspiciatis', '1766074333', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 2, 1, 'consequatur', '8450678875', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 2, 2, 'eligendi', '213910370631139', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 2, 3, 'aut', '60409275374', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, 4, 'dolores', '790812664535', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 2, 5, 'nulla', '234328362', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 3, 1, 'rem', '93808703837', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 4, 5, 'eaque', '85700670', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 5, 3, 'magni', '8237684089', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 6, 3, 'debitis', '95427299266', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 7, 2, 'delectus', '4330762635', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 8, 4, 'magnam', '359696250', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 9, 2, 'rem', '73415034071', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 10, 3, 'aspernatur', '7443557479668', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 4, '069040080367607', 'Western Sahara', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 2, '3160811369023', 'French Guiana', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, '8986285008605', 'Honduras', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 3, '93620830439', 'Zimbabwe', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 5, '118149118', 'Anguilla', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 2, '6395988633', 'Cook Islands', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 5, '140230914990', 'Saint Barthelemy', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 1, '14436331719674', 'Haiti', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, '499340811', 'Western Sahara', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 1, '880634949279722', 'Peru', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 2, 'placeat', '800577720', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 5, 'non', '850642158979375', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 3, 'omnis', '5682274', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 5, 'et', '78417034806924', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 5, 'et', '77088209351', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 5, 'non', '00856519552421', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 4, 'est', '095435082', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 5, 'ea', '21161319105', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 3, 'tempore', '46328854979', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 4, 'voluptatem', '4353193937965', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'Currencie 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'Currencie 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'Currencie 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'Currencie 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'Currencie 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 9, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(2, 2, 9, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 3, 6, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 4, 2, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(5, 5, 6, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(6, 6, 5, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(7, 7, 9, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(8, 8, 4, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(9, 9, 3, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(10, 10, 7, '2018-05-23 13:56:41', '2018-05-23 13:56:41');

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
(1, 1, 'Iste quibusdam et sed nam natus. Odit repudiandae ut reprehenderit quis et. Enim non aut perferendis consequatur corporis et. Eaque dolorum iusto magnam officiis possimus veniam.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 'Est totam porro consequatur. Culpa dolore eos ut consequatur sunt. Sit soluta ipsa et ut omnis nemo omnis nulla. Ducimus cum dolorem aut aliquid numquam.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 2, 'Quod sunt architecto libero rerum. Dicta dolore harum voluptas magni. Nihil molestias ipsa et alias deleniti voluptas. Doloribus necessitatibus veritatis et nesciunt dolores amet. Perspiciatis tenetur et dolorem blanditiis.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 2, 'Autem molestiae est deleniti in blanditiis labore dignissimos id. Quaerat pariatur laboriosam dolorem sint laborum labore dignissimos. Et natus qui iusto nam minima. Asperiores cum ex mollitia non.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 3, 'Quo nihil voluptate accusantium officiis modi quia. Itaque rerum excepturi magnam distinctio. Et accusantium excepturi ut odio.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 3, 'Ut impedit sed quisquam rem ut pariatur. Ullam officia odio consectetur laudantium tenetur sit. Voluptates quasi explicabo harum fuga.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 4, 'Cum laboriosam reiciendis optio laudantium in et quaerat. Quia ut neque dolor. Asperiores nostrum totam quia rerum laboriosam asperiores.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 4, 'Nihil consequatur architecto deserunt veritatis vero blanditiis cupiditate. Quis id harum aut harum qui nisi sit porro. Aspernatur ex dignissimos omnis consequatur. Repellat fugit id vitae doloribus molestiae.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 5, 'Laborum voluptatem et enim voluptatem. Ut delectus dolor dolorem et nulla ullam deleniti. Aliquam exercitationem doloremque iste corporis aspernatur labore. Ut tempora culpa quia itaque expedita et.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 5, 'Quas optio laudantium voluptas. Recusandae in ipsam et et accusamus quas est. Reprehenderit et consequatur sed ex sint aut molestiae. Dolorum sed soluta quam non omnis deserunt eos.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 6, 'Accusamus qui quam in dolorem. Perspiciatis dicta adipisci et modi eos est ut. Eveniet culpa aliquam distinctio dicta ut quo tempora quia. Minus libero non consequatur natus. Omnis est quis molestiae nihil et quae.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 6, 'Adipisci dolorem velit aperiam rerum nihil possimus. Est molestiae ad esse vero incidunt placeat.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 7, 'Et libero quam adipisci voluptas consequatur. Totam quisquam deleniti similique dolores minima. Assumenda similique sed molestias rerum.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 7, 'Quia voluptas ipsum ut odio qui consequatur ut dignissimos. Laboriosam id qui enim sunt numquam. Unde qui possimus blanditiis odit eos dolorem qui. Quam voluptas consequatur ipsum veniam ipsum nostrum qui. Consequuntur ut vel sapiente sunt fuga autem et blanditiis.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 8, 'Ut vel eum aut ducimus. Aut aperiam officia adipisci tempore. Molestiae aut ratione praesentium ea quam doloremque accusantium.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 8, 'Et ea eos commodi non aliquid libero. Recusandae deleniti autem aut ducimus. Adipisci sit dolor pariatur vel modi et et. Temporibus nobis at nam. Eius voluptatem voluptatem porro ut et perferendis.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 9, 'Nobis omnis natus ut quae nemo incidunt. Id nemo impedit iure labore voluptatem sed. Error debitis voluptas inventore dolor. Vero est optio aliquid nam alias ad optio.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 9, 'Deleniti magni quo atque impedit. Fuga et cumque dolor expedita adipisci illo alias. Nihil perferendis et ullam sunt sunt.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(19, 10, 'Ut aut rerum et accusantium est magnam non. Quam repudiandae ab tempora et maxime. Nihil est facilis doloribus odit omnis sed sed.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(20, 10, 'Quaerat et ratione dignissimos velit ipsa. Nihil tempora repellendus ratione ut non magnam molestias. Id corporis doloribus repellat autem et excepturi. Consequatur non unde qui eveniet veritatis.', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(88, '2018_01_12_231851_create_tpersonnes_table', 1),
(89, '2018_01_12_232552_create_statuscomptes_table', 1),
(90, '2018_01_12_232652_create_personnes_table', 1),
(91, '2018_01_12_233833_create_membres_table', 1),
(92, '2018_01_13_000000_create_users_table', 1),
(93, '2018_01_13_004621_create_userlogs_table', 1),
(94, '2018_01_31_142753_create_niveau1s_table', 1),
(95, '2018_01_31_163901_create_niveau2s_table', 1),
(96, '2018_02_03_170527_create_rankings_table', 1),
(97, '2018_02_04_124133_create_abonnements_table', 1),
(98, '2018_02_04_143905_create_ontradings_table', 1),
(99, '2018_02_05_213041_create_posts_table', 1),
(100, '2018_02_06_134459_create_messages_table', 1),
(101, '2018_02_15_141303_create_banks_table', 1),
(102, '2018_02_15_145402_create_currencies_table', 1),
(103, '2018_02_17_133948_create_bankaccounts_table', 1),
(104, '2018_02_17_164232_create_companyaccounts_table', 1),
(105, '2018_02_17_230622_create_bankwallets_table', 1),
(106, '2018_02_18_002414_create_companywallets_table', 1),
(107, '2018_02_18_101437_create_supporttickets_table', 1),
(108, '2018_02_18_102145_create_supportticketmessages_table', 1),
(109, '2018_03_13_202938_create_questions_table', 1),
(110, '2018_03_13_205307_create_questreps_table', 1),
(111, '2018_03_18_144738_create_packabonnementplatforms_table', 1),
(112, '2018_03_18_165713_create_abonnementplatforms_table', 1),
(113, '2018_05_19_105256_create_balanceaffiliations_table', 1),
(114, '2018_05_19_122259_create_balanceaffiliationparameters_table', 1),
(115, '2018_05_22_150620_create_pvbalancepersonnes_table', 1),
(116, '2018_10_12_100000_create_password_resets_table', 1);

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
(1, 1, 2, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 3, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 4, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 5, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 2, 6, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 2, 7, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 2, 8, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 2, 9, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, 10, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 2, 6, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 2, 7, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 2, 8, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 2, 9, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 2, 10, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 1, '2004-08-04', 'Bank', 6, 'Wallet', 3, 19591.00, 9795.50, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 1, '2018-06-13', 'Bank', 9, 'Wallet', 7, 17314.00, 8657.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 2, '2003-03-26', 'Bank', 7, 'Wallet', 7, 23668.00, 11834.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 2, '2018-07-23', 'Bank', 4, 'Bank', 2, 6729.00, 3364.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 3, '2016-07-08', 'Wallet', 3, 'Wallet', 8, 29613.00, 14806.50, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 1, 3, '2018-08-23', 'Wallet', 1, 'Wallet', 1, 22354.00, 11177.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 1, 4, '1970-03-29', 'Bank', 2, 'Bank', 4, 29409.00, 14704.50, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 1, 4, '2018-06-23', 'Bank', 3, 'Bank', 4, 11486.00, 5743.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 1, 5, '2011-10-18', 'Wallet', 5, 'Wallet', 6, 15974.00, 7987.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 1, 5, '2018-07-23', 'Wallet', 1, 'Bank', 2, 12099.00, 6049.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 2, 1, '1985-08-21', 'Bank', 4, 'Wallet', 1, 20762.00, 10381.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 2, 1, '2018-11-23', 'Bank', 4, 'Bank', 5, 19886.00, 9943.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 2, 2, '1997-10-17', 'Wallet', 9, 'Bank', 10, 20430.00, 10215.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 2, 2, '2019-01-23', 'Wallet', 1, 'Wallet', 5, 15889.00, 7944.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 2, 3, '1985-01-04', 'Wallet', 3, 'Bank', 6, 16000.00, 8000.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 2, 3, '2018-12-23', 'Wallet', 2, 'Wallet', 7, 17245.00, 8622.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 2, 4, '1984-02-18', 'Wallet', 5, 'Bank', 2, 147.00, 73.50, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 2, 4, '2018-07-23', 'Wallet', 9, 'Bank', 10, 10255.00, 5127.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(19, 2, 5, '1993-01-06', 'Wallet', 2, 'Bank', 3, 22458.00, 11229.00, 1, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(20, 2, 5, '2018-09-23', 'Bank', 8, 'Bank', 7, 25535.00, 12767.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(21, 3, 4, '2018-11-23', 'Wallet', 5, 'Bank', 6, 10169.00, 5084.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(22, 4, 5, '2019-01-23', 'Wallet', 1, 'Bank', 7, 3689.00, 1844.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(23, 5, 4, '2019-01-23', 'Wallet', 1, 'Bank', 2, 27940.00, 13970.00, 0, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(24, 6, 2, '2018-12-23', 'Bank', 2, 'Bank', 8, 15144.00, 7572.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(25, 7, 5, '2018-07-23', 'Wallet', 2, 'Wallet', 4, 21299.00, 10649.50, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(26, 8, 4, '2018-11-23', 'Wallet', 6, 'Wallet', 6, 23184.00, 11592.00, 0, 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(27, 9, 2, '2018-08-23', 'Wallet', 2, 'Bank', 5, 22753.00, 11376.50, 0, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(28, 10, 5, '2018-12-23', 'Bank', 7, 'Wallet', 5, 26666.00, 13333.00, 0, 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'Pack Abonnement Platform 1', 65.50, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id`, `id_tpersonne`, `id_statuscompte`, `nom`, `prenom`, `date_naissance`, `telephone`, `adresse`, `pays`, `ville`, `zipcode`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Parker', 'Koelpin', '26/07/1989', '+1-773-939-3840', '45013 Jacey Walks\nPort Murielshire, IA 52929-4194', 'Guyana', 'Aliabury', '03133-5063', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(2, 1, 2, 'Cleveland', 'Witting', '29/04/1979', '795.977.0041', '87810 Devan Islands Suite 031\nPacochafort, AZ 68890', 'Albania', 'South River', '66710', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 2, 1, 'Sheila', 'Crist', '13/10/1971', '+1 (864) 349-1839', '76531 Satterfield Loaf\nSouth Abnermouth, SC 43541-2331', 'Netherlands Antilles', 'Dedrickland', '01852-1171', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 2, 2, 'Jayda', 'Howell', '18/06/1991', '1-725-214-3552 x52357', '355 Vidal Ford\nLake Olenburgh, WI 11353', 'Bosnia and Herzegovina', 'Starkhaven', '18353-0644', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(5, 3, 3, 'Linnea', 'Nader', '03/12/1986', '774-428-4083 x353', '1863 Ned Loaf\nWavafurt, MT 22066-1742', 'Maldives', 'South Rodrick', '18928', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(6, 3, 2, 'Meggie', 'Spencer', '22/05/1973', '(316) 937-3575 x907', '53300 Tromp Village\nGerholdton, MI 03642', 'Saudi Arabia', 'Colinstad', '59251', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(7, 4, 3, 'Enid', 'Yost', '30/09/1993', '804-363-0915', '861 Cronin Corners Suite 995\nLubowitzchester, SD 31808', 'Svalbard & Jan Mayen Islands', 'South Wallace', '10929-4567', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(8, 4, 3, 'Hope', 'Gibson', '24/12/1997', '(326) 935-8070 x1071', '54827 Friesen Valleys Suite 393\nCaterinaview, PA 44772-7747', 'Vanuatu', 'West Octavia', '09901', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(9, 5, 3, 'Frances', 'Tromp', '19/04/1984', '986.866.1312', '1835 Rebekah Common\nNew Anabel, TX 09916', 'Niue', 'Javonteburgh', '47031', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(10, 5, 2, 'Zander', 'Tillman', '06/04/1984', '691-435-2489 x2873', '8686 Herman Extension Suite 131\nAugustafort, OR 72007-3989', 'Jersey', 'East Dinafurt', '69329-8814', 'avatar.png', '2018-05-23 13:56:41', '2018-05-23 13:56:41');

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
(1, 'consequatur', 'Perspiciatis placeat dolores voluptatem consequatur. Sit consequatur esse fugit voluptatum reiciendis eum necessitatibus nostrum. Sint tenetur eaque quae aut eligendi.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'adipisci', 'Natus quidem eveniet aut molestias velit. Corrupti tempore debitis sit iste velit ut molestiae maiores. Ipsam iste sit quas saepe sit.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'eum', 'Praesentium voluptatibus quidem aut quo aut. Nulla ut ipsa rerum sapiente eaque ullam. Excepturi omnis asperiores corrupti fuga. Sequi sunt alias asperiores ducimus modi adipisci et perspiciatis.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'iste', 'Et quas occaecati aperiam ut modi. Ea dolorum sunt ut quibusdam doloribus maxime. Laborum sit facilis ut occaecati.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'illo', 'Numquam ullam aut enim ea illum ea nesciunt. Omnis cum esse tempore ut. At esse consequatur sint voluptate. Accusamus totam quod ut aut eum veritatis fugiat.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 'velit', 'Qui corporis quasi architecto non beatae officiis. Iste labore ut illum aut velit. Facere ducimus corrupti et incidunt laborum laudantium.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 'aut', 'Et qui amet dolor. Et praesentium aut laudantium quis dolor perferendis rerum. Sed consequatur ea quas at temporibus non voluptatem. Enim commodi officiis maiores quibusdam facere.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 'debitis', 'Doloremque beatae et ut modi nihil ab iure. Quo quo rem ut et aut voluptatem dignissimos. Et incidunt et reprehenderit rerum ut et. Cumque qui voluptate ea cum fugiat assumenda suscipit.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 'est', 'Itaque similique fugit et eos. Ad aperiam et eius cumque. Quo repudiandae reiciendis odit aperiam consequatur dolorem omnis.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 'dolor', 'Cum omnis quo ducimus velit est. Atque dolor ea accusantium corporis. Quas inventore esse vero suscipit aut laborum quae ipsam.', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

-- --------------------------------------------------------

--
-- Structure de la table `pvbalancepersonnes`
--

DROP TABLE IF EXISTS `pvbalancepersonnes`;
CREATE TABLE IF NOT EXISTS `pvbalancepersonnes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `id_balance_affiliation` int(10) UNSIGNED NOT NULL,
  `type_payment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant_pvbalancepersonne` double(8,2) NOT NULL DEFAULT '0.00',
  `status_pvbalancepersonne` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pvbalancepersonnes_id_personne_foreign` (`id_personne`),
  KEY `pvbalancepersonnes_id_balance_affiliation_foreign` (`id_balance_affiliation`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pvbalancepersonnes`
--

INSERT INTO `pvbalancepersonnes` (`id`, `id_personne`, `id_balance_affiliation`, `type_payment`, `montant_pvbalancepersonne`, `status_pvbalancepersonne`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Wallet', 0.00, 1, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(2, 2, 2, 'Bank', 0.00, 2, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 3, 3, 'Wallet', 0.00, 0, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 4, 4, 'Wallet', 0.00, 1, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(5, 5, 5, 'Bank', 0.00, 1, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(6, 6, 6, 'Bank', 0.00, 2, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(7, 7, 7, 'Bank', 0.00, 0, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(8, 8, 8, 'Wallet', 0.00, 2, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(9, 9, 9, 'Bank', 0.00, 1, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(10, 10, 10, 'Bank', 0.00, 0, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(12, 1, 1, 'Bank', 140.00, 0, '2018-05-23 15:23:53', '2018-05-23 23:46:25');

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
(1, 'QUESTION 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'QUESTION 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'QUESTION 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'QUESTION 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'QUESTION 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 1, 'OK 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 2, 'OK 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 3, 'OK 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 4, 'OK 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 5, 'OK 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 2, 1, 'OK 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 2, 2, 'OK 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 2, 3, 'OK 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, 4, 'OK 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 2, 5, 'OK 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'RANK 1', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 'RANK 2', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 'RANK 3', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 'RANK 4', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 'RANK 5', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'Active', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(2, 'Canceled', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 'Pending Validation', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 'Suspended', '2018-05-23 13:56:41', '2018-05-23 13:56:41');

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
(1, 1, 1, 3, 'Hello, I have a problem !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 3, 1, 'Hello, which kind of problems ?', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 1, 1, 3, 'The profil did not updated !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 1, 3, 1, 'OK,  go to profil and refresh page and then click update !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 1, 1, 3, 'OK, Thanks it works, you saved my day !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 1, 3, 1, 'No problem, Thank you for using this platform :) !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 2, 2, 3, 'Hello, I have a problem !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 2, 3, 2, 'Hello, which kind of problems ?', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 2, 2, 3, 'The pack did not buyed :s !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 2, 3, 2, 'OK,  go to pack page and refresh it and then click Take it another time !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 2, 2, 3, 'OK, Thanks it works, you saved my day !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(12, 2, 3, 2, 'No problem, Thank you for using this platform :) !', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(13, 3, 3, 3, 'Minima magni quisquam pariatur magni veritatis. Corporis iure dolores ut a. Itaque quia natus voluptatibus ut tempore et. Cum voluptate velit eveniet eius quaerat sunt.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(14, 4, 4, 3, 'Quibusdam modi aliquam et libero ipsum. Maiores doloremque aliquid asperiores asperiores eum cumque. Omnis ut nihil nemo sequi.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(15, 5, 5, 3, 'Aut quod minus deleniti necessitatibus. Quo nobis et repellendus officiis ducimus voluptate quis. Adipisci inventore sit nesciunt voluptatum esse fugiat.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(16, 6, 6, 3, 'Et numquam recusandae omnis quidem dolore omnis. Esse culpa minus non sed enim dignissimos. Ut rem repellat nulla quis nihil. Aliquam voluptate porro ab quasi qui enim sint.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(17, 7, 7, 3, 'Dignissimos nam perferendis rerum tenetur omnis iure. Ad blanditiis corrupti rem corporis excepturi praesentium vitae. Quae eum est consequatur rerum voluptas suscipit et.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(18, 8, 8, 3, 'Ad veritatis aut sunt. Aut veritatis voluptatem occaecati unde rerum soluta. Et hic corporis voluptas ab dolorum nisi dolores laborum. Neque accusantium enim praesentium totam ipsam ut ipsam.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(19, 9, 9, 3, 'Quis eos assumenda et. Delectus praesentium quo voluptatem ut. Dolores expedita in facere. Dicta voluptas dolores vel ut ut omnis mollitia.', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(20, 10, 10, 3, 'Voluptatibus non quia laboriosam sed. Officia autem consequatur quo non accusantium iure cum voluptatem.', '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 1, 'Problem Update Profil !', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 2, 'Problem Buying packs !', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 3, 'explicabo', 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 4, 'quos', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 5, 'voluptatibus', 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 6, 'dignissimos', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 7, 'adipisci', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 8, 'voluptatum', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 9, 'voluptatem', 1, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 10, 'voluptas', 0, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
(1, 'Member', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(2, 'Admin', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 'Super Admin', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(4, 'esse', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(5, 'rerum', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(6, 'est', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(7, 'vitae', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(8, 'maiores', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(9, 'est', '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(10, 'laborum', '2018-05-23 13:56:41', '2018-05-23 13:56:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `userlogs`
--

INSERT INTO `userlogs` (`id`, `user_id`, `activite`, `ip_address`, `status_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'Connected successfully', '192.168.0.1', 'success', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(2, 1, 'Disconnected successfully', '192.168.0.1', 'danger', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(3, 2, 'Connected successfully', '192.168.0.2', 'success', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(4, 2, 'Disconnected successfully', '192.168.0.2', 'danger', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 3, 'Connected successfully', '192.168.0.3', 'success', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 3, 'Disconnected successfully', '192.168.0.3', 'danger', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 4, 'Connected successfully', '192.168.0.4', 'success', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 4, 'Disconnected successfully', '192.168.0.4', 'danger', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 1, 'Connected successfully', '192.168.0.5', 'success', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 1, 'Disconnected successfully', '192.168.0.5', 'danger', '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(11, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-05-23 14:18:34', '2018-05-23 14:18:34'),
(12, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-05-23 15:27:27', '2018-05-23 15:27:27');

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
  `firstime` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `id_personne`, `email`, `password`, `online`, `active_security_questions`, `firstime`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'emo@mail.com', '$2y$10$SnJZihtSmfXMrb9EE.xRDOrazMzGD7rOGCWyHQKUc6aLSE6i5ZmO.', 1, 0, 0, 'mNlEGpcIMssLyv09z0YRCVuL0TogrSnWQvs2ZfoN04ICjhVIZO8Xty65XPjg', '2018-05-23 13:56:41', '2018-05-23 14:18:34'),
(2, 2, 'jammie37@hartmann.com', '$2y$10$lUmEbzsPssLUWzsezJgLb.bPiT6Mupce6qHBWeir3.KzwKmLxCDwW', 0, 0, 0, NULL, '2018-05-23 13:56:41', '2018-05-23 13:56:41'),
(3, 3, 'admin@mail.com', '$2y$10$Dtwn9Ie2aSXEUhpjj4OZDeIxrBzolbNc0mU6k8YW.8duQVp4m.7dC', 1, 1, 0, NULL, '2018-05-23 13:56:41', '2018-05-23 15:27:27'),
(4, 4, 'alessia02@koch.info', '$2y$10$rvjhIgwb9YWW107Ncs8gIONhAD5zXVcMU51v47Jn3C1IoxZkqPxbm', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(5, 5, 'emmerich.georgette@tremblay.com', '$2y$10$yJtA1bvARUfCF8tZi7q1NOpo7Yl9K3Z5TiMfcvtdOYmUQpLU6obbm', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(6, 6, 'dulce05@langworth.org', '$2y$10$P1fp8byQu5FOW6AaZI402e0VCLgFmgdKVLhxgg64Rlgeb/BqnZPR.', 0, 1, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(7, 7, 'hegmann.damian@yahoo.com', '$2y$10$ERYxWE9HUQmB48FLrqXQZOtNyRP92iFNTjX9JALvZHiN2MVa7SkNC', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(8, 8, 'eino03@predovic.net', '$2y$10$y/z6DJGyY02t7GqJk2RZweeFW8YsrMF2kzrjXooxVn8hGO.fFOcCe', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(9, 9, 'cecilia35@mayert.org', '$2y$10$86BvVI9KKzh/TTU54yEuYu6oKOa2jxiw9L/yxv0ezxBEnEodxIFg6', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42'),
(10, 10, 'nils38@corwin.com', '$2y$10$ahi2/65VY0x4ndLB7uxcQepYUI4qcITAgoltd8C7KcOCexhbDOpme', 0, 0, 0, NULL, '2018-05-23 13:56:42', '2018-05-23 13:56:42');

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
-- Contraintes pour la table `balanceaffiliations`
--
ALTER TABLE `balanceaffiliations`
  ADD CONSTRAINT `balanceaffiliations_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

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
-- Contraintes pour la table `pvbalancepersonnes`
--
ALTER TABLE `pvbalancepersonnes`
  ADD CONSTRAINT `pvbalancepersonnes_id_balance_affiliation_foreign` FOREIGN KEY (`id_balance_affiliation`) REFERENCES `balanceaffiliations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pvbalancepersonnes_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

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
