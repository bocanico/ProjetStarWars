-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 30 Janvier 2016 à 15:43
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_starwars`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'lasers', 'lasers', 'bla bla bla', '2016-01-25 15:52:44', '0000-00-00 00:00:00'),
(2, 'casques', 'casques', 'bli bli bli', '2016-01-25 15:52:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `number_card` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `number_command` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `address`, `number_card`, `number_command`, `created_at`, `updated_at`) VALUES
(1, 1, '106 Rice Key\nOnachester, NY 46998', '375071848451496', 6, '2016-01-30 13:04:10', '2016-01-30 13:04:10'),
(2, 2, '8372 Franecki Junctions Apt. 495\nEast Earlineton, SD 20287', '5114098372690905', 9, '2016-01-25 15:52:51', '2016-01-25 15:52:51'),
(3, 3, '65108 Marvin Island Apt. 716\nSouth Jennifer, KS 22687-7145', '5310539571424648', 5, '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(4, 4, 'test adress', '123456789', 2, '2016-01-29 18:37:17', '2016-01-29 18:37:17');

-- --------------------------------------------------------

--
-- Structure de la table `histories`
--

CREATE TABLE `histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `command_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('finalized','unfinalized') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unfinalized',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `histories`
--

INSERT INTO `histories` (`id`, `product_id`, `customer_id`, `price`, `quantity`, `command_at`, `status`, `created_at`, `updated_at`) VALUES
(18, 17, 1, '125.00', 1, '2016-01-27 16:43:20', 'finalized', '2016-01-27 16:43:20', '2016-01-27 16:43:20'),
(19, 30, 4, '12.00', 2, '2016-01-29 18:37:17', 'finalized', '2016-01-29 18:37:17', '2016-01-29 18:37:17'),
(20, 30, 1, '12.00', 3, '2016-01-30 13:02:26', 'finalized', '2016-01-30 13:02:26', '2016-01-30 13:02:26'),
(21, 22, 1, '150.00', 1, '2016-01-30 13:02:26', 'finalized', '2016-01-30 13:02:26', '2016-01-30 13:02:26'),
(22, 21, 1, '90.00', 1, '2016-01-30 13:02:26', 'finalized', '2016-01-30 13:02:26', '2016-01-30 13:02:26'),
(23, 32, 1, '7.00', 4, '2016-01-30 13:04:10', 'finalized', '2016-01-30 13:04:10', '2016-01-30 13:04:10'),
(24, 23, 1, '115.00', 1, '2016-01-30 13:04:10', 'finalized', '2016-01-30 13:04:10', '2016-01-30 13:04:10'),
(25, 24, 1, '155.00', 1, '2016-01-30 13:04:10', 'finalized', '2016-01-30 13:04:10', '2016-01-30 13:04:10');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_12_30_100212_create_table_categories_table', 1),
('2015_12_30_105436_create_tags_table', 1),
('2015_12_30_110638_create_products_table', 1),
('2015_12_30_114011_create_pictures_table', 1),
('2015_12_30_115306_create_product_tag_table', 1),
('2015_12_30_133308_create_customers_table', 1),
('2015_12_30_133913_create_histories_table', 1),
('2015_12_30_135533_alter_pictures_table', 1),
('2016_01_12_104212_alter_products_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` smallint(6) NOT NULL,
  `type` enum('png','jpg','jpeg','gif') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pictures`
--

INSERT INTO `pictures` (`id`, `product_id`, `title`, `uri`, `size`, `type`, `created_at`, `updated_at`) VALUES
(17, 17, '', '0LqPupeamZuR.jpg', 16097, 'jpg', '2016-01-27 15:41:20', '2016-01-27 15:41:20'),
(18, 18, '', 'ZpTvCeRyfGbt.jpg', 17936, 'jpg', '2016-01-27 15:43:47', '2016-01-27 15:43:47'),
(19, 19, '', 'GPJ3VfifRpol.jpg', 32644, 'jpg', '2016-01-27 16:22:58', '2016-01-27 16:22:58'),
(20, 20, '', 'THsW0JHLm2pj.jpg', 13396, 'jpg', '2016-01-27 16:25:11', '2016-01-27 16:25:11'),
(21, 21, '', 'xT1hkQoCgGfa.jpg', 32767, 'jpg', '2016-01-27 16:27:33', '2016-01-27 16:27:33'),
(22, 22, '', '3SZuc5JpA1yH.jpg', 23361, 'jpg', '2016-01-27 16:30:23', '2016-01-27 16:30:23'),
(23, 23, '', 'vuGj1tJOUwkV.jpg', 9444, 'jpg', '2016-01-27 16:36:33', '2016-01-27 16:36:33'),
(24, 24, '', 'Ohu6SjvvLEz9.jpg', 18252, 'jpg', '2016-01-27 16:40:59', '2016-01-27 16:40:59'),
(25, 25, '', '3Pd4t2JAjK3m.jpg', 13209, 'jpg', '2016-01-27 16:56:58', '2016-01-27 16:56:58'),
(26, 26, '', 'jO4MmkMsaQno.jpg', 20346, 'jpg', '2016-01-28 16:26:51', '2016-01-28 16:26:51'),
(27, 27, '', 'WQHqEqFR4SqE.jpg', 4574, 'jpg', '2016-01-28 16:27:32', '2016-01-28 16:27:32'),
(28, 28, '', 'QUbAcl2qo6Ma.jpg', 3581, 'jpg', '2016-01-28 16:28:27', '2016-01-28 16:28:27'),
(29, 29, '', 'TpxlXe0cIBtr.jpg', 10070, 'jpg', '2016-01-28 16:29:32', '2016-01-28 16:29:32'),
(30, 30, '', 'p9truzxP3wwA.jpg', 14089, 'jpg', '2016-01-28 16:30:13', '2016-01-28 16:30:13'),
(31, 31, '', 'pdGQSMLU4DK4.jpg', 5472, 'jpg', '2016-01-28 16:30:53', '2016-01-28 16:30:53'),
(32, 32, '', 'YGMOQ2RAtxAX.jpg', 32767, 'jpg', '2016-01-28 16:31:59', '2016-01-28 16:31:59');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `score` smallint(5) UNSIGNED NOT NULL,
  `status` enum('opened','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'opened',
  `published_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `abstract`, `content`, `price`, `quantity`, `score`, `status`, `published_at`, `created_at`, `updated_at`) VALUES
