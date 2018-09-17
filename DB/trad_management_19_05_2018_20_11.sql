-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 19 mai 2018 à 20:11
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
(1, 1, 1, 'Wallet', 5, '2018-07-19', 28201.00, 14100.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 2, 1, 'Wallet', 5, '2019-01-19', 5681.00, 2840.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 3, 1, 'Wallet', 10, '2018-12-19', 10735.00, 5367.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 4, 1, 'Wallet', 2, '2019-02-19', 25371.00, 12685.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 5, 1, 'Wallet', 10, '2019-02-19', 28846.00, 14423.00, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 6, 1, 'Wallet', 7, '2018-09-19', 12676.00, 6338.00, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 7, 1, 'Wallet', 2, '2019-03-19', 21562.00, 10781.00, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 8, 1, 'Bank', 8, '2018-10-19', 161.00, 80.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 9, 1, 'Wallet', 2, '2019-01-19', 3467.00, 1733.50, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 10, 1, 'Wallet', 4, '2018-08-19', 9130.00, 4565.00, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 1, 1, 'Bank', 5, '1971-06-10', 3151.00, 3151.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 2, 1, 'Bank', 9, '1975-12-29', 3540.00, 3540.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 3, 1, 'Bank', 3, '1992-10-16', 11592.00, 11592.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 4, 1, 'Bank', 4, '1990-10-20', 10756.00, 10756.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 5, 1, 'Wallet', 8, '1977-07-21', 12816.00, 12816.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 6, 1, 'Bank', 3, '1976-07-15', 586.00, 586.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 7, 1, 'Wallet', 9, '2003-12-21', 13286.00, 13286.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 8, 1, 'Bank', 10, '1993-10-07', 16164.00, 16164.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(19, 9, 1, 'Wallet', 2, '1975-03-11', 20260.00, 20260.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(20, 10, 1, 'Bank', 10, '1988-12-20', 8411.00, 8411.00, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'Bronze', 1000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'Silver', 2000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'Gold', 5000.00, 'Between 130% and 300%', 'Depending to your Rank', 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'Platinum', 10000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'Diamond', 25000.00, 'Between 130% and 300%', 'Depending to your Rank', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 50.00, 15.00, '2018-05-19 14:24:05', '2018-05-19 16:03:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `balanceaffiliations`
--

INSERT INTO `balanceaffiliations` (`id`, `id_personne`, `balance_affiliation`, `created_at`, `updated_at`) VALUES
(1, 1, 15.00, '2018-05-19 14:24:04', '2018-05-19 15:16:42'),
(2, 2, 0.00, '2018-05-19 14:24:04', '2018-05-19 19:08:18'),
(3, 3, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(4, 4, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(5, 5, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(6, 6, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(7, 7, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(8, 8, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(9, 9, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(10, 10, 0.00, '2018-05-19 14:24:04', '2018-05-19 20:10:06'),
(12, 14, 50.00, '2018-05-19 15:08:44', '2018-05-19 20:10:19');

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
(1, 1, 1, '45042991001', 'Bolivia', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 2, '5027286617232', 'China', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 3, '965047641804', 'Christmas Island', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 4, '24032968914825', 'Cote d\'Ivoire', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 5, '9984141453784', 'Kazakhstan', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 2, 1, '1019032', 'Nigeria', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 2, 2, '016054327275', 'Anguilla', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 2, 3, '154505826', 'Turkmenistan', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 4, '0223502248', 'Monaco', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 2, 5, '4414120010588', 'French Polynesia', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 3, 3, '82153623237', 'Tunisia', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 4, 5, '47007433899', 'Algeria', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 5, 1, '07448977', 'Wallis and Futuna', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 6, 2, '6437912605444', 'Svalbard & Jan Mayen Islands', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 7, 1, '42684606388', 'Chad', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 8, 4, '07199530132', 'Nicaragua', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 9, 4, '81922681244', 'Guadeloupe', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 10, 4, '8085369', 'Australia', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'BANK 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'BANK 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'BANK 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'BANK 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'BANK 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, 1, 'aut', '87531350', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 2, 'et', '044186161658518', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 3, 'quam', '883981273209179', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 4, 'commodi', '925963399310', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 5, 'dolore', '7672414807', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 2, 1, 'voluptatem', '2867501884', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 2, 2, 'doloribus', '19247720', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 2, 3, 'doloremque', '44728155', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 4, 'earum', '622639667225356', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 2, 5, 'sapiente', '64747099321805', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 3, 5, 'animi', '4770898', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 4, 3, 'fuga', '97114162824', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 5, 4, 'temporibus', '17763320257', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 6, 1, 'quo', '6574890074', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 7, 4, 'enim', '19408933374', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 8, 1, 'fugiat', '14122505890344', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 9, 3, 'fugit', '477391528653373', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 10, 2, 'sit', '201653603', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, '625633564', 'New Caledonia', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 3, '37997497', 'Timor-Leste', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 5, '2043483159224', 'Dominica', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 5, '5723529938', 'Lesotho', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 4, '3101632', 'South Georgia and the South Sandwich Islands', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 4, '2304417436', 'Saudi Arabia', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 5, '3412549752244', 'Togo', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 3, '262940842274351', 'Guadeloupe', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, '255608885064', 'Vanuatu', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 2, '7357825818', 'Bermuda', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 4, 'accusantium', '781819570', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 2, 'voluptas', '761256659475', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 2, 'sunt', '852415701', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 2, 'sint', '4332101', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 2, 'et', '14114949450', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 4, 'omnis', '315070758630', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 5, 'iste', '5073410577', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 4, 'doloremque', '58239761', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 'minima', '098204346186', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 1, 'maxime', '5810651317151', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'Currencie 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'Currencie 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'Currencie 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'Currencie 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'Currencie 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, 9, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(2, 2, 8, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(3, 3, 2, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(4, 4, 4, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(5, 5, 7, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(6, 6, 5, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(7, 7, 4, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(8, 8, 5, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(9, 9, 2, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(10, 10, 9, '2018-05-19 14:24:04', '2018-05-19 14:24:04');

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
(1, 1, 'Natus quas in quis explicabo eveniet vel. Laborum accusantium repellendus voluptate vel ratione quo. Sunt iste alias consequuntur in aut laborum. Accusamus at tempore animi molestiae voluptatem ut et.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 'Quibusdam sapiente dolores occaecati minima sint veniam. Quis nemo beatae explicabo odio earum sit est. Praesentium sint sunt nobis delectus aut voluptas maiores porro.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 2, 'Consectetur sint fuga sit impedit. Asperiores aut quia eaque similique amet eius. Quod earum qui dolor excepturi qui recusandae.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 2, 'Labore optio accusantium facilis blanditiis. Rerum eius qui recusandae sit. Maxime earum ut atque accusamus sit pariatur. Eveniet at corporis soluta aut. Dignissimos et aut exercitationem laborum.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 3, 'Repellendus aperiam expedita omnis accusantium. Ullam qui in vero ut officia. Eaque fuga vero reprehenderit id sunt qui ut.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 3, 'Officia deserunt accusantium sequi est nihil at animi inventore. Consequatur occaecati unde voluptatum illo nam. Maiores ducimus enim ut qui nostrum eveniet illo.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 4, 'Officia aut quas deleniti molestiae magni voluptas voluptate. Quidem non enim recusandae et facilis. Est laborum placeat minus est.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 4, 'Consequuntur temporibus numquam non voluptates consequuntur. Nesciunt magnam qui inventore commodi labore molestias. Earum ut labore fugit quod.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 5, 'Non dolores recusandae perferendis est consequatur vel natus. Est numquam maxime dolores temporibus. Sit enim dolorem voluptatibus harum quia magni placeat possimus. Qui veniam sint ut qui impedit.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 5, 'Quibusdam itaque consequatur eligendi. Omnis exercitationem similique expedita aut. Vel quaerat et nobis nisi nihil.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 6, 'Libero iste placeat ipsa dolorem minus. Temporibus aut deleniti quo distinctio eos. Laudantium cupiditate soluta adipisci vel ut fugit.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 6, 'Officia at nemo eum necessitatibus amet quam nesciunt. Aut eum eius aut provident beatae voluptas veritatis. Laborum excepturi totam culpa pariatur.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 7, 'Ut vero aspernatur cumque laboriosam exercitationem sint deleniti enim. Nulla accusamus labore laudantium incidunt rerum numquam. Aut fugiat modi maxime consectetur expedita. Voluptates vero exercitationem exercitationem sed cupiditate harum blanditiis.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 7, 'Reiciendis eos recusandae doloribus rem et. Quo facere et a vitae quia harum aut. Accusamus sapiente et quasi vitae. Veniam quidem quia quis fugiat repudiandae debitis rerum.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 8, 'Dolore minus quisquam et esse quia. Vitae eum officiis et esse quo in. Quo minima in dolorum non autem sequi.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 8, 'Assumenda non quia voluptatem a voluptas facilis. Soluta velit est minima quas est aut alias. Eos sit distinctio id aliquam id esse ut.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 9, 'Incidunt optio quia dolorum. Et non magni reprehenderit recusandae est autem qui. Consectetur et dolorum qui consequatur minima officia. Consectetur molestiae ea nesciunt ut non unde unde.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 9, 'Eum deserunt vero illum unde. Deserunt fuga cum sunt ipsam voluptas odit nesciunt natus. Qui accusantium modi quia quod blanditiis itaque.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(19, 10, 'Voluptate eum enim qui non. Voluptatem voluptatibus ducimus et sit doloremque.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(20, 10, 'Magnam aspernatur aliquam cum sed. Alias odit et eum molestias. Quia est et ab labore illo. Facilis facere voluptatibus occaecati fugiat libero debitis aut voluptates.', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(83, '2018_01_12_231851_create_tpersonnes_table', 1),
(84, '2018_01_12_232552_create_statuscomptes_table', 1),
(85, '2018_01_12_232652_create_personnes_table', 1),
(86, '2018_01_12_233833_create_membres_table', 1),
(87, '2018_01_13_000000_create_users_table', 1),
(88, '2018_01_13_004621_create_userlogs_table', 1),
(89, '2018_01_31_142753_create_niveau1s_table', 1),
(90, '2018_01_31_163901_create_niveau2s_table', 1),
(91, '2018_02_03_170527_create_rankings_table', 1),
(92, '2018_02_04_124133_create_abonnements_table', 1),
(93, '2018_02_04_143905_create_ontradings_table', 1),
(94, '2018_02_05_213041_create_posts_table', 1),
(95, '2018_02_06_134459_create_messages_table', 1),
(96, '2018_02_15_141303_create_banks_table', 1),
(97, '2018_02_15_145402_create_currencies_table', 1),
(98, '2018_02_17_133948_create_bankaccounts_table', 1),
(99, '2018_02_17_164232_create_companyaccounts_table', 1),
(100, '2018_02_17_230622_create_bankwallets_table', 1),
(101, '2018_02_18_002414_create_companywallets_table', 1),
(102, '2018_02_18_101437_create_supporttickets_table', 1),
(103, '2018_02_18_102145_create_supportticketmessages_table', 1),
(104, '2018_03_13_202938_create_questions_table', 1),
(105, '2018_03_13_205307_create_questreps_table', 1),
(106, '2018_03_18_144738_create_packabonnementplatforms_table', 1),
(107, '2018_03_18_165713_create_abonnementplatforms_table', 1),
(108, '2018_05_19_105256_create_balanceaffiliations_table', 1),
(109, '2018_05_19_122259_create_balanceaffiliationparameters_table', 1),
(110, '2018_10_12_100000_create_password_resets_table', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau1s`
--

INSERT INTO `niveau1s` (`id`, `id_parrain`, `id_parraine`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 3, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 4, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 5, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 2, 6, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 2, 7, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 2, 8, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 2, 9, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 10, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 1, 14, '2018-05-19 15:08:44', '2018-05-19 15:08:44');

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
(1, 1, 2, 6, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 2, 7, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 2, 8, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 2, 9, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 2, 10, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, 1, '2013-01-21', 'Wallet', 3, 'Wallet', 5, 27778.00, 13889.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 1, '2018-06-13', 'Wallet', 3, 'Bank', 7, 20446.00, 10223.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 2, '1986-12-03', 'Bank', 7, 'Wallet', 4, 460.00, 230.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 2, '2019-03-19', 'Bank', 9, 'Bank', 10, 7838.00, 3919.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 3, '1983-06-26', 'Bank', 4, 'Wallet', 3, 5288.00, 2644.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 1, 3, '2018-12-19', 'Bank', 8, 'Bank', 8, 7106.00, 3553.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 1, 4, '1975-07-14', 'Bank', 9, 'Bank', 4, 16802.00, 8401.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 1, 4, '2018-12-19', 'Wallet', 3, 'Bank', 7, 2059.00, 1029.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 1, 5, '1978-02-20', 'Wallet', 1, 'Wallet', 9, 13050.00, 6525.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 1, 5, '2019-03-19', 'Wallet', 3, 'Bank', 6, 3528.00, 1764.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 2, 1, '2005-05-10', 'Wallet', 1, 'Wallet', 3, 23747.00, 11873.50, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 2, 1, '2018-08-19', 'Wallet', 10, 'Wallet', 4, 14519.00, 7259.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 2, 2, '1991-09-13', 'Wallet', 10, 'Bank', 4, 21537.00, 10768.50, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 2, 2, '2018-07-19', 'Wallet', 9, 'Wallet', 1, 18961.00, 9480.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 2, 3, '1973-03-22', 'Wallet', 9, 'Bank', 7, 18289.00, 9144.50, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 2, 3, '2018-09-19', 'Bank', 8, 'Wallet', 6, 17981.00, 8990.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 2, 4, '1970-01-29', 'Bank', 8, 'Bank', 6, 7771.00, 3885.50, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 2, 4, '2018-11-19', 'Bank', 9, 'Bank', 7, 4560.00, 2280.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(19, 2, 5, '2005-01-19', 'Bank', 7, 'Bank', 7, 20364.00, 10182.00, 1, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(20, 2, 5, '2018-08-19', 'Bank', 4, 'Wallet', 3, 29189.00, 14594.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(21, 3, 4, '2018-06-19', 'Wallet', 8, 'Bank', 4, 17806.00, 8903.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(22, 4, 3, '2019-01-19', 'Bank', 4, 'Wallet', 8, 27794.00, 13897.00, 0, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(23, 5, 2, '2018-08-19', 'Bank', 8, 'Wallet', 9, 1471.00, 735.50, 0, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(24, 6, 3, '2018-12-19', 'Bank', 6, 'Bank', 9, 14860.00, 7430.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(25, 7, 2, '2019-01-19', 'Bank', 2, 'Bank', 6, 26297.00, 13148.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(26, 8, 4, '2018-12-19', 'Bank', 8, 'Bank', 2, 20414.00, 10207.00, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(27, 9, 4, '2019-01-19', 'Wallet', 4, 'Bank', 4, 27402.00, 13701.00, 0, 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(28, 10, 4, '2018-07-19', 'Wallet', 3, 'Bank', 2, 11487.00, 5743.50, 0, 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'Pack Abonnement Platform 1', 64.18, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id`, `id_tpersonne`, `id_statuscompte`, `nom`, `prenom`, `date_naissance`, `telephone`, `adresse`, `pays`, `ville`, `zipcode`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Tracey', 'Sawayn', '09/03/1992', '(504) 235-3720', '5763 Leland Grove Apt. 266\nGunnarfurt, NM 64461-4177', 'Montserrat', 'Rowantown', '67193', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(2, 1, 3, 'Amber', 'Quitzon', '04/11/1995', '(323) 405-8223', '98277 Jermaine Lodge\nWest Rico, NE 02802', 'Honduras', 'Lake Abigailfurt', '41150-9817', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(3, 2, 1, 'Bo', 'Hermiston', '12/08/1978', '(954) 681-1984 x217', '7234 Evalyn Common Suite 981\nHeidenreichview, NV 15154', 'Marshall Islands', 'East Rupert', '57828', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(4, 2, 2, 'Margie', 'Lesch', '09/02/1984', '779-913-2745 x90572', '4523 Burnice Court Apt. 001\nNorenebury, WA 58225', 'Lithuania', 'Johanstad', '25047', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(5, 3, 2, 'Kendra', 'Hilll', '11/06/1983', '213-779-4882 x886', '49279 Volkman Inlet\nShakiramouth, TN 90187-9942', 'Heard Island and McDonald Islands', 'North Afton', '61764', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(6, 3, 2, 'Samanta', 'Kohler', '29/10/1990', '575.929.1220 x950', '42473 Jaquelin Neck Suite 983\nPort Johnnie, IN 26447-5148', 'Niger', 'South Favian', '12111', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(7, 4, 1, 'Imelda', 'Walker', '26/08/1985', '649-472-0534 x7669', '468 Brenna Cove Suite 358\nWatersbury, FL 35064-7723', 'Denmark', 'Lake Emmet', '54947', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(8, 4, 4, 'Savannah', 'Brekke', '18/02/1972', '1-626-881-1837 x5050', '92551 Harvey Port\nBernadettestad, TN 99375-7342', 'Georgia', 'Fredastad', '31105-8182', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(9, 5, 2, 'Ron', 'Kautzer', '07/08/1997', '1-998-501-7803 x113', '62202 White Mountains Apt. 362\nSouth Branson, KY 40715-5701', 'Trinidad and Tobago', 'East Kade', '89344', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(10, 5, 4, 'Madisen', 'Bechtelar', '13/07/1989', '+1-929-654-0845', '2562 Alfreda Dam\nHalvorsonshire, MT 02166-4011', 'Korea', 'East Marcelinabury', '99197', 'avatar.png', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(14, 1, 1, 'MIMO', 'Emo', NULL, NULL, NULL, 'Morocco', 'Tanger', '90000', 'avatar.png', '2018-05-19 15:08:44', '2018-05-19 15:16:42');

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
(1, 'laborum', 'Similique aut odio quia sint tempore. Omnis accusantium consequatur mollitia quia voluptate cupiditate. Unde assumenda eius veritatis rerum dolores.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'saepe', 'Illo pariatur ad voluptas omnis ea ducimus hic. Corporis tempore modi deleniti id quos harum. Omnis ipsa aut deserunt minus consectetur aut cum. Pariatur unde porro similique minima.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'similique', 'Quae aperiam totam sunt magni. Sed qui eius ullam sed provident est. Laudantium odit illo dignissimos est blanditiis accusamus voluptas provident. Dicta id omnis quia repellendus eius id.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'ipsa', 'Excepturi quis id eligendi omnis. Maxime quia nihil alias atque modi corrupti est. Dolorem dolorem tenetur reiciendis nostrum fugit sint aut. Non beatae labore nobis saepe est dolor dolor dolores.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'dolorem', 'Nostrum quia velit rerum quos quo quia. Modi occaecati eligendi eum porro similique ducimus facilis. Omnis architecto aut est excepturi nihil doloribus. Eos repudiandae praesentium ex ut.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 'accusamus', 'Illo quia asperiores quis animi voluptatum nam enim. Voluptatibus omnis reiciendis eligendi nobis voluptatem. Quidem eaque incidunt qui eum sunt. Mollitia veritatis earum reiciendis ut.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 'enim', 'Fugiat iure voluptatem reiciendis molestiae et. Delectus et aspernatur ullam in aut sit unde. Omnis saepe nemo commodi illum. Voluptatem dolorem aut optio porro voluptas quam esse.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 'sit', 'Corrupti id earum non nemo consequatur ea. Earum et magni in non earum aliquid. Nobis perferendis suscipit rem recusandae.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 'laborum', 'Nihil eum ut temporibus amet quia quia. Qui adipisci eveniet voluptate tenetur. Nam eligendi qui qui. Id cumque ducimus deleniti at voluptas.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 'nesciunt', 'Quibusdam facere explicabo dignissimos quis optio. Illo praesentium alias sunt molestiae debitis. Veritatis autem tempore deserunt reiciendis aliquam. Vitae quod ipsum possimus et quo.', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'QUESTION 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'QUESTION 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'QUESTION 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'QUESTION 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'QUESTION 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, 1, 'OK 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 2, 'OK 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 3, 'OK 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 4, 'OK 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 5, 'OK 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 2, 1, 'OK 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 2, 2, 'OK 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 2, 3, 'OK 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 4, 'OK 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 2, 5, 'OK 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'RANK 1', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 'RANK 2', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 'RANK 3', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 'RANK 4', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 'RANK 5', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'Active', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(2, 'Canceled', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(3, 'Pending Validation', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(4, 'Suspended', '2018-05-19 14:24:04', '2018-05-19 14:24:04');

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
(1, 1, 1, 3, 'Hello, I have a problem !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 3, 1, 'Hello, which kind of problems ?', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 1, 1, 3, 'The profil did not updated !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 1, 3, 1, 'OK,  go to profil and refresh page and then click update !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 1, 1, 3, 'OK, Thanks it works, you saved my day !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 1, 3, 1, 'No problem, Thank you for using this platform :) !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 2, 2, 3, 'Hello, I have a problem !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 2, 3, 2, 'Hello, which kind of problems ?', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 2, 2, 3, 'The pack did not buyed :s !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 2, 3, 2, 'OK,  go to pack page and refresh it and then click Take it another time !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 2, 2, 3, 'OK, Thanks it works, you saved my day !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(12, 2, 3, 2, 'No problem, Thank you for using this platform :) !', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(13, 3, 3, 3, 'Qui optio qui neque mollitia rerum et quia ipsa. Hic sed ut ratione mollitia at qui dolor. Dolore ratione ipsum explicabo corporis. Incidunt molestias beatae aspernatur autem adipisci id minus aut.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 4, 4, 3, 'Est qui ut ab sequi aut quam eius. Qui nemo eos illum aut. Quae a fugiat officia asperiores.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(15, 5, 5, 3, 'Tenetur sit omnis laborum nisi. Tempore ea pariatur dolor voluptatem aut quia voluptatum impedit. Eius omnis ab repudiandae reprehenderit explicabo distinctio. Ratione explicabo provident qui corrupti in earum.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(16, 6, 6, 3, 'Dolorum similique aut sed numquam nesciunt quos. Nostrum repudiandae quibusdam beatae et facere ab.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(17, 7, 7, 3, 'Explicabo accusantium eveniet sed commodi dolor. Esse repellat molestiae rem facilis quod aut consequatur. Et enim alias voluptas nihil quae.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(18, 8, 8, 3, 'Eos dolor quia quis. Quo veniam dolores repudiandae saepe ut aut. Ipsum magnam aliquid voluptatem. Sed natus quia sed voluptatem quos magnam odio totam.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(19, 9, 9, 3, 'Soluta quis sint et corrupti numquam est occaecati. Tempora ut incidunt deleniti odio. Consequuntur aut similique nihil nostrum.', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(20, 10, 10, 3, 'Alias accusamus nobis ut sequi quis eum. Modi porro et est facilis numquam dignissimos itaque sed. Perferendis eaque illum laboriosam sit. Est voluptas dicta libero nesciunt nulla. Ea id earum consequatur cumque.', '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 1, 'Problem Update Profil !', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 2, 'Problem Buying packs !', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 3, 'voluptatem', 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 4, 'eos', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 5, 'fuga', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 6, 'quos', 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 7, 'est', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 8, 'doloribus', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 9, 'enim', 1, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 10, 'impedit', 0, '2018-05-19 14:24:05', '2018-05-19 14:24:05');

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
(1, 'Member', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(2, 'Admin', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(3, 'Super Admin', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(4, 'saepe', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(5, 'qui', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(6, 'ipsum', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(7, 'enim', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(8, 'ipsum', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(9, 'vero', '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(10, 'et', '2018-05-19 14:24:04', '2018-05-19 14:24:04');

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
(1, 1, 'Connected successfully', '192.168.0.1', 'success', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(2, 1, 'Disconnected successfully', '192.168.0.1', 'danger', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(3, 2, 'Connected successfully', '192.168.0.2', 'success', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(4, 2, 'Disconnected successfully', '192.168.0.2', 'danger', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(5, 3, 'Connected successfully', '192.168.0.3', 'success', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(6, 3, 'Disconnected successfully', '192.168.0.3', 'danger', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(7, 4, 'Connected successfully', '192.168.0.4', 'success', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(8, 4, 'Disconnected successfully', '192.168.0.4', 'danger', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 1, 'Connected successfully', '192.168.0.5', 'success', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 1, 'Disconnected successfully', '192.168.0.5', 'danger', '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(11, 3, 'Connected successfully', '127.0.0.1', 'success', '2018-05-19 14:26:29', '2018-05-19 14:26:29'),
(13, 1, 'Connected successfully', '127.0.0.1', 'success', '2018-05-19 14:55:07', '2018-05-19 14:55:07'),
(14, 14, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-05-19 15:29:02', '2018-05-19 15:29:02'),
(15, 3, 'Disconnected successfully', '127.0.0.1', 'danger', '2018-05-19 20:10:44', '2018-05-19 20:10:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `id_personne`, `email`, `password`, `online`, `active_security_questions`, `firstime`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'lang.guadalupe@tromp.com', '$2y$10$X.PjyQHPkQtcEwnJPOUJW.ugTv8LW8cpRIQooNYJwPImMvdwfl1LW', 1, 0, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:55:07'),
(2, 2, 'ian40@gmail.com', '$2y$10$Lr8N74mpB9Ev2gAjsxVGaOFW8ywd40l2mdYkpHi.TsI0.SPGAbRXS', 0, 1, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(3, 3, 'cparisian@yahoo.com', '$2y$10$FGl38jOhyRy6wwCvgh0q/eQiE.ZUWHDFdbmgEfxBBKIVZi0HtgYOe', 0, 1, 0, '1CHDohX4BeVcKZRjp5c2ukxDt05AIdswFeQjhJMWfeGFhbfwKeeblkRHl8tg', '2018-05-19 14:24:04', '2018-05-19 20:10:44'),
(4, 4, 'bailey.mayra@casper.com', '$2y$10$cIafkzNTsEkrAunVCX0Q8eQgHzGEwe48NXV7uZVB3ArjqIqMJzJIC', 0, 0, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(5, 5, 'fvonrueden@gmail.com', '$2y$10$JLiWM53p0dTVG2TN/qFeF.zbOsNDYMalg8SevmiZQa7oVQBF/wYri', 0, 1, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(6, 6, 'nwaters@yahoo.com', '$2y$10$XP8aAeQYL45M48Sl7sJvqOB5TT2L5V0hS39o/bAL4TXThwUiXTPzS', 0, 1, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(7, 7, 'leilani08@gmail.com', '$2y$10$SwtSddXqLZAaS/R4Cli27.ukS5rL29OuYITZ56dUBV1m1hVLDlbHG', 0, 0, 0, NULL, '2018-05-19 14:24:04', '2018-05-19 14:24:04'),
(8, 8, 'bartoletti.cecelia@rath.com', '$2y$10$KNB4kk2GHEYERxq4RYPqKO0sVDPqyiaeKyk9K.oSm3EwhZVsP0SBC', 0, 1, 0, NULL, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(9, 9, 'dooley.antonio@yahoo.com', '$2y$10$JoZgCstP2Gr1ZaOGu04vzePe.RWTyhqTy1ESRY1FaNYALUlRX/G6G', 0, 0, 0, NULL, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(10, 10, 'istark@hotmail.com', '$2y$10$.8J9RzNSMoPMXLpZYVwOFuMhA4H0DLL3Trq0DYgoTeiyls8zN/rEq', 0, 0, 0, NULL, '2018-05-19 14:24:05', '2018-05-19 14:24:05'),
(14, 14, 'imad_benammar@hotmail.com', '$2y$10$ZAMYxNe4dgIM/iubZrFQsOcqa3nF3fWkrYh.y9sWeWBBJEUj5ZvSS', 0, 0, 0, 'iWTNxzTVhvk4g54IwlPfEXksDDhoqgoxmHIyARwRXlMpq7IVIqrAJ5Fa5fYq', '2018-05-19 15:08:44', '2018-05-19 15:29:02');

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
