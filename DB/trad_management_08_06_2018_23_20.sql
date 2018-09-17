-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 juin 2018 à 23:24
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
(1, 1, 1, 'Balance', 1, '2018-10-08', 2934.00, 1467.00, 0, '2018-06-08 14:58:06', '2018-06-08 18:49:30'),
(2, 2, 1, 'Wallet', 8, '2018-07-08', 19246.00, 9623.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 3, 1, 'Wallet', 7, '2018-12-08', 8280.00, 4140.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 4, 1, 'Wallet', 7, '2019-02-08', 7966.00, 3983.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 5, 1, 'Bank', 5, '2019-03-08', 19583.00, 9791.50, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 6, 1, 'Bank', 6, '2019-03-08', 27094.00, 13547.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 7, 1, 'Bank', 6, '2019-04-08', 13618.00, 6809.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 8, 1, 'Bank', 6, '2018-08-08', 16987.00, 8493.50, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 9, 1, 'Wallet', 8, '2018-12-08', 7314.00, 3657.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 10, 1, 'Wallet', 9, '2018-08-08', 18482.00, 9241.00, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 1, 1, 'Wallet', 10, '1989-09-25', 16845.00, 16845.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 2, 1, 'Bank', 5, '1994-10-07', 14982.00, 14982.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 3, 1, 'Bank', 5, '1993-05-01', 13434.00, 13434.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 4, 1, 'Wallet', 1, '1981-01-12', 16288.00, 16288.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 5, 1, 'Bank', 9, '1998-02-05', 348.00, 348.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 6, 1, 'Bank', 6, '2015-07-29', 1855.00, 1855.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 7, 1, 'Bank', 8, '1970-09-12', 6058.00, 6058.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 8, 1, 'Bank', 8, '1971-02-11', 28436.00, 28436.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(19, 9, 1, 'Bank', 8, '1987-09-28', 23992.00, 23992.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(20, 10, 1, 'Wallet', 2, '1993-03-05', 3375.00, 3375.00, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'Bronze', 1000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'Silver', 2000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'Gold', 5000.00, 'Between 130% and 300%', 'Depending to your Rank', 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'Platinum', 10000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'Diamond', 25000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 50.00, 15.00, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 1030.00, '2018-06-08 14:58:05', '2018-06-08 19:25:50'),
(2, 2, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 3, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 4, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 5, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 6, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 7, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 8, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 9, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 10, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05');

-- --------------------------------------------------------

--
-- Structure de la table `balancebitcoins`
--

DROP TABLE IF EXISTS `balancebitcoins`;
CREATE TABLE IF NOT EXISTS `balancebitcoins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personne` int(10) UNSIGNED NOT NULL,
  `balance_bitcoin` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balancebitcoins_id_personne_foreign` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `balancebitcoins`
--

INSERT INTO `balancebitcoins` (`id`, `id_personne`, `balance_bitcoin`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, '2018-06-08 14:58:05', '2018-06-08 17:01:43'),
(2, 2, 0.00, '2018-06-08 14:58:05', '2018-06-08 17:01:36'),
(3, 3, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 4, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 5, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 6, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 7, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 8, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 9, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 10, 0.00, '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
(1, 1, 1, '76302856373', 'Malaysia', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 2, '179328708611050', 'Martinique', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 3, '2218318728844', 'Albania', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 4, '050976111907972', 'Ireland', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 5, '15584679150', 'United States Minor Outlying Islands', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 2, 1, '5093873882732', 'Puerto Rico', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 2, 2, '22575263901', 'Andorra', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 3, '6767331625', 'Svalbard & Jan Mayen Islands', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 2, 4, '888249520526', 'Svalbard & Jan Mayen Islands', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 2, 5, '696564228', 'Oman', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 3, 4, '09649933910', 'Egypt', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 4, 1, '1659339007', 'Cocos (Keeling) Islands', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 5, 3, '34961985964263636', 'Angola', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 6, 2, '41210142110', 'Dominican Republic', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 7, 3, '86337953750514', 'San Marino', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 8, 3, '147087773', 'Portugal', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 9, 5, '259872155834', 'Kuwait', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 10, 4, '160219715', 'Sierra Leone', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'BANK 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'BANK 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'BANK 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'BANK 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'BANK 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 1, 'ab', '361318271942', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 2, 'quae', '34126632920', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 3, 'dolor', '347983711', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 4, 'et', '351597287', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 5, 'voluptatem', '2577883134', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 2, 1, 'praesentium', '4364950689176', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 2, 2, 'magnam', '078995343348', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 3, 'delectus', '630755', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 2, 4, 'architecto', '557234729025', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 2, 5, 'qui', '520690077', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 3, 1, 'aperiam', '505868507', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 4, 1, 'est', '15457448294574', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 5, 4, 'tempore', '3751985', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 6, 1, 'et', '6758122367', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 7, 4, 'doloremque', '9424163176', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 8, 4, 'laborum', '757625771', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 9, 4, 'consequuntur', '08593399586158', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 10, 4, 'voluptate', '2232410144056', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 5, '97440173054', 'Croatia', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 5, '69953986447', 'Romania', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 3, '0451861352', 'Somalia', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 4, '244136848602', 'French Southern Territories', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 2, '2592474952479', 'Brazil', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 5, '5645143407325987', 'Monaco', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 1, '88092566769', 'Andorra', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 4, '600861329', 'Georgia', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 1, '3863766028', 'Costa Rica', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 5, '441723555', 'Syrian Arab Republic', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 4, 'quia', '832663133224', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 4, 'dicta', '46655330', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 4, 'magnam', '6416227196321', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 2, 'vel', '544031250825239', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 3, 'aliquid', '191340776781461', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 5, 'libero', '02383564955', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 4, 'laboriosam', '425581419098', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 'facere', '469218877', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 5, 'animi', '8868426186290', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 3, 'consequuntur', '8204300', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'Currencie 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'Currencie 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'Currencie 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'Currencie 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'Currencie 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 4, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(2, 2, 4, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 3, 5, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 4, 7, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 5, 6, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 6, 6, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 7, 3, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 8, 9, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 9, 3, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 10, 6, '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
(1, 1, 'Fugit illo nihil voluptatem. Et nobis alias sed vero aspernatur error aut.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 'Qui modi natus dolorem ullam iste voluptatum. Debitis expedita sed magnam eos. Ipsam dolorem ducimus delectus distinctio.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 2, 'Non voluptate provident sit aliquid fugit asperiores tenetur totam. Corporis beatae perspiciatis labore sit. Sit aperiam ullam magni atque.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 2, 'Enim quia molestiae porro optio id. Itaque et deleniti enim sit. Adipisci unde sequi non est.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 3, 'Enim et nihil quasi. Quas aspernatur possimus aut veniam tempore tempora earum animi. Ut consequuntur architecto et impedit eos eveniet numquam explicabo. Unde distinctio iste autem ad est nobis ipsam. Aut distinctio laboriosam consequuntur sit ut iusto.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 3, 'Et dolores est asperiores consequatur exercitationem dignissimos reprehenderit. Voluptate laborum aut incidunt repudiandae nihil. Voluptas accusamus perspiciatis dolor perspiciatis.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 4, 'Quos sint nihil est. Hic qui quo illo non exercitationem totam. Consectetur veritatis incidunt necessitatibus.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 4, 'Facere temporibus numquam vel. Alias est officia ab dolores esse molestiae quo. Est eaque ut neque asperiores distinctio illo. Labore aperiam optio tempore sed rerum fugiat occaecati.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 5, 'Quis et optio delectus dolores dignissimos. Dicta aut nihil et ut atque est possimus. Ut et repellat modi eum ipsum distinctio nulla. Eum sint consectetur dolor modi distinctio harum consequatur dicta.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 5, 'Totam quasi sequi ea perspiciatis. Molestias consectetur libero nisi aliquid. Totam non vitae enim et reprehenderit voluptatibus. Voluptatem ea ad sapiente pariatur molestiae omnis.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 6, 'Illum cupiditate animi et aut ipsam incidunt qui. Odio nesciunt est dolores accusamus ducimus maiores voluptatibus et. Voluptatum iure sed omnis ducimus. Aut nostrum harum quibusdam voluptatem. Ipsam ut et autem consequuntur libero accusantium nam.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 6, 'Dignissimos in doloribus quos voluptatem similique. Nostrum voluptates nam optio accusamus aut nostrum iste. Nihil reprehenderit reprehenderit non quia. Dolorem qui placeat delectus sapiente enim alias aut sint.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 7, 'Error est omnis tempore aut quis. Odit possimus sed quod voluptatibus nemo reprehenderit eaque. Praesentium id deleniti ut provident vel quaerat dolore.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 7, 'Voluptatem vero praesentium voluptas accusantium esse expedita voluptate. Et omnis fugit eaque rerum. Animi assumenda doloremque molestiae et nobis.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 8, 'Id minima consequatur aspernatur rerum repellendus accusantium ut vel. Error accusamus sunt sint aspernatur recusandae dolor minima. Quis eveniet qui et.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 8, 'Ea quos sit earum ut facere quia reiciendis. Voluptate ratione molestiae minima id aut. Corrupti consequatur dolore modi ullam et. Ut qui commodi repudiandae nihil voluptatem pariatur.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 9, 'Est sed accusantium commodi unde voluptas accusantium iure et. Ratione quia eum nostrum ut molestiae. Distinctio ex nihil quisquam suscipit et. Natus sapiente ab nemo iste.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 9, 'Perferendis ratione enim veritatis quisquam nemo ullam. Nihil corporis beatae dolorum ullam fuga doloribus impedit. Voluptas quo possimus laborum cumque.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(19, 10, 'Et quia numquam dolor consequuntur qui rerum. Omnis quas ipsam cupiditate velit distinctio est est. Ad mollitia itaque temporibus fugit ut. Eligendi optio rem sapiente vel sequi.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(20, 10, 'Repudiandae hic quo velit veritatis aut iste. Nihil ipsam reiciendis in. Placeat est distinctio porro voluptatem.', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_01_12_231851_create_tpersonnes_table', 1),
(2, '2018_01_12_232552_create_statuscomptes_table', 1),
(3, '2018_01_12_232652_create_personnes_table', 1),
(4, '2018_01_12_233833_create_membres_table', 1),
(5, '2018_01_13_000000_create_users_table', 1),
(6, '2018_01_13_004621_create_userlogs_table', 1),
(7, '2018_01_31_142753_create_niveau1s_table', 1),
(8, '2018_01_31_163901_create_niveau2s_table', 1),
(9, '2018_02_03_170527_create_rankings_table', 1),
(10, '2018_02_04_124133_create_abonnements_table', 1),
(11, '2018_02_04_143905_create_ontradings_table', 1),
(12, '2018_02_05_213041_create_posts_table', 1),
(13, '2018_02_06_134459_create_messages_table', 1),
(14, '2018_02_15_141303_create_banks_table', 1),
(15, '2018_02_15_145402_create_currencies_table', 1),
(16, '2018_02_17_133948_create_bankaccounts_table', 1),
(17, '2018_02_17_164232_create_companyaccounts_table', 1),
(18, '2018_02_17_230622_create_bankwallets_table', 1),
(19, '2018_02_18_002414_create_companywallets_table', 1),
(20, '2018_02_18_101437_create_supporttickets_table', 1),
(21, '2018_02_18_102145_create_supportticketmessages_table', 1),
(22, '2018_03_13_202938_create_questions_table', 1),
(23, '2018_03_13_205307_create_questreps_table', 1),
(24, '2018_03_18_144738_create_packabonnementplatforms_table', 1),
(25, '2018_03_18_165713_create_abonnementplatforms_table', 1),
(26, '2018_05_19_105256_create_balanceaffiliations_table', 1),
(27, '2018_05_19_122259_create_balanceaffiliationparameters_table', 1),
(28, '2018_05_22_150620_create_pvbalancepersonnes_table', 1),
(29, '2018_06_08_144442_create_balancebitcoins_table', 1),
(30, '2018_10_12_100000_create_password_resets_table', 1);

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
(1, 1, 2, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 3, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 4, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 5, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 2, 6, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 2, 7, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 2, 8, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 9, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 2, 10, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 2, 6, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 2, 7, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 2, 8, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 2, 9, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 2, 10, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 1, '1976-10-26', 'Bank', 9, 'Bank', 6, 17091.00, 8545.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 1, '2018-07-01', 'Bank', 4, 'Bank', 3, 4880.00, 2440.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 2, '2013-05-28', 'Bank', 4, 'Bank', 2, 24757.00, 12378.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 2, '2018-12-08', 'Wallet', 1, 'Bank', 2, 10987.00, 5493.50, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 3, '1995-12-31', 'Wallet', 7, 'Wallet', 1, 24953.00, 12476.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 1, 3, '2019-03-08', 'Wallet', 7, 'Wallet', 6, 17318.00, 8659.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 1, 4, '2011-04-07', 'Bank', 6, 'Wallet', 4, 19693.00, 9846.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 1, 4, '2019-02-08', 'Wallet', 8, 'Wallet', 4, 22593.00, 11296.50, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 1, 5, '2008-09-06', 'Wallet', 4, 'Wallet', 5, 14361.00, 7180.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 1, 5, '2019-03-08', 'Wallet', 1, 'Bank', 4, 4392.00, 2196.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 2, 1, '1982-01-26', 'Bank', 9, 'Wallet', 1, 23411.00, 11705.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 2, 1, '2018-07-08', 'Bank', 8, 'Wallet', 9, 6628.00, 3314.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 2, 2, '2016-12-31', 'Bank', 5, 'Bank', 7, 4022.00, 2011.00, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 2, 2, '2019-03-08', 'Bank', 4, 'Wallet', 9, 20432.00, 10216.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 2, 3, '1972-03-24', 'Wallet', 5, 'Wallet', 6, 3729.00, 1864.50, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 2, 3, '2018-10-08', 'Bank', 9, 'Wallet', 4, 29165.00, 14582.50, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 2, 4, '1981-08-09', 'Bank', 10, 'Bank', 6, 17204.00, 8602.00, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 2, 4, '2019-01-08', 'Bank', 3, 'Wallet', 1, 9256.00, 4628.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(19, 2, 5, '2014-11-08', 'Bank', 5, 'Wallet', 1, 5892.00, 2946.00, 1, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(20, 2, 5, '2018-07-08', 'Wallet', 2, 'Bank', 7, 572.00, 286.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(21, 3, 3, '2018-08-08', 'Bank', 10, 'Bank', 5, 28092.00, 14046.00, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(22, 4, 3, '2018-11-08', 'Wallet', 2, 'Bank', 6, 2625.00, 1312.50, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(23, 5, 4, '2019-01-08', 'Bank', 5, 'Bank', 10, 23307.00, 11653.50, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(24, 6, 4, '2018-08-08', 'Bank', 1, 'Wallet', 7, 13270.00, 6635.00, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(25, 7, 3, '2019-03-08', 'Bank', 7, 'Bank', 3, 18472.00, 9236.00, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(26, 8, 1, '2019-01-08', 'Wallet', 10, 'Wallet', 9, 1485.00, 742.50, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(27, 9, 4, '2018-12-08', 'Wallet', 5, 'Bank', 4, 23357.00, 11678.50, 0, 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(28, 10, 1, '2019-01-08', 'Wallet', 5, 'Wallet', 1, 1216.00, 608.00, 0, 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'Pack Abonnement Platform 1', 28.86, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 1, 'Jordan', 'Swaniawski', '06/06/1985', '1-807-675-4614 x207', '624 Harmony Glens\r\nGregoriamouth, NE 59597-8407', 'Belarus', 'Port Lillie', '11652', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:59:53'),
(2, 1, 1, 'Evelyn', 'Moen', '06/03/1990', '1-464-751-2386 x4791', '929 Jacinthe Locks\nMetaborough, CO 61081', 'Angola', 'Collierport', '20531', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 2, 1, 'Earl', 'Klein', '12/04/1982', '1-963-724-5596 x9931', '64250 Ondricka Stravenue\nLangoshborough, AZ 37762', 'Vietnam', 'East Rubyland', '99534', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 2, 3, 'Germaine', 'Hyatt', '08/07/1975', '753-870-6071 x8392', '278 Louie Union Suite 407\nDarianmouth, AL 69756', 'British Indian Ocean Territory (Chagos Archipelago)', 'Alexandrefort', '18518', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 3, 2, 'Cecile', 'Schoen', '18/06/1970', '1-690-419-5956', '8127 Constance Course Apt. 382\nTierraville, NJ 08119', 'Central African Republic', 'Port Brainside', '46188', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 3, 4, 'Dock', 'McCullough', '10/02/1974', '705.956.3007 x691', '268 Jakob Underpass Apt. 296\nFeeneystad, NJ 57717', 'Tanzania', 'East Margretport', '87567', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 4, 2, 'Ursula', 'Rowe', '18/05/1976', '920-974-6928 x3738', '2680 Emmerich Dam Suite 751\nWest Edgardostad, MD 51289-5768', 'Vietnam', 'West Brandybury', '39137', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 4, 1, 'Fidel', 'Jones', '06/11/1980', '282.201.1611', '273 Korey River\nNew Aliciaborough, NJ 17943-5819', 'Tunisia', 'South Tamara', '22105-5906', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 5, 3, 'Lura', 'Monahan', '11/09/1995', '798-521-9705', '5887 Champlin Lake Suite 177\nGayburgh, NH 84885-0917', 'Nauru', 'Port Cortney', '43328-1472', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 5, 4, 'Alfreda', 'Kuhlman', '21/04/1977', '216.386.0183', '37557 Kelvin Ways\nBernhardside, OH 93030', 'Guernsey', 'Abeberg', '56204', 'avatar.png', '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
(1, 'temporibus', 'Dolores ut possimus nobis omnis. Vel qui cum vel quia quis molestiae ullam.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'nihil', 'Sequi quam et qui dignissimos praesentium et est velit. Occaecati quia dolores et tempora ipsum. Omnis necessitatibus et sit adipisci voluptatem beatae. Ipsum qui est corporis dicta ut aut libero.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'non', 'Tempora id harum qui ut molestiae nam voluptatem. Eaque sapiente porro quas quo. Asperiores aperiam earum id perspiciatis fuga expedita ut.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'beatae', 'Neque in libero aut. Sunt aliquid quam maxime laboriosam harum. Fuga sunt minus omnis est repellat eum. Cupiditate sapiente et sint voluptas.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'in', 'Aut assumenda eligendi aut a voluptatem. Dolores incidunt officiis unde molestiae pariatur. Voluptatum facilis non enim corrupti. Natus modi perferendis cum omnis id ut.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 'repellat', 'Sit voluptates atque eius dolorem. Molestias enim alias iure doloribus possimus tempore. Amet ipsum aspernatur enim ut saepe voluptate veniam.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 'aliquid', 'Enim ut nisi omnis harum voluptatum. Animi odio libero enim sunt quos enim et.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 'sed', 'Blanditiis deleniti accusamus sint eum dolor corporis modi. Voluptas est ad exercitationem harum alias enim. Assumenda recusandae perspiciatis ea voluptas facilis voluptas. Iste neque est doloremque sed eius est ducimus modi.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 'adipisci', 'Laborum amet tempore iste placeat rerum ullam laborum. Et eum autem repellat consequatur maxime. Doloremque architecto ut et repudiandae tempora nostrum. Voluptates dolore tempora excepturi autem odit enim. Enim hic natus consequatur.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 'at', 'Eius natus et dignissimos autem dolor dicta reprehenderit reprehenderit. Sed fugit distinctio debitis itaque vero similique. Sunt qui eaque quia maiores. Quas veritatis velit sunt deleniti et corrupti.', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pvbalancepersonnes`
--

INSERT INTO `pvbalancepersonnes` (`id`, `id_personne`, `id_balance_affiliation`, `type_payment`, `montant_pvbalancepersonne`, `status_pvbalancepersonne`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Wallet', 0.00, 0, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(2, 2, 2, 'Bank', 0.00, 1, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 3, 3, 'Wallet', 0.00, 0, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 4, 4, 'Wallet', 0.00, 1, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 5, 5, 'Wallet', 0.00, 1, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 6, 6, 'Wallet', 0.00, 1, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 7, 7, 'Bank', 0.00, 1, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 8, 8, 'Wallet', 0.00, 0, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 9, 9, 'Wallet', 0.00, 2, '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 10, 10, 'Bank', 0.00, 2, '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
(1, 'QUESTION 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'QUESTION 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'QUESTION 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'QUESTION 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'QUESTION 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 1, 'OK 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 2, 'OK 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 3, 'OK 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 4, 'OK 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 5, 'OK 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 2, 1, 'OK 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 2, 2, 'OK 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 3, 'OK 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 2, 4, 'OK 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 2, 5, 'OK 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'RANK 1', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 'RANK 2', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 'RANK 3', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 'RANK 4', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 'RANK 5', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'Active', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(2, 'Canceled', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 'Pending Validation', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 'Suspended', '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
(1, 1, 1, 3, 'Hello, I have a problem !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 3, 1, 'Hello, which kind of problems ?', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 1, 1, 3, 'The profil did not updated !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 1, 3, 1, 'OK,  go to profil and refresh page and then click update !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 1, 1, 3, 'OK, Thanks it works, you saved my day !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 1, 3, 1, 'No problem, Thank you for using this platform :) !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 2, 2, 3, 'Hello, I have a problem !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 2, 3, 2, 'Hello, which kind of problems ?', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 2, 2, 3, 'The pack did not buyed :s !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 2, 3, 2, 'OK,  go to pack page and refresh it and then click Take it another time !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 2, 2, 3, 'OK, Thanks it works, you saved my day !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(12, 2, 3, 2, 'No problem, Thank you for using this platform :) !', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(13, 3, 3, 3, 'Est quia odio quod debitis. Odio enim exercitationem numquam illo occaecati officiis suscipit.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(14, 4, 4, 3, 'Aut sequi quidem ipsam fuga soluta. Voluptatem commodi repellat doloribus rerum sequi exercitationem velit. Excepturi asperiores est omnis et ab id. Temporibus eius et molestias quo qui numquam.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(15, 5, 5, 3, 'Quia pariatur non nobis qui numquam. Consectetur earum odit commodi et consequatur consectetur. Iure ab et et nihil sapiente voluptatem repudiandae aut. Dolorum debitis et sed tempora aut optio minima. Qui debitis in quis totam ut.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(16, 6, 6, 3, 'Nostrum magni magnam beatae ex consequuntur accusamus. In est ipsa quisquam ad corporis. Cum aliquid commodi excepturi. Sint eos rerum molestiae non suscipit. Nihil eius inventore exercitationem.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(17, 7, 7, 3, 'Placeat dolorum officiis nemo voluptatem omnis. Ullam et aut vel. Rem ratione voluptas asperiores velit fuga. Sed doloremque explicabo deserunt temporibus.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(18, 8, 8, 3, 'Porro culpa explicabo ad. Est voluptatem eius laudantium qui aspernatur fugiat id earum. Odit ea nulla repudiandae sit quaerat natus ut.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(19, 9, 9, 3, 'Sed dicta incidunt ducimus deserunt soluta repudiandae. Facere dolores architecto voluptate. Odio perspiciatis officia omnis et. Occaecati eligendi nesciunt non voluptas ducimus fuga cupiditate repellat.', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(20, 10, 10, 3, 'Fugiat in voluptates necessitatibus soluta iure. Ducimus mollitia minima porro velit ad distinctio. Voluptatem ut tempora et voluptatem vero dolorem quidem.', '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 1, 'Problem Update Profil !', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 2, 'Problem Buying packs !', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 3, 'nemo', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 4, 'quia', 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 5, 'illo', 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 6, 'pariatur', 1, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 7, 'id', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 8, 'dolore', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 9, 'incidunt', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 10, 'quos', 0, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
(1, 'Member', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(2, 'Admin', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(3, 'Super Admin', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(4, 'eius', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(5, 'totam', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(6, 'provident', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(7, 'blanditiis', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(8, 'et', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(9, 'impedit', '2018-06-08 14:58:05', '2018-06-08 14:58:05'),
(10, 'placeat', '2018-06-08 14:58:05', '2018-06-08 14:58:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `userlogs`
--

INSERT INTO `userlogs` (`id`, `user_id`, `activite`, `ip_address`, `status_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'Connected successfully', '192.168.0.1', 'success', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(2, 1, 'Disconnected successfully', '192.168.0.1', 'danger', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 2, 'Connected successfully', '192.168.0.2', 'success', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(4, 2, 'Disconnected successfully', '192.168.0.2', 'danger', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 3, 'Connected successfully', '192.168.0.3', 'success', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 3, 'Disconnected successfully', '192.168.0.3', 'danger', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 4, 'Connected successfully', '192.168.0.4', 'success', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 4, 'Disconnected successfully', '192.168.0.4', 'danger', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 1, 'Connected successfully', '192.168.0.5', 'success', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 1, 'Disconnected successfully', '192.168.0.5', 'danger', '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(11, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 14:59:44', '2018-06-08 14:59:44'),
(12, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-06-08 15:00:01', '2018-06-08 15:00:01'),
(13, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 15:00:15', '2018-06-08 15:00:15'),
(14, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-06-08 15:01:04', '2018-06-08 15:01:04'),
(15, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 15:01:16', '2018-06-08 15:01:16'),
(16, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 15:02:44', '2018-06-08 15:02:44'),
(17, 1, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-06-08 15:25:39', '2018-06-08 15:25:39'),
(18, 3, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-06-08 17:02:28', '2018-06-08 17:02:28'),
(19, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 17:03:07', '2018-06-08 17:03:07'),
(20, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-06-08 19:06:20', '2018-06-08 19:06:20');

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
(1, 1, 'emo@mail.com', '$2y$10$Q.t7MwHJS0WjU5DzhYQHfOPtoXQywvaRUWuOfGu2whPgWUqtTMuCy', 1, 0, 0, '9eapmMmKitRQ5t1srMlcPQWn0depwx6Cl5iNFkZiLhHpsQvJymZY7bFyzfiT', '2018-06-08 14:58:06', '2018-06-08 17:03:07'),
(2, 2, 'ywisozk@harris.com', '$2y$10$uCnNmVkH9DH6taH7iKCqDu9kUJOVTHE4tqdB6qQ160R6GRoviZ8ey', 0, 0, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(3, 3, 'admin@mail.com', '$2y$10$SGGCkOleeH0LU3QWy0obFuAlkSs8vc35/1t/QrWThQRHOb./eQ9Hi', 1, 0, 0, '8tEomKwHogfon0D9OXaYNRrf7200YDJVJYtPymFEGfSVt1tleO03fhSeS01l', '2018-06-08 14:58:06', '2018-06-08 19:06:20'),
(4, 4, 'ewaelchi@paucek.org', '$2y$10$E8035TSDVAU6d0rh277Ir.a0ljHVeU1BDWA8lxS02tADK/wYeaTkK', 0, 1, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(5, 5, 'nweimann@yahoo.com', '$2y$10$BR4KVkjwKqLIuDMy0etmR.QN0Mr36iozefLKg1ziCKJhjIQV17QRm', 0, 0, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(6, 6, 'stehr.ernesto@hotmail.com', '$2y$10$Btq7WsLHfSOcE4FYBw4x0enAztMRUb6U3RtV0DN0RZFTP0LqAlSaS', 0, 0, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(7, 7, 'vjaskolski@willms.net', '$2y$10$s4PjfIFjDdsv1TZr/dZAuu6nLZsZHLzUyjKCLEC4vlrkHd/VQxOGC', 0, 0, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(8, 8, 'turcotte.jules@windler.com', '$2y$10$QGMALrHcIPjnPmWcDziehuEcv5qRaenDpghaeOXprgr5j93qs572i', 0, 1, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(9, 9, 'maggio.kennith@hotmail.com', '$2y$10$e6fj3WQF0YB.xt8f6ApuUOp0Mvr7Uwlpu3VXfRIaorJi5/5ht4cjy', 0, 1, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06'),
(10, 10, 'pschumm@gmail.com', '$2y$10$XCzFNooMSavviD9l3A0vwOCXg3I/5GV.carhulie5KWwJjyeUqnfi', 0, 0, 0, NULL, '2018-06-08 14:58:06', '2018-06-08 14:58:06');

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
-- Contraintes pour la table `balancebitcoins`
--
ALTER TABLE `balancebitcoins`
  ADD CONSTRAINT `balancebitcoins_id_personne_foreign` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id`) ON DELETE CASCADE;

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