(17, 2, 'kylo ren', 'kylo-ren', 'Repellendus quidem facere exercitationem et et reprehenderit aut rem enim.', 'Ipsa quasi aut incidunt autem. Vel id facere eveniet sed ut eum. Veritatis a quia est doloribus quia. Numquam possimus nostrum inventore ipsa occaecati laboriosam quo. Quia deleniti voluptatem sit molestiae.', '125.00', 13, 1, 'opened', '2016-01-27 16:41:20', '2016-01-29 19:34:21', '2016-01-29 19:34:21'),
(18, 2, 'dark vador', 'dark-vador', 'Pariatur sunt ea non nisi ratione tempora neque qui.', 'Et voluptas inventore nesciunt eligendi. Consequatur officia omnis rerum delectus autem impedit voluptatem. Dolorum quis quas inventore quis quis. Corrupti fugiat in quaerat expedita et nulla.', '185.00', 11, 0, 'opened', '2016-01-06 16:43:47', '2016-01-29 14:23:15', '2016-01-27 15:43:47'),
(19, 2, 'Stormtrooper', 'stormtrooper', '', '', '110.00', 22, 0, 'opened', '2016-01-30 13:57:37', '2016-01-30 12:57:37', '2016-01-30 12:57:37'),
(20, 2, 'boba fett', 'boba-fett', 'Quam nisi dolorem doloremque non atque.', 'Itaque aliquid veritatis consequatur autem et quaerat. In similique sed dignissimos pariatur et sed perferendis. Asperiores at aspernatur eveniet sit. Quaerat laborum velit odit corrupti est in. Quibusdam culpa quae dolorem est.', '145.00', 14, 0, 'opened', '2012-06-07 17:25:10', '2016-01-29 14:23:21', '2016-01-27 16:25:10'),
(21, 2, 'Pilote X wing', 'pilote-x-wing', '', '', '90.00', 17, 1, 'opened', '2016-01-30 13:57:06', '2016-01-30 13:02:26', '2016-01-30 13:02:26'),
(22, 2, 'Pilote imperial', 'pilote-imperial', '', '', '150.00', 8, 1, 'opened', '2016-01-30 13:59:25', '2016-01-30 13:02:26', '2016-01-30 13:02:26'),
(23, 2, 'Pilote tr-tt', 'pilote-tr-tt', '', '', '115.00', 15, 1, 'opened', '2016-01-30 13:56:11', '2016-01-30 13:04:10', '2016-01-30 13:04:10'),
(24, 2, 'flametrooper', 'flametrooper', 'Fugit ipsa aspernatur pariatur dolorum laboriosam odit omnis aut a vel eius.', 'Nam eveniet mollitia rerum et enim ex illo fugiat. Ipsam error maiores sequi enim. Id neque omnis vero veritatis incidunt ea ut. Assumenda voluptatem accusantium laudantium soluta quidem illo esse. Voluptates et quasi consequatur sit.', '155.00', 20, 1, 'opened', '2016-01-16 17:40:59', '2016-01-30 13:04:10', '2016-01-30 13:04:10'),
(25, 2, 'Jango fett', 'jango-fett', '', '', '90.00', 12, 0, 'opened', '2016-01-30 13:56:52', '2016-01-30 12:56:52', '2016-01-30 12:56:52'),
(26, 1, 'Boucles d''oreilles', 'boucles-doreilles', '', '', '25.00', 35, 0, 'opened', '2016-01-30 14:00:27', '2016-01-30 13:00:27', '2016-01-30 13:00:27'),
(27, 1, 'Bonbon sabre', 'bonbon-sabre', '', '', '2.00', 50, 0, 'opened', '2016-01-30 14:00:46', '2016-01-30 13:00:46', '2016-01-30 13:00:46'),
(28, 1, 'Sabre dark vador', 'sabre-dark-vador', '', '', '65.00', 18, 0, 'opened', '2016-01-30 14:00:05', '2016-01-30 13:00:05', '2016-01-30 13:00:05'),
(29, 1, 'Sabre lampe', 'sabre-lampe', '', '', '35.00', 27, 0, 'opened', '2016-01-30 13:59:50', '2016-01-30 12:59:50', '2016-01-30 12:59:50'),
(30, 1, 'mug sabre', 'mug-sabre', 'Quam nisi dolorem doloremque non atque.', 'Quia at aut laudantium beatae quia. Similique quia consectetur est illo voluptatem at.', '12.00', 29, 5, 'opened', '2016-07-12 17:30:12', '2016-01-30 13:30:13', '2016-01-30 13:30:13'),
(31, 1, 'Sabre obi-wan', 'sabre-obi-wan', '', '', '40.00', 12, 0, 'opened', '2016-01-30 13:55:46', '2016-01-30 12:55:46', '2016-01-30 12:55:46'),
(32, 1, 'Stylo sabre', 'stylo-sabre', '', '', '7.00', 74, 4, 'opened', '2016-01-30 13:58:59', '2016-01-30 13:04:10', '2016-01-30 13:04:10');

