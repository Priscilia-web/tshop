-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 25 juin 2023 à 23:12
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
-- Base de données : `t_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` double NOT NULL,
  `etat` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `membre_id`, `quantite`, `montant`, `etat`, `date_enregistrement`) VALUES
(1, 1, 3, 46, 'en cours de traitement', '2023-06-25 13:59:15'),
(2, 1, 3, 46, 'en cours de traitement', '2023-06-25 14:22:25'),
(3, 1, 1, 15, 'en cours de traitement', '2023-06-25 14:23:08'),
(4, 1, 1, 15, 'en cours de traitement', '2023-06-25 14:24:08'),
(5, 1, 6, 90, 'en cours de traitement', '2023-06-25 14:25:46'),
(6, 1, 21, 316, 'en cours de traitement', '2023-06-25 15:16:00'),
(7, 1, 1, 16, 'en cours de traitement', '2023-06-25 22:16:50'),
(8, 1, 2, 35.99, 'en cours de traitement', '2023-06-25 23:10:45');

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_produit`
--

INSERT INTO `commande_produit` (`commande_id`, `produit_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 2),
(8, 2),
(8, 7);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230623073658', '2023-06-25 11:09:01', 291);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `civilite` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `email`, `roles`, `password`, `pseudo`, `nom`, `prenom`, `civilite`, `date_enregistrement`) VALUES
(1, 'admin@admin.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', '$2y$13$m3nD3nIypIDI.q1bjM.FqudBmIvS1GTC0CwiQvigrwDiQDuWyWrh2', 'admin', 'admin', 'admin', 'homme', '2023-06-25 12:41:09');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `taille` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `stock` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `titre`, `description`, `couleur`, `taille`, `collection`, `photo`, `prix`, `stock`, `date_enregistrement`) VALUES
(1, 'superbe t-shirt', '<div><strong>&nbsp;il est beau mon t-shirt</strong></div>', 'bleu', 'M', 'homme', '1687687879-bleu-cbcf46152e9af7b5e761141f103956896f667478.png', 1500, 200, '2023-06-25 12:09:29'),
(2, 'Superbe t-shirt jaune', '<div><strong><em>Il est si parfait</em></strong></div>', 'jaune', 'XL', 'femme', '1687688610-jaune-09e28c6e70b8c29c19c891d5121483d4078ffd90.png', 1600, 17, '2023-06-25 12:23:30'),
(3, 'Lacoste polo', '<blockquote>Il a mit le Polo vert</blockquote>', 'blanc', 'XL', 'homme', '1687727023-lacoste-fef3fe1d523904163854a458fdcab922948d5a4b.jpg', 12000, 200, '2023-06-25 23:03:43'),
(4, 'Lacoste noir', '<div>il est beau le T-shirt</div>', 'blanc', 'M', 'femme', '1687727067-lacoste2-20ef4f3191a4a33e383551235a54d5eb737ff3fa.webp', 5000, 200, '2023-06-25 23:04:27'),
(5, 'Naruto Collection Minato', '<div>Minato</div>', 'blanc', 'M', 'enfant', '1687727126-naruto-066568e34798f3f631c92d73040f1881b1c75de9.webp', 1999, 250, '2023-06-25 23:05:26'),
(6, 'Naruto Collection Jiraya', '<div>A grenouille tu vas plus vite</div>', 'rouge', 'L', 'homme', '1687727175-naruto2-f89309d6f60c4072a186cd0c97b34c140be6b168.webp', 1999, 100, '2023-06-25 23:06:15'),
(7, 'Naruto Collection Naruto run', '<div>Datemayo</div>', 'jaune', 'XL', 'femme', '1687727231-naruto4-e3771f6dffbeac6a80a01288e958e73e9683764c.webp', 1999, 49, '2023-06-25 23:07:11'),
(8, 'Naruto Collection Kakashi', '<blockquote>Kakashi avait mal au ventre</blockquote>', 'bleu', 'M', 'femme', '1687727288-naruto3-f1875feb6e995fe20444308fc481b3819af21da5.webp', 1999, 10, '2023-06-25 23:08:08');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67D6A99F74A` (`membre_id`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`commande_id`,`produit_id`),
  ADD KEY `IDX_DF1E9E8782EA2E54` (`commande_id`),
  ADD KEY `IDX_DF1E9E87F347EFB` (`produit_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F6B4FB29E7927C74` (`email`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D6A99F74A` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`);

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `FK_DF1E9E8782EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DF1E9E87F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
