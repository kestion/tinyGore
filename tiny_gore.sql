-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Ven 26 Octobre 2012 à 08:32
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `tiny_gore`
--

-- --------------------------------------------------------

--
-- Structure de la table `tg_consummables`
--

CREATE TABLE IF NOT EXISTS `tg_consummables` (
  `consum_id` int(11) NOT NULL AUTO_INCREMENT,
  `consum_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `consum_price` int(11) NOT NULL,
  `consum_description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `consum_icon` int(11) NOT NULL DEFAULT '0',
  `consum_type` enum('action','food','health','hygiene','happiness','energy') COLLATE latin1_general_ci NOT NULL,
  `consum_min_level` int(11) NOT NULL DEFAULT '0',
  `food` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `hygiene` int(11) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `energy` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  PRIMARY KEY (`consum_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=15 ;

--
-- Contenu de la table `tg_consummables`
--

INSERT INTO `tg_consummables` (`consum_id`, `consum_name`, `consum_price`, `consum_description`, `consum_icon`, `consum_type`, `consum_min_level`, `food`, `hp`, `hygiene`, `happiness`, `energy`, `exp`) VALUES
(1, 'Honey and leeks crepes', 5, 'A soft and sugary crepe, straight from France, with love', 2, 'food', 0, 30, 1, 1, NULL, -2, 2),
(2, 'Kiss', 0, 'Mouah!', 4, 'action', 0, NULL, NULL, NULL, 10, NULL, NULL),
(3, 'Toffee apple', 1, 'A baby sized apple covered in glazed light brown caramel', 8, 'food', 0, 5, -1, NULL, 1, -1, NULL),
(4, 'Faery dreams bath salts', 6, 'Relaxing bath salts made from eerie faeries dreams', 11, 'hygiene', 0, NULL, NULL, 80, 1, 1, 3),
(5, 'Fluffy coton bud', 1, 'Two cotton buds made from snow and cloud fiber', 1, 'hygiene', 0, NULL, NULL, 10, 1, -1, 1),
(6, 'Magical Bar', 3, 'Give it a try and you''ll see your life exteeeeeeend', 7, 'energy', 0, NULL, NULL, NULL, NULL, 2, NULL),
(7, 'Flying pigs', 6, 'Wanna fly high as the sky? I sure do!', 9, 'energy', 0, NULL, NULL, NULL, NULL, 5, NULL),
(8, 'Kitten Band Aid', 2, 'Put it on a scar and you''ll feel better, won''t be geting seven lifes though', 10, 'health', 0, NULL, 7, NULL, 3, -1, 1),
(9, 'Loving spider monkey', 9, 'Want to health fast? Spiders and monkeys are the way to go', 14, 'health', 0, NULL, 30, NULL, 7, -4, 2),
(10, 'Supa Mega LootOfDoom', 10000, 'Get the money and you''ll see', 6, 'happiness', 0, 100, 100, 100, 100, 100, 1000),
(11, 'Slap', 0, 'Bitch slap that dumb pet', 13, 'action', 0, NULL, -10, NULL, -30, NULL, 1),
(12, 'Scold', 0, 'Scolding your pet might make him cry', 5, 'action', 0, NULL, NULL, NULL, -10, NULL, 1),
(13, 'Hug', 0, 'Just a hug from me to you ', 3, 'action', 0, NULL, NULL, NULL, 20, NULL, NULL),
(14, 'Stuffings', 2, 'Little things to nibble on', 12, 'food', 0, 30, NULL, NULL, 1, -1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tg_consum_inventory`
--

CREATE TABLE IF NOT EXISTS `tg_consum_inventory` (
  `consum_inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `consum_id` int(11) NOT NULL,
  `nbr_object` int(11) DEFAULT NULL,
  PRIMARY KEY (`consum_inventory_id`),
  KEY `user_id` (`user_id`,`consum_id`),
  KEY `consum_id` (`consum_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=19 ;

--
-- Contenu de la table `tg_consum_inventory`
--

INSERT INTO `tg_consum_inventory` (`consum_inventory_id`, `user_id`, `consum_id`, `nbr_object`) VALUES
(1, 1, 1, 7),
(2, 1, 3, 0),
(3, 1, 4, 14),
(4, 1, 5, 5),
(5, 1, 6, 2),
(6, 1, 7, 8),
(7, 1, 8, 9),
(8, 1, 9, 5),
(15, 1, 2, NULL),
(16, 1, 11, NULL),
(17, 1, 12, NULL),
(18, 1, 13, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tg_experience_cap`
--

CREATE TABLE IF NOT EXISTS `tg_experience_cap` (
  `lvl` int(11) NOT NULL,
  `exp_needed` int(11) NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tg_experience_cap`
--

INSERT INTO `tg_experience_cap` (`lvl`, `exp_needed`) VALUES
(1, 15),
(2, 250),
(3, 550),
(4, 1500),
(5, 5000);

-- --------------------------------------------------------

--
-- Structure de la table `tg_items`
--

CREATE TABLE IF NOT EXISTS `tg_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `item_icon` int(11) NOT NULL DEFAULT '0',
  `item_slot` enum('head','right','left','chest','legs') COLLATE latin1_general_ci NOT NULL,
  `item_min_level` int(11) NOT NULL,
  `hp` int(11) DEFAULT NULL,
  `ap` int(11) DEFAULT NULL,
  `def` int(11) DEFAULT NULL,
  `special` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `special` (`special`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `tg_items`
--

INSERT INTO `tg_items` (`item_id`, `item_name`, `item_price`, `item_description`, `item_icon`, `item_slot`, `item_min_level`, `hp`, `ap`, `def`, `special`) VALUES
(1, 'Huge pink bow', 0, 'Omg ! It''s soo cute !', 0, 'head', 0, NULL, NULL, NULL, NULL),
(2, 'Spring flowers', 0, 'Smells great', 0, 'left', 0, NULL, NULL, NULL, NULL),
(3, 'Small sword', 0, 'Almost too small to hold', 0, 'right', 0, NULL, 5, NULL, NULL),
(4, 'Chocolate dress', 0, '', 0, 'chest', 0, 5, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tg_item_inventory`
--

CREATE TABLE IF NOT EXISTS `tg_item_inventory` (
  `item_inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `nbr_object` int(11) NOT NULL,
  PRIMARY KEY (`item_inventory_id`),
  KEY `user_id` (`user_id`,`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `tg_item_inventory`
--

INSERT INTO `tg_item_inventory` (`item_inventory_id`, `user_id`, `item_id`, `nbr_object`) VALUES
(1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `tg_levels`
--

CREATE TABLE IF NOT EXISTS `tg_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `lvl` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `ap` int(11) NOT NULL,
  `def` int(11) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `tg_levels`
--

INSERT INTO `tg_levels` (`level_id`, `pet_type`, `lvl`, `hp`, `ap`, `def`) VALUES
(1, 'dragon', 1, 200, 10, 20),
(2, 'dragon', 2, 500, 15, 40),
(3, 'dragon', 3, 1500, 40, 80),
(4, 'dragon', 4, 3000, 150, 350),
(5, 'dragon', 5, 5000, 300, 500);

-- --------------------------------------------------------

--
-- Structure de la table `tg_pets`
--

CREATE TABLE IF NOT EXISTS `tg_pets` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pet_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pet_type` enum('dragon','toad','bunny','teddybear') COLLATE latin1_general_ci NOT NULL,
  `lvl` enum('0','1','2','3','4','5') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `color` enum('1','2','3') COLLATE latin1_general_ci NOT NULL,
  `hp` int(11) NOT NULL DEFAULT '100',
  `hp_max` int(11) NOT NULL DEFAULT '100',
  `energy` int(11) NOT NULL DEFAULT '100',
  `food` int(11) NOT NULL DEFAULT '80',
  `hygiene` int(11) NOT NULL DEFAULT '90',
  `happiness` int(11) NOT NULL DEFAULT '50',
  `ap` int(11) NOT NULL DEFAULT '0',
  `def` int(11) NOT NULL DEFAULT '0',
  `head` int(11) DEFAULT NULL,
  `right` int(11) DEFAULT NULL,
  `left` int(11) DEFAULT NULL,
  `chest` int(11) DEFAULT NULL,
  `legs` int(11) DEFAULT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `user_id` (`user_id`),
  KEY `head` (`head`),
  KEY `right` (`right`),
  KEY `left` (`left`),
  KEY `chest` (`chest`),
  KEY `legs` (`legs`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `tg_pets`
--

INSERT INTO `tg_pets` (`pet_id`, `user_id`, `pet_name`, `pet_type`, `lvl`, `exp`, `color`, `hp`, `hp_max`, `energy`, `food`, `hygiene`, `happiness`, `ap`, `def`, `head`, `right`, `left`, `chest`, `legs`) VALUES
(1, 1, 'Raak', 'dragon', '0', 2, '2', 50, 100, 50, 20, 20, 20, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tg_spells`
--

CREATE TABLE IF NOT EXISTS `tg_spells` (
  `spell_id` int(11) NOT NULL AUTO_INCREMENT,
  `spell_name` varchar(255) NOT NULL,
  `spell_description` varchar(255) NOT NULL,
  `spell_ap` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `tg_spells`
--

INSERT INTO `tg_spells` (`spell_id`, `spell_name`, `spell_description`, `spell_ap`) VALUES
(1, 'Hot chocolate rain', 'Hot hot hot !', 12);

-- --------------------------------------------------------

--
-- Structure de la table `tg_users`
--

CREATE TABLE IF NOT EXISTS `tg_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `mdp` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `inscr_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cookies` int(11) NOT NULL DEFAULT '72',
  `pet_slots` enum('1','2','3','4','5') COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `tg_users`
--

INSERT INTO `tg_users` (`user_id`, `nickname`, `mdp`, `email`, `inscr_date`, `cookies`, `pet_slots`) VALUES
(1, 'Kyu', '6880aa7be2aa9880386d8c50d16adf6cd52d229b', 'ladykatherina@gmail.com', '2012-10-23 14:11:12', 72, '1');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `tg_consum_inventory`
--
ALTER TABLE `tg_consum_inventory`
  ADD CONSTRAINT `tg_consum_inventory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tg_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_consum_inventory_ibfk_2` FOREIGN KEY (`consum_id`) REFERENCES `tg_consummables` (`consum_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tg_items`
--
ALTER TABLE `tg_items`
  ADD CONSTRAINT `tg_items_ibfk_1` FOREIGN KEY (`special`) REFERENCES `tg_spells` (`spell_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tg_item_inventory`
--
ALTER TABLE `tg_item_inventory`
  ADD CONSTRAINT `tg_item_inventory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tg_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_item_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tg_pets`
--
ALTER TABLE `tg_pets`
  ADD CONSTRAINT `tg_pets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tg_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_pets_ibfk_2` FOREIGN KEY (`head`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_pets_ibfk_3` FOREIGN KEY (`right`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_pets_ibfk_4` FOREIGN KEY (`left`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_pets_ibfk_5` FOREIGN KEY (`chest`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tg_pets_ibfk_6` FOREIGN KEY (`legs`) REFERENCES `tg_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