-- --------------------------------------------------------

--
-- Structure de la table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag_id`) VALUES
(17, 1),
(18, 1),
(18, 5),
(19, 2),
(19, 6),
(20, 1),
(21, 2),
(22, 2),
(22, 3),
(23, 1),
(23, 2),
(24, 3),
(25, 1),
(25, 6),
(26, 4),
(26, 5),
(27, 4),
(27, 5),
(28, 2),
(28, 3),
(29, 4),
(29, 6),
(30, 1),
(30, 3),
(31, 4),
(31, 6),
(32, 4);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'saga', '2016-01-30 12:43:59', '2016-01-25 15:52:44'),
(2, 'empire', '2016-01-30 12:43:59', '2016-01-25 15:52:44'),
(3, 'sith', '2016-01-30 12:44:02', '2016-01-25 15:52:44'),
(4, 'jedi', '2016-01-30 12:50:48', '2016-01-25 15:52:44'),
(5, 'naboo', '2016-01-30 12:43:24', '2016-01-25 15:52:45'),
(6, 'force', '2016-01-30 12:52:13', '2016-01-25 15:52:44');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('administrator','editor','author','visitor') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nico', 'nico@nico.fr', '$2y$10$xMpuXXuTeMI9HiqO2mWOVuctFPiVQ57MC6Nyl5fonT4cccK4nHZrW', 'administrator', '8xg8nLz832UZCjXfqUMA0Y3V1BZxVeG59D7mv2J4RBdkq5EH2kN2ZHimyyuh', '2016-01-30 13:07:09', '2016-01-30 13:07:09'),
(2, 'tony', 'tony@tony.fr', '$2y$10$nLOsmQwnwXfemW6NIOkUseQ2Ora9kEUj3ntH0f1k7NiiT6.TRb7Oi', 'editor', 'MQ7OjwNtWLuzCDfzoJoABwkT84KPs9UhTUwoiczDrOKU9ihlf37uStvU8mgX', '2016-01-29 18:19:32', '2016-01-29 18:19:32'),
(3, 'antoine', 'antoine@antoine.fr', '$2y$10$rfWDbBi64HemxjWS.Ij2mupL1/CeeBYxwikFgiMsolN.qbAAo.6rC', 'visitor', 'y0qx7ozfYkyv82Bb882a7KtOPItTcjHAATyHUFMkUusvDs3hFDUq8jRelvqZ', '2016-01-29 18:19:09', '2016-01-29 18:19:09'),
(4, 'yini', 'yini@yini.fr', '$2y$10$eC5.XoUQ/iCLlP9oxg021uQBBz.F8OefZZ/uHEuSPER5fvmyul8cG', 'visitor', 'MBEj0NDBYZJ7GXTwa5orwYavpLQCkuxnah8kUnU4ebWt1Zbs5kMVK6by1N6O', '2016-01-29 18:37:32', '2016-01-29 18:37:32'),
(5, 'jb', 'jb@jb.fr', '$2y$10$BONoMMspUBPjgnG5el65VOpE9g5EydCeM6NJ17Fi/8u.fYbDTVGBa', 'visitor', 'LDECxlnp57CKrNGVoc0P9gKsc1hWQR57XDEDwWE4X3Aag8qINjdyLuNBqIF0', '2016-01-29 19:00:42', '2016-01-29 19:00:42');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Index pour la table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `histories_product_id_foreign` (`product_id`),
  ADD KEY `histories_customer_id_foreign` (`customer_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Index pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_product_id_foreign` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Index pour la table `product_tag`
--
ALTER TABLE `product_tag`
  ADD UNIQUE KEY `product_tag_product_id_tag_id_unique` (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `histories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
