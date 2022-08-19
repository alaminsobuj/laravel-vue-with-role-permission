-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2022 at 04:34 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdtask_vue_laravel2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `cat_name`, `status`, `created_at`, `updated_at`) VALUES
(48, 'Handbook dddsdfgsdfg', 1, '2021-05-31 11:22:41', '2022-02-02 09:03:57'),
(49, 'LIght', 0, '2021-05-31 11:22:51', '2021-12-13 11:32:02'),
(86, 'asdfasdfasdf', 0, '2021-09-17 11:08:13', '2021-09-17 11:08:13'),
(87, 'Hello', 0, '2021-09-17 11:08:39', '2021-09-17 11:08:39'),
(88, 'fff', 0, '2021-10-26 20:00:40', '2021-10-26 20:00:40'),
(90, 'ttttttttt', 0, '2021-12-13 09:52:19', '2021-12-13 09:52:19'),
(91, 'sdfgsdfg', 0, '2022-01-22 10:52:25', '2022-01-22 10:52:25'),
(92, 'fff', 0, '2022-01-22 10:54:30', '2022-01-22 10:54:30'),
(93, 'sdfgsdfg', 0, '2022-02-02 09:03:49', '2022-02-02 09:03:49'),
(94, 'sdfgsdfg', 0, '2022-02-11 06:05:11', '2022-02-11 06:05:11'),
(95, 'asdfasdf', 0, '2022-02-11 07:35:19', '2022-02-11 07:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `category_id`, `subcategory_id`, `title`, `description`, `file`, `video_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 47, 1, 'asdf', 'asdfa', '1623437796.jpg', 'asdfasd', '2021-06-11 12:56:36', '2021-06-14 12:24:33', '2021-06-14 12:24:33'),
(2, 48, 5, 'hjghj', 'hf', '1623438237.jpg', 'ghgh', '2021-06-11 13:03:58', '2021-06-14 12:24:27', '2021-06-14 12:24:27'),
(3, 48, 5, 'adsfasdf', 'asdf', '1623439029.jpg', 'asdf', '2021-06-11 13:17:09', '2021-06-14 12:24:21', '2021-06-14 12:24:21'),
(4, 47, 1, 'asdf', 'fgsdf', '1623440674.png', 'sdfgsdfg', '2021-06-11 13:44:35', '2021-06-14 12:24:05', '2021-06-14 12:24:05'),
(5, 47, 1, 'uui', 'hgfh', '', 'asdf', '2021-06-11 14:34:22', '2021-06-14 12:24:01', '2021-06-14 12:24:01'),
(6, 47, 1, 'Contact Infosdfasdf', 'asdfsad', '1623601865.jpg', 'asdfasdfasdf', '2021-06-13 10:31:05', '2021-06-14 12:21:10', '2021-06-14 12:21:10'),
(7, 47, 1, 'sadfasd', 'asdfasd', '1623601926.jpg', 'asdfasdfasdf', '2021-06-13 10:32:06', '2021-06-14 12:19:33', '2021-06-14 12:19:33'),
(8, 47, 1, 'asdf', 'hgjg', '1623695594.jpg', 'hjghj', '2021-06-14 12:33:15', '2021-06-14 12:33:35', '2021-06-14 12:33:35'),
(9, 47, 1, 'ghgh', 'dfgfg', '1623695727.jpg', 'dsfgsf', '2021-06-14 12:35:27', '2021-06-14 12:51:19', '2021-06-14 12:51:19'),
(10, 47, 1, 'asdf', 'sdfas', '1623696740.jpg', 'fasdf', '2021-06-14 12:52:20', '2021-06-14 12:54:23', '2021-06-14 12:54:23'),
(11, 47, 1, 'eeeeeeeeeeeeeeeeeee', 'dasdfasdf', '', 'FFFFF', '2021-06-14 13:14:40', '2021-06-16 12:45:49', NULL),
(12, 47, 1, 'sdfa', 'asdfasdf', '1624986138.jpg', 'asdf', '2021-06-29 11:02:18', '2021-06-29 11:02:18', NULL),
(13, 47, 1, 'n', 'g', '1635354674.jpg', 'asdf', '2021-10-27 11:11:14', '2021-10-27 11:11:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_21_192339_create_category', 2),
(5, '2021_05_29_182239_create_sub_categories_table', 3),
(6, '2021_06_07_171805_create_contents_table', 4),
(7, '2021_06_09_162652_create_contents_table', 5),
(10, '2021_06_29_171008_create_permission_tables', 6),
(12, '2014_10_12_000000_create_users_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(2, 'role-create', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(3, 'role-edit', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(4, 'role-delete', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(5, 'category-list', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(6, 'category-create', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(7, 'category-edit', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(8, 'category-delete', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(9, 'subcategory-list', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(10, 'subcategory-create', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(11, 'subcategory-edit', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(12, 'subcategory-delete', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(13, 'content-list', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(14, 'content-create', 'web', '2021-11-27 12:09:24', '2021-11-27 12:09:24'),
(15, 'content-edit', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25'),
(16, 'content-delete', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25'),
(17, 'user-list', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25'),
(18, 'user-create', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25'),
(19, 'user-edit', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25'),
(20, 'user-delete', 'web', '2021-11-27 12:09:25', '2021-11-27 12:09:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'Admin', 'web', '2021-11-27 13:07:50', '2021-11-27 13:07:50'),
(4, 'test', 'web', '2021-11-27 13:08:41', '2021-11-27 13:08:41'),
(5, 'aaaaaaaaaaaaa', 'web', '2021-11-28 10:17:20', '2021-11-28 10:17:20'),
(6, 'ww', 'web', '2021-11-28 10:17:56', '2021-11-28 10:17:56'),
(7, 'qqq', 'web', '2021-11-28 10:23:00', '2021-11-28 10:23:00'),
(8, 'zz', 'web', '2021-11-29 11:01:31', '2021-11-29 11:01:31'),
(9, 'Teacher', 'web', '2021-11-29 11:59:42', '2021-11-29 11:59:42'),
(10, 'asdfasdf', 'web', '2021-11-29 12:23:33', '2021-11-29 12:23:33'),
(11, 'trest', 'web', '2021-11-30 09:05:37', '2021-11-30 09:05:37'),
(12, 'rrrr', 'web', '2021-11-30 09:08:19', '2021-11-30 09:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 11),
(2, 3),
(2, 4),
(2, 11),
(3, 3),
(3, 11),
(4, 3),
(4, 5),
(4, 11),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(6, 3),
(6, 4),
(6, 5),
(6, 12),
(7, 3),
(7, 5),
(8, 3),
(8, 11),
(9, 3),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(10, 3),
(10, 11),
(10, 12),
(11, 3),
(11, 11),
(12, 3),
(12, 11),
(13, 3),
(13, 8),
(13, 10),
(13, 11),
(13, 12),
(14, 3),
(14, 8),
(14, 11),
(15, 3),
(15, 11),
(16, 3),
(16, 11),
(17, 3),
(17, 11),
(17, 12),
(18, 3),
(18, 11),
(19, 3),
(19, 11),
(20, 3),
(20, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_sub_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `cat_sub_name`, `status`, `created_at`, `updated_at`) VALUES
(14, 48, 'testdddd', 0, '2021-12-13 11:10:41', '2021-12-13 11:28:33'),
(15, 49, 'sdgsdfg', 0, '2022-02-02 09:05:29', '2022-02-02 09:05:29'),
(16, 49, 'asdfsd', 0, '2022-03-04 00:15:23', '2022-03-04 00:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Hardik Savani', 'admind@gmail.com', NULL, '$2y$10$a1enITuoWqPLXOTtQQK5lO12OQhJoxGMJTSDKIsVUvCTLkjYBgUsW', NULL, '2021-11-27 13:07:50', '2021-11-27 13:07:50'),
(3, 'sd sdfg', 'aasdfassdf@gmail.com', NULL, '$2y$10$gKcffXcy.TGSXbzyZu71X.zeqFmdvqS2RvavlPuYKLrKQh34JEl.y', NULL, '2021-12-10 12:44:36', '2021-12-10 12:44:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
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
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
