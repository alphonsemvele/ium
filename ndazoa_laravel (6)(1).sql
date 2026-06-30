-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 24 mai 2026 à 15:27
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ndazoa_laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE `annonces` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `public` enum('all','student','personnel') NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`id`, `title`, `content`, `file`, `date`, `public`, `status`, `created_at`, `updated_at`) VALUES
(13, 'Blanditiis nisi volu', 'Distinctio Quis quo', NULL, '1983-02-15', 'all', 'Success', '2025-07-27 14:18:22', '2025-07-28 18:28:51'),
(14, 'Sed quidem in ad ten', 'Necessitatibus dolor', NULL, '2023-05-05', 'all', 'pending', '2025-07-27 14:19:06', '2025-07-27 14:19:06'),
(15, 'Iusto consequatur V', 'Dolor ipsa modi nem', NULL, '2008-04-04', 'personnel', 'pending', '2025-07-27 16:19:48', NULL),
(16, 'Officiis consequat ', 'Ipsum nisi dolor eiu', NULL, '1984-08-09', 'all', 'Success', '2025-07-27 16:20:00', '2025-07-28 16:57:27'),
(17, 'Natus deserunt simil', 'Aut magna quibusdam ', NULL, '1976-05-28', 'student', 'pending', '2025-07-27 16:20:18', '2025-07-28 17:07:34'),
(18, 'Cupidatat cupidatat ', 'Aute qui laudantium', NULL, '1999-04-30', 'student', 'Success', '2025-07-27 16:21:13', '2025-07-28 16:58:05'),
(19, 'Odit sequi veritatis', 'Sed consequatur Fac', NULL, '1987-03-03', 'all', 'pending', '2025-07-27 16:22:05', '2025-07-28 17:07:41'),
(20, 'Illum eos ex aut i', 'Ex perspiciatis ex ', NULL, '2016-09-19', 'student', 'pending', '2025-07-28 18:27:14', '2025-08-23 13:04:19'),
(21, 'disponibilité des notes', 'bonjour a tous ', NULL, '2025-08-20', 'student', 'pending', '2025-08-23 15:37:24', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `arrondissements`
--

CREATE TABLE `arrondissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `arrondissements`
--

INSERT INTO `arrondissements` (`id`, `name`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'Ngaoundéré 1er', 1, NULL, NULL),
(2, 'Ngaoundéré 2e', 1, NULL, NULL),
(3, 'Ngaoundéré 3e', 1, NULL, NULL),
(4, 'Tignère', 2, NULL, NULL),
(5, 'Mayo-Baléo', 2, NULL, NULL),
(6, 'Banyo', 3, NULL, NULL),
(7, 'Bankim', 3, NULL, NULL),
(8, 'Meiganga', 4, NULL, NULL),
(9, 'Dir', 4, NULL, NULL),
(10, 'Ngaoundal', 5, NULL, NULL),
(11, 'Mbe', 5, NULL, NULL),
(12, 'Nanga-Eboko', 6, NULL, NULL),
(13, 'Nsem', 6, NULL, NULL),
(14, 'Monatélé', 7, NULL, NULL),
(15, 'Elig-Mfomo', 7, NULL, NULL),
(16, 'Evodoula', 7, NULL, NULL),
(17, 'Bafia', 8, NULL, NULL),
(18, 'Deuk', 8, NULL, NULL),
(19, 'Ntui', 9, NULL, NULL),
(20, 'Ombessa', 9, NULL, NULL),
(21, 'Mfou', 10, NULL, NULL),
(22, 'Akono', 10, NULL, NULL),
(23, 'Ngoumou', 11, NULL, NULL),
(24, 'Bikok', 11, NULL, NULL),
(25, 'Yaoundé 1er', 12, NULL, NULL),
(26, 'Yaoundé 2e', 12, NULL, NULL),
(27, 'Yaoundé 3e', 12, NULL, NULL),
(28, 'Yaoundé 4e', 12, NULL, NULL),
(29, 'Yaoundé 5e', 12, NULL, NULL),
(30, 'Yaoundé 6e', 12, NULL, NULL),
(31, 'Yaoundé 7e', 12, NULL, NULL),
(32, 'Eséka', 13, NULL, NULL),
(33, 'Makak', 13, NULL, NULL),
(34, 'Akonolinga', 14, NULL, NULL),
(35, 'Endom', 14, NULL, NULL),
(36, 'Mbalmayo', 15, NULL, NULL),
(37, 'Akok', 15, NULL, NULL),
(38, 'Yokadouma', 16, NULL, NULL),
(39, 'Moloundou', 16, NULL, NULL),
(40, 'Abong-Mbang', 17, NULL, NULL),
(41, 'Messamena', 17, NULL, NULL),
(42, 'Batouri', 18, NULL, NULL),
(43, 'Kette', 18, NULL, NULL),
(44, 'Bertoua', 19, NULL, NULL),
(45, 'Garoua-Boulaï', 19, NULL, NULL),
(46, 'Maroua 1er', 20, NULL, NULL),
(47, 'Maroua 2e', 20, NULL, NULL),
(48, 'Maroua 3e', 20, NULL, NULL),
(49, 'Kousseri', 21, NULL, NULL),
(50, 'Makari', 21, NULL, NULL),
(51, 'Yagoua', 22, NULL, NULL),
(52, 'Maga', 22, NULL, NULL),
(53, 'Guéré', 23, NULL, NULL),
(54, 'Kaélé', 23, NULL, NULL),
(55, 'Mora', 24, NULL, NULL),
(56, 'Kolofata', 24, NULL, NULL),
(57, 'Mokolo', 25, NULL, NULL),
(58, 'Mayo-Moskota', 25, NULL, NULL),
(59, 'Nkongsamba', 26, NULL, NULL),
(60, 'Loum', 26, NULL, NULL),
(61, 'Yabassi', 27, NULL, NULL),
(62, 'Njombe', 27, NULL, NULL),
(63, 'Edea', 28, NULL, NULL),
(64, 'Dizangué', 28, NULL, NULL),
(65, 'Douala 1er', 29, NULL, NULL),
(66, 'Douala 2e', 29, NULL, NULL),
(67, 'Douala 3e', 29, NULL, NULL),
(68, 'Douala 4e', 29, NULL, NULL),
(69, 'Douala 5e', 29, NULL, NULL),
(70, 'Garoua 1er', 30, NULL, NULL),
(71, 'Garoua 2e', 30, NULL, NULL),
(72, 'Poli', 31, NULL, NULL),
(73, 'Beka', 31, NULL, NULL),
(74, 'Figuil', 32, NULL, NULL),
(75, 'Guider', 32, NULL, NULL),
(76, 'Tcholliré', 33, NULL, NULL),
(77, 'Madingring', 33, NULL, NULL),
(78, 'Fundong', 34, NULL, NULL),
(79, 'Belo', 34, NULL, NULL),
(80, 'Kumbo', 35, NULL, NULL),
(81, 'Noni', 35, NULL, NULL),
(82, 'Nkambé', 36, NULL, NULL),
(83, 'Nwa', 36, NULL, NULL),
(84, 'Wum', 37, NULL, NULL),
(85, 'Furu-Awa', 37, NULL, NULL),
(86, 'Bamenda 1er', 38, NULL, NULL),
(87, 'Bamenda 2e', 38, NULL, NULL),
(88, 'Bamenda 3e', 38, NULL, NULL),
(89, 'Mbengwi', 39, NULL, NULL),
(90, 'Batibo', 39, NULL, NULL),
(91, 'Ndop', 40, NULL, NULL),
(92, 'Balikumbat', 40, NULL, NULL),
(93, 'Mbouda', 41, NULL, NULL),
(94, 'Batcham', 41, NULL, NULL),
(95, 'Bafang', 42, NULL, NULL),
(96, 'Kekem', 42, NULL, NULL),
(97, 'Baham', 43, NULL, NULL),
(98, 'Bamendjou', 43, NULL, NULL),
(99, 'Bandjoun', 44, NULL, NULL),
(100, 'Bafang', 44, NULL, NULL),
(101, 'Dschang', 45, NULL, NULL),
(102, 'Fokoué', 45, NULL, NULL),
(103, 'Bafoussam 1er', 46, NULL, NULL),
(104, 'Bafoussam 2e', 46, NULL, NULL),
(105, 'Bangangté', 47, NULL, NULL),
(106, 'Bazou', 47, NULL, NULL),
(107, 'Foumban', 48, NULL, NULL),
(108, 'Foumbot', 48, NULL, NULL),
(109, 'Sangmélima', 49, NULL, NULL),
(110, 'Djoum', 49, NULL, NULL),
(111, 'Ebolowa', 50, NULL, NULL),
(112, 'Mengong', 50, NULL, NULL),
(113, 'Kribi', 51, NULL, NULL),
(114, 'Lolodorf', 51, NULL, NULL),
(115, 'Ambam', 52, NULL, NULL),
(116, 'Ma’an', 52, NULL, NULL),
(117, 'Limbe 1er', 53, NULL, NULL),
(118, 'Limbe 2e', 53, NULL, NULL),
(119, 'Buea', 53, NULL, NULL),
(120, 'Bangem', 54, NULL, NULL),
(121, 'Tombel', 54, NULL, NULL),
(122, 'Menji', 55, NULL, NULL),
(123, 'Alou', 55, NULL, NULL),
(124, 'Mamfe', 56, NULL, NULL),
(125, 'Akwaya', 56, NULL, NULL),
(126, 'Kumba 1er', 57, NULL, NULL),
(127, 'Kumba 2e', 57, NULL, NULL),
(128, 'Mundemba', 58, NULL, NULL),
(129, 'Ekondo-Titi', 58, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `status`, `created_at`, `updated_at`, `image`, `published_at`) VALUES
(1, 'article 1', 'svqsvqsvqmlqcqvqvqqvq', 'failed', '2025-10-02 06:43:19', '2025-10-13 12:29:06', '', NULL),
(2, 'titre 1', 'svss', 'failed', '2025-10-02 07:20:02', '2025-10-13 12:29:01', 'images/1sH5JII5DgoobasISYwIOPVNjakOTS9MGhnOlIJx.jpg', NULL),
(3, 'journée portes ouvertes ', 'bonjour voici', 'failed', '2025-10-02 11:30:57', '2025-10-13 12:29:17', 'images/aEhZRQvWS9EtYBP8R9YNRqTkottyvmAT2vkiOaRl.jpg', NULL),
(4, 'test', 'svsqd', 'failed', '2025-10-13 12:04:23', '2025-10-13 12:29:27', 'images/ql54h0tQkUXMlKQz1hMBbkQpX6R0P0NDr4qJ8XK0.jpg', NULL),
(5, 'sdv', 'sdve', 'failed', '2025-10-13 12:24:15', '2025-10-13 12:29:32', 'images/F1TvM6H2haFrRmpXe4HQ0xxs3ubxl6EH0UU8Ht1f.jpg', NULL),
(6, 'd d', 'd d ', 'failed', '2025-10-13 12:29:46', '2025-10-13 12:34:26', 'http://ism-ndazoa.com/images/1845869764729920.jpg', NULL),
(7, 'test', 'zgzvzsv', 'failed', '2025-10-13 12:34:40', '2025-10-13 12:39:58', 'http://ism-ndazoa.com/images/1845870073846788.jpg', NULL),
(8, ' RENTREE ACADEMIQUE CE JOUR DU 13 OCTOBRE 2025 A LA MAJESTUEUSE', 'Enfin nous y sommes. La rentrée académique à La Majestueuse Ndazoa est effective. Nous avons comme ce sera tous les lundis, exécutez la cérémonie de présentation des couleurs. \nNous vous attendons. \nLes cars et les voitures de liaison sont mis à votre disposition pour votre transport sécurisé.\nLes tenues sont disponibles toutes tailles confondues hommes et femmes.\nLe personnel administratif ainsi que vos professeurs sont à votre écoute .\nSoyez fiers d\'être \" Les Majestueux\".', 'Success', '2025-10-13 13:59:04', '2025-10-13 13:59:28', 'http://ism-ndazoa.com/images/1845875383009203.jpg', NULL),
(9, 'tet', 'fvs s', 'failed', '2025-10-15 08:13:50', '2025-10-15 09:01:00', NULL, '2025-10-15 09:12:00'),
(10, 'test', 'mlmjk', 'pending', '2025-10-15 08:20:35', '2025-10-15 08:20:35', NULL, '2025-10-16 09:20:00'),
(11, 'z;::ss ', 'sc ss ', 'failed', '2025-10-15 08:23:07', '2025-10-15 14:39:56', NULL, '2025-10-18 09:23:00'),
(12, 'test', ':s;s; s', 'failed', '2025-10-15 08:23:50', '2025-10-15 08:43:30', NULL, '2025-10-16 09:23:00'),
(13, 'INSTITUT DE FORMATION PROFESSIONNELLE LA MAJESTUEUSE NDAZOA', '\"Le chemin le plus court vers l\'emploi national et international\"\nL\'IFPM est l\'un des Institut de la Grande Majestueuse et dont les formations sont professionnalisantes concues et adaptées pour vous aprenants, professionnels . \nNous mettons à votre disposition une grille tarifaire de toutes nos formations.\nVous êtes les bienvenus chez nous .\nN\'hésitez pas à nous contacter pour de quelconques préoccupations.\nTél: 237 695 04 50 57', 'pending', '2025-10-15 08:44:09', '2025-10-15 08:44:09', NULL, '2025-10-15 09:43:00'),
(14, 'test', 'test', 'failed', '2025-10-15 08:53:48', '2025-10-15 09:00:44', NULL, '2025-09-15 09:52:00'),
(15, 'IFPM  \"Le chemin le plus court vers l\'emploi national et international\"', 'L\'Institut de Formation Professionnelle la Majestueuse fait partie du grand groupe de l\'Ecole de Métiers La Majestueuse NDAZOA.\nNous avons démarré cette année académique 2025/2026 avec plusieurs formations professionnalisantes .\nUne grille tarifaire de toutes nos formations disponibles est mise à votre disposition et surtout n\'hésitez  pas à revenir vers la Direction de l\'Institut pour toutes autres préoccupations par ce contact: +237 6 95 04 50 57\nSoyez les Bienvenus chez nous chez vous dans un cadre High Tech avec des laboratoires et ateliers super équipés', 'Success', '2025-10-15 10:00:31', '2025-10-15 10:01:10', NULL, '2025-10-10 10:55:00'),
(16, 'ISM \" l\'excellence moderne pour un futur sans frontières\"', 'L\'Institut Universitaire la Majestueuse vous présente un appareil de numération destiné  à la formulation sanguine dans sa filière médicale.\nTous nos étudiants ont 30%  de cours théoriques et 70% de cours pratiques  dans les filières Bio- médicale et Médico-sanitaire.\nAvec un personnel enseignant qualifié , nos étudiants aspirent à l\'excellence dans leur domaine choisi.\nUn hôpital du groupe leur est ouvert pour des stages pratiques; il s\'agit de la Fondation Médicale NKOA FERDINAND possédant un plateau des plus relevés du Cameroun.\nNous vous attendons les retardataires.\n', 'Success', '2025-10-15 10:56:05', '2025-10-15 10:56:28', NULL, '2025-10-15 11:55:00'),
(17, 'FILIERE BIO - MEDICALE ET FILERE MEDICO- SANITAIRE', 'Nos futurs médecins très à l\'aise dans leur laboratoire. Vous avez tous les encouragements du promoteur Les Majestueuses.', 'Success', '2025-10-15 14:50:04', '2025-10-15 14:50:22', NULL, '2025-10-15 15:49:00'),
(18, 'Let\'s talk about Boilermaking and Welding!', 'The HND programme is effective at La Majestueuse NDAZOA.\nHere is part of the \"student kit\" in this specialty.\nThe programme coordinator and the lecturer\'s rigour and commitment will ensure that our students are outstanding engineers upon graduation.\nBilingualism is a reality at La Majestueuse NDAZOA.', 'Success', '2025-10-16 11:55:58', '2025-10-16 11:56:12', NULL, '2025-10-16 12:55:00'),
(19, 'WORKSHOP  UNIFORM', 'Find out about our dress code shop for engineers and technicians in the following table;\n\n* ORANGE UNIFORM + BOOTS+YELLOW TRAINERS : 30.000 frs \n* GREY UNIFORM + BROWN BOOTS: 30.000 frs\n* BLUE UNIFORM + BLACK/BLUE BOOTS : 40.000frs\n\nSPECIALITIES: Welding, plumbing and sanitary, Building Electricity\nIndustrial Electricity, Tiling.\n\n', 'Success', '2025-10-16 15:15:25', '2025-10-16 15:15:39', NULL, '2025-10-16 16:15:00'),
(20, 'HOTELLERIE, RESTAURATION ET TOURISME .', 'Bienvenue à la Majestueuse dans notre département tourisme, hôtellerie et restauration. Il existe plusieurs débouchés dans cette filière qui forme les Grands Chefs étoilés, qui nous font voyager sur le plan culinaire , découvrir le monde ... L\'avantage d\'être parmi nous est bien le fait  que nos étudiants pratiquent directement dans un hôtel quatre étoiles et pas des moindres l\'hôtel DAJOLL situé pas loin du campus la Majestueuse à MBANKOMO. \nLa formation dure 3ans et vous avez plusieurs spécialisations. \nVous avez quelques images d\'une de nos salles de cours au campus.\nNous vous attendons ne perdez plus de temps. \nRentrée prochaine niveau Master 13 Novembre 2025\nA la Majestueuse, Nous développons les talents, nous réalisons vos rêves.', 'Success', '2025-10-28 08:50:08', '2025-10-28 08:50:34', NULL, '2025-10-28 09:49:00'),
(21, '                               AGRONOMIE', 'Qui ne rêve pas d\'être agronome!\n\"La terre ne ment pas\". dixit quelqu\'un.\nA l\'ISM nous avons un cycle d\'ingénieurs agronomes. Les formations sont principalement basées sur :\n- la production animale\n- la production végétale\n- les sciences halieutiques \nLes étudiants passent 3 ans de formation.\nEn 1ère année, ils ont des troncs communs dans les laboratoires avec les étudiants géomètres topographes.\nIls commencent à se familiariser avec le terrain à savoir des stages auprès de CDC, HEVECAM, SOCAPALM, High Land ESTATE ( DAWARA), Ecole d\'Agriculture de BINGUELA, les étangs de POUMA. \nIls touchent du doigt toutes les techniques ( pépinière, ensemencement ). C\'est ce qu\'on appelle Stage monographique c\'est à dire la familiarisation avec l\'environnement, les excursions dans les plantations industrielles etc...\nLe Promoteur a mis à disposition 4 hectares de terrain , un cheptel et surtout du matériel de topographie dernière génération pour nos étudiants.\nNos futurs ingénieurs sont encadrés par des professeurs qualifiés et encadrés par Dr. Edouard YEMELE Ingénieur de topographie, Expert Géomètre, Spécialiste en cartographie numérique.\nNous vous attendons à la Majestueuse parce qu\'il n\'est jamais tard pour vous. \nEn photos Notre chef de département et notre tout premier étudiant parmi les autres de la filière inscrit depuis le mois d\'Août. \n\"Le chemin le plus court vers l\'emploi national et international\"                                          NDAZOA.', 'Success', '2025-10-30 09:06:38', '2025-10-30 09:06:56', NULL, '2025-10-30 10:06:00'),
(22, 'INSTITUT DE FORMATION PROFESSIONNELLE LA MAJESTUEUSE', '\" LE CHEMIN LE PLUS COURT VERS L\'EMPLOI NATIONAL ET INTERNATIONAL\"\nNous avons à NDAZOA un institut de formation professionnelle.\nNous avons eu une somptueuse rentrée avec nos apprenants.\nLes examens débuteront la semaine prochaine c\'est vrai. Mais étant un institut dédié à la formation , chers professionnels, chers apprenants, ne vous retenez plus. A la Majestueuse IFPM nous restons ouverts pour vous.\nTous les kits dont ont besoin les apprenants, sont disponibles à la Majestueuse.\nVous voulez améliorer votre quotidien par un métier sûr, stable et surtout rentable, courrez chez nous chez vous. \nExcellente semaine à tous.\n', 'failed', '2025-11-10 08:11:51', '2025-11-10 08:36:27', NULL, '2025-11-10 09:11:00'),
(23, 'INSITUT DE FORMATION PROFESSIONNELLE LA MAJESTUEUSE', '\" LE CHEMIN LE PLUS COURT VERS L\'EMPLOI NATIONAL ET INTERNATIONAL\"\nNous avons à NDAZOA un institut de formation professionnelle.\nNous avons eu une somptueuse rentrée avec nos apprenants.\nLes examens débuteront la semaine prochaine c\'est vrai. Mais étant un institut dédié à la formation , chers professionnels, chers apprenants, ne vous retenez plus. A la Majestueuse IFPM nous restons ouverts pour vous.\nTous les kits dont ont besoin les apprenants, sont disponibles à la Majestueuse.\nVous voulez améliorer votre quotidien par un métier sûr, stable et surtout rentable, courrez chez nous chez vous. \nExcellente semaine à tous.', 'Success', '2025-11-10 08:35:47', '2025-11-10 08:36:17', NULL, '2025-11-10 09:34:00'),
(24, 'FILIERE INDUSTRIE DE L\'HABILLEMENT ET INDUSTRIE DU TEXTILE', 'Les étudiants de la Majestueuse aiment les \"bonne choses\" constatez par vous mêmes leurs différentes tenues de cours: Eh oui,  Dans la filière industrie de l\'habillement et industrie du textile, le promoteur avec les conseils de la chef de département  ont bien équipé les ateliers dédiés .  Nos étudiants de l\'ISM ainsi que nos apprenants de l\'IFPM sont déjà dans la phase de confection. Bientôt les stages d\'imprégnation chez des couturiers de renom avec qui la Majestueuse est en partenariat vont commencer.\nAprès le cycle BTS, vous pouvez à la Majestueuse continuer en Licence Pro Haute couture et Design de Mode. Le début des cycles Licence et Master commencera le 24 Novembre 2025 de 16 heures à 20 heures.\nAlors pour les professionnels qui souhaiteraient parfaire leur formation, n\'hésitez pas à vous former chez nous . \nNos mannequins en atelier sont habillés par les Majestueux de Ndazoa S\'il Vous Plait.', 'Success', '2025-11-18 08:45:34', '2025-11-18 08:45:57', NULL, '2025-11-18 09:45:00'),
(25, '                                         FILIERE HOTELLERIE, RESTAURATION; TOURISME', 'Notre devise \" Développer les talents, réaliser les rêves\"\nDans la filière hôtellerie restauration et tourisme, cette jeune étudiante Suzanne  a choisi comme option \" génie culinaire\".\nPremiers pas en cuisine, premières recettes réussies. Elle se sent déjà dans la peau d\'un chef avec cette pratique faite au sein même de notre hôtel partenaire DAJOLL Hôtel **** et non des moindres.\nL\'avenir c\'est à la Majestueuse.', 'Success', '2025-12-05 07:36:37', '2025-12-05 07:37:08', NULL, '2025-12-05 08:36:00'),
(26, 'PRESENTATION DE L\'INSTITUT SUPERIEUR LA MAJESTUEUSE', 'N\'hésitez plus chers étudiants. La Majestueuse vous attend. Vous êtes chez vous chez nous.', 'failed', '2026-01-30 07:14:43', '2026-01-30 07:33:18', NULL, '2026-01-30 08:13:00'),
(27, 'LA  MAJESTUEUSE ....', 'Et les Majestueux. La formation en Agronomie de nos étudiants. Sur le terrain à Ndazoa: tronc commun avec  les étudiants de Génie Civil.', 'Success', '2026-01-30 07:41:28', '2026-01-30 07:41:44', NULL, '2026-01-30 08:40:00');

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext NOT NULL,
  `auteur` longtext NOT NULL,
  `status` enum('pending','Success','failed','emprunt') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`id`, `name`, `auteur`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 'livre 1', 'alphonse', 'emprunt', '2025-08-24 05:10:02', '2025-08-24 12:36:44', '445'),
(2, 'alphonse', 'alphonse', 'emprunt', '2025-08-24 05:27:06', '2025-08-24 05:27:06', '5534'),
(3, 'alphonse', 'alphonse', 'emprunt', '2025-08-24 12:35:39', '2025-08-24 12:35:39', 'tttt');

-- --------------------------------------------------------

--
-- Structure de la table `book_users`
--

CREATE TABLE `book_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `return_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('pending','Success','failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `book_users`
--

INSERT INTO `book_users` (`id`, `user_id`, `book_id`, `return_date`, `created_at`, `updated_at`, `status`) VALUES
(1, 5, 2, '2025-08-31', '2025-08-24 05:27:06', '2025-08-24 05:27:06', 'pending'),
(2, 5, 1, '2025-08-31', '2025-08-24 14:35:47', '2025-08-24 12:35:47', 'Success'),
(3, 5, 3, '2025-08-26', '2025-08-24 12:35:39', '2025-08-24 12:35:39', 'pending'),
(4, 5, 1, '2025-09-01', '2025-08-24 12:36:44', '2025-08-24 12:36:44', 'pending');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_0a57cb53ba59c46fc4b692527a38a87c78d84028', 'i:1;', 1770986654),
('laravel_cache_0a57cb53ba59c46fc4b692527a38a87c78d84028:timer', 'i:1770986654;', 1770986654),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1756437389),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1756437388;', 1756437388),
('laravel_cache_77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:1;', 1770957487),
('laravel_cache_77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1770957487;', 1770957487),
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'i:3;', 1756456171),
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4:timer', 'i:1756456171;', 1756456171),
('laravel_cache_admin@gmail.com|127.0.0.1', 'i:1;', 1770986951),
('laravel_cache_admin@gmail.com|127.0.0.1:timer', 'i:1770986951;', 1770986951),
('laravel_cache_admin@gmail.com|185.213.83.19', 'i:1;', 1777506032),
('laravel_cache_admin@gmail.com|185.213.83.19:timer', 'i:1777506032;', 1777506032),
('laravel_cache_alphonsemvele95@gmail.com|127.0.0.1', 'i:1;', 1771329228),
('laravel_cache_alphonsemvele95@gmail.com|127.0.0.1:timer', 'i:1771329228;', 1771329228),
('laravel_cache_alphonsemvele95@gmail.com|143.105.152.102', 'i:1;', 1761833197),
('laravel_cache_alphonsemvele95@gmail.com|143.105.152.102:timer', 'i:1761833197;', 1761833197),
('laravel_cache_alphonsemvele95@ism-ndazoa.com|143.105.152.102', 'i:1;', 1761832937),
('laravel_cache_alphonsemvele95@ism-ndazoa.com|143.105.152.102:timer', 'i:1761832937;', 1761832937),
('laravel_cache_c4ede7c3a306f402baa2b670111981708280fb83', 'i:2;', 1760620407),
('laravel_cache_c4ede7c3a306f402baa2b670111981708280fb83:timer', 'i:1760620407;', 1760620407),
('laravel_cache_chamberlin.mbe@ism-ndazoa.com|102.244.45.84', 'i:1;', 1774368937),
('laravel_cache_chamberlin.mbe@ism-ndazoa.com|102.244.45.84:timer', 'i:1774368937;', 1774368937),
('laravel_cache_christophe.atangana@ism-ndazoa.com|102.215.76.162', 'i:1;', 1776954577),
('laravel_cache_christophe.atangana@ism-ndazoa.com|102.215.76.162:timer', 'i:1776954577;', 1776954577),
('laravel_cache_da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1769758484),
('laravel_cache_da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1769758484;', 1769758484),
('laravel_cache_dora.ebogo@ism-ndazoa.com|143.105.152.4', 'i:1;', 1778504302),
('laravel_cache_dora.ebogo@ism-ndazoa.com|143.105.152.4:timer', 'i:1778504302;', 1778504302),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.174', 'i:1;', 1772533944),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.174:timer', 'i:1772533944;', 1772533944),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.196', 'i:1;', 1764930488),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.196:timer', 'i:1764930488;', 1764930488),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.83', 'i:1;', 1764173551),
('laravel_cache_dora.ebogo@ism-ndozoa.com|143.105.152.83:timer', 'i:1764173551;', 1764173551),
('laravel_cache_ericetoundijournal@yahoo.fr|165.210.39.141', 'i:1;', 1776095418),
('laravel_cache_ericetoundijournal@yahoo.fr|165.210.39.141:timer', 'i:1776095418;', 1776095418),
('laravel_cache_etudiant@ism-ndazoa.com|143.105.152.102', 'i:1;', 1761833088),
('laravel_cache_etudiant@ism-ndazoa.com|143.105.152.102:timer', 'i:1761833088;', 1761833088),
('laravel_cache_filiere@ism-ndazoa.com|143.105.152.102', 'i:1;', 1761833121),
('laravel_cache_filiere@ism-ndazoa.com|143.105.152.102:timer', 'i:1761833121;', 1761833121),
('laravel_cache_info@godwaycharity.com|185.216.143.41', 'i:1;', 1771652987),
('laravel_cache_info@godwaycharity.com|185.216.143.41:timer', 'i:1771652987;', 1771652987),
('laravel_cache_princehilquia79@gmail.com|154.72.167.75', 'i:1;', 1761566917),
('laravel_cache_princehilquia79@gmail.com|154.72.167.75:timer', 'i:1761566917;', 1761566917),
('laravel_cache_specialite@ism-ndazoa.com|143.105.152.102', 'i:1;', 1761833150),
('laravel_cache_specialite@ism-ndazoa.com|143.105.152.102:timer', 'i:1761833150;', 1761833150);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories_rh`
--

CREATE TABLE `categories_rh` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `salaire_base` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories_rh`
--

INSERT INTO `categories_rh` (`id`, `libelle`, `salaire_base`, `description`, `actif`, `created_at`, `updated_at`) VALUES
(1, 'Agent d\'Exécution', 150000.00, 'Catégorie de base', 1, NULL, NULL),
(2, 'Agent de Maîtrise', 250000.00, 'Niveau intermédiaire', 1, NULL, NULL),
(3, 'Cadre', 400000.00, 'Cadre supérieur', 1, NULL, NULL),
(4, 'Cadre de Direction', 650000.00, 'Direction et management', 1, NULL, NULL),
(5, 'test', 350000.00, '', 1, '2026-05-22 06:52:52', '2026-05-22 06:52:52'),
(6, 'test 2', 3000.00, NULL, 1, '2026-05-22 07:15:50', '2026-05-22 07:15:50');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` bigint(20) NOT NULL,
  `menuDay_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hours` time NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `menuDay_id`, `user_id`, `hours`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 6, 5, '11:29:00', 'failed', '2025-08-24 09:29:42', '2025-08-24 09:35:12', 'dkxUuUrc'),
