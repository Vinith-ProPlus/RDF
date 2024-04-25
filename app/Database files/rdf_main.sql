-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 01:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpc_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01c021360e7933bee9a72ae4adb358515983f3f473f1888435e38a562dde9c6cf27bc77bff1ccb2e', 11, 1, 'Token', '[]', 0, '2024-02-22 08:45:34', '2024-02-22 08:45:34', '2025-02-22 14:15:34'),
('0ce444a33b39b5d5a60aeebc46c3b4f9a62fcadbef89de8e1a69d8553c086c9029f89843dbddc45c', 4, 1, 'Token', '[]', 0, '2024-02-21 10:44:24', '2024-02-21 10:44:24', '2025-02-21 16:14:24'),
('0e79da7d72dae5baa344973de5316bf9efd80483d8275f711424762db1016c6c55c2ba6962976c60', 8, 1, 'Token', '[]', 0, '2024-02-29 04:34:05', '2024-02-29 04:34:05', '2025-03-01 10:04:05'),
('0f5220711df65aaf1a28bb99149768a449d6a6eb8ab634e11d3342c0000b67ca657fc9a7e39c8293', 11, 1, 'Token', '[]', 0, '2024-02-22 07:55:04', '2024-02-22 07:55:04', '2025-02-22 13:25:04'),
('14cd7fc34b792dae070f7203529f11e070b9fbe19e7e625a936ab8c1413b23183f3cc763fe36d7dc', 10, 1, 'Token', '[]', 0, '2024-02-22 04:37:45', '2024-02-22 04:37:45', '2025-02-22 10:07:45'),
('1bea773ec7dbf36c734854a8c29c0c393f79969f8360aa335d4d460d15f8f0827069882bda314e2f', 12, 1, 'Token', '[]', 0, '2024-02-22 10:24:18', '2024-02-22 10:24:18', '2025-02-22 15:54:18'),
('260d27de3c8cdca36d29c5b04ebbc30cd339e0c183f6b808d3eb48b310f9bc6a9b0a151d4f99ccbc', 4, 1, 'Token', '[]', 0, '2024-02-21 10:42:17', '2024-02-21 10:42:17', '2025-02-21 16:12:17'),
('2a7cc9725ac44f2b644f9bbe5cb5b1271bd3fcfee447970e00df90f07c427eed98692096da270a01', 4, 1, 'Token', '[]', 0, '2024-02-21 10:44:12', '2024-02-21 10:44:12', '2025-02-21 16:14:12'),
('306d980025e3e26665bb6f689bf0f44bf7a5cd7382fe68843cff74bcc5aa7ae755aa9542d0f54185', 8, 1, 'Token', '[]', 0, '2024-02-21 12:13:20', '2024-02-21 12:13:20', '2025-02-21 17:43:20'),
('35228aecae5038a10dc14cf6fc13ce20b5db25055178f9915e31dabb0a9926707652fca8eaad0e1e', 4, 1, 'Token', '[]', 0, '2024-02-20 12:53:04', '2024-02-20 12:53:04', '2025-02-20 18:23:04'),
('3942b7dca44d5ad441d05aa0701fcdf8cc74285d905328c4e04a67cdec8d7b99a7e53df3f11dceeb', 8, 1, 'Token', '[]', 0, '2024-02-22 04:25:21', '2024-02-22 04:25:21', '2025-02-22 09:55:21'),
('3adaff79948f8ed1df7bc6cd0e178ef934ce301e070ee310e301376646bc54bbd3c21e48bab9cfb3', 4, 1, 'Token', '[]', 0, '2024-02-21 10:12:41', '2024-02-21 10:12:41', '2025-02-21 15:42:41'),
('41255058771abf7a85d01318dbe577d28c47eb1231fc779aaa2548a72c67d4d8349c34507281d28a', 8, 1, 'Token', '[]', 0, '2024-02-29 04:24:59', '2024-02-29 04:24:59', '2025-03-01 09:54:59'),
('43e2d02168c4d6c58fff25b6f7a4b39d34d0b8b29aad56428325f4b39f21f7e93cbfbffcffb3066f', 13, 1, 'Token', '[]', 0, '2024-03-06 04:17:17', '2024-03-06 04:17:17', '2025-03-06 09:47:17'),
('4487493cfd02ef777c9e4b95c0edf83495cbfd1c2dd93750c4df6f312dc6be4e3617808584fe351b', 8, 1, 'Token', '[]', 0, '2024-02-22 06:35:30', '2024-02-22 06:35:30', '2025-02-22 12:05:30'),
('45b31568b171ab88c54289436ae9180e29ea756de76cff67a0dcfc12c8fd84dce01e736d7599526f', 13, 1, 'Token', '[]', 0, '2024-02-22 11:52:37', '2024-02-22 11:52:37', '2025-02-22 17:22:37'),
('4710365378a0df25e22a33630de20f7aa68f934baf30c2a25111c060f2e730e92a3ee019d4178085', 7, 1, 'Token', '[]', 0, '2024-02-21 11:30:58', '2024-02-21 11:30:58', '2025-02-21 17:00:58'),
('49f2ef695746404709593520538f989dd248eb6eddb4fcd1d5eb34539bdc30c75948d428b76d0e68', 4, 1, 'Token', '[]', 0, '2024-02-21 10:11:14', '2024-02-21 10:11:14', '2025-02-21 15:41:14'),
('4a3d0e25fa4f538dd08cffff9941e0b3a47b9e4a98a1cdabf495eefc6f2e93accad494e8d7c3273a', 1, 1, 'Token', '[]', 0, '2024-01-29 05:38:04', '2024-01-29 05:38:04', '2025-01-29 11:08:04'),
('4e2fa5ad6613e985a102d122e3461f096a009fde3aef40eb4447ccabf40624115dd31c1d933f2da1', 1, 1, 'Token', '[]', 0, '2024-01-29 05:31:41', '2024-01-29 05:31:41', '2025-01-29 11:01:41'),
('4f04830cbe84394347b10c8679febdd6d0abb09bc77d04a51624aa910f8fcc343dd84ad1c95b73f0', 1, 1, 'Token', '[]', 0, '2024-02-21 06:45:59', '2024-02-21 06:45:59', '2025-02-21 12:15:59'),
('509f563ea650f409c1c5240caf0fd9ca5d0e761d32f498f05c8766f119d9a050b2757d5d19774698', 11, 1, 'Token', '[]', 0, '2024-02-22 06:28:51', '2024-02-22 06:28:51', '2025-02-22 11:58:51'),
('50b2d137588b7b6c2b8b8a95fad085a2d583bd29555f0a74864b95d94b51f0f54aca376f28c63f15', 1, 1, 'Token', '[]', 0, '2024-01-29 05:37:15', '2024-01-29 05:37:15', '2025-01-29 11:07:15'),
('52eaf2aff1ff8c213d5e4a316af73bc4bf7a989ae39e9bd20914cfd9b3ad482754b84c58f150067d', 11, 1, 'Token', '[]', 0, '2024-02-22 06:30:09', '2024-02-22 06:30:09', '2025-02-22 12:00:09'),
('535a50241c0d2e9b17948d530bbd8b2ddbc051a581d3d1e3d014e186b7c6c3000951b1107f67c9ad', 1, 1, 'Token', '[]', 0, '2024-02-21 06:47:46', '2024-02-21 06:47:46', '2025-02-21 12:17:46'),
('55c559f2324b52b4a441046d1741d83dc654e0d3f8c7b315650fab1a41a823e0be49590c3751953c', 13, 1, 'Token', '[]', 0, '2024-02-23 04:16:12', '2024-02-23 04:16:12', '2025-02-23 09:46:12'),
('5ca9070b86e0e3466d160f980a45412cf83ec87899ee3bc6d40fd18f4a69139e80cb0d87e124fd98', 1, 1, 'Token', '[]', 0, '2024-01-29 05:30:57', '2024-01-29 05:30:57', '2025-01-29 11:00:57'),
('609f2337e35406d51a2e5daacd24893506abdcd93354576962eef01f35e84c91fd18e58f5d3443fd', 1, 1, 'Token', '[]', 0, '2024-01-30 09:38:08', '2024-01-30 09:38:08', '2025-01-30 15:08:08'),
('681f52d4c56a4d00b287aa48799e546da632a42d1b874e50adbc1f23f1113ba82bde877273550618', 4, 1, 'Token', '[]', 0, '2024-02-21 10:07:38', '2024-02-21 10:07:39', '2025-02-21 15:37:38'),
('6bda8deff03fc4378f9b32ec4f17679c4d71886878b01f3ab589152cbce8cd46ad8749ce824d0f3c', 1, 1, 'Token', '[]', 0, '2024-01-27 05:56:00', '2024-01-27 05:56:01', '2025-01-27 11:26:00'),
('6cd7729d91be6f48d3824bac8d48ab65a6a27ba660e2b23cde32b494f217015ed2d5c774704ae852', 1, 1, 'Token', '[]', 0, '2024-02-20 12:35:33', '2024-02-20 12:35:33', '2025-02-20 18:05:33'),
('76a73e46a8bf4faa1b7c5b4e2335e2e994abd11c62a65a7726eb812f9737a9c7004fe1a84f859818', 9, 1, 'Token', '[]', 0, '2024-02-21 13:38:24', '2024-02-21 13:38:24', '2025-02-21 19:08:24'),
('7a9867d3d00403702114d7e5af7dbdaea103a4fe04f85b347dc49e34a30cb33380e7c7b4b0490476', 11, 1, 'Token', '[]', 0, '2024-02-22 06:29:07', '2024-02-22 06:29:07', '2025-02-22 11:59:07'),
('80fc07889d6f5a4471692f6adcf8e9b5607dfe0db28a2ef4fb7d13f781987a7733d17cd7ffd1b019', 1, 1, 'Token', '[]', 0, '2024-01-29 05:24:33', '2024-01-29 05:24:33', '2025-01-29 10:54:33'),
('85682d76097e987a326714309cf4896e32f5abae9f2a9ebd7b25ca355bc771e7d2bc4597b1dc96cd', 8, 1, 'Token', '[]', 0, '2024-02-29 04:29:47', '2024-02-29 04:29:47', '2025-03-01 09:59:47'),
('8a6225d918a65584b128073e4d06954a3769f31b80b9d63fe9021e459c34682cc32a2c430bd3c7c1', 1, 1, 'Token', '[]', 0, '2024-01-29 05:34:33', '2024-01-29 05:34:33', '2025-01-29 11:04:33'),
('97f353afde005fdd966c9e74ce31fdbcbb3fc6fad937609c295c7704668447ede11259e357ae2ae4', 4, 1, 'Token', '[]', 0, '2024-02-20 12:53:12', '2024-02-20 12:53:12', '2025-02-20 18:23:12'),
('98f56097d414b75ea111e0093d0d97baa4fbf704eb9b6cd495a9fd734d5c83cde1711c14defbe900', 13, 1, 'Token', '[]', 0, '2024-02-22 11:59:05', '2024-02-22 11:59:05', '2025-02-22 17:29:05'),
('99261374188dab4b97d41265bfce17e375b5c49d89cb1bf0ae4db97410f501e9d42289f1aa965d5c', 8, 1, 'Token', '[]', 0, '2024-02-21 13:17:08', '2024-02-21 13:17:08', '2025-02-21 18:47:08'),
('9efeb78440c1ed84b2fc003d03ecfb9cfc83e4a981b304b99ebab89e4a576221f9fb0854f58cc75b', 1, 1, 'Token', '[]', 0, '2024-01-29 05:36:03', '2024-01-29 05:36:03', '2025-01-29 11:06:03'),
('a28f4bb735db06f40738193c4d6c40806ae6d2371f5d6348b0a8f87fd7d6495caf445e75d104feda', 1, 1, 'Token', '[]', 0, '2024-01-29 05:32:26', '2024-01-29 05:32:26', '2025-01-29 11:02:26'),
('a45a46994cad7f3c70e9c37c730f5c306756edde5926bdbc4ae0ab1dc3f9a755018095bc5ee15616', 1, 1, 'Token', '[]', 0, '2024-01-29 05:26:13', '2024-01-29 05:26:13', '2025-01-29 10:56:13'),
('ab1a9575350c175a67282c9cf2ddfdc7c6412e62beacb3489419aad707c9b8969c11e245b1cbac54', 1, 1, 'Token', '[]', 0, '2024-02-20 12:48:06', '2024-02-20 12:48:06', '2025-02-20 18:18:06'),
('b0cd97eb175568e77920a63a2749085e904534fc4f1360131862280fda78a91d9a536c95d9259f32', 4, 1, 'Token', '[]', 0, '2024-02-21 10:40:43', '2024-02-21 10:40:43', '2025-02-21 16:10:43'),
('b3cd547a2ac14ebce21a48a777749f32aad8115fd99b877634259520c7d190000f0598548a38ce60', 7, 1, 'Token', '[]', 0, '2024-02-21 11:31:23', '2024-02-21 11:31:23', '2025-02-21 17:01:23'),
('b58e4053a3d9c8cf9f8134655c0ad666021e1c3411c82af6eaf9a35f64746ac35bacd7968b847a16', 4, 1, 'Token', '[]', 0, '2024-02-20 12:52:39', '2024-02-20 12:52:39', '2025-02-20 18:22:39'),
('c1ee0e382038b22e2d43c3afa28a646cede4ff966d6c2fba86411975c05efff054027a619dd11e35', 4, 1, 'Token', '[]', 0, '2024-02-21 10:42:46', '2024-02-21 10:42:46', '2025-02-21 16:12:46'),
('c9b23d4fd690e17b84039cf373d088beda851319fc3e87a015d01ef31cc84ed0d7ed8ebe80d21315', 8, 1, 'Token', '[]', 0, '2024-02-28 04:48:16', '2024-02-28 04:48:16', '2025-02-28 10:18:16'),
('cc7d574900ca79e8297e1afb895dd4d48e653aa0f0bd90d1c8e6ca8e592709b20db635915ad189b3', 8, 1, 'Token', '[]', 0, '2024-02-22 04:33:08', '2024-02-22 04:33:08', '2025-02-22 10:03:08'),
('d5909af02c5940a7578b65c08eb93b1f7a8fa3781fe849198a24a5f27355309af404827c77355c20', 10, 1, 'Token', '[]', 0, '2024-02-22 05:23:19', '2024-02-22 05:23:19', '2025-02-22 10:53:19'),
('d74e3e2a608ab2f6e8a449bffcf5afdab7ffa84151f5624b1219932c0234550997c2e9d5b1218567', 12, 1, 'Token', '[]', 0, '2024-02-22 10:02:05', '2024-02-22 10:02:06', '2025-02-22 15:32:05'),
('de0aa27c600e37495fab542e50ae66bf53490cee5173ed56971c4dbf897820a8244acb2c04aab75d', 10, 1, 'Token', '[]', 0, '2024-02-22 04:41:18', '2024-02-22 04:41:18', '2025-02-22 10:11:18'),
('de4f796e0a178380733e5cb0cc0531b2affb12c2b93a42678635a79c651dc4d7da4110d96734cf87', 12, 1, 'Token', '[]', 0, '2024-02-22 10:20:38', '2024-02-22 10:20:38', '2025-02-22 15:50:38'),
('e0c985bdf156056014003c1df638b3b14e19ae6a815328d4cc832979883cf16bce1edf36a8fc8c52', 1, 1, 'Token', '[]', 0, '2024-01-29 05:36:25', '2024-01-29 05:36:25', '2025-01-29 11:06:25'),
('e277eada6a8d1d992832061a8987e5586479728b00a19c1a3316205efcff02b1e55272c9e3cdff7f', 23, 1, 'Token', '[]', 0, '2024-03-06 04:28:49', '2024-03-06 04:28:49', '2025-03-06 09:58:49'),
('fb006a7d7b5b0e259d23ef9c903b5cd3cf74bb64035a2c160ec90cee031e6744546454123c4b7529', 4, 1, 'Token', '[]', 0, '2024-02-21 06:22:03', '2024-02-21 06:22:03', '2025-02-21 11:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'RPC Personal Access Client', 'IgDxXKdkzSBIRs9gy56Qn1oArdyGZWUHrz4NXNKk', NULL, 'http://localhost', 1, 0, 0, '2024-01-25 04:33:55', '2024-01-25 04:33:55'),
(2, NULL, 'RPC Password Grant Client', 'a74olBYEiGE8kuSoySMoUEQVAUHOD55TZhCWKApn', 'users', 'http://localhost', 0, 1, 0, '2024-01-25 04:33:55', '2024-01-25 04:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-01-25 04:33:55', '2024-01-25 04:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Token', 'bf359f7b41bb8f46cceb2269b3f56f3c16dc05563e1cda96a97034f57cf21101', '[\"*\"]', NULL, NULL, '2024-01-27 05:45:21', '2024-01-27 05:45:21'),
(2, 'App\\Models\\User', 1, 'Token', '8bc36af546a361cded83092227a01519eb0e4edc39f09f4def4cb1f06271ee55', '[\"*\"]', NULL, NULL, '2024-01-27 05:46:37', '2024-01-27 05:46:37'),
(3, 'App\\Models\\User', 1, 'Token', '9ed90cc3f9b9d69e046ead048d4d7ca5739dadd3e25d1eff93d2264433a7d101', '[\"*\"]', NULL, NULL, '2024-01-27 05:53:26', '2024-01-27 05:53:26'),
(4, 'App\\Models\\User', 1, 'Token', '61b67dc83474ed2ae30b1a3fc0567eabc385281350d1bab7c47d090040e1106f', '[\"*\"]', NULL, NULL, '2024-01-27 05:53:45', '2024-01-27 05:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ad_banners`
--

CREATE TABLE `tbl_ad_banners` (
  `S.No` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `BannerImage` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `DFlag` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attributes`
--

CREATE TABLE `tbl_attributes` (
  `AttrID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AttrName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Values` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Active',
  `DFlag` int(11) NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_attributes`
--

INSERT INTO `tbl_attributes` (`AttrID`, `AttrName`, `Values`, `ActiveStatus`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('AT2023-0000001', 'Packaging Type', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:5:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:21:\"Multi-wall Paper Bags\";s:7:\"ValueID\";s:15:\"ATV2023-0000001\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000001\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:1;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:17:\"Polyethylene Bags\";s:7:\"ValueID\";s:15:\"ATV2023-0000002\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000002\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:2;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:28:\"Paper-Plastic Laminated Bags\";s:7:\"ValueID\";s:15:\"ATV2023-0000003\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000003\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:3;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:24:\"Woven Polypropylene Bags\";s:7:\"ValueID\";s:15:\"ATV2023-0000004\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000004\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:4;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:40:\"Kraft Paper Bags with Polyethylene Liner\";s:7:\"ValueID\";s:15:\"ATV2023-0000005\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000005\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:0:{}}', 'Active', 0, '2023-12-28 06:50:27', '2024-01-25 10:29:51', NULL, 'U2023-0000002', 'U2023-0000002', NULL),
('AT2023-0000002', 'Brand', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:5:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:9:\"UltraTech\";s:7:\"ValueID\";s:15:\"ATV2023-0000006\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000002\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000035\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:1;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:3:\"ACC\";s:7:\"ValueID\";s:15:\"ATV2023-0000007\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000003\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000050\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:2;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:6:\"Ambuja\";s:7:\"ValueID\";s:15:\"ATV2023-0000008\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000008\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:3;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:6:\"Dalmia\";s:7:\"ValueID\";s:15:\"ATV2023-0000009\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000009\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:4;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:5:\"Birla\";s:7:\"ValueID\";s:15:\"ATV2023-0000010\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2023-0000010\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2023-0000001\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:0:{}}', 'Active', 0, '2023-12-28 06:52:56', '2024-01-26 11:17:43', NULL, 'U2023-0000002', 'U2023-0000002', NULL),
('AT2024-0000003', 'Unit', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:1:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:4:\"3600\";s:7:\"ValueID\";s:0:\"\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:0:\"\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2024-0000007\";s:5:\"PSCID\";s:15:\"PSC2024-0000003\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:0:{}}', 'Active', 0, '2024-01-02 07:41:07', NULL, NULL, 'U2023-0000002', NULL, NULL),
('AT2024-0000004', 'Type', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:11:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:3:\"OPC\";s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000004\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:1;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:3:\"PPC\";s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000005\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:2;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:3:\"PSC\";s:7:\"ValueID\";s:15:\"ATV2024-0000018\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000010\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:3;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:9:\"Compocem \";s:7:\"ValueID\";s:15:\"ATV2024-0000019\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000011\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:4;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:11:\"Concreel HD\";s:7:\"ValueID\";s:15:\"ATV2024-0000020\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000012\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:5;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:12:\"Weather Plus\";s:7:\"ValueID\";s:15:\"ATV2024-0000021\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000013\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:6;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:10:\"Composite \";s:7:\"ValueID\";s:15:\"ATV2024-0000022\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000014\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:7;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:12:\"JSW Portland\";s:7:\"ValueID\";s:15:\"ATV2024-0000023\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000015\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:8;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:20:\"Zuari Primo Greencem\";s:7:\"ValueID\";s:15:\"ATV2024-0000024\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000016\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:9;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:20:\"Penna Power Sureksha\";s:7:\"ValueID\";s:15:\"ATV2024-0000025\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000017\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:10;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:7:\"Premium\";s:7:\"ValueID\";s:0:\"\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:0:\"\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:0:{}}', 'Active', 0, '2024-01-27 04:09:29', '2024-01-30 10:22:05', NULL, 'U2023-0000002', 'U2023-0000002', NULL),
('AT2024-0000005', 'Packaging Size', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:1:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:5:\"50 kg\";s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:15:\"AVC2024-0000009\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:1:{i:0;s:15:\"ATV2324-0000027\";}}', 'Active', 0, '2024-01-27 05:36:38', '2024-03-06 04:45:18', NULL, 'U2023-0000002', 'U2023-0000001', NULL),
('AT2024-0000006', 'Grade', 'O:8:\"stdClass\":2:{s:14:\"ExistingValues\";a:2:{i:0;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:8:\"53 Grade\";s:7:\"ValueID\";s:0:\"\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:0:\"\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}i:1;O:8:\"stdClass\":4:{s:9:\"ValueName\";s:8:\"43 Grade\";s:7:\"ValueID\";s:0:\"\";s:12:\"CategoryData\";O:8:\"stdClass\":2:{s:10:\"Categories\";O:8:\"stdClass\":2:{s:8:\"DetailID\";s:0:\"\";s:11:\"CategoryIDs\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"PCID\";s:14:\"PC2023-0000001\";s:5:\"PSCID\";s:15:\"PSC2024-0000080\";}}}s:16:\"DeletedDetailIDs\";a:0:{}}s:9:\"ValueLogo\";O:8:\"stdClass\":2:{s:13:\"isLogoRemoved\";s:1:\"0\";s:16:\"existingLogoPath\";s:0:\"\";}}}s:15:\"DeletedValueIDs\";a:0:{}}', 'Active', 0, '2024-01-27 05:38:19', NULL, NULL, 'U2023-0000002', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attributes_category_mapping`
--

CREATE TABLE `tbl_attributes_category_mapping` (
  `DetailID` varchar(50) NOT NULL,
  `AttrID` varchar(50) NOT NULL,
  `ValueID` varchar(50) DEFAULT NULL,
  `PCID` varchar(50) DEFAULT NULL,
  `PSCID` varchar(50) DEFAULT NULL,
  `DFlag` int(11) NOT NULL DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_attributes_category_mapping`
--

INSERT INTO `tbl_attributes_category_mapping` (`DetailID`, `AttrID`, `ValueID`, `PCID`, `PSCID`, `DFlag`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
('AVC2023-0000001', 'AT2023-0000001', 'ATV2023-0000001', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:50:27', 'U2023-0000002', '2024-01-25 10:29:51'),
('AVC2023-0000002', 'AT2023-0000001', 'ATV2023-0000002', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:50:27', 'U2023-0000002', '2024-01-25 10:29:51'),
('AVC2023-0000003', 'AT2023-0000001', 'ATV2023-0000003', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:50:27', 'U2023-0000002', '2024-01-25 10:29:51'),
('AVC2023-0000004', 'AT2023-0000001', 'ATV2023-0000004', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:50:27', 'U2023-0000002', '2024-01-25 10:29:51'),
('AVC2023-0000005', 'AT2023-0000001', 'ATV2023-0000005', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:50:27', 'U2023-0000002', '2024-01-25 10:29:51'),
('AVC2023-0000006', 'AT2023-0000002', 'ATV2023-0000006', 'PC2023-0000001', 'PSC2023-0000001', 1, 'U2023-0000002', '2023-12-28 06:52:56', 'U2023-0000001', '2024-01-25 10:43:35'),
('AVC2023-0000007', 'AT2023-0000002', 'ATV2023-0000007', 'PC2023-0000001', 'PSC2023-0000001', 1, 'U2023-0000002', '2023-12-28 06:52:56', 'U2023-0000001', '2024-01-25 10:43:35'),
('AVC2023-0000008', 'AT2023-0000002', 'ATV2023-0000008', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:52:56', 'U2023-0000002', '2024-01-26 11:17:43'),
('AVC2023-0000009', 'AT2023-0000002', 'ATV2023-0000009', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000002', '2023-12-28 06:52:56', 'U2023-0000002', '2024-01-26 11:17:43'),
('AVC2023-0000010', 'AT2023-0000002', 'ATV2023-0000010', 'PC2023-0000001', 'PSC2023-0000001', 0, 'U2023-0000001', '2023-12-29 06:16:26', 'U2023-0000002', '2024-01-26 11:17:43'),
('AVC2024-0000001', 'AT2024-0000003', 'ATV2024-0000011', 'PC2024-0000007', 'PSC2024-0000003', 0, 'U2023-0000002', '2024-01-02 07:41:07', NULL, NULL),
('AVC2024-0000002', 'AT2023-0000002', 'ATV2023-0000006', 'PC2023-0000001', 'PSC2024-0000035', 0, 'U2023-0000001', '2024-01-25 10:43:35', 'U2023-0000002', '2024-01-26 11:17:43'),
('AVC2024-0000003', 'AT2023-0000002', 'ATV2023-0000007', 'PC2023-0000001', 'PSC2024-0000050', 0, 'U2023-0000001', '2024-01-25 10:43:35', 'U2023-0000002', '2024-01-26 11:17:43'),
('AVC2024-0000004', 'AT2024-0000004', 'ATV2024-0000012', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 04:09:29', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000005', 'AT2024-0000004', 'ATV2024-0000013', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 04:09:29', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000006', 'AT2024-0000005', 'ATV2024-0000014', 'PC2023-0000001', 'PSC2024-0000080', 1, 'U2023-0000002', '2024-01-27 05:36:38', 'U2023-0000002', '2024-01-27 07:40:04'),
('AVC2024-0000007', 'AT2024-0000006', 'ATV2024-0000015', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 05:38:19', NULL, NULL),
('AVC2024-0000008', 'AT2024-0000006', 'ATV2024-0000016', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 05:38:19', NULL, NULL),
('AVC2024-0000009', 'AT2024-0000005', 'ATV2024-0000017', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 07:40:04', 'U2023-0000001', '2024-03-06 04:45:18'),
('AVC2024-0000010', 'AT2024-0000004', 'ATV2024-0000018', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-27 09:39:20', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000011', 'AT2024-0000004', 'ATV2024-0000019', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-29 11:29:34', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000012', 'AT2024-0000004', 'ATV2024-0000020', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-29 11:52:42', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000013', 'AT2024-0000004', 'ATV2024-0000021', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-29 12:06:35', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000014', 'AT2024-0000004', 'ATV2024-0000022', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-29 12:06:35', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000015', 'AT2024-0000004', 'ATV2024-0000023', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-30 04:07:24', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000016', 'AT2024-0000004', 'ATV2024-0000024', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-30 04:07:24', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000017', 'AT2024-0000004', 'ATV2024-0000025', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-30 04:08:34', 'U2023-0000002', '2024-01-30 10:22:05'),
('AVC2024-0000018', 'AT2024-0000004', 'ATV2024-0000026', 'PC2023-0000001', 'PSC2024-0000080', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('AVC2324-0000019', 'AT2024-0000005', 'ATV2324-0000027', 'PC2023-0000001', 'PSC2023-0000001', 1, 'U2023-0000001', '2024-03-06 04:39:04', 'U2023-0000001', '2024-03-06 04:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attributes_details`
--

CREATE TABLE `tbl_attributes_details` (
  `ValueID` varchar(50) NOT NULL,
  `AttrID` varchar(50) NOT NULL,
  `Values` text DEFAULT NULL,
  `ValueLogo` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `DFlag` int(11) NOT NULL DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_attributes_details`
--

INSERT INTO `tbl_attributes_details` (`ValueID`, `AttrID`, `Values`, `ValueLogo`, `Images`, `DFlag`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
('ATV2023-0000001', 'AT2023-0000001', 'Multi-wall Paper Bags', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-25 10:29:51', NULL, NULL),
('ATV2023-0000002', 'AT2023-0000001', 'Polyethylene Bags', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-25 10:29:51', NULL, NULL),
('ATV2023-0000003', 'AT2023-0000001', 'Paper-Plastic Laminated Bags', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-25 10:29:51', NULL, NULL),
('ATV2023-0000004', 'AT2023-0000001', 'Woven Polypropylene Bags', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-25 10:29:51', NULL, NULL),
('ATV2023-0000005', 'AT2023-0000001', 'Kraft Paper Bags with Polyethylene Liner', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-25 10:29:51', NULL, NULL),
('ATV2023-0000006', 'AT2023-0000002', 'UltraTech', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-26 11:17:43', NULL, NULL),
('ATV2023-0000007', 'AT2023-0000002', 'ACC', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-26 11:17:43', NULL, NULL),
('ATV2023-0000008', 'AT2023-0000002', 'Ambuja', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-26 11:17:43', NULL, NULL),
('ATV2023-0000009', 'AT2023-0000002', 'Dalmia', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-26 11:17:43', NULL, NULL),
('ATV2023-0000010', 'AT2023-0000002', 'Birla', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-26 11:17:43', NULL, NULL),
('ATV2024-0000011', 'AT2024-0000003', '3600', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-02 07:41:07', NULL, NULL),
('ATV2024-0000012', 'AT2024-0000004', 'OPC', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000013', 'AT2024-0000004', 'PPC', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000014', 'AT2024-0000005', 'kg', '', 'a:0:{}', 1, 'U2023-0000002', '2024-01-27 05:36:38', 'U2023-0000002', '2024-01-27 07:40:04'),
('ATV2024-0000015', 'AT2024-0000006', '53 Grade', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-27 05:38:19', NULL, NULL),
('ATV2024-0000016', 'AT2024-0000006', '43 Grade', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-27 05:38:19', NULL, NULL),
('ATV2024-0000017', 'AT2024-0000005', '50 kg', '', 'a:0:{}', 0, 'U2023-0000001', '2024-03-06 04:45:18', NULL, NULL),
('ATV2024-0000018', 'AT2024-0000004', 'PSC', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000019', 'AT2024-0000004', 'Compocem ', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000020', 'AT2024-0000004', 'Concreel HD', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000021', 'AT2024-0000004', 'Weather Plus', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000022', 'AT2024-0000004', 'Composite ', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000023', 'AT2024-0000004', 'JSW Portland', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000024', 'AT2024-0000004', 'Zuari Primo Greencem', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000025', 'AT2024-0000004', 'Penna Power Sureksha', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2024-0000026', 'AT2024-0000004', 'Premium', '', 'a:0:{}', 0, 'U2023-0000002', '2024-01-30 10:22:05', NULL, NULL),
('ATV2324-0000027', 'AT2024-0000005', '100 kg', '', 'a:0:{}', 1, 'U2023-0000001', '2024-03-06 04:39:04', 'U2023-0000001', '2024-03-06 04:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auto_number`
--

CREATE TABLE `tbl_auto_number` (
  `SLNO` int(11) NOT NULL,
  `DocType` varchar(50) NOT NULL,
  `Prefix` varchar(10) DEFAULT NULL,
  `FYear` varchar(10) DEFAULT NULL,
  `CurrNum` int(20) DEFAULT 1,
  `Suffix` varchar(20) DEFAULT NULL,
  `OrderBy` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_auto_number`
--

INSERT INTO `tbl_auto_number` (`SLNO`, `DocType`, `Prefix`, `FYear`, `CurrNum`, `Suffix`, `OrderBy`) VALUES
(1, 'Quote-Enquiry', 'RPC', '22-23', 14, 'ENQ', 'Prefix-CurrNum-/-FY'),
(2, 'Quotation', 'RPC', '22-23', 1, 'QTN', 'Prefix-CurrNum-/-FY'),
(3, 'Sales-Order', 'RPC', '22-23', 1, 'ODR', 'Prefix-CurrNum-/-FY');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brands`
--

CREATE TABLE `tbl_brands` (
  `BrandID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BrandName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BrandLogo` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Active',
  `DFlag` int(1) DEFAULT 0,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_settings`
--

CREATE TABLE `tbl_company_settings` (
  `SLNO` int(11) NOT NULL,
  `KeyName` text DEFAULT NULL,
  `KeyValue` text DEFAULT NULL,
  `SType` enum('text','json','number','serialize','boolean') NOT NULL DEFAULT 'text',
  `Description` text DEFAULT NULL,
  `UKey` text DEFAULT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_company_settings`
--

INSERT INTO `tbl_company_settings` (`SLNO`, `KeyName`, `KeyValue`, `SType`, `Description`, `UKey`, `UpdatedOn`, `UpdatedBy`) VALUES
(1, 'Logo', 'assets/images/logo/logo.png', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(2, 'CompanyName', 'RPC CONSTRUCTION', 'text', NULL, 'Fi93Kj9xBE0DfLBUwRnKmfUlh1BYc6mYlwwWi6F10U7WXFDne1KHHI2rYqCzmutvSbJrXmQVQQNVHnKmA9HBBNz6xQR', '2023-08-25 13:01:25', 'U2023-0000001'),
(3, 'Address', 'Building No. 119, Plot No. 48/A/3, Khambewadi Village, Khopoli Pali Road', 'text', NULL, 'kKm9pU2g4CfrsML5YUIvuEZJ0ePDsQSCcniJxeVA5YximfeUpjBD0P9thSSWAr0E8iq451WW', '2023-08-25 13:01:25', 'U2023-0000001'),
(4, 'CountryID', 'C2020-00000101', 'text', NULL, 'p7edaflvUxm7jwh9mgd99UuD2beL4SNmZyDP7DuqFlCk6eJ2msd7bBwusI0cC8TbqA6ICvtLLJcirFhB1HvNQ', '2023-08-25 13:09:25', 'U2023-0000001'),
(5, 'StateID', 'S2020-00000035', 'text', NULL, 'n3pbny9iM47wVRp2KXK5Gqb8TX2iGRSDGhcnR', '2023-08-25 13:01:25', 'U2023-0000001'),
(6, 'CityID', 'CI2023-0115371', 'text', NULL, '4JJCsl04ts0BKm22fLuJD1WrWFtu1vX3LgEQHdem6dfleuLxS1HRWhbcVEEqzB71nEak19BkEj1GYgjw', '2023-08-25 13:01:25', 'U2023-0000001'),
(7, 'PostalCodeID', 'PC2023-0015242', 'text', NULL, 'ZMyZF5PmRx3vRTPrPFI3gpuWlKFV2lK17eDZMqKphhGEYUwTPTIyRq', '2023-08-25 13:04:25', 'U2023-0000001'),
(8, 'GSTNo', 'qwerty', 'text', NULL, 'H2NZ7IrsG0Sc9xyLuY2yTy8AMTiYk9TUaW1Xb5NTfhIxY3mU0tzgNwYYPVK66lMvQn0sfGCTZRUQJ', '2023-08-25 13:00:25', 'U2023-0000001'),
(9, 'Phone-Number', '9702088339', 'text', NULL, 'TpxMMwE8Maee', '2023-08-25 13:00:25', 'U2023-0000001'),
(10, 'Mobile-Number', '9702088997', 'text', NULL, 'AKWgefLIcDqISAphvbfPVCGZFiBmIlT0KtQdQf8NpavjPxkxyTWPZQbe4jh', '2023-08-25 13:09:25', 'U2023-0000001'),
(11, 'E-Mail', 'rpc@gmail.com', 'text', NULL, 'djq0i2x7EtTxq0es', '2023-08-25 13:01:25', 'U2023-0000001'),
(12, 'PANNo', 'AAPFS8665J', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(13, 'BankName', 'BN000000000000023', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(14, 'BankBranchName', 'BB2024-0000001', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(15, 'BankAccountNo', '123412341234', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(16, 'BankAccountType', 'BAT2022-0000002', 'text', NULL, NULL, '2023-01-30 07:26:46', NULL),
(17, 'facebook', 'https://www.facebook.com/', 'text', NULL, 'iJgQ2Iwr', '2023-08-23 05:47:52', 'U2023-0000001'),
(18, 'twitter', 'https://twitter.com/', 'text', NULL, 'iv1ChTqf', '2023-08-23 05:48:52', 'U2023-0000001'),
(19, 'instagram', 'https://instagram.com/', 'text', NULL, '97HSx8xv9Eph2exgUpppkYtQet1as26F1GZYsKQz16MzCJX', '2023-08-23 05:47:52', 'U2023-0000001'),
(20, 'youtube', 'https://www.youtube.com/@rpcbuilderssupply4484', 'text', NULL, 'YE8irvrmlDHEzS27biyKbNNKwn1464ptl', '2023-08-23 05:51:52', 'U2023-0000001'),
(21, 'linkedin', 'https://www.linkedin.com/', 'text', NULL, 'I7JRbxy9UDcaGQ9114at0wUyd847iIX36aW8ppVT', '2023-08-23 05:49:52', 'U2023-0000001'),
(22, 'pinterest', NULL, 'text', NULL, '1fNvdvsEMpgARs91IhNZlT5aC97XhsNT1UetXCSq70efk59uVqH8pJhZn6ljAi', '2023-08-17 01:36:23', 'U2020-0000001'),
(23, 'TalukID', 'T2023-00007978', 'text', NULL, NULL, '2023-12-28 10:59:54', NULL),
(24, 'DistrictID', 'DT2023-00000497', 'text', NULL, NULL, '2023-12-28 10:59:54', NULL),
(25, 'BankType', 'TOB2022-0000002', 'text', NULL, NULL, '2023-12-28 12:55:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_construction_type`
--

CREATE TABLE `tbl_construction_type` (
  `ConTypeID` varchar(50) NOT NULL,
  `ConTypeName` varchar(50) DEFAULT NULL,
  `ConTypeLogo` text DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_construction_type`
--

INSERT INTO `tbl_construction_type` (`ConTypeID`, `ConTypeName`, `ConTypeLogo`, `Description`, `ActiveStatus`, `DFlag`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`) VALUES
('CON2324-0000001', 'School', 'uploads/construction-type/school.png', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 11:49:22', NULL, NULL),
('CON2324-0000002', 'Apartments', 'uploads/construction-type/apartment.png', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 11:49:22', NULL, NULL),
('CON2324-0000003', 'House', 'uploads/construction-type/house.png', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 11:49:22', NULL, NULL),
('CON2324-0000004', 'Flat', 'uploads/construction-type/flat.png', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 11:49:22', NULL, NULL),
('CON2324-0000005', 'Condo', 'uploads/construction-type/condo.png', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 11:49:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cruds`
--

CREATE TABLE `tbl_cruds` (
  `MID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add` int(1) DEFAULT 0,
  `view` int(1) DEFAULT 0,
  `edit` int(1) DEFAULT 0,
  `delete` int(1) DEFAULT 0,
  `copy` int(1) DEFAULT 0,
  `excel` int(1) DEFAULT 0,
  `csv` int(1) DEFAULT 0,
  `print` int(1) DEFAULT 0,
  `pdf` int(1) NOT NULL DEFAULT 0,
  `restore` int(1) NOT NULL DEFAULT 0,
  `showpwd` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cruds`
--

INSERT INTO `tbl_cruds` (`MID`, `add`, `view`, `edit`, `delete`, `copy`, `excel`, `csv`, `print`, `pdf`, `restore`, `showpwd`) VALUES
('M2023-0000001', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('M2023-0000012', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000013', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000014', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000015', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000016', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000017', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000018', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000019', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000020', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000021', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000022', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000023', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000024', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000025', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000026', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000027', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000028', 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0),
('M2023-0000029', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('M2023-0000033', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000034', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000035', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000036', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000037', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000038', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000039', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000040', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000041', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('M2023-0000042', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `CustomerID` varchar(50) NOT NULL,
  `CustomerName` varchar(200) DEFAULT NULL,
  `CustomerImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `GenderID` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `MobileNo1` varchar(20) DEFAULT NULL,
  `MobileNo2` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `CusTypeID` varchar(50) DEFAULT NULL,
  `ConTypeIDs` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `DFlag` int(11) NOT NULL DEFAULT 0,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_address`
--

CREATE TABLE `tbl_customer_address` (
  `SLNO` varchar(50) NOT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `isDefault` int(1) NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_cart`
--

CREATE TABLE `tbl_customer_cart` (
  `CartID` int(11) NOT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Qty` double DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_type`
--

CREATE TABLE `tbl_customer_type` (
  `CusTypeID` varchar(50) NOT NULL,
  `CusTypeName` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer_type`
--

INSERT INTO `tbl_customer_type` (`CusTypeID`, `CusTypeName`, `Description`, `ActiveStatus`, `DFlag`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`) VALUES
('CUS2324-000001', 'Owner', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 12:27:20', NULL, NULL),
('CUS2324-000002', 'Engineer', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 12:27:20', NULL, NULL),
('CUS2324-000003', 'Site Supervisor', NULL, 'Active', 0, NULL, NULL, NULL, '2024-02-16 12:29:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_locations`
--

CREATE TABLE `tbl_delivery_locations` (
  `S.No` int(11) NOT NULL,
  `Address` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CountryID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StateID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DistrictID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TalukID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CityID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PostalCodeID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departments`
--

CREATE TABLE `tbl_departments` (
  `DeptID` varchar(50) NOT NULL,
  `DeptName` varchar(150) NOT NULL,
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `ActiveStatus` enum('Active','Inactive') DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_docnum`
--

CREATE TABLE `tbl_docnum` (
  `SLNO` int(11) NOT NULL,
  `DocType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Prefix` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Length` int(11) DEFAULT NULL,
  `CurrNum` int(11) DEFAULT NULL,
  `Suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Year` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_docnum`
--

INSERT INTO `tbl_docnum` (`SLNO`, `DocType`, `Prefix`, `Length`, `CurrNum`, `Suffix`, `Year`) VALUES
(1, 'Country', 'C', 7, 247, NULL, ''),
(2, 'States', 'S', 7, 4121, NULL, ''),
(3, 'Districts', 'DT', 8, 632, NULL, ''),
(4, 'Taluks', 'T', 8, 10914, NULL, ''),
(5, 'City', 'CI', 7, 153051, NULL, '2023'),
(6, 'Postal-Codes', 'PC', 7, 20385, NULL, '2023'),
(7, 'Gender', 'G', 7, 3, NULL, ''),
(8, 'Bank-Account-Type', 'BAT', 7, 3, NULL, ''),
(9, 'Bank-Branches', 'BB', 7, 2, NULL, ''),
(10, 'Banks', 'B', 15, 226, NULL, ''),
(11, 'Bank-Type', 'TOB', 7, 9, NULL, ''),
(12, 'Log', 'L', 9, 500, NULL, '2024'),
(13, 'User-Roles', 'UR', 7, 4, NULL, ''),
(14, 'Users', 'U', 7, 21, NULL, ''),
(15, 'Vendor-Category', 'VC', 7, 7, NULL, ''),
(16, 'Vendor-Type', 'VT', 7, 5, NULL, ''),
(17, 'Tax', 'TX', 7, 5, NULL, ''),
(18, 'UoM', 'UOM', 7, 8, NULL, ''),
(19, 'Product-Category', 'PC', 7, 12, NULL, ''),
(20, 'Product-Sub-Category', 'PSC', 7, 84, NULL, ''),
(21, 'Departments', 'DPM', 7, 1, NULL, ''),
(22, 'Brands', 'BR', 7, 1, NULL, ''),
(23, 'Stages', 'SG', 7, 5, NULL, ''),
(24, 'Attributes', 'AT', 7, 7, NULL, ''),
(25, 'Attribute-Values', 'ATV', 7, 28, NULL, ''),
(27, 'Vendor-Category-Additional', 'VCA', 10, 1, '', '2023'),
(28, 'Vendor-Sub-Category-Additional', 'VSCA', 10, 1, '', '2023'),
(29, 'Product-Category-Additional', 'PCA', 10, 1, '', '2023'),
(30, 'Product-Sub-Category-Additional', 'PSCA', 10, 1, '', '2023'),
(31, 'Products', 'P', 7, 332, '', '2024'),
(32, 'Product-Gallery', 'PG', 7, 785, '', '2024'),
(33, 'Product-Variation', 'PV', 8, 1, '', '2023'),
(34, 'Product-Variation-Details', 'PVD', 8, 1, '', '2023'),
(35, 'Product-Variation-Gallery', 'PVG', 8, 1, '', '2023'),
(36, 'Product-Attributes', 'PA', 7, 199, '', '2024'),
(37, 'Attribute-Value-Category', 'AVC', 7, 20, NULL, '2024'),
(38, 'Vendor-Type-Additional', '', 10, 1, '', '2023'),
(39, 'Vendor', 'V', 8, 47, '', ''),
(40, 'Vendor-Vehicle', 'VV', 8, 47, '', '2024'),
(41, 'Vendor-Vehicle-Images', 'VVI', 8, 82, '', '2024'),
(42, 'Vendor-Supply', 'VS', 8, 165, '', '2024'),
(43, 'Vendor-Stock-Point', 'VSP', 8, 36, '', '2024'),
(44, 'Vendor-Documents', 'VD', 8, 37, '', '2024'),
(45, 'Vehicle-Type', 'VT', 8, 2, '', '2024'),
(46, 'Vehicle-Brand', 'VB', 8, 2, '', '2024'),
(47, 'Vehicle-Model', 'VM', 8, 3, '', '2024'),
(48, 'Vendor-Service-Location', 'VSL', 12, 3418, '', '2024'),
(49, 'Quotation', 'Q', 8, 2, '', '2024'),
(50, 'Quotation-Details', 'QD', 8, 5, '', '2024'),
(51, 'Order', 'O', 8, 3, '', '2024'),
(52, 'Order-Details', 'OD', 8, 5, '', '2024'),
(53, 'Enquiry', 'E', 8, 2, '', '2024'),
(54, 'Enquiry-Details', 'ED', 8, 6, '', '2024'),
(55, 'Vendor-Product-Mapping', 'VPM', 10, 101, '', '2024'),
(56, 'Customer', 'CU', 8, 22, '', '2024'),
(57, 'Customer-Address', 'CA', 8, 16, '', '2024'),
(58, 'Support', 'S', 8, 4, '', '2024'),
(59, 'Support-Details', 'SD', 8, 7, '', '2024'),
(60, 'Support-Attachments', 'SA', 8, 5, '', '2024'),
(61, 'Product-Stages', 'PS', 8, 5, '', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drop_points`
--

CREATE TABLE `tbl_drop_points` (
  `DPID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DPName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DPAddress` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Active',
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_financial_year`
--

CREATE TABLE `tbl_financial_year` (
  `SLNo` int(11) NOT NULL,
  `FYName` varchar(50) DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `CrudStatus` enum('Yes','No') DEFAULT 'Yes',
  `ActiveStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  `isCurrent` enum('Yes','No') NOT NULL DEFAULT 'No',
  `DBName` varchar(50) NOT NULL,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_financial_year`
--

INSERT INTO `tbl_financial_year` (`SLNo`, `FYName`, `FromDate`, `ToDate`, `CrudStatus`, `ActiveStatus`, `isCurrent`, `DBName`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`) VALUES
(1, 'FY2324', '2023-04-01', '2024-03-31', 'Yes', 'Active', 'Yes', 'rpc_fy_2324', '2023-11-02 07:20:56', NULL, NULL, NULL),
(2, 'FY2425', '2024-04-01', '2025-03-31', 'Yes', 'Inactive', 'No', 'rpc_fy_2425', '2023-11-02 07:20:56', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `MID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Slug` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MenuName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ActiveName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Icon` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PageUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ParentID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hasSubMenu` int(1) DEFAULT NULL,
  `Ordering` int(6) DEFAULT NULL,
  `isCheckSetting` int(1) NOT NULL DEFAULT 0,
  `SettingsName` varchar(100) DEFAULT NULL,
  `DefaultOrdering` int(11) DEFAULT NULL,
  `ActiveStatus` int(1) NOT NULL DEFAULT 1,
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `UpdatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_menus`
--

INSERT INTO `tbl_menus` (`MID`, `Slug`, `MenuName`, `ActiveName`, `Icon`, `PageUrl`, `ParentID`, `Level`, `hasSubMenu`, `Ordering`, `isCheckSetting`, `SettingsName`, `DefaultOrdering`, `ActiveStatus`, `DFlag`, `UpdatedOn`, `UpdatedBy`) VALUES
('M2023-0000001', 'dashboard', 'Dashboard', 'Dashboard', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-hexagon\"><path d=\"M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z\"></path></svg>', 'admin/dashboard', NULL, 'L001', 0, 1, 0, NULL, 1, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000002', 'master', 'Master', 'Master', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-box\"><path d=\"M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z\"/><polyline points=\"3.27 6.96 12 12.01 20.73 6.96\"/><line x1=\"12\" y1=\"22.08\" x2=\"12\" y2=\"12\"/></svg>', '', NULL, 'L001', 1, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000003', 'transaction', 'Transaction', 'Transaction', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-link-2\"><path d=\"M15 7h3a5 5 0 0 1 5 5 5 5 0 0 1-5 5h-3m-6 0H6a5 5 0 0 1-5-5 5 5 0 0 1 5-5h3\"></path><line x1=\"8\" y1=\"12\" x2=\"16\" y2=\"12\"></line></svg>', '', NULL, 'L001', 1, 4, 0, NULL, 4, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000004', 'crm', 'CRM', 'CRM', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-link-2\"><path d=\"M15 7h3a5 5 0 0 1 5 5 5 5 0 0 1-5 5h-3m-6 0H6a5 5 0 0 1-5-5 5 5 0 0 1 5-5h3\"></path><line x1=\"8\" y1=\"12\" x2=\"16\" y2=\"12\"></line></svg>', '', NULL, 'L001', 1, 4, 0, NULL, 4, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000005', 'reports', 'Reports', 'Reports', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-activity\"><polyline points=\"22 12 18 12 15 21 9 3 6 12 2 12\"></polyline></svg>', '', NULL, 'L001', 1, 5, 0, NULL, 3, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000006', 'users-and-permissions', 'Users & Permissions', 'Users-And-Permissions', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-users\"><path d=\"M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"></path><circle cx=\"9\" cy=\"7\" r=\"4\"></circle><path d=\"M23 21v-2a4 4 0 0 0-3-3.87\"></path><path d=\"M16 3.13a4 4 0 0 1 0 7.75\"></path></svg>', '', NULL, 'L001', 1, 6, 0, NULL, 3, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000007', 'settings', 'Settings', 'Settings', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-settings\"><circle cx=\"12\" cy=\"12\" r=\"3\"></circle><path d=\"M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z\"></path></svg>', NULL, NULL, 'L001', 1, 7, 0, NULL, 3, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000008', 'logout', 'Logout', 'logout', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-log-in\"><path d=\"M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4\"></path><polyline points=\"10 17 15 12 10 7\"></polyline><line x1=\"15\" y1=\"12\" x2=\"3\" y2=\"12\"></line></svg>', '', NULL, 'L001', 0, 9, 0, NULL, 3, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000009', 'general-master', 'General Master', 'General-Master', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-box\"><path d=\"M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z\"/><polyline points=\"3.27 6.96 12 12.01 20.73 6.96\"/><line x1=\"12\" y1=\"22.08\" x2=\"12\" y2=\"12\"/></svg>', '', NULL, 'L001', 1, 1, 0, NULL, 1, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000010', 'vendor-master', 'Vendor Master', 'Vendor-Master', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" fill=\"currentColor\" class=\"bi bi-shop-window\" viewBox=\"0 0 16 16\"> <path d=\"M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z\"/> </svg>', '', NULL, 'L001', 1, 2, 0, NULL, 2, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000011', 'product-master', 'Product Master', 'Product-Master', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"22\" height=\"22\" fill=\"currentColor\" class=\"bi bi-tools\" viewBox=\"0 0 16 16\"> <path d=\"M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z\"/> </svg>', '', NULL, 'L001', 1, 3, 0, NULL, 3, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000012', 'stages', 'Stages', 'Stages', NULL, 'admin/master/general/stages', 'M2023-0000009', 'L002', 0, 7, 0, NULL, 4, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000013', 'country', 'Country', 'Country', NULL, 'admin/master/general/country', 'M2023-0000009', 'L002', 0, 1, 0, NULL, 4, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000014', 'states', 'States', 'States', NULL, 'admin/master/general/states', 'M2023-0000009', 'L002', 0, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000015', 'districts', 'Districts', 'Districts', NULL, 'admin/master/general/districts', 'M2023-0000009', 'L002', 0, 3, 0, NULL, 7, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000016', 'taluks', 'Taluks', 'Taluks', NULL, 'admin/master/general/taluks', 'M2023-0000009', 'L002', 0, 4, 0, NULL, 8, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000017', 'city', 'City', 'City', NULL, 'admin/master/general/city', 'M2023-0000009', 'L002', 0, 5, 0, NULL, 9, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000018', 'postal-codes', 'Postal Codes', 'Postal-Codes', NULL, 'admin/master/general/postal-codes', 'M2023-0000009', 'L002', 0, 6, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000019', 'manage-customers', 'Manage Customers', 'Manage-Customers', NULL, 'admin/users-and-permissions/manage-customers/', 'M2023-0000006', 'L002', 0, 4, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000020', 'vendor-category', 'Category', 'Vendor-Category', NULL, 'admin/master/vendor/category', 'M2023-0000010', 'L002', 0, 2, 0, NULL, 5, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000021', 'vendor-type', 'Type', 'Vendor-Type', NULL, 'admin/master/vendor/vendor-type', 'M2023-0000010', 'L002', 0, 3, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000022', 'manage-vendors', 'Manage Vendors', 'Manage-Vendors', NULL, 'admin/master/vendor/manage-vendors', 'M2023-0000010', 'L002', 0, 4, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000023', 'tax', 'Tax', 'Tax', NULL, 'admin/master/product/tax', 'M2023-0000011', 'L002', 0, 1, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000024', 'unit-of-measurement', 'Unit of Measurement', 'Unit-Of-Measurement', NULL, 'admin/master/product/unit-of-measurement', 'M2023-0000011', 'L002', 0, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000025', 'product-category', 'Category', 'Product-Category', NULL, 'admin/master/product/category', 'M2023-0000011', 'L002', 0, 3, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000026', 'product-sub-category', 'Sub Category', 'Product-Sub-Category', NULL, 'admin/master/product/sub-category', 'M2023-0000011', 'L002', 0, 4, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000027', 'products', 'Products', 'Products', NULL, 'admin/master/product/products', 'M2023-0000011', 'L002', 0, 7, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000028', 'user-roles', 'User Roles', 'User-and-Roles', NULL, 'admin/users-and-permissions/user-roles/', 'M2023-0000006', 'L002', 0, 1, 0, NULL, 1, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000029', 'users', 'Users', 'Users', NULL, 'admin/users-and-permissions/users/', 'M2023-0000006', 'L002', 0, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000030', 'profile', 'Profile', 'Profile', NULL, 'admin/users-and-permissions/profile/', 'M2023-0000006', 'L002', 0, 3, 0, NULL, 3, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000031', 'change-password', 'Change Password', 'Change-Password', NULL, 'admin/users-and-permissions/change-password/', 'M2023-0000006', 'L002', 0, 4, 0, NULL, 4, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000032', 'general-settings', 'General', 'General-Settings', NULL, 'admin/settings/general/', 'M2023-0000007', 'L002', 0, 1, 0, NULL, 1, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000033', 'company-settings', 'Company', 'Company-Settings', NULL, 'admin/settings/company/', 'M2023-0000007', 'L002', 0, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000034', 'brands', 'Brands', 'Brands', NULL, 'admin/master/product/brands', 'M2023-0000011', 'L002', 0, 5, 0, NULL, 2, 1, 1, '2022-12-07 01:19:35', NULL),
('M2023-0000035', 'attributes', 'Attributes', 'Attributes', NULL, 'admin/master/product/attributes', 'M2023-0000011', 'L002', 0, 6, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000036', 'vendor-product-mapping', 'Product Mapping', 'Vendor-Product-Mapping', NULL, 'admin/master/vendor/vendor-product-mapping', 'M2023-0000010', 'L002', 0, 4, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000037', 'vendor-stock-update', 'Stock Update', 'Vendor-Stock-Update', NULL, 'admin/master/vendor/vendor-stock-update', 'M2023-0000010', 'L002', 0, 4, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000038', 'quote-enquiry', 'Quote Enquiry', 'Quote-Enquiry', NULL, 'admin/transaction/quote-enquiry', 'M2023-0000003', 'L002', 0, 2, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000039', 'order', 'Order', 'Order', NULL, 'admin/transaction/order', 'M2023-0000003', 'L002', 0, 3, 0, NULL, 2, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000040', 'support-ticket', 'Support Tickets', 'Support-Tickets', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" fill=\"currentColor\" class=\"bi bi-ticket\" viewBox=\"0 0 16 16\"> <path d=\"M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5V6a.5.5 0 0 1-.5.5 1.5 1.5 0 0 0 0 3 .5.5 0 0 1 .5.5v1.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 11.5V10a.5.5 0 0 1 .5-.5 1.5 1.5 0 1 0 0-3A.5.5 0 0 1 0 6V4.5ZM1.5 4a.5.5 0 0 0-.5.5v1.05a2.5 2.5 0 0 1 0 4.9v1.05a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-1.05a2.5 2.5 0 0 1 0-4.9V4.5a.5.5 0 0 0-.5-.5h-13Z\"/> </svg>', 'admin/support', '', 'L001', 0, 7, 0, NULL, 1, 1, 0, '2022-12-07 01:19:35', NULL),
('M2023-0000041', 'home', 'Home', 'Home', '<svg height=\"24\" viewBox=\"0 0 21 21\" width=\"24\" xmlns=\"http://www.w3.org/2000/svg\"><g fill=\"none\" fill-rule=\"evenodd\" stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" transform=\"translate(1 1)\"><path d=\"m.5 9.5 9-9 9 9\"/><path d=\"m2.5 7.5v8c0 .5522847.44771525 1 1 1h3c.55228475 0 1-.4477153 1-1v-4c0-.5522847.44771525-1 1-1h2c.5522847 0 1 .4477153 1 1v4c0 .5522847.4477153 1 1 1h3c.5522847 0 1-.4477153 1-1v-8\"/></g></svg>', 'admin/home', '', 'L001', 0, 8, 0, NULL, 1, 1, 0, '2024-03-05 07:33:31', NULL),
('M2023-0000042', 'banner', 'Banner', 'Banner', NULL, 'admin/home/banner', 'M2023-0000041', 'L002', 0, 1, 0, NULL, 1, 1, 0, '2022-12-07 01:19:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `OrderID` varchar(50) NOT NULL,
  `OrderNo` varchar(50) DEFAULT NULL,
  `QuoteSentID` varchar(50) DEFAULT NULL,
  `QID` varchar(50) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `MobileNo1` varchar(50) DEFAULT NULL,
  `MobileNo2` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `DAddress` varchar(50) DEFAULT NULL,
  `DCountryID` varchar(50) DEFAULT NULL,
  `DStateID` varchar(50) DEFAULT NULL,
  `DDistrictID` varchar(50) DEFAULT NULL,
  `DTalukID` varchar(50) DEFAULT NULL,
  `DCityID` varchar(50) DEFAULT NULL,
  `DPostalCodeID` varchar(50) DEFAULT NULL,
  `Status` enum('New','Delivered','Cancelled') NOT NULL DEFAULT 'New',
  `VendorID` varchar(50) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `SubTotal` double NOT NULL DEFAULT 0,
  `DiscountType` varchar(50) DEFAULT NULL,
  `DiscountPer` double NOT NULL DEFAULT 0,
  `DiscountAmount` double NOT NULL DEFAULT 0,
  `TaxAmt` double NOT NULL DEFAULT 0,
  `CGSTAmt` double NOT NULL DEFAULT 0,
  `SGSTAmt` double NOT NULL DEFAULT 0,
  `IGSTAmt` double NOT NULL DEFAULT 0,
  `TotalAmount` double NOT NULL DEFAULT 0,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `DetailID` varchar(50) NOT NULL,
  `OrderID` varchar(50) DEFAULT NULL,
  `CID` varchar(50) DEFAULT NULL,
  `SCID` varchar(50) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Qty` double DEFAULT 0,
  `Price` double DEFAULT NULL,
  `UOMID` varchar(50) DEFAULT NULL,
  `TaxType` enum('Exclude','Include') DEFAULT 'Exclude',
  `TaxID` varchar(50) DEFAULT NULL,
  `TaxPer` double DEFAULT 0,
  `Taxable` double NOT NULL DEFAULT 0,
  `DiscountType` varchar(50) DEFAULT NULL,
  `DiscountPer` double NOT NULL DEFAULT 0,
  `DiscountAmount` double NOT NULL DEFAULT 0,
  `TaxAmount` double NOT NULL DEFAULT 0,
  `CGSTPer` double NOT NULL DEFAULT 0,
  `SGSTPer` double DEFAULT 0,
  `IGSTPer` double NOT NULL DEFAULT 0,
  `CGSTAmount` double NOT NULL DEFAULT 0,
  `SGSTAmount` double NOT NULL DEFAULT 0,
  `IGSTAmount` double NOT NULL DEFAULT 0,
  `Amount` double NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `ProductID` varchar(50) NOT NULL,
  `Slug` varchar(160) DEFAULT NULL,
  `ProductName` varchar(150) DEFAULT NULL,
  `ProductType` enum('Simple','Variable') DEFAULT 'Simple',
  `ProductCode` varchar(50) DEFAULT NULL,
  `Stages` text DEFAULT NULL,
  `VideoURL` text DEFAULT NULL,
  `ProductBrochure` text DEFAULT NULL,
  `HSNSAC` varchar(50) DEFAULT NULL,
  `CID` varchar(50) DEFAULT NULL,
  `SCID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `TaxType` enum('Exclude','Include') DEFAULT 'Exclude',
  `TaxID` varchar(50) DEFAULT NULL,
  `PRate` double DEFAULT 0,
  `SRate` double DEFAULT 0,
  `Decimals` enum('auto','0','1','2','3','4','5','6','7','8','9') DEFAULT 'auto',
  `Description` text DEFAULT NULL,
  `ShortDescription` text DEFAULT NULL,
  `Attributes` text DEFAULT NULL,
  `ProductImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(11) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_attributes`
--

CREATE TABLE `tbl_products_attributes` (
  `DetailID` varchar(50) NOT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `AttributeID` varchar(50) DEFAULT NULL,
  `isVariation` int(11) NOT NULL DEFAULT 0,
  `AttributeValues` text DEFAULT NULL,
  `DFlag` int(11) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_products_attributes`
--

INSERT INTO `tbl_products_attributes` (`DetailID`, `ProductID`, `AttributeID`, `isVariation`, `AttributeValues`, `DFlag`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`, `DeletedOn`, `DeletedBy`) VALUES
('PA2023-0000001', 'P2023-0000001', 'AT2023-0000001', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2023-0000001\";s:5:\"Value\";s:21:\"Multi-wall Paper Bags\";}}}', 0, '2023-12-28 07:02:01', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2023-0000002', 'P2023-0000001', 'AT2023-0000002', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2023-0000009\";s:5:\"Value\";s:6:\"Dalmia\";}}}', 0, '2023-12-28 07:02:01', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000001', 'P2024-0000317', 'AT2023-0000002', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2023-0000006\";s:5:\"Value\";s:9:\"UltraTech\";}}}', 0, '2024-01-25 10:48:01', 'U2023-0000001', NULL, NULL, NULL, NULL),
('PA2024-0000002', 'P2024-0000003', 'AT2024-0000003', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000011\";s:5:\"Value\";s:4:\"3600\";}}}', 0, '2024-01-27 07:41:49', 'U2023-0000001', NULL, NULL, NULL, NULL),
('PA2024-0000003', 'P2024-0000114', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 07:48:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000004', 'P2024-0000114', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 07:48:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000005', 'P2024-0000114', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 07:48:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000006', 'P2024-0000115', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 07:52:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000007', 'P2024-0000115', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 07:52:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000008', 'P2024-0000115', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 07:52:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000009', 'P2024-0000112', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-27 08:44:40', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000010', 'P2024-0000112', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 08:44:40', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000011', 'P2024-0000112', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 08:44:40', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000012', 'P2024-0000111', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 08:46:38', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000013', 'P2024-0000111', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 08:46:38', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000014', 'P2024-0000111', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 08:46:38', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000015', 'P2024-0000122', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 08:53:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000016', 'P2024-0000122', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 08:53:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000017', 'P2024-0000122', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 08:53:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000018', 'P2024-0000121', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 09:00:23', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000019', 'P2024-0000121', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 09:00:23', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000020', 'P2024-0000121', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 09:00:23', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000021', 'P2024-0000098', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-27 09:16:48', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000022', 'P2024-0000098', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 09:16:48', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000023', 'P2024-0000098', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 09:16:48', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000024', 'P2024-0000099', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 09:36:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000025', 'P2024-0000099', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 09:36:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000026', 'P2024-0000099', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 09:36:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000027', 'P2024-0000100', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000018\";s:5:\"Value\";s:3:\"PSC\";}}}', 0, '2024-01-27 09:41:43', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000028', 'P2024-0000100', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 09:41:43', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000029', 'P2024-0000100', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 09:41:43', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000030', 'P2024-0000064', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:16:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000031', 'P2024-0000064', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:16:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000032', 'P2024-0000064', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 10:16:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000033', 'P2024-0000105', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:26:54', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000034', 'P2024-0000105', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:26:54', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000035', 'P2024-0000105', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 10:26:54', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000036', 'P2024-0000106', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:30:24', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000037', 'P2024-0000106', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:30:24', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000038', 'P2024-0000106', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 10:30:24', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000039', 'P2024-0000065', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:35:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000040', 'P2024-0000065', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:35:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000041', 'P2024-0000065', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 10:35:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000042', 'P2024-0000063', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:50:15', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000043', 'P2024-0000063', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:50:15', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000044', 'P2024-0000063', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 10:50:15', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000045', 'P2024-0000066', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 10:52:35', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000046', 'P2024-0000066', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 10:52:35', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000047', 'P2024-0000066', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 10:52:35', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000048', 'P2024-0000056', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 11:21:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000049', 'P2024-0000056', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:21:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000050', 'P2024-0000056', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:21:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000051', 'P2024-0000058', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 11:24:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000052', 'P2024-0000058', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:24:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000053', 'P2024-0000058', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:24:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000054', 'P2024-0000060', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 11:30:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000055', 'P2024-0000060', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:30:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000056', 'P2024-0000060', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:30:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000057', 'P2024-0000059', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 11:43:36', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000058', 'P2024-0000059', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:43:36', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000059', 'P2024-0000059', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-27 11:43:36', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000060', 'P2024-0000117', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 11:44:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000061', 'P2024-0000117', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:44:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000062', 'P2024-0000117', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:44:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000063', 'P2024-0000118', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-27 11:48:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000064', 'P2024-0000118', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:48:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000065', 'P2024-0000118', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:48:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000066', 'P2024-0000061', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 11:53:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000067', 'P2024-0000061', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:53:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000068', 'P2024-0000061', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:53:29', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000069', 'P2024-0000055', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-27 11:58:05', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000070', 'P2024-0000055', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 11:58:05', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000071', 'P2024-0000055', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 11:58:05', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000072', 'P2024-0000057', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 12:02:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000073', 'P2024-0000057', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 12:02:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000074', 'P2024-0000057', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 12:02:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000075', 'P2024-0000116', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 12:18:12', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000076', 'P2024-0000116', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 12:18:12', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000077', 'P2024-0000116', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 12:18:12', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000078', 'P2024-0000070', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-27 12:21:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000079', 'P2024-0000070', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-27 12:21:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000080', 'P2024-0000070', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-27 12:21:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000081', 'P2024-0000079', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-29 08:59:21', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000082', 'P2024-0000079', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-29 08:59:21', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000083', 'P2024-0000079', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-29 08:59:21', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000084', 'P2024-0000087', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-29 11:14:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000085', 'P2024-0000087', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-29 11:14:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000086', 'P2024-0000087', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-29 11:14:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000087', 'P2024-0000086', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-29 11:28:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000088', 'P2024-0000084', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-29 11:32:28', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000089', 'P2024-0000088', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000018\";s:5:\"Value\";s:3:\"PSC\";}}}', 0, '2024-01-29 12:44:04', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000090', 'P2024-0000088', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-29 12:44:04', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000091', 'P2024-0000088', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-29 12:44:04', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000092', 'P2024-0000068', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 04:42:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000093', 'P2024-0000068', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 04:42:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000094', 'P2024-0000068', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 04:42:39', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000095', 'P2024-0000046', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 05:04:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000096', 'P2024-0000046', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:04:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000097', 'P2024-0000046', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:04:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000098', 'P2024-0000085', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-30 05:15:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000099', 'P2024-0000085', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:15:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000100', 'P2024-0000085', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:15:25', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000101', 'P2024-0000069', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 05:20:32', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000102', 'P2024-0000069', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:20:32', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000103', 'P2024-0000069', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 05:20:32', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000104', 'P2024-0000081', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-30 05:24:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000105', 'P2024-0000081', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:24:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000106', 'P2024-0000081', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:24:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000107', 'P2024-0000125', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 05:33:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000108', 'P2024-0000125', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:33:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000109', 'P2024-0000125', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:33:34', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000110', 'P2024-0000045', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-30 05:43:45', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000111', 'P2024-0000045', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:43:45', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000112', 'P2024-0000045', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:43:45', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000113', 'P2024-0000124', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 05:47:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000114', 'P2024-0000124', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 05:47:53', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000115', 'P2024-0000073', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 06:11:01', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000116', 'P2024-0000073', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 06:11:01', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000117', 'P2024-0000073', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 06:11:01', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000118', 'P2024-0000044', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 06:57:22', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000119', 'P2024-0000044', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 06:57:22', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000120', 'P2024-0000044', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 06:57:22', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000121', 'P2024-0000126', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 07:05:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000122', 'P2024-0000126', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 07:05:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000123', 'P2024-0000126', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 07:05:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000124', 'P2024-0000074', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 07:13:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000125', 'P2024-0000074', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 07:13:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000126', 'P2024-0000074', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 07:13:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000127', 'P2024-0000104', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-30 07:37:59', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000128', 'P2024-0000104', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 07:37:59', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000129', 'P2024-0000104', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 07:37:59', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000130', 'P2024-0000082', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:06:05', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000131', 'P2024-0000082', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 09:06:05', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000132', 'P2024-0000101', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 09:34:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000133', 'P2024-0000101', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:34:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000134', 'P2024-0000101', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 09:34:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000135', 'P2024-0000123', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 09:40:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000136', 'P2024-0000123', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:40:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000137', 'P2024-0000123', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 09:40:09', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000138', 'P2024-0000103', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 09:43:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000139', 'P2024-0000103', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:43:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000140', 'P2024-0000103', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 09:43:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000141', 'P2024-0000102', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000018\";s:5:\"Value\";s:3:\"PSC\";}}}', 0, '2024-01-30 09:49:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000142', 'P2024-0000102', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:49:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000143', 'P2024-0000102', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 09:49:47', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000144', 'P2024-0000072', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 09:53:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000145', 'P2024-0000072', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 09:53:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000146', 'P2024-0000072', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 09:53:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000147', 'P2024-0000075', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 10:18:54', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000148', 'P2024-0000075', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 10:18:54', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000149', 'P2024-0000047', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 10:39:19', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000150', 'P2024-0000047', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 10:39:19', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000151', 'P2024-0000047', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-30 10:39:19', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000152', 'P2024-0000039', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000018\";s:5:\"Value\";s:3:\"PSC\";}}}', 0, '2024-01-30 10:48:11', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000153', 'P2024-0000039', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 10:48:11', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000154', 'P2024-0000039', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 10:48:11', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000155', 'P2024-0000042', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 10:57:17', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000156', 'P2024-0000042', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 10:57:17', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000157', 'P2024-0000043', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 11:02:00', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000158', 'P2024-0000043', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 11:02:00', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000159', 'P2024-0000043', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 11:02:00', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000160', 'P2024-0000037', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-30 11:23:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000161', 'P2024-0000037', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 11:23:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000162', 'P2024-0000037', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 11:23:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000163', 'P2024-0000076', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 12:41:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000164', 'P2024-0000076', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 12:41:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000165', 'P2024-0000076', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 12:41:44', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000166', 'P2024-0000095', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-30 12:47:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000167', 'P2024-0000095', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-30 12:47:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000168', 'P2024-0000095', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-30 12:47:16', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000169', 'P2024-0000096', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 04:29:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000170', 'P2024-0000096', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 04:29:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000171', 'P2024-0000096', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-31 04:29:55', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000172', 'P2024-0000041', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-31 05:23:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000173', 'P2024-0000041', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 05:23:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000174', 'P2024-0000041', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 05:23:14', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000175', 'P2024-0000094', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-31 05:47:33', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000176', 'P2024-0000094', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 05:47:33', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000177', 'P2024-0000094', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 05:47:33', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000178', 'P2024-0000093', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 05:50:46', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000179', 'P2024-0000093', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 05:50:46', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000180', 'P2024-0000093', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-31 05:50:46', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000181', 'P2024-0000089', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:0:{}}', 0, '2024-01-31 06:57:20', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000182', 'P2024-0000089', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 06:57:20', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000183', 'P2024-0000089', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 06:57:20', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000184', 'P2024-0000090', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 10:18:06', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000185', 'P2024-0000090', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 10:18:06', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000186', 'P2024-0000090', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 10:18:06', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000187', 'P2024-0000040', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 10:34:33', 'U2023-0000002', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_products_attributes` (`DetailID`, `ProductID`, `AttributeID`, `isVariation`, `AttributeValues`, `DFlag`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`, `DeletedOn`, `DeletedBy`) VALUES
('PA2024-0000188', 'P2024-0000040', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 10:34:33', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000189', 'P2024-0000040', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-31 10:34:33', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000190', 'P2024-0000091', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000012\";s:5:\"Value\";s:3:\"OPC\";}}}', 0, '2024-01-31 10:55:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000191', 'P2024-0000091', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 10:55:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000192', 'P2024-0000091', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 10:55:51', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000193', 'P2024-0000092', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 12:15:58', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000194', 'P2024-0000092', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 12:15:58', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000195', 'P2024-0000092', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000015\";s:5:\"Value\";s:8:\"53 Grade\";}}}', 0, '2024-01-31 12:15:58', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000196', 'P2024-0000083', 'AT2024-0000004', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000013\";s:5:\"Value\";s:3:\"PPC\";}}}', 0, '2024-01-31 12:21:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000197', 'P2024-0000083', 'AT2024-0000005', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000017\";s:5:\"Value\";s:5:\"50 kg\";}}}', 0, '2024-01-31 12:21:56', 'U2023-0000002', NULL, NULL, NULL, NULL),
('PA2024-0000198', 'P2024-0000083', 'AT2024-0000006', 0, 'a:2:{s:11:\"isVariation\";b:0;s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":2:{s:7:\"ValueID\";s:15:\"ATV2024-0000016\";s:5:\"Value\";s:8:\"43 Grade\";}}}', 0, '2024-01-31 12:21:56', 'U2023-0000002', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_gallery`
--

CREATE TABLE `tbl_products_gallery` (
  `SLNo` varchar(50) NOT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `ImgID` varchar(50) NOT NULL,
  `gImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_stages`
--

CREATE TABLE `tbl_products_stages` (
  `DetailID` varchar(50) NOT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `StageID` varchar(50) DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_variation`
--

CREATE TABLE `tbl_products_variation` (
  `VariationID` varchar(50) NOT NULL,
  `UUID` varchar(100) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Slug` text DEFAULT NULL,
  `Title` varchar(150) DEFAULT NULL,
  `PRate` double DEFAULT 0,
  `SRate` double DEFAULT 0,
  `VImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `Attributes` text DEFAULT NULL,
  `CombinationID` text DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_variation_details`
--

CREATE TABLE `tbl_products_variation_details` (
  `DetailID` varchar(50) NOT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `VariationID` varchar(50) DEFAULT NULL,
  `UUID` varchar(150) NOT NULL,
  `AttributeID` varchar(50) DEFAULT NULL,
  `AttributeValueID` varchar(50) DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_variation_gallery`
--

CREATE TABLE `tbl_products_variation_gallery` (
  `SLNo` varchar(50) NOT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `VariationID` varchar(50) DEFAULT NULL,
  `UUID` varchar(150) NOT NULL,
  `ImgID` varchar(50) NOT NULL,
  `gImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `PCID` varchar(50) NOT NULL,
  `PCName` varchar(100) DEFAULT NULL,
  `PCImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(11) DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `AdditionalSetting` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category_additional`
--

CREATE TABLE `tbl_product_category_additional` (
  `SLNO` varchar(50) NOT NULL,
  `ReferenceNo` varchar(100) DEFAULT NULL,
  `ColumnName` varchar(200) DEFAULT NULL,
  `ColumnValue` text DEFAULT NULL,
  `ColumnType` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_subcategory`
--

CREATE TABLE `tbl_product_subcategory` (
  `PSCID` varchar(50) NOT NULL,
  `PCID` varchar(50) NOT NULL,
  `PSCName` varchar(100) DEFAULT NULL,
  `PSCImage` text DEFAULT NULL,
  `VideoURLs` text DEFAULT NULL,
  `Images` varchar(255) DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(11) DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `AdditionalSetting` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_subcategory_additional`
--

CREATE TABLE `tbl_product_subcategory_additional` (
  `SLNO` varchar(50) NOT NULL,
  `ReferenceNo` varchar(100) DEFAULT NULL,
  `ColumnName` varchar(200) DEFAULT NULL,
  `ColumnValue` text DEFAULT NULL,
  `ColumnType` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation`
--

CREATE TABLE `tbl_quotation` (
  `QID` varchar(50) NOT NULL,
  `QNo` varchar(50) DEFAULT NULL,
  `QDate` date DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `MobileNo1` varchar(15) DEFAULT NULL,
  `MobileNo2` varchar(15) DEFAULT NULL,
  `Email` text DEFAULT NULL,
  `PlaceOfSupply` varchar(50) DEFAULT NULL,
  `QExpiryDate` date DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `DAddress` varchar(50) DEFAULT NULL,
  `DCountryID` varchar(50) DEFAULT NULL,
  `DStateID` varchar(50) DEFAULT NULL,
  `DDistrictID` varchar(50) DEFAULT NULL,
  `DTalukID` varchar(50) DEFAULT NULL,
  `DCityID` varchar(50) DEFAULT NULL,
  `DPostalCodeID` varchar(50) DEFAULT NULL,
  `Status` enum('New','Quote Requested','Quote Received','Allocated','Cancelled') NOT NULL DEFAULT 'New',
  `VendorID` varchar(50) DEFAULT NULL,
  `AllocationDate` date DEFAULT NULL,
  `VendorIDs` text DEFAULT NULL,
  `TaxAmt` double DEFAULT 0,
  `SubTotal` double NOT NULL DEFAULT 0,
  `DiscountType` varchar(50) DEFAULT NULL,
  `DiscountPer` double NOT NULL DEFAULT 0,
  `DiscountAmount` double NOT NULL DEFAULT 0,
  `CGSTAmt` double NOT NULL DEFAULT 0,
  `SGSTAmt` double NOT NULL DEFAULT 0,
  `IGSTAmt` double NOT NULL DEFAULT 0,
  `TotalAmount` double NOT NULL DEFAULT 0,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `DetailID` varchar(50) NOT NULL,
  `QID` varchar(50) DEFAULT NULL,
  `CID` varchar(50) DEFAULT NULL,
  `SCID` varchar(50) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Qty` double DEFAULT 0,
  `Price` double DEFAULT NULL,
  `UOMID` varchar(50) DEFAULT NULL,
  `TaxType` varchar(50) DEFAULT NULL,
  `TaxID` varchar(50) DEFAULT NULL,
  `TaxPer` double DEFAULT 0,
  `Taxable` double NOT NULL DEFAULT 0,
  `DiscountType` varchar(50) DEFAULT NULL,
  `DiscountPer` double NOT NULL DEFAULT 0,
  `DiscountAmount` double NOT NULL DEFAULT 0,
  `TaxAmount` double NOT NULL DEFAULT 0,
  `CGSTPer` double NOT NULL DEFAULT 0,
  `SGSTPer` double DEFAULT 0,
  `IGSTPer` double NOT NULL DEFAULT 0,
  `CGSTAmount` double NOT NULL DEFAULT 0,
  `SGSTAmount` double NOT NULL DEFAULT 0,
  `IGSTAmount` double NOT NULL DEFAULT 0,
  `Amount` double NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `SLNO` int(11) NOT NULL,
  `KeyName` text DEFAULT NULL,
  `KeyValue` text DEFAULT NULL,
  `SType` enum('text','number','json','boolean','serialize') NOT NULL,
  `Description` text DEFAULT NULL,
  `UpdatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UKey` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`SLNO`, `KeyName`, `KeyValue`, `SType`, `Description`, `UpdatedOn`, `UpdatedBy`, `UKey`) VALUES
(1, 'PRICE-DECIMALS', '2', 'number', '', '2023-08-24 09:25:28', 'U2023-0000001', 'lPd1V67QAmx3jmxpAt4fYlmGsIbEBuUbVdpk4QXntS'),
(2, 'PERCENTAGE-DECIMALS', '2', 'number', '', '2023-08-24 09:30:28', 'U2023-0000001', 'fmeSQW2yNUjzuKETdxdYt3hYyC6YmjahpDqeQreN1avWnlqCtDaBAia4hiE8'),
(3, 'DATE-FORMAT', 'd-M-Y', 'text', '', '2023-08-24 09:33:28', 'U2023-0000001', 'RanLtlqgm4pnvy57kGMZ7YZtWMS9NUnTf05ps2eD7Q7Lur48JvMk8Ryfs4VCPCQAuL7byIJzpvrx2lhBG1'),
(4, 'TIME-FORMAT', 'h:i:s A', 'text', '', '2023-08-24 09:28:28', 'U2023-0000001', 'h1yWBRTYTLX2nwbM'),
(5, 'upload-limit', '2M', 'number', '', '2023-08-24 09:24:28', 'U2023-0000001', 'bQ9R3UXXzSsN1UtURNB2UaGvi4rRm4ZEizL5U74Lmt81Duevm4l1BHJTBQGlleHB9WPKjh'),
(6, 'app-init-year', '2023', 'boolean', NULL, '2023-08-16 07:16:20', 'U2020-0000001', 'EXk0n4p7e3g3lQsIH8SAESahz1hBx39AmL2KJHQehFbiBjjQ'),
(7, 'enable-product-gallery-image', '1', 'boolean', NULL, '2023-08-16 07:16:20', '', ''),
(8, 'enable-product-group-price-on-product', '1', 'boolean', 'Customer Group Price show on product page show or hide', '2023-08-16 07:16:20', '', ''),
(9, 'enable-customer-credit-limit', '1', 'boolean', 'Customers Credit Limit enable status', '2023-08-16 07:16:20', '', ''),
(10, 'allow-customer-credit-over-drafting', '1', 'boolean', 'Customers Credit Limit reached after also allow credit', '2023-08-16 07:16:20', '', ''),
(11, 'customer-default-credit-limit', '10000', 'number', 'Customers Credit Limit Amount', '2023-08-16 07:16:20', '', ''),
(12, 'default-customers-credit-days', '30', 'number', 'Customer Credit Days', '2023-08-16 07:16:20', '', ''),
(13, 'enable-supplier-credit-limit', '1', 'boolean', 'Supplier Credit Limit enable status', '2023-08-16 07:16:20', '', ''),
(14, 'allow-supplier-credit-over-drafting', '1', 'boolean', 'Supplier Credit Limit reached after also allow credit', '2023-08-16 07:16:20', '', ''),
(15, 'supplier-default-credit-limit', '10000', 'number', 'Supplier Credit Limit Amount', '2023-08-16 07:16:20', '', ''),
(16, 'default-suppliers-credit-days', '30', 'number', 'Supplier Credit Days', '2023-08-16 07:16:20', '', ''),
(17, 'profile-image-crop-ratio', '{\"w\":\"1\",\"h\":\"1\"}', 'json', '', '2023-08-16 07:16:20', '', ''),
(18, 'image-crop-ratio', '{\"w\":\"1\",\"h\":\"1\"}', 'json', '', '2023-08-16 07:16:20', '', ''),
(19, 'QTY-DECIMALS', '0', 'number', '', '2023-08-16 07:16:20', '', ''),
(20, 'product-cover-image-upload-limit', '17', 'number', '', '2023-08-24 09:24:28', 'U2023-0000001', ''),
(21, 'product-gallery-image-upload-limit', '10', 'number', '', '2023-08-24 09:24:28', 'U2023-0000001', ''),
(22, 'Quote-Valid', '10', 'number', '', '2023-08-24 09:24:28', 'U2023-0000001', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_socialite_providers`
--

CREATE TABLE `tbl_socialite_providers` (
  `SLNO` int(11) NOT NULL,
  `ProviderName` varchar(50) DEFAULT NULL,
  `Type` enum('Web','Mobile') NOT NULL DEFAULT 'Web',
  `ClientID` text DEFAULT NULL,
  `ClientSecret` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_socialite_providers`
--

INSERT INTO `tbl_socialite_providers` (`SLNO`, `ProviderName`, `Type`, `ClientID`, `ClientSecret`, `ActiveStatus`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`) VALUES
(1, 'google', 'Web', '424457474670-75fk7pmssjs1u0ohmsbf7uaqvucclol4.apps.googleusercontent.com', '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', 'Active', '2024-02-08 07:00:56', NULL, NULL, NULL),
(2, 'facebook', 'Web', '', '', 'Inactive', '2024-02-08 07:00:56', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_update`
--

CREATE TABLE `tbl_stock_update` (
  `DetailID` varchar(50) NOT NULL,
  `Date` date DEFAULT NULL,
  `StockPointID` varchar(50) DEFAULT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `PCID` varchar(50) DEFAULT NULL,
  `PSCID` varchar(50) DEFAULT NULL,
  `UID` varchar(50) DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support_type`
--

CREATE TABLE `tbl_support_type` (
  `SLNO` varchar(50) NOT NULL,
  `SupportType` varchar(100) DEFAULT NULL,
  `isAll` int(11) NOT NULL DEFAULT 0,
  `ActiveStatus` int(11) DEFAULT 1,
  `DFlag` int(11) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_support_type`
--

INSERT INTO `tbl_support_type` (`SLNO`, `SupportType`, `isAll`, `ActiveStatus`, `DFlag`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`, `DeletedOn`, `DeletedBy`) VALUES
('ST2023-00001', 'All', 1, 0, 0, '2023-03-31 10:18:05', 'U2023-0000001', '2023-04-27 09:48:56', 'U2023-0000001', NULL, NULL),
('ST2023-00002', 'Billing', 0, 1, 0, '2023-03-31 10:18:12', 'U2023-0000001', NULL, NULL, NULL, NULL),
('ST2023-00003', 'Technical', 0, 1, 0, '2023-03-31 10:18:21', 'U2023-0000001', NULL, NULL, NULL, NULL),
('ST2023-00004', 'Others', 0, 1, 0, '2023-04-01 09:39:17', 'U2023-0000001', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax`
--

CREATE TABLE `tbl_tax` (
  `TaxID` varchar(50) NOT NULL,
  `TaxName` varchar(50) NOT NULL,
  `TaxPercentage` varchar(150) NOT NULL,
  `DFlag` int(11) NOT NULL DEFAULT 0,
  `ActiveStatus` enum('Active','Inactive') DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_tax`
--

INSERT INTO `tbl_tax` (`TaxID`, `TaxName`, `TaxPercentage`, `DFlag`, `ActiveStatus`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`) VALUES
('TX2023-0000001', 'GST-12', '12', 0, 'Active', 'U2023-0000001', 'U2023-0000001', NULL, '2023-11-20 09:22:07', '2023-12-25 05:08:44', NULL),
('TX2023-0000002', 'GST-18', '18', 0, 'Active', 'U2023-0000001', 'U2023-0000001', 'U2023-0000001', '2023-11-20 09:22:19', '2023-11-20 09:25:22', '2023-11-20 09:22:40'),
('TX2024-0000003', 'Tax', '5', 0, 'Active', 'U2023-0000002', NULL, NULL, '2024-01-06 07:46:10', NULL, NULL),
('TX2024-0000004', 'GST - 28', '28', 0, 'Active', 'U2023-0000002', NULL, NULL, '2024-01-06 07:48:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uom`
--

CREATE TABLE `tbl_uom` (
  `UID` varchar(50) NOT NULL,
  `UCode` varchar(50) NOT NULL,
  `UName` varchar(150) NOT NULL,
  `DFlag` int(11) DEFAULT 0,
  `ActiveStatus` enum('Active','Inactive') DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_uom`
--

INSERT INTO `tbl_uom` (`UID`, `UCode`, `UName`, `DFlag`, `ActiveStatus`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`) VALUES
('UOM2023-0000001', 'Nos', 'Nos', 0, 'Active', 'U2023-0000001', 'U2023-0000001', NULL, '2023-11-20 10:11:10', '2023-12-25 05:08:53', NULL),
('UOM2023-0000002', 'Sq.ft', 'Sq.Ft', 0, 'Active', 'U2023-0000001', NULL, NULL, '2023-11-20 10:13:23', NULL, NULL),
('UOM2023-0000003', 'Bag', 'Bag', 0, 'Active', 'U2023-0000001', NULL, NULL, '2023-12-25 08:22:09', NULL, NULL),
('UOM2023-0000004', 'KG', 'KG', 0, 'Active', 'U2023-0000002', NULL, NULL, '2023-12-28 06:54:40', NULL, NULL),
('UOM2024-0000005', 'Unit', 'Unit', 0, 'Active', 'U2023-0000002', 'U2023-0000002', NULL, '2024-01-05 05:39:42', '2024-01-25 10:28:20', NULL),
('UOM2024-0000006', 'Cubic Meter', 'Cubic Meter', 0, 'Active', 'U2023-0000002', NULL, NULL, '2024-01-09 05:10:10', NULL, NULL),
('UOM2024-0000007', 'LIT', 'LITRE', 0, 'Active', 'U2023-0000002', NULL, NULL, '2024-01-22 10:15:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_roles`
--

CREATE TABLE `tbl_user_roles` (
  `RoleID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RoleName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRUD` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isShow` int(1) DEFAULT 1,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_roles`
--

INSERT INTO `tbl_user_roles` (`RoleID`, `RoleName`, `CRUD`, `isShow`, `ActiveStatus`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('UR2023-0000001', 'Admin', 'a:19:{s:13:\"M2023-0000001\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:1;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000013\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000014\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000015\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000016\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000017\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000018\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000012\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000020\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000021\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000022\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000023\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000024\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000025\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000026\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000035\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000027\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000028\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000029\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:1;}}', 0, 'Active', 0, '2022-12-09 19:38:23', '2023-12-27 22:31:31', NULL, 'U2020-0000001', 'U2023-0000002', NULL),
('UR2023-0000002', 'Product Data Entry', 'a:19:{s:13:\"M2023-0000001\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:1;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000013\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000014\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000015\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000016\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000017\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000018\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000012\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000020\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000021\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000022\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000023\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000024\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000025\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000026\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000035\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000027\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000028\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000029\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}}', 1, 'Active', 0, '2023-12-28 07:30:18', NULL, NULL, 'U2023-0000002', NULL, NULL),
('UR2023-0000003', 'Super Admin', 'a:28:{s:13:\"M2023-0000001\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:1;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000013\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000014\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000015\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000016\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000017\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000018\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000012\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000020\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000021\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000022\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000036\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000037\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000023\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000024\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000025\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000026\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000035\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000027\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000038\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000039\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000028\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:0;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000029\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:1;}s:13:\"M2023-0000019\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000032\";a:11:{s:3:\"add\";i:0;s:4:\"view\";i:0;s:4:\"edit\";i:0;s:6:\"delete\";i:0;s:4:\"copy\";i:0;s:5:\"excel\";i:0;s:3:\"csv\";i:0;s:5:\"print\";i:0;s:3:\"pdf\";i:0;s:7:\"restore\";i:0;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000033\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000040\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}s:13:\"M2023-0000042\";a:11:{s:3:\"add\";i:1;s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:5:\"print\";i:1;s:3:\"pdf\";i:1;s:7:\"restore\";i:1;s:7:\"showpwd\";i:0;}}', 1, 'Active', 0, '2023-12-30 05:30:35', '2024-03-05 07:46:43', NULL, 'U2023-0000001', 'U2023-0000001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_theme`
--

CREATE TABLE `tbl_user_theme` (
  `SLNO` int(11) NOT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `Theme_option` varchar(200) DEFAULT NULL,
  `Theme_Value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_user_theme`
--

INSERT INTO `tbl_user_theme` (`SLNO`, `UserID`, `Theme_option`, `Theme_Value`) VALUES
(1, 'U2023-0000001', 'button-size', 'btn-sm'),
(2, 'U2023-0000001', 'table-size', 'table-sm'),
(3, 'U2023-0000001', 'switch-size', ''),
(4, 'U2023-0000001', 'page-wrapper', 'compact-wrapper'),
(5, 'U2023-0000001', 'page-body-wrapper', 'sidebar-icon'),
(6, 'U2023-0000001', 'body', 'dark-only'),
(7, 'U2023-0000001', 'mixLayout', 'light-only'),
(8, 'U2023-0000001', 'color', 'color-2'),
(9, 'U2023-0000001', 'primary', '#0288d1'),
(10, 'U2023-0000001', 'secondary', '#26c6da'),
(11, 'U2023-0000001', 'bodyTheme', 'light-only'),
(12, 'U2023-0000001', 'layout', 'ltr'),
(13, 'U2023-0000001', 'bg', 'light-sidebar'),
(14, 'U2023-0000001', 'zoom', '75%'),
(15, 'U2023-0000001', 'pageWrapper', 'page-wrapper horizontal-wrapper '),
(16, 'U2023-0000001', 'pageBodyWrapper', 'page-body-wrapper horizontal-menu'),
(17, 'U2023-0000001', 'font-size', '14px'),
(18, 'U2023-0000001', 'input-size', ''),
(19, 'U2023-0000002', 'color', 'color-2'),
(20, 'U2023-0000002', 'primary', '#0288d1'),
(21, 'U2023-0000002', 'secondary', '#26c6da'),
(22, 'U2023-0000002', 'bodyTheme', 'light-only'),
(23, 'U2023-0000002', 'mixLayout', 'light-only'),
(24, 'U2023-0000002', 'bg', 'light-sidebar'),
(25, 'U2023-0000002', 'pageWrapper', 'page-wrapper compact-wrapper '),
(26, 'U2023-0000002', 'pageBodyWrapper', 'page-body-wrapper sidebar-icon'),
(27, 'U2023-0000002', 'layout', 'ltr'),
(28, 'U2023-0000002', 'zoom', '75%'),
(29, 'U2023-0000002', 'button-size', 'btn-sm'),
(30, 'U2023-0000002', 'table-size', 'table-sm'),
(31, 'U2023-0000002', 'switch-size', ''),
(32, 'U2023-0000002', 'input-size', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors`
--

CREATE TABLE `tbl_vendors` (
  `VendorID` varchar(50) NOT NULL,
  `VendorName` varchar(150) DEFAULT NULL,
  `VendorCoName` text DEFAULT NULL,
  `VendorCoWebsite` text DEFAULT NULL,
  `Reference` text DEFAULT NULL,
  `GSTNo` varchar(50) DEFAULT NULL,
  `CID` varchar(50) DEFAULT NULL,
  `PCategories` text DEFAULT NULL,
  `VendorType` varchar(50) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `MobileNumber1` varchar(50) DEFAULT NULL,
  `MobileNumber2` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PostalCode` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `CreditDays` double NOT NULL DEFAULT 0,
  `CreditLimit` double NOT NULL DEFAULT 0,
  `CommissionPercentage` double NOT NULL DEFAULT 0,
  `Logo` text DEFAULT NULL,
  `isApproved` int(1) NOT NULL DEFAULT 0,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `ApprovedOn` timestamp NULL DEFAULT NULL,
  `ServiceBy` enum('District','PostalCode','Radius') NOT NULL DEFAULT 'PostalCode',
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors`
--

INSERT INTO `tbl_vendors` (`VendorID`, `VendorName`, `VendorCoName`, `VendorCoWebsite`, `Reference`, `GSTNo`, `CID`, `PCategories`, `VendorType`, `Email`, `MobileNumber1`, `MobileNumber2`, `Address`, `PostalCode`, `CityID`, `TalukID`, `DistrictID`, `StateID`, `CountryID`, `CreditDays`, `CreditLimit`, `CommissionPercentage`, `Logo`, `isApproved`, `ApprovedBy`, `ApprovedOn`, `ServiceBy`, `ActiveStatus`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('V2023-00000005', 'VRG', NULL, NULL, NULL, '33AAACA8049G1ZW', 'VC2023-0000002', NULL, 'ST2023-0000004', NULL, '9874561230', NULL, 'Vellode,Erode', 'PC2023-0015329', 'CI2023-0115694', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 10, 15, 80, '', 1, NULL, NULL, 'PostalCode', 'Active', 1, '2023-12-28 10:08:19', NULL, NULL, 'U2023-0000002', NULL, NULL),
('V2023-00000006', 'RPC CONSTRUCTION SOLUTION', NULL, NULL, NULL, '33BCMPA6187M1Z8', 'VC2023-0000005', NULL, 'ST2023-0000002', 'rpcchemicals2019@gmail.com', '8300355703', NULL, '201,NATHAGOUNDANPALAYAM, AVAL POONDURAI(VIA), ERODE', 'PC2023-0015329', 'CI2023-0115990', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 10, 10000, 2, '', 1, NULL, NULL, 'PostalCode', 'Active', 0, '2023-12-28 11:02:48', '2024-02-09 09:36:16', NULL, 'U2023-0000002', 'U2023-0000001', NULL),
('V2024-00000008', 'Conti Builders', NULL, NULL, NULL, '33AAACH7409R1Z8', 'VC2023-0000005', NULL, 'ST2023-0000003', NULL, '9988776655', NULL, '123, SS Apartments', 'PC2023-0015260', 'CI2023-0115343', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 10, 100000, 5, 'uploads/master/vendor/manage-vendors/V2024-00000008/1327c4ab34760207c26d5855494d71fc.jpg', 1, NULL, NULL, 'PostalCode', 'Active', 0, '2024-01-01 05:24:42', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('V2024-00000018', 'Vetri Constructions', NULL, NULL, NULL, '33AAACH7409R1Z8', 'VC2023-0000001', NULL, 'ST2023-0000004', NULL, '1234123412', NULL, 'qwertqwerqwer', 'PC2023-0015264', 'CI2023-0115287', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 15, 20, 5, 'uploads/master/vendor/manage-vendors/V2024-00000018/18268ff28dd44b8c56db697c803a2eb5.jpg', 1, 'U2023-0000001', NULL, 'District', 'Active', 0, '2024-01-03 12:14:45', '2024-02-10 05:21:45', '2024-02-02 04:44:45', 'U2023-0000001', 'U2023-0000001', NULL),
('V2024-00000020', 'KCM Traders', NULL, NULL, 'Rajan', '33AAACH7409R1Z8', 'VC2023-0000001', NULL, 'ST2023-0000002', NULL, '9754029132', NULL, '6, Aandal St,', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 30, 100000, 12, 'uploads/master/vendor/manage-vendors/V2024-00000020/496fad8b20571f823674e363874088d1.jpg', 1, NULL, NULL, 'District', 'Active', 0, '2024-01-12 07:50:18', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('V2024-00000021', 'Om Sakthi Traders', NULL, NULL, NULL, '33AAACH7409R1Z8', 'VC2023-0000001', NULL, 'ST2023-0000002', NULL, '9944907234', NULL, '24-D, Old market road', 'PC2023-0015343', 'CI2023-0115859', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 30, 100000, 15, 'uploads/master/vendor/manage-vendors/V2024-00000021/d1c89febdf3fb7032a1bb51f4ebe6834.png', 1, NULL, NULL, 'PostalCode', 'Active', 0, '2024-01-23 03:14:36', '2024-02-09 10:00:19', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('V2024-00000041', 'bharani', 'test', NULL, '.', '33AAACL0140P1ZQ', NULL, 'a:4:{i:0;s:14:\"PC2024-0000002\";i:1;s:14:\"PC2024-0000003\";i:2;s:14:\"PC2024-0000004\";i:3;s:14:\"PC2024-0000005\";}', NULL, 'bharani@gmail.com', '8220470570', NULL, 'vjfnbfdb', 'PC2023-0015327', 'CI2023-0115677', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, 0, 0, 'uploads/master/vendor/manage-vendors/V2024-00000041/a34ed84a81ef73cff982e25e5350868c.jpg', 0, NULL, NULL, 'PostalCode', 'Active', 0, '2024-02-09 11:36:03', NULL, NULL, NULL, NULL, NULL),
('V2024-00000042', 'Vendor name', 'Vendor Company Name', NULL, NULL, '33AAACL0140P1ZQ', NULL, 'a:2:{i:0;s:14:\"PC2023-0000001\";i:1;s:14:\"PC2024-0000002\";}', NULL, 'vendor@gmail.com', '9876543210', NULL, 'Erode', 'PC2023-0015334', 'CI2023-0115685', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, 0, 0, 'uploads/master/vendor/manage-vendors/V2024-00000042/522ab5d4af00ac91f4a79e840b01c449.jpg', 0, NULL, NULL, 'PostalCode', 'Active', 0, '2024-02-12 05:26:38', NULL, NULL, NULL, NULL, NULL),
('V2024-00000044', 'Arun Kumar', 'Arun & Co', 'arunandco.com', NULL, '24AAACC1206D1ZM', 'VC2023-0000002', 'a:4:{i:0;s:14:\"PC2024-0000003\";i:1;s:14:\"PC2024-0000004\";i:2;s:14:\"PC2024-0000005\";i:3;s:14:\"PC2024-0000006\";}', 'ST2023-0000001', 'arun@gmail.com', '7200900000', NULL, '57, St.Annes Road', 'PC2023-0015343', 'CI2023-0115859', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, 0, 0, 'uploads/master/vendor/manage-vendors/V2024-00000044/502b71eae96bf0eeb65eabebe926f0cd.jpg', 1, 'U2023-0000001', NULL, 'PostalCode', 'Active', 1, '2024-02-22 06:45:04', '2024-02-22 09:33:54', '2024-03-06 07:18:06', NULL, 'U2023-0000001', 'U2023-0000001'),
('V2024-00000045', 'Bharani Builders', 'nxnxhd', NULL, NULL, '29GGGGG1314R9Z6', NULL, 'a:3:{i:0;s:14:\"PC2023-0000001\";i:1;s:14:\"PC2023-0000002\";i:2;s:14:\"PC2024-0000002\";}', 'ST2023-0000003', 'mobileteam620@gmail.com', '9466467664', '', 'xjjxhxj', 'PC2023-0015331', 'CI2023-0115969', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, 0, 0, 'uploads/master/vendor/manage-vendors/V2024-00000045/db09fecdc7bc7db7da4b0913b81fc5b3.jpg', 1, 'U2023-0000001', NULL, 'District', 'Active', 0, '2024-02-22 07:54:29', '2024-02-22 09:19:02', '2024-02-23 05:08:09', NULL, NULL, NULL),
('V2324-00000046', 'nikhil', 'auto cars', 'autocars.com', NULL, '29GGGGG1314R9Z6', NULL, 'a:3:{i:0;s:14:\"PC2023-0000002\";i:1;s:14:\"PC2023-0000001\";i:2;s:14:\"PC2024-0000002\";}', 'ST2023-0000001', 'nikhilkproplus@gmail.com', '9447184523', '', 'sbhzjzjzjzkxbbc n n', 'PC2023-0015249', 'CI2023-0115392', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, 0, 0, 'uploads/master/vendor/manage-vendors/V2324-00000046/aabfd88e619e1589d0bfacb4dc2a8667.jpg', 0, NULL, NULL, 'District', 'Active', 0, '2024-02-22 10:23:20', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_database`
--

CREATE TABLE `tbl_vendors_database` (
  `S.No` int(11) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `VendorUniqueID` varchar(50) DEFAULT NULL,
  `DBName` varchar(150) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_database`
--

INSERT INTO `tbl_vendors_database` (`S.No`, `VendorID`, `VendorUniqueID`, `DBName`, `CreatedBy`, `CreatedOn`) VALUES
(17, 'V2023-00000006', 'qlub', 'rpc_v_qlub_fy_2324', 'U2023-0000001', '2024-02-09 09:31:22'),
(18, 'V2024-00000018', 'umcw', 'rpc_v_umcw_fy_2324', 'U2023-0000001', '2024-02-09 09:31:53'),
(19, 'V2024-00000020', 'khei', 'rpc_v_khei_fy_2324', 'U2023-0000001', '2024-02-09 09:31:55'),
(20, 'V2024-00000021', 'vkwe', 'rpc_v_vkwe_fy_2324', 'U2023-0000001', '2024-02-09 09:32:11'),
(21, 'V2024-00000008', 'gtkm', 'rpc_v_gtkm_fy_2324', 'U2023-0000001', '2024-02-09 09:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_document`
--

CREATE TABLE `tbl_vendors_document` (
  `SLNo` varchar(50) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `DocName` varchar(50) DEFAULT NULL,
  `ImgID` varchar(100) DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_document`
--

INSERT INTO `tbl_vendors_document` (`SLNo`, `VendorID`, `DocName`, `ImgID`, `documents`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`) VALUES
('VD2024-00000001', 'V2024-00000032', 'AadharFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000032/documents/f1c726aa67f1336c69e90d96e30f7b5c.jpg', '2024-02-05 13:12:23', NULL, NULL, NULL),
('VD2024-00000002', 'V2024-00000032', 'AadharBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000032/documents/f1c726aa67f1336c69e90d96e30f7b5c.jpg', '2024-02-05 13:12:23', NULL, NULL, NULL),
('VD2024-00000003', 'V2024-00000033', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000033/documents/6e504c0977f291686ace326a203edb7c.pdf', '2024-02-06 05:08:33', NULL, NULL, NULL),
('VD2024-00000004', 'V2024-00000033', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000033/documents/823b36a9538a2281f48b1c616b677524.pdf', '2024-02-06 05:08:33', NULL, NULL, NULL),
('VD2024-00000005', 'V2024-00000034', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000034/documents/6e504c0977f291686ace326a203edb7c.pdf', '2024-02-06 05:22:17', NULL, NULL, NULL),
('VD2024-00000006', 'V2024-00000034', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000034/documents/64c1fb4782e76b6f23938a23a79bc16f.jpg', '2024-02-06 05:22:17', NULL, NULL, NULL),
('VD2024-00000007', 'V2024-00000035', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000035/documents/31a32d135308cd198449c566e95b70a4.pdf', '2024-02-06 05:22:35', NULL, NULL, NULL),
('VD2024-00000008', 'V2024-00000035', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000035/documents/dde85510a7919afafc7e0be932b8fa37.pdf', '2024-02-06 05:22:35', NULL, NULL, NULL),
('VD2024-00000009', 'V2024-00000035', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000035/documents/55b02182bd41ca441606bd0af1b0af6e.pdf', '2024-02-06 05:22:35', NULL, NULL, NULL),
('VD2024-00000010', 'V2024-00000035', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000035/documents/9a199cba94589a4c4d15874bec3ff118.pdf', '2024-02-06 05:22:35', NULL, NULL, NULL),
('VD2024-00000011', 'V2024-00000036', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000036/documents/161745598e70926dc32c126c3440fb87.pdf', '2024-02-06 06:08:58', NULL, NULL, NULL),
('VD2024-00000012', 'V2024-00000036', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000036/documents/d1ca96c81ac6fa0ce547a8f0ebb5b206.pdf', '2024-02-06 06:08:58', NULL, NULL, NULL),
('VD2024-00000013', 'V2024-00000037', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000037/documents/421140c9939480272612841c1083959a.pdf', '2024-02-06 10:59:28', NULL, NULL, NULL),
('VD2024-00000014', 'V2024-00000038', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000038/documents/bcaf37fc11531d638059a1939421df57.pdf', '2024-02-06 11:32:10', NULL, NULL, NULL),
('VD2024-00000015', 'V2024-00000044', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000040/documents/58a27b86dcc4646db8634300ffb1b765.pdf', '2024-02-07 04:22:12', NULL, NULL, NULL),
('VD2024-00000016', 'V2024-00000044', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000040/documents/ef10ead40fb40a16492dd0556ace1527.pdf', '2024-02-07 04:22:12', NULL, NULL, NULL),
('VD2024-00000017', 'V2024-00000040', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000040/documents/78e1c7bf489a26de11c236bde7068b08.pdf', '2024-02-07 04:22:12', NULL, NULL, NULL),
('VD2024-00000018', 'V2024-00000040', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000040/documents/eed97747db4d3921818f6d17c7a52a68.pdf', '2024-02-07 04:22:12', NULL, NULL, NULL),
('VD2024-00000019', 'V2024-00000041', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000041/documents/74062e375303cf0aca8cc6b16dcdd5ac.pdf', '2024-02-09 11:36:03', NULL, NULL, NULL),
('VD2024-00000020', 'V2024-00000041', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000041/documents/3ea1f1532be9402951f396f707297e94.pdf', '2024-02-09 11:36:03', NULL, NULL, NULL),
('VD2024-00000021', 'V2024-00000041', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000041/documents/c6fd0e0784159d205e21fa9b26c39942.pdf', '2024-02-09 11:36:03', NULL, NULL, NULL),
('VD2024-00000022', 'V2024-00000041', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000041/documents/c4d3937b909551860075a3fd3284fd11.pdf', '2024-02-09 11:36:03', NULL, NULL, NULL),
('VD2024-00000023', 'V2024-00000042', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000042/documents/17ddc3b6ecd101b8788c165709726098.pdf', '2024-02-12 05:26:38', NULL, NULL, NULL),
('VD2024-00000024', 'V2024-00000042', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000042/documents/8fff65c02b6b3a283042530792c82755.pdf', '2024-02-12 05:26:38', NULL, NULL, NULL),
('VD2024-00000025', 'V2024-00000042', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000042/documents/f5864a98d8afe35d8ad3a205998b6cc9.pdf', '2024-02-12 05:26:38', NULL, NULL, NULL),
('VD2024-00000026', 'V2024-00000042', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000042/documents/c22f74fb482bc97dd2f889d51d3ea178.pdf', '2024-02-12 05:26:38', NULL, NULL, NULL),
('VD2024-00000027', 'V2024-00000043', 'AadharFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000043/documents/5469007378f8633f8a7ad9f059ccf11c.pdf', '2024-02-21 13:12:01', NULL, NULL, NULL),
('VD2024-00000028', 'V2024-00000043', 'AadharBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000043/documents/7e7cc10d11b18181c78aa0d1ad146b9f.pdf', '2024-02-21 13:12:02', NULL, NULL, NULL),
('VD2024-00000029', 'V2024-00000045', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000045/documents/b33689b9f5b54e5e24288f56e38dfb52.pdf', '2024-02-22 07:54:29', NULL, NULL, NULL),
('VD2024-00000030', 'V2024-00000045', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000045/documents/1a2e8f2906840d80d9d3e355a2325d50.pdf', '2024-02-22 07:54:29', NULL, NULL, NULL),
('VD2024-00000031', 'V2024-00000045', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000045/documents/18db0b40118e9918341f3a9657be5e26.pdf', '2024-02-22 07:54:29', NULL, NULL, NULL),
('VD2024-00000032', 'V2024-00000045', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2024-00000045/documents/b814e9427da12b4c9d9d27b9c16ec80f.pdf', '2024-02-22 07:54:29', NULL, NULL, NULL),
('VD2324-00000033', 'V2324-00000046', 'GSTCertificate', NULL, 'uploads/master/vendor/manage-vendors/V2324-00000046/documents/b3758efaf7ff6af47dd25a537f20d8d0.pdf', '2024-02-22 10:23:20', NULL, NULL, NULL),
('VD2324-00000034', 'V2324-00000046', 'PANCard', NULL, 'uploads/master/vendor/manage-vendors/V2324-00000046/documents/6c9c819f7ebef68cd91d56f13120052d.pdf', '2024-02-22 10:23:20', NULL, NULL, NULL),
('VD2324-00000035', 'V2324-00000046', 'AadharCardFront', NULL, 'uploads/master/vendor/manage-vendors/V2324-00000046/documents/218e55d451da480a1265869690aec4ac.pdf', '2024-02-22 10:23:20', NULL, NULL, NULL),
('VD2324-00000036', 'V2324-00000046', 'AadharCardBack', NULL, 'uploads/master/vendor/manage-vendors/V2324-00000046/documents/389a2b2338a918f4865315c78010d10e.pdf', '2024-02-22 10:23:20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_product_mapping`
--

CREATE TABLE `tbl_vendors_product_mapping` (
  `DetailID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VendorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `VendorPrice` double DEFAULT 0,
  `PCID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PSCID` varchar(50) DEFAULT NULL,
  `Status` int(1) NOT NULL DEFAULT 1,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_product_mapping`
--

INSERT INTO `tbl_vendors_product_mapping` (`DetailID`, `VendorID`, `ProductID`, `VendorPrice`, `PCID`, `PSCID`, `Status`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VPM2324-0000000001', 'V2023-00000006', 'P2024-0000048', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:28:02', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000002', 'V2023-00000006', 'P2024-0000049', 530, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:28:02', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000003', 'V2023-00000006', 'P2024-0000050', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000004', 'V2023-00000006', 'P2024-0000051', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000005', 'V2023-00000006', 'P2024-0000052', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000006', 'V2023-00000006', 'P2024-0000053', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000007', 'V2023-00000006', 'P2024-0000054', 480, 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000008', 'V2023-00000006', 'P2024-0000180', 2950, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000009', 'V2023-00000006', 'P2024-0000181', 2000, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000010', 'V2023-00000006', 'P2024-0000182', 1400, 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000011', 'V2023-00000006', 'P2024-0000185', 0, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-21 07:01:11', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000012', 'V2023-00000006', 'P2024-0000189', 2250, 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000013', 'V2023-00000006', 'P2024-0000190', 6700, 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000014', 'V2023-00000006', 'P2024-0000206', 66, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000015', 'V2023-00000006', 'P2024-0000207', 75, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000016', 'V2023-00000006', 'P2024-0000208', 95, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000017', 'V2023-00000006', 'P2024-0000209', 46, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000018', 'V2023-00000006', 'P2024-0000210', 97, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000019', 'V2023-00000006', 'P2024-0000211', 44, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000020', 'V2023-00000006', 'P2024-0000212', 55, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000021', 'V2023-00000006', 'P2024-0000213', 60, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000022', 'V2023-00000006', 'P2024-0000242', 0, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000023', 'V2023-00000006', 'P2024-0000243', 70, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000024', 'V2023-00000006', 'P2024-0000244', 61, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-13 06:30:32', '2024-02-20 07:50:42', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000025', 'V2024-00000008', 'P2024-0000019', 110, 'PC2024-0000010', 'PSC2024-0000018', 1, '2024-02-13 06:46:05', '2024-02-13 06:46:05', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000026', 'V2024-00000008', 'P2024-0000021', 1000, 'PC2024-0000010', 'PSC2024-0000020', 1, '2024-02-13 06:46:05', '2024-02-13 06:46:05', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000027', 'V2024-00000008', 'P2024-0000022', 550, 'PC2024-0000010', 'PSC2024-0000021', 1, '2024-02-13 06:46:05', '2024-02-13 06:46:05', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000028', 'V2024-00000018', 'P2024-0000052', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000029', 'V2024-00000018', 'P2024-0000053', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000030', 'V2024-00000018', 'P2024-0000175', 2600, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000031', 'V2024-00000018', 'P2024-0000176', 460, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000032', 'V2024-00000018', 'P2024-0000180', 2950, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000033', 'V2024-00000018', 'P2024-0000181', 2000, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-17 11:43:47', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000034', 'V2024-00000020', 'P2024-0000049', 540, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:45:14', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000035', 'V2024-00000020', 'P2024-0000050', 520, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:45:14', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000036', 'V2024-00000020', 'P2024-0000052', 501, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:45:14', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000037', 'V2024-00000020', 'P2024-0000053', 520, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-17 11:45:14', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000038', 'V2024-00000020', 'P2024-0000180', 2910, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-17 11:45:14', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000039', 'V2023-00000006', 'P2024-0000248', 0, 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-20 04:31:33', '2024-02-20 07:50:42', NULL, NULL, 'U2023-0000001', NULL),
('VPM2324-0000000040', 'V2023-00000006', 'P2024-0000317', 350, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 04:45:18', '2024-02-20 07:50:42', NULL, NULL, 'U2023-0000001', NULL),
('VPM2324-0000000041', 'V2024-00000018', 'P2024-0000048', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000042', 'V2024-00000018', 'P2024-0000049', 530, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000043', 'V2024-00000018', 'P2024-0000050', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000044', 'V2024-00000018', 'P2024-0000051', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000045', 'V2024-00000018', 'P2024-0000054', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000046', 'V2024-00000018', 'P2024-0000317', 370, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000047', 'V2024-00000018', 'P2024-0000177', 6950, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000048', 'V2024-00000018', 'P2024-0000178', 6875, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000049', 'V2024-00000018', 'P2024-0000179', 210, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000050', 'V2024-00000018', 'P2024-0000183', 700, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000051', 'V2024-00000018', 'P2024-0000184', 610, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000052', 'V2024-00000018', 'P2024-0000186', 160, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000053', 'V2024-00000018', 'P2024-0000187', 1250, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000054', 'V2024-00000018', 'P2024-0000188', 460, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000055', 'V2024-00000018', 'P2024-0000191', 1550, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000056', 'V2024-00000018', 'P2024-0000192', 5000, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000057', 'V2024-00000018', 'P2024-0000193', 1950, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000058', 'V2024-00000018', 'P2024-0000194', 500, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000059', 'V2024-00000018', 'P2024-0000195', 590, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000060', 'V2024-00000018', 'P2024-0000196', 850, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000061', 'V2024-00000018', 'P2024-0000197', 100, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000062', 'V2024-00000018', 'P2024-0000198', 550, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000063', 'V2024-00000018', 'P2024-0000199', 750, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000064', 'V2024-00000018', 'P2024-0000200', 3900, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000065', 'V2024-00000018', 'P2024-0000201', 3300, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000066', 'V2024-00000018', 'P2024-0000202', 1150, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000067', 'V2024-00000018', 'P2024-0000203', 2350, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000068', 'V2024-00000018', 'P2024-0000204', 980, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000069', 'V2024-00000018', 'P2024-0000205', 2400, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000070', 'V2024-00000018', 'P2024-0000254', 690, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000071', 'V2024-00000018', 'P2024-0000256', 680, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000072', 'V2024-00000018', 'P2024-0000308', 4950, 'PC2024-0000004', 'PSC2024-0000059', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000073', 'V2024-00000018', 'P2024-0000182', 1400, 'PC2024-0000004', 'PSC2024-0000060', 1, '2024-02-20 11:00:31', '2024-02-20 11:00:31', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000074', 'V2024-00000020', 'P2024-0000128', 81.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-20 11:31:38', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000075', 'V2024-00000020', 'P2024-0000129', 76.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-20 11:31:38', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000076', 'V2024-00000020', 'P2024-0000130', 76.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-20 11:31:38', '2024-02-20 11:31:38', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000078', 'V2024-00000044', 'P2024-0000185', 5700, 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-22 07:29:41', '2024-02-22 09:34:32', NULL, NULL, 'U2023-0000001', NULL),
('VPM2324-0000000079', 'V2024-00000044', 'P2024-0000003', 3600, 'PC2024-0000007', 'PSC2024-0000003', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000080', 'V2024-00000044', 'P2024-0000004', 4600, 'PC2024-0000007', 'PSC2024-0000002', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000081', 'V2024-00000044', 'P2024-0000010', 3200, 'PC2024-0000007', 'PSC2024-0000004', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000082', 'V2024-00000044', 'P2024-0000011', 3200, 'PC2024-0000007', 'PSC2024-0000004', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000083', 'V2024-00000044', 'P2024-0000048', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000084', 'V2024-00000044', 'P2024-0000049', 530, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000085', 'V2024-00000044', 'P2024-0000050', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000086', 'V2024-00000044', 'P2024-0000051', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000087', 'V2024-00000044', 'P2024-0000052', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000088', 'V2024-00000044', 'P2024-0000053', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000089', 'V2024-00000044', 'P2024-0000127', 79.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000090', 'V2024-00000044', 'P2024-0000128', 81.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000091', 'V2024-00000044', 'P2024-0000129', 76.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000092', 'V2024-00000044', 'P2024-0000130', 76.5, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000093', 'V2024-00000044', 'P2024-0000131', 500, 'PC2024-0000002', 'PSC2024-0000058', 1, '2024-02-22 09:34:32', '2024-02-22 09:34:32', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VPM2324-0000000094', 'V2024-00000045', 'P2024-0000049', 500, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:49:35', NULL, NULL, NULL, NULL, NULL),
('VPM2324-0000000095', 'V2024-00000045', 'P2024-0000048', 420, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:51:46', NULL, NULL, NULL, NULL, NULL),
('VPM2324-0000000096', 'V2024-00000045', 'P2024-0000050', 470, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-22 09:54:04', '2024-02-23 04:42:18', NULL, NULL, NULL, NULL),
('VPM2324-0000000097', 'V2024-00000045', 'P2024-0000051', 460, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-23 04:42:27', NULL, NULL, NULL, NULL, NULL),
('VPM2324-0000000098', 'V2024-00000045', 'P2024-0000053', 480, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-23 04:42:38', NULL, NULL, NULL, NULL, NULL),
('VPM2324-0000000099', 'V2024-00000045', 'P2024-0000317', 350, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-23 04:42:59', NULL, NULL, NULL, NULL, NULL),
('VPM2324-0000000100', 'V2024-00000045', 'P2024-0000052', 420, 'PC2023-0000001', 'PSC2024-0000035', 1, '2024-02-23 04:43:12', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_service_locations`
--

CREATE TABLE `tbl_vendors_service_locations` (
  `DetailID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VendorID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ServiceBy` enum('District','PostalCode','Radius') NOT NULL DEFAULT 'PostalCode',
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `Raduis` int(50) DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_service_locations`
--

INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000000778', 'V2023-00000006', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015329', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-09 09:36:16', '2024-02-09 09:36:16', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000779', 'V2024-00000021', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015343', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-09 10:00:19', '2024-02-09 10:00:19', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000780', 'V2024-00000018', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015264', 'DT2023-00000497', 'S2020-00000035', 1, '2024-02-09 10:12:33', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000781', 'V2024-00000020', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015260', 'DT2023-00000497', 'S2020-00000035', 1, '2024-02-09 10:22:04', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000782', 'V2024-00000008', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015260', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:17:41', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000783', 'V2024-00000008', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015242', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:17:41', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000784', 'V2024-00000008', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015241', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:17:41', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000785', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015238', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000786', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015239', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000787', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015240', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000788', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015241', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000789', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015242', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000790', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015243', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000791', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015244', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000792', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015245', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000793', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015246', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000794', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015247', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000795', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015248', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000796', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015249', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000797', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015250', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000798', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015251', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000799', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015252', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000800', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015253', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000801', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015254', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000802', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015255', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000803', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015256', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000804', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015257', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000805', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015258', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000806', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015259', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000807', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015260', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000808', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015261', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000809', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015262', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000810', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015263', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000811', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015264', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000812', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015265', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000813', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015266', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000814', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015267', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000815', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015268', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000816', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015269', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000817', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015270', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000818', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015271', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000819', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015272', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000820', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015273', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000821', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015274', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000822', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015275', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000823', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015276', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000824', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015277', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000825', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015278', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000826', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015279', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000827', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015280', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000828', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015281', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000829', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015282', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000830', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015283', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000831', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015284', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000832', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015285', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000833', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015286', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000834', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015287', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000835', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015288', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000836', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015289', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000837', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015290', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000838', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015291', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000839', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015292', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000840', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015293', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000841', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015294', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000842', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015295', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000843', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015296', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000844', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015297', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000845', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015353', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000846', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015379', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000847', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015383', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000848', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015527', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000849', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015528', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000850', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015529', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000851', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015530', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000852', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015531', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000853', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015532', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000854', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015533', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000855', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015534', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000856', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015535', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000857', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015536', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000858', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015537', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000859', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015538', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000860', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015539', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000861', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015540', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000862', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015541', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000863', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015542', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000864', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015543', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000865', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015544', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000866', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015545', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000867', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015546', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000868', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015547', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000869', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015548', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000870', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015549', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000871', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015550', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000872', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015551', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000873', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015552', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000874', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015553', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000875', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015554', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000876', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015555', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000877', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015556', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000878', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015557', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000879', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015558', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000880', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015559', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000881', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015560', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000882', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015561', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000883', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015562', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000884', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015563', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000885', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015564', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000886', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015565', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000887', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015566', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000888', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015567', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000889', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015568', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000890', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015571', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000891', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015710', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000892', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015711', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000893', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015712', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000894', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015713', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000895', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015714', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000896', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015716', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000897', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015717', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000898', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015718', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000899', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015722', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000900', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015724', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000901', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015726', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000902', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015728', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000903', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015729', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000904', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015730', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000905', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015732', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000906', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015733', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000907', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015735', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000908', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015736', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000909', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015737', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000910', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015738', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000911', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015739', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000912', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015740', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000913', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015742', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000914', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015743', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000915', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015744', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000916', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015747', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000917', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015749', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000918', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015750', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000919', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015752', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000920', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015753', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000921', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015756', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000922', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015758', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000923', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015759', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000924', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015761', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000925', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015762', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000926', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015810', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:21:45', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000927', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015238', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000928', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015239', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000929', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015240', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000930', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015241', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000931', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015242', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000932', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015243', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000933', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015244', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000934', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015245', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000935', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015246', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000936', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015247', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000937', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015248', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000938', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015249', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000939', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015250', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000940', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015251', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000941', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015252', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000942', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015253', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000943', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015254', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000944', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015255', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000945', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015256', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000946', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015257', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000947', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015258', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000948', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015259', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000949', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015260', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000950', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015261', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000951', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015262', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000952', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015263', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000953', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015264', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000954', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015265', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000955', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015266', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000956', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015267', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000957', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015268', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000958', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015269', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000959', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015270', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000960', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015271', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000961', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015272', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000962', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015273', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000963', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015274', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000964', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015275', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000965', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015276', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000966', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015277', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000967', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015278', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000968', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015279', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000969', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015280', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000970', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015281', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000971', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015282', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000972', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015283', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000973', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015284', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000974', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015285', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000975', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015286', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000976', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015287', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000977', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015288', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000978', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015289', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000979', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015290', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000980', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015291', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000981', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015292', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000982', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015293', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000983', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015294', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000984', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015295', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000985', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015296', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000986', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015297', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000987', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015353', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000988', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015379', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000989', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015383', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000990', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015527', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000991', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015528', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000992', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015529', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000993', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015530', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000994', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015531', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000995', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015532', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000996', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015533', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000997', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015534', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000998', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015535', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000000999', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015536', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001000', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015537', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001001', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015538', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000001002', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015539', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001003', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015540', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001004', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015541', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001005', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015542', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001006', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015543', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001007', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015544', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001008', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015545', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001009', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015546', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001010', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015547', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001011', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015548', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001012', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015549', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001013', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015550', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001014', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015551', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001015', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015552', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001016', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015553', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001017', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015554', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001018', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015555', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001019', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015556', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001020', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015557', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001021', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015558', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001022', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015559', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001023', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015560', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001024', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015561', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001025', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015562', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001026', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015563', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001027', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015564', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001028', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015565', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001029', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015566', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001030', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015567', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001031', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015568', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001032', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015571', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001033', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015710', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001034', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015711', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001035', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015712', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001036', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015713', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001037', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015714', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001038', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015716', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001039', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015717', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001040', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015718', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001041', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015722', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001042', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015724', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001043', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015726', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001044', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015728', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001045', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015729', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001046', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015730', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001047', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015732', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001048', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015733', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001049', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015735', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001050', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015736', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001051', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015737', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001052', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015738', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001053', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015739', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001054', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015740', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001055', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015742', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001056', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015743', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001057', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015744', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001058', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015747', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001059', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015749', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001060', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015750', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001061', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015752', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001062', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015753', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001063', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015756', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001064', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015758', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001065', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015759', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001066', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015761', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001067', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015762', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001068', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015810', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001069', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015983', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001070', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015984', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001071', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015985', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001072', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015986', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001073', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015987', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001074', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015988', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001075', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015989', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001076', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015990', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001077', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015991', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001078', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015992', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001079', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015993', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001080', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015994', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001081', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015995', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001082', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015996', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001083', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015997', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001084', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015998', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001085', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0015999', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001086', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016000', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001087', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016001', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001088', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016002', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001089', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016003', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001090', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016004', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001091', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016005', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001092', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016006', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001093', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016007', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001094', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016008', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001095', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016009', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001096', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016010', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001097', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016011', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001098', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016012', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001099', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016013', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001100', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016014', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001101', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016015', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001102', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016016', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001103', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016017', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001104', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016018', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001105', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016019', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001106', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016020', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001107', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016021', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001108', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016022', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001109', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016023', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001110', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016024', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001111', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016025', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001112', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016026', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001113', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016027', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001114', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016028', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001115', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016029', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001116', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016030', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001117', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016031', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001118', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016032', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001119', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016033', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001120', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016130', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001121', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016134', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001122', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016140', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001123', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016141', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001124', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016144', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001125', 'V2024-00000020', 'District', NULL, NULL, NULL, 'PC2023-0016149', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-10 05:28:09', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2024-000000001126', 'V2024-00000044', 'PostalCode', NULL, NULL, NULL, 'PC2023-007818', 'DT2023-00000246', 'S2020-00000019', 1, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSL2024-000000001127', 'V2024-00000044', 'PostalCode', NULL, NULL, NULL, 'PC2023-008585', 'DT2023-00000258', 'S2020-00000019', 1, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSL2024-000000001128', 'V2024-00000044', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015240', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSL2024-000000001129', 'V2024-00000044', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015241', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSL2024-000000001130', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014802', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001131', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014884', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001132', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014885', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001133', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014886', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001134', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014887', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001135', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014888', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001136', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014889', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001137', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014890', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001138', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014891', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001139', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014892', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001140', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014893', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001141', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014894', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001142', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014895', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001143', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014896', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001144', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014897', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001145', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014898', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001146', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014900', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001147', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014901', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001148', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014902', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001149', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014903', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001150', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014904', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001151', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014905', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001152', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014906', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001153', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014907', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001154', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014908', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001155', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014909', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001156', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014910', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001157', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014911', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001158', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014912', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001159', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014913', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001160', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014914', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001161', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014915', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001162', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014916', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001163', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014917', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001164', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014918', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001165', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014920', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001166', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014921', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001167', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014922', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001168', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014923', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001169', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014926', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001170', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014927', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001171', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014928', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001172', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014929', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001173', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014931', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001174', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014933', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001175', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014934', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001176', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014935', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001177', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014938', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001178', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014941', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001179', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014942', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001180', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014943', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001181', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014946', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001182', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014947', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001183', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014948', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001184', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014949', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001185', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015075', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001186', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0020387', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001187', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014803', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001188', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014804', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001189', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014805', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001190', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014806', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001191', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014807', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001192', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014808', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001193', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014809', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001194', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014810', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001195', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014811', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001196', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014812', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001197', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014813', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001198', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014814', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001199', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014815', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001200', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014816', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001201', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014819', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001202', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014820', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001203', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014821', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001204', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014822', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001205', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014823', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001206', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014824', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001207', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014825', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001208', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014826', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001209', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014827', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001210', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014828', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001211', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014829', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001212', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014830', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001213', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014831', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001214', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014832', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001215', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014833', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001216', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014834', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001217', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014835', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001218', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014836', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001219', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014837', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001220', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014838', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001221', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014839', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001222', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014840', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001223', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014841', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001224', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014842', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001225', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014844', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001226', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014845', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001227', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015155', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001228', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015159', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001229', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015197', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001230', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015204', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001231', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015208', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001232', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015210', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001233', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015211', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001234', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015212', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001235', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015213', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000001236', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015214', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001237', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015215', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001238', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015216', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001239', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015217', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001240', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015218', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001241', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015219', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001242', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015220', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001243', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015221', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001244', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015222', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001245', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015223', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001246', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015224', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001247', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015225', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001248', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015226', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001249', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015227', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001250', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015228', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001251', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015229', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001252', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015230', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001253', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015231', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001254', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015232', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001255', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015233', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001256', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015234', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001257', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015235', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001258', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015236', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001259', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015237', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001260', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015663', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001261', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015664', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001262', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015665', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001263', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015666', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001264', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015667', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001265', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015668', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001266', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015669', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001267', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015671', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001268', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015672', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001269', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015673', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001270', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015674', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001271', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015675', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001272', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015676', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001273', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015677', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001274', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015678', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001275', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015679', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001276', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015680', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001277', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015681', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001278', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015682', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001279', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015683', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001280', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015684', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001281', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015685', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001282', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015686', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001283', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015687', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001284', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015688', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001285', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015689', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001286', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015690', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001287', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015691', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001288', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015692', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001289', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015693', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001290', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015694', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001291', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015695', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001292', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015696', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001293', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015697', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001294', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015698', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001295', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015699', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001296', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015700', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001297', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015701', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001298', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015702', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001299', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015703', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001300', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015704', 'DT2023-00000491', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001301', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014817', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001302', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014818', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001303', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014843', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001304', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015141', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001305', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015142', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001306', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015143', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001307', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015144', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001308', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015145', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001309', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015146', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001310', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015147', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001311', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015148', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001312', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015149', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001313', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015150', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001314', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015151', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001315', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015152', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001316', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015153', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001317', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015154', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001318', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015156', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001319', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015157', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001320', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015158', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001321', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015160', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001322', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015161', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001323', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015162', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001324', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015163', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001325', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015164', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001326', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015165', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001327', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015166', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001328', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015167', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001329', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015168', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001330', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015169', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001331', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015170', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001332', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015171', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001333', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015172', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001334', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015173', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001335', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015174', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001336', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015175', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001337', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015176', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001338', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015177', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001339', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015178', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001340', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015179', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001341', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015180', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001342', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015181', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001343', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015182', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001344', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015183', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001345', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015184', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001346', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015185', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001347', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015186', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001348', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015187', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001349', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015188', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001350', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015189', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001351', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015190', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001352', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015191', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001353', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015192', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001354', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015193', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001355', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015194', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001356', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015195', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001357', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015196', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001358', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015198', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001359', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015199', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001360', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015200', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001361', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015201', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001362', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015202', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001363', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015203', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001364', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015205', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001365', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015206', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001366', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015207', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001367', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015209', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001368', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015670', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001369', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016975', 'DT2023-00000492', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001370', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014846', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001371', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014847', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001372', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014848', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001373', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014849', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001374', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014850', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001375', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014851', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001376', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014852', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001377', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014853', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001378', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014854', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001379', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014855', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001380', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014856', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001381', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014857', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001382', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014858', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001383', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014859', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001384', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014860', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001385', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014861', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001386', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014862', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001387', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014863', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001388', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014864', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001389', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014865', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001390', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014866', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001391', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014867', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001392', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014868', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001393', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014869', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001394', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014870', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001395', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014871', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001396', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014872', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001397', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014873', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001398', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014874', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001399', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014875', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001400', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014876', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001401', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014877', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001402', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014878', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001403', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014879', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001404', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014880', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001405', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014881', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001406', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014882', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001407', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014883', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001408', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014919', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001409', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014924', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001410', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014925', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001411', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014930', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001412', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014936', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001413', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014937', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001414', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014939', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001415', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014940', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001416', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014944', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001417', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014945', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001418', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014951', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001419', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014953', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001420', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014961', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001421', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014966', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001422', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014970', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001423', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014971', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001424', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014972', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001425', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014976', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001426', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014977', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001427', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014978', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001428', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014980', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001429', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014982', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001430', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014983', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001431', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014984', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001432', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014985', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001433', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014989', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001434', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014992', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001435', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014993', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001436', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014994', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001437', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014997', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001438', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014998', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001439', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015076', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001440', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015082', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001441', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015085', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001442', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015089', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001443', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015091', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001444', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015094', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001445', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015095', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001446', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015099', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001447', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015101', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001448', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015103', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001449', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015105', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001450', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015106', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001451', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015107', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001452', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015111', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001453', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015113', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001454', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015116', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001455', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015118', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001456', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015119', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001457', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015120', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001458', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015121', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001459', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015123', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001460', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015124', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001461', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015125', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001462', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015126', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001463', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015128', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001464', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015131', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001465', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015137', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001466', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015138', 'DT2023-00000493', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001467', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014899', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001468', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014932', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001469', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014950', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001470', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014952', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001471', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014954', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001472', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014955', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001473', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014956', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001474', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014957', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001475', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014958', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001476', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014959', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001477', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014960', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001478', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014962', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001479', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014963', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001480', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014964', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001481', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014965', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001482', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014967', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001483', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014968', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000001484', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014969', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001485', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014973', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001486', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014974', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001487', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014975', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001488', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014979', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001489', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014981', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001490', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014986', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001491', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014987', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001492', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014988', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001493', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014990', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001494', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014991', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001495', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014995', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001496', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014996', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001497', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0014999', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001498', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015074', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001499', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015077', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001500', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015078', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001501', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015079', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001502', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015080', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001503', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015081', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001504', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015083', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001505', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015084', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001506', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015086', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001507', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015087', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001508', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015088', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001509', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015090', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001510', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015092', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001511', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015093', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001512', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015096', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001513', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015097', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001514', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015098', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001515', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015100', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001516', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015102', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001517', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015104', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001518', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015108', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001519', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015109', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001520', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015110', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001521', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015112', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001522', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015114', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001523', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015115', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001524', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015117', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001525', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015122', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001526', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015127', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001527', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015129', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001528', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015130', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001529', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015132', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001530', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015133', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001531', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015134', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001532', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015135', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001533', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015136', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001534', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015139', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001535', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015140', 'DT2023-00000494', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001536', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015000', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001537', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015001', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001538', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015002', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001539', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015003', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001540', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015004', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001541', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015005', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001542', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015007', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001543', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015008', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001544', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015009', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001545', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015011', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001546', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015012', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001547', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015014', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001548', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015015', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001549', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015017', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001550', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015018', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001551', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015019', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001552', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015020', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001553', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015021', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001554', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015024', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001555', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015025', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001556', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015026', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001557', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015028', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001558', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015031', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001559', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015033', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001560', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015035', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001561', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015036', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001562', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015037', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001563', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015038', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001564', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015039', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001565', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015041', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001566', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015042', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001567', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015044', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001568', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015046', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001569', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015047', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001570', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015048', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001571', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015050', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001572', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015051', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001573', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015052', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001574', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015054', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001575', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015055', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001576', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015057', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001577', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015058', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001578', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015059', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001579', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015060', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001580', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015062', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001581', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015064', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001582', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015067', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001583', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016374', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001584', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016417', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001585', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016927', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001586', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016928', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001587', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016929', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001588', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016930', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001589', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016931', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001590', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016932', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001591', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016934', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001592', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016935', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001593', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016936', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001594', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016937', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001595', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016938', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001596', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016940', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001597', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016942', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001598', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016943', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001599', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016944', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001600', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016946', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001601', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016947', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001602', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016948', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001603', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016950', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001604', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016952', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001605', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016953', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001606', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016954', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001607', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016955', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001608', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016958', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001609', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016959', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001610', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016960', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001611', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016961', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001612', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016962', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001613', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016963', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001614', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016964', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001615', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016968', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001616', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016969', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001617', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016971', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001618', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016972', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001619', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016974', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001620', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016976', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001621', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016978', 'DT2023-00000495', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001622', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015040', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001623', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015045', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001624', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015049', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001625', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016370', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001626', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016371', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001627', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016372', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001628', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016373', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001629', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016375', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001630', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016376', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001631', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016377', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001632', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016378', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001633', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016379', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001634', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016380', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001635', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016381', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001636', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016382', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001637', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016383', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001638', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016384', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001639', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016385', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001640', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016386', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001641', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016387', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001642', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016388', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001643', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016389', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001644', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016390', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001645', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016391', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001646', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016392', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001647', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016393', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001648', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016394', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001649', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016395', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001650', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016396', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001651', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016397', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001652', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016398', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001653', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016399', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001654', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016400', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001655', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016401', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001656', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016402', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001657', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016403', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001658', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016404', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001659', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016405', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001660', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016406', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001661', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016407', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001662', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016408', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001663', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016410', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001664', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016411', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001665', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016412', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001666', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016413', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001667', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016414', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001668', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016415', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001669', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016416', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001670', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016418', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001671', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016933', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001672', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016939', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001673', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016941', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001674', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016945', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001675', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016949', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001676', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016951', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001677', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016956', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001678', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016957', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001679', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016965', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001680', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016966', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001681', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016967', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001682', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016970', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001683', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016973', 'DT2023-00000496', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001684', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015238', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001685', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015239', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001686', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015240', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001687', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015241', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001688', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015242', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001689', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015243', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001690', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015244', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001691', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015245', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001692', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015246', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001693', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015247', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001694', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015248', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001695', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015249', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001696', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015250', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001697', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015251', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001698', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015252', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001699', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015253', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001700', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015254', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001701', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015255', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001702', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015256', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001703', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015257', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001704', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015258', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001705', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015259', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001706', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015260', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001707', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015261', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001708', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015262', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001709', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015263', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001710', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015264', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001711', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015265', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001712', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015266', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001713', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015267', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001714', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015268', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001715', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015269', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001716', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015270', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001717', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015271', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001718', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015272', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001719', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015273', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001720', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015274', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001721', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015275', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001722', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015276', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001723', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015277', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001724', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015278', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001725', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015279', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001726', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015280', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001727', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015281', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001728', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015282', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001729', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015283', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001730', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015284', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001731', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015285', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000001732', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015286', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001733', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015287', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001734', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015288', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001735', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015289', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001736', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015290', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001737', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015291', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001738', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015292', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001739', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015293', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001740', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015294', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001741', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015295', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001742', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015296', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001743', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015297', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001744', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015353', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001745', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015379', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001746', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015383', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001747', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015527', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001748', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015528', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001749', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015529', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001750', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015530', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001751', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015531', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001752', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015532', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001753', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015533', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001754', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015534', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001755', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015535', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001756', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015536', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001757', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015537', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001758', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015538', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001759', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015539', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001760', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015540', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001761', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015541', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001762', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015542', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001763', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015543', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001764', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015544', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001765', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015545', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001766', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015546', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001767', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015547', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001768', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015548', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001769', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015549', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001770', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015550', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001771', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015551', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001772', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015552', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001773', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015553', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001774', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015554', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001775', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015555', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001776', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015556', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001777', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015557', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001778', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015558', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001779', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015559', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001780', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015560', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001781', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015561', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001782', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015562', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001783', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015563', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001784', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015564', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001785', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015565', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001786', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015566', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001787', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015567', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001788', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015568', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001789', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015571', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001790', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015710', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001791', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015711', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001792', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015712', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001793', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015713', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001794', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015714', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001795', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015716', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001796', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015717', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001797', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015718', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001798', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015722', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001799', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015724', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001800', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015726', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001801', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015728', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001802', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015729', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001803', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015730', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001804', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015732', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001805', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015733', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001806', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015735', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001807', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015736', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001808', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015737', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001809', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015738', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001810', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015739', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001811', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015740', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001812', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015742', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001813', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015743', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001814', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015744', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001815', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015747', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001816', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015749', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001817', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015750', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001818', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015752', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001819', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015753', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001820', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015756', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001821', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015758', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001822', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015759', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001823', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015761', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001824', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015762', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001825', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015810', 'DT2023-00000497', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001826', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015298', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001827', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015299', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001828', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015300', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001829', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015301', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001830', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015302', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001831', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015303', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001832', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015304', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001833', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015305', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001834', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015306', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001835', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015307', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001836', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015308', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001837', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015309', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001838', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015310', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001839', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015311', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001840', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015312', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001841', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015313', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001842', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015314', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001843', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015315', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001844', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015316', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001845', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015317', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001846', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015318', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001847', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015319', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001848', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015320', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001849', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015321', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001850', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015322', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001851', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015323', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001852', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015324', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001853', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015326', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001854', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015421', 'DT2023-00000498', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001855', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015325', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001856', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015432', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001857', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015435', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001858', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015441', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001859', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015451', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001860', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015459', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001861', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015460', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001862', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015463', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001863', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015465', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001864', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015468', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001865', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015476', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001866', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015477', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001867', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015572', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001868', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015573', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001869', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015574', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001870', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015575', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001871', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015576', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001872', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015577', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001873', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015578', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001874', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015579', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001875', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015580', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001876', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015581', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001877', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015582', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001878', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015583', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001879', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015584', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001880', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015585', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001881', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015586', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001882', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015587', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001883', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015588', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001884', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015589', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001885', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015590', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001886', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015591', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001887', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015592', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001888', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015593', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001889', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015594', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001890', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015595', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001891', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015596', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001892', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015597', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001893', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015598', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001894', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015599', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001895', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015600', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001896', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015602', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001897', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015603', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001898', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015604', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001899', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015605', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001900', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015606', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001901', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015607', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001902', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015608', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001903', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015610', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001904', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015611', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001905', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015612', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001906', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015613', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001907', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015614', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001908', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015615', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001909', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015617', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001910', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015618', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001911', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015619', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001912', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015620', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001913', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015621', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001914', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015622', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001915', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015623', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001916', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015624', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001917', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015625', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001918', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015626', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001919', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015627', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001920', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015629', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001921', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015630', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001922', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015631', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001923', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015632', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001924', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015635', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001925', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015637', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001926', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015638', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001927', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015639', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001928', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015640', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001929', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015641', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001930', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015642', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001931', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015643', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001932', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015644', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001933', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015645', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001934', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015646', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001935', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015650', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001936', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015651', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001937', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015652', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001938', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015653', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001939', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015654', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001940', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015656', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001941', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015657', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001942', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015658', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001943', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015660', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001944', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015661', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001945', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015662', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001946', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016774', 'DT2023-00000499', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001947', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015327', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001948', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015328', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001949', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015329', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001950', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015330', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001951', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015331', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001952', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015332', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001953', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015333', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001954', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015334', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001955', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015335', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001956', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015336', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001957', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015337', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001958', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015338', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001959', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015339', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001960', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015340', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001961', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015341', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001962', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015342', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001963', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015343', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001964', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015344', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001965', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015345', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001966', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015346', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001967', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015347', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001968', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015348', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001969', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015349', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001970', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015350', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001971', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015352', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001972', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015354', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001973', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015356', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001974', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015357', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001975', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015358', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001976', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015359', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001977', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015360', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001978', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015361', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001979', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015362', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000001980', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015363', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001981', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015364', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001982', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015365', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001983', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015366', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001984', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015367', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001985', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015368', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001986', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015369', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001987', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015370', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001988', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015371', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001989', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015372', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001990', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015373', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001991', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015374', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001992', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015375', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001993', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015377', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001994', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015378', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001995', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015380', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001996', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015381', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001997', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015382', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001998', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015384', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000001999', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015385', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002000', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015386', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002001', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015387', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002002', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015569', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002003', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015705', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002004', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015706', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002005', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015707', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002006', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015708', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002007', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015709', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002008', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015715', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002009', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015719', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002010', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015720', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002011', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015721', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002012', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015723', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002013', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015725', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002014', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015727', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002015', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015731', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002016', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015734', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002017', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015741', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002018', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015745', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002019', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015746', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002020', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015748', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002021', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015751', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002022', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015754', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002023', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015755', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002024', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015757', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002025', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015760', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002026', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016419', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002027', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016449', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002028', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015351', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002029', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015376', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002030', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015423', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002031', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015424', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002032', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015425', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002033', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015426', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002034', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015427', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002035', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015428', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002036', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015429', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002037', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015430', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002038', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015431', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002039', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015433', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002040', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015434', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002041', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015436', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002042', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015437', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002043', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015438', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002044', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015439', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002045', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015440', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002046', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015442', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002047', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015443', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002048', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015444', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002049', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015445', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002050', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015446', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002051', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015447', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002052', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015448', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002053', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015449', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002054', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015450', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002055', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015452', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002056', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015453', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002057', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015454', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002058', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015455', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002059', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015456', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002060', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015457', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002061', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015458', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002062', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015461', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002063', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015462', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002064', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015464', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002065', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015466', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002066', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015467', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002067', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015469', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002068', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015470', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002069', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015471', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002070', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015472', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002071', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015473', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002072', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015474', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002073', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015475', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002074', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015478', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002075', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015479', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002076', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015480', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002077', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015601', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002078', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015609', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002079', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015616', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002080', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015628', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002081', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015633', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002082', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015634', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002083', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015636', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002084', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015647', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002085', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015648', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002086', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015649', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002087', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015655', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002088', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015659', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002089', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016778', 'DT2023-00000501', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002090', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015355', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002091', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016421', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002092', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016422', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002093', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016423', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002094', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016425', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002095', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016426', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002096', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016428', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:01', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002097', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016430', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002098', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016432', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002099', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016434', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002100', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016435', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002101', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016437', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002102', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016438', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002103', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016440', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002104', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016441', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002105', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016442', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002106', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016443', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002107', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016444', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002108', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016445', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002109', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016446', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002110', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016448', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002111', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016450', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002112', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016452', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002113', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016453', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002114', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016454', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002115', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016455', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002116', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016456', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002117', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016459', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002118', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016460', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002119', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016461', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002120', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016462', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002121', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016464', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002122', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016465', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002123', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016466', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002124', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016468', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002125', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016470', 'DT2023-00000502', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002126', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015388', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002127', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015389', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002128', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015390', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002129', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015391', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002130', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015392', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002131', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015393', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002132', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015394', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002133', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015395', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002134', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015396', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002135', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015397', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002136', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015398', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002137', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015399', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002138', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015400', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002139', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015401', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002140', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015402', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002141', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015403', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002142', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015404', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002143', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015405', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002144', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015406', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002145', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015407', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002146', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015408', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002147', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015409', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002148', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015410', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002149', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015411', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002150', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015412', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002151', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015413', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002152', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015414', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002153', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015415', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002154', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015416', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002155', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015417', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002156', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015418', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002157', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015419', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002158', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015420', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002159', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015422', 'DT2023-00000503', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002160', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015481', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002161', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015482', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002162', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015483', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002163', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015484', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002164', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015485', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002165', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015486', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002166', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015487', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002167', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015488', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002168', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015489', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002169', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015490', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002170', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015491', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002171', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015492', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002172', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015493', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002173', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015494', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002174', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015495', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002175', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015496', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002176', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015497', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002177', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015498', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002178', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015499', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002179', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015500', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002180', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015501', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002181', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015502', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002182', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015503', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002183', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015504', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002184', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015505', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002185', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015506', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002186', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015507', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002187', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015508', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002188', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015509', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002189', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015510', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002190', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015511', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002191', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015512', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002192', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015513', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002193', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015514', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002194', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015515', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002195', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015516', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002196', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015517', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002197', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015518', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002198', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015519', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002199', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015520', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002200', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015521', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002201', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015522', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002202', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015523', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002203', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015524', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002204', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015525', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002205', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015526', 'DT2023-00000504', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002206', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015570', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002207', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015763', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002208', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015764', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002209', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015765', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002210', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015766', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002211', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015767', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002212', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015768', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002213', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015769', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002214', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015770', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002215', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015771', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002216', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015772', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002217', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015773', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002218', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015774', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002219', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015775', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002220', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015776', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002221', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015777', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002222', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015778', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002223', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015779', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002224', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015780', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002225', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015781', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002226', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015782', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002227', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015783', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000002228', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015784', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002229', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015785', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002230', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015786', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002231', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015787', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002232', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015788', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002233', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015789', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002234', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015790', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002235', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015791', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002236', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015792', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002237', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015793', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002238', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015794', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002239', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015795', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002240', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015796', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002241', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015797', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002242', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015798', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002243', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015799', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002244', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015800', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002245', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015801', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002246', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015802', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002247', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015803', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002248', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015804', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002249', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015805', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002250', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015806', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002251', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015807', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002252', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015808', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002253', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015809', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002254', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015811', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002255', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015812', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002256', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015813', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002257', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015814', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002258', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015815', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002259', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015816', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002260', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015817', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002261', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015818', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002262', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015819', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002263', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016458', 'DT2023-00000505', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002264', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015820', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002265', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015821', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002266', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015822', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002267', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015823', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002268', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015824', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002269', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015825', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002270', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015826', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002271', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015827', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002272', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015828', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002273', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015829', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002274', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015830', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002275', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015831', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002276', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015832', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002277', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015833', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002278', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015834', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002279', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015835', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002280', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015836', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002281', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015837', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002282', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015838', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002283', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015839', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002284', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015840', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002285', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015841', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002286', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015842', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002287', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015843', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002288', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015844', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002289', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015845', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002290', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015846', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002291', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015847', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002292', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015848', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002293', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015849', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002294', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015850', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002295', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015851', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002296', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015852', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002297', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015853', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002298', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015854', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002299', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015855', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002300', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015856', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002301', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015857', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002302', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015858', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002303', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015859', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002304', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015860', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002305', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015861', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002306', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015862', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002307', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015863', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002308', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015864', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002309', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015865', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002310', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015866', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002311', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015867', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002312', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015868', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002313', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015869', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002314', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015870', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002315', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015871', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002316', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015872', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002317', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015873', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002318', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015874', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002319', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015875', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002320', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015876', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002321', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015877', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002322', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015878', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002323', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015879', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002324', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015880', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002325', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015881', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002326', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015882', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002327', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015883', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002328', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015884', 'DT2023-00000506', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002329', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015885', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002330', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015886', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002331', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015887', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002332', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015888', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002333', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015889', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002334', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015890', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002335', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015891', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002336', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015892', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002337', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015893', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002338', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015894', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002339', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015895', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002340', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015896', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002341', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015897', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002342', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015898', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002343', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015899', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002344', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015900', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002345', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015901', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002346', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015902', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002347', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015903', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002348', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015904', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002349', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015905', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002350', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015906', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002351', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015907', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002352', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015908', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002353', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015909', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002354', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015910', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002355', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015911', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002356', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015912', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002357', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015913', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002358', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015914', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002359', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015915', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002360', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015917', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002361', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015918', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002362', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015919', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002363', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016042', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002364', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016074', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002365', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016091', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002366', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016095', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002367', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016096', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002368', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016097', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002369', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016098', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002370', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016099', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002371', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016100', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002372', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016101', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002373', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016102', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002374', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016103', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002375', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016104', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002376', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016105', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002377', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016106', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002378', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016107', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002379', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016108', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002380', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016109', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002381', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016110', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002382', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016111', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002383', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016112', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002384', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016113', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002385', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016114', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002386', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016115', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002387', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016116', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002388', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016117', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002389', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016118', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002390', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016119', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002391', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016120', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002392', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016121', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002393', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016122', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002394', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016123', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002395', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016124', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002396', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016447', 'DT2023-00000507', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002397', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015916', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002398', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016034', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002399', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016035', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002400', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016036', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002401', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016037', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002402', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016038', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002403', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016039', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002404', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016040', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002405', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016041', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002406', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016043', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002407', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016044', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002408', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016045', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002409', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016046', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002410', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016047', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002411', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016048', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002412', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016049', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002413', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016050', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002414', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016051', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002415', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016052', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002416', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016053', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002417', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016054', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002418', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016055', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002419', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016056', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002420', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016057', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002421', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016058', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002422', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016059', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002423', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016060', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002424', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016061', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002425', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016062', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002426', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016063', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002427', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016064', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002428', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016065', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002429', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016066', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002430', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016067', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002431', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016068', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002432', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016069', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002433', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016070', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002434', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016071', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002435', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016072', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002436', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016073', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002437', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016075', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002438', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016076', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002439', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016077', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002440', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016078', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002441', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016079', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002442', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016080', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002443', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016081', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002444', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016082', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002445', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016083', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002446', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016084', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002447', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016085', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002448', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016086', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002449', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016087', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002450', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016088', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002451', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016089', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002452', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016090', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002453', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016092', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002454', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016093', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002455', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016094', 'DT2023-00000508', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002456', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015920', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002457', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015923', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002458', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015929', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002459', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015931', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002460', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015933', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002461', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015935', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002462', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015940', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002463', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015943', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002464', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015944', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002465', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015946', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002466', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015947', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002467', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015950', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002468', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015953', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002469', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015957', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002470', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015958', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002471', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015959', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002472', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015967', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002473', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015970', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002474', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015971', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002475', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015973', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000002476', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015979', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002477', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015982', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002478', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016244', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002479', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016245', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002480', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016246', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002481', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016247', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002482', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016248', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002483', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016249', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002484', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016250', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002485', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016251', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002486', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016252', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002487', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016253', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002488', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016254', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002489', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016255', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002490', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016256', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002491', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016257', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002492', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016258', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002493', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016259', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002494', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016260', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002495', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016261', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002496', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016262', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002497', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016263', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002498', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016264', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002499', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016265', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002500', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016266', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002501', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016267', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002502', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016268', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002503', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016269', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002504', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016270', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002505', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016271', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002506', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016272', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002507', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016273', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002508', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016274', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002509', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016275', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002510', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016276', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002511', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016277', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002512', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016278', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002513', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016279', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002514', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016280', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002515', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016281', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002516', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016282', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002517', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016283', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002518', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016284', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002519', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016285', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002520', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016286', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002521', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016287', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002522', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016288', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002523', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016289', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002524', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016290', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002525', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016291', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002526', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016292', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002527', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016293', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002528', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016294', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002529', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016295', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002530', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016296', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002531', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016297', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002532', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016298', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002533', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016299', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002534', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016300', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002535', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016301', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002536', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016302', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002537', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016303', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002538', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016304', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002539', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016305', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002540', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016306', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002541', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016307', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002542', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016308', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002543', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016309', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002544', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016310', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002545', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016311', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002546', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016359', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002547', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016369', 'DT2023-00000509', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002548', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015921', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002549', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015922', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002550', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015924', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002551', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015925', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002552', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015926', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002553', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015927', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002554', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015928', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002555', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015930', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002556', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015932', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002557', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015934', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002558', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015936', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002559', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015937', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002560', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015938', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002561', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015939', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002562', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015941', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002563', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015942', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002564', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015945', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002565', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015948', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002566', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015949', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002567', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015951', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002568', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015952', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002569', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015954', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002570', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015955', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002571', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015956', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002572', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015960', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002573', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015961', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002574', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015962', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002575', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015963', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002576', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015964', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002577', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015965', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002578', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015966', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002579', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015968', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002580', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015969', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002581', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015972', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002582', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015974', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002583', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015975', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002584', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015976', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002585', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015977', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002586', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015978', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002587', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015980', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002588', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015981', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002589', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016165', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002590', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016166', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002591', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016167', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002592', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016168', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002593', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016169', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002594', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016170', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002595', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016171', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002596', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016172', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002597', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016173', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002598', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016174', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002599', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016175', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002600', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016176', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002601', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016177', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002602', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016178', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002603', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016179', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002604', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016180', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002605', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016181', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002606', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016182', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002607', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016183', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002608', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016184', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002609', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016185', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002610', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016186', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002611', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016187', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002612', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016188', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002613', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016189', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002614', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016190', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:02', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002615', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016191', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002616', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016192', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002617', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016193', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002618', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016194', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002619', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016195', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002620', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016196', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002621', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016197', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002622', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016198', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002623', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016199', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002624', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016200', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002625', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016201', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002626', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016202', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002627', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016203', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002628', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016204', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002629', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016205', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002630', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016206', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002631', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016207', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002632', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016208', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002633', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016209', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002634', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016210', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002635', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016211', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002636', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016212', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002637', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016213', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002638', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016214', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002639', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016215', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002640', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016216', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002641', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016217', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002642', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016218', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002643', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016219', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002644', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016220', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002645', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016221', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002646', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016222', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002647', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016223', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002648', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016224', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002649', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016225', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002650', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016226', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002651', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016227', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002652', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016228', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002653', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016229', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002654', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016230', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002655', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016231', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002656', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016232', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002657', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016233', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002658', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016234', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002659', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016235', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002660', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016236', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002661', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016237', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002662', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016238', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002663', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016239', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002664', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016240', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002665', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016241', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002666', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016242', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002667', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016243', 'DT2023-00000510', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002668', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015983', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002669', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015984', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002670', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015985', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002671', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015986', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002672', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015987', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002673', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015988', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002674', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015989', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002675', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015990', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002676', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015991', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002677', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015992', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002678', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015993', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002679', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015994', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002680', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015995', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002681', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015996', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002682', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015997', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002683', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015998', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002684', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0015999', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002685', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016000', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002686', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016001', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002687', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016002', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002688', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016003', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002689', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016004', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002690', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016005', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002691', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016006', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002692', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016007', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002693', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016008', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002694', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016009', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002695', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016010', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002696', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016011', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002697', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016012', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002698', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016013', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002699', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016014', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002700', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016015', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002701', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016016', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002702', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016017', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002703', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016018', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002704', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016019', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002705', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016020', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002706', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016021', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002707', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016022', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002708', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016023', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002709', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016024', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002710', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016025', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002711', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016026', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002712', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016027', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002713', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016028', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002714', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016029', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002715', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016030', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002716', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016031', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002717', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016032', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002718', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016033', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002719', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016130', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002720', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016134', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002721', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016140', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002722', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016141', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002723', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016144', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000002724', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016149', 'DT2023-00000511', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002725', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016125', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002726', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016126', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002727', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016127', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002728', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016128', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002729', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016129', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002730', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016131', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002731', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016132', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002732', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016133', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002733', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016135', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002734', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016136', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002735', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016137', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002736', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016138', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002737', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016139', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002738', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016142', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002739', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016143', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002740', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016145', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002741', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016146', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002742', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016147', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002743', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016148', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002744', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016150', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002745', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016151', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002746', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016152', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002747', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016153', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002748', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016154', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002749', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016155', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002750', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016156', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002751', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016157', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002752', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016158', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002753', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016159', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002754', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016160', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002755', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016161', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002756', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016162', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002757', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016163', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002758', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016164', 'DT2023-00000512', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002759', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016312', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002760', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016313', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002761', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016314', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002762', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016315', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002763', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016316', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002764', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016317', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002765', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016318', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002766', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016319', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002767', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016320', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002768', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016321', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002769', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016322', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002770', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016323', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002771', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016324', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002772', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016325', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002773', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016326', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002774', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016327', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002775', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016328', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002776', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016329', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002777', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016330', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002778', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016331', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002779', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016332', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002780', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016333', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002781', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016334', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002782', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016335', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002783', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016336', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002784', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016337', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002785', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016338', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002786', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016339', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002787', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016340', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002788', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016341', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002789', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016342', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002790', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016343', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002791', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016344', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002792', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016345', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002793', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016346', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002794', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016347', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002795', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016348', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002796', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016349', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002797', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016350', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002798', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016351', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002799', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016352', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002800', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016353', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002801', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016354', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002802', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016355', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002803', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016356', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002804', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016357', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002805', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016358', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002806', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016360', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002807', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016361', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002808', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016362', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002809', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016363', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002810', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016364', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002811', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016365', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002812', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016366', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002813', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016367', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002814', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016368', 'DT2023-00000513', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002815', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016409', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002816', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016856', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002817', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016858', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002818', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016860', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002819', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016861', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002820', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016864', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002821', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016866', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002822', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016867', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002823', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016873', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002824', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016874', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002825', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016876', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002826', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016881', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002827', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016884', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002828', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016889', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002829', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016890', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002830', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016892', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002831', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016893', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002832', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016894', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002833', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016896', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002834', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016897', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002835', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016898', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002836', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016899', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002837', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016900', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002838', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016904', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002839', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016905', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002840', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016907', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002841', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016909', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002842', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016910', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002843', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016923', 'DT2023-00000514', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002844', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016420', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002845', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016424', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002846', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016427', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002847', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016429', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002848', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016431', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002849', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016433', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002850', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016436', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002851', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016439', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002852', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016457', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002853', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016469', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002854', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016719', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002855', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016721', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002856', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016725', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002857', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016729', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002858', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016730', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002859', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016731', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002860', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016733', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002861', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016734', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002862', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016736', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002863', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016737', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002864', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016740', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002865', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016742', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002866', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016743', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002867', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016744', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002868', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016745', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002869', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016746', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002870', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016748', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002871', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016749', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002872', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016750', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002873', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016751', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002874', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016752', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002875', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016755', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002876', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016756', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002877', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016757', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002878', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016759', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002879', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016760', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002880', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016763', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002881', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016767', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002882', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016768', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002883', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016769', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002884', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016770', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002885', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016771', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002886', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016772', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002887', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016773', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002888', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016775', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002889', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016776', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002890', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016857', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002891', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016859', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002892', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016862', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002893', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016863', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002894', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016865', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002895', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016868', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002896', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016869', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002897', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016870', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002898', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016871', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002899', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016872', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002900', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016875', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002901', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016877', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002902', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016878', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002903', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016879', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002904', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016880', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002905', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016882', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002906', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016883', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002907', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016885', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002908', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016886', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002909', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016887', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002910', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016888', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002911', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016895', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002912', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016901', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002913', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016902', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002914', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016903', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002915', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016906', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002916', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016908', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002917', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016911', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002918', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016912', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002919', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016913', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002920', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016914', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002921', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016915', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002922', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016916', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002923', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016917', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002924', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016918', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002925', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016919', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002926', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016920', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002927', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016921', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002928', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016922', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002929', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016924', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002930', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016925', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002931', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016926', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002932', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016977', 'DT2023-00000515', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002933', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016451', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002934', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016463', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002935', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016467', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002936', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016667', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002937', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016669', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002938', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016670', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002939', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016671', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002940', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016672', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002941', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016673', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002942', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016674', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002943', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016675', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002944', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016676', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002945', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016677', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002946', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016678', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002947', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016679', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002948', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016680', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002949', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016681', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002950', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016682', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002951', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016683', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002952', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016684', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002953', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016685', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002954', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016686', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002955', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016687', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002956', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016688', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002957', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016689', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002958', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016690', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002959', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016691', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002960', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016692', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002961', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016693', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002962', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016694', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002963', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016695', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002964', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016696', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002965', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016697', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002966', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016698', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002967', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016699', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002968', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016700', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002969', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016701', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002970', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016702', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002971', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016703', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000002972', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016704', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002973', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016705', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002974', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016706', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002975', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016707', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002976', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016708', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002977', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016709', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002978', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016710', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002979', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016711', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002980', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016712', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002981', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016713', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002982', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016714', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002983', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016715', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002984', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016716', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002985', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016717', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002986', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016718', 'DT2023-00000516', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002987', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016471', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002988', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016473', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002989', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016474', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002990', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016479', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002991', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016480', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002992', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016482', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002993', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016484', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002994', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016485', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002995', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016487', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002996', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016488', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002997', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016490', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002998', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016497', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000002999', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016499', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003000', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016500', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003001', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016502', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003002', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016503', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003003', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016504', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003004', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016505', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003005', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016506', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003006', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016507', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003007', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016510', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003008', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016511', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003009', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016512', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003010', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016514', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003011', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016520', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003012', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016521', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003013', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016522', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003014', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016626', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003015', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016627', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003016', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016630', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003017', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016632', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003018', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016633', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003019', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016634', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003020', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016635', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003021', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016636', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003022', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016637', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003023', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016639', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003024', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016642', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003025', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016643', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003026', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016645', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003027', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016647', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003028', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016649', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003029', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016655', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003030', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016656', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003031', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016657', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003032', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016658', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003033', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016661', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003034', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016662', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003035', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016665', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003036', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016779', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003037', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016780', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003038', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016781', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003039', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016782', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003040', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016784', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003041', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016785', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003042', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016787', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003043', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016788', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003044', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016791', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003045', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016793', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003046', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016794', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003047', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016795', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003048', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016796', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003049', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016797', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003050', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016798', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003051', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016799', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003052', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016800', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003053', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016801', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003054', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016802', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003055', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016803', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003056', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016806', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003057', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016807', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003058', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016808', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003059', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016809', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003060', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016810', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003061', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016811', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003062', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016813', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003063', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016814', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003064', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016818', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003065', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016821', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003066', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016824', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003067', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016825', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003068', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016827', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003069', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016828', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003070', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016830', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003071', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016831', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003072', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016833', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003073', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016834', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003074', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016837', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003075', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016838', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003076', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016839', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003077', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016841', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003078', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016843', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003079', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016844', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003080', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016845', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003081', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016846', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003082', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016847', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003083', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016852', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003084', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016853', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003085', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016854', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003086', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016855', 'DT2023-00000517', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003087', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016472', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003088', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016481', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003089', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016491', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003090', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016493', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003091', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016494', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003092', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016495', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003093', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016496', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003094', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016498', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003095', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016501', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003096', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016513', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003097', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016515', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003098', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016516', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003099', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016518', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003100', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016519', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003101', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016523', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003102', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016524', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003103', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016525', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003104', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016526', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003105', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016528', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003106', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016529', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003107', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016530', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003108', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016531', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003109', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016532', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003110', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016533', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003111', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016534', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003112', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016535', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003113', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016536', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003114', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016538', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003115', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016539', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003116', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016540', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003117', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016541', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003118', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016542', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003119', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016543', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003120', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016544', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003121', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016545', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003122', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016546', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003123', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016547', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003124', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016548', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003125', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016549', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003126', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016550', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003127', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016551', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003128', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016552', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003129', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016553', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003130', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016554', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003131', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016555', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003132', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016556', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003133', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016558', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003134', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016559', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003135', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016560', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003136', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016561', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003137', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016562', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003138', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016563', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003139', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016564', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003140', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016565', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003141', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016566', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003142', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016567', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003143', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016568', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003144', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016569', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003145', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016570', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003146', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016574', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003147', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016577', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003148', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016580', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003149', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016583', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003150', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016584', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003151', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016585', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003152', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016586', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003153', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016587', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003154', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016588', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003155', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016589', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003156', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016591', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003157', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016593', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003158', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016595', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003159', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016597', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003160', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016599', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003161', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016600', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003162', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016601', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003163', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016602', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003164', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016605', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:03', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003165', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016607', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003166', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016610', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003167', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016611', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003168', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016615', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003169', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016616', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003170', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016619', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003171', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016620', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003172', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016628', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003173', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016629', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003174', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016631', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003175', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016640', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003176', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016644', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003177', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016646', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003178', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016651', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003179', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016659', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003180', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016666', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003181', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016668', 'DT2023-00000518', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003182', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016475', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003183', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016476', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003184', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016477', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003185', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016478', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003186', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016483', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003187', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016486', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003188', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016489', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003189', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016492', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003190', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016508', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003191', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016509', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003192', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016517', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003193', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016527', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003194', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016537', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003195', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016557', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003196', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016572', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003197', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016573', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003198', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016575', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003199', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016578', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003200', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016579', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003201', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016581', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003202', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016594', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003203', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016596', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003204', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016598', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003205', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016603', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003206', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016604', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003207', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016606', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003208', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016608', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003209', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016609', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003210', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016612', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003211', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016614', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003212', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016617', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003213', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016618', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003214', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016622', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003215', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016623', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003216', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016625', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003217', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016638', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003218', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016641', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003219', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016648', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_vendors_service_locations` (`DetailID`, `VendorID`, `ServiceBy`, `Latitude`, `Longitude`, `Raduis`, `PostalCodeID`, `DistrictID`, `StateID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSL2024-000000003220', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016650', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003221', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016652', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003222', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016653', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003223', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016654', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003224', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016660', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003225', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016663', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003226', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016664', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003227', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016783', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003228', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016786', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003229', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016789', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003230', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016790', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003231', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016792', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003232', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016804', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003233', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016805', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003234', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016812', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003235', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016815', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003236', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016816', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003237', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016817', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003238', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016819', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003239', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016820', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003240', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016822', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003241', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016823', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003242', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016826', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003243', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016829', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003244', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016832', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003245', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016835', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003246', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016836', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003247', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016840', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003248', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016842', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003249', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016848', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003250', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016849', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003251', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016850', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003252', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016851', 'DT2023-00000519', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003253', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016720', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003254', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016722', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003255', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016723', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003256', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016724', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003257', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016726', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003258', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016727', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003259', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016728', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003260', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016732', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003261', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016735', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003262', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016738', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003263', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016739', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003264', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016741', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003265', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016747', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003266', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016753', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003267', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016754', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003268', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016758', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003269', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016761', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003270', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016762', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003271', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016764', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003272', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016765', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003273', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016766', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003274', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016777', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003275', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0016891', 'DT2023-00000521', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003276', 'V2024-00000045', 'District', NULL, NULL, NULL, 'PC2023-0020390', 'DT2023-00000634', 'S2020-00000035', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSL2024-000000003278', 'V2324-00000046', 'District', NULL, NULL, NULL, NULL, 'DT2023-00000612', 'S2020-00000001', 0, '2024-02-22 10:28:19', '2024-02-22 10:28:19', NULL, NULL, NULL, NULL),
('VSL2024-000000003279', 'V2324-00000046', 'District', NULL, NULL, NULL, NULL, 'DT2023-00000613', 'S2020-00000001', 0, '2024-02-22 10:28:19', '2024-02-22 10:28:19', NULL, NULL, NULL, NULL),
('VSL2324-000000003277', 'V2024-00000044', 'PostalCode', NULL, NULL, NULL, 'PC2023-0015343', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-22 09:32:19', '2024-02-22 09:33:54', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003280', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014802', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003281', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014884', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003282', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014885', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003283', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014886', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003284', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014887', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003285', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014888', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003286', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014889', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003287', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014890', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003288', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014891', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003289', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014892', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003290', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014893', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003291', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014894', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003292', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014895', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003293', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014896', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003294', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014897', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003295', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014898', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003296', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014900', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003297', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014901', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003298', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014902', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003299', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014903', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003300', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014904', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003301', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014905', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003302', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014906', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003303', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014907', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003304', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014908', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003305', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014909', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003306', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014910', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003307', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014911', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003308', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014912', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003309', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014913', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003310', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014914', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003311', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014915', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003312', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014916', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003313', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014917', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003314', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014918', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003315', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014920', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003316', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014921', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003317', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014922', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003318', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014923', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003319', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014926', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003320', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014927', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003321', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014928', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003322', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014929', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003323', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014931', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003324', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014933', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003325', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014934', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003326', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014935', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003327', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014938', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003328', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014941', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003329', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014942', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003330', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014943', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003331', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014946', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003332', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014947', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003333', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014948', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003334', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0014949', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003335', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015075', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003336', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0020387', 'DT2023-00000490', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003337', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015327', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003338', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015328', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003339', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015329', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003340', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015330', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003341', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015331', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003342', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015332', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003343', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015333', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003344', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015334', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003345', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015335', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003346', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015336', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003347', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015337', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003348', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015338', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003349', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015339', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003350', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015340', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003351', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015341', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003352', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015342', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003353', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015343', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003354', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015344', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003355', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015345', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003356', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015346', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003357', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015347', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003358', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015348', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003359', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015349', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003360', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015350', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003361', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015352', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003362', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015354', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003363', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015356', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003364', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015357', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003365', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015358', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003366', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015359', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003367', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015360', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003368', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015361', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003369', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015362', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003370', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015363', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003371', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015364', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003372', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015365', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003373', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015366', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003374', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015367', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003375', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015368', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003376', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015369', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003377', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015370', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003378', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015371', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003379', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015372', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003380', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015373', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003381', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015374', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003382', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015375', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003383', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015377', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003384', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015378', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003385', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015380', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003386', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015381', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003387', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015382', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003388', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015384', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003389', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015385', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003390', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015386', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003391', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015387', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003392', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015569', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003393', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015705', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003394', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015706', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003395', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015707', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003396', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015708', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003397', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015709', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003398', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015715', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003399', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015719', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003400', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015720', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003401', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015721', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003402', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015723', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003403', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015725', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003404', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015727', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003405', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015731', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003406', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015734', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003407', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015741', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003408', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015745', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003409', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015746', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003410', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015748', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003411', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015751', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003412', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015754', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003413', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015755', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003414', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015757', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003415', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0015760', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003416', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0016419', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSL2324-000000003417', 'V2024-00000018', 'District', NULL, NULL, NULL, 'PC2023-0016449', 'DT2023-00000500', 'S2020-00000035', 0, '2024-02-23 07:09:30', '2024-02-23 07:09:30', NULL, 'U2023-0000001', 'U2023-0000001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_stock_point`
--

CREATE TABLE `tbl_vendors_stock_point` (
  `DetailID` varchar(50) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `UUID` varchar(100) DEFAULT NULL,
  `PointName` varchar(150) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PostalID` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_stock_point`
--

INSERT INTO `tbl_vendors_stock_point` (`DetailID`, `VendorID`, `UUID`, `PointName`, `Address`, `PostalID`, `CityID`, `TalukID`, `DistrictID`, `StateID`, `CountryID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VSP2024-00000001', 'V2024-00000018', 'I0680caed-47509e-02', 'Ukkadam', '123, Athupalam', 'PC2023-0015264', 'CI2023-0115282', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-08 06:57:45', '2024-02-10 05:21:45', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000002', 'V2024-00000018', 'I50eeb0b9-df8b88-06', 'Sundarapuram', '3, Near Kuruchi Kulam', 'PC2023-0015290', 'CI2023-0115361', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-08 06:57:45', '2024-02-10 05:21:45', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000003', 'V2024-00000018', 'I1286ab89-eabf77-0c', 'Kuniyamuthur Spot 1', 'near Police Station', 'PC2023-0015264', 'CI2023-0115287', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-08 06:57:45', '2024-02-10 05:21:45', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000004', 'V2024-00000020', 'Id8d18e1a-2bdf45-f8', 'Gandhima Nagar Point', '6, Aandal St,', 'PC2023-0015260', 'CI2023-0115343', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-12 07:50:18', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000005', 'V2024-00000020', 'I052813f0-96cf99-69', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-12 07:50:18', '2024-02-20 11:30:36', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000006', 'V2023-00000006', 'I0b7f104d-e97269-56', 'SaiBaba Colony Point', '45,New Building', 'PC2023-0015284', 'CI2023-0115358', 'T2023-00007978', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-17 12:00:31', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VSP2024-00000007', 'V2023-00000006', 'Ic4ddcbaa-faf91b-3d', 'Thudiyalur Point', '3, drome Land', 'PC2023-0015273', 'CI2023-0115308', 'T2023-00007978', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-17 12:00:31', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VSP2024-00000008', 'V2024-00000021', 'I6bae8481-c15ed2-0b', 'Market Area Point', '24-D, Old market road', 'PC2023-0015343', 'CI2023-0115859', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-23 03:14:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VSP2024-00000009', 'V2024-00000021', 'I108db8c6-ddff22-28', 'Bus Stand Point', 'Behind Bus Stand', 'PC2023-0015334', 'CI2023-0115685', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, '2024-01-23 03:14:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VSP2024-00000010', 'V2024-00000008', 'I02e9f8b9-b0b7db-dc', 'Point 1', '45, no', 'PC2023-0015242', 'CI2023-0115371', 'T2023-00007978', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-01 10:46:59', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000011', 'V2024-00000008', 'Ie4a87f11-d14263-8e', 'Point 2', '38 No', 'PC2023-0015241', 'CI2023-0115245', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-01 10:46:59', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VSP2024-00000020', '111', 'c2668dc35459', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-08 08:49:03', '2024-02-08 08:49:49', NULL, NULL, NULL, NULL),
('VSP2024-00000021', '111', 'Id8d18e1a-2bdf45-f8', 'Gandhima Nagar Point', '6, Aandal St,', 'PC2023-0015260', 'CI2023-0115343', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-08 08:49:03', '2024-02-08 08:49:49', NULL, NULL, NULL, NULL),
('VSP2024-00000022', '222', '5c9585c566a9', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 05:01:55', '2024-02-09 05:20:28', '2024-02-09 07:36:09', NULL, NULL, NULL),
('VSP2024-00000023', 'V2024-00000045', 'Id8d18e1a-2bdf45-f8', 'Gandhima Nagar Point', '6, Aandal St,', 'PC2023-0015260', 'CI2023-0115343', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-09 05:01:55', '2024-02-09 07:36:09', NULL, NULL, NULL, NULL),
('VSP2024-00000024', 'V2024-00000025', '563c75410b65', NULL, 'jcufhddhxh', '638501', 'CI2023-0115677', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 05:17:46', NULL, '2024-02-09 06:12:08', NULL, NULL, NULL),
('VSP2024-00000025', 'V2024-00000025', '8c96550ebb75', NULL, 'dtxhf', '638501', 'CI2023-0115677', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 05:19:29', NULL, '2024-02-09 06:12:08', NULL, NULL, NULL),
('VSP2024-00000026', 'V2024-00000025', 'bce65c9c9665', NULL, 'chfhfcj', '638455', 'CI2023-0115969', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 05:29:56', NULL, '2024-02-09 06:12:08', NULL, NULL, NULL),
('VSP2024-00000027', 'V2024-00000025', 'b5c697f51a56', NULL, 'firdt', '638501', 'CI2023-0115677', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-09 06:12:08', NULL, NULL, NULL, NULL, NULL),
('VSP2024-00000028', 'V2024-00000025', 'c5bb15686c2c', NULL, 'second', '638455', 'CI2023-0115969', 'T2023-00007995', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-09 06:12:08', NULL, NULL, NULL, NULL, NULL),
('VSP2024-00000029', '222', '5e6d563593cc', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 06:39:39', NULL, '2024-02-09 07:36:09', NULL, NULL, NULL),
('VSP2024-00000030', '222', '6a6357a5575c', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 1, '2024-02-09 07:25:42', NULL, '2024-02-09 07:36:09', NULL, NULL, NULL),
('VSP2024-00000031', '222', 'cd8c5e6257d5', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-09 07:36:09', NULL, NULL, NULL, NULL, NULL),
('VSP2024-00000032', 'V2024-00000044', 'b5b45bd607d4', 'Peelamedu Point', '34, Ganesh Layout', 'PC2023-0015260', 'CI2023-0115272', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSP2024-00000033', 'V2024-00000044', 'Id8d18e1a-2bdf45-f8', 'Gandhima Nagar Point', '6, Aandal St,', 'PC2023-0015260', 'CI2023-0115343', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL),
('VSP2024-00000034', 'V2024-00000045', '56505c70e646', NULL, 'abcd', 'PC2023-0015327', 'CI2023-0115816', 'T2023-00007996', 'DT2023-00000500', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-22 09:19:04', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VSP2024-00000035', 'V2324-00000046', 'ff8c67125cd6', NULL, 'ganapathy 1', 'PC2023-0015249', 'CI2023-0115392', 'T2023-00007979', 'DT2023-00000497', 'S2020-00000035', 'C2020-00000101', 0, '2024-02-22 10:28:19', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_supply`
--

CREATE TABLE `tbl_vendors_supply` (
  `DetailID` varchar(50) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `PCID` varchar(50) DEFAULT NULL,
  `PSCID` varchar(50) DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_supply`
--

INSERT INTO `tbl_vendors_supply` (`DetailID`, `VendorID`, `PCID`, `PSCID`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VS2024-00000002', 'V2024-00000008', 'PC2024-0000003', 'PSC2024-0000002', 1, '2024-01-03 11:59:32', NULL, '2024-02-01 10:40:40', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000003', 'V2024-00000008', 'PC2024-0000003', 'PSC2024-0000003', 1, '2024-01-03 11:59:32', NULL, '2024-02-01 10:40:40', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000004', 'V2024-00000008', 'PC2024-0000003', 'PSC2024-0000010', 1, '2024-01-03 11:59:32', NULL, '2024-02-01 10:40:40', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000005', 'V2024-00000008', 'PC2024-0000005', 'PSC2024-0000008', 1, '2024-01-03 11:59:32', NULL, '2024-02-01 10:40:40', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000006', 'V2024-00000008', 'PC2024-0000005', 'PSC2024-0000009', 1, '2024-01-03 11:59:32', NULL, '2024-02-01 10:40:40', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000024', 'V2023-00000006', 'PC2024-0000004', 'PSC2024-0000004', 1, '2024-01-12 09:42:46', NULL, '2024-02-09 09:36:16', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000025', 'V2023-00000006', 'PC2024-0000004', 'PSC2024-0000005', 1, '2024-01-12 09:42:46', NULL, '2024-02-09 09:36:16', 'U2023-0000001', NULL, 'U2023-0000001'),
('VS2024-00000026', 'V2023-00000001', 'PC2024-0000004', 'PSC2024-0000004', 0, '2024-01-17 12:15:29', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000027', 'V2023-00000001', 'PC2024-0000004', 'PSC2024-0000005', 0, '2024-01-17 12:15:29', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000028', 'V2023-00000001', 'PC2024-0000005', 'PSC2024-0000008', 0, '2024-01-17 12:15:29', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000029', 'V2023-00000001', 'PC2024-0000003', 'PSC2024-0000002', 0, '2024-01-17 12:15:29', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000030', 'V2023-00000001', 'PC2024-0000003', 'PSC2024-0000003', 0, '2024-01-17 12:15:29', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000048', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000018', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000049', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000019', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000050', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000020', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000051', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000021', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000052', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000022', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000053', 'V2024-00000008', 'PC2024-0000010', 'PSC2024-0000033', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000054', 'V2024-00000008', 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-01 10:40:40', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000071', 'V2023-00000006', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-09 09:36:16', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000072', 'V2023-00000006', 'PC2023-0000001', 'PSC2024-0000034', 0, '2024-02-09 09:36:16', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000073', 'V2023-00000006', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-09 09:36:16', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000074', 'V2023-00000006', 'PC2024-0000004', 'PSC2024-0000059', 0, '2024-02-09 09:36:16', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000075', 'V2023-00000006', 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-09 09:36:16', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000085', 'V2024-00000018', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-09 10:21:18', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000086', 'V2024-00000018', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-09 10:21:18', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000087', 'V2024-00000018', 'PC2024-0000004', 'PSC2024-0000059', 0, '2024-02-09 10:21:18', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000088', 'V2024-00000018', 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-09 10:21:18', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000089', 'V2024-00000020', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-09 10:22:04', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000090', 'V2024-00000020', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-09 10:22:04', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000091', 'V2024-00000020', 'PC2023-0000001', 'PSC2024-0000036', 0, '2024-02-09 10:22:04', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000092', 'V2024-00000020', 'PC2024-0000004', 'PSC2024-0000059', 0, '2024-02-09 10:22:04', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000093', 'V2024-00000020', 'PC2024-0000004', 'PSC2024-0000060', 0, '2024-02-09 10:22:04', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2024-00000100', 'V2024-00000044', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-22 09:09:53', '2024-02-22 09:09:53', NULL, NULL, NULL, NULL),
('VS2024-00000101', 'V2024-00000044', 'PC2024-0000003', 'PSC2024-0000002', 1, '2024-02-22 09:09:53', '2024-02-22 09:09:53', '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001'),
('VS2024-00000102', 'V2024-00000045', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000103', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000034', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000104', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000105', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000036', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000106', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000037', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000107', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000038', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000108', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000039', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000109', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000040', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000110', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000041', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000111', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000042', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000112', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000043', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000113', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000044', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000114', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000045', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000115', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000046', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000116', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000047', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000117', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000048', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000118', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000049', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000119', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000050', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000120', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000051', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000121', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000052', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000122', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000053', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000123', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000054', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000124', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000055', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000125', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000056', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000126', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000057', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000127', 'V2024-00000045', 'PC2023-0000001', 'PSC2024-0000080', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000128', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000012', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000129', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000013', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000130', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000058', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000131', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000062', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000132', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000063', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000133', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000064', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000134', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000065', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000135', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000066', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000136', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000067', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000137', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000068', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000138', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000069', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000139', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000070', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000140', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000071', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000141', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000072', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000142', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000073', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000143', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000074', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000144', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000075', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000145', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000076', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000146', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000077', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000147', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000078', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000148', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000079', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000149', 'V2024-00000045', 'PC2024-0000002', 'PSC2024-0000081', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000150', 'V2024-00000045', 'PC2024-0000002', 'PSC2324-0000083', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VS2024-00000159', 'V2324-00000046', 'PC2023-0000001', 'PSC2023-0000001', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2024-00000160', 'V2324-00000046', 'PC2023-0000001', 'PSC2024-0000034', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2024-00000161', 'V2324-00000046', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2024-00000162', 'V2324-00000046', 'PC2024-0000002', 'PSC2024-0000012', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2024-00000163', 'V2324-00000046', 'PC2024-0000002', 'PSC2024-0000013', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2024-00000164', 'V2324-00000046', 'PC2024-0000002', 'PSC2024-0000058', 0, '2024-02-22 10:28:18', '2024-02-22 10:28:18', NULL, NULL, NULL, NULL),
('VS2324-00000094', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000012', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000095', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000013', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000096', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000058', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000097', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000062', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000098', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000063', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000099', 'V2024-00000020', 'PC2024-0000002', 'PSC2024-0000081', 0, '2024-02-20 11:30:36', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000151', 'V2024-00000044', 'PC2024-0000002', 'PSC2024-0000012', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000152', 'V2024-00000044', 'PC2024-0000002', 'PSC2024-0000058', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000153', 'V2024-00000044', 'PC2023-0000001', 'PSC2024-0000035', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000154', 'V2024-00000044', 'PC2023-0000001', 'PSC2024-0000036', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000155', 'V2024-00000044', 'PC2023-0000001', 'PSC2024-0000042', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000156', 'V2024-00000044', 'PC2024-0000007', 'PSC2024-0000002', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000157', 'V2024-00000044', 'PC2024-0000007', 'PSC2024-0000003', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL),
('VS2324-00000158', 'V2024-00000044', 'PC2024-0000007', 'PSC2024-0000004', 0, '2024-02-22 09:33:54', NULL, NULL, 'U2023-0000001', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_vehicle`
--

CREATE TABLE `tbl_vendors_vehicle` (
  `VehicleID` varchar(50) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `UUID` varchar(100) DEFAULT NULL,
  `VNumber` varchar(50) DEFAULT NULL,
  `VType` varchar(50) DEFAULT NULL,
  `VBrand` varchar(50) DEFAULT NULL,
  `VModel` varchar(50) DEFAULT NULL,
  `VLength` varchar(50) DEFAULT NULL,
  `VDepth` varchar(50) DEFAULT NULL,
  `VWidth` varchar(50) DEFAULT NULL,
  `VCapacity` varchar(50) DEFAULT NULL,
  `DFlag` int(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_vehicle`
--

INSERT INTO `tbl_vendors_vehicle` (`VehicleID`, `VendorID`, `UUID`, `VNumber`, `VType`, `VBrand`, `VModel`, `VLength`, `VDepth`, `VWidth`, `VCapacity`, `DFlag`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `CreatedBy`, `UpdatedBy`, `DeletedBy`) VALUES
('VV2023-00000001', 'V2023-00000001', 'I9eb0a610-c9c7ff-4d', 'TN38AD3456', 'VT2023-00000001', 'VB2023-00000001', '', '4', '1', '2', '1000', 0, '2023-12-28 07:18:33', '2024-01-17 12:15:29', NULL, 'U2023-0000002', 'U2023-0000001', NULL),
('VV2023-00000002', 'V2023-00000006', 'I2d9f936a-64dfeb-1b', 'TN33BP5580', NULL, '', '', '6.25', '1.8', '2.35', '0', 0, '2023-12-28 11:05:34', '2024-02-09 09:36:16', NULL, 'U2023-0000002', 'U2023-0000001', NULL),
('VV2024-00000001', 'V2024-00000008', 'I67cda30d-60e7ec-17', 'TN40AA5220', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '45', '55', '55', '55', 0, '2024-01-31 05:43:00', '2024-02-10 05:17:41', NULL, 'U2023-0000001', 'U2023-0000001', NULL),
('VV2024-00000003', '222', 'c0c585ad05c6', 'TN40AA5220', 'VT2023-000001', 'VB2023-', 'VM2023-000003', '45', '55', '55', '55', 1, '2024-02-09 05:01:54', '2024-02-09 05:07:08', '2024-02-09 07:36:09', NULL, NULL, NULL),
('VV2024-00000004', '222', 'e8cc26915535', 'TN40AA5220', 'VT2023-000001', 'VB2023-', 'VM2023-000003', '45', '55', '55', '55', 1, '2024-02-09 05:13:09', '2024-02-09 05:20:28', '2024-02-09 07:36:09', NULL, NULL, NULL),
('VV2024-00000005', 'V2024-00000025', '55b8f4c0a567', 'hdyxh', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '10', '5', '5', '2', 1, '2024-02-09 05:17:46', '2024-02-09 05:29:56', '2024-02-09 06:12:07', NULL, NULL, NULL),
('VV2024-00000006', 'V2024-00000025', 'a6f6551bc36c', 'fjfjf', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '10', '5', '5', '10', 0, '2024-02-09 06:12:07', NULL, NULL, NULL, NULL, NULL),
('VV2024-00000007', '222', '61560bb46cac', 'TN40AA5220', 'VT2023-000001', 'VB2023-000002', 'VM2023-000003', '45', '55', '55', '55', 1, '2024-02-09 06:39:39', NULL, '2024-02-09 07:36:09', NULL, NULL, NULL),
('VV2024-00000008', '222', '2c35c5dd6d8b', 'TN40AA5220', 'VT2023-000001', 'VB2023-000002', 'VM2023-000003', '45', '55', '55', '55', 0, '2024-02-09 07:36:09', NULL, NULL, NULL, NULL, NULL),
('VV2024-00000009', 'V2024-00000044', 'b74b56d0d065', 'TN60AA5555', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '66', '77', '88', '99', 1, '2024-02-22 09:09:53', '2024-02-22 13:01:18', '2024-02-23 06:20:24', NULL, 'U2023-0000001', 'V2024-00000044'),
('VV2024-00000010', 'V2024-00000045', '5d1d6b5271e7', 'xjdbux', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '10', '10', '10', '1000', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VV2024-00000011', 'V2024-00000045', '6d5cc679a315', 'xjdbux', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '10', '10', '10', '1000', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VV2024-00000012', 'V2024-00000045', 'f752dd5f19d7', 'xjdbux', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '10', '10', '10', '1000', 0, '2024-02-22 09:19:00', '2024-02-22 09:19:04', NULL, NULL, NULL, NULL),
('VV2024-00000013', 'V2324-00000046', '2b665615b7dc', 'kl45hj7897', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '666', '666', '555', '556', 1, '2024-02-22 10:28:18', NULL, '2024-02-23 07:11:17', NULL, NULL, 'V2324-00000046'),
('VV2324-00000014', 'V2024-00000044', '566757dd735f', 'TN60AA5555', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '66', '77', '88', '99', 0, '2024-02-22 12:13:36', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000028', 'V2024-00000044', '8d6f5a865ddd', 'TN60AA5555', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '66', '77', '88', '99', 0, '2024-02-23 06:19:38', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000029', 'V2024-00000044', '15d93785635c', 'TN60AA5599', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '66', '77', '88', '99', 0, '2024-02-23 06:20:38', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000030', 'V2324-00000046', '5178563d67b9', 'cxx', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '2555', '9866', '8822', '88888', 1, '2024-02-23 06:22:41', NULL, '2024-02-23 06:54:01', NULL, NULL, 'V2324-00000046'),
('VV2324-00000031', 'V2324-00000046', 'de85f925e663', 'fc', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '55', '52', '55', '55', 1, '2024-02-23 06:23:33', NULL, '2024-02-23 07:10:54', NULL, NULL, 'V2324-00000046'),
('VV2324-00000032', 'V2324-00000046', '465ad58f1cc9', 'fc', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '55', '52', '55', '55', 1, '2024-02-23 06:23:50', NULL, '2024-02-23 07:08:51', NULL, NULL, 'V2324-00000046'),
('VV2324-00000033', 'V2324-00000046', '86d1436215ad', '666', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '666', '666', '666', '666', 1, '2024-02-23 06:37:08', NULL, '2024-02-23 07:08:23', NULL, NULL, 'V2324-00000046'),
('VV2324-00000034', 'V2324-00000046', 'ba7854dd5392', 'bb', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '6162', '666', '66', '56', 1, '2024-02-23 07:12:57', NULL, '2024-02-23 07:13:02', NULL, NULL, 'V2324-00000046'),
('VV2324-00000035', 'V2324-00000046', 'f44d4585588d', 'TN46L2349', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', NULL, NULL, NULL, NULL, 1, '2024-02-23 07:13:39', NULL, '2024-02-23 07:33:56', NULL, NULL, 'V2324-00000046'),
('VV2324-00000036', 'V2324-00000046', '6e1265d8dcda', 'xx', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '566', '66', '99', '55', 1, '2024-02-23 07:33:00', NULL, '2024-02-23 07:33:53', NULL, NULL, 'V2324-00000046'),
('VV2324-00000037', 'V2324-00000046', '5a2448666adc', 'xx', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '566', '66', '99', '55', 1, '2024-02-23 07:33:00', NULL, '2024-02-23 07:33:48', NULL, NULL, 'V2324-00000046'),
('VV2324-00000038', 'V2324-00000046', '658675936d9a', 'ygg', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '966', '999', '999', '969', 1, '2024-02-23 07:34:15', NULL, '2024-02-23 07:34:27', NULL, NULL, 'V2324-00000046'),
('VV2324-00000039', 'V2324-00000046', '468b6d55f060', 'hh', 'VT2023-000001', 'VB2023-000001', 'VM2023-000003', '55', '55', '22', '22', 1, '2024-02-23 07:38:13', NULL, '2024-02-23 08:50:37', NULL, NULL, 'V2324-00000046'),
('VV2324-00000040', 'V2324-00000046', '46d5686dead5', 'ggg', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '666', '666', '999', '999', 0, '2024-02-23 07:40:10', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000041', 'V2324-00000046', 'd68b9a8dd6f4', 'v vv', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '999', '999', '999', '99', 1, '2024-02-23 07:40:42', NULL, '2024-02-23 08:50:47', NULL, NULL, 'V2324-00000046'),
('VV2324-00000042', 'V2324-00000046', 'c76e4d85d5f4', '888', 'VT2023-000001', 'VB2023-000001', 'VM2023-000005', '888', '888', '888', '888', 1, '2024-02-23 07:41:50', NULL, '2024-02-23 09:50:09', NULL, NULL, 'V2324-00000046'),
('VV2324-00000043', 'V2324-00000046', 'be13535418dd', NULL, 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', NULL, NULL, NULL, NULL, 1, '2024-02-23 07:42:22', NULL, '2024-02-23 07:50:05', NULL, NULL, 'V2324-00000046'),
('VV2324-00000044', 'V2324-00000046', '83586d666857', 'fcc', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '555', '55', '555', '55', 0, '2024-02-23 09:14:00', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000045', 'V2324-00000046', '655da6a96a59', 'ff', 'VT2024-00000001', 'VB2024-00000001', 'VM2024-00000002', '55', '95', '55', '55', 0, '2024-02-23 09:47:18', NULL, NULL, NULL, NULL, NULL),
('VV2324-00000046', 'V2324-00000046', '5e8647dd8a05', 'dd', 'VT2023-000004', 'VB2023-000002', 'VM2023-000006', '22', '55', '55', '55', 0, '2024-02-23 09:50:06', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendors_vehicle_images`
--

CREATE TABLE `tbl_vendors_vehicle_images` (
  `SLNo` varchar(50) NOT NULL,
  `VendorID` varchar(50) DEFAULT NULL,
  `VehicleID` varchar(50) DEFAULT NULL,
  `UUID` varchar(150) NOT NULL,
  `ImgID` varchar(50) NOT NULL,
  `gImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendors_vehicle_images`
--

INSERT INTO `tbl_vendors_vehicle_images` (`SLNo`, `VendorID`, `VehicleID`, `UUID`, `ImgID`, `gImage`, `Images`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`) VALUES
('VVI2024-00000001', 'V2024-00000008', 'VV2024-00000001', 'I67cda30d-60e7ec-17', 'Ia35f989f-de3024-df', 'uploads/master/vendor/manage-vendors/V2024-00000008/vehicles/958a05347adcf148fd963115ea5c2482.png', NULL, '2024-01-31 05:43:00', 'U2023-0000001', NULL, NULL),
('VVI2024-00000002', 'V2024-00000008', 'VV2024-00000001', 'I67cda30d-60e7ec-17', 'Ieb01b745-25f188-d8', 'uploads/master/vendor/manage-vendors/V2024-00000008/vehicles/c139aac5d3b278a8f00e3714f763506b.png', NULL, '2024-01-31 05:43:00', 'U2023-0000001', NULL, NULL),
('VVI2024-00000003', '222', 'VV2024-00000004', 'e8cc26915535', '3becf65b6535', 'uploads/master/vendor/manage-vendors/222/vehicles/0e7091978cf3d4c07df62a565b2e118f.jpg', NULL, '2024-02-09 05:13:09', NULL, '2024-02-09 05:20:28', NULL),
('VVI2024-00000004', '222', 'VV2024-00000004', 'e8cc26915535', '453b2bd6673e', 'uploads/master/vendor/manage-vendors/222/vehicles/9f8de4ed82bb03a6a79dc18388b9acb5.jpg', NULL, '2024-02-09 05:13:09', NULL, '2024-02-09 05:20:28', NULL),
('VVI2024-00000005', 'V2024-00000025', 'VV2024-00000006', 'a6f6551bc36c', 'b56c6c5155fb', 'uploads/master/vendor/manage-vendors/V2024-00000025/vehicles/6772f1fc396f5da5e79bf03afb925bee.jpg', NULL, '2024-02-09 06:12:07', NULL, NULL, NULL),
('VVI2024-00000006', 'V2024-00000025', 'VV2024-00000006', 'a6f6551bc36c', '55c1f45fb669', 'uploads/master/vendor/manage-vendors/V2024-00000025/vehicles/ef2b0becb1756d7e858105fb2eadcfd1.jpg', NULL, '2024-02-09 06:12:07', NULL, NULL, NULL),
('VVI2024-00000007', 'V2024-00000025', 'VV2024-00000006', 'a6f6551bc36c', 'e55c91ebc6c6', 'uploads/master/vendor/manage-vendors/V2024-00000025/vehicles/4674a103391f128f25e9e71cb56047fa.png', NULL, '2024-02-09 06:12:07', NULL, NULL, NULL),
('VVI2024-00000008', 'V2024-00000025', 'VV2024-00000006', 'a6f6551bc36c', '96ac765b57fc', 'uploads/master/vendor/manage-vendors/V2024-00000025/vehicles/0ad89b6e6ff057810f7a85cde5cd37f4.png', NULL, '2024-02-09 06:12:07', NULL, NULL, NULL),
('VVI2024-00000009', 'V2024-00000025', 'VV2024-00000006', 'a6f6551bc36c', 'b451c6861c1f', 'uploads/master/vendor/manage-vendors/V2024-00000025/vehicles/2801da9cb2e39f25c0485b38fac0cb45.png', NULL, '2024-02-09 06:12:07', NULL, NULL, NULL),
('VVI2024-00000010', '222', 'VV2024-00000007', '61560bb46cac', 'c6c6a574a6b6', 'uploads/master/vendor/manage-vendors/222/vehicles/0e7091978cf3d4c07df62a565b2e118f.jpg', NULL, '2024-02-09 06:39:39', NULL, NULL, NULL),
('VVI2024-00000011', '222', 'VV2024-00000007', '61560bb46cac', '65584c5cca73', 'uploads/master/vendor/manage-vendors/222/vehicles/9f8de4ed82bb03a6a79dc18388b9acb5.jpg', NULL, '2024-02-09 06:39:39', NULL, NULL, NULL),
('VVI2024-00000012', '222', 'VV2024-00000008', '2c35c5dd6d8b', '8dcd56595fdc', 'uploads/master/vendor/manage-vendors/222/vehicles/0e7091978cf3d4c07df62a565b2e118f.jpg', NULL, '2024-02-09 07:36:09', NULL, NULL, NULL),
('VVI2024-00000013', '222', 'VV2024-00000008', '2c35c5dd6d8b', '55cd5165d9e6', 'uploads/master/vendor/manage-vendors/222/vehicles/9f8de4ed82bb03a6a79dc18388b9acb5.jpg', NULL, '2024-02-09 07:36:09', NULL, NULL, NULL),
('VVI2024-00000015', 'V2024-00000044', 'VV2024-00000009', 'b74b56d0d065', 'fd056654ed66', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/9f8de4ed82bb03a6a79dc18388b9acb5.jpg', NULL, '2024-02-22 09:09:53', NULL, NULL, NULL),
('VVI2024-00000016', 'V2024-00000045', 'VV2024-00000010', '5d1d6b5271e7', '61e5772ba5d1', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/c3182583a0b654dca1b0800764479539.jpg', NULL, '2024-02-22 09:19:00', NULL, '2024-02-22 09:19:04', NULL),
('VVI2024-00000017', 'V2024-00000045', 'VV2024-00000011', '6d5cc679a315', '6cddb1576465', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/c3182583a0b654dca1b0800764479539.jpg', NULL, '2024-02-22 09:19:00', NULL, '2024-02-22 09:19:04', NULL),
('VVI2024-00000018', 'V2024-00000045', 'VV2024-00000012', 'f752dd5f19d7', '18677d1a7df5', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/c3182583a0b654dca1b0800764479539.jpg', NULL, '2024-02-22 09:19:00', NULL, '2024-02-22 09:19:04', NULL),
('VVI2024-00000019', 'V2324-00000046', 'VV2024-00000013', '2b665615b7dc', '6122d77526d5', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/c020d15a46e9a373e60bc2bb0c2f7f1f.jpg', NULL, '2024-02-22 10:28:18', NULL, NULL, NULL),
('VVI2024-00000020', 'V2324-00000046', 'VV2024-00000013', '2b665615b7dc', '5edd762b2b21', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/fa2b1a6c8dfe38a47fd41579c6d47566.jpg', NULL, '2024-02-22 10:28:18', NULL, NULL, NULL),
('VVI2024-00000021', 'V2324-00000046', 'VV2024-00000013', '2b665615b7dc', '8dd562b71e35', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/e764d66d686d9eae5aae06e9fda397c9.png', NULL, '2024-02-22 10:28:18', NULL, NULL, NULL),
('VVI2024-00000022', 'V2324-00000046', 'VV2024-00000013', '2b665615b7dc', '655fb292bd16', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/fa60a171a3d96d947537e3c6ba61266f.png', NULL, '2024-02-22 10:28:18', NULL, NULL, NULL),
('VVI2024-00000023', 'V2324-00000046', 'VV2024-00000013', '2b665615b7dc', 'a57bd51826f6', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/1458aa22bab4b7670b41b9d3845d00f2.png', NULL, '2024-02-22 10:28:18', NULL, NULL, NULL),
('VVI2024-00000024', 'V2024-00000044', 'VV2324-00000014', '566757dd735f', '540d0bdd5767', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/b0b817429c90ce98ad1289e6f7c3e949.jpg', NULL, '2024-02-22 12:13:36', NULL, NULL, NULL),
('VVI2024-00000025', 'V2024-00000044', 'VV2324-00000014', '566757dd735f', '3d170d7d6795', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/871c213b516d7a0a339db860d465ec39.jpg', NULL, '2024-02-22 12:13:36', NULL, NULL, NULL),
('VVI2024-00000026', 'V2024-00000044', 'VV2024-00000009', 'b74b56d0d065', '965e4665760d', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/871c213b516d7a0a339db860d465ec39.jpg', NULL, '2024-02-22 13:01:18', NULL, NULL, NULL),
('VVI2024-00000027', 'V2324-00000046', 'VV2324-00000015', '32b5578d2d61', 'd76ae338525a', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:35:15', NULL, NULL, NULL),
('VVI2024-00000028', 'V2324-00000046', 'VV2324-00000015', '32b5578d2d61', '83416e5a7ad6', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:35:15', NULL, NULL, NULL),
('VVI2024-00000029', 'V2324-00000046', 'VV2324-00000015', '32b5578d2d61', '9245e59686ae', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:35:15', NULL, NULL, NULL),
('VVI2024-00000030', 'V2324-00000046', 'VV2324-00000016', '58685d66e627', 'd9bd62a8867e', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:35:35', NULL, NULL, NULL),
('VVI2024-00000031', 'V2324-00000046', 'VV2324-00000016', '58685d66e627', 'd890856dea65', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:35:35', NULL, NULL, NULL),
('VVI2024-00000032', 'V2324-00000046', 'VV2324-00000016', '58685d66e627', '96515d75af7d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:35:35', NULL, NULL, NULL),
('VVI2024-00000033', 'V2324-00000046', 'VV2324-00000017', '0d2f85563e04', '589ff6d5526f', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:37:57', NULL, NULL, NULL),
('VVI2024-00000034', 'V2324-00000046', 'VV2324-00000017', '0d2f85563e04', 'd4625565ff8f', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:37:57', NULL, NULL, NULL),
('VVI2024-00000035', 'V2324-00000046', 'VV2324-00000017', '0d2f85563e04', '28f5d616519c', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:37:57', NULL, NULL, NULL),
('VVI2024-00000036', 'V2324-00000046', 'VV2324-00000018', '02d66c50da53', '18f646d15cd5', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:38:04', NULL, NULL, NULL),
('VVI2024-00000037', 'V2324-00000046', 'VV2324-00000018', '02d66c50da53', 'ddf5c2386c86', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:38:04', NULL, NULL, NULL),
('VVI2024-00000038', 'V2324-00000046', 'VV2324-00000018', '02d66c50da53', 'a5d344238d6f', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:38:04', NULL, NULL, NULL),
('VVI2024-00000039', 'V2324-00000046', 'VV2324-00000019', '3598da625fec', 'ed656d8f2235', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:38:43', NULL, NULL, NULL),
('VVI2024-00000040', 'V2324-00000046', 'VV2324-00000019', '3598da625fec', 'fdf852656d3f', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:38:43', NULL, NULL, NULL),
('VVI2024-00000041', 'V2324-00000046', 'VV2324-00000019', '3598da625fec', '8f5d5f63253d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:38:43', NULL, NULL, NULL),
('VVI2024-00000042', 'V2324-00000046', 'VV2324-00000020', 'c68fc6285fd5', '9e62566dfd5c', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/40cbf54672ea3b9b8f41b145c5b335b6.png', NULL, '2024-02-23 05:40:26', NULL, NULL, NULL),
('VVI2024-00000043', 'V2024-00000045', 'VV2324-00000021', '4d603f315b56', 'c85046d5f063', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 05:41:35', NULL, NULL, NULL),
('VVI2024-00000044', 'V2024-00000045', 'VV2324-00000021', '4d603f315b56', '65c18df3fd00', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 05:41:35', NULL, NULL, NULL),
('VVI2024-00000045', 'V2024-00000045', 'VV2324-00000021', '4d603f315b56', '0de26fc3308d', 'uploads/master/vendor/manage-vendors/V2024-00000045/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 05:41:35', NULL, NULL, NULL),
('VVI2024-00000046', 'V2324-00000046', 'VV2324-00000022', 'd8555465603e', '46dd345a6e96', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/b112bb816f6efdbfa71bba9c0bea2183.png', NULL, '2024-02-23 06:02:06', NULL, NULL, NULL),
('VVI2024-00000047', 'V2324-00000046', 'VV2324-00000023', '34d549d8ab6d', '3edd955566d6', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/e17789aaa4c3ca24c0644eafa73c1d00.png', NULL, '2024-02-23 06:06:17', NULL, NULL, NULL),
('VVI2024-00000048', 'V2324-00000046', 'VV2324-00000024', '066158c632b5', 'd34566d8642d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 06:10:16', NULL, NULL, NULL),
('VVI2024-00000049', 'V2324-00000046', 'VV2324-00000024', '066158c632b5', '53cd866fda38', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 06:10:16', NULL, NULL, NULL),
('VVI2024-00000050', 'V2324-00000046', 'VV2324-00000024', '066158c632b5', 'cd635b8d5636', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 06:10:16', NULL, NULL, NULL),
('VVI2024-00000051', 'V2324-00000046', 'VV2324-00000025', '5d3d16562e76', '257d3e566e3d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/2f5d189eb3baf4e6815f12dabba4aa01.png', NULL, '2024-02-23 06:11:37', NULL, NULL, NULL),
('VVI2024-00000052', 'V2324-00000046', 'VV2324-00000026', '523b97bd6676', '37d8053d6667', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/6372add4a0b168cbf05d89aa7e9b1be0.png', NULL, '2024-02-23 06:13:10', NULL, NULL, NULL),
('VVI2024-00000053', 'V2324-00000046', 'VV2324-00000027', '6137d5f5cd56', '776d532c95d5', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/7e30d40a1675effdba9bb2abad1d91eb.png', NULL, '2024-02-23 06:14:29', NULL, NULL, NULL),
('VVI2024-00000054', 'V2024-00000044', 'VV2324-00000028', '8d6f5a865ddd', '8bfd966d5836', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/b0b817429c90ce98ad1289e6f7c3e949.jpg', NULL, '2024-02-23 06:19:38', NULL, NULL, NULL),
('VVI2024-00000055', 'V2024-00000044', 'VV2324-00000028', '8d6f5a865ddd', '656398d6dfdb', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/871c213b516d7a0a339db860d465ec39.jpg', NULL, '2024-02-23 06:19:38', NULL, NULL, NULL),
('VVI2024-00000056', 'V2024-00000044', 'VV2324-00000029', '15d93785635c', '56d3563ddbd8', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/b0b817429c90ce98ad1289e6f7c3e949.jpg', NULL, '2024-02-23 06:20:38', NULL, NULL, NULL),
('VVI2024-00000057', 'V2024-00000044', 'VV2324-00000029', '15d93785635c', '65ad6a895d63', 'uploads/master/vendor/manage-vendors/V2024-00000044/vehicles/871c213b516d7a0a339db860d465ec39.jpg', NULL, '2024-02-23 06:20:38', NULL, NULL, NULL),
('VVI2024-00000058', 'V2324-00000046', 'VV2324-00000030', '5178563d67b9', '986d3651615b', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/141d5cf6dc80c9d5decfbad276b47f45.jpg', NULL, '2024-02-23 06:22:41', NULL, NULL, NULL),
('VVI2024-00000059', 'V2324-00000046', 'VV2324-00000030', '5178563d67b9', '8139b9c72658', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/f50b0de781f5d191de4d864019618a8b.jpg', NULL, '2024-02-23 06:22:41', NULL, NULL, NULL),
('VVI2024-00000060', 'V2324-00000046', 'VV2324-00000030', '5178563d67b9', '3d1d783b8965', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/d6acb6e97a7c7060d4dacbbfd291e43a.jpg', NULL, '2024-02-23 06:22:41', NULL, NULL, NULL),
('VVI2024-00000061', 'V2324-00000046', 'VV2324-00000031', 'de85f925e663', 'd580f062e59d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/7e30d40a1675effdba9bb2abad1d91eb.png', NULL, '2024-02-23 06:23:33', NULL, NULL, NULL),
('VVI2024-00000062', 'V2324-00000046', 'VV2324-00000032', '465ad58f1cc9', 'b56458f7d696', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/7e30d40a1675effdba9bb2abad1d91eb.png', NULL, '2024-02-23 06:23:50', NULL, NULL, NULL),
('VVI2024-00000063', 'V2324-00000046', 'VV2324-00000033', '86d1436215ad', '504a251653da', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/41df9f6881cc424611293f7915e499f0.png', NULL, '2024-02-23 06:37:08', NULL, NULL, NULL),
('VVI2024-00000064', 'V2324-00000046', 'VV2324-00000033', '86d1436215ad', 'b5db851e6da4', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/7d53d4a969409014ada8fccfb07f0e69.png', NULL, '2024-02-23 06:37:08', NULL, NULL, NULL),
('VVI2024-00000065', 'V2324-00000046', 'VV2324-00000033', '86d1436215ad', '854631cad56d', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/a389bb18f09b03097d965c4eff352b5c.png', NULL, '2024-02-23 06:37:08', NULL, NULL, NULL),
('VVI2024-00000066', 'V2324-00000046', 'VV2324-00000033', '86d1436215ad', '156d5345fad8', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/fce0a53cabe24fed3274bca4b18f4bd8.png', NULL, '2024-02-23 06:37:08', NULL, NULL, NULL),
('VVI2024-00000067', 'V2324-00000046', 'VV2324-00000034', 'ba7854dd5392', '5759d6c44dd5', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/a5c6eaa2459bf64e4726fee422c2fb6e.png', NULL, '2024-02-23 07:12:57', NULL, NULL, NULL),
('VVI2024-00000068', 'V2324-00000046', 'VV2324-00000035', 'f44d4585588d', '4df03653a658', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/e355b4237abdb1aa844f5b048c4bf0a5.jpg', NULL, '2024-02-23 07:13:39', NULL, NULL, NULL),
('VVI2024-00000069', 'V2324-00000046', 'VV2324-00000036', '6e1265d8dcda', '68a245dcd548', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/04fda7da92936e01c338a6fd2b0a7123.png', NULL, '2024-02-23 07:33:00', NULL, NULL, NULL),
('VVI2024-00000070', 'V2324-00000046', 'VV2324-00000037', '5a2448666adc', '44dc862a5567', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/04fda7da92936e01c338a6fd2b0a7123.png', NULL, '2024-02-23 07:33:00', NULL, NULL, NULL),
('VVI2024-00000071', 'V2324-00000046', 'VV2324-00000038', '658675936d9a', 'a6455b1d7579', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/e6121ee4ad8ab87cf6449a570f09747b.jpg', NULL, '2024-02-23 07:34:15', NULL, NULL, NULL),
('VVI2024-00000072', 'V2324-00000046', 'VV2324-00000039', '468b6d55f060', '5448956d06d6', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/23f13a8502a2db7e8600dc66fa9e45bb.jpg', NULL, '2024-02-23 07:38:13', NULL, NULL, NULL),
('VVI2024-00000073', 'V2324-00000046', 'VV2324-00000040', '46d5686dead5', 'd565e8d4db6e', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/868d4974a0e78a0c96c3f229e00b79d6.png', NULL, '2024-02-23 07:40:10', NULL, NULL, NULL),
('VVI2024-00000074', 'V2324-00000046', 'VV2324-00000041', 'd68b9a8dd6f4', 'd057f5d764ab', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/0a70e9bf5a7467f84052d8066d696671.jpg', NULL, '2024-02-23 07:40:42', NULL, NULL, NULL),
('VVI2024-00000075', 'V2324-00000046', 'VV2324-00000042', 'c76e4d85d5f4', 'c6d564573de1', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/8026218de7ac23bde40c892c0f7f0405.png', NULL, '2024-02-23 07:41:50', NULL, NULL, NULL),
('VVI2024-00000076', 'V2324-00000046', 'VV2324-00000043', 'be13535418dd', 'eb32865c55dd', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/5ea154b7326d5f18ee1627120a251c2b.png', NULL, '2024-02-23 07:42:22', NULL, NULL, NULL),
('VVI2024-00000077', 'V2324-00000046', 'VV2324-00000044', '83586d666857', '6d1646d5a588', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/6477ad0d0d9a5acd1ccd6ef3d2ee7b84.jpg', NULL, '2024-02-23 09:14:00', NULL, NULL, NULL),
('VVI2024-00000078', 'V2324-00000046', 'VV2324-00000044', '83586d666857', 'd635dfd86686', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/81ff043acc844842de170bb0c266f572.jpg', NULL, '2024-02-23 09:14:00', NULL, NULL, NULL),
('VVI2024-00000079', 'V2324-00000046', 'VV2324-00000044', '83586d666857', '876b165816d5', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/a10a1844dd8328337169375b8fa2e441.png', NULL, '2024-02-23 09:14:00', NULL, NULL, NULL),
('VVI2024-00000080', 'V2324-00000046', 'VV2324-00000045', '655da6a96a59', 'f6b8da596966', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/889af52a3b24283150cd163c665242de.png', NULL, '2024-02-23 09:47:18', NULL, NULL, NULL),
('VVI2024-00000081', 'V2324-00000046', 'VV2324-00000046', '5e8647dd8a05', 'ad456f886561', 'uploads/master/vendor/manage-vendors/V2324-00000046/vehicles/61259741b4172bc4099b1b1a0d6a45a6.png', NULL, '2024-02-23 09:50:06', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor_category`
--

CREATE TABLE `tbl_vendor_category` (
  `VCID` varchar(50) NOT NULL,
  `VCName` varchar(100) DEFAULT NULL,
  `VCImage` text DEFAULT NULL,
  `Images` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') DEFAULT 'Active',
  `DFlag` int(1) DEFAULT 0,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `AdditionalSetting` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_vendor_category`
--

INSERT INTO `tbl_vendor_category` (`VCID`, `VCName`, `VCImage`, `Images`, `ActiveStatus`, `DFlag`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `AdditionalSetting`) VALUES
('VC2023-0000001', 'Premium', '', 'a:0:{}', 'Active', 0, 'U2023-0000002', 'U2023-0000001', NULL, '2023-12-28 06:25:28', '2024-02-14 07:26:38', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('VC2023-0000002', 'Platinum', '', 'a:0:{}', 'Active', 0, 'U2023-0000002', 'U2023-0000001', NULL, '2023-12-28 10:00:21', '2024-02-14 07:26:54', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('VC2023-0000003', 'Gold', '', 'a:0:{}', 'Active', 0, 'U2023-0000002', 'U2023-0000001', NULL, '2023-12-28 10:01:22', '2024-02-14 07:27:08', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('VC2023-0000004', 'STEEL', '', 'a:0:{}', 'Active', 1, 'U2023-0000002', 'U2023-0000002', 'U2023-0000001', '2023-12-28 10:46:49', '2023-12-28 10:48:49', '2024-02-14 07:27:15', 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('VC2023-0000005', 'CONSTRUCTION ADMIXTURES', 'uploads/master/vendor/category/VC2023-0000005/JhvJSTbbXR_20240208104521.png', 'a:4:{i:100;a:3:{s:5:\"width\";i:137;s:6:\"height\";i:137;s:3:\"url\";s:75:\"uploads/master/vendor/category/VC2023-0000005/JhvJSTbbXR_20240208104521.png\";}i:75;a:3:{s:5:\"width\";d:102.75;s:6:\"height\";d:102.75;s:3:\"url\";s:0:\"\";}i:50;a:3:{s:5:\"width\";d:68.5;s:6:\"height\";d:68.5;s:3:\"url\";s:0:\"\";}i:25;a:3:{s:5:\"width\";d:34.25;s:6:\"height\";d:34.25;s:3:\"url\";s:0:\"\";}}', 'Active', 1, 'U2023-0000002', 'U2023-0000001', 'U2023-0000001', '2023-12-28 10:52:17', '2024-02-08 05:15:22', '2024-02-14 07:27:19', 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('VC2024-0000006', 'Test V Cat', '', 'a:0:{}', 'Active', 1, 'U2023-0000001', 'U2023-0000001', 'U2023-0000001', '2024-01-06 06:34:01', '2024-01-06 06:36:01', '2024-02-14 07:27:23', 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor_ratings`
--

CREATE TABLE `tbl_vendor_ratings` (
  `S.No` int(11) NOT NULL DEFAULT 0,
  `VendorID` varchar(50) DEFAULT NULL,
  `TotalYears` text DEFAULT NULL,
  `TotalOrders` varchar(50) DEFAULT NULL,
  `CustomerRating` varchar(50) DEFAULT NULL,
  `AdminRating` varchar(50) DEFAULT NULL,
  `Outstanding` varchar(50) DEFAULT NULL,
  `OrderValue` varchar(50) DEFAULT NULL,
  `OverAll` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendor_ratings`
--

INSERT INTO `tbl_vendor_ratings` (`S.No`, `VendorID`, `TotalYears`, `TotalOrders`, `CustomerRating`, `AdminRating`, `Outstanding`, `OrderValue`, `OverAll`) VALUES
(3, 'V2024-00000018', 'Nov 2023 (2 Months)', '23', '2.3', '4.1', '10000', '83000', '7/10'),
(4, 'V2024-00000019', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'V2024-00000008', 'Jun 2022 (18 Months)', '387', '4.2', '3.5', '34000', '1260000', '8/10'),
(7, 'V2023-00000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'V2024-00000020', 'Aug 2022 (16 Months)', '132', '3.6', '4', '13400', '248000', '6/10'),
(9, 'V2023-00000006', 'Jan 2023 (12 Months)', '402', '4', '5', '30000', '5200000', '9/10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor_type`
--

CREATE TABLE `tbl_vendor_type` (
  `VendorTypeID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VendorType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STImage` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Images` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Active',
  `DFlag` int(1) DEFAULT 0,
  `CreatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DeletedBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `AdditionalSetting` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendor_type`
--

INSERT INTO `tbl_vendor_type` (`VendorTypeID`, `VendorType`, `STImage`, `Images`, `ActiveStatus`, `DFlag`, `CreatedBy`, `UpdatedBy`, `DeletedBy`, `CreatedOn`, `UpdatedOn`, `DeletedOn`, `AdditionalSetting`) VALUES
('ST2023-0000001', 'Dealer', NULL, NULL, 'Active', 0, 'U2023-0000001', 'U2023-0000001', NULL, '2023-12-22 11:44:03', '2023-12-22 11:47:28', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:1:{i:0;O:8:\"stdClass\":10:{s:2:\"id\";s:17:\"txt658576ceef5c28\";s:4:\"name\";s:12:\"Credit Limit\";s:7:\"ColName\";s:12:\"Credit Limit\";s:10:\"isRequired\";i:1;s:7:\"isFixed\";i:1;s:5:\"value\";s:6:\"500000\";s:4:\"type\";s:6:\"number\";s:8:\"fileName\";s:0:\"\";s:8:\"fileSize\";s:0:\"\";s:8:\"fileType\";s:0:\"\";}}s:4:\"data\";a:1:{i:0;O:8:\"stdClass\":9:{s:4:\"name\";s:12:\"Credit Limit\";s:7:\"ColName\";s:12:\"Credit Limit\";s:5:\"value\";s:6:\"500000\";s:10:\"isRequired\";i:1;s:7:\"isFixed\";i:1;s:4:\"type\";s:6:\"number\";s:8:\"fileName\";s:0:\"\";s:8:\"fileType\";s:0:\"\";s:8:\"fileSize\";s:0:\"\";}}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:1:{i:0;N;}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:1:{i:0;O:8:\"stdClass\":9:{s:4:\"name\";s:12:\"Credit Limit\";s:7:\"ColName\";s:12:\"Credit Limit\";s:5:\"value\";s:6:\"500000\";s:10:\"isRequired\";i:1;s:7:\"isFixed\";i:1;s:4:\"type\";s:6:\"number\";s:8:\"fileName\";s:0:\"\";s:8:\"fileType\";s:0:\"\";s:8:\"fileSize\";s:0:\"\";}}}'),
('ST2023-0000002', 'Distributor', '', 'a:0:{}', 'Active', 0, 'U2023-0000001', 'U2023-0000001', NULL, '2023-12-22 11:46:04', '2023-12-22 11:48:04', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('ST2023-0000003', 'Manufacturers', '', 'a:0:{}', 'Active', 0, 'U2023-0000001', 'U2023-0000001', 'U2023-0000001', '2023-12-23 14:02:27', '2023-12-26 04:42:33', '2023-12-26 04:42:22', 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}'),
('ST2023-0000004', 'Traders', '', 'a:0:{}', 'Active', 0, 'U2023-0000001', 'U2023-0000001', NULL, '2023-12-23 14:02:47', '2023-12-23 14:04:47', NULL, 'O:8:\"stdClass\":6:{s:6:\"inputs\";a:0:{}s:4:\"data\";a:0:{}s:12:\"DeletedItems\";a:0:{}s:8:\"fileSize\";a:0:{}s:14:\"validateStatus\";b:1;s:11:\"fixedFields\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `ReferID` varchar(50) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `GenderID` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CountryID` varchar(50) DEFAULT NULL,
  `StateID` varchar(50) DEFAULT NULL,
  `DistrictID` varchar(50) DEFAULT NULL,
  `TalukID` varchar(50) DEFAULT NULL,
  `CityID` varchar(50) DEFAULT NULL,
  `PostalCodeID` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password1` text DEFAULT NULL,
  `RoleID` varchar(50) DEFAULT NULL,
  `LoginType` enum('Admin','Vendor','Customer') NOT NULL,
  `EMail` varchar(100) DEFAULT NULL,
  `MobileNumber` varchar(50) DEFAULT NULL,
  `ProfileImage` text DEFAULT NULL,
  `ActiveStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `DFlag` int(1) NOT NULL DEFAULT 0,
  `isShow` int(1) NOT NULL DEFAULT 1,
  `isLogin` int(1) NOT NULL DEFAULT 1,
  `fcmToken` text DEFAULT NULL,
  `Provider` text DEFAULT NULL,
  `ProviderID` text DEFAULT NULL,
  `DashboardType` enum('admin','none') DEFAULT 'none',
  `remember_token` varchar(100) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` timestamp NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `DeletedOn` timestamp NULL DEFAULT NULL,
  `DeletedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `UserID`, `ReferID`, `Name`, `FirstName`, `LastName`, `DOB`, `DOJ`, `GenderID`, `Address`, `CountryID`, `StateID`, `DistrictID`, `TalukID`, `CityID`, `PostalCodeID`, `UserName`, `email_verified_at`, `password`, `password1`, `RoleID`, `LoginType`, `EMail`, `MobileNumber`, `ProfileImage`, `ActiveStatus`, `DFlag`, `isShow`, `isLogin`, `fcmToken`, `Provider`, `ProviderID`, `DashboardType`, `remember_token`, `CreatedOn`, `CreatedBy`, `UpdatedOn`, `UpdatedBy`, `DeletedOn`, `DeletedBy`) VALUES
(1, 'U2023-0000001', '', 'Anandhan Selvaraj', 'Anandhan', 'Selvaraj', '1990-12-16', NULL, 'G2020-00001', '57, St.Annes Road,', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000500', 'T2023-00007995', 'CI2023-0115859', 'PC2023-0015343', 'anand@propluslogics.com', NULL, '$2y$10$wCjV2jljxRIbCxSNMP3PJuJLbWY8ePq2EkqpV1UtD5RVVQw.Gh0OK', '90TU2cUQSZTVkFmMLl3KNhnYGFXeT90L', 'UR2023-0000003', 'Admin', 'anand@propluslogics.com', '7200900002', 'ANqAvr8Q4f_20240307155044.png', 'Active', 0, 0, 1, '3423534534', NULL, NULL, 'admin', 'guFc4XEP5nrHo6TXWLYqIMg0YncLRu8TvRE3zXUrBLf8TZb4el4QHVSxcn2B', '2023-09-21 06:38:03', NULL, '2024-03-07 11:30:40', 'V2024-00000043', NULL, NULL),
(2, 'U2023-0000002', NULL, 'Admin', 'Admin', '', '1990-12-16', NULL, 'G2020-00001', '#No: 1435-1438, Sakthy Trade center', 'C2020-00000101', 'S2020-00000035', NULL, NULL, 'CI2020-00003683', 'PC2023-0000001', 'admin@gmail.com', NULL, '$2y$10$wCjV2jljxRIbCxSNMP3PJuJLbWY8ePq2EkqpV1UtD5RVVQw.Gh0OK', '90TU2cUQSZTVkFmMLl3KNhnYGFXeT90L', 'UR2023-0000001', 'Admin', 'admin@gmail.com', '7708679203', NULL, 'Active', 0, 0, 1, NULL, NULL, NULL, 'admin', 'KuI5mOBflybQqPFaVMjqOQSAlKUJjQ2OYLzrRCs8RitP7ITuI7BwnHt5ZlfW', '2023-09-21 06:38:03', NULL, '2023-10-11 13:03:28', 'U2023-0000001', NULL, NULL),
(3, 'U2023-0000003', NULL, 'Sathish r', 'Sathish', 'r', NULL, NULL, 'G2020-00001', NULL, 'C2020-00000101', 'S2020-00000035', 'DT2023-00000497', 'T2023-00007978', 'CI2023-0115371', 'PC2023-0015242', '9988776655', NULL, '$2y$10$yrNgiaiTpDeNlmxjMCrmLub9k0TDMABRASiZg4ZyvhQkCbZiD9iKS', '90TUw12T5Q0R4VDbh1kY3wGZStGSu1WM', 'UR2023-0000002', 'Admin', NULL, '9988776655', '', 'Active', 0, 1, 1, NULL, NULL, NULL, 'none', 'vX0TzVB6TzIF2PcuYNaYHChSKJXIUswsifwwvlTPGuasgN4fVILguRXTsfXA', '2023-12-28 07:32:06', 'U2023-0000002', NULL, NULL, NULL, NULL),
(4, 'U2023-0000004', 'V2324-00000046', 'Praveen Kumar', 'Praveen', 'Kumar', NULL, NULL, 'G2020-00001', '56,Dhanam Layout', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000497', 'T2023-00007978', 'CI2023-0115371', 'PC2023-0015242', 'praveen@gmail.com', NULL, '$2y$10$3QkDjUMM19km6zAhGR9Q3.Ibje5JoyVKWqIOCzMlTTIn4.7z1VHpu', '90TUw12T5Q0R4VDbh1kY3wGZStGSu1WM', NULL, 'Vendor', NULL, '7568304651', '', 'Active', 0, 1, 1, '12341234', NULL, NULL, 'none', 'vX0TzVB6TzIF2PcuYNaYHChSKJXIUswsifwwvlTPGuasgN4fVILguRXTsfXA', '2023-12-28 07:32:06', 'V2024-00000018', NULL, NULL, NULL, NULL),
(5, 'U2023-0000003', NULL, 'Sridhar Raja', 'Sridhar', 'Raja', NULL, NULL, 'G2020-00001', '3-47D/J.R.R Nagar,', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000497', 'T2023-00007978', 'CI2023-0115371', 'PC2023-0015242', 'sridhar@gmail.com', NULL, '$2y$10$3QkDjUMM19km6zAhGR9Q3.Ibje5JoyVKWqIOCzMlTTIn4.7z1VHpu', '90TUw12T5Q0R4VDbh1kY3wGZStGSu1WM', NULL, 'Customer', NULL, '7568304651', '', 'Active', 0, 1, 1, NULL, NULL, NULL, 'none', 'vX0TzVB6TzIF2PcuYNaYHChSKJXIUswsifwwvlTPGuasgN4fVILguRXTsfXA', '2023-12-28 07:32:06', 'V2024-00000018', NULL, NULL, NULL, NULL),
(8, 'U2324-0000005', 'V2024-00000044', 'Arun Kumar', 'Arun', 'Kumar', NULL, NULL, NULL, '57, St.Annes Road', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000500', 'T2023-00007995', 'CI2023-0115859', 'PC2023-0015343', 'arun@gmail.com', NULL, '$2y$10$9Hel.A1aq4HDXp77aHmpveCC2Mg.Avv4jio0wVrPf47fGvup7jINy', '90TQIhzbrd0NGp1KxIzT0o2axlnNFNVU', NULL, 'Vendor', 'arun@gmail.com', '7200900000', 'uploads/users/U2324-0000005/ed2d284f259fbf20bac97acafebc8da6.jpg', 'Active', 1, 1, 1, '3423534534', NULL, NULL, 'none', NULL, '2024-02-21 12:13:20', 'U2324-0000005', NULL, 'V2024-00000044', '2024-03-06 09:49:40', 'U2023-0000001'),
(9, 'U2324-0000006', 'CU2324-00000010', 'Manoj Prabhakar', 'Manoj', 'Prabhakar', NULL, NULL, NULL, '68, Vel St', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000490', 'T2023-00007889', 'CI2023-0113511', 'PC2023-0014894', 'manoj@gmail.com', NULL, '$2y$10$3f1cyrEXd537ruXdHWbb/.8DeEKXJ2KsReCfQysSSbueIFIGuZGMy', '90TU1VFeihUbJRFbVNDdtRFSMt0NR9CR', NULL, 'Customer', 'manoj@gmail.com', '9876678999', '', 'Active', 1, 1, 1, '123412345', NULL, NULL, 'none', NULL, '2024-02-21 13:38:24', 'U2324-0000006', NULL, 'CU2324-00000010', '2024-03-06 09:49:44', 'U2023-0000001'),
(11, 'U2324-0000008', 'V2024-00000045', 'Mobile team', 'Mobile', 'team', NULL, NULL, NULL, 'xjjxhxj', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000500', 'T2023-00007995', 'CI2023-0115969', 'PC2023-0015331', 'mobileteam620@gmail.com', NULL, '$2y$10$VOsSSMl0thO0xUgSp.9eLuCRHWE8b3jgdJ8dqdnduobXa0g8kS9Wy', '=0TUQZ0ZQJGRSh2N4sCNvY3S5kGOkVlWVF1SvpEUOxGa3l0bmtiSYh2b1MHa', NULL, 'Vendor', 'mobileteam620@gmail.com', '9638527415', '', 'Active', 0, 1, 1, 'caUveuoeQQKdZTi0uaP4A6:APA91bGpumFyuO58dXH29XiGCE0ilI0zPOFXu-ZYBhsNIuC8Ahh0-fr44vd3YJnHWyKuRK8ArYfUM8R4WajvioYKDGDw4L4nWTnMYaI6rrYpqrwW9Yffrb-xuSXDy7eLuzU2mRi1OhXi', NULL, NULL, 'none', NULL, '2024-02-22 06:28:51', 'U2324-0000008', NULL, 'V2024-00000045', NULL, NULL),
(12, 'U2324-0000009', 'V2024-00000018', 'nikhil', 'nikhil', '', NULL, NULL, NULL, 'sbhzjzjzjzkxbbc n n', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000497', 'T2023-00007979', 'CI2023-0115392', 'PC2023-0015249', 'premiumpro73@gmail.com', NULL, '$2y$10$GLzw0AO7Uozw87HmxHeIgu42OcGTfr7YjIXPjuUpKtjTNdbsMA7kO', '=0zdzpFMvMXWntkTatkUttSZx5kNKhTOIxUdwsUYRBnV44EdolWaktkYnRUe', NULL, 'Vendor', 'premiumpro73@gmail.com', '7907408863', '', 'Active', 0, 1, 1, 'f_GaYfHhSteOyGML8EBbId:APA91bFKJvESFd7l_BW-h7AfTAXghjpanaoXqRpsZWWp7g-qiWi-0fB9EkPuULxgOw9xohrFix8nPmflFGbIZ9tqaRrU8EaBUPCPv4m0pHS-GSvOCAn07eHbSHsTGI50Uolrr-1vRdDq', NULL, NULL, 'none', NULL, '2024-02-22 10:02:04', 'U2324-0000009', NULL, 'V2324-00000046', NULL, NULL),
(13, 'U2324-0000010', 'CU2324-00000011', 'nikhil', 'nikhil', '', NULL, NULL, NULL, 'gvyv', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000500', 'T2023-00007995', 'CI2023-0115969', 'PC2023-0015331', 'bharanidaranproplus@gmail.com', NULL, '$2y$10$WHObTTRsFFnjvydB3leFg.eKB2QF6tKJhAqnao1BDWxrCRNXmVmHW', '=0TW0J3MPV0Y2tyUmRlYXVUcWNmMFNDeU9WRthTUN52TGBVZvMHSDhlNlF0S', NULL, 'Customer', 'bharanidaranproplus@gmail.com', '9873654210', '', 'Active', 0, 1, 1, 'fz6riwvDQBihlAPvQPYIe-:APA91bHV1qzcj_8v7BSaVpKX-yn8atqdwOLx12i15-UbbLalpJGjbDMAuJWpMdiNX6jhBEoAYzC_-_59yqj8UkbdfzLMi7qEPjLnhZcwGYxNvuQ50kIwhgYu_YtYkYQF_tz1DMPBKzzq', NULL, NULL, 'none', NULL, '2024-02-22 11:52:37', 'U2324-0000010', NULL, 'CU2324-00000011', NULL, NULL),
(22, 'U2324-0000019', 'CU2324-00000020', 'RPC as Customer', 'RPC', 'as Customer', NULL, NULL, NULL, '123, Rpc area', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000497', 'T2023-00007978', 'CI2023-0115243', 'PC2023-0015242', 'rpctest222@gmail.com', NULL, '$2y$10$2W91y0mPyeZwrylSFypx5ehiIMQKcoT0.93Ryx90O7B6B0C83l03i', '=0TSMRlZHFUVwRTMrx0N1V2dRhVdzR2UJJ3UvwUaWFFdyMnWxokNaNjTTVjR', NULL, 'Customer', 'rpctest222@gmail.com', '9876567899', '', 'Active', 0, 1, 1, NULL, 'google', '111203966542180931774', 'none', '7PhAYqwRs8jOzY5wIzkdxNiNlYWPx5nrFIdFwdmr1k7mNy2zvNPA5NUHIfP6', '2024-03-02 04:55:28', 'U2324-0000019', '2024-03-02 04:58:27', 'CU2324-00000020', NULL, NULL),
(23, 'U2324-0000020', 'V2024-00000020', 'shafi', 'shafi', '', NULL, NULL, NULL, 'babsbs', 'C2020-00000101', 'S2020-00000035', 'DT2023-00000500', 'T2023-00007995', 'CI2023-0115677', 'PC2023-0015327', 'samplebyshafi@gmail.com', NULL, '$2y$10$p6w9B9lCnHFDrBIJF8Y/cOJhUjsAjgZwkV0LI2pdheI8GB2c6asLe', '=0zaVpWY2EmarNlSsZFMvN1dlJ2b150cktiaxFzZsZ3aWdkVwB1QPFDc4gkU', NULL, 'Vendor', 'samplebyshafi@gmail.com', '9876543210', '', 'Active', 0, 1, 1, 'fz6riwvDQBihlAPvQPYIe-:APA91bHV1qzcj_8v7BSaVpKX-yn8atqdwOLx12i15-UbbLalpJGjbDMAuJWpMdiNX6jhBEoAYzC_-_59yqj8UkbdfzLMi7qEPjLnhZcwGYxNvuQ50kIwhgYu_YtYkYQF_tz1DMPBKzzq', NULL, NULL, 'none', NULL, '2024-03-06 04:28:48', 'U2324-0000020', NULL, 'CU2324-00000021', NULL, NULL);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_ad_banners`
--
ALTER TABLE `tbl_ad_banners`
  ADD PRIMARY KEY (`S.No`);

--
-- Indexes for table `tbl_attributes`
--
ALTER TABLE `tbl_attributes`
  ADD PRIMARY KEY (`AttrID`);

--
-- Indexes for table `tbl_attributes_category_mapping`
--
ALTER TABLE `tbl_attributes_category_mapping`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_attributes_details`
--
ALTER TABLE `tbl_attributes_details`
  ADD PRIMARY KEY (`ValueID`);

--
-- Indexes for table `tbl_auto_number`
--
ALTER TABLE `tbl_auto_number`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indexes for table `tbl_company_settings`
--
ALTER TABLE `tbl_company_settings`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_construction_type`
--
ALTER TABLE `tbl_construction_type`
  ADD PRIMARY KEY (`ConTypeID`);

--
-- Indexes for table `tbl_cruds`
--
ALTER TABLE `tbl_cruds`
  ADD PRIMARY KEY (`MID`),
  ADD KEY `MID` (`MID`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `tbl_customer_address`
--
ALTER TABLE `tbl_customer_address`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_customer_cart`
--
ALTER TABLE `tbl_customer_cart`
  ADD PRIMARY KEY (`CartID`);

--
-- Indexes for table `tbl_customer_type`
--
ALTER TABLE `tbl_customer_type`
  ADD PRIMARY KEY (`CusTypeID`);

--
-- Indexes for table `tbl_delivery_locations`
--
ALTER TABLE `tbl_delivery_locations`
  ADD PRIMARY KEY (`S.No`);

--
-- Indexes for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD PRIMARY KEY (`DeptID`);

--
-- Indexes for table `tbl_docnum`
--
ALTER TABLE `tbl_docnum`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_drop_points`
--
ALTER TABLE `tbl_drop_points`
  ADD PRIMARY KEY (`DPID`);

--
-- Indexes for table `tbl_financial_year`
--
ALTER TABLE `tbl_financial_year`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`MID`),
  ADD KEY `MID` (`MID`),
  ADD KEY `Slug` (`Slug`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `tbl_products_attributes`
--
ALTER TABLE `tbl_products_attributes`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_products_gallery`
--
ALTER TABLE `tbl_products_gallery`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `tbl_products_stages`
--
ALTER TABLE `tbl_products_stages`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_products_variation`
--
ALTER TABLE `tbl_products_variation`
  ADD PRIMARY KEY (`VariationID`);

--
-- Indexes for table `tbl_products_variation_details`
--
ALTER TABLE `tbl_products_variation_details`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_products_variation_gallery`
--
ALTER TABLE `tbl_products_variation_gallery`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`PCID`);

--
-- Indexes for table `tbl_product_category_additional`
--
ALTER TABLE `tbl_product_category_additional`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_product_subcategory`
--
ALTER TABLE `tbl_product_subcategory`
  ADD PRIMARY KEY (`PSCID`);

--
-- Indexes for table `tbl_product_subcategory_additional`
--
ALTER TABLE `tbl_product_subcategory_additional`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_quotation`
--
ALTER TABLE `tbl_quotation`
  ADD PRIMARY KEY (`QID`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_socialite_providers`
--
ALTER TABLE `tbl_socialite_providers`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_stock_update`
--
ALTER TABLE `tbl_stock_update`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_support_type`
--
ALTER TABLE `tbl_support_type`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_tax`
--
ALTER TABLE `tbl_tax`
  ADD PRIMARY KEY (`TaxID`);

--
-- Indexes for table `tbl_uom`
--
ALTER TABLE `tbl_uom`
  ADD PRIMARY KEY (`UID`);

--
-- Indexes for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD PRIMARY KEY (`RoleID`),
  ADD KEY `RoleID` (`RoleID`,`CreatedBy`,`UpdatedBy`,`DeletedBy`);

--
-- Indexes for table `tbl_user_theme`
--
ALTER TABLE `tbl_user_theme`
  ADD PRIMARY KEY (`SLNO`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tbl_vendors`
--
ALTER TABLE `tbl_vendors`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indexes for table `tbl_vendors_database`
--
ALTER TABLE `tbl_vendors_database`
  ADD PRIMARY KEY (`S.No`);

--
-- Indexes for table `tbl_vendors_document`
--
ALTER TABLE `tbl_vendors_document`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `tbl_vendors_product_mapping`
--
ALTER TABLE `tbl_vendors_product_mapping`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_vendors_service_locations`
--
ALTER TABLE `tbl_vendors_service_locations`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_vendors_stock_point`
--
ALTER TABLE `tbl_vendors_stock_point`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_vendors_supply`
--
ALTER TABLE `tbl_vendors_supply`
  ADD PRIMARY KEY (`DetailID`);

--
-- Indexes for table `tbl_vendors_vehicle`
--
ALTER TABLE `tbl_vendors_vehicle`
  ADD PRIMARY KEY (`VehicleID`);

--
-- Indexes for table `tbl_vendors_vehicle_images`
--
ALTER TABLE `tbl_vendors_vehicle_images`
  ADD PRIMARY KEY (`SLNo`);

--
-- Indexes for table `tbl_vendor_category`
--
ALTER TABLE `tbl_vendor_category`
  ADD PRIMARY KEY (`VCID`);

--
-- Indexes for table `tbl_vendor_ratings`
--
ALTER TABLE `tbl_vendor_ratings`
  ADD PRIMARY KEY (`S.No`);

--
-- Indexes for table `tbl_vendor_type`
--
ALTER TABLE `tbl_vendor_type`
  ADD PRIMARY KEY (`VendorTypeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_ad_banners`
--
ALTER TABLE `tbl_ad_banners`
  MODIFY `S.No` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_auto_number`
--
ALTER TABLE `tbl_auto_number`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_company_settings`
--
ALTER TABLE `tbl_company_settings`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_customer_cart`
--
ALTER TABLE `tbl_customer_cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `tbl_delivery_locations`
--
ALTER TABLE `tbl_delivery_locations`
  MODIFY `S.No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_socialite_providers`
--
ALTER TABLE `tbl_socialite_providers`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user_theme`
--
ALTER TABLE `tbl_user_theme`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_vendors_database`
--
ALTER TABLE `tbl_vendors_database`
  MODIFY `S.No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
