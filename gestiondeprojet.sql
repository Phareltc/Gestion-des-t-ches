-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2025 at 08:10 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestiondeprojet`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('127.0.0.1', 'i:1;', 1734614338),
('127.0.0.1:timer', 'i:1734614338;', 1734614338);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` int NOT NULL,
  `target` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_11_07_211740_create_users_table', 1),
(4, '2024_11_18_214045_create_projets_table', 1),
(5, '2024_11_19_133128_create_taches_table', 1),
(6, '2024_12_04_095445_create_tasks_table', 1),
(7, '2024_12_04_114841_create_links_table', 1),
(8, '2024_12_10_122757_create_reunions_table', 1),
(11, '2024_12_10_140558_create_sessions_table', 2),
(12, '2024_12_16_143357_create_rapports_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `projets`
--

CREATE TABLE `projets` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `createur_id` bigint UNSIGNED NOT NULL,
  `statut` enum('en_attente','en_cours','termine','annule') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en_attente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projets`
--

INSERT INTO `projets` (`id`, `nom`, `description`, `date_debut`, `date_fin`, `createur_id`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'Développement d\'une Application Mobile', 'Ce projet vise à développer une application mobile pour la gestion des tâches personnelles. L\'application permettra aux utilisateurs de créer, modifier, et suivre leurs tâches quotidiennes.', '2024-12-17', '2024-12-25', 1, 'en_attente', '2024-12-17 09:06:23', '2024-12-17 09:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `rapports`
--

CREATE TABLE `rapports` (
  `id` bigint UNSIGNED NOT NULL,
  `objet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points_abordes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `compte_rendu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `decisions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createur_rapport` bigint UNSIGNED NOT NULL,
  `reunion_id` bigint UNSIGNED NOT NULL,
  `statut` enum('En cours','Terminé','Annulé') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'En cours',
  `fichiers_joints` json DEFAULT NULL,
  `date_modification` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rapports`
--

INSERT INTO `rapports` (`id`, `objet`, `points_abordes`, `compte_rendu`, `decisions`, `date`, `createur_rapport`, `reunion_id`, `statut`, `fichiers_joints`, `date_modification`, `created_at`, `updated_at`) VALUES
(1, 'Rencontres des encadreurs pour la soutenance.', '[\"Point 1\",\"Point 2\",\"Point 3\"]', 'Ceci est un compte rendu', 'Ok', '2025-01-03 19:57:00', 6, 2, 'En cours', '[\"fichiers_rapports/zpVM3buBjmUV6I8Soba5n4lpWG048bqA20rAOWSu.pdf\"]', NULL, '2025-01-03 18:59:05', '2025-01-03 18:59:05'),
(2, 'Gestion du personnel', '[\"Nombre de personne \\u00e0 g\\u00e9rer\",\"Jour de travail\"]', 'Ok d\'accord.', 'Ok pour la décision.', '2025-01-04 16:42:00', 6, 5, 'En cours', '[\"fichiers_rapports/P6npHZLz2cenK8Z4GxAIh03cpe8HokwgkRfebQEQ.pdf\"]', NULL, '2025-01-04 15:48:21', '2025-01-04 15:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `reunions`
--

CREATE TABLE `reunions` (
  `id` bigint UNSIGNED NOT NULL,
  `objet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createur_reunion` bigint UNSIGNED NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime DEFAULT NULL,
  `statut` enum('en_attente','terminee','annulee') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en_attente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reunions`
--

INSERT INTO `reunions` (`id`, `objet`, `createur_reunion`, `debut`, `fin`, `statut`, `created_at`, `updated_at`) VALUES
(2, 'Rencontres des encadreurs pour la soutenance.', 1, '2024-12-16 09:50:00', '2024-12-16 12:00:00', 'annulee', '2024-12-10 15:37:14', '2024-12-16 11:34:12'),
(5, 'Gestion du personnel', 6, '2025-01-04 16:52:00', '2025-01-04 20:00:00', 'en_attente', '2025-01-04 14:52:54', '2025-01-04 15:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `reunion_user`
--

CREATE TABLE `reunion_user` (
  `id` bigint UNSIGNED NOT NULL,
  `reunion_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reunion_user`
--

INSERT INTO `reunion_user` (`id`, `reunion_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, NULL, NULL),
(5, 5, 4, NULL, NULL),
(6, 5, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vTQqfltEuSbc0ydUHeaWJ0at8FhihMoOTEqjT6gt', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzdzUHRsQUVjZGdMOFpzRHVxenJYWHlCOU81VGVNVTFSTFFTY01DTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hc3NldHMvY3NzL3N0YXJjb2RlMi5jc3MlMjAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Njt9', 1737312855);

-- --------------------------------------------------------

--
-- Table structure for table `taches`
--

CREATE TABLE `taches` (
  `id` bigint UNSIGNED NOT NULL,
  `projet_id` bigint UNSIGNED NOT NULL,
  `assigne_a` bigint UNSIGNED NOT NULL,
  `priorite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en attente',
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taches`
--

INSERT INTO `taches` (`id`, `projet_id`, `assigne_a`, `priorite`, `description`, `statut`, `date_debut`, `date_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Moyenne', 'Conception de l\'interface utilisateur', 'En attente', '2024-12-17', '2024-12-18', '2024-12-17 09:06:23', '2024-12-17 09:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `progress` double NOT NULL,
  `start_date` datetime NOT NULL,
  `parent` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` enum('masculin','féminin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `genre`, `photo`, `tel`, `email`, `password`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'DOE', 'John', 'masculin', 'photos/JepNEIt7GiZJZCu6fzcu4jOui9ZxrSiOFSPQLOwt.webp', '123456789', 'doe@gmail.com', '$2y$12$qoyPcL7rOs8yFLvlVI3wSu.Xdr/weXpXwc3NxPTemR.XVFv6MlC2S', 'Super Admin', '2024-12-10 13:23:11', '2024-12-10 13:23:11'),
(2, 'DOE', 'Johanne', 'féminin', 'equipes/v1PYVqQm20oShxCYQQIYaeoWUMBOf6TTcKulDChw.jpg', '123456789', 'johanne@gmail.com', '$2y$12$P2OZilckxq4ksR2oyeJM5.YWdj7hHz7gQmLtyXbrXcDXCv4eob282', 'Utilisateur', '2024-12-10 14:30:17', '2024-12-10 14:30:17'),
(3, 'PAPE', 'Carl', 'masculin', 'equipes/brlnVmskKwDymJKDmy6wVNN1IN0RcB5CwPGdFOzn.jpg', '123456789', 'car@gmail.com', '$2y$12$LsR5VgkojMXP3IlsfMB4uutVEL7vnyJ7VgkV53YZNR.VJPiVuGG4u', 'Utilisateur', '2024-12-19 10:12:55', '2024-12-19 10:12:55'),
(4, 'SAMAKE', 'Brahim', 'masculin', 'equipes/giT9J2XPQZj8NGgqYzalkkVYdmSHQ8YqIS29h22a.webp', '123456789', 'samake@gmail.com', '$2y$12$aSUE2TmGnWeemV.ZDmHPDevNCD3MzuIKYgfmrVk0.RA6IpXj11dhC', 'Admin', '2024-12-19 12:14:19', '2024-12-19 12:14:19'),
(5, 'SAMAKE', 'Aïchatou', 'féminin', 'equipes/ID3YU1q8U0MmhKoEKDDUsOON30vKIlVcgLrQc95H.webp', '987654321', 'aichatou@gmail.com', '$2y$12$o1tguAyCshdplw5Dyb1nh.WOOVNQiptpz/BZ3j8oJCeAMgZifGRSG', 'Admin', '2024-12-19 12:16:03', '2024-12-19 12:16:03'),
(6, 'MBA', 'Felix', 'masculin', 'equipes/4Gld8IDTcMiTOGh1SbF5Oth7yu0JeCKUR3B3yEOf.webp', '123456789', 'felix@gmail.com', '$2y$12$SdQd2LPN6ydnWHST9DKTmuNdY5MDH98vjZlExE2g1MbMy9vSI8t5C', 'Super Admin', '2024-12-19 12:17:59', '2024-12-19 12:17:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projets_createur_id_foreign` (`createur_id`);

--
-- Indexes for table `rapports`
--
ALTER TABLE `rapports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rapports_createur_rapport_foreign` (`createur_rapport`),
  ADD KEY `rapports_reunion_id_foreign` (`reunion_id`);

--
-- Indexes for table `reunions`
--
ALTER TABLE `reunions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reunions_createur_reunion_foreign` (`createur_reunion`);

--
-- Indexes for table `reunion_user`
--
ALTER TABLE `reunion_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reunion_user_reunion_id_foreign` (`reunion_id`),
  ADD KEY `reunion_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taches_projet_id_foreign` (`projet_id`),
  ADD KEY `taches_assigne_a_foreign` (`assigne_a`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `projets`
--
ALTER TABLE `projets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rapports`
--
ALTER TABLE `rapports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reunions`
--
ALTER TABLE `reunions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reunion_user`
--
ALTER TABLE `reunion_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taches`
--
ALTER TABLE `taches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_createur_id_foreign` FOREIGN KEY (`createur_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rapports`
--
ALTER TABLE `rapports`
  ADD CONSTRAINT `rapports_createur_rapport_foreign` FOREIGN KEY (`createur_rapport`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rapports_reunion_id_foreign` FOREIGN KEY (`reunion_id`) REFERENCES `reunions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reunions`
--
ALTER TABLE `reunions`
  ADD CONSTRAINT `reunions_createur_reunion_foreign` FOREIGN KEY (`createur_reunion`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reunion_user`
--
ALTER TABLE `reunion_user`
  ADD CONSTRAINT `reunion_user_reunion_id_foreign` FOREIGN KEY (`reunion_id`) REFERENCES `reunions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reunion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taches`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `taches_assigne_a_foreign` FOREIGN KEY (`assigne_a`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taches_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