(2, 6, 5, '11:33:00', 'pending', '2025-08-24 09:33:52', '2025-08-24 09:33:52', '3yfa3KPd'),
(3, 6, 5, '14:26:00', 'pending', '2025-08-24 12:26:19', '2025-08-24 12:26:19', '2n1g7hsx');

-- --------------------------------------------------------

--
-- Structure de la table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `configurations`
--

INSERT INTO `configurations` (`id`, `name`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 'filiere', 'Success', '2025-09-04 13:07:07', '2025-09-04 16:57:21', 'Filiere'),
(2, 'specialite', 'Success', '2025-09-04 13:07:22', '2025-09-04 16:57:29', 'Specialite'),
(3, 'cycle', 'Success', '2025-09-04 13:08:02', '2025-09-04 16:57:37', 'Cycle');

-- --------------------------------------------------------

--
-- Structure de la table `configurationsections`
--

CREATE TABLE `configurationsections` (
  `id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `configuration_id` bigint(20) NOT NULL,
  `level` int(11) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `configurationsections`
--

INSERT INTO `configurationsections` (`id`, `section_id`, `configuration_id`, `level`, `status`, `created_at`, `updated_at`) VALUES
(10, 2, 1, 1, 'Success', '2025-09-04 14:06:59', '2025-09-04 14:06:59'),
(11, 2, 2, 2, 'Success', '2025-09-04 14:06:59', '2025-09-04 14:06:59'),
(15, 1, 1, 1, 'Success', '2025-12-03 12:32:51', '2025-12-03 12:32:51'),
(16, 1, 3, 2, 'Success', '2025-12-03 12:32:51', '2025-12-03 12:32:51'),
(17, 1, 2, 3, 'Success', '2025-12-03 12:32:51', '2025-12-03 12:32:51');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `filiere_id` bigint(20) UNSIGNED NOT NULL,
  `specialite_id` bigint(20) NOT NULL,
  `responsable_id` bigint(20) DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NULL DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `cycle_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `formation_type` varchar(255) DEFAULT NULL,
  `hour_number` int(11) DEFAULT NULL,
  `ue_id` bigint(20) NOT NULL,
  `examen_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `name`, `filiere_id`, `specialite_id`, `responsable_id`, `start`, `end`, `credit`, `status`, `created_at`, `updated_at`, `cycle_id`, `code`, `formation_type`, `hour_number`, `ue_id`, `examen_id`) VALUES
(46, 'Analyse mathématique', 1, 1, NULL, '2026-03-06 09:42:32', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:42:32', 1, 'C-OLsfY4', NULL, 45, 1, 1),
(47, 'Algorithmique fondamentale', 1, 1, NULL, '2026-03-06 09:42:42', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:42:42', 1, 'C-E5Fb4o', NULL, 30, 1, 1),
(48, 'Principes fondamentaux de l\'informatique', 1, 1, NULL, '2026-03-06 09:42:46', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:42:46', 1, 'C-9t1MUn', NULL, 30, 2, 1),
(49, 'Applications clés', 1, 1, NULL, '2026-03-06 09:42:50', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:42:50', 1, 'C-WHizRR', NULL, 30, 2, 1),
(50, 'Base de données et SQL', 1, 1, NULL, '2026-03-06 09:43:12', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:43:12', 1, 'C-5CS0wE', NULL, 30, 3, 1),
(51, 'Structure de données avancées', 1, 1, NULL, '2026-03-06 09:42:06', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:42:06', 1, 'C-MeyL40', NULL, 30, 3, 1),
(52, 'Introduction à la programmation WEB', 1, 1, NULL, '2026-03-06 09:45:32', NULL, 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:45:32', 1, 'C-yMNXis', NULL, 75, 5, 1),
(53, 'Introduction aux systèmes d\'information I', 1, 1, NULL, '2026-03-06 09:45:09', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:45:09', 1, 'C-dSLABJ', NULL, 45, 4, 1),
(54, 'Introduction au génie logiciel', 1, 1, NULL, '2026-03-06 10:12:29', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:12:29', 1, 'C-uiYJlh', NULL, 30, 4, 1),
(55, 'Expression française', 1, 1, NULL, '2026-03-06 10:13:13', NULL, 1, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:13:13', 1, 'C-plnrcM', NULL, 15, 7, 1),
(56, 'Expression anglaise', 1, 1, NULL, '2026-03-06 10:13:25', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:13:25', 1, 'C-wib2ZD', NULL, 30, 7, 1),
(57, 'Statistiques descriptives', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 8, 0),
(58, 'Algèbre de Boole', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 8, 0),
(59, 'Systèmes d\'exploitation I', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 9, 0),
(60, 'Programmation Web I', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 9, 0),
(61, 'HTML, CSS, JavaScript', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 10, 0),
(62, 'Introduction aux bases de données', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 11, 0),
(63, 'MERISE', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 11, 0),
(64, 'Référencement SEO/SEA', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 12, 0),
(65, 'Publicité en ligne', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 12, 0),
(66, 'Maintenance matériel & logiciel', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 13, 0),
(67, 'Négociation informatique', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 13, 0),
(68, 'Gestion des petites entreprises', 1, 1, NULL, '2026-03-06 10:15:48', NULL, 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:15:48', 1, 'C-htUhYR', NULL, 60, 6, 1),
(69, 'Probabilités et statistiques', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 15, 0),
(70, 'Analyse numérique', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 15, 0),
(71, 'Recherche opérationnelle', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 16, 0),
(72, 'Plateformes e-commerce', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 17, 0),
(73, 'SQL avancé', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 18, 0),
(74, 'Administration bases de données', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 18, 0),
(75, 'Marketing de contenu', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 19, 0),
(76, 'Réseaux sociaux & Community management', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 19, 0),
(77, 'Réseaux informatiques', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 20, 0),
(78, 'Systèmes d\'exploitation II', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 20, 0),
(79, 'Éducation citoyenne et déontologie professionnelle', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 21, 0),
(80, 'Stratégie marketing digital', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 22, 0),
(81, 'Gestion de projets numériques', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 23, 0),
(82, 'Sécurité des paiements en ligne', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 24, 0),
(83, 'CRM et data marketing', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 25, 0),
(84, 'Ergonomie et expérience utilisateur', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 26, 0),
(85, 'Stage en entreprise', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 27, 0),
(86, 'Entrepreneuriat et marketing', 1, 1, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 28, 0),
(87, 'Analyse mathématique', 2, 2, NULL, '2026-03-06 10:16:45', NULL, 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:16:45', 1, 'C-wfLMra', NULL, 45, 29, 1),
(88, 'Algèbre linéaire', 2, 2, NULL, '2026-03-06 10:17:04', NULL, 1, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:17:04', 1, 'C-bDelLR', NULL, 15, 29, 1),
(89, 'Architecture des ordinateurs', 2, 2, NULL, '2026-03-06 10:17:30', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:17:30', 1, 'C-BGFhZf', NULL, 30, 30, 1),
(90, 'Signaux et Système', 2, 2, NULL, '2026-03-06 10:46:44', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:46:44', 1, 'C-mIOlwz', NULL, 30, 31, 1),
(91, 'Electronique numérique I', 2, 2, NULL, '2026-03-06 11:09:59', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 11:09:59', 1, 'C-l8d6Fc', NULL, 45, 32, 1),
(92, 'Circuits électriques', 2, 2, NULL, '2026-03-06 11:10:29', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 11:10:29', 1, 'C-5AxQHj', NULL, 30, 32, 1),
(93, 'Concepts généraux des réseaux (réseaux NGN)', 2, 2, NULL, '2026-03-06 11:08:57', NULL, 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 11:08:57', 1, 'C-irpdhL', NULL, 75, 34, 1),
(94, 'Français', 2, 2, NULL, '2026-03-06 10:49:48', NULL, 1, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:49:48', 1, 'C-GbxFA1', NULL, 15, 35, 1),
(95, 'Anglais', 2, 2, NULL, '2026-03-06 10:49:58', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:49:58', 1, 'C-386BB5', NULL, 30, 35, 1),
(96, 'Probabilités & statistiques', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 36, 0),
(97, 'Systèmes d\'exploitation I', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 37, 0),
(98, 'Routage & commutation', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 38, 0),
(99, 'Transmission des données', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 39, 0),
(100, 'Programmation réseau', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 40, 0),
(101, 'Maintenance réseaux', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 41, 0),
(102, 'Économie et gestion', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 42, 0),
(103, 'Sécurité des réseaux', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 43, 0),
(104, 'Réseaux WAN & MPLS', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 44, 0),
(105, 'Administration Linux', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 45, 0),
(106, 'Cryptographie & PKI', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 46, 0),
(107, 'Supervision & monitoring', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 47, 0),
(108, 'Virtualisation & Cloud', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 48, 0),
(109, 'Éthique & déontologie', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 49, 0),
(110, 'Sécurité offensive & défensive', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 50, 0),
(111, 'Audit de sécurité', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 51, 0),
(112, 'Administration réseaux avancée', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 52, 0),
(113, 'Sécurité systèmes & serveurs', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 53, 0),
(114, 'Gestion de projets réseaux', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 54, 0),
(115, 'Stage en entreprise', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 55, 0),
(116, 'Entrepreneuriat & innovation', 2, 2, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 56, 0),
(117, 'Esthétique et philosophie de l\'art', 3, 3, NULL, '2026-03-09 23:08:48', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:08:48', 1, 'C-HVseqf', NULL, 30, 151, 1),
(118, 'Introduction à l\'anthropologie de l\'art', 3, 3, NULL, '2026-03-09 23:09:33', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:09:33', 1, 'C-2FZqAB', NULL, 30, 151, 1),
(120, 'Travaux pratiques de confection I', 3, 3, NULL, '2026-03-06 12:22:15', NULL, 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 12:22:15', 1, 'C-zge5bH', NULL, 75, 59, 1),
(121, 'chimie du textile', 3, 3, NULL, '2026-03-09 23:25:57', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:25:57', 1, 'C-YX1lOf', NULL, 45, 60, 1),
(122, 'Démarche créative I', 3, 3, NULL, '2026-03-06 12:25:05', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 12:25:05', 1, 'C-mzaSPO', NULL, 45, 61, 1),
(123, 'Machine de confection ', 3, 3, NULL, '2026-03-06 12:23:16', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 12:23:16', 1, 'C-T8qCNp', NULL, 30, 62, 1),
(125, 'Mathématiques et physique', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 64, 0),
(127, 'Travaux pratiques de confection II', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 66, 0),
(128, 'Machines des textiles et bonneterie', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 67, 0),
(129, 'Ennoblissement I et chimie du textile', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 68, 0),
(130, 'Matériaux textile', 3, 3, NULL, '2026-03-09 23:35:05', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:35:05', 1, 'C-QUNm04', NULL, 30, 60, 1),
(131, 'Économie et gestion des entreprises / Comptabilité générale', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 70, 0),
(132, 'Stylisme modélisme', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 71, 0),
(133, 'Dessin technique et Dessin assisté par ordinateur', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 72, 0),
(134, 'Travaux pratiques de confection III / Communication de mode', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 73, 0),
(135, 'Filature et tissage', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 74, 0),
(136, 'Ennoblissement II', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 75, 0),
(137, 'Dessin mécanique', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 76, 0),
(138, 'Éducation citoyenne et déontologie professionnelle / Droit de la propriété intellectuelle', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 77, 0),
(139, 'Sémiotique des produits de luxe', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 78, 0),
(140, 'Bases de l\'électricité et de l\'électronique industrielles et Automatisme II', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 79, 0),
(141, 'Démarche créative II et modélisme assisté par ordinateur', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 80, 0),
(142, 'Organisation de l\'atelier', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 81, 0),
(143, 'Ennoblissement III', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 82, 0),
(144, 'Stage professionnel et méthodologie de rédaction d\'un rapport de stage', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 83, 0),
(145, 'Entrepreneuriat et Marketing', 3, 3, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 84, 0),
(146, 'Initiation au tourisme', 4, 4, NULL, '2026-03-06 10:15:56', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:15:56', 1, 'C-mP1zuG', NULL, 45, 85, 1),
(147, 'Technique d\'agence de voyage', 4, 4, NULL, '2026-03-06 10:16:14', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:16:14', 1, 'C-Y7cyKp', NULL, 25, 85, 1),
(148, 'Gestion hôtelière', 4, 4, NULL, '2026-03-06 10:16:46', NULL, 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:16:46', 1, 'C-VVmjyE', NULL, 75, 86, 1),
(149, 'Science biologique et appliquée', 4, 4, NULL, '2026-03-06 10:17:19', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:17:19', 1, 'C-VWdwTi', NULL, 30, 87, 1),
(150, 'Sciences appliquées au secteur de la restauration, service alimentaire et hébergement', 4, 4, NULL, '2026-03-06 10:17:42', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:17:42', 1, 'C-UkAQyy', NULL, 45, 87, 1),
(151, 'Technique d\'accueil et d\'hébergement', 4, 4, NULL, '2026-03-06 10:18:19', NULL, 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:18:19', 1, 'C-oBeuj1', NULL, 45, 88, 1),
(152, 'TP hébergement', 4, 4, NULL, '2026-03-06 10:18:34', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:18:34', 1, 'C-GI08Vf', NULL, 30, 88, 1),
(153, 'Informatique et communication professionnel', 4, 4, NULL, '2026-03-06 10:19:14', NULL, 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:19:14', 1, 'C-gaSbNC', NULL, 60, 89, 1),
(154, 'Technologie et méthode culinaire', 4, 4, NULL, '2026-03-06 10:41:37', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:41:37', 1, 'C-FfCeWp', NULL, 30, 90, 1),
(155, 'Technologie appliquée', 4, 4, NULL, '2026-03-06 10:42:48', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:42:48', 1, 'C-2TlppH', NULL, 30, 90, 1),
(156, 'Technique d\'expression française', 4, 4, NULL, '2026-03-06 10:44:01', NULL, 1, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:44:01', 1, 'C-HU3eW8', NULL, 15, 91, 1),
(157, 'Technique d\'expression anglaise', 4, 4, NULL, '2026-03-06 10:44:10', NULL, 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:44:10', 1, 'C-Yh5tQj', NULL, 30, 91, 1),
(158, 'Mathématiques', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 92, 0),
(159, 'Droit et réglementation appliquée', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 93, 0),
(160, 'Économie et gestion hôtelière', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 94, 0),
(161, 'Sciences et technologies culinaires', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 95, 0),
(162, 'Sciences et technologies des services', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 96, 0),
(163, 'Enseignement scientifique alimentation-environnement', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 97, 0),
(164, 'Économie générale', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 98, 0),
(165, 'Économie et organisation des entreprises', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 98, 0),
(166, 'Technologie de service', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 99, 0),
(167, 'Travaux pratiques', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 99, 0),
(169, 'Science appliquée à la restauration I', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 100, 0),
(170, 'Science appliquée à la restauration II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 101, 0),
(171, 'Technologie de service', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 102, 0),
(172, 'Art culinaire', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 103, 0),
(173, 'Diététique alimentaire', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 104, 0),
(174, 'Éducation citoyenne et déontologie professionnelle', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 105, 0),
(175, 'Mathématiques générales I', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 106, 0),
(176, 'Mathématiques générales II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 106, 0),
(177, 'Chimie', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 106, 0),
(178, 'Droit réglementation appliquée', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 107, 0),
(179, 'Mercatique', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 108, 0),
(180, 'Technique de pâtisserie I', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 109, 0),
(181, 'Connaissances et techniques de bar I', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 110, 0),
(182, 'Connaissance des fromages', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 111, 0),
(183, 'Œnologie I', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 111, 0),
(184, 'Stage professionnel', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 112, 0),
(185, 'Économie et gestion des entreprises', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 113, 0),
(186, 'Économie et organisation des entreprises', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 113, 0),
(187, 'Gestion des ressources humaines', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 114, 0),
(188, 'Gestion comptable et financière', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 114, 0),
(189, 'Gestion administrative', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 114, 0),
(190, 'Action et gestion commerciale', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 114, 0),
(191, 'Relations humaines', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 115, 0),
(192, 'Technologie de restaurant II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 116, 0),
(193, 'Techniques d\'hébergement', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 117, 0),
(194, 'Production culinaire', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 118, 0),
(195, 'Service', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 118, 0),
(196, 'Cuisines comparées', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 119, 0),
(197, 'Langues vivantes étrangères 1 (chinois et arabe)', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 120, 0),
(198, 'Économie et enjeux du tourisme', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 121, 0),
(199, 'Médiation culturelle', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 122, 0),
(200, 'Technique de pâtisserie II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 123, 0),
(201, 'Connaissances et techniques de bar II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 124, 0),
(202, 'Connaissance des fromages', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 125, 0),
(203, 'Œnologie II', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 125, 0),
(204, 'Stage professionnel', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 90, 126, 0),
(205, 'Langues vivantes étrangères 2 (chinois et arabe)', 4, 4, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 127, 0),
(206, 'Droit civil I', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 45, 128, 0),
(207, 'Informatique', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 128, 0),
(208, 'Droit commercial I', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 129, 0),
(209, 'Droit et règlementation bancaire I', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 130, 0),
(210, 'Droit des assurances', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 131, 0),
(211, 'Institutions financières et finances publiques', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 132, 0),
(212, 'Droit constitutionnel I', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 133, 0),
(213, 'Droit administratif I', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 133, 0),
(214, 'Techniques d\'expression française', 5, 5, NULL, '2026-03-11 08:50:15', NULL, 1, 'Success', '2026-02-19 10:27:50', '2026-03-11 08:50:15', 1, 'C-Zs6bgA', NULL, 15, 134, 1),
(215, 'Techniques d\'expression anglaise', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 134, 0),
(216, 'Droit civil II', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 135, 0),
(217, 'Droit commercial II', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 136, 0),
(218, 'Droit constitutionnel II', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 137, 0),
(219, 'Droit administratif II', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 137, 0),
(220, 'Droit et réglementation bancaire II', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 75, 138, 0),
(221, 'Droit du commerce international', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 139, 0),
(222, 'Comptabilité générale', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 60, 140, 0),
(223, 'Économie générale', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 15, 141, 0),
(224, 'Économie et organisation des entreprises', 5, 5, NULL, '2026-02-19 10:51:55', NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:51:55', 1, NULL, NULL, 30, 141, 0),
(226, 'initiation à l\'informatique', 2, 2, NULL, '2026-03-06 10:37:27', NULL, 1, 'Success', '2026-03-06 10:36:16', '2026-03-06 10:37:27', NULL, 'C-UcsHrK', NULL, 15, 30, 1),
(227, 'Physique générale', 2, 2, NULL, '2026-03-06 10:45:37', NULL, 2, 'Success', '2026-03-06 10:45:37', '2026-03-06 10:45:37', NULL, 'C-i8sbRM', NULL, 30, 30, 1),
(228, 'Technique de transmission analogique', 2, 2, NULL, '2026-03-06 10:48:48', NULL, 3, 'Success', '2026-03-06 10:48:48', '2026-03-06 10:48:48', NULL, 'C-iDwrnv', NULL, 30, 31, 1),
(229, 'Engineering Mathematics I', 84, 135, NULL, '2026-03-06 11:43:42', NULL, 5, 'Success', '2026-03-06 11:43:42', '2026-03-06 11:43:42', NULL, 'C-XlszRB', NULL, 75, 143, 1),
(231, 'Methods and tooling machines and machine-tools I ', 84, 135, NULL, '2026-03-06 11:46:40', NULL, 4, 'Success', '2026-03-06 11:46:40', '2026-03-06 11:46:40', NULL, 'C-V8JG4f', NULL, 60, 145, 1),
(232, 'Practical work of conventional welding I', 84, 135, NULL, '2026-03-06 11:47:13', NULL, 5, 'Success', '2026-03-06 11:47:13', '2026-03-06 11:47:13', NULL, 'C-i415bc', NULL, 75, 146, 1),
(233, 'Metallic Materials', 84, 135, NULL, '2026-03-06 11:47:52', NULL, 2, 'Success', '2026-03-06 11:47:52', '2026-03-06 11:47:52', NULL, 'C-ymVf5q', NULL, 30, 147, 1),
(235, 'Welding Technology I', 84, 135, NULL, '2026-03-06 11:52:34', NULL, 3, 'Success', '2026-03-06 11:52:34', '2026-03-06 11:52:34', NULL, 'C-seeObk', NULL, 45, 147, 1),
(236, 'Marking Out I', 84, 135, NULL, '2026-03-06 11:53:44', NULL, 4, 'Success', '2026-03-06 11:53:44', '2026-03-06 11:53:44', NULL, 'C-mDshPg', NULL, 60, 148, 1),
(237, 'English', 84, 135, NULL, '2026-03-06 11:54:56', NULL, 2, 'Success', '2026-03-06 11:54:56', '2026-03-06 11:54:56', NULL, 'C-3diMIc', NULL, 22, 149, 1),
(238, 'French', 84, 135, NULL, '2026-03-06 11:55:26', NULL, 2, 'Success', '2026-03-06 11:55:26', '2026-03-06 11:55:26', NULL, 'C-EJFQS9', NULL, 22, 149, 1),
(239, 'Informatique', 3, 3, NULL, '2026-03-09 23:39:03', NULL, 4, 'Success', '2026-03-06 12:20:21', '2026-03-09 23:39:03', NULL, 'C-HzxeuN', NULL, 45, 58, 1),
(240, 'Infographie', 3, 3, NULL, '2026-03-06 12:21:32', NULL, 1, 'Success', '2026-03-06 12:21:32', '2026-03-06 12:21:32', NULL, 'C-3vaQ1A', NULL, 15, 58, 1),
(241, 'Mathématiques générales', 81, 141, NULL, '2026-03-06 12:23:23', NULL, 3, 'Success', '2026-03-06 12:23:23', '2026-03-06 12:23:23', NULL, 'C-KXv2dc', NULL, 45, 150, 1),
(242, 'Informatique générale I ', 81, 141, NULL, '2026-03-06 12:23:54', NULL, 2, 'Success', '2026-03-06 12:23:54', '2026-03-06 12:23:54', NULL, 'C-tvy7iS', NULL, 30, 150, 1),
(243, 'Automatisme I', 3, 3, NULL, '2026-03-06 12:24:01', NULL, 3, 'Success', '2026-03-06 12:24:01', '2026-03-06 12:24:01', NULL, 'C-COeGTb', NULL, 45, 62, 1),
(244, 'Mathématiques financières I', 81, 141, NULL, '2026-03-06 12:25:50', NULL, 2, 'Success', '2026-03-06 12:25:50', '2026-03-06 12:25:50', NULL, 'C-ifNVrO', NULL, 30, 152, 1),
(245, 'Statistiques ', 81, 141, NULL, '2026-03-06 12:26:27', NULL, 2, 'Success', '2026-03-06 12:26:27', '2026-03-06 12:26:27', NULL, 'C-HAa63t', NULL, 30, 152, 1),
(246, 'Comptabilité générale ', 81, 141, NULL, '2026-03-06 12:27:04', NULL, 2, 'Success', '2026-03-06 12:27:04', '2026-03-06 12:27:04', NULL, 'C-GZaxak', NULL, 30, 153, 1),
(247, 'Gestion juridique et fiscale I ', 81, 141, NULL, '2026-03-06 12:27:49', NULL, 2, 'Success', '2026-03-06 12:27:49', '2026-03-06 12:27:49', NULL, 'C-q9zEMI', NULL, 30, 153, 1),
(248, 'Psychologie et dynamique des relations sociales I', 81, 141, NULL, '2026-03-06 12:29:26', NULL, 2, 'Success', '2026-03-06 12:29:26', '2026-03-06 12:29:26', NULL, 'C-Ny5kyu', NULL, 30, 154, 1),
(249, 'Système d’information ressources humaines I', 81, 141, NULL, '2026-03-06 12:30:06', NULL, 3, 'Success', '2026-03-06 12:30:06', '2026-03-06 12:30:06', NULL, 'C-4bs1Jg', NULL, 45, 154, 1),
(250, 'Relations professionnelles internes et externes I ', 81, 141, NULL, '2026-03-06 12:31:09', NULL, 2, 'Success', '2026-03-06 12:31:09', '2026-03-06 12:31:09', NULL, 'C-T1yPyK', NULL, 30, 155, 1),
(251, 'Information I ', 81, 141, NULL, '2026-03-06 12:31:47', NULL, 2, 'Success', '2026-03-06 12:31:47', '2026-03-06 12:31:47', NULL, 'C-kffBTR', NULL, 30, 155, 1),
(252, ' Initiation à la GRH I ', 81, 141, NULL, '2026-03-06 12:32:21', NULL, 2, 'Success', '2026-03-06 12:32:21', '2026-03-06 12:32:21', NULL, 'C-VDgcHW', NULL, 30, 156, 1),
(253, 'La motivation I ', 81, 141, NULL, '2026-03-06 12:33:38', NULL, 3, 'Success', '2026-03-06 12:33:38', '2026-03-06 12:33:38', NULL, 'C-eWzsUm', NULL, 45, 156, 1),
(254, 'Expression française ', 81, 141, NULL, '2026-03-06 12:34:09', NULL, 1, 'Success', '2026-03-06 12:34:09', '2026-03-06 12:34:09', NULL, 'C-oLxHtA', NULL, 15, 157, 1),
(256, 'Techniques d’expression anglaise ', 81, 141, NULL, '2026-03-06 12:35:49', NULL, 2, 'Success', '2026-03-06 12:35:49', '2026-03-06 12:35:49', NULL, 'C-msYIM5', NULL, 30, 157, 1),
(257, 'Techniques d\'expression française', 3, 3, NULL, '2026-03-06 12:36:03', NULL, 1, 'Success', '2026-03-06 12:36:03', '2026-03-06 12:36:03', NULL, 'C-IzO7Ix', NULL, 15, 63, 1),
(258, 'Technique d\'expression anglaise', 3, 3, NULL, '2026-03-06 12:36:41', NULL, 2, 'Success', '2026-03-06 12:36:41', '2026-03-06 12:36:41', NULL, 'C-vcEuDk', NULL, 30, 63, 1),
(259, 'Mathématiques I', 82, 133, NULL, '2026-03-06 12:56:11', NULL, 4, 'Success', '2026-03-06 12:56:11', '2026-03-06 12:56:11', NULL, 'C-mBjx9e', NULL, 60, 158, 1),
(260, 'TIC I', 82, 133, NULL, '2026-03-06 12:56:50', NULL, 5, 'Success', '2026-03-06 12:56:50', '2026-03-06 12:56:50', NULL, 'C-HC7E7A', NULL, 75, 159, 1),
(261, 'Bases en electronique', 82, 133, NULL, '2026-03-06 12:57:40', NULL, 3, 'Success', '2026-03-06 12:57:40', '2026-03-06 12:57:40', NULL, 'C-HrO5Jj', NULL, 45, 160, 1),
(262, 'Mécanique générale I', 82, 133, NULL, '2026-03-06 12:58:34', NULL, 2, 'Success', '2026-03-06 12:58:34', '2026-03-06 12:58:34', NULL, 'C-LI6rP3', NULL, 30, 161, 1),
(263, 'Optique géométrique et ondulatoire', 82, 133, NULL, '2026-03-06 12:59:19', NULL, 2, 'Success', '2026-03-06 12:59:19', '2026-03-06 12:59:19', NULL, 'C-BGKyap', NULL, 3, 161, 1),
(264, 'Electromagnetisme', 82, 133, NULL, '2026-03-06 13:00:03', NULL, 2, 'Success', '2026-03-06 13:00:03', '2026-03-06 13:00:03', NULL, 'C-4kIIsd', NULL, 30, 161, 1),
(265, 'Développement du véhicule automobile', 82, 133, NULL, '2026-03-06 13:00:56', NULL, 2, 'Success', '2026-03-06 13:00:56', '2026-03-06 13:00:56', NULL, 'C-mmEMHY', NULL, 30, 162, 1),
(266, 'Organes de châssis/carrosserie', 82, 133, NULL, '2026-03-06 13:01:42', NULL, 3, 'Success', '2026-03-06 13:01:42', '2026-03-06 13:01:42', NULL, 'C-XBawsd', NULL, 45, 162, 1),
(267, 'Structure et fonctionnements du Groupe Moto Propulseur (GMP)', 82, 133, NULL, '2026-03-06 13:02:54', NULL, 3, 'Success', '2026-03-06 13:02:54', '2026-03-06 13:02:54', NULL, 'C-827pid', NULL, 45, 163, 1),
(268, 'Technique d\'expression française ', 82, 133, NULL, '2026-03-06 13:03:48', NULL, 1, 'Success', '2026-03-06 13:03:48', '2026-03-06 13:03:48', NULL, 'C-ppqDoy', NULL, 15, 164, 1),
(269, 'technique d\'expression anglaise', 82, 133, NULL, '2026-03-06 13:04:27', NULL, 2, 'Success', '2026-03-06 13:04:27', '2026-03-06 13:04:27', NULL, 'C-RVMW3k', NULL, 30, 164, 1),
(270, 'Automatisme', 82, 133, NULL, '2026-03-06 13:05:03', NULL, 2, 'Success', '2026-03-06 13:05:03', '2026-03-06 13:05:03', NULL, 'C-cBFqeS', NULL, 30, 165, 1),
(271, 'Dessin technique II', 82, 133, NULL, '2026-03-06 13:05:48', NULL, 2, 'Success', '2026-03-06 13:05:48', '2026-03-06 13:05:48', NULL, 'C-GIThAM', NULL, 30, 166, 1),
(272, 'Engineer in the Society', 84, 135, NULL, '2026-03-06 13:13:55', NULL, 4, 'Success', '2026-03-06 13:13:55', '2026-03-06 13:13:55', NULL, 'C-ZCwXYp', NULL, 60, 144, 1),
(273, 'Electronique de base I ', 2, 2, NULL, '2026-03-06 23:11:46', NULL, 3, 'Success', '2026-03-06 23:11:46', '2026-03-06 23:11:46', NULL, 'C-ZiAEnF', NULL, 45, 33, 1),
(274, 'Chimie générale', 83, 136, NULL, '2026-03-08 14:27:32', NULL, 2, 'Success', '2026-03-08 14:27:32', '2026-03-08 14:27:32', NULL, 'C-GDOa5S', NULL, 30, 190, 1),
(275, 'Chimie organique', 83, 136, NULL, '2026-03-08 14:28:28', NULL, 1, 'Success', '2026-03-08 14:28:28', '2026-03-08 14:28:28', NULL, 'C-8eDPbB', NULL, 15, 190, 1),
(276, 'Physique générale', 83, 136, NULL, '2026-03-08 14:29:10', NULL, 2, 'Success', '2026-03-08 14:29:10', '2026-03-08 14:29:10', NULL, 'C-kL7h7N', NULL, 30, 190, 1),
(277, 'Electronique', 83, 136, NULL, '2026-03-08 14:30:06', NULL, 4, 'Success', '2026-03-08 14:30:06', '2026-03-08 14:30:06', NULL, 'C-c9oGr1', NULL, 60, 191, 1),
(278, 'Mathématiques', 83, 136, NULL, '2026-03-08 14:31:00', NULL, 3, 'Success', '2026-03-08 14:31:00', '2026-03-08 14:31:00', NULL, 'C-VFtEGy', NULL, 45, 192, 1),
(279, 'Statistiques', 83, 136, NULL, '2026-03-08 14:31:42', NULL, 2, 'Success', '2026-03-08 14:31:42', '2026-03-08 14:31:42', NULL, 'C-hUmwzM', NULL, 30, 192, 1),
(280, 'Anatomie radiologie', 83, 136, NULL, '2026-03-08 14:32:52', NULL, 4, 'Success', '2026-03-08 14:32:52', '2026-03-08 14:32:52', NULL, 'C-AEHD09', NULL, 60, 193, 1),
(281, 'Physiques des radiations de la résonance magnétique des ultrasons et physique nucléaire', 83, 136, NULL, '2026-03-08 14:34:31', NULL, 3, 'Success', '2026-03-08 14:34:31', '2026-03-08 14:34:31', NULL, 'C-2aL9V5', NULL, 45, 194, 1),
(282, 'Anatomie physiologie et générale', 83, 136, NULL, '2026-03-08 14:35:07', NULL, 2, 'Success', '2026-03-08 14:35:07', '2026-03-08 14:35:07', NULL, 'C-sa1qE3', NULL, 30, 194, 1),
(283, 'Biologie ', 83, 136, NULL, '2026-03-10 23:16:04', NULL, 1, 'Success', '2026-03-08 14:35:49', '2026-03-10 23:16:04', NULL, 'C-Ev7gI2', NULL, 15, 195, 1),
(284, 'Microbiologie', 83, 136, NULL, '2026-03-08 14:36:29', NULL, 2, 'Success', '2026-03-08 14:36:20', '2026-03-08 14:36:29', NULL, 'C-uMIjpk', NULL, 30, 195, 1),
(285, 'Méthodes de travail', 83, 136, NULL, '2026-03-08 14:37:25', NULL, 2, 'Success', '2026-03-08 14:37:25', '2026-03-08 14:37:25', NULL, 'C-ZQgzCy', NULL, 30, 196, 1),
(286, 'Techniques de l’information et de la communication 1 (Informatique)', 83, 136, NULL, '2026-03-08 14:38:04', NULL, 1, 'Success', '2026-03-08 14:38:04', '2026-03-08 14:38:04', NULL, 'C-sk5HMO', NULL, 15, 196, 1),
(287, 'Formation bilingue (anglais)', 83, 136, NULL, '2026-03-08 14:38:43', NULL, 1, 'Success', '2026-03-08 14:38:43', '2026-03-08 14:38:43', NULL, 'C-rDQKoi', NULL, 15, 196, 1),
(288, 'Anatomie physiologie 1', 83, 139, NULL, '2026-03-09 07:35:32', NULL, 3, 'Success', '2026-03-09 07:35:32', '2026-03-09 07:35:32', NULL, 'C-91B0CN', NULL, 45, 167, 1),
(289, 'Embryologie', 83, 139, NULL, '2026-03-09 07:37:41', NULL, 1, 'Success', '2026-03-09 07:37:41', '2026-03-09 07:37:41', NULL, 'C-7EdV41', NULL, 15, 167, 1),
(290, 'Biologie de la reproduction', 83, 139, NULL, '2026-03-09 07:38:07', NULL, 1, 'Success', '2026-03-09 07:38:07', '2026-03-09 07:38:07', NULL, 'C-LI6C34', NULL, 15, 167, 1),
(291, 'Biologie cellulaire et histologie', 83, 139, NULL, '2026-03-09 07:38:36', NULL, 1, 'Success', '2026-03-09 07:38:36', '2026-03-09 07:38:36', NULL, 'C-0AJhGa', NULL, 15, 167, 1),
(292, 'Puériculture', 83, 139, NULL, '2026-03-09 07:39:05', NULL, 1, 'Success', '2026-03-09 07:39:05', '2026-03-09 07:39:05', NULL, 'C-St6N0U', NULL, 15, 168, 1),
(293, 'Nutrition', 83, 139, NULL, '2026-03-09 07:40:37', NULL, 1, 'Success', '2026-03-09 07:40:37', '2026-03-09 07:40:37', NULL, 'C-aaH9Kq', NULL, 15, 168, 1),
(294, 'Diététique', 83, 139, NULL, '2026-03-09 07:41:03', NULL, 1, 'Success', '2026-03-09 07:41:03', '2026-03-09 07:41:03', NULL, 'C-JgWIEP', NULL, 15, 168, 1),
(295, 'Histoire de la profession des Sage-femmes', 83, 139, NULL, '2026-03-09 07:41:44', NULL, 1, 'Success', '2026-03-09 07:41:44', '2026-03-09 07:41:44', NULL, 'C-6avhSA', NULL, 15, 169, 1),
(296, 'Éthique et déontologie professionnelle santé', 83, 139, NULL, '2026-03-09 07:44:48', NULL, 1, 'Success', '2026-03-09 07:44:48', '2026-03-09 07:44:48', NULL, 'C-Pmx4WJ', NULL, 15, 169, 1),
(297, 'Soins infirmiers de base', 83, 139, NULL, '2026-03-09 07:45:18', NULL, 4, 'Success', '2026-03-09 07:45:18', '2026-03-09 07:45:18', NULL, 'C-Y9IcPd', NULL, 45, 169, 1),
(298, 'Législation professionnelle', 83, 139, NULL, '2026-03-09 07:45:47', NULL, 1, 'Success', '2026-03-09 07:45:47', '2026-03-09 07:45:47', NULL, 'C-wNOEKQ', NULL, 15, 170, 1),
(299, 'Système national de santé / Politique de santé', 83, 139, NULL, '2026-03-09 07:46:42', NULL, 1, 'Success', '2026-03-09 07:46:42', '2026-03-09 07:46:42', NULL, 'C-K3AcGo', NULL, 15, 170, 1),
(300, 'Microbiologie', 83, 139, NULL, '2026-03-09 11:14:33', NULL, 1, 'Success', '2026-03-09 11:14:33', '2026-03-09 11:14:33', NULL, 'C-MZ3dVU', NULL, 15, 170, 1),
(301, 'Pharmacologie générale', 83, 139, NULL, '2026-03-09 11:15:39', NULL, 1, 'Success', '2026-03-09 11:15:39', '2026-03-09 11:15:39', NULL, 'C-jzyTIq', NULL, 15, 171, 1),
(302, 'Hématologie', 83, 139, NULL, '2026-03-09 11:16:12', NULL, 1, 'Success', '2026-03-09 11:16:12', '2026-03-09 11:16:12', NULL, 'C-lCYTA0', NULL, 15, 171, 1),
(303, 'Pathologie générale', 83, 139, NULL, '2026-03-09 11:16:57', NULL, 4, 'Success', '2026-03-09 11:16:57', '2026-03-09 11:16:57', NULL, 'C-YsRn8b', NULL, 60, 171, 1),
(304, 'Psychologie-sociologie', 83, 139, NULL, '2026-03-09 11:17:34', NULL, 1, 'Success', '2026-03-09 11:17:34', '2026-03-09 11:17:34', NULL, 'C-PG9fxH', NULL, 15, 172, 1),
(305, 'Éducation pour la santé', 83, 139, NULL, '2026-03-09 11:18:01', NULL, 1, 'Success', '2026-03-09 11:18:01', '2026-03-09 11:18:01', NULL, 'C-9OiAt3', NULL, 15, 172, 1),
(306, 'Prévention des infections', 83, 139, NULL, '2026-03-09 11:19:41', NULL, 1, 'Success', '2026-03-09 11:19:41', '2026-03-09 11:19:41', NULL, 'C-Pp2fxS', NULL, 15, 172, 1),
(307, 'Langue officielle 1 (Anglais)', 83, 139, NULL, '2026-03-09 11:21:59', NULL, 1, 'Success', '2026-03-09 11:21:59', '2026-03-09 11:21:59', NULL, 'C-XoIvLW', NULL, 15, 173, 1),
(308, 'Techniques de l’information et de la communication 1 (Informatique)', 83, 139, NULL, '2026-03-09 11:34:31', NULL, 1, 'Success', '2026-03-09 11:34:31', '2026-03-09 11:34:31', NULL, 'C-IZCe0Q', NULL, 15, 173, 1),
(309, 'Méthodes de travail', 83, 139, NULL, '2026-03-09 11:52:49', NULL, 1, 'Success', '2026-03-09 11:52:49', '2026-03-09 11:52:49', NULL, 'C-1voFGp', NULL, 15, 173, 1),
(310, 'Anatomie physiologie 1', 83, 138, NULL, '2026-03-09 11:56:23', NULL, 4, 'Success', '2026-03-09 11:56:23', '2026-03-09 11:56:23', NULL, 'C-feTtK7', NULL, 60, 176, 1),
(311, 'Biologie cellulaire – Histologie', 83, 138, NULL, '2026-03-09 11:56:50', NULL, 1, 'Success', '2026-03-09 11:56:50', '2026-03-09 11:56:50', NULL, 'C-XolSwh', NULL, 15, 176, 1),
(312, 'Chimie générale', 83, 138, NULL, '2026-03-09 11:57:13', NULL, 1, 'Success', '2026-03-09 11:57:13', '2026-03-09 11:57:13', NULL, 'C-tDXpMt', NULL, 15, 176, 1),
(313, 'Microbiologie I : Bactériologie', 83, 138, NULL, '2026-03-09 12:01:07', NULL, 1, 'Success', '2026-03-09 12:01:07', '2026-03-09 12:01:07', NULL, 'C-4KNwV0', NULL, 15, 177, 1),
(314, 'Parasitologie', 83, 138, NULL, '2026-03-09 12:01:30', NULL, 1, 'Success', '2026-03-09 12:01:30', '2026-03-09 12:01:30', NULL, 'C-ek9xjn', NULL, 15, 177, 1),
(315, 'Biochimie', 83, 138, NULL, '2026-03-09 12:04:41', NULL, 1, 'Success', '2026-03-09 12:04:41', '2026-03-09 12:04:41', NULL, 'C-SDsjU1', NULL, 15, 177, 1),
(316, 'Sociologie – anthropologie et psychologie médicale', 83, 138, NULL, '2026-03-09 12:05:13', NULL, 6, 'Success', '2026-03-09 12:05:13', '2026-03-09 12:05:13', NULL, 'C-PsueCm', NULL, 90, 178, 1),
(317, 'Fondement de la science infirmière I : concepts et théories en sciences infirmières', 83, 138, NULL, '2026-03-09 12:05:44', NULL, 2, 'Success', '2026-03-09 12:05:44', '2026-03-09 12:05:44', NULL, 'C-64LudG', NULL, 30, 179, 1),
(318, 'Histoire de la profession infirmière', 83, 138, NULL, '2026-03-09 12:06:23', NULL, 1, 'Success', '2026-03-09 12:06:23', '2026-03-09 12:06:23', NULL, 'C-stAStR', NULL, 15, 180, 1),
(319, 'Cycle de vie', 83, 138, NULL, '2026-03-09 12:06:54', NULL, 2, 'Success', '2026-03-09 12:06:54', '2026-03-09 12:06:54', NULL, 'C-vWB9wl', NULL, 30, 180, 1),
(320, 'Stage clinique I', 83, 138, NULL, '2026-03-09 12:07:30', NULL, 6, 'Success', '2026-03-09 12:07:30', '2026-03-09 12:07:30', NULL, 'C-hANLgn', NULL, 900, 181, 1),
(321, 'Anglais médical', 83, 138, NULL, '2026-03-09 12:07:58', NULL, 1, 'Success', '2026-03-09 12:07:58', '2026-03-09 12:07:58', NULL, 'C-poZvk9', NULL, 15, 182, 1),
(322, 'Techniques de l’information et de la communication 1 (Informatique', 83, 138, NULL, '2026-03-09 12:08:33', NULL, 1, 'Success', '2026-03-09 12:08:33', '2026-03-09 12:08:33', NULL, 'C-PoHl7E', NULL, 15, 182, 1),
(323, 'Français', 83, 138, NULL, '2026-03-09 12:08:56', NULL, 1, 'Success', '2026-03-09 12:08:56', '2026-03-09 12:08:56', NULL, 'C-vADsHB', NULL, 15, 182, 1),
(324, 'Anatomie physiologie 1', 83, 137, NULL, '2026-03-09 12:15:45', NULL, 5, 'Success', '2026-03-09 12:15:45', '2026-03-09 12:15:45', NULL, 'C-K1ABIN', NULL, 75, 183, 1),
(325, 'Biologie cellulaire – Histologie', 83, 137, NULL, '2026-03-09 13:10:08', NULL, 2, 'Success', '2026-03-09 13:10:08', '2026-03-09 13:10:08', NULL, 'C-gKG48h', NULL, 30, 183, 1),
(326, 'Neurophysiologie - Kinésiologie', 83, 137, NULL, '2026-03-09 13:11:05', NULL, 1, 'Success', '2026-03-09 13:11:05', '2026-03-09 13:11:05', NULL, 'C-vuSnUR', NULL, 15, 184, 1),
(327, 'Chimie générale', 83, 137, NULL, '2026-03-09 13:11:30', NULL, 1, 'Success', '2026-03-09 13:11:30', '2026-03-09 13:11:30', NULL, 'C-QsLqGt', NULL, 15, 184, 1),
(328, 'Psychologie', 83, 137, NULL, '2026-03-09 13:12:02', NULL, 1, 'Success', '2026-03-09 13:12:02', '2026-03-09 13:12:02', NULL, 'C-A6RVmG', NULL, 15, 185, 1),
(329, 'Sociologie – anthropologie', 83, 137, NULL, '2026-03-09 13:12:42', NULL, 2, 'Success', '2026-03-09 13:12:42', '2026-03-09 13:12:42', NULL, 'C-x5rADb', NULL, 30, 185, 1),
(330, 'Histoire de la Kinésithérapie', 83, 137, NULL, '2026-03-09 13:13:15', NULL, 1, 'Success', '2026-03-09 13:13:15', '2026-03-09 13:13:15', NULL, 'C-ygyGO4', NULL, 15, 185, 1),
(331, 'Dessin technique I', 82, 133, NULL, '2026-03-09 13:18:30', NULL, 2, 'Success', '2026-03-09 13:18:30', '2026-03-09 13:18:30', NULL, 'C-B6b2o3', NULL, 30, 197, 1),
(332, 'Méthodologie générale de la Kinésithérapie et de la réadaptation I', 83, 137, NULL, '2026-03-09 13:18:50', NULL, 5, 'Success', '2026-03-09 13:18:50', '2026-03-09 13:18:50', NULL, 'C-e27oWf', NULL, 75, 186, 1),
(333, 'Maladies infectieuses et parasitaires', 83, 137, NULL, '2026-03-09 13:30:12', NULL, 5, 'Success', '2026-03-09 13:30:12', '2026-03-09 13:30:12', NULL, 'C-bT0sod', NULL, 75, 187, 1),
(334, 'Activités motrices et adaptation y compris la psychomotricité', 83, 137, NULL, '2026-03-09 13:30:50', NULL, 2, 'Success', '2026-03-09 13:30:50', '2026-03-09 13:30:50', NULL, 'C-wW446E', NULL, 30, 188, 1),
(335, 'Éthique et déontologie professionnelle', 83, 137, NULL, '2026-03-09 13:32:29', NULL, 2, 'Success', '2026-03-09 13:32:29', '2026-03-09 13:32:29', NULL, 'C-qfHJDN', NULL, 30, 188, 1),
(336, 'Anglais médical', 83, 137, NULL, '2026-03-09 13:39:10', NULL, 1, 'Success', '2026-03-09 13:39:10', '2026-03-09 13:39:10', NULL, 'C-pWwvGt', NULL, 15, 189, 1),
(337, 'Techniques de l’information et de la communication 1 (Informatique)', 83, 137, NULL, '2026-03-09 13:53:35', NULL, 1, 'Success', '2026-03-09 13:53:35', '2026-03-09 13:53:35', NULL, 'C-g6yiho', NULL, 15, 189, 1),
(338, 'Français médical', 83, 137, NULL, '2026-03-09 13:54:06', NULL, 1, 'Success', '2026-03-09 13:54:06', '2026-03-09 13:54:06', NULL, 'C-QqRvHo', NULL, 15, 189, 1),
(339, 'Biochimie', 83, 136, NULL, '2026-03-10 23:16:34', NULL, 1, 'Success', '2026-03-10 23:16:34', '2026-03-10 23:16:34', NULL, 'C-vUV8Bi', NULL, 15, 195, 1),
(340, 'Analyse', 77, 131, NULL, '2026-03-11 06:05:00', NULL, 3, 'Success', '2026-03-11 06:05:00', '2026-03-11 06:05:00', NULL, 'C-ktd71r', NULL, 45, 198, 1),
(341, 'Algèbre générale', 77, 131, NULL, '2026-03-11 06:05:39', NULL, 3, 'Success', '2026-03-11 06:05:39', '2026-03-11 06:05:39', NULL, 'C-OqxDpA', NULL, 45, 198, 1),
(342, 'Mécanique du point', 77, 131, NULL, '2026-03-11 06:06:24', NULL, 2, 'Success', '2026-03-11 06:06:24', '2026-03-11 06:06:24', NULL, 'C-H06pAL', NULL, 30, 199, 1),
(343, 'Mécanique du solide', 77, 131, NULL, '2026-03-11 06:07:03', NULL, 2, 'Success', '2026-03-11 06:07:03', '2026-03-11 06:07:03', NULL, 'C-u91TYA', NULL, 30, 199, 1),
(344, 'Acoustique', 77, 131, NULL, '2026-03-11 06:07:36', NULL, 2, 'Success', '2026-03-11 06:07:36', '2026-03-11 06:07:36', NULL, 'C-MdKd5K', NULL, 30, 199, 1),
(345, 'Chimie générale', 77, 131, NULL, '2026-03-11 06:08:15', NULL, 3, 'Success', '2026-03-11 06:08:15', '2026-03-11 06:08:15', NULL, 'C-2Rqs7N', NULL, 45, 200, 1);
INSERT INTO `cours` (`id`, `name`, `filiere_id`, `specialite_id`, `responsable_id`, `start`, `end`, `credit`, `status`, `created_at`, `updated_at`, `cycle_id`, `code`, `formation_type`, `hour_number`, `ue_id`, `examen_id`) VALUES
(346, 'Biochimie', 77, 131, NULL, '2026-03-11 06:08:45', NULL, 3, 'Success', '2026-03-11 06:08:45', '2026-03-11 06:08:45', NULL, 'C-V2Mk7s', NULL, 45, 200, 1),
(347, 'Géologie', 77, 131, NULL, '2026-03-11 06:09:17', NULL, 3, 'Success', '2026-03-11 06:09:17', '2026-03-11 06:09:17', NULL, 'C-DpOjW2', NULL, 45, 200, 1),
(348, 'Biologie générale', 77, 131, NULL, '2026-03-11 06:10:31', NULL, 3, 'Success', '2026-03-11 06:10:31', '2026-03-11 06:10:31', NULL, 'C-rjMPKI', NULL, 45, 201, 1),
(349, 'Education à la citoyenneté', 77, 131, NULL, '2026-03-11 06:11:16', NULL, 2, 'Success', '2026-03-11 06:11:16', '2026-03-11 06:11:16', NULL, 'C-oivlQP', NULL, 30, 202, 1),
(350, 'Sport et éducation physique', 77, 131, NULL, '2026-03-11 06:11:57', NULL, 1, 'Success', '2026-03-11 06:11:57', '2026-03-11 06:11:57', NULL, 'C-laFW7T', NULL, 15, 202, 1),
(351, 'Formation bilingue', 77, 131, NULL, '2026-03-11 06:13:40', NULL, 2, 'Success', '2026-03-11 06:12:33', '2026-03-11 06:13:40', NULL, 'C-9hFHSz', NULL, 30, 203, 1),
(352, 'Pratiques professionnelles 1', 77, 131, NULL, '2026-03-11 06:13:21', NULL, 1, 'Success', '2026-03-11 06:13:21', '2026-03-11 06:13:21', NULL, 'C-MsDYPj', NULL, 15, 203, 1),
(353, 'Droit du travail et de la prévoyance ', 92, 143, NULL, '2026-03-11 19:53:06', NULL, 3, 'Success', '2026-03-11 19:53:06', '2026-03-11 19:53:06', NULL, 'C-gw0yNm', NULL, 45, 204, 4),
(354, 'Economie du travail et politique RH ', 92, 143, NULL, '2026-03-11 19:53:38', NULL, 2, 'Success', '2026-03-11 19:53:38', '2026-03-11 19:53:38', NULL, 'C-62bXPv', NULL, 30, 204, 4),
(355, 'Relations Humaines et Sociales ', 92, 143, NULL, '2026-03-11 19:54:20', NULL, 2, 'Success', '2026-03-11 19:54:20', '2026-03-11 19:54:20', NULL, 'C-0Xy42L', NULL, 30, 204, 4),
(356, 'Recrutement et Gestion Administrative ', 92, 143, NULL, '2026-03-11 19:54:57', NULL, 2, 'Success', '2026-03-11 19:54:57', '2026-03-11 19:54:57', NULL, 'C-Ll1dj1', NULL, 30, 205, 4),
(357, 'Psychologie du travail et des organisations ', 92, 143, NULL, '2026-03-11 19:55:24', NULL, 2, 'Success', '2026-03-11 19:55:24', '2026-03-11 19:55:24', NULL, 'C-v5Chli', NULL, 30, 205, 4),
(358, 'Statistiques appliquée aux RH ', 92, 143, NULL, '2026-03-11 19:56:02', NULL, 3, 'Success', '2026-03-11 19:56:02', '2026-03-11 19:56:02', NULL, 'C-URebp8', NULL, 45, 205, 4),
(359, 'Politique de Rémunération et Gestion de la Paie', 92, 143, NULL, '2026-03-11 19:59:36', NULL, 4, 'Success', '2026-03-11 19:59:36', '2026-03-11 19:59:36', NULL, 'C-rCjdFz', NULL, 60, 206, 4),
(360, 'Gestion de la Formation et Gestion Prévisionnelle des emplois ', 92, 143, NULL, '2026-03-11 20:00:40', NULL, 3, 'Success', '2026-03-11 20:00:40', '2026-03-11 20:00:40', NULL, 'C-XK88Sc', NULL, 45, 206, 4),
(361, 'Système d’évaluation des RH ', 92, 143, NULL, '2026-03-11 20:01:13', NULL, 2, 'Success', '2026-03-11 20:01:13', '2026-03-11 20:01:13', NULL, 'C-cNoBpZ', NULL, 30, 206, 4),
(362, 'Informatiques appliquée aux RH ', 92, 143, NULL, '2026-03-11 20:02:43', NULL, 3, 'Success', '2026-03-11 20:02:43', '2026-03-11 20:02:43', NULL, 'C-ky9bG3', NULL, 45, 207, 4),
(363, 'Audit social et contrôle de gestion RH ', 92, 143, NULL, '2026-03-11 20:03:11', NULL, 2, 'Success', '2026-03-11 20:03:11', '2026-03-11 20:03:11', NULL, 'C-RWrO7k', NULL, 30, 207, 4),
(364, 'Structure organisationnelle et fonctionnement de l’entreprise ', 92, 143, NULL, '2026-03-11 20:03:41', NULL, 2, 'Success', '2026-03-11 20:03:41', '2026-03-11 20:03:41', NULL, 'C-QY2zLV', NULL, 30, 207, 4),
(365, 'Advance taxation', 91, 142, NULL, '2026-03-11 23:39:02', NULL, 6, 'Success', '2026-03-11 23:39:02', '2026-03-11 23:39:02', NULL, 'C-MIOVou', NULL, 24, 208, 3),
(366, 'Advanced ohada financial accounting ', 91, 142, NULL, '2026-03-11 23:40:40', NULL, 6, 'Success', '2026-03-11 23:40:40', '2026-03-11 23:40:40', NULL, 'C-laFVeW', NULL, 24, 209, 3),
(367, 'Internal auditing and corperate governance', 91, 142, NULL, '2026-03-11 23:41:16', NULL, 6, 'Success', '2026-03-11 23:41:16', '2026-03-11 23:41:16', NULL, 'C-Qe3pAE', NULL, 24, 210, 3),
(368, 'Advanced researsh methodology', 91, 142, NULL, '2026-03-11 23:52:29', NULL, 6, 'Success', '2026-03-11 23:52:29', '2026-03-11 23:52:29', NULL, 'C-ibyOL7', NULL, 24, 211, 3),
(369, 'Advanced management accounting and control', 91, 142, NULL, '2026-03-12 10:42:26', NULL, 6, 'Success', '2026-03-12 10:42:26', '2026-03-12 10:42:26', NULL, 'C-xg2tZM', NULL, 24, 212, 3),
(370, 'Promotion of social andassociative leisure', 91, 142, NULL, '2026-03-12 10:43:02', NULL, 6, 'Success', '2026-03-12 10:43:02', '2026-03-12 10:43:02', NULL, 'C-es0XtX', NULL, 24, 213, 3),
(371, 'Accounting for specuific organisation ', 91, 142, NULL, '2026-03-12 10:43:32', NULL, 6, 'Success', '2026-03-12 10:43:32', '2026-03-12 10:43:32', NULL, 'C-mscXRm', NULL, 24, 214, 3),
(372, 'Advanced cost accounting ', 91, 142, NULL, '2026-03-12 10:44:09', NULL, 6, 'Success', '2026-03-12 10:44:09', '2026-03-12 10:44:09', NULL, 'C-w7zKys', NULL, 24, 215, 3),
(373, 'Advanced quantitative analysis ', 91, 142, NULL, '2026-03-12 10:44:39', NULL, 6, 'Success', '2026-03-12 10:44:39', '2026-03-12 10:44:39', NULL, 'C-Ueg08F', NULL, 24, 216, 3),
(374, 'Computer aided accounting', 91, 142, NULL, '2026-03-12 10:45:09', NULL, 6, 'Success', '2026-03-12 10:45:09', '2026-03-12 10:45:09', NULL, 'C-kDUMCl', NULL, 24, 217, 3),
(375, 'Principles of accounting', 91, 142, NULL, '2026-03-12 10:55:53', NULL, 6, 'Success', '2026-03-12 10:55:53', '2026-03-12 10:55:53', NULL, 'C-OZ6n6s', NULL, 24, 218, 3),
(376, 'Assurance qualité/contrôle qualité au laboratoire', 90, 144, NULL, '2026-03-13 08:42:25', NULL, 0, 'Success', '2026-03-13 08:42:25', '2026-03-13 08:42:25', NULL, 'C-oGZzHN', NULL, 24, 219, 3),
(377, 'Gestion de laboratoire/organisation d’un laboratoire hospitalier', 90, 144, NULL, '2026-03-13 08:47:18', NULL, 0, 'Success', '2026-03-13 08:47:18', '2026-03-13 08:47:18', NULL, 'C-xJSNzb', NULL, 24, 219, 3),
(378, 'Ethique en santé', 90, 144, NULL, '2026-03-13 08:47:40', NULL, 0, 'Success', '2026-03-13 08:47:40', '2026-03-13 08:47:40', NULL, 'C-Fxep1n', NULL, 24, 219, 3),
(379, 'Epidémiologie', 90, 144, NULL, '2026-03-15 05:25:04', NULL, 0, 'Success', '2026-03-15 05:25:04', '2026-03-15 05:25:04', NULL, 'C-PxO2QJ', NULL, 24, 220, 3),
(380, 'Organisation du système de santé', 90, 144, NULL, '2026-03-15 05:25:28', NULL, 0, 'Success', '2026-03-15 05:25:28', '2026-03-15 05:25:28', NULL, 'C-TmP9GX', NULL, 24, 220, 3),
(381, 'Les programmes de santé prioritaire au Cameroun', 90, 144, NULL, '2026-03-15 05:25:49', NULL, 0, 'Success', '2026-03-15 05:25:49', '2026-03-15 05:25:49', NULL, 'C-C3ZsKi', NULL, 24, 220, 3),
(382, 'Système d’information sanitaire', 90, 144, NULL, '2026-03-15 05:27:29', NULL, 0, 'Success', '2026-03-15 05:27:29', '2026-03-15 05:27:29', NULL, 'C-kf6SVn', NULL, 24, 221, 3),
(383, 'Santé et population', 90, 144, NULL, '2026-03-15 05:27:59', NULL, 0, 'Success', '2026-03-15 05:27:59', '2026-03-15 05:27:59', NULL, 'C-tIqYWO', NULL, 24, 221, 3),
(384, 'Economie de la santé', 90, 144, NULL, '2026-03-15 05:28:46', NULL, 0, 'Success', '2026-03-15 05:28:46', '2026-03-15 05:28:46', NULL, 'C-k3Fi52', NULL, 24, 222, 3),
(385, 'Notion de biostatistiques', 90, 144, NULL, '2026-03-15 05:29:18', NULL, 0, 'Success', '2026-03-15 05:29:18', '2026-03-15 05:29:18', NULL, 'C-O4iZsy', NULL, 24, 222, 3),
(386, 'Les grandes endémies', 90, 144, NULL, '2026-03-15 05:29:44', NULL, 0, 'Success', '2026-03-15 05:29:44', '2026-03-15 05:29:44', NULL, 'C-MFSkus', NULL, 24, 222, 3),
(387, 'Communication en santé', 90, 144, NULL, '2026-03-15 05:30:42', NULL, 0, 'Success', '2026-03-15 05:30:42', '2026-03-15 05:30:42', NULL, 'C-L8FtQp', NULL, 24, 223, 3),
(388, 'Gestion des systèmes de santé', 90, 144, NULL, '2026-03-15 05:31:16', NULL, 0, 'Success', '2026-03-15 05:31:16', '2026-03-15 05:31:16', NULL, 'C-B8dEmF', NULL, 24, 223, 3),
(391, 'Nouvelles technologies', 93, 145, NULL, '2026-03-16 12:54:40', NULL, 3, 'Success', '2026-03-16 12:54:40', '2026-03-16 12:54:40', NULL, 'C-zoQN1p', NULL, 45, 225, 3),
(392, 'Calcul d’erreurs', 93, 145, NULL, '2026-03-16 12:56:12', NULL, 3, 'Success', '2026-03-16 12:56:12', '2026-03-16 12:56:12', NULL, 'C-bzeVNe', NULL, 45, 225, 3),
(393, 'Système d’information géographique', 93, 145, NULL, '2026-03-16 13:00:49', NULL, 3, 'Success', '2026-03-16 13:00:49', '2026-03-16 13:00:49', NULL, 'C-gsCvQd', NULL, 45, 226, 3),
(394, 'Géodésie 2', 93, 145, NULL, '2026-03-16 13:01:25', NULL, 3, 'Success', '2026-03-16 13:01:25', '2026-03-16 13:01:25', NULL, 'C-nIOooI', NULL, 45, 226, 3),
(395, 'Photogrammétrie/MNT3', 93, 145, NULL, '2026-03-16 13:01:54', NULL, 3, 'Success', '2026-03-16 13:01:54', '2026-03-16 13:01:54', NULL, 'C-89evBT', NULL, 45, 227, 3),
(396, 'Télédétection 1', 93, 145, NULL, '2026-03-16 13:02:27', NULL, 3, 'Success', '2026-03-16 13:02:27', '2026-03-16 13:02:27', NULL, 'C-O3cWpt', NULL, 45, 227, 3),
(397, 'Droit de l’urbanisme', 93, 145, NULL, '2026-03-16 13:03:15', NULL, 1, 'Success', '2026-03-16 13:03:15', '2026-03-16 13:03:15', NULL, 'C-EoylsH', NULL, 15, 228, 3),
(398, 'Droit foncier 2 ', 93, 145, NULL, '2026-03-16 13:03:37', NULL, 1, 'Success', '2026-03-16 13:03:37', '2026-03-16 13:03:37', NULL, 'C-aUyaNA', NULL, 15, 228, 3),
(399, 'Droit général 2', 93, 145, NULL, '2026-03-16 13:05:32', NULL, 1, 'Success', '2026-03-16 13:05:32', '2026-03-16 13:05:32', NULL, 'C-TK7Xh7', NULL, 15, 228, 3),
(400, 'Stage', 90, 144, NULL, '2026-03-16 14:08:55', NULL, 2, 'Success', '2026-03-16 14:08:55', '2026-03-16 14:08:55', NULL, 'C-sUFiEr', NULL, 160, 229, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cycles`
--

CREATE TABLE `cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `institution` enum('ISM','IFPM') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cycles`
--

INSERT INTO `cycles` (`id`, `name`, `institution`, `created_at`, `updated_at`, `status`) VALUES
(1, 'BTS', 'ISM', NULL, NULL, 'Success'),
(2, 'Licence', 'ISM', NULL, '2026-02-26 14:36:38', 'Success'),
(3, 'Master', 'ISM', NULL, '2026-02-26 14:36:41', 'Success');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `responsable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cycle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `nom`, `code`, `description`, `responsable_id`, `status`, `created_at`, `updated_at`, `cycle_id`) VALUES
(1, 'Informatique, Réseaux et télécommunications', NULL, NULL, 10, 'Success', '2026-02-19 10:27:50', '2026-03-06 23:02:35', 1),
(2, 'Industrie de l\'Habillement', NULL, NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-23 09:14:52', 1),
(3, 'Tourisme, Hôtellerie et Restauration', NULL, NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-23 09:14:55', 1),
(4, 'Droit', NULL, NULL, NULL, 'Success', '2026-02-19 10:27:50', '2026-02-23 09:14:57', 1),
(49, 'Génie de l’Environnement et des Infrastructures', 'DEP-E642CY', '', 71, 'Success', '2026-02-26 14:39:28', '2026-03-02 10:09:39', 2),
(50, 'Gestion', 'DEP-C3VJCR', '', 24, 'Success', '2026-03-02 09:56:23', '2026-03-04 22:56:10', 1),
(51, 'Génie mécanique & Productique', 'DEP-VQOFXZ', '', 11, 'Success', '2026-03-02 10:05:00', '2026-03-02 10:05:00', 1),
(52, 'Sciences de la santé', 'DEP-Z7G9YO', '', 20, 'Success', '2026-03-04 21:25:48', '2026-03-04 22:09:33', 1),
(53, 'Mechanical Engineering & production', 'DEP-JQVY2Z', '', 17, 'Success', '2026-03-04 21:32:13', '2026-03-06 13:17:58', 1),
(56, 'Agronomie', 'DEP-STW5XG', '', 25, 'failed', '2026-03-09 13:27:52', '2026-03-09 14:36:18', 2),
(57, 'Business and management sciences', 'DEP-2ISNOU', '', 17, 'Success', '2026-03-09 15:33:36', '2026-03-09 15:33:36', 3),
(59, 'Sciences de la santé', 'DEP-HXPWXD', '', 20, 'Success', '2026-03-10 16:23:26', '2026-03-10 16:23:26', 3),
(60, 'Gestion', 'DEP-7FJZCW', '', 24, 'failed', '2026-03-10 19:17:31', '2026-03-10 20:03:04', 3),
(61, 'Génie de l’Environnement et des Infrastructures', 'DEP-WDXJZO', '', 71, 'Success', '2026-03-10 19:32:36', '2026-03-10 19:32:36', 3),
(62, 'Gestion', 'DEP-WQUC0Y', '', 24, 'Success', '2026-03-10 20:03:18', '2026-03-10 20:03:18', 2);

-- --------------------------------------------------------

--
-- Structure de la table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departments`
--

INSERT INTO `departments` (`id`, `name`, `region_id`, `created_at`, `updated_at`) VALUES
(1, 'Djerem', 1, NULL, NULL),
(2, 'Faro-et-Déo', 1, NULL, NULL),
(3, 'Mayo-Banyo', 1, NULL, NULL),
(4, 'Mbéré', 1, NULL, NULL),
(5, 'Vina', 1, NULL, NULL),
(6, 'Haute-Sanaga', 2, NULL, NULL),
(7, 'Lekié', 2, NULL, NULL),
(8, 'Mbam-et-Inoubou', 2, NULL, NULL),
(9, 'Mbam-et-Kim', 2, NULL, NULL),
(10, 'Méfou-et-Afamba', 2, NULL, NULL),
(11, 'Méfou-et-Akono', 2, NULL, NULL),
(12, 'Mfoundi', 2, NULL, NULL),
(13, 'Nyong-et-Kéllé', 2, NULL, NULL),
(14, 'Nyong-et-Mfoumou', 2, NULL, NULL),
(15, 'Nyong-et-So\'o', 2, NULL, NULL),
(16, 'Boumba-et-Ngoko', 3, NULL, NULL),
(17, 'Haut-Nyong', 3, NULL, NULL),
(18, 'Kadey', 3, NULL, NULL),
(19, 'Lom-et-Djerem', 3, NULL, NULL),
(20, 'Diamaré', 4, NULL, NULL),
(21, 'Logone-et-Chari', 4, NULL, NULL),
(22, 'Mayo-Danay', 4, NULL, NULL),
(23, 'Mayo-Kani', 4, NULL, NULL),
(24, 'Mayo-Sava', 4, NULL, NULL),
(25, 'Mayo-Tsanaga', 4, NULL, NULL),
(26, 'Moungo', 5, NULL, NULL),
(27, 'Nkam', 5, NULL, NULL),
(28, 'Sanaga-Maritime', 5, NULL, NULL),
(29, 'Wouri', 5, NULL, NULL),
(30, 'Bénoué', 6, NULL, NULL),
(31, 'Faro', 6, NULL, NULL),
(32, 'Mayo-Louti', 6, NULL, NULL),
(33, 'Mayo-Rey', 6, NULL, NULL),
(34, 'Boyo', 7, NULL, NULL),
(35, 'Bui', 7, NULL, NULL),
(36, 'Donga-Mantung', 7, NULL, NULL),
(37, 'Menchum', 7, NULL, NULL),
(38, 'Mezam', 7, NULL, NULL),
(39, 'Momo', 7, NULL, NULL),
(40, 'Ngo-Ketunjia', 7, NULL, NULL),
(41, 'Bamboutos', 8, NULL, NULL),
(42, 'Haut-Nkam', 8, NULL, NULL),
(43, 'Hauts-Plateaux', 8, NULL, NULL),
(44, 'Koung-Khi', 8, NULL, NULL),
(45, 'Menoua', 8, NULL, NULL),
(46, 'Mifi', 8, NULL, NULL),
(47, 'Ndé', 8, NULL, NULL),
(48, 'Noun', 8, NULL, NULL),
(49, 'Dja-et-Lobo', 9, NULL, NULL),
(50, 'Mvila', 9, NULL, NULL),
(51, 'Océan', 9, NULL, NULL),
(52, 'Vallée-du-Ntem', 9, NULL, NULL),
(53, 'Fako', 10, NULL, NULL),
(54, 'Koupé-Manengouba', 10, NULL, NULL),
(55, 'Lebialem', 10, NULL, NULL),
(56, 'Manyu', 10, NULL, NULL),
(57, 'Meme', 10, NULL, NULL),
(58, 'Ndian', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `article_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `path`, `created_at`, `updated_at`, `article_id`) VALUES
(8, 'https://ism-ndazoa.com/documents/1846041569445251.pdf', '2025-10-15 10:00:31', '2025-10-15 10:00:31', 15),
(3, '<?php\nuse function Laravel\\Folio\\{name, middleware};\nuse Livewire\\Volt\\Component;\nuse Livewire\\WithFileUploads;\nuse App\\Models\\Article;\nuse App\\Models\\Image;\nuse App\\Models\\Document;\n\nname(\'admin.articles\');\nmiddleware([\'auth\', \'verified\']);\n\nnew class ex', '2025-10-15 08:20:35', '2025-10-15 08:21:27', 10),
(9, 'https://ism-ndazoa.com/documents/1848391759013774.pdf', '2025-11-10 08:35:47', '2025-11-10 08:35:47', 23),
(10, 'https://ism-ndazoa.com/documents/1849117150596165.pdf', '2025-11-18 08:45:34', '2025-11-18 08:45:34', 24);

-- --------------------------------------------------------

--
-- Structure de la table `examens`
--

CREATE TABLE `examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `statut` enum('ouvert','en_cours','ferme','annule') NOT NULL DEFAULT 'ouvert',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cycle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `examens`
--

INSERT INTO `examens` (`id`, `titre`, `date`, `statut`, `description`, `created_at`, `updated_at`, `cycle_id`) VALUES
(1, 'BTS-S1', '2026-02-23 00:00:00', 'ouvert', '', '2026-02-13 07:30:19', '2026-03-11 19:36:48', 1),
(2, 'semestre 2', '2026-02-14 00:00:00', 'ferme', '', '2026-02-13 07:21:30', '2026-03-04 13:02:11', 1),
(3, 'M1-S7', '2026-03-03 00:00:00', 'ouvert', '', '2026-03-05 21:14:49', '2026-04-25 14:39:52', 3),
(4, 'L3-S5', '2026-03-03 00:00:00', 'ouvert', '', '2026-03-11 17:16:19', '2026-03-11 19:39:08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

CREATE TABLE `filieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cycle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `institution` enum('ISM','IFPM') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL DEFAULT 'pending',
  `responsable_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `departement_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filieres`
--

INSERT INTO `filieres` (`id`, `name`, `cycle_id`, `institution`, `created_at`, `updated_at`, `status`, `responsable_id`, `code`, `description`, `departement_id`) VALUES
(1, 'Génie Informatique', 1, 'ISM', '2026-02-19 10:27:50', '2026-02-19 10:43:37', 'Success', NULL, NULL, NULL, 1),
(2, 'Réseaux & Télécommunications', 1, 'ISM', '2026-02-19 10:27:50', '2026-02-19 10:43:40', 'Success', NULL, NULL, NULL, 1),
(3, 'Arts et Métiers de la Culture', 1, 'ISM', '2026-02-19 10:27:50', '2026-02-19 10:43:43', 'Success', NULL, NULL, NULL, 2),
(4, 'Restauration', 1, 'ISM', '2026-02-19 10:27:50', '2026-02-19 10:43:46', 'Success', NULL, NULL, NULL, 3),
(5, 'Carrières Juridiques', 1, 'ISM', '2026-02-19 10:27:50', '2026-02-19 10:43:48', 'Success', NULL, NULL, NULL, 4),
(77, 'Génie de l\'environnement', 2, 'ISM', '2026-02-26 21:24:39', '2026-03-02 10:11:53', 'Success', NULL, 'FIL-XPJT8X', '', 49),
(81, 'Gestion des ressources humaines', 1, 'ISM', '2026-03-02 09:56:56', '2026-03-02 09:56:56', 'Success', NULL, 'FIL-MSEEP0', '', 50),
(82, 'Génie mécanique', 1, 'ISM', '2026-03-02 10:06:47', '2026-03-06 12:44:19', 'Success', NULL, 'FIL-BQ17I3', '', 51),
(83, 'Sciences biomédicales', 1, 'ISM', '2026-03-04 21:27:26', '2026-03-04 21:27:26', 'Success', NULL, 'FIL-WCQJ1G', '', 52),
(84, 'Mechanical Engineering', 1, 'ISM', '2026-03-04 21:34:41', '2026-03-04 21:34:41', 'Success', NULL, 'FIL-9SQ0UH', '', 53),
(86, 'test', 1, 'ISM', '2026-03-08 11:37:30', '2026-03-09 13:37:42', 'failed', NULL, 'FIL-UQCCKS', '', 52),
(87, 'Production végétale', 2, 'ISM', '2026-03-09 13:31:26', '2026-03-09 13:37:38', 'failed', NULL, 'FIL-B5RG8T', '', 56),
(88, 'Génie Informatique', 1, 'ISM', '2026-03-09 15:27:14', '2026-03-09 15:27:20', 'failed', NULL, 'FIL-FJGX2U', '', 4),
(89, 'Génie Informatique', 1, 'ISM', '2026-03-10 15:58:32', '2026-03-10 15:58:42', 'failed', NULL, 'FIL-AOC9VH', '', 4),
(90, 'Sciences biomédicales', 3, 'ISM', '2026-03-10 19:33:23', '2026-03-10 19:33:23', 'Success', NULL, 'FIL-2A2QF4', '', 59),
(91, 'Management sciences', 3, 'ISM', '2026-03-10 19:33:57', '2026-03-10 19:33:57', 'Success', NULL, 'FIL-WXYXBN', '', 57),
(92, 'Gestion des ressources humaines', 2, 'ISM', '2026-03-10 20:03:34', '2026-03-10 20:03:34', 'Success', NULL, 'FIL-HCB0TB', '', 62),
(93, 'Génie des Infrastructures', 3, 'ISM', '2026-03-16 11:22:59', '2026-03-16 11:22:59', 'Success', NULL, 'FIL-FQDCBW', '', 61);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `article_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `path`, `created_at`, `updated_at`, `article_id`) VALUES
(8, 'https://ism-ndazoa.com/images/1846041569441985.jpg', '2025-10-15 10:00:31', '2025-10-15 10:00:31', 15),
(11, 'https://ism-ndazoa.com/images/1846059786314965.jpg', '2025-10-15 14:50:04', '2025-10-15 14:50:04', 17),
(9, 'https://ism-ndazoa.com/images/1846045064646503.jpg', '2025-10-15 10:56:05', '2025-10-15 10:56:05', 16),
(5, 'http://ism-ndazoa.com/images/1845875383009203.jpg', '2025-10-15 08:31:52', NULL, 8),
(10, 'https://ism-ndazoa.com/images/1846045064649149.mp4', '2025-10-15 10:56:05', '2025-10-15 10:56:05', 16),
(12, 'https://ism-ndazoa.com/images/1846059786319095.jpg', '2025-10-15 14:50:04', '2025-10-15 14:50:04', 17),
(13, 'https://ism-ndazoa.com/images/1846139429981566.jpeg', '2025-10-16 11:55:58', '2025-10-16 11:55:58', 18),
(14, 'https://ism-ndazoa.com/images/1846151977473561.jpeg', '2025-10-16 15:15:25', '2025-10-16 15:15:25', 19),
(15, 'https://ism-ndazoa.com/images/1846151977478047.jpeg', '2025-10-16 15:15:25', '2025-10-16 15:15:25', 19),
(16, 'https://ism-ndazoa.com/images/1846151977478625.jpeg', '2025-10-16 15:15:25', '2025-10-16 15:15:25', 19),
(17, 'https://ism-ndazoa.com/images/1847214901499555.jpeg', '2025-10-28 08:50:08', '2025-10-28 08:50:08', 20),
(18, 'https://ism-ndazoa.com/images/1847214901501236.jpeg', '2025-10-28 08:50:08', '2025-10-28 08:50:08', 20),
(19, 'https://ism-ndazoa.com/images/1847214901501840.jpeg', '2025-10-28 08:50:08', '2025-10-28 08:50:08', 20),
(20, 'https://ism-ndazoa.com/images/1847214901502673.jpeg', '2025-10-28 08:50:08', '2025-10-28 08:50:08', 20),
(21, 'https://ism-ndazoa.com/images/1847397133127409.jpeg', '2025-10-30 09:06:38', '2025-10-30 09:06:38', 21),
(22, 'https://ism-ndazoa.com/images/1847397133129435.jpeg', '2025-10-30 09:06:38', '2025-10-30 09:06:38', 21),
(23, 'https://ism-ndazoa.com/images/1847397133129987.jpeg', '2025-10-30 09:06:38', '2025-10-30 09:06:38', 21),
(26, 'https://ism-ndazoa.com/images/1849117150590600.jpeg', '2025-11-18 08:45:34', '2025-11-18 08:45:34', 24),
(25, 'https://ism-ndazoa.com/images/1848391759012025.jpeg', '2025-11-10 08:35:47', '2025-11-10 08:35:47', 23),
(27, 'https://ism-ndazoa.com/images/1849117150594607.jpeg', '2025-11-18 08:45:34', '2025-11-18 08:45:34', 24),
(28, 'https://ism-ndazoa.com/images/1849117150595301.jpeg', '2025-11-18 08:45:34', '2025-11-18 08:45:34', 24),
(29, 'https://ism-ndazoa.com/images/1850652961133141.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(30, 'https://ism-ndazoa.com/images/1850652961136009.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(31, 'https://ism-ndazoa.com/images/1850652961137168.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(32, 'https://ism-ndazoa.com/images/1850652961139287.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(33, 'https://ism-ndazoa.com/images/1850652961140464.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(34, 'https://ism-ndazoa.com/images/1850652961141702.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(35, 'https://ism-ndazoa.com/images/1850652961142765.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(36, 'https://ism-ndazoa.com/images/1850652961143967.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(37, 'https://ism-ndazoa.com/images/1850652961144974.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(38, 'https://ism-ndazoa.com/images/1850652961146037.jpeg', '2025-12-05 07:36:37', '2025-12-05 07:36:37', 25),
(39, 'https://ism-ndazoa.com/images/1855726695836266.jpeg', '2026-01-30 07:41:28', '2026-01-30 07:41:28', 27),
(40, 'https://ism-ndazoa.com/images/1855726695839175.jpeg', '2026-01-30 07:41:28', '2026-01-30 07:41:28', 27),
(41, 'https://ism-ndazoa.com/images/1855726695839780.jpeg', '2026-01-30 07:41:28', '2026-01-30 07:41:28', 27),
(42, 'https://ism-ndazoa.com/images/1855726695840365.jpeg', '2026-01-30 07:41:28', '2026-01-30 07:41:28', 27);

-- --------------------------------------------------------

--
-- Structure de la table `indemnites`
--

CREATE TABLE `indemnites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `indemnites`
--

INSERT INTO `indemnites` (`id`, `libelle`, `description`, `actif`, `created_at`, `updated_at`) VALUES
(1, 'Indemnité de Transport', 'Transport domicile-travail', 1, NULL, NULL),
(2, 'Indemnité de Logement', 'Aide au logement', 1, NULL, NULL),
(3, 'Prime de Rendement', 'Prime selon performance', 1, NULL, NULL),
(4, 'Indemnité de Responsabilité', 'Pour les postes d\'encadrement', 1, NULL, NULL),
(5, 'dvzv', NULL, 1, '2026-05-22 07:25:00', '2026-05-22 07:25:00');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `type` enum('dessert','repas','complement') NOT NULL,
  `categorie` enum('dejeuner','diner','souper') NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `status`, `created_at`, `updated_at`, `type`, `categorie`, `price`) VALUES
(10, 'poulet', 'Success', '2025-08-24 09:13:46', '2025-08-24 09:13:46', 'dessert', 'dejeuner', 2000),
(11, 'poulet', 'Success', '2025-08-24 09:22:19', '2025-08-24 09:22:19', 'dessert', 'dejeuner', 400);

-- --------------------------------------------------------

--
-- Structure de la table `menu_days`
--

CREATE TABLE `menu_days` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `hours` time DEFAULT NULL,
  `type` enum('one','allDay') NOT NULL,
  `specialday` datetime DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu_days`
--

INSERT INTO `menu_days` (`id`, `menu_id`, `day`, `hours`, `type`, `specialday`, `status`, `created_at`, `updated_at`) VALUES
(5, 10, 'Sunday', '15:30:00', 'one', '2025-08-25 00:00:00', 'Success', '2025-08-24 09:13:46', '2025-08-24 09:13:46'),
(6, 11, 'Sunday', '10:00:00', 'one', '2025-08-24 00:00:00', 'Success', '2025-08-24 09:22:19', '2025-08-24 09:22:19');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_16_120000_create_cycles_table', 2),
(5, '2025_07_16_120001_create_filieres_table', 2),
(6, '2025_07_16_120002_create_specialites_table', 2),
(7, '2025_07_16_123000_create_regions_table', 3),
(8, '2025_07_16_123001_create_departments_table', 3),
(9, '2025_07_16_123002_create_arrondissements_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_id` bigint(20) UNSIGNED NOT NULL,
  `cours_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cc` decimal(5,2) DEFAULT NULL,
  `exam` decimal(5,2) DEFAULT NULL,
  `valeur` decimal(5,2) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `validee_par` bigint(20) UNSIGNED DEFAULT NULL,
  `validee_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rattrapage` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id`, `examen_id`, `etudiant_id`, `cours_id`, `cc`, `exam`, `valeur`, `commentaire`, `validee_par`, `validee_at`, `created_at`, `updated_at`, `rattrapage`) VALUES
(1, 1, 56, 46, 17.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:03', '2026-03-06 22:41:52', NULL),
(2, 1, 55, 46, 15.00, 6.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:03', '2026-03-25 11:39:52', 12.00),
(3, 1, 56, 47, 14.00, 2.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:13', '2026-04-25 14:37:35', 8.00),
(4, 1, 55, 47, 15.00, 2.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:13', '2026-03-25 11:37:53', 11.00),
(5, 1, 56, 48, 13.75, 10.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:48', '2026-03-06 22:44:56', NULL),
(6, 1, 55, 48, 16.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-05 10:20:48', '2026-03-06 22:44:56', NULL),
(7, 1, 60, 146, 8.60, 10.00, NULL, NULL, NULL, NULL, '2026-03-05 23:37:40', '2026-03-25 11:47:34', 15.00),
(8, 1, 59, 146, 14.33, 17.00, NULL, NULL, NULL, NULL, '2026-03-05 23:37:40', '2026-03-09 14:59:04', NULL),
(9, 1, 60, 147, 14.50, 14.00, NULL, NULL, NULL, NULL, '2026-03-05 23:38:12', '2026-03-09 14:59:37', NULL),
(10, 1, 59, 147, 16.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-05 23:38:12', '2026-03-09 14:59:37', NULL),
(11, 1, 60, 148, 5.00, 1.00, NULL, NULL, NULL, NULL, '2026-03-05 23:38:53', '2026-04-01 08:37:45', 10.00),
(12, 1, 59, 148, 10.00, 9.00, NULL, NULL, NULL, NULL, '2026-03-05 23:38:53', '2026-03-25 11:58:39', 10.00),
(13, 1, 60, 152, 10.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-05 23:39:33', '2026-03-09 15:11:43', NULL),
(14, 1, 59, 152, 12.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-05 23:39:33', '2026-03-09 15:11:43', NULL),
(15, 1, 60, 151, 15.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-05 23:40:14', '2026-03-09 15:10:08', NULL),
(16, 1, 59, 151, 11.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-05 23:40:14', '2026-03-09 15:10:08', NULL),
(17, 1, 54, 236, 17.00, 5.00, NULL, NULL, NULL, NULL, '2026-03-06 13:22:21', '2026-03-25 11:30:16', 17.00),
(18, 1, 54, 238, 12.85, 8.50, NULL, NULL, NULL, NULL, '2026-03-06 13:23:32', '2026-03-06 14:11:50', NULL),
(19, 1, 54, 237, 13.60, 12.00, NULL, NULL, NULL, NULL, '2026-03-06 13:24:21', '2026-03-06 14:11:26', NULL),
(20, 1, 54, 229, 12.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-06 13:26:00', '2026-03-06 13:52:05', NULL),
(21, 1, 54, 233, 9.50, 5.00, NULL, NULL, NULL, NULL, '2026-03-06 13:28:01', '2026-03-25 11:30:49', 19.00),
(22, 1, 54, 235, 9.50, 5.00, NULL, NULL, NULL, NULL, '2026-03-06 13:28:31', '2026-03-25 11:31:00', 19.00),
(23, 1, 54, 231, 15.00, 9.00, NULL, NULL, NULL, NULL, '2026-03-06 13:29:29', '2026-03-06 14:13:40', NULL),
(24, 1, 54, 272, 14.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-06 13:30:41', '2026-03-06 14:12:41', NULL),
(25, 1, 54, 232, 11.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-06 13:31:05', '2026-03-06 14:12:19', NULL),
(26, 1, 56, 52, 17.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-06 22:19:19', '2026-03-06 22:40:57', NULL),
(27, 1, 55, 52, 17.00, 12.50, NULL, NULL, NULL, NULL, '2026-03-06 22:19:19', '2026-03-06 22:40:57', NULL),
(28, 1, 56, 49, 14.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-06 22:21:21', '2026-03-11 12:56:11', NULL),
(29, 1, 55, 49, 12.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-06 22:21:21', '2026-03-11 12:56:11', NULL),
(30, 1, 56, 53, 15.75, 5.00, NULL, NULL, NULL, NULL, '2026-03-06 22:22:00', '2026-03-25 11:39:30', 13.00),
(31, 1, 55, 53, 18.00, 6.00, NULL, NULL, NULL, NULL, '2026-03-06 22:22:00', '2026-04-01 09:20:10', 8.00),
(32, 1, 56, 50, 15.00, 18.50, NULL, NULL, NULL, NULL, '2026-03-06 22:22:30', '2026-03-11 12:55:31', NULL),
(33, 1, 55, 50, 15.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-06 22:22:30', '2026-03-11 12:55:31', NULL),
(34, 1, 56, 51, 14.00, 2.00, NULL, NULL, NULL, NULL, '2026-03-06 22:23:18', '2026-03-25 11:38:26', 8.00),
(35, 1, 55, 51, 15.00, 2.00, NULL, NULL, NULL, NULL, '2026-03-06 22:23:18', '2026-03-25 11:38:23', 11.00),
(36, 1, 56, 55, 12.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-06 22:24:12', '2026-03-06 22:49:30', NULL),
(37, 1, 55, 55, 16.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-06 22:24:12', '2026-03-06 22:49:30', NULL),
(38, 1, 56, 56, 14.50, 9.00, NULL, NULL, NULL, NULL, '2026-03-06 22:32:16', '2026-03-06 22:50:26', NULL),
(39, 1, 55, 56, 6.50, 15.00, NULL, NULL, NULL, NULL, '2026-03-06 22:32:16', '2026-03-06 22:50:26', NULL),
(40, 1, 56, 68, 15.50, 8.00, NULL, NULL, NULL, NULL, '2026-03-06 22:36:51', '2026-03-06 22:44:12', NULL),
(41, 1, 55, 68, 13.50, 8.00, NULL, NULL, NULL, NULL, '2026-03-06 22:36:51', '2026-03-06 22:44:12', NULL),
(42, 1, 56, 54, 16.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-06 22:38:17', '2026-03-06 22:43:27', NULL),
(43, 1, 55, 54, 15.50, 10.00, NULL, NULL, NULL, NULL, '2026-03-06 22:38:17', '2026-03-06 22:43:27', NULL),
(44, 1, 72, 92, 13.25, 12.00, NULL, NULL, NULL, NULL, '2026-03-06 23:15:46', '2026-03-06 23:15:46', NULL),
(45, 1, 72, 91, 14.25, 17.00, NULL, NULL, NULL, NULL, '2026-03-06 23:17:23', '2026-03-06 23:17:27', NULL),
(46, 1, 72, 228, 13.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-06 23:20:12', '2026-03-06 23:20:12', NULL),
(47, 1, 72, 90, 11.25, 1.00, NULL, NULL, NULL, NULL, '2026-03-06 23:21:21', '2026-03-24 19:02:22', 12.00),
(48, 1, 72, 88, 11.50, 10.00, NULL, NULL, NULL, NULL, '2026-03-06 23:23:15', '2026-03-06 23:23:15', NULL),
(49, 1, 72, 87, 13.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-06 23:24:05', '2026-03-25 11:11:48', 10.00),
(50, 1, 72, 227, 12.50, 4.00, NULL, NULL, NULL, NULL, '2026-03-06 23:25:19', '2026-03-25 00:16:21', 13.00),
(51, 1, 72, 226, 14.90, 11.00, NULL, NULL, NULL, NULL, '2026-03-06 23:26:43', '2026-03-25 00:15:45', 12.00),
(52, 1, 72, 89, 11.00, 5.00, NULL, NULL, NULL, NULL, '2026-03-06 23:27:29', '2026-03-25 00:16:09', 12.00),
(53, 1, 72, 95, 5.50, 10.00, NULL, NULL, NULL, NULL, '2026-03-06 23:31:20', '2026-03-24 19:03:18', 8.00),
(54, 1, 57, 254, 14.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-08 13:17:16', '2026-03-08 13:17:16', NULL),
(55, 1, 57, 256, 10.75, 7.50, NULL, NULL, NULL, NULL, '2026-03-08 13:17:49', '2026-03-08 13:17:49', NULL),
(56, 1, 57, 246, 14.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-08 13:19:24', '2026-03-08 13:58:59', NULL),
(57, 1, 57, 242, 17.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-08 13:31:21', '2026-03-08 13:31:21', NULL),
(58, 1, 57, 241, 16.00, 1.00, NULL, NULL, NULL, NULL, '2026-03-08 13:31:59', '2026-03-25 11:42:38', 7.00),
(59, 1, 57, 252, 18.50, 11.00, NULL, NULL, NULL, NULL, '2026-03-08 13:37:37', '2026-03-08 14:02:05', NULL),
(60, 1, 57, 253, 10.25, 9.00, NULL, NULL, NULL, NULL, '2026-03-08 13:38:10', '2026-03-08 14:02:21', NULL),
(61, 1, 57, 248, 17.50, 8.50, NULL, NULL, NULL, NULL, '2026-03-08 13:40:05', '2026-03-08 13:40:05', NULL),
(62, 1, 57, 249, 18.50, 17.50, NULL, NULL, NULL, NULL, '2026-03-08 13:42:12', '2026-03-08 13:42:12', NULL),
(63, 1, 57, 250, 10.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-08 13:44:21', '2026-03-08 13:44:21', NULL),
(64, 1, 57, 251, 15.50, 10.00, NULL, NULL, NULL, NULL, '2026-03-08 13:45:27', '2026-03-08 14:07:38', NULL),
(65, 1, 57, 244, 14.50, 10.00, NULL, NULL, NULL, NULL, '2026-03-08 13:46:59', '2026-03-08 13:46:59', NULL),
(66, 1, 57, 245, 5.00, 3.00, NULL, NULL, NULL, NULL, '2026-03-08 13:48:08', '2026-04-01 09:25:43', 8.25),
(67, 1, 70, 318, 18.75, 18.50, NULL, NULL, NULL, NULL, '2026-03-09 12:32:42', '2026-03-10 22:52:30', NULL),
(68, 1, 70, 314, 16.00, 19.50, NULL, NULL, NULL, NULL, '2026-03-09 12:34:35', '2026-03-10 22:57:32', NULL),
(69, 1, 73, 318, 14.50, 8.50, NULL, NULL, NULL, NULL, '2026-03-09 12:40:44', '2026-03-10 22:52:30', NULL),
(70, 1, 73, 314, 14.00, 13.50, NULL, NULL, NULL, NULL, '2026-03-09 12:41:18', '2026-03-10 22:57:32', NULL),
(71, 1, 70, 319, 19.00, 19.50, NULL, NULL, NULL, NULL, '2026-03-09 12:43:16', '2026-03-10 22:53:10', NULL),
(72, 1, 73, 319, 17.50, 14.50, NULL, NULL, NULL, NULL, '2026-03-09 12:43:16', '2026-03-10 22:53:10', NULL),
(73, 1, 64, 303, 16.66, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 12:44:39', '2026-03-10 15:17:50', NULL),
(74, 1, 64, 293, 16.00, 12.50, NULL, NULL, NULL, NULL, '2026-03-09 12:47:03', '2026-03-10 15:21:14', NULL),
(75, 1, 64, 294, 13.00, 10.50, NULL, NULL, NULL, NULL, '2026-03-09 12:48:05', '2026-03-11 11:02:37', NULL),
(76, 1, 64, 292, 14.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 12:48:40', '2026-03-10 15:21:26', NULL),
(77, 1, 64, 302, 18.66, 16.50, NULL, NULL, NULL, NULL, '2026-03-09 12:52:09', '2026-03-10 15:17:13', NULL),
(78, 1, 60, 193, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09 12:52:31', '2026-03-09 12:52:31', NULL),
(79, 1, 59, 193, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-09 12:52:31', '2026-03-09 12:52:31', NULL),
(80, 1, 64, 298, 10.00, 5.00, NULL, NULL, NULL, NULL, '2026-03-09 12:53:36', '2026-03-25 11:18:46', 10.00),
(81, 1, 64, 305, 17.50, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 12:59:18', '2026-03-10 15:18:36', NULL),
(82, 1, 64, 306, 17.75, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 13:00:34', '2026-03-10 15:19:00', NULL),
(83, 1, 64, 295, 11.00, 13.50, NULL, NULL, NULL, NULL, '2026-03-09 13:05:02', '2026-03-10 15:02:54', NULL),
(84, 1, 53, 222, 13.00, 8.00, NULL, NULL, NULL, NULL, '2026-03-09 13:08:10', '2026-03-09 22:13:22', NULL),
(85, 1, 53, 206, 13.00, 12.50, NULL, NULL, NULL, NULL, '2026-03-09 13:11:21', '2026-03-09 22:14:53', NULL),
(86, 1, 53, 210, 13.00, 4.00, NULL, NULL, NULL, NULL, '2026-03-09 13:12:20', '2026-03-25 11:41:39', 10.00),
(87, 1, 66, 263, 12.50, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 13:12:32', '2026-03-09 22:33:24', NULL),
(88, 1, 53, 211, 9.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-09 13:13:22', '2026-03-25 11:41:58', 12.50),
(89, 1, 53, 220, 17.25, NULL, NULL, NULL, NULL, NULL, '2026-03-09 13:15:10', '2026-03-09 13:15:10', NULL),
(90, 1, 53, 208, 14.25, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 13:16:06', '2026-03-09 22:16:18', NULL),
(91, 1, 53, 212, 15.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 13:18:06', '2026-03-11 11:40:39', NULL),
(92, 1, 53, 207, 14.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 13:19:15', '2026-03-09 22:15:11', NULL),
(93, 1, 66, 331, 11.00, 5.00, NULL, NULL, NULL, NULL, '2026-03-09 13:19:31', '2026-03-25 11:23:08', 12.00),
(94, 1, 66, 270, 11.00, 6.00, NULL, NULL, NULL, NULL, '2026-03-09 13:20:00', '2026-03-25 11:22:49', 12.00),
(95, 1, 53, 224, 13.00, NULL, NULL, NULL, NULL, NULL, '2026-03-09 13:20:10', '2026-03-09 13:20:10', NULL),
(96, 1, 66, 264, 11.50, 4.00, NULL, NULL, NULL, NULL, '2026-03-09 13:21:18', '2026-03-25 11:24:20', 13.00),
(97, 1, 66, 262, 10.00, 3.00, NULL, NULL, NULL, NULL, '2026-03-09 13:21:41', '2026-03-25 11:24:08', 11.50),
(98, 1, 66, 265, 12.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-09 13:22:16', '2026-03-25 11:23:35', 12.50),
(99, 1, 66, 267, 11.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 13:27:11', '2026-03-25 00:03:47', 13.00),
(100, 1, 66, 261, 11.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-09 13:27:57', '2026-03-25 11:24:39', 13.00),
(101, 1, 66, 259, 8.00, 3.00, NULL, NULL, NULL, NULL, '2026-03-09 13:28:57', '2026-03-25 11:25:24', 5.00),
(102, 1, 64, 290, 16.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 13:53:57', '2026-03-10 14:59:50', NULL),
(103, 1, 64, 289, 11.00, 8.50, NULL, NULL, NULL, NULL, '2026-03-09 13:54:54', '2026-03-25 11:22:16', 17.50),
(104, 1, 60, 149, 5.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 15:03:32', '2026-03-25 11:49:01', 13.00),
(105, 1, 59, 149, 11.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 15:03:32', '2026-03-09 15:11:35', NULL),
(106, 1, 60, 150, 11.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 15:04:39', '2026-03-09 15:11:59', NULL),
(107, 1, 59, 150, 15.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 15:04:39', '2026-03-09 15:11:59', NULL),
(108, 1, 60, 153, 13.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 15:13:42', '2026-03-09 15:14:25', NULL),
(109, 1, 59, 153, 13.00, 17.00, NULL, NULL, NULL, NULL, '2026-03-09 15:13:42', '2026-03-09 15:14:25', NULL),
(110, 1, 60, 154, 14.50, 5.00, NULL, NULL, NULL, NULL, '2026-03-09 15:15:17', '2026-03-09 15:18:05', NULL),
(111, 1, 59, 154, 16.50, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 15:15:18', '2026-03-09 15:18:05', NULL),
(112, 1, 60, 155, 13.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 15:16:05', '2026-03-09 15:18:18', NULL),
(113, 1, 59, 155, 17.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-09 15:16:05', '2026-03-09 15:18:18', NULL),
(114, 1, 60, 156, 10.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 15:21:21', '2026-03-09 15:21:21', NULL),
(115, 1, 59, 156, 11.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 15:21:21', '2026-03-09 15:21:21', NULL),
(116, 1, 60, 157, 2.00, 3.50, NULL, NULL, NULL, NULL, '2026-03-09 15:22:28', '2026-03-25 11:59:13', 7.00),
(117, 1, 59, 157, 4.25, 6.00, NULL, NULL, NULL, NULL, '2026-03-09 15:22:28', '2026-03-25 11:59:13', 11.00),
(118, 1, 66, 266, 12.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-09 15:45:48', '2026-03-25 11:23:45', 12.50),
(119, 1, 53, 214, 11.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 22:11:58', '2026-03-09 22:11:58', NULL),
(120, 1, 53, 223, 14.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 22:26:25', '2026-03-10 08:33:16', NULL),
(121, 1, 53, 209, 17.25, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 22:27:34', '2026-03-10 08:34:09', NULL),
(122, 1, 66, 260, 0.00, 0.00, NULL, NULL, NULL, NULL, '2026-03-09 22:32:48', '2026-03-25 11:25:07', 12.50),
(123, 1, 66, 268, 10.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 22:35:45', '2026-03-09 22:35:45', NULL),
(124, 1, 66, 269, NULL, 5.00, NULL, NULL, NULL, NULL, '2026-03-09 22:38:13', '2026-03-09 22:38:13', NULL),
(125, 1, 61, 243, 15.50, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 23:30:59', '2026-03-15 05:50:46', NULL),
(126, 1, 74, 243, 11.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 23:30:59', '2026-03-15 05:50:46', NULL),
(127, 1, 62, 243, 12.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 23:30:59', '2026-03-15 05:50:46', NULL),
(128, 1, 61, 123, 15.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 23:31:29', '2026-03-15 05:50:55', NULL),
(129, 1, 74, 123, 18.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 23:31:29', '2026-03-15 05:50:55', NULL),
(130, 1, 62, 123, 13.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 23:31:29', '2026-03-15 05:50:55', NULL),
(131, 1, 61, 121, 10.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 23:32:36', '2026-03-15 05:49:23', NULL),
(132, 1, 74, 121, 20.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 23:32:36', '2026-03-15 05:49:23', NULL),
(133, 1, 62, 121, 11.00, 3.00, NULL, NULL, NULL, NULL, '2026-03-09 23:32:36', '2026-03-25 11:31:48', 14.00),
(134, 1, 61, 240, 16.00, 17.00, NULL, NULL, NULL, NULL, '2026-03-09 23:33:32', '2026-03-15 05:49:50', NULL),
(135, 1, 74, 240, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 23:33:32', '2026-03-15 05:49:50', NULL),
(136, 1, 62, 240, 11.50, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 23:33:32', '2026-03-15 05:49:50', NULL),
(137, 1, 61, 239, 17.50, 17.00, NULL, NULL, NULL, NULL, '2026-03-09 23:40:56', '2026-03-15 05:50:05', NULL),
(138, 1, 74, 239, 11.50, 13.50, NULL, NULL, NULL, NULL, '2026-03-09 23:40:56', '2026-03-15 05:50:05', NULL),
(139, 1, 62, 239, 16.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-09 23:40:56', '2026-03-15 05:50:05', NULL),
(140, 1, 61, 118, 14.00, 7.50, NULL, NULL, NULL, NULL, '2026-03-09 23:41:37', '2026-03-15 05:48:50', NULL),
(141, 1, 74, 118, 11.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 23:41:37', '2026-03-15 05:48:50', NULL),
(142, 1, 62, 118, 12.00, 7.00, NULL, NULL, NULL, NULL, '2026-03-09 23:41:37', '2026-03-25 11:34:24', 13.00),
(143, 1, 61, 130, 18.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-09 23:42:28', '2026-03-11 12:41:01', NULL),
(144, 1, 74, 130, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 23:42:28', '2026-03-11 12:41:01', NULL),
(145, 1, 62, 130, 14.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-09 23:42:28', '2026-03-11 12:41:01', NULL),
(146, 1, 61, 117, 12.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:02', '2026-03-15 05:45:52', NULL),
(147, 1, 74, 117, 11.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:02', '2026-03-15 05:45:52', NULL),
(148, 1, 62, 117, 10.00, 8.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:02', '2026-03-25 11:32:41', 13.00),
(149, 1, 61, 122, 17.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:50', '2026-03-15 05:44:52', NULL),
(150, 1, 74, 122, 10.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:50', '2026-03-15 05:44:52', NULL),
(151, 1, 62, 122, 12.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 23:43:50', '2026-03-15 05:44:52', NULL),
(152, 1, 61, 120, 13.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-09 23:45:42', '2026-03-11 12:41:27', NULL),
(153, 1, 74, 120, 13.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-09 23:45:42', '2026-03-11 12:41:27', NULL),
(154, 1, 62, 120, 12.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-09 23:45:42', '2026-03-11 12:41:27', NULL),
(155, 1, 61, 258, 3.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-09 23:47:33', '2026-03-09 23:47:33', NULL),
(156, 1, 74, 258, 14.25, 14.00, NULL, NULL, NULL, NULL, '2026-03-09 23:47:33', '2026-03-09 23:47:33', NULL),
(157, 1, 62, 258, 10.75, 8.50, NULL, NULL, NULL, NULL, '2026-03-09 23:47:33', '2026-03-25 11:34:46', 8.00),
(158, 1, 61, 257, 14.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 23:49:48', '2026-03-15 05:47:55', NULL),
(159, 1, 74, 257, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-09 23:49:48', '2026-03-15 05:47:55', NULL),
(160, 1, 62, 257, 16.00, 3.00, NULL, NULL, NULL, NULL, '2026-03-09 23:49:48', '2026-03-25 11:32:09', 14.50),
(161, 1, 64, 288, 11.25, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 14:54:45', '2026-03-10 14:56:02', NULL),
(162, 1, 64, 291, 10.67, 11.00, NULL, NULL, NULL, NULL, '2026-03-10 14:57:34', '2026-03-11 10:51:25', NULL),
(163, 1, 64, 296, 16.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 15:01:17', '2026-03-10 15:01:18', NULL),
(164, 1, 64, 297, 13.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 15:05:05', '2026-03-11 10:52:10', NULL),
(165, 1, 64, 300, 10.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 15:06:22', '2026-03-10 15:06:22', NULL),
(166, 1, 64, 299, 6.00, 6.00, NULL, NULL, NULL, NULL, '2026-03-10 15:13:19', '2026-03-25 11:17:52', 15.50),
(167, 1, 64, 307, 7.50, 7.50, NULL, NULL, NULL, NULL, '2026-03-10 15:14:47', '2026-03-25 11:18:18', 15.50),
(168, 1, 64, 308, 16.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-10 15:16:17', '2026-03-10 15:16:17', NULL),
(169, 1, 70, 310, 16.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 15:29:26', '2026-03-10 15:29:33', NULL),
(170, 1, 73, 310, 12.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-10 15:29:26', '2026-03-10 15:29:33', NULL),
(171, 1, 70, 311, 14.00, 17.00, NULL, NULL, NULL, NULL, '2026-03-10 15:30:33', '2026-03-11 10:43:04', NULL),
(172, 1, 73, 311, 17.67, 14.00, NULL, NULL, NULL, NULL, '2026-03-10 15:30:33', '2026-03-11 10:43:04', NULL),
(173, 1, 70, 312, 7.00, 6.00, NULL, NULL, NULL, NULL, '2026-03-10 15:32:53', '2026-03-25 12:00:07', 8.50),
(174, 1, 73, 312, 12.00, 9.00, NULL, NULL, NULL, NULL, '2026-03-10 15:32:53', '2026-03-10 15:32:53', NULL),
(175, 1, 70, 321, 13.00, 15.50, NULL, NULL, NULL, NULL, '2026-03-10 22:50:59', '2026-03-10 22:50:59', NULL),
(176, 1, 73, 321, 4.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-10 22:50:59', '2026-03-10 22:50:59', NULL),
(177, 1, 70, 322, 17.50, 11.50, NULL, NULL, NULL, NULL, '2026-03-10 22:51:49', '2026-03-10 22:51:55', NULL),
(178, 1, 73, 322, 16.00, 8.50, NULL, NULL, NULL, NULL, '2026-03-10 22:51:49', '2026-03-10 22:51:55', NULL),
(179, 1, 70, 315, 11.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-10 22:54:23', '2026-03-10 22:54:23', NULL),
(180, 1, 73, 315, 13.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-10 22:54:23', '2026-03-10 22:54:23', NULL),
(181, 1, 70, 313, 14.50, 17.50, NULL, NULL, NULL, NULL, '2026-03-10 22:55:16', '2026-03-10 22:55:56', NULL),
(182, 1, 73, 313, 11.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 22:55:16', '2026-03-10 22:55:56', NULL),
(183, 1, 65, 287, 12.00, 9.00, NULL, NULL, NULL, NULL, '2026-03-10 23:17:43', '2026-03-10 23:17:43', NULL),
(184, 1, 65, 280, 15.25, 10.50, NULL, NULL, NULL, NULL, '2026-03-10 23:19:02', '2026-03-10 23:19:23', NULL),
(185, 1, 65, 339, 12.50, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 23:19:50', '2026-03-10 23:20:14', NULL),
(186, 1, 65, 283, 15.00, 10.50, NULL, NULL, NULL, NULL, '2026-03-10 23:21:30', '2026-03-10 23:21:30', NULL),
(187, 1, 65, 284, 13.50, 17.50, NULL, NULL, NULL, NULL, '2026-03-10 23:22:15', '2026-03-10 23:22:39', NULL),
(188, 1, 65, 274, 13.00, 19.00, NULL, NULL, NULL, NULL, '2026-03-10 23:23:25', '2026-03-10 23:23:25', NULL),
(189, 1, 65, 275, 12.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-10 23:24:18', '2026-03-10 23:24:18', NULL),
(190, 1, 65, 276, 13.50, 15.50, NULL, NULL, NULL, NULL, '2026-03-10 23:24:57', '2026-03-10 23:24:57', NULL),
(191, 1, 65, 277, 13.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 23:25:26', '2026-03-10 23:25:28', NULL),
(192, 1, 65, 278, 17.00, 5.00, NULL, NULL, NULL, NULL, '2026-03-10 23:25:49', '2026-03-25 11:16:19', 17.00),
(193, 1, 65, 279, 17.50, 5.00, NULL, NULL, NULL, NULL, '2026-03-10 23:26:00', '2026-03-10 23:26:49', NULL),
(194, 1, 65, 286, 15.00, 5.50, NULL, NULL, NULL, NULL, '2026-03-10 23:28:25', '2026-03-25 11:16:01', 16.00),
(195, 1, 65, 282, 8.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-10 23:29:11', '2026-03-13 08:21:52', NULL),
(196, 1, 65, 281, 14.50, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 23:29:50', '2026-03-10 23:29:50', NULL),
(197, 1, 63, 336, 13.50, 7.00, NULL, NULL, NULL, NULL, '2026-03-10 23:32:40', '2026-03-10 23:32:40', NULL),
(198, 1, 63, 337, 15.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-10 23:33:58', '2026-03-10 23:33:58', NULL),
(199, 1, 63, 334, 12.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 23:34:37', '2026-03-10 23:34:37', NULL),
(200, 1, 63, 335, 13.25, 12.00, NULL, NULL, NULL, NULL, '2026-03-10 23:35:06', '2026-03-10 23:35:06', NULL),
(201, 1, 63, 325, 16.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-10 23:36:52', '2026-03-11 10:49:57', NULL),
(202, 1, 63, 324, 11.00, 13.50, NULL, NULL, NULL, NULL, '2026-03-10 23:37:30', '2026-03-10 23:37:30', NULL),
(203, 1, 63, 333, 14.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-10 23:38:20', '2026-03-10 23:38:20', NULL),
(204, 1, 63, 332, 12.50, 10.50, NULL, NULL, NULL, NULL, '2026-03-10 23:39:02', '2026-03-10 23:39:02', NULL),
(205, 1, 63, 327, 12.75, 5.00, NULL, NULL, NULL, NULL, '2026-03-10 23:39:44', '2026-03-25 12:00:34', 10.00),
(206, 1, 63, 326, 16.50, 8.00, NULL, NULL, NULL, NULL, '2026-03-10 23:40:09', '2026-03-10 23:40:09', NULL),
(207, 1, 63, 330, 14.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-10 23:40:41', '2026-03-10 23:42:25', NULL),
(208, 1, 70, 317, 8.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-11 10:44:15', '2026-03-11 10:45:26', NULL),
(209, 1, 73, 317, 12.50, 10.50, NULL, NULL, NULL, NULL, '2026-03-11 10:44:15', '2026-03-11 10:45:26', NULL),
(210, 1, 64, 301, 11.00, 16.50, NULL, NULL, NULL, NULL, '2026-03-11 10:59:11', '2026-03-11 10:59:11', NULL),
(211, 1, 65, 285, 10.50, 10.50, NULL, NULL, NULL, NULL, '2026-03-11 11:08:35', '2026-03-11 11:09:56', NULL),
(212, 1, 64, 309, 12.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-11 11:09:27', '2026-03-11 11:09:27', NULL),
(213, 1, 53, 213, 12.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-11 11:46:56', '2026-03-11 11:46:56', NULL),
(214, 3, 67, 366, 15.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-15 05:42:47', '2026-03-15 05:52:16', NULL),
(215, 3, 67, 372, 15.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-15 05:55:18', '2026-03-15 05:55:18', NULL),
(216, 3, 67, 369, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 05:56:48', '2026-03-16 08:56:32', NULL),
(217, 3, 67, 371, 13.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 05:59:53', '2026-03-16 08:54:40', NULL),
(218, 3, 67, 368, 12.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-15 06:01:19', '2026-03-15 06:01:26', NULL),
(219, 3, 67, 367, 12.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 06:04:39', '2026-03-15 06:04:39', NULL),
(220, 3, 67, 375, 14.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 06:06:33', '2026-03-15 06:06:33', NULL),
(221, 3, 67, 365, 15.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-15 06:07:25', '2026-03-15 06:07:25', NULL),
(222, 3, 67, 370, 14.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-15 06:07:59', '2026-03-15 06:07:59', NULL),
(223, 3, 52, 377, 16.00, 14.50, NULL, NULL, NULL, NULL, '2026-03-15 06:15:12', '2026-03-15 06:17:20', NULL),
(224, 3, 52, 376, 14.50, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 06:17:53', '2026-03-15 06:18:07', NULL),
(225, 3, 52, 382, 18.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 12:19:58', '2026-03-15 12:19:58', NULL),
(226, 3, 52, 384, 11.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-15 12:20:52', '2026-03-16 14:03:16', NULL),
(227, 3, 52, 381, 13.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-15 12:21:48', '2026-03-15 12:21:48', NULL),
(228, 3, 52, 388, 18.50, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 12:22:18', '2026-03-15 12:22:39', NULL),
(229, 3, 52, 379, 13.00, 10.00, NULL, NULL, NULL, NULL, '2026-03-15 12:23:11', '2026-03-15 12:23:11', NULL),
(230, 3, 52, 387, 13.50, 13.50, NULL, NULL, NULL, NULL, '2026-03-15 12:23:42', '2026-03-16 14:05:15', NULL),
(231, 3, 52, 380, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 12:24:06', '2026-03-16 14:05:30', NULL),
(232, 3, 52, 386, 11.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-15 12:24:38', '2026-03-16 14:03:31', NULL),
(233, 3, 52, 383, 15.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 12:25:10', '2026-03-16 14:06:18', NULL),
(234, 3, 52, 385, 16.00, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 12:25:34', '2026-03-15 12:25:34', NULL),
(235, 3, 52, NULL, 16.50, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 12:26:01', '2026-03-15 12:27:24', NULL),
(236, 4, 58, 353, 16.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-15 13:32:46', '2026-03-15 13:32:46', NULL),
(237, 4, 68, 353, 17.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 13:32:46', '2026-03-15 13:32:46', NULL),
(238, 4, 58, 354, 15.00, 11.50, NULL, NULL, NULL, NULL, '2026-03-15 13:37:03', '2026-03-15 13:37:03', NULL),
(239, 4, 68, 354, 15.00, 14.50, NULL, NULL, NULL, NULL, '2026-03-15 13:37:03', '2026-03-15 13:37:03', NULL),
(240, 4, 58, 355, 11.50, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 13:37:59', '2026-03-15 13:37:59', NULL),
(241, 4, 68, 355, 12.00, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 13:37:59', '2026-03-15 13:37:59', NULL),
(242, 4, 58, 357, 17.50, 12.50, NULL, NULL, NULL, NULL, '2026-03-15 13:40:49', '2026-03-15 13:40:49', NULL),
(243, 4, 68, 357, 16.75, 16.50, NULL, NULL, NULL, NULL, '2026-03-15 13:40:49', '2026-03-15 13:40:49', NULL),
(244, 4, 58, 356, 17.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-15 13:41:34', '2026-03-15 13:44:09', NULL),
(245, 4, 68, 356, 10.00, 13.50, NULL, NULL, NULL, NULL, '2026-03-15 13:41:34', '2026-03-15 13:44:09', NULL),
(246, 4, 58, 358, 13.00, 19.00, NULL, NULL, NULL, NULL, '2026-03-15 13:45:33', '2026-03-15 13:45:33', NULL),
(247, 4, 68, 358, 5.00, 14.00, NULL, NULL, NULL, NULL, '2026-03-15 13:45:33', '2026-03-15 13:45:33', NULL),
(248, 4, 58, 363, NULL, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 13:46:34', '2026-03-15 13:51:04', NULL),
(249, 4, 68, 363, NULL, 14.00, NULL, NULL, NULL, NULL, '2026-03-15 13:46:34', '2026-03-15 13:51:04', NULL),
(250, 4, 58, 362, 11.50, 16.00, NULL, NULL, NULL, NULL, '2026-03-15 13:51:45', '2026-03-15 14:00:58', NULL),
(251, 4, 68, 362, 12.50, 13.50, NULL, NULL, NULL, NULL, '2026-03-15 13:51:45', '2026-03-15 14:00:58', NULL),
(252, 4, 58, 364, 13.50, 11.00, NULL, NULL, NULL, NULL, '2026-03-15 13:58:55', '2026-03-15 13:58:55', NULL),
(253, 4, 68, 364, 16.00, 11.00, NULL, NULL, NULL, NULL, '2026-03-15 13:58:55', '2026-03-15 13:58:55', NULL),
(254, 4, 58, 360, 13.00, 10.25, NULL, NULL, NULL, NULL, '2026-03-15 14:02:14', '2026-03-15 14:02:42', NULL),
(255, 4, 68, 360, 15.00, 12.50, NULL, NULL, NULL, NULL, '2026-03-15 14:02:14', '2026-03-15 14:02:42', NULL),
(256, 4, 58, 359, 11.25, 15.00, NULL, NULL, NULL, NULL, '2026-03-15 14:03:55', '2026-03-15 14:16:43', NULL),
(257, 4, 68, 359, 15.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-15 14:03:55', '2026-03-15 14:16:43', NULL),
(258, 4, 58, 361, 14.00, 14.25, NULL, NULL, NULL, NULL, '2026-03-15 14:05:48', '2026-03-15 14:06:46', NULL),
(259, 4, 68, 361, 13.00, 12.00, NULL, NULL, NULL, NULL, '2026-03-15 14:05:48', '2026-03-15 14:06:46', NULL),
(260, 3, 75, 392, 14.50, 14.50, NULL, NULL, NULL, NULL, '2026-03-16 13:07:36', '2026-03-16 13:07:36', NULL),
(261, 3, 75, 391, 18.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-16 13:07:55', '2026-03-16 13:07:55', NULL),
(262, 3, 75, 397, 15.75, 15.75, NULL, NULL, NULL, NULL, '2026-03-16 13:08:22', '2026-03-16 13:08:22', NULL),
(263, 3, 75, 393, 18.00, 18.00, NULL, NULL, NULL, NULL, '2026-03-16 13:08:52', '2026-03-16 13:08:52', NULL),
(264, 3, 52, 378, 16.50, 16.50, NULL, NULL, NULL, NULL, '2026-03-16 18:33:07', '2026-03-16 18:33:07', NULL),
(265, 1, 72, 94, 13.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-25 12:15:21', '2026-03-25 12:15:21', NULL),
(266, 1, 72, 273, 13.00, 13.00, NULL, NULL, NULL, NULL, '2026-03-31 13:33:16', '2026-03-31 13:33:16', NULL),
(267, 1, 72, 93, 14.50, 14.50, NULL, NULL, NULL, NULL, '2026-03-31 13:33:36', '2026-03-31 13:33:36', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `name`, `email`, `whatsapp`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mvele', 'alphonsemvele95@gmail.com', '657316683', '657316683', 'Success', '2025-08-29 01:30:16', '2025-08-29 01:31:33'),
(2, 'alponse', 'a@gmail.com', '657316683', '657316683', 'Success', '2025-08-29 06:09:59', '2025-08-29 06:10:10');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `preinscriptions`
--

CREATE TABLE `preinscriptions` (
  `id` bigint(20) NOT NULL,
  `formation_name` varchar(20) NOT NULL,
  `cycle_id` bigint(20) DEFAULT NULL,
  `filiere_id` bigint(20) NOT NULL,
  `specialite_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `departement_id` bigint(20) NOT NULL,
  `arrondissement_id` bigint(20) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `father` varchar(255) NOT NULL,
  `mother` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('pending','Success','failed') NOT NULL,
  `isValidated` tinyint(1) NOT NULL DEFAULT 0,
  `birth_certificate` longtext DEFAULT NULL,
  `diploma` longtext DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `payment_status` enum('pending','Success','failed') NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `parrain_name` varchar(255) DEFAULT NULL,
  `parrain_contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `preinscriptions`
--

INSERT INTO `preinscriptions` (`id`, `formation_name`, `cycle_id`, `filiere_id`, `specialite_id`, `name`, `last_name`, `birth`, `region_id`, `departement_id`, `arrondissement_id`, `contact`, `email`, `father`, `mother`, `created_at`, `updated_at`, `status`, `isValidated`, `birth_certificate`, `diploma`, `ref`, `payment_status`, `price`, `whatsapp_number`, `parrain_name`, `parrain_contact`) VALUES
(48, 'ISM', 1, 50, 100, 'mvele ', 'alphonse loic', '2025-08-30', 2, 7, 14, '657316683', 'alphonsemvele95@gmail.com', 'mvele', 'alphonse', '2025-08-29 02:14:20', '2025-08-29 04:25:52', 'Success', 1, 'documents/eBvgz9hz1n0qeJyvZOLtmPGXq8JzXPr83i3MFzoc.pdf', 'documents/ma7PeYv3ZlNCgtcoof8eaYZPT07JuVEpPr7syH2B.pdf', 'ISM-000048', 'Success', 500000, NULL, NULL, NULL),
(49, 'ISM', 1, 50, 100, 'mvele ', 'alphonse loic', '2025-08-29', 8, 41, 93, '657316683', 'alphonsemvele95@gmail.com', 'mvele', 'alphonse', '2025-08-29 02:38:47', '2025-08-29 02:40:07', 'Success', 1, 'documents/bo5XcBzB6iTUlLAZWx8t8gszlT6xcWX9k31HQ7wK.pdf', 'documents/Niq5Y7k7KLghfEfaGVWgbkAzOrxFRJMHOgrk0DOg.pdf', 'ISM-000049', 'Success', 500000, NULL, NULL, NULL),
(50, 'IFPM', NULL, 52, 102, 'mvele ', 'alphonse loic', '2025-08-13', 7, 35, 80, '657316683', 'alphonsemvele95@gmail.com', 'mvele', 'alphonse', '2025-08-29 02:42:10', '2025-08-29 02:43:22', 'Success', 1, 'documents/Sm8g77BE0uaT3dAeQRdT6PQUpVfRi4kSw8ptwRKQ.pdf', 'documents/r5JIt7NjiRUdPSoYzm4yRKoTZjAQuYofdxF8muXH.pdf', 'IFPM-000050', 'Success', 500000, NULL, NULL, NULL),
(51, 'ISM', 1, 50, 100, 'mvele ', 'alphonse loic', '2025-08-20', 1, 2, 4, '657316683', 'alphonsemvele95@gmail.com', 'mvele', 'alphonse', '2025-08-29 06:21:21', '2025-08-29 06:25:43', 'Success', 1, 'documents/fyWYYEz0t7RvmKCV6FTmn1EosSltJgyBUElBjnQi.pdf', 'documents/RtCNXB2LfgH1VXjN2E7u9gE9zUHte7TrBlybuG51.pdf', 'ISM-000051', 'Success', 500000, NULL, NULL, NULL),
(52, 'IFPM', NULL, 52, 102, 'mvele ', 'alphonse loic', '2025-08-26', 7, 35, 80, '657316683', 'alphonsemvele95@gmail.com', 'mvele', 'alphonse', '2025-08-29 06:28:53', '2025-10-30 13:49:39', 'Success', 1, 'documents/RkMk8dqpPczkGP9qoUiEdWwkTf5B5JwvQp9xTyPV.pdf', 'documents/SR7pNzrlGqQC4Ew53LRr9SvieDPYc8B85CeuDoVu.pdf', 'IFPM-000052', 'Success', 500000, NULL, NULL, NULL),
(53, 'ISM', 1, 50, 100, 'MVELE', 'ALPHONSE LOIC', '2025-09-02', 1, 1, 1, 'Voluptas ut anim eum', 'alphonsemvele95@gmail.com', 'MVELE', 'ALPHONSE LOIC', '2025-09-04 09:25:43', '2025-10-30 13:48:44', 'Success', 1, 'documents/cq79HElPgmGJoGfilAMixy97QB4ShR7PichbOyKF.pdf', 'documents/XxHJ8uIWy5yHExISzhMiCn6lVPOESb4DyXQe89yk.pdf', 'ISM-000053', 'pending', 500000, '657316683', 'mvele', '657316683'),
(54, 'ISM', 1, 50, 100, 'Amery Henry', 'Osborne', '1979-08-07', 7, 34, 78, 'Aperiam eu quis ut t', 'nutepykavi@mailinator.com', 'Nisi iure possimus ', 'Sequi quo tenetur es', '2025-10-30 13:46:14', '2025-10-30 13:46:14', 'pending', 0, 'documents/d7R1ryU1JyDGd9CpoqCXK4iWGwpGFcOKDUZL6mua.pdf', 'documents/1QFrZNn8UDmCsyJlueBfyxi81liGpIOigfsPdGly.pdf', 'ISM-000054', 'pending', 500000, '95', 'Delilah Whitfield', 'Laboris dolore susci');

-- --------------------------------------------------------

--
-- Structure de la table `profil_salaires`
--

CREATE TABLE `profil_salaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `categorie_rh_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profil_salaires`
--

INSERT INTO `profil_salaires` (`id`, `nom`, `description`, `categorie_rh_id`, `actif`, `created_at`, `updated_at`) VALUES
(1, 'cadre', NULL, 2, 1, '2026-05-22 07:32:21', '2026-05-22 07:32:21'),
(2, 'cadre sup', NULL, 1, 1, '2026-05-22 07:32:45', '2026-05-22 07:32:45');

-- --------------------------------------------------------

--
-- Structure de la table `profil_salaire_indemnite`
--

CREATE TABLE `profil_salaire_indemnite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profil_salaire_id` bigint(20) UNSIGNED NOT NULL,
  `indemnite_id` bigint(20) UNSIGNED NOT NULL,
  `type_calcul` enum('fixe','pourcentage') NOT NULL DEFAULT 'fixe',
  `value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profil_salaire_indemnite`
--

INSERT INTO `profil_salaire_indemnite` (`id`, `profil_salaire_id`, `indemnite_id`, `type_calcul`, `value`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 'pourcentage', 12.00, '2026-05-22 07:32:45', '2026-05-22 07:32:45');

-- --------------------------------------------------------

--
-- Structure de la table `profil_salaire_retenue`
--

CREATE TABLE `profil_salaire_retenue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profil_salaire_id` bigint(20) UNSIGNED NOT NULL,
  `retenue_id` bigint(20) UNSIGNED NOT NULL,
  `type_calcul` enum('fixe','pourcentage') NOT NULL DEFAULT 'fixe',
  `value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapports`
--

CREATE TABLE `rapports` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `specialite_id` bigint(20) NOT NULL,
  `filiere_id` bigint(20) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `content` longtext NOT NULL,
  `title` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rapports`
--

INSERT INTO `rapports` (`id`, `user_id`, `specialite_id`, `filiere_id`, `status`, `created_at`, `updated_at`, `content`, `title`) VALUES
(1, 3, 104, 50, 'Success', '2026-02-13 03:37:08', '2026-02-13 03:39:14', 'rapports/wcF5PNkgfSfinVu7a253O1aDBC5g4Ya9uGyVNEb7.pdf', 'rapport semestre 1'),
(2, 28, 105, 50, 'Success', '2026-02-13 11:43:15', '2026-02-13 11:43:21', 'rapports/nH5KwD0owKxXPiDBrw48XI1D9NS7xQoqxtqOt64q.pdf', 'dfbebed');

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Adamaoua', NULL, NULL),
(2, 'Centre', NULL, NULL),
(3, 'Est', NULL, NULL),
(4, 'Extrême-Nord', NULL, NULL),
(5, 'Littoral', NULL, NULL),
(6, 'Nord', NULL, NULL),
(7, 'Nord-Ouest', NULL, NULL),
(8, 'Ouest', NULL, NULL),
(9, 'Sud', NULL, NULL),
(10, 'Sud-Ouest', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `retenues`
--

CREATE TABLE `retenues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `retenues`
--

INSERT INTO `retenues` (`id`, `libelle`, `description`, `actif`, `created_at`, `updated_at`) VALUES
(1, 'CNPS', 'Caisse Nationale de Prévoyance Sociale (4.2%)', 1, NULL, NULL),
(2, 'IRPP', 'Impôt sur le Revenu des Personnes Physiques', 0, NULL, '2026-05-22 07:25:18'),
(3, 'Mutuelle', 'Cotisation mutuelle de santé', 1, NULL, NULL),
(4, 'Crédit logement', 'Remboursement prêt logement', 1, NULL, NULL),
(5, 'qvqvqv', NULL, 1, '2026-05-22 07:25:10', '2026-05-22 07:25:10');

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

CREATE TABLE `salles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL,
  `filiere_id` bigint(20) NOT NULL,
  `specialite_id` bigint(20) NOT NULL,
  `cycle_id` bigint(20) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`id`, `name`, `capacite`, `filiere_id`, `specialite_id`, `cycle_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hyiyy', 3, 14, 14, 2, 'Success', '2025-08-23 18:23:55', '2025-08-23 18:53:09'),
(2, 'wdvqvqv', 2, 13, 14, 1, 'pending', '2025-08-23 18:32:39', '2025-08-23 18:32:39'),
(3, 'salle 1', 10, 14, 13, 2, 'pending', '2025-08-24 12:32:17', '2025-08-24 12:32:17');

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sections`
--

INSERT INTO `sections` (`id`, `name`, `abbreviation`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'intitut superieure la majestueuse de ndazoa', 'ISM', 'ISM', 'Success', '2025-09-04 11:52:51', '2025-09-04 11:52:51'),
(2, 'Institut de formation professionelle la MAJESTUEUSE', 'IFPM', 'IFPM', 'Success', '2025-09-04 11:53:44', '2025-09-04 11:53:52');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Nm01Us9gWUjDLfdCrrzci6FNrHsF1jIBwwuXW9hs', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjZ3TXdQNzZIT05vMEV0RHYzV2VBMFQ4MzVlZVVHV3VOZFd2YjdFZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1779438841);

-- --------------------------------------------------------

--
-- Structure de la table `specialites`
--

CREATE TABLE `specialites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filiere_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL DEFAULT 'pending',
  `price` int(11) NOT NULL DEFAULT 0,
  `responsable_id` bigint(20) DEFAULT NULL,
  `cycle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialites`
--

INSERT INTO `specialites` (`id`, `name`, `filiere_id`, `created_at`, `updated_at`, `status`, `price`, `responsable_id`, `cycle_id`) VALUES
(1, 'E-Commerce & Marketing Numérique', 1, '2026-02-19 10:27:50', '2026-02-19 10:44:04', 'Success', 0, NULL, 1),
(2, 'Réseaux & Sécurité', 2, '2026-02-19 10:27:50', '2026-02-19 10:44:07', 'Success', 0, NULL, 1),
(3, 'Industrie du Textile et l\'Habillement', 3, '2026-02-19 10:27:50', '2026-02-19 10:44:10', 'Success', 0, NULL, 1),
(4, 'Génie Culinaire', 4, '2026-02-19 10:27:50', '2026-02-19 10:44:12', 'Success', 0, NULL, 1),
(5, 'BTS Droit des Affaires et de l\'Entreprise', 5, '2026-02-19 10:27:50', '2026-02-19 10:44:15', 'Success', 0, NULL, 1),
(131, 'Agronomie', 77, '2026-02-26 22:15:16', '2026-02-26 22:15:16', 'Success', 0, 71, 2),
(133, 'Mecatronique', 82, '2026-03-02 10:07:50', '2026-03-06 12:45:22', 'Success', 0, 11, 1),
(134, 'Biologie clinique', 83, '2026-03-04 21:28:30', '2026-03-08 12:59:14', 'failed', 0, 20, 3),
(135, 'Boiler making & Welding', 84, '2026-03-04 21:35:28', '2026-03-04 21:35:28', 'Success', 0, 17, 1),
(136, 'Radiologie & Imagerie Médicale', 83, '2026-03-04 21:38:48', '2026-03-04 21:38:48', 'Success', 0, 20, 3),
(137, 'Kinésithérapie', 83, '2026-03-04 21:43:33', '2026-03-04 21:43:33', 'Success', 0, 20, 3),
(138, 'Soins infirmiers', 83, '2026-03-04 21:44:06', '2026-03-04 21:44:06', 'Success', 0, 20, 3),
(139, 'Sage Femme', 83, '2026-03-04 21:45:42', '2026-03-04 21:45:42', 'Success', 0, 20, 3),
(140, 'Stylisme', 3, '2026-03-04 22:02:25', '2026-03-08 13:04:25', 'failed', 0, 9, 1),
(141, 'Ressources Humaines', 81, '2026-03-04 22:06:47', '2026-03-04 22:06:47', 'Success', 0, 13, 1),
(142, 'Accounting', 91, '2026-03-10 22:24:21', '2026-03-11 23:34:16', 'Success', 0, 17, 3),
(143, 'Ressources Humaines', 92, '2026-03-10 22:43:54', '2026-03-10 22:43:54', 'Success', 0, 25, 2),
(144, 'Biologie clinique', 90, '2026-03-10 22:44:28', '2026-03-10 22:44:28', 'Success', 0, 20, 3),
(145, 'Géomètre Topographe', 93, '2026-03-16 11:23:32', '2026-03-16 11:23:32', 'Success', 0, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `supports`
--

CREATE TABLE `supports` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `supports`
--

INSERT INTO `supports` (`id`, `description`, `user_id`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 'un cable a ete retiré', 5, 'pending', '2025-08-24 06:43:43', '2025-08-24 06:43:43', 'TCK-2025-001'),
(2, 'ma machien nnn', 5, 'Success', '2025-08-24 12:28:41', '2025-08-24 12:29:11', 'TCK-2025-002');

-- --------------------------------------------------------

--
-- Structure de la table `ues`
--

CREATE TABLE `ues` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialite_id` bigint(20) DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `filiere_id` bigint(20) NOT NULL,
  `cycle_id` bigint(20) DEFAULT NULL,
  `formation_type` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `hour_number` int(11) DEFAULT NULL,
  `examen_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ues`
--

INSERT INTO `ues` (`id`, `name`, `specialite_id`, `status`, `created_at`, `updated_at`, `filiere_id`, `cycle_id`, `formation_type`, `code`, `credits`, `hour_number`, `examen_id`) VALUES
(1, 'Mathématiques pour l\'informatique I', 1, 'Success', '2026-02-19 10:27:50', '2026-03-01 14:56:27', 1, 1, NULL, 'CMN111', 5, 75, 1),
(2, 'Initiation à l’outil informatique I', 1, 'Success', '2026-02-19 10:27:50', '2026-03-04 14:17:48', 1, 1, NULL, 'CNM112', 4, 60, 1),
(3, 'Base de données et langage SQL', 1, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:45:54', 1, 1, NULL, 'CMN113', 4, 45, 1),
(4, 'Analyse et conception des systèmes d\'information I', 1, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:46:26', 1, 1, NULL, 'CMN114', 5, 45, 1),
(5, 'Introduction à la programmation WEB', 1, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:46:53', 1, 1, NULL, 'CMN115', 5, 105, 1),
(6, 'Gestion des petites entreprises', 1, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:47:23', 1, 1, NULL, 'CMN116', 4, 45, 1),
(7, 'Formation bilingue', 1, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:47:33', 1, 1, NULL, 'CMN117', 3, 45, 1),
(8, 'Mathématiques pour l\'informatique II', 1, 'Success', '2026-02-19 10:27:50', '2026-03-07 12:02:58', 1, 1, NULL, 'CMN121', 5, 60, NULL),
(9, 'Initiation à l’outil informatique II', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:30:05', 1, 1, NULL, 'CMN122', 4, 75, 0),
(10, 'Programmation orientée objet', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:30:24', 1, 1, NULL, 'CMN123', 6, 60, 0),
(11, 'Economie des TIC', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:30:47', 1, 1, NULL, 'CMN124', 4, 75, 0),
(12, 'Réglementation juridique/ Négociations informatiques', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:32:44', 1, 1, NULL, 'CMN125', 4, 75, 0),
(13, 'Management et stratégie de l’entreprise', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:34:12', 1, 1, NULL, 'CMN126', 4, 60, 0),
(14, 'Economie et Gestion des entreprises', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:37:23', 1, 1, NULL, 'CMN127', 3, 45, 0),
(15, 'Mathématiques appliquées et finance quantitative', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:46:12', 1, 1, NULL, 'CMN231', 5, 75, 0),
(16, 'Outils mathématiques liées au commerce', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:46:26', 1, 1, NULL, 'CMN232', 4, 60, 0),
(17, 'Technologie du E-commerce I', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:46:50', 1, 1, NULL, 'CMN233', 4, 60, 0),
(18, 'E-commerce', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 10:47:22', 1, 1, NULL, 'CMN234', 5, 75, 0),
(19, 'Marketing numérique I', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:01:43', 1, 1, NULL, 'CMN235', 5, 75, 0),
(20, 'Technologie ERP', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:02:13', 1, 1, NULL, 'CMN236', 4, 60, 0),
(21, 'Education citoyenne et déontologie professionnelle', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:02:51', 1, 1, NULL, 'CMN237', 3, 45, 0),
(22, 'Communication', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:04:17', 1, 1, NULL, 'CMN241', 4, 75, 0),
(23, 'Introduction à l’animation par ordinateur', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:04:49', 1, 1, NULL, 'CMN242', 5, 60, 0),
(24, 'Technologie du E-commerce II', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:05:21', 1, 1, NULL, 'CMN243', 3, 60, 0),
(25, 'Infrastructure technologique du E-commerce', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:05:59', 1, 1, NULL, 'CMN244', 4, 60, 0),
(26, 'Marketing numérique II', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:06:52', 1, 1, NULL, 'CMN245', 5, 60, 0),
(27, 'Stage professionnel', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:12:22', 1, 1, NULL, 'CMN246', 6, 90, 0),
(28, 'Entrepreneuriat et marketing appliqué aux disciplines', 1, 'Success', '2026-02-19 10:27:50', '2026-02-20 11:12:44', 1, 1, NULL, 'CMN247', 3, 45, 0),
(29, 'Outils scientifique de base I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 07:51:24', 2, 1, NULL, 'RES111', 4, 75, 1),
(30, 'Informatique et Physique I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 07:51:32', 2, 1, NULL, 'RES112', 5, 60, 1),
(31, 'Telecom I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 07:52:10', 2, 1, NULL, 'RES113', 5, 45, 1),
(32, 'Electronique I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:09:05', 2, 1, NULL, 'RES114', 5, 75, 1),
(33, 'Electronique de base I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:09:15', 2, 1, NULL, 'RES115', 3, 75, 1),
(34, 'Réseaux I', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:09:22', 2, 1, NULL, 'RES116', 5, 45, 1),
(35, 'Formation bilingue', 2, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:09:28', 2, 1, NULL, 'RES117', 3, 45, 1),
(36, 'Outils scientifiques de base II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:06:01', 2, 1, NULL, 'RES121', 4, 60, 0),
(37, 'Informatique et Physique II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:06:33', 2, 1, NULL, 'RES122', 5, 75, 0),
(38, 'Telecom II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:07:02', 2, 1, NULL, 'RES123', 3, 75, 0),
(39, 'Electronique II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:07:24', 2, 1, NULL, 'RES124', 5, 60, 0),
(40, 'Administration et Sécurité réseaux', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:07:56', 2, 1, NULL, 'RES125', 5, 60, 0),
(41, 'Technologie web II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:34:30', 2, 1, NULL, 'RES126', 5, 45, 0),
(42, 'Economie et Gestion des entreprises', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:34:51', 2, 1, NULL, 'RES127', 3, 45, 0),
(43, 'Outils scientifiques de base III', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:35:21', 2, 1, NULL, 'RES231', 4, 75, 0),
(44, 'Informatique et Physique III', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:35:49', 2, 1, NULL, 'RES232', 5, 60, 0),
(45, 'Téléphonie', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:36:09', 2, 1, NULL, 'RES233', 5, 60, 0),
(46, 'Telecoms III', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:36:33', 2, 1, NULL, 'RES234', 5, 75, 0),
(47, 'Réseaux et Technologies', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:36:55', 2, 1, NULL, 'RES235', 3, 75, 0),
(48, 'Administration et Sécurité II', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:37:52', 2, 1, NULL, 'RES236', 5, 60, 0),
(49, 'Education citoyenne et déontologie professionnelle', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:39:15', 2, 1, NULL, 'RES237', 3, 45, 0),
(50, 'Outils scientifiques de base IV', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:43:47', 2, 1, NULL, 'RES241', 4, 75, 0),
(51, 'Informatique et Physique IV', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:44:06', 2, 1, NULL, 'RES242', 5, 60, 0),
(52, 'Telecoms IV – Réseaux et Veille technologique', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:46:14', 2, 1, NULL, 'RES243', 5, 60, 0),
(53, 'Réseaux et Applications', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:44:48', 2, 1, NULL, 'RES244', 4, 60, 0),
(54, 'Réseaux mobiles et Sécurité', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:46:44', 2, 1, NULL, 'RES245', 4, 60, 0),
(55, 'Stage professionnel', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:50:27', 2, 1, NULL, 'RES246', 5, 90, 0),
(56, 'Entrepreneuriat et marketing', 2, 'Success', '2026-02-19 10:27:50', '2026-02-20 12:50:47', 2, 1, NULL, 'RES247', 3, 45, 0),
(58, 'Informatique et infographie', 3, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:11:56', 3, 1, NULL, 'IHA112', 4, 60, 1),
(59, 'Travaux pratiques de confection I', 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:10:02', 3, 1, NULL, 'IHA113', 5, 75, 1),
(60, 'Matériaux textile I et chimie du textile', 3, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:36:16', 3, 1, NULL, 'IHA114', 5, 90, 1),
(61, 'Démarche créative I', 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 12:16:50', 3, 1, NULL, 'IHA115', 3, 45, 1),
(62, 'Machine de confection et automatisme I', 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 12:17:08', 3, 1, NULL, 'IHA116', 4, 60, 1),
(63, 'Formation bilingue', 3, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:10:34', 3, 1, NULL, 'IHA117', 3, 45, 1),
(64, 'Mathématiques et physique', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA121', 4, 60, 0),
(65, 'Informatique et infographie S2', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA122', 5, 75, 0),
(66, 'Travaux pratiques de confection II', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA123', 5, 75, 0),
(67, 'Machines des textiles et bonneterie', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA124', 3, 45, 0),
(68, 'Ennoblissement I', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA125', 6, 90, 0),
(69, 'Matériaux textile II et chimie textile', 3, 'Success', '2026-02-19 10:27:50', '2026-03-09 23:35:54', 3, 1, NULL, 'IHA126', 4, 60, NULL),
(70, 'Économie et gestion des entreprises', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA127', 3, 45, 0),
(71, 'Stylisme modélisme', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA231', 4, 60, 0),
(72, 'Dessin technique et DAO', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA232', 5, 75, 0),
(73, 'Travaux pratiques de confection III', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA233', 5, 75, 0),
(74, 'Filature et tissage', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA234', 6, 90, 0),
(75, 'Ennoblissement II', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA235', 4, 60, 0),
(76, 'Dessin mécanique', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA236', 3, 45, 0),
(77, 'Éducation citoyenne et déontologie', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA237', 3, 45, 0),
(78, 'Sémiotique des produits de luxe', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA241', 4, 60, 0),
(79, 'Électricité, électronique et automatisme II', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA242', 5, 75, 0),
(80, 'Démarche créative II et modélisme DAO', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA243', 3, 45, 0),
(81, 'Organisation de l\'atelier', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA244', 4, 60, 0),
(82, 'Ennoblissement III', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA245', 5, 75, 0),
(83, 'Stage professionnel', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA246', 6, 90, 0),
(84, 'Entrepreneuriat et Marketing', 3, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 3, 1, NULL, 'IHA247', 3, 45, 0),
(85, 'Initiation au tourisme', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 10:14:56', 4, 1, NULL, 'HRE111', 4, 60, 1),
(86, 'Gestion hôtelière', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:40', 4, 1, NULL, 'HRE112', 5, 75, 1),
(87, 'Science appliquée', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:46', 4, 1, NULL, 'HRE113', 5, 75, 1),
(88, 'Technique d\'accueil et d\'hébergement', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:24', 4, 1, NULL, 'HRE114', 5, 75, 1),
(89, 'Informatique et communication professionnel', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:17', 4, 1, NULL, 'HRE115', 4, 60, 1),
(90, 'Technologies culinaires', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:10', 4, 1, NULL, 'HRE116', 4, 60, 1),
(91, 'Formation bilingue', 4, 'Success', '2026-02-19 10:27:50', '2026-03-05 23:50:04', 4, 1, NULL, 'HRE117', 3, 45, 1),
(92, 'Mathématiques', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:09', 4, 1, NULL, 'HRE121', 5, 75, 2),
(93, 'Droit et réglementation appliquée', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:17', 4, 1, NULL, 'HRE122', 4, 60, 2),
(94, 'Économie et gestion hôtelière', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:22', 4, 1, NULL, 'HRE123', 5, 75, 2),
(95, 'Sciences et technologies culinaires', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:29', 4, 1, NULL, 'HRE124', 5, 75, 2),
(96, 'Sciences et technologies des services', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:36', 4, 1, NULL, 'HRE125', 4, 60, 2),
(97, 'Enseignement scientifique alimentation-env.', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:53:59', 4, 1, NULL, 'HRE126', 4, 60, 2),
(98, 'Économie et gestion des entreprises', 4, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:53:52', 4, 1, NULL, 'HRE127', 3, 45, 2),
(99, 'Service et commercialisation en restauration', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC231', 5, 75, 0),
(100, 'Science appliquée à la restauration I', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC232', 4, 60, 0),
(101, 'Science appliquée à la restauration II', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC233', 5, 75, 0),
(102, 'Technologie de service', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC234', 5, 75, 0),
(103, 'Art culinaire', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC235', 4, 60, 0),
(104, 'Diététique alimentaire', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC236', 4, 60, 0),
(105, 'Éducation citoyenne et déontologie', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC237', 3, 45, 0),
(106, 'Mathématique et chimie', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC241', 5, 75, 0),
(107, 'Droit réglementation appliquée S4', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC241B', 5, 75, 0),
(108, 'Mercatique', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC242', 4, 60, 0),
(109, 'Technique de pâtisserie I', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC243', 5, 75, 0),
(110, 'Connaissances et techniques de bar I', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC244', 5, 75, 0),
(111, 'Connaissance des fromages et œnologie I', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC245', 4, 60, 0),
(112, 'Stage professionnel S4', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC246', 4, 60, 0),
(113, 'Entrepreneuriat et marketing S4', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC247', 3, 45, 0),
(114, 'Gestion de restaurant', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC351', 4, 60, 0),
(115, 'Relations humaines', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC352', 5, 75, 0),
(116, 'Technologie de restaurant II', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC353', 5, 75, 0),
(117, 'Techniques d\'hébergement', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC354', 5, 75, 0),
(118, 'Production culinaire et service', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC355', 4, 60, 0),
(119, 'Cuisines comparées', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC356', 4, 60, 0),
(120, 'Langues vivantes étrangères 1', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC357', 3, 45, 0),
(121, 'Économie et enjeux du tourisme', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC361', 4, 60, 0),
(122, 'Médiation culturelle', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC362', 5, 75, 0),
(123, 'Technique de pâtisserie II', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC363', 4, 60, 0),
(124, 'Connaissances et techniques de bar II', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC364', 4, 60, 0),
(125, 'Connaissance des fromages et œnologie II', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC365', 4, 60, 0),
(126, 'Stage professionnel S6', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC366', 6, 90, 0),
(127, 'Langues vivantes étrangères 2', 4, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 4, 1, NULL, 'GEC367', 3, 45, 0),
(128, 'Droit civil I et informatique', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:47', 5, 1, NULL, 'DAE111', 5, 75, 1),
(129, 'Droit commercial I', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 08:54:53', 5, 1, NULL, 'DAE112', 4, 60, 1),
(130, 'Droit et réglementation bancaire I', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:11:51', 5, 1, NULL, 'DAE113', 5, 75, 1),
(131, 'Droit des assurances', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:13:15', 5, 1, NULL, 'DAE114', 5, 75, 1),
(132, 'Institutions financières et finances publiques', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:12:05', 5, 1, NULL, 'DAE115', 4, 60, 1),
(133, 'Droit public I', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:12:13', 5, 1, NULL, 'DAE116', 4, 60, 1),
(134, 'Formation bilingue', 5, 'Success', '2026-02-19 10:27:50', '2026-03-06 09:12:20', 5, 1, NULL, 'DAE117', 2, 45, 1),
(135, 'Droit civil II', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE121', 5, 75, 0),
(136, 'Droit commercial II', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE122', 4, 60, 0),
(137, 'Droit public II', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE123', 4, 75, 0),
(138, 'Droit et réglementation bancaire II', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE124', 5, 75, 0),
(139, 'Droit du commerce international', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE125', 4, 60, 0),
(140, 'Comptabilité générale', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE126', 4, 60, 0),
(141, 'Économie et gestion des entreprises', 5, 'Success', '2026-02-19 10:27:50', '2026-02-19 10:45:12', 5, 1, NULL, 'DAE127', 3, 45, 0),
(143, 'Engineering Mathemetics I', 135, 'Success', '2026-03-06 11:36:15', '2026-03-06 11:36:15', 84, 1, NULL, 'UE-NMVZQ4', 5, NULL, 1),
(144, 'Engineer in the Society', 135, 'Success', '2026-03-06 11:37:00', '2026-03-06 11:37:00', 84, 1, NULL, 'UE-H6OOPH', 4, NULL, 1),
(145, 'Methods, Jigs and Fixtures', 135, 'Success', '2026-03-06 11:37:24', '2026-03-06 11:41:29', 84, 1, NULL, 'UE-14GES1', 4, NULL, 1),
(146, 'Practice of Welding', 135, 'Success', '2026-03-06 11:37:55', '2026-03-06 11:41:51', 84, 1, NULL, 'UE-N1KOII', 5, NULL, 1),
(147, 'Technology and Materials', 135, 'Success', '2026-03-06 11:38:21', '2026-03-06 11:42:34', 84, 1, NULL, 'UE-LS0CFY', 5, NULL, 1),
(148, 'Marking Out', 135, 'Success', '2026-03-06 11:39:17', '2026-03-06 11:39:17', 84, 1, NULL, 'UE-H60BTG', 4, NULL, 1),
(149, 'Bilingual Training', 135, 'Success', '2026-03-06 11:40:06', '2026-03-06 11:40:06', 84, 1, NULL, 'UE-CNLIQZ', 3, NULL, 1),
(150, 'Mathématiques et informatique I ', 141, 'Success', '2026-03-06 11:45:22', '2026-03-06 12:12:03', 81, 1, NULL, 'GRH111', 5, NULL, 1),
(151, 'Esthétique et philosophie de l\'art,introduction à l\'anthropologie de l\'art', 3, 'Success', '2026-03-06 12:12:20', '2026-03-06 12:12:20', 3, 1, NULL, 'UE-ZWQR5G', 5, NULL, 1),
(152, 'Techniques quantitatives de gestion I ', 141, 'Success', '2026-03-06 12:12:36', '2026-03-06 12:15:58', 81, 1, NULL, 'GRH112', 4, NULL, 1),
(153, 'Environnement juridique et comptable I ', 141, 'Success', '2026-03-06 12:16:28', '2026-03-06 12:18:43', 81, 1, NULL, 'GRH113', 4, NULL, 1),
(154, 'Relations humaines I ', 141, 'Success', '2026-03-06 12:16:57', '2026-03-06 12:18:55', 81, 1, NULL, 'GRH114', 5, NULL, 1),
(155, 'Relations professionnelles I ', 141, 'Success', '2026-03-06 12:17:22', '2026-03-06 12:19:09', 81, 1, NULL, 'GRH115', 4, NULL, 1),
(156, 'Organisation I ', 141, 'Success', '2026-03-06 12:17:46', '2026-03-06 12:19:46', 81, 1, NULL, 'GRH116', 5, NULL, 1),
(157, 'Formation bilingue ', 141, 'Success', '2026-03-06 12:18:10', '2026-03-06 12:19:58', 81, 1, NULL, 'GRH117', 3, NULL, 1),
(158, 'Mathématiques I', 133, 'Success', '2026-03-06 12:46:06', '2026-03-06 12:46:06', 82, 1, NULL, 'UE-UTEGTY', 4, NULL, 1),
(159, 'TIC I', 133, 'Success', '2026-03-06 12:46:36', '2026-03-06 12:46:36', 82, 1, NULL, 'UE-GTUJ0N', 5, NULL, 1),
(160, 'Bases en electronique', 133, 'Success', '2026-03-06 12:47:09', '2026-03-06 12:47:09', 82, 1, NULL, 'UE-IKGIPA', 3, NULL, 1),
(161, 'Notions de bases en mécanique et physique', 133, 'Success', '2026-03-06 12:48:05', '2026-03-06 12:48:05', 82, 1, NULL, 'UE-Q8DVNO', 6, NULL, 1),
(162, 'Développement du véhicule automobile et organes de châssis/carrosserie', 133, 'Success', '2026-03-06 12:48:58', '2026-03-06 12:48:58', 82, 1, NULL, 'UE-SNV8RY', 5, NULL, 1),
(163, 'Structure et fonctionnement du groupe Moto Propulseur(GMP)', 133, 'Success', '2026-03-06 12:49:53', '2026-03-06 12:49:53', 82, 1, NULL, 'UE-7S1AR7', 3, NULL, 1),
(164, 'Formation bilingue', 133, 'Success', '2026-03-06 12:50:26', '2026-03-06 12:50:26', 82, 1, NULL, 'UE-YHNUFR', 3, NULL, 1),
(165, 'Automatisme', 133, 'Success', '2026-03-06 12:50:53', '2026-03-06 12:50:53', 82, 1, NULL, 'UE-HHPDNN', 2, NULL, 1),
(166, 'Dessin technique II', 133, 'Success', '2026-03-06 12:54:06', '2026-03-11 09:04:51', 82, 1, NULL, 'UE-660IFF', 2, NULL, NULL),
(167, 'Anatomie physiologie 1 – Embryologie - Biologie de la reproduction', 139, 'Success', '2026-03-06 14:47:01', '2026-03-08 11:41:17', 83, 1, NULL, 'UE-MRITEP', 6, NULL, 1),
(168, 'Puériculture – Nutrition - Diététique ', 139, 'Success', '2026-03-06 14:47:30', '2026-03-08 11:41:20', 83, 1, NULL, 'UE-FYXXKB', 3, NULL, 1),
(169, 'Histoire de la profession des Sage-femmes - Éthique et déontologie professionnelle santé - Soins infirmiers de base ', 139, 'Success', '2026-03-06 14:50:44', '2026-03-08 11:41:22', 83, 1, NULL, 'UE-MNRNIO', 6, NULL, 1),
(170, 'Législation professionnelle – Système national de santé / Politique de santé – Microbiologie', 139, 'Success', '2026-03-06 14:56:48', '2026-03-08 11:41:25', 83, 1, NULL, 'UE-XNJRHC', 3, NULL, 1),
(171, 'Pharmacologie générale – Hématologie – Pathologie générale', 139, 'Success', '2026-03-06 14:57:28', '2026-03-08 11:41:28', 83, 1, NULL, 'UE-ASP9J5', 6, NULL, 1),
(172, 'Psychologie-sociologie – Éducation pour la santé – Prévention des infections', 139, 'Success', '2026-03-06 14:58:49', '2026-03-08 11:41:32', 83, 1, NULL, 'UE-VRJ7GW', 3, NULL, 1),
(173, 'Méthodes de travail - Langue officielle 1 - Techniques de l’information et de la communication 1', 139, 'Success', '2026-03-06 14:59:52', '2026-03-08 11:41:34', 83, 1, NULL, 'UE-C8DWE7', 3, NULL, 1),
(176, 'Anatomie – Physiologie I – Biologie cellulaire – Histologie – Chimie générale', 138, 'Success', '2026-03-08 12:52:18', '2026-03-08 12:52:18', 83, 1, NULL, 'UE-KFP6RB', 6, NULL, 1),
(177, 'Microbiologie I : Bactériologie – Parasitologie – Biochimie', 138, 'Success', '2026-03-08 12:53:24', '2026-03-08 12:53:24', 83, 1, NULL, 'UE-BMLK2R', 3, NULL, 1),
(178, 'Sociologie – anthropologie et psychologie médicale', 138, 'Success', '2026-03-08 12:55:28', '2026-03-08 12:55:28', 83, 1, NULL, 'UE-ZMZXP9', 6, NULL, 1),
(179, 'Fondement de la science infirmière I : concepts et théories en sciences infirmières', 138, 'Success', '2026-03-08 12:56:48', '2026-03-08 12:56:48', 83, 1, NULL, 'UE-8S2SCK', 2, NULL, 1),
(180, 'Histoire de la profession infirmière - cycle de vie', 138, 'Success', '2026-03-08 12:57:39', '2026-03-08 12:57:39', 83, 1, NULL, 'UE-F2U4WH', 3, NULL, 1),
(181, 'Stage clinique I', 138, 'Success', '2026-03-08 12:58:15', '2026-03-08 12:58:15', 83, 1, NULL, 'UE-KPQP1V', 6, NULL, 1),
(182, 'Français médical – Anglais médical - TIC', 138, 'Success', '2026-03-08 12:58:44', '2026-03-08 12:58:44', 83, 1, NULL, 'UE-F16KQ3', 3, NULL, 1),
(183, 'Biologie cellulaire – histologie – Anatomie Physiologie I', 137, 'Success', '2026-03-08 14:12:13', '2026-03-08 14:12:13', 83, 1, NULL, 'UE-DSPNR4', 7, NULL, 1),
(184, 'Neurophysiologie – Kinésiologie – Chimie générale', 137, 'Success', '2026-03-08 14:12:42', '2026-03-08 14:12:42', 83, 1, NULL, 'UE-GZUFRZ', 2, NULL, 1),
(185, 'Psychologie – Sociologie – Anthropologie générale – Histoire de la Kinésithérapie', 137, 'Success', '2026-03-08 14:13:24', '2026-03-08 14:13:24', 83, 1, NULL, 'UE-C6NZU3', 4, NULL, 1),
(186, 'Méthodologie générale de la Kinésithérapie et de la réadaptation I', 137, 'Success', '2026-03-08 14:14:18', '2026-03-08 14:14:18', 83, 1, NULL, 'UE-EWYXE6', 5, NULL, 1),
(187, 'Maladies infectieuses et parasitaires ', 137, 'Success', '2026-03-08 14:15:10', '2026-03-08 14:15:10', 83, 1, NULL, 'UE-YVXRBO', 5, NULL, 1),
(188, 'Activités motrices et adaptation y compris la psychomotricité – Éthique et déontologie professionnelle', 137, 'Success', '2026-03-08 14:15:56', '2026-03-08 14:15:56', 83, 1, NULL, 'UE-BBTWC5', 4, NULL, 1),
(189, 'Français médical – Anglais médical – NTIC I', 137, 'Success', '2026-03-08 14:16:33', '2026-03-08 14:16:33', 83, 1, NULL, 'UE-LELIN7', 3, NULL, 1),
(190, 'Chimie - physique', 136, 'Success', '2026-03-08 14:17:25', '2026-03-08 14:17:25', 83, 1, NULL, 'UE-QHTGQI', 5, NULL, 1),
(191, 'Electronique', 136, 'Success', '2026-03-08 14:17:53', '2026-03-08 14:17:53', 83, 1, NULL, 'UE-ZZXMGT', 4, NULL, 1),
(192, 'Mathématiques - statistiques', 136, 'Success', '2026-03-08 14:19:13', '2026-03-08 14:19:13', 83, 1, NULL, 'UE-GEI7Z0', 5, NULL, 1),
(193, 'Anatomie radiologie', 136, 'Success', '2026-03-08 14:19:55', '2026-03-08 14:19:55', 83, 1, NULL, 'UE-LAD4MK', 4, NULL, 1),
(194, 'Physiques des radiations de la résonance magnétique des ultrasons et physique nucléaire, Anatomie physiologie et générale', 136, 'Success', '2026-03-08 14:20:36', '2026-03-08 14:20:36', 83, 1, NULL, 'UE-HPDO7N', 5, NULL, 1),
(195, 'Biologie - Biochimie - Microbiologie', 136, 'Success', '2026-03-08 14:21:06', '2026-03-08 14:21:06', 83, 1, NULL, 'UE-5AM11J', 4, NULL, 1),
(196, 'Méthodes de travail, Formation bilingue I, Techniques de l’information et de la communication I', 136, 'Success', '2026-03-08 14:21:41', '2026-03-08 14:21:41', 83, 1, NULL, 'UE-JGQNG0', 4, NULL, 1),
(197, 'DESSIN TECHNIQUE I', 133, 'Success', '2026-03-09 13:16:05', '2026-03-09 13:16:05', 82, 1, NULL, 'UE-XYXKDH', 2, NULL, 1),
(198, 'Introduction à l\'analyse et à l\'algèbre', 131, 'Success', '2026-03-11 06:01:06', '2026-03-11 06:01:06', 77, 2, NULL, 'UE-GKTHHW', 6, NULL, 1),
(199, 'Mécanique du point et du solide et acoustique', 131, 'Success', '2026-03-11 06:01:52', '2026-03-11 06:01:52', 77, 2, NULL, 'UE-ZTKV5L', 6, NULL, 1),
(200, 'Chimie générale et biochimie', 131, 'Success', '2026-03-11 06:02:23', '2026-03-11 06:02:23', 77, 2, NULL, 'UE-B2IWCW', 6, NULL, 1),
(201, 'Géologie et biologie générale', 131, 'Success', '2026-03-11 06:02:51', '2026-03-11 06:02:51', 77, 2, NULL, 'UE-X6IPYM', 6, NULL, 1),
(202, 'Education à la citoyenneté et EPS', 131, 'Success', '2026-03-11 06:03:24', '2026-03-11 06:03:24', 77, 2, NULL, 'UE-ANHALC', 3, NULL, 1),
(203, 'Formation Bilingue et pratiques Professionnelles 1', 131, 'Success', '2026-03-11 06:04:00', '2026-03-11 06:04:00', 77, 2, NULL, 'UE-EOQCJV', 3, NULL, 1),
(204, 'Environnement économique et social ', 143, 'Success', '2026-03-11 17:14:04', '2026-03-11 17:18:04', 92, 2, NULL, 'UE-5ZAOM7', 7, NULL, 4),
(205, 'Gestion des emplois et valorisation des RH ', 143, 'Success', '2026-03-11 17:19:01', '2026-03-11 17:19:01', 92, 2, NULL, 'UE-YMEKUX', 7, NULL, 4),
(206, 'Techniques de Gestion des RH ', 143, 'Success', '2026-03-11 17:19:34', '2026-03-11 17:19:34', 92, 2, NULL, 'UE-IL4OLA', 9, NULL, 4),
(207, 'Outils de Gestion des Ressources Humaines', 143, 'Success', '2026-03-11 17:43:40', '2026-03-11 19:32:00', 92, 2, NULL, 'UE-ULJHFT', 7, NULL, 4),
(208, 'Advanced taxation', 142, 'Success', '2026-03-11 22:30:06', '2026-03-11 22:30:06', 91, 3, NULL, 'UE-XC6S8A', 6, NULL, 3),
(209, 'Advanced ohada financial accounting ', 142, 'Success', '2026-03-11 22:30:54', '2026-03-11 22:30:54', 91, 3, NULL, 'UE-SP8B5B', 6, NULL, 3),
(210, 'Internal auditing and corperate governance', 142, 'Success', '2026-03-11 22:36:15', '2026-03-11 22:36:15', 91, 3, NULL, 'UE-ZFJSEB', 6, NULL, 3),
(211, 'Advanced researsh methodology', 142, 'Success', '2026-03-11 22:55:00', '2026-03-11 22:55:00', 91, 3, NULL, 'UE-5ZPJ29', 6, NULL, 3),
(212, 'Advanced management accounting and control', 142, 'Success', '2026-03-11 23:19:15', '2026-03-11 23:19:15', 91, 3, NULL, 'UE-UUXUZT', 6, NULL, 3),
(213, 'Promotion of social and associative leisure', 142, 'Success', '2026-03-11 23:20:23', '2026-03-11 23:20:23', 91, 3, NULL, 'UE-LBSQEC', 6, NULL, 3),
(214, 'Accounting for specuific organisation ', 142, 'Success', '2026-03-11 23:23:11', '2026-03-11 23:23:11', 91, 3, NULL, 'UE-WJOUNN', 6, NULL, 3),
(215, 'Advanced cost accounting ', 142, 'Success', '2026-03-11 23:24:31', '2026-03-11 23:24:31', 91, 3, NULL, 'UE-T34TOB', 6, NULL, 3),
(216, 'Advanced quantitative analysis ', 142, 'Success', '2026-03-11 23:28:24', '2026-03-11 23:28:24', 91, 3, NULL, 'UE-NJSMIP', 6, NULL, 3),
(217, 'Computer aided accounting', 142, 'Success', '2026-03-11 23:28:47', '2026-03-11 23:28:47', 91, 3, NULL, 'UE-GPYC2X', 6, NULL, 3),
(218, 'Principles of accounting', 142, 'Success', '2026-03-11 23:29:21', '2026-03-11 23:29:21', 91, 3, NULL, 'UE-52ARAA', 6, NULL, 3),
(219, 'Gestion de laboratoire', 144, 'Success', '2026-03-12 19:44:33', '2026-03-16 14:10:11', 90, 3, NULL, 'MBC 111', 6, NULL, 3),
(220, 'Santé publique 1', 144, 'Success', '2026-03-12 19:47:59', '2026-03-16 14:12:01', 90, 3, NULL, 'MBC 121', 6, NULL, 3),
(221, 'Santé publique 2', 144, 'Success', '2026-03-12 19:55:21', '2026-03-16 14:13:43', 90, 3, NULL, 'MBC 131', 6, NULL, 3),
(222, 'Santé publique 3', 144, 'Success', '2026-03-12 19:55:43', '2026-03-16 14:14:33', 90, 3, NULL, 'MBC 141', 6, NULL, 3),
(223, 'Santé publique 4', 144, 'Success', '2026-03-12 19:56:31', '2026-03-16 15:05:25', 90, 3, NULL, 'MBC 151', 6, NULL, 3),
(224, 'Droit du travail', 144, 'pending', '2026-03-12 19:56:53', '2026-03-16 18:33:35', 90, 3, NULL, 'UE-IACZZ2', 0, NULL, 3),
(225, 'Instruments et méthodes 4 ', 145, 'Success', '2026-03-16 11:30:49', '2026-03-16 11:30:49', 93, 3, NULL, 'UE-CM8JDL', 6, NULL, 3),
(226, 'Système d’information géographique 3 et géodésie 2 ', 145, 'Success', '2026-03-16 11:31:23', '2026-03-16 11:31:23', 93, 3, NULL, 'UE-GLJ9HH', 6, NULL, 3),
(227, 'Topographie 4', 145, 'Success', '2026-03-16 11:34:10', '2026-03-16 13:06:08', 93, 3, NULL, 'UE-L9YKDS', 7, NULL, NULL),
(228, 'Droit de l’urbanisme, droit foncier 2 et droit général 2', 145, 'Success', '2026-03-16 11:44:44', '2026-03-16 11:44:44', 93, 3, NULL, 'UE-98XBZD', 3, NULL, 3),
(229, 'Stage', 144, 'Success', '2026-03-16 14:07:30', '2026-03-16 14:07:30', 90, 3, NULL, 'UE-YCLQSD', 2, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profil_salaire_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categorie_rh_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('student','personnel','filiere','specialite','admin','enseignant','concierge','bibliothecaire','coordonnateur') NOT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `filiere_id` bigint(20) DEFAULT NULL,
  `specialite_id` bigint(20) DEFAULT NULL,
  `cycle_id` bigint(20) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `arrondissement_id` bigint(20) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `status` enum('pending','Success','failed') NOT NULL,
  `formation_type` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_contact` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_contact` varchar(255) DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `entite` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cropped_photo` varchar(255) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `profil_salaire_id`, `categorie_rh_id`, `created_at`, `updated_at`, `role`, `matricule`, `lastname`, `contact`, `filiere_id`, `specialite_id`, `cycle_id`, `picture`, `region_id`, `department_id`, `arrondissement_id`, `whatsapp`, `status`, `formation_type`, `father_name`, `father_contact`, `mother_name`, `mother_contact`, `poste`, `entite`, `photo`, `cropped_photo`, `section_id`, `departement_id`) VALUES
(2, 'Admin', 'admin@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', 'UAO1ffvtu2gbZNPH6NMuIElXcYW4tNMUXWBRIx4ubNoR9ioB4DlegsHJ1BTY', NULL, NULL, NULL, NULL, 'admin', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'OWONO KOUMA', 'kouma.auguste@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500001', 'Auguste', '', 50, 104, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'directeur_ism', 'ISM', NULL, NULL, NULL, NULL),
(4, 'ATEBA MANE', 'mariette.ateba@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500003', 'Mariette', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'dir_aaf', 'ISM', NULL, NULL, NULL, NULL),
(5, 'OLEME SALLA', 'steve.oleme@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500004', 'Steve Ghislain', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'dir_aac', 'ISM', NULL, NULL, NULL, NULL),
(6, 'EBOGO', 'dora.ebogo@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500005', 'Dora', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'dir_rh', 'ISM', NULL, NULL, NULL, NULL),
(7, 'ESSINDI BISSA', 'mireille.essindi@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500006', 'Mireille Dominique', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'dir_marketing', 'ISM', NULL, NULL, NULL, NULL),
(8, 'ATEBA MIMFOUMOU', 'haverie.ateba@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, 1, NULL, '2026-02-12 20:02:42', '2026-05-22 07:33:35', 'coordonnateur', 'ISM2500007', 'Haverie Ghislaine', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_sante', 'ISM', NULL, NULL, NULL, NULL),
(9, 'BIKIE Epouse NGATCHA', 'jeanne.bikie@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, 1, NULL, '2026-02-12 20:02:42', '2026-05-22 07:33:35', 'coordonnateur', 'ISM2500008', 'Jeanne Nicole', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_industrie', 'ISM', NULL, NULL, NULL, NULL),
(10, 'ATANGANA FUDA', 'christophe.atangana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, 1, NULL, '2026-02-12 20:02:42', '2026-05-22 07:33:35', 'coordonnateur', 'ISM2500009', 'Christophe Patrick', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_info', 'ISM', NULL, NULL, NULL, NULL),
(11, 'MBE KOKOUA', 'chamberlin.mbe@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500010', 'Chamberlin', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'daf_ifpm', 'IFPM', NULL, NULL, NULL, NULL),
(12, 'EDZANGA', 'bienvenu.edzanga@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500011', 'Bienvenu Joseph', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_genie_info', 'ISM', NULL, NULL, NULL, NULL),
(13, 'ESSOMBA', 'francois.essomba@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500012', 'François Désiré', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'comptable', 'ISM', NULL, NULL, NULL, NULL),
(14, 'NGO BOUSNOUM', 'suzanne.ngo@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500013', 'Suzanne Berthe', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'secretaire_scolarite', 'IFPM', NULL, NULL, NULL, NULL),
(15, 'NGATABI', 'veronique.ngatabi@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500014', 'Véronique Epouse MOBITANG', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'agent_scolarite', 'ISM', NULL, NULL, NULL, NULL),
(16, 'MAH NNANGONO', 'hubert.mah@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'admin', 'ISM2500015', 'Hubert Emmanuel', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'directeur_ifpm', 'IFPM', NULL, NULL, NULL, NULL),
(17, 'ESSOMBA FOUDA', 'magloire.essomba@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500016', 'Simplice Magloire', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_hnd', 'ISM', NULL, NULL, NULL, NULL),
(18, 'NOA', 'josephine.nda@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500017', 'Josephine Didier Natacha', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_tourisme_resto', 'ISM', NULL, NULL, NULL, NULL),
(19, 'NDI RIWENTI', 'ndi.riwenti@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500018', 'Dr', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_adj_sante', 'ISM', NULL, NULL, NULL, NULL),
(20, 'EFFA BITANGA', 'michel.eyenga@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500019', 'Davy Michel', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'medecin_referent', 'ISM', NULL, NULL, NULL, NULL),
(21, 'ILIASSA', 'andre.iliassa@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500020', 'André', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'gestionnaire_stocks', 'ISM', NULL, NULL, NULL, NULL),
(22, 'EPGA', 'epga@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'concierge', 'ISM2500021', 'Dr', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'chef_entretien', 'ISM', NULL, NULL, NULL, NULL),
(23, 'ESSANA MVONDO', 'lucresse.essama@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'personnel', 'ISM2500023', 'Lucresse', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'agent_scolarite', 'ISM', NULL, NULL, NULL, NULL),
(24, 'MAYOUGOUNG', 'mayougoung@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 20:02:42', '2026-02-12 20:02:42', 'coordonnateur', 'ISM2500024', 'Dr', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, 'coord_droit', 'ISM', NULL, NULL, NULL, NULL),
(25, 'MVELE', 'alphonsemvele95@gmail.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-12 19:51:44', '2026-02-12 20:24:03', 'enseignant', 'ENS-GIUTVL', 'Alphonse', '695008965', 50, 104, NULL, NULL, NULL, NULL, NULL, '+237695008965', 'Success', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
(50, 'Rania Marie Albert', 'rania.abougoumvom@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-09 13:38:03', 'student', 'AGR25-000001', 'ABOUGOU MVOM', '653109913', 77, 131, 2, NULL, NULL, NULL, NULL, '', 'pending', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 49),
(51, 'Freddy', 'freddy.ondoabindzi@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-09 13:38:06', 'student', 'AGR25-000002', 'ONDOA BINDZI', '697593853', 77, 131, 2, NULL, NULL, NULL, NULL, '', 'pending', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 49),
(52, 'Lisa Kathryn', 'lisa.biloamonty@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-15 05:35:30', 'student', 'BIOC25-000001', 'BILOA MONTY', '697593853', 90, 144, 3, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 59),
(53, 'Dieudonné Ken', 'dieudonne.onana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-02-26 14:45:11', 'student', 'DAE25-000001', 'ONANA ONANA', '690369542', 5, 5, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 4),
(54, 'Emmanuel Dimitry', 'emmanuel.ngoundousoh@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:30:36', 'student', 'CHAU25-000001', 'NGOUNDOU SOH', '692946830', 84, 135, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 53),
(55, 'Joseph Junior', 'joseph.etoundionana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-02-23 09:09:12', 'student', 'CHAU25-000002', 'ETOUNDI ONANA', '690369507', 1, 1, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1),
(56, 'Cyprienne', 'cyprien.ndzana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-02-23 09:09:29', 'student', 'ECM25-000001', 'NDZANA', '676382198', 1, 1, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1),
(57, 'Bernadette Grace', 'bernadette.mbida@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-08 13:13:52', 'student', 'GI25-000001', 'MBIDA', '694210636', 81, 141, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 50),
(58, 'Danielle', 'danielle.zambou@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-15 12:48:44', 'student', 'GRH25-000001', 'ZAMBOU', '687759421', 92, 143, 2, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 62),
(59, 'Patricia Suzanne', 'patricia.ngoon@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:51:02', 'student', 'HOTE25-000001', 'NGOON', '657567966', 4, 4, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 3),
(60, 'Christine Lafleur', 'christine.ngombog@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:50:46', 'student', 'HRT25-000001', 'NGO MBOG', '698778289', 4, 4, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 3),
(61, 'Alice Christiane', 'alice.makwegninzali@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:50:24', 'student', 'TOUR25-000001', 'MAKWEGNI NZALI', '659898084', 3, 3, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 2),
(62, 'Nathalie Audrey', 'nathalie.benehassan@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:50:04', 'student', 'INDH25-000001', 'BENE HASSAN', '655058724', 3, 3, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 2),
(63, 'Armelle Kenny', 'armelle.mfonoella@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:49:36', 'student', 'STYL25-000001', 'MFONO ELLA', '696324363', 83, 137, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 52),
(64, 'Philomène', 'philomene.mindjonembolo@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:41:09', 'student', 'KINE25-000001', 'MINDJON EMBOLO', '677777723', 83, 139, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 52),
(65, 'Adèle Gaëtanie', 'adele.kwala@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:40:35', 'student', 'SFEM25-000001', 'KWALA', '677777737', 83, 136, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 52),
(66, 'Moise', 'moise.noahbessala@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:33:02', 'student', 'STBM25-000001', 'NOAH BESSALA', '696379747', 82, 133, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 51),
(67, 'Murielle', 'murielle.ntsamaolana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-15 05:36:57', 'student', 'INF25-000001', 'NTSAMA OLANA', '677285524', 91, 142, 3, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 57),
(68, 'Siméon', 'simeon.beyegue@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-15 12:45:57', 'student', 'ACC25-000001', 'BEYEGUE', '656653423', 92, 143, 2, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 62),
(69, 'Claire', 'claire.mballaatangana@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-15 13:17:52', 'student', 'GRH25-000002', 'MBALLA ATANGANA', '657760867', 92, 143, 2, NULL, NULL, NULL, NULL, '', 'pending', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 62),
(70, 'Emmanuelle', 'emmanuelle.kanse@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-20 08:47:14', '2026-03-04 22:32:09', 'student', 'GRH25-000003', 'KANSE', '676744678', 83, 138, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 52),
(71, 'YEMELI Edouard', 'yemeli.edouard@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-02-26 19:55:35', '2026-02-26 19:58:10', 'filiere', NULL, NULL, '+237670380013', 76, NULL, 2, NULL, NULL, NULL, NULL, NULL, 'Success', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'NZIE EBANGA', 'xyz@gmail.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-03-06 23:14:23', '2026-03-06 23:14:45', 'student', 'ETU-JTZ3TB', 'Séraphine', '+237 6 87 83 34 86', 2, 2, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1),
(73, 'NDJENEG MIMB', 'augustin@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-03-09 12:38:49', '2026-03-09 12:40:02', 'student', 'ETU-PBPB1Q', 'AUGUSTIN', '111111111', 83, 138, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 52),
(74, 'ATANGANA BILONG', 'yzx@gmail.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-03-09 15:31:31', '2026-03-09 22:55:59', 'student', 'ETU-6BVSRW', 'Irene', '678874598', 3, 3, 1, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 2),
(75, 'AYONGABA', 'ayongaba.francois@ism-ndazoa.com', NULL, '$2y$12$GCFtgzno1IZqdWrYtmWKVueiDxIWTKhgayc1ewNt7YfazZh2SV8z6', NULL, NULL, NULL, '2026-03-16 11:25:28', '2026-03-16 11:29:34', 'student', 'ETU-WLWOYR', 'François', '678154236', 93, 145, 3, NULL, NULL, NULL, NULL, '', 'Success', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 61);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arrondissements_department_id_foreign` (`department_id`);

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `book_users`
--
ALTER TABLE `book_users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `categories_rh`
--
ALTER TABLE `categories_rh`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `configurationsections`
--
ALTER TABLE `configurationsections`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cycles`
--
ALTER TABLE `cycles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_region_id_foreign` (`region_id`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `examens`
--
ALTER TABLE `examens`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filieres_cycle_id_foreign` (`cycle_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `indemnites`
--
ALTER TABLE `indemnites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menu_days`
--
ALTER TABLE `menu_days`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_note` (`examen_id`,`etudiant_id`,`cours_id`),
  ADD KEY `notes_etudiant_id_foreign` (`etudiant_id`),
  ADD KEY `notes_cours_id_foreign` (`cours_id`),
  ADD KEY `notes_validee_par_foreign` (`validee_par`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `preinscriptions`
--
ALTER TABLE `preinscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profil_salaires`
--
ALTER TABLE `profil_salaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_profil_categorie` (`categorie_rh_id`);

--
-- Index pour la table `profil_salaire_indemnite`
--
ALTER TABLE `profil_salaire_indemnite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_psi_profil` (`profil_salaire_id`),
  ADD KEY `fk_psi_indemnite` (`indemnite_id`);

--
-- Index pour la table `profil_salaire_retenue`
--
ALTER TABLE `profil_salaire_retenue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_psr_profil` (`profil_salaire_id`),
  ADD KEY `fk_psr_retenue` (`retenue_id`);

--
-- Index pour la table `rapports`
--
ALTER TABLE `rapports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `retenues`
--
ALTER TABLE `retenues`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `salles`
--
ALTER TABLE `salles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `specialites`
--
ALTER TABLE `specialites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialites_filiere_id_foreign` (`filiere_id`);

--
-- Index pour la table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ues`
--
ALTER TABLE `ues`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_user_profil_salaire` (`profil_salaire_id`),
  ADD KEY `fk_user_categorie_rh` (`categorie_rh_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `book_users`
--
ALTER TABLE `book_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categories_rh`
--
ALTER TABLE `categories_rh`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `configurationsections`
--
ALTER TABLE `configurationsections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT pour la table `cycles`
--
ALTER TABLE `cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `examens`
--
ALTER TABLE `examens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filieres`
--
ALTER TABLE `filieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `indemnites`
--
ALTER TABLE `indemnites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `menu_days`
--
ALTER TABLE `menu_days`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `preinscriptions`
--
ALTER TABLE `preinscriptions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `profil_salaires`
--
ALTER TABLE `profil_salaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `profil_salaire_indemnite`
--
ALTER TABLE `profil_salaire_indemnite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `profil_salaire_retenue`
--
ALTER TABLE `profil_salaire_retenue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rapports`
--
ALTER TABLE `rapports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `retenues`
--
ALTER TABLE `retenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `salles`
--
ALTER TABLE `salles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `specialites`
--
ALTER TABLE `specialites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT pour la table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ues`
--
ALTER TABLE `ues`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD CONSTRAINT `arrondissements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD CONSTRAINT `filieres_cycle_id_foreign` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_cours_id_foreign` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notes_etudiant_id_foreign` FOREIGN KEY (`etudiant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_examen_id_foreign` FOREIGN KEY (`examen_id`) REFERENCES `examens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_validee_par_foreign` FOREIGN KEY (`validee_par`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `profil_salaires`
--
ALTER TABLE `profil_salaires`
  ADD CONSTRAINT `fk_profil_categorie` FOREIGN KEY (`categorie_rh_id`) REFERENCES `categories_rh` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `profil_salaire_indemnite`
--
ALTER TABLE `profil_salaire_indemnite`
  ADD CONSTRAINT `fk_psi_indemnite` FOREIGN KEY (`indemnite_id`) REFERENCES `indemnites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_psi_profil` FOREIGN KEY (`profil_salaire_id`) REFERENCES `profil_salaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `profil_salaire_retenue`
--
ALTER TABLE `profil_salaire_retenue`
  ADD CONSTRAINT `fk_psr_profil` FOREIGN KEY (`profil_salaire_id`) REFERENCES `profil_salaires` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_psr_retenue` FOREIGN KEY (`retenue_id`) REFERENCES `retenues` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `specialites`
--
ALTER TABLE `specialites`
  ADD CONSTRAINT `specialites_filiere_id_foreign` FOREIGN KEY (`filiere_id`) REFERENCES `filieres` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_categorie_rh` FOREIGN KEY (`categorie_rh_id`) REFERENCES `categories_rh` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_user_profil_salaire` FOREIGN KEY (`profil_salaire_id`) REFERENCES `profil_salaires` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
