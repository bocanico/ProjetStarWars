-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 29 Janvier 2016 à 16:03
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
(1, 1, '106 Rice Key\nOnachester, NY 46998', '375071848451496', 1, '2016-01-25 15:55:36', '2016-01-25 15:55:36'),
(2, 2, '8372 Franecki Junctions Apt. 495\nEast Earlineton, SD 20287', '5114098372690905', 9, '2016-01-25 15:52:51', '2016-01-25 15:52:51'),
(3, 3, '65108 Marvin Island Apt. 716\nSouth Jennifer, KS 22687-7145', '5310539571424648', 5, '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(4, 4, 'test adress', '123456789', 1, '2016-01-25 16:07:15', '2016-01-25 16:07:15');

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
(1, 15, 1, '305.60', 1, '2016-01-25 15:55:36', 'finalized', '2016-01-25 15:55:36', '2016-01-25 15:55:36'),
(2, 15, 4, '305.60', 1, '2016-01-25 16:07:15', 'finalized', '2016-01-25 16:07:15', '2016-01-25 16:07:15'),
(3, 15, 3, '305.60', 1, '2016-01-26 15:14:57', 'finalized', '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(4, 11, 3, '1239.67', 2, '2016-01-26 15:14:57', 'finalized', '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(5, 6, 3, '1269.50', 2, '2016-01-26 15:14:57', 'finalized', '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(6, 5, 1, '1823.54', 1, '2016-01-27 10:25:11', 'finalized', '2016-01-27 10:25:11', '2016-01-27 10:25:11'),
(7, 9, 1, '975.95', 1, '2016-01-27 10:25:23', 'finalized', '2016-01-27 10:25:23', '2016-01-27 10:25:23'),
(8, 11, 1, '1239.67', 1, '2016-01-27 10:25:33', 'finalized', '2016-01-27 10:25:33', '2016-01-27 10:25:33'),
(9, 9, 1, '975.95', 1, '2016-01-27 10:26:54', 'finalized', '2016-01-27 10:26:54', '2016-01-27 10:26:54'),
(10, 12, 1, '1611.38', 1, '2016-01-27 10:27:09', 'finalized', '2016-01-27 10:27:09', '2016-01-27 10:27:09'),
(11, 7, 1, '375.73', 1, '2016-01-27 10:27:24', 'finalized', '2016-01-27 10:27:24', '2016-01-27 10:27:24'),
(12, 12, 1, '1611.38', 1, '2016-01-27 10:27:36', 'finalized', '2016-01-27 10:27:36', '2016-01-27 10:27:36'),
(13, 3, 1, '266.65', 1, '2016-01-27 10:27:48', 'finalized', '2016-01-27 10:27:48', '2016-01-27 10:27:48'),
(14, 13, 1, '1264.40', 1, '2016-01-27 10:28:16', 'finalized', '2016-01-27 10:28:16', '2016-01-27 10:28:16'),
(15, 2, 1, '23.85', 1, '2016-01-27 10:53:45', 'finalized', '2016-01-27 10:53:46', '2016-01-27 10:53:46'),
(16, 3, 1, '266.65', 1, '2016-01-27 10:53:58', 'finalized', '2016-01-27 10:53:58', '2016-01-27 10:53:58'),
(17, 14, 1, '376.63', 1, '2016-01-27 10:54:13', 'finalized', '2016-01-27 10:54:13', '2016-01-27 10:54:13'),
(18, 17, 1, '125.00', 1, '2016-01-27 16:43:20', 'finalized', '2016-01-27 16:43:20', '2016-01-27 16:43:20');

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
(1, 1, 'Meagan Hintz DDS', 'BeXI7HH3mtlN_370x235.jpg', 0, 'png', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(2, 2, 'Mr. Demond Grimes', 'wMLD7XCnfhMZ_370x235.jpg', 0, 'png', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(3, 3, 'Hanna Zulauf III', 'LaONOUC0esNb_370x235.jpg', 0, 'png', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(4, 4, 'Elian Langosh', 'A4hDeoY6Ftkt_370x235.jpg', 0, 'png', '2016-01-25 15:52:46', '2016-01-25 15:52:46'),
(5, 5, 'Candice Metz Sr.', 'MYilMwC9B2Tl_370x235.jpg', 0, 'png', '2016-01-25 15:52:46', '2016-01-25 15:52:46'),
(6, 6, 'Buck Glover', 'vxnAMFMd5OoF_370x235.jpg', 0, 'png', '2016-01-25 15:52:46', '2016-01-25 15:52:46'),
(7, 7, 'Prof. Avery Koch', 'IVgxeNZu0k1W_370x235.jpg', 0, 'png', '2016-01-25 15:52:46', '2016-01-25 15:52:46'),
(8, 8, 'Miss Helen Turcotte DVM', 'bojhISUbqzYD_370x235.jpg', 0, 'png', '2016-01-25 15:52:48', '2016-01-25 15:52:48'),
(9, 9, 'Grover Lindgren V', 'VqWXu3i2RoA8_370x235.jpg', 0, 'png', '2016-01-25 15:52:49', '2016-01-25 15:52:49'),
(10, 10, 'Francisca Huels I', 'k4ZAay4luzmn_370x235.jpg', 0, 'png', '2016-01-25 15:52:49', '2016-01-25 15:52:49'),
(11, 11, 'Prof. Eino King Jr.', 'RolrEluC8vPS_370x235.jpg', 0, 'png', '2016-01-25 15:52:50', '2016-01-25 15:52:50'),
(12, 12, 'Prof. Kellen Zulauf I', 'BriIh3ge7Dh5_370x235.jpg', 0, 'png', '2016-01-25 15:52:50', '2016-01-25 15:52:50'),
(13, 13, 'Ms. Mertie Feest', 'HFaHdPJSsMQz_370x235.jpg', 0, 'png', '2016-01-25 15:52:50', '2016-01-25 15:52:50'),
(14, 14, 'Ms. Sydni Emmerich DVM', 's4jHdwd5EJCr_370x235.jpg', 0, 'png', '2016-01-25 15:52:51', '2016-01-25 15:52:51'),
(15, 15, 'Prof. Heath Murphy DDS', 'j3DArScqhxEm_370x235.jpg', 0, 'png', '2016-01-25 15:52:51', '2016-01-25 15:52:51'),
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
(1, 2, 'Prof. Hassie Nolan', 'prof-hassie-nolan', 'Repellendus quidem facere exercitationem et et reprehenderit aut rem enim.', 'Ipsa quasi aut incidunt autem. Vel id facere eveniet sed ut eum. Veritatis a quia est doloribus quia. Numquam possimus nostrum inventore ipsa occaecati laboriosam quo. Quia deleniti voluptatem sit molestiae.', '366.58', 0, 0, 'opened', '2015-05-08 16:52:45', '2016-01-26 18:51:45', '2016-01-26 18:51:45'),
(2, 2, 'Mr. Makenna Christiansen', 'mr-makenna-christiansen', 'Pariatur sunt ea non nisi ratione tempora neque qui.', 'Et voluptas inventore nesciunt eligendi. Consequatur officia omnis rerum delectus autem impedit voluptatem. Dolorum quis quas inventore quis quis. Corrupti fugiat in quaerat expedita et nulla.', '23.85', 4, 1, 'opened', '1999-09-24 16:52:45', '2016-01-27 10:53:45', '2016-01-27 10:53:45'),
(3, 2, 'Mr. Enrique Hermiston IV', 'mr-enrique-hermiston-iv', 'Molestiae nihil earum et quibusdam ea vitae voluptate id explicabo aut.', 'At eos praesentium officia ut. Sequi nihil totam dolorem fugiat hic. Reprehenderit nobis rerum dignissimos ab explicabo est dolorem. Architecto dignissimos eaque aut non ut aut vero. Aut eos rem quia atque possimus. Magnam aspernatur qui nesciunt quia. Dolor ut tenetur facere rem quis voluptatibus dolorum.', '266.65', 6, 2, 'opened', '1978-06-11 16:52:45', '2016-01-27 10:53:58', '2016-01-27 10:53:58'),
(4, 2, 'Mandy Jones PhD', 'mandy-jones-phd', 'Quam nisi dolorem doloremque non atque.', 'Itaque aliquid veritatis consequatur autem et quaerat. In similique sed dignissimos pariatur et sed perferendis. Asperiores at aspernatur eveniet sit. Quaerat laborum velit odit corrupti est in. Quibusdam culpa quae dolorem est.', '670.43', 8, 0, 'opened', '2009-04-11 16:52:45', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(5, 1, 'Koby Lynch', 'koby-lynch', 'Dolore odio nihil omnis ullam beatae perferendis vel dolor est ut alias molestiae earum.', 'Omnis dolorem porro nesciunt dolorem. Non nihil omnis quaerat labore. Dignissimos et nisi natus ullam dolor ipsam. Perferendis sunt reiciendis et itaque dolores nobis quis. Aut quibusdam dolorem neque sapiente.', '1823.54', 5, 1, 'opened', '2009-10-29 16:52:45', '2016-01-27 10:25:11', '2016-01-27 10:25:11'),
(6, 1, 'William Kemmer', 'william-kemmer', 'Architecto mollitia sit et laudantium sed ratione cupiditate accusamus.', 'Dolor ratione sed sunt a ea. Consequatur nisi numquam consequatur voluptatibus temporibus doloribus officia ducimus. Soluta necessitatibus esse minus cum ducimus rerum quia. Itaque illum facere facere odit sit. Eum ullam tempora illo odio. Inventore exercitationem voluptatem modi debitis quidem iusto ea.', '1269.50', 6, 2, 'opened', '2000-08-13 16:52:45', '2016-01-27 11:45:58', '2016-01-27 11:45:58'),
(7, 2, 'Breanna McLaughlin', 'breanna-mclaughlin', 'Sint autem voluptates voluptatem eos illum fugit quia.', 'Fuga nulla error a qui aut. Voluptate illo qui rerum sint incidunt debitis ipsam. Pariatur quaerat non iusto laboriosam. Mollitia ut amet fuga eius aut.', '375.73', 7, 1, 'opened', '1985-10-31 16:52:45', '2016-01-27 10:27:24', '2016-01-27 10:27:24'),
(8, 2, 'Everardo Blick', 'everardo-blick', 'Fugit ipsa aspernatur pariatur dolorum laboriosam odit omnis aut a vel eius.', 'Nam eveniet mollitia rerum et enim ex illo fugiat. Ipsam error maiores sequi enim. Id neque omnis vero veritatis incidunt ea ut. Assumenda voluptatem accusantium laudantium soluta quidem illo esse. Voluptates et quasi consequatur sit.', '1220.76', 0, 0, 'opened', '2009-12-19 16:52:45', '2016-01-26 18:46:48', '2016-01-26 18:46:48'),
(9, 1, 'Miss Ruby Macejkovic II', 'miss-ruby-macejkovic-ii', 'Vel omnis tempore dolorem tempore.', 'Et quia et temporibus quo aut in. Dolores totam aut recusandae omnis corrupti. Libero saepe exercitationem cum sequi qui. Velit non et ea fugiat omnis nemo. Ea cupiditate earum quia voluptate. Vel ut in delectus eveniet illo ut ad nostrum.', '975.95', 0, 2, 'opened', '2005-10-18 16:52:45', '2016-01-27 10:26:54', '2016-01-27 10:26:54'),
(10, 1, 'Dr. Fidel Deckow III', 'dr-fidel-deckow-iii', '', '', '1317.45', 5, 0, 'opened', '2016-01-27 17:17:16', '2016-01-28 16:23:11', '2016-01-28 16:23:11'),
(11, 1, 'Reyna Hirthe', 'reyna-hirthe', 'Repellat nulla repellendus quos et sint nihil eum quasi et debitis.', 'Quos qui qui est odit. Quod voluptate autem quia maxime reprehenderit. Expedita fugiat eos debitis doloremque. Ad aut qui non aspernatur numquam dicta. Ullam alias ratione ipsa. Omnis omnis magni ullam id sint.', '1239.67', 3, 3, 'opened', '2001-11-21 16:52:45', '2016-01-27 10:25:33', '2016-01-27 10:25:33'),
(12, 1, 'Rhiannon Gutkowski I', 'rhiannon-gutkowski-i', 'Ipsum quia impedit quae rerum.', 'Voluptatem iste mollitia dolorem aut possimus impedit est. Ipsam quia dolor laborum odit iste et numquam. Eos perferendis deleniti dolor iste. Omnis molestias veritatis et sed. Ut ut tenetur natus officia. Provident eaque voluptate quo esse deserunt rerum. Praesentium aut sit consectetur sit. Natus unde eos omnis voluptas.', '1611.38', 0, 2, 'opened', '1989-11-21 16:52:45', '2016-01-27 10:27:36', '2016-01-27 10:27:36'),
(13, 2, 'Prof. Edward Johnson Jr.', 'prof-edward-johnson-jr', 'Quis reprehenderit quia illo at soluta velit perspiciatis quo.', 'Debitis corrupti veniam dignissimos quasi eum dolorem. Corrupti odio est rerum beatae laudantium. Consequuntur vel ad molestias enim. Quia dolor reprehenderit sequi aut officia rerum. Laboriosam sed dicta maiores fugit nesciunt culpa. Blanditiis deserunt cupiditate quo et aliquid necessitatibus nihil.', '1264.40', 7, 1, 'opened', '1995-10-23 16:52:45', '2016-01-27 10:28:16', '2016-01-27 10:28:16'),
(14, 1, 'Mr. Harold Haley', 'mr-harold-haley', 'Dicta dolores hic fugiat sed aut et eveniet aut voluptas rerum.', 'Cumque itaque autem et consectetur. Expedita quasi ab voluptas iste numquam eos sint. Aut consequatur error sed. Et ab suscipit id adipisci cum excepturi repudiandae pariatur.', '376.63', 9, 1, 'opened', '1972-12-15 16:52:45', '2016-01-28 11:22:13', '2016-01-28 11:22:13'),
(15, 1, 'Alfonzo Fadel IV', 'alfonzo-fadel-iv', 'Eveniet placeat occaecati voluptatem eum eius.', 'Quia at aut laudantium beatae quia. Similique quia consectetur est illo voluptatem at.', '305.60', 0, 3, 'opened', '1983-10-26 16:52:45', '2016-01-26 15:14:57', '2016-01-26 15:14:57'),
(17, 2, 'ylo Ren', 'kylo-ren', 'Repellendus quidem facere exercitationem et et reprehenderit aut rem enim.', 'Ipsa quasi aut incidunt autem. Vel id facere eveniet sed ut eum. Veritatis a quia est doloribus quia. Numquam possimus nostrum inventore ipsa occaecati laboriosam quo. Quia deleniti voluptatem sit molestiae.', '125.00', 14, 1, 'opened', '2016-01-27 16:41:20', '2016-01-29 14:23:11', '2016-01-28 15:11:51'),
(18, 2, 'dark vador', 'dark-vador', 'Pariatur sunt ea non nisi ratione tempora neque qui.', 'Et voluptas inventore nesciunt eligendi. Consequatur officia omnis rerum delectus autem impedit voluptatem. Dolorum quis quas inventore quis quis. Corrupti fugiat in quaerat expedita et nulla.', '185.00', 11, 0, 'opened', '2016-01-06 16:43:47', '2016-01-29 14:23:15', '2016-01-27 15:43:47'),
(19, 2, 'stormtrooper', 'stormtrooper', 'Molestiae nihil earum et quibusdam ea vitae voluptate id explicabo aut.', 'At eos praesentium officia ut. Sequi nihil totam dolorem fugiat hic. Reprehenderit nobis rerum dignissimos ab explicabo est dolorem. Architecto dignissimos eaque aut non ut aut vero. Aut eos rem quia atque possimus. Magnam aspernatur qui nesciunt quia. Dolor ut tenetur facere rem quis voluptatibus dolorum.', '110.00', 22, 0, 'opened', '2014-06-11 17:22:58', '2016-01-29 14:23:18', '2016-01-27 16:22:58'),
(20, 2, 'boba fett', 'boba-fett', 'Quam nisi dolorem doloremque non atque.', 'Itaque aliquid veritatis consequatur autem et quaerat. In similique sed dignissimos pariatur et sed perferendis. Asperiores at aspernatur eveniet sit. Quaerat laborum velit odit corrupti est in. Quibusdam culpa quae dolorem est.', '145.00', 14, 0, 'opened', '2012-06-07 17:25:10', '2016-01-29 14:23:21', '2016-01-27 16:25:10'),
(21, 2, 'pilote X wing', 'pilote-x-wing', 'Dolore odio nihil omnis ullam beatae perferendis vel dolor est ut alias molestiae earum.', 'Omnis dolorem porro nesciunt dolorem. Non nihil omnis quaerat labore. Dignissimos et nisi natus ullam dolor ipsam. Perferendis sunt reiciendis et itaque dolores nobis quis. Aut quibusdam dolorem neque sapiente.', '90.00', 18, 0, 'opened', '2014-04-01 17:27:33', '2016-01-29 14:23:25', '2016-01-27 16:27:33'),
(22, 2, 'pilote imperial', 'pilote-imperial', 'Architecto mollitia sit et laudantium sed ratione cupiditate accusamus.', 'Dolor ratione sed sunt a ea. Consequatur nisi numquam consequatur voluptatibus temporibus doloribus officia ducimus. Soluta necessitatibus esse minus cum ducimus rerum quia. Itaque illum facere facere odit sit. Eum ullam tempora illo odio. Inventore exercitationem voluptatem modi debitis quidem iusto ea.', '150.00', 9, 0, 'opened', '2016-01-07 17:30:23', '2016-01-29 14:23:27', '2016-01-27 16:30:23'),
(23, 2, 'pilote tr-tt', 'pilote-tr-tt', 'Sint autem voluptates voluptatem eos illum fugit quia.', 'Fuga nulla error a qui aut. Voluptate illo qui rerum sint incidunt debitis ipsam. Pariatur quaerat non iusto laboriosam. Mollitia ut amet fuga eius aut.', '115.00', 16, 0, 'opened', '2009-11-29 17:36:33', '2016-01-29 14:23:30', '2016-01-27 16:36:33'),
(24, 2, 'flametrooper', 'flametrooper', 'Fugit ipsa aspernatur pariatur dolorum laboriosam odit omnis aut a vel eius.', 'Nam eveniet mollitia rerum et enim ex illo fugiat. Ipsam error maiores sequi enim. Id neque omnis vero veritatis incidunt ea ut. Assumenda voluptatem accusantium laudantium soluta quidem illo esse. Voluptates et quasi consequatur sit.', '155.00', 21, 0, 'opened', '2016-01-16 17:40:59', '2016-01-29 14:23:33', '2016-01-27 16:40:59'),
(25, 2, 'jango fett', 'jango-fett', 'Vel omnis tempore dolorem tempore.', 'Et quia et temporibus quo aut in. Dolores totam aut recusandae omnis corrupti. Libero saepe exercitationem cum sequi qui. Velit non et ea fugiat omnis nemo. Ea cupiditate earum quia voluptate. Vel ut in delectus eveniet illo ut ad nostrum.', '90.00', 12, 0, 'opened', '2012-05-22 17:56:58', '2016-01-29 14:23:36', '2016-01-27 16:56:58'),
(26, 1, 'boucles d''oreilles', 'boucles-doreilles', 'Pariatur sunt ea non nisi ratione tempora neque qui.', 'Quos qui qui est odit. Quod voluptate autem quia maxime reprehenderit. Expedita fugiat eos debitis doloremque. Ad aut qui non aspernatur numquam dicta. Ullam alias ratione ipsa. Omnis omnis magni ullam id sint.', '25.00', 35, 0, 'opened', '2016-01-23 17:26:51', '2016-01-29 14:23:39', '2016-01-28 16:26:51'),
(27, 1, 'bonbon sabre', 'bonbon-sabre', 'Architecto mollitia sit et laudantium sed ratione cupiditate accusamus.', 'Voluptatem iste mollitia dolorem aut possimus impedit est. Ipsam quia dolor laborum odit iste et numquam. Eos perferendis deleniti dolor iste. Omnis molestias veritatis et sed. Ut ut tenetur natus officia. Provident eaque voluptate quo esse deserunt rerum. Praesentium aut sit consectetur sit. Natus unde eos omnis voluptas.', '2.00', 50, 0, 'opened', '2016-01-28 17:27:32', '2016-01-29 14:23:42', '2016-01-28 16:27:32'),
(28, 1, 'sabre dark vador', 'sabre-dark-vador', 'Fugit ipsa aspernatur pariatur dolorum laboriosam odit omnis aut a vel eius.', 'Debitis corrupti veniam dignissimos quasi eum dolorem. Corrupti odio est rerum beatae laudantium. Consequuntur vel ad molestias enim. Quia dolor reprehenderit sequi aut officia rerum. Laboriosam sed dicta maiores fugit nesciunt culpa. Blanditiis deserunt cupiditate quo et aliquid necessitatibus nihil.', '65.00', 18, 0, 'opened', '2016-01-21 17:28:27', '2016-01-29 14:23:45', '2016-01-28 16:28:27'),
(29, 1, 'sabre lampe', 'sabre-lampe', 'Dicta dolores hic fugiat sed aut et eveniet aut voluptas rerum.', 'Cumque itaque autem et consectetur. Expedita quasi ab voluptas iste numquam eos sint. Aut consequatur error sed. Et ab suscipit id adipisci cum excepturi repudiandae pariatur.', '35.00', 27, 0, 'opened', '2016-01-11 17:29:32', '2016-01-29 14:23:48', '2016-01-28 16:29:32'),
(30, 1, 'mug sabre', 'mug-sabre', 'Quam nisi dolorem doloremque non atque.', 'Quia at aut laudantium beatae quia. Similique quia consectetur est illo voluptatem at.', '12.00', 37, 0, 'opened', '2016-07-12 17:30:12', '2016-01-29 14:23:51', '2016-01-28 16:30:12'),
(31, 1, 'sabre obi-wan', 'sabre-obi-wan', 'Quis reprehenderit quia illo at soluta velit perspiciatis quo.', 'Ipsa quasi aut incidunt autem. Vel id facere eveniet sed ut eum. Veritatis a quia est doloribus quia. Numquam possimus nostrum inventore ipsa occaecati laboriosam quo. Quia deleniti voluptatem sit molestiae.', '40.00', 12, 0, 'opened', '2016-01-26 17:30:53', '2016-01-29 14:23:54', '2016-01-28 16:30:53'),
(32, 1, 'stylo sabre', 'stylo-sabre', 'Repellat nulla repellendus quos et sint nihil eum quasi et debitis.', '', '7.00', 78, 0, 'opened', '2015-11-17 17:31:59', '2016-01-29 14:23:06', '2016-01-28 16:31:59');

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
(1, 9),
(1, 15),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(3, 2),
(3, 4),
(3, 5),
(3, 7),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 1),
(4, 4),
(4, 5),
(4, 9),
(4, 10),
(4, 11),
(5, 3),
(5, 7),
(5, 9),
(6, 1),
(6, 2),
(6, 5),
(6, 7),
(6, 12),
(6, 15),
(7, 2),
(7, 7),
(7, 10),
(7, 12),
(8, 1),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 6),
(9, 9),
(9, 12),
(9, 13),
(10, 1),
(10, 3),
(10, 8),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 12),
(11, 13),
(11, 14),
(11, 15),
(12, 2),
(12, 4),
(12, 5),
(12, 6),
(12, 9),
(12, 11),
(12, 12),
(13, 3),
(13, 4),
(13, 6),
(13, 11),
(13, 14),
(14, 4),
(14, 5),
(14, 10),
(14, 11),
(14, 12),
(15, 4),
(15, 5),
(15, 6),
(15, 8),
(15, 11),
(15, 14),
(17, 1),
(18, 1),
(18, 4),
(18, 5),
(19, 2),
(19, 4),
(19, 7),
(20, 1),
(20, 2),
(21, 9),
(21, 11),
(21, 12),
(22, 2),
(24, 3),
(24, 10),
(24, 11),
(26, 2),
(26, 6),
(27, 11),
(27, 12),
(28, 2),
(28, 6),
(29, 8),
(29, 12),
(29, 14),
(30, 1),
(30, 3),
(31, 4),
(32, 9),
(32, 10);

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
(1, 'aut', '2016-01-25 15:52:44', '2016-01-25 15:52:44'),
(2, 'minus', '2016-01-25 15:52:44', '2016-01-25 15:52:44'),
(3, 'sit', '2016-01-25 15:52:44', '2016-01-25 15:52:44'),
(4, 'dolore', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(5, 'optio', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(6, 'ut', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(7, 'est', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(8, 'dolorum', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(9, 'et', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(10, 'eius', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(11, 'sint', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(12, 'quisquam', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(13, 'quos', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(14, 'quos', '2016-01-25 15:52:45', '2016-01-25 15:52:45'),
(15, 'autem', '2016-01-25 15:52:45', '2016-01-25 15:52:45');

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
(1, 'nico', 'nico@nico.fr', '$2y$10$xMpuXXuTeMI9HiqO2mWOVuctFPiVQ57MC6Nyl5fonT4cccK4nHZrW', 'administrator', 'NERFid8hp6Zop2IHOgNN6odgthdaruPonLSGCsWRFLxljTRPmaIxk3N84S9Z', '2016-01-28 16:16:02', '2016-01-28 16:16:02'),
(2, 'tony', 'tony@tony.fr', '$2y$10$nLOsmQwnwXfemW6NIOkUseQ2Ora9kEUj3ntH0f1k7NiiT6.TRb7Oi', 'editor', 'W5qOHyImUS5QX42QoJpSiEP24Ns1sT9JBJTzQpJDLw3iLXUDz0RYhrbeJjDD', '2016-01-25 16:08:41', '2016-01-25 16:08:41'),
(3, 'antoine', 'antoine@antoine.fr', '$2y$10$rfWDbBi64HemxjWS.Ij2mupL1/CeeBYxwikFgiMsolN.qbAAo.6rC', 'visitor', 'byEvT8eBeikF09bCAGDbct4lvBWDSSJeY3Wsn6tSuMonE1wTNL3SNnEBeO9S', '2016-01-26 15:56:45', '2016-01-26 15:56:45'),
(4, 'yini', 'yini@yini.fr', '$2y$10$eC5.XoUQ/iCLlP9oxg021uQBBz.F8OefZZ/uHEuSPER5fvmyul8cG', 'visitor', 'QakUbc6PF6U1Heg4bsnhckWkbLTcibnl40vvtgjhoIUB3r0yyZipJjMpOgKn', '2016-01-25 16:07:18', '2016-01-25 16:07:18'),
(5, 'jb', 'jb@jb.fr', '$2y$10$BONoMMspUBPjgnG5el65VOpE9g5EydCeM6NJ17Fi/8u.fYbDTVGBa', 'visitor', 'TpRdiAQk4lTuzwypUcMyuMcFXYG1YFFDXIfekWXjRTzbqPoLHF1q7SBChcr2', '2016-01-26 16:33:38', '2016-01-26 16:33:38');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
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
