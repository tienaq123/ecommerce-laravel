-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 16, 2025 lúc 04:19 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `wd-01`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_type` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `display_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Màu sắc', 'radio', NULL, '2024-07-26 03:26:46', NULL),
(2, 'Kích thước', 'radio', NULL, '2024-07-26 03:26:47', '2024-09-16 23:38:20'),
(3, 'Chất liệu', 'radio', '2024-09-15 07:00:38', '2024-07-26 03:26:47', '2024-09-15 07:00:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Đen', NULL, '2024-07-26 03:28:30', NULL),
(2, 1, 'Đỏ', NULL, '2024-07-26 03:28:31', NULL),
(3, 1, 'Trắng', NULL, '2024-07-26 03:28:32', NULL),
(4, 1, 'Hồng', NULL, '2024-07-26 03:28:33', NULL),
(5, 1, 'Xám', NULL, '2024-07-26 03:28:33', NULL),
(6, 1, 'Nâu', NULL, '2024-07-26 03:28:34', NULL),
(7, 1, 'Cam', NULL, '2024-07-26 03:28:34', NULL),
(8, 2, 'S', NULL, '2024-07-26 03:31:40', NULL),
(9, 2, 'M', NULL, '2024-07-26 03:31:40', NULL),
(10, 2, 'L', NULL, '2024-07-26 03:31:41', NULL),
(11, 2, 'XL', NULL, '2024-07-26 03:31:41', NULL),
(12, 2, '2XL', NULL, '2024-07-26 03:31:42', NULL),
(13, 2, '3XL', NULL, '2024-07-26 03:31:42', NULL),
(14, 3, 'Cotton', NULL, '2024-07-26 03:31:43', NULL),
(15, 3, 'Lanh', NULL, '2024-07-26 03:31:44', NULL),
(16, 3, 'Thun', NULL, '2024-07-26 03:31:44', NULL),
(129, 2, '4XL', NULL, '2024-09-18 17:57:19', '2024-09-18 17:57:19'),
(130, 1, 'Xanh', NULL, '2024-09-18 17:57:34', '2024-09-18 17:57:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image_url`, `link`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ưu đãi 30-50', NULL, 'https://m.yodycdn.com/fit-in/filters:format(webp)/fit-in/filters:format(webp)/products/lyzi4evj8szadtp24wq237_HERO%20PC.png', NULL, 1, NULL, '2024-07-26 03:24:23', '2024-08-13 21:30:43'),
(2, 'Hàng mới về', 'Áo thun nữ cổ cao croptop', 'https://m.yodycdn.com/fit-in/filters:format(webp)/fit-in/filters:format(webp)/products/lz0ldn0in7np0xf4g4hero_banner_hang_moi_ve_1920x864.png', NULL, 1, NULL, '2024-07-26 03:24:24', '2024-08-22 21:05:30'),
(3, '10 năm cảm ơn', 'Giảm giá 100k', 'https://m.yodycdn.com/fit-in/filters:format(webp)/fit-in/filters:format(webp)/products/lyzi593msvj2bbvh659237_HERO%20PC%20copy.png', NULL, 1, NULL, '2024-07-26 03:25:16', '2024-08-26 08:48:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ROOT', NULL, NULL, 'Active', '2024-07-26 03:11:40', '2024-07-26 03:11:42', NULL),
(2, 'Nam', 'Danh mục đồ nam', 1, 'Active', '2024-07-26 03:12:45', '2024-07-26 03:12:46', NULL),
(3, 'Nữ', 'Danh mục đồ nữ', 1, 'Active', '2024-07-26 03:13:07', '2024-07-26 03:13:09', NULL),
(4, 'Trẻ em', 'Danh mục trẻ em', 1, 'Active', '2024-07-26 03:17:00', '2024-07-26 03:17:03', NULL),
(5, 'Bộ sưu tập', 'Danh sách các bộ sưu tập', 1, 'Active', '2024-07-26 03:18:09', '2024-08-26 12:33:29', '2024-08-26 12:33:29'),
(6, 'Áo Nam', NULL, 2, 'Active', '2024-07-26 15:19:50', '2024-09-18 18:13:48', '2024-09-18 18:13:48'),
(7, 'Quần Nam', NULL, 2, 'Active', '2024-07-26 15:19:50', NULL, NULL),
(8, 'Đồ Bộ Nam', NULL, 2, 'Active', '2024-07-26 15:19:50', NULL, NULL),
(9, 'Đồ Thể Thao Nam', NULL, 2, 'Active', '2024-07-26 15:19:50', NULL, NULL),
(10, 'Áo polo', NULL, 6, 'Active', '2024-07-26 08:23:29', '2024-07-26 08:23:29', NULL),
(11, 'Áo thun', NULL, 6, 'Active', '2024-07-26 08:28:16', '2024-07-26 08:28:16', NULL),
(12, 'Áo sơ mi', NULL, 6, 'Active', '2024-07-26 08:28:47', '2024-07-26 08:28:47', NULL),
(13, 'Áo chống nắng', NULL, 6, 'Active', '2024-07-26 08:28:55', '2024-07-26 08:28:55', NULL),
(14, 'Áo khoác', NULL, 6, 'Active', '2024-07-26 08:29:03', '2024-07-26 08:29:03', NULL),
(15, 'Áo hoodie - Áo nỉ', NULL, 6, 'Active', '2024-07-26 08:29:11', '2024-07-26 08:29:11', NULL),
(16, 'Quần jeans', NULL, 7, 'Active', '2024-07-26 08:30:02', '2024-07-26 08:30:02', NULL),
(17, 'Quần âu', NULL, 7, 'Active', '2024-07-26 08:30:08', '2024-07-26 08:30:08', NULL),
(18, 'Quần kaki', NULL, 7, 'Active', '2024-07-26 08:30:18', '2024-07-26 08:30:18', NULL),
(19, 'Quần dài', NULL, 7, 'Active', '2024-07-26 08:30:23', '2024-07-26 08:30:23', NULL),
(20, 'Quần short', NULL, 7, 'Active', '2024-07-26 08:30:34', '2024-07-26 08:30:34', NULL),
(21, 'Đồ bộ ngắn tay', NULL, 8, 'Active', '2024-07-26 08:31:07', '2024-07-26 08:31:07', NULL),
(22, 'Đồ bộ dài tay', NULL, 8, 'Active', '2024-07-26 08:31:12', '2024-07-26 08:31:12', NULL),
(23, 'Áo thun thể thao', 'Sub-category for sport t-shirts', 9, 'Active', '2024-07-26 08:40:59', '2024-07-26 08:40:59', NULL),
(24, 'Áo polo thể thao', 'Sub-category for sport polo shirts', 9, 'Active', '2024-07-26 08:40:59', '2024-07-26 08:40:59', NULL),
(25, 'Quần thể thao', 'Sub-category for sport pants', 9, 'Active', '2024-07-26 08:40:59', '2024-07-26 08:40:59', NULL),
(26, 'Bộ thể thao', 'Sub-category for sport suits', 9, 'Active', '2024-07-26 08:40:59', '2024-07-26 08:40:59', NULL),
(28, 'Áo Nữ', 'Sub-category for women\'s shirts', 3, 'Active', '2024-07-26 08:46:00', '2024-07-26 08:46:00', NULL),
(29, 'Quần Nữ', 'Sub-category for women\'s pants', 3, 'Active', '2024-07-26 08:46:00', '2024-07-26 08:46:00', NULL),
(30, 'Bộ Đồ Nữ', 'Sub-category for women\'s suits', 3, 'Active', '2024-07-26 08:46:00', '2024-07-26 08:46:00', NULL),
(31, 'Đồ Thể Thao Nữ', 'Sub-category for women\'s sportswear', 3, 'Active', '2024-07-26 08:46:00', '2024-07-26 08:46:00', NULL),
(32, 'Váy Nữ', 'Sub-category for women\'s dresses', 3, 'Active', '2024-07-26 08:46:00', '2024-07-26 08:46:00', NULL),
(33, 'Áo polo', 'Sub-category for women\'s polo shirts', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(34, 'Áo thun', 'Sub-category for women\'s t-shirts', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(35, 'Áo sơ mi', 'Sub-category for women\'s shirts', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(36, 'Áo chống nắng', 'Sub-category for women\'s sun-protection shirts', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(37, 'Áo khoác', 'Sub-category for women\'s jackets', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(38, 'Áo hoodie - Áo nỉ', 'Sub-category for women\'s hoodies and sweaters', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(39, 'Áo len', 'Sub-category for women\'s knitwear', 28, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(40, 'Quần jeans', 'Sub-category for women\'s jeans', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(41, 'Quần âu', 'Sub-category for women\'s trousers', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(42, 'Quần kaki', 'Sub-category for women\'s khakis', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(43, 'Quần dài', 'Sub-category for women\'s long pants', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(44, 'Quần short', 'Sub-category for women\'s shorts', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(45, 'Quần nỉ nữ', 'Sub-category for women\'s sweatpants', 29, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(46, 'Đồ bộ ngắn tay', 'Sub-category for women\'s short sleeve suits', 30, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(47, 'Đồ bộ dài tay', 'Sub-category for women\'s long sleeve suits', 30, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(48, 'Áo polo thể thao', 'Sub-category for women\'s sports polo shirts', 31, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(49, 'Quần thể thao', 'Sub-category for women\'s sports pants', 31, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(50, 'Bộ thể thao', 'Sub-category for women\'s sports suits', 31, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(51, 'Đầm', 'Sub-category for women\'s dresses', 32, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(52, 'Chân váy', 'Sub-category for women\'s skirts', 32, 'Active', '2024-07-26 08:51:52', '2024-07-26 08:51:52', NULL),
(53, 'Áo Trẻ Em', 'Sub-category for children\'s shirts', 4, 'Active', '2024-07-26 08:56:08', '2024-07-26 08:56:08', NULL),
(54, 'Quần Trẻ Em', 'Sub-category for children\'s pants', 4, 'Active', '2024-07-26 08:56:08', '2024-07-26 08:56:08', NULL),
(55, 'Bộ Đồ Trẻ Em', 'Sub-category for children\'s suits', 4, 'Active', '2024-07-26 08:56:08', '2024-07-26 08:56:08', NULL),
(56, 'Đầm - Chân Váy Trẻ Em', 'Sub-category for children\'s dresses and skirts', 4, 'Active', '2024-07-26 08:56:08', '2024-07-26 08:56:08', NULL),
(57, 'Áo polo', 'Sub-category for children\'s polo shirts', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(58, 'Áo thun', 'Sub-category for children\'s t-shirts', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(59, 'Áo sơ mi', 'Sub-category for children\'s shirts', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(60, 'Áo khoác', 'Sub-category for children\'s jackets', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(61, 'Áo hoodie - Áo nỉ', 'Sub-category for children\'s hoodies and sweaters', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(62, 'Áo len', 'Sub-category for children\'s knitwear', 53, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(63, 'Quần jeans', 'Sub-category for children\'s jeans', 54, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(64, 'Quần kaki', 'Sub-category for children\'s khakis', 54, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(65, 'Quần dài', 'Sub-category for children\'s long pants', 54, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(66, 'Quần short', 'Sub-category for children\'s shorts', 54, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(67, 'Quần nỉ', 'Sub-category for children\'s sweatpants', 54, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(68, 'Đồ bộ ngắn tay', 'Sub-category for children\'s short sleeve suits', 55, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(69, 'Đồ bộ dài tay', 'Sub-category for children\'s long sleeve suits', 55, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(70, 'Đầm', 'Sub-category for children\'s dresses', 56, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(71, 'Chân váy', 'Sub-category for children\'s skirts', 56, 'Active', '2024-07-26 08:59:54', '2024-07-26 08:59:54', NULL),
(72, 'Summer 2024', 'Sub-category for collection', 5, 'Active', '2024-07-26 09:03:02', '2024-07-26 09:03:02', NULL),
(73, 'Emma Sport', 'Sub-category for collection', 5, 'Active', '2024-07-26 09:03:02', '2024-07-26 09:03:02', NULL),
(74, 'Beach Emma', 'Sub-category for collection', 5, 'Active', '2024-07-26 09:03:02', '2024-07-26 09:03:02', NULL),
(75, 'Danh mục mới', 'Desc', 7, 'Active', '2024-09-18 17:53:53', '2024-09-18 17:53:53', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `expiration_date` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `expiration_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'NEWSSS', 35.00, '2024-09-21', 'unactive', NULL, '2024-09-18 09:12:04', '2024-09-22 20:24:45'),
(4, 'SNRSHX', 50.00, '2024-09-24', 'unactive', NULL, '2024-09-18 13:07:22', '2024-12-17 23:25:19'),
(6, 'BNUFWN', 15.00, '2024-09-21', 'unactive', NULL, '2024-09-18 16:43:37', '2024-09-22 20:24:45'),
(7, 'LPFUUW', 25.00, '2024-09-23', 'unactive', NULL, '2024-09-18 17:56:13', '2024-09-22 20:24:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `guest_orders`
--

CREATE TABLE `guest_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address_detail` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_points`
--

CREATE TABLE `history_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `point_id` bigint(20) UNSIGNED NOT NULL,
  `point_use` int(11) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(76, '2024_07_11_040158_add_deleted_at_to_variant_attributes_table', 2),
(81, '2014_10_12_100000_create_password_reset_tokens_table', 3),
(82, '2019_08_19_000000_create_failed_jobs_table', 3),
(83, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(84, '2024_05_26_143205_create_sclasses_table', 3),
(85, '2024_06_19_034238_create_users_table', 3),
(86, '2024_06_19_034339_create_categories_table', 3),
(87, '2024_06_19_034340_create_brands_table', 3),
(88, '2024_06_19_034341_create_attributes_table', 3),
(89, '2024_06_19_034342_create_attribute_values_table', 3),
(90, '2024_06_19_034342_create_products_table', 3),
(91, '2024_06_19_034343_create_product_images_table', 3),
(92, '2024_06_19_034344_create_product_attributes_table', 3),
(93, '2024_06_19_034345_create_product_variants_table', 3),
(94, '2024_06_19_034346_create_variant_attributes_table', 3),
(95, '2024_06_19_034347_create_reviews_table', 3),
(96, '2024_06_19_034348_create_wishlists_table', 3),
(97, '2024_06_19_034349_create_coupons_table', 3),
(98, '2024_06_19_034350_create_order_status_table', 3),
(99, '2024_06_19_034351_create_orders_table', 3),
(100, '2024_06_19_034352_create_order_items_table', 3),
(101, '2024_06_19_034353_create_order_history_table', 3),
(102, '2024_06_19_034354_create_shipping_methods_table', 3),
(103, '2024_06_19_034355_create_points_table', 3),
(104, '2024_06_19_034356_create_history_points_table', 3),
(105, '2024_06_19_044855_create_banners_table', 3),
(106, '2024_07_11_040424_add_id_to_variant_attributes_table', 3),
(107, '2024_07_23_090350_add_role_to_users_table', 3),
(108, '2024_07_24_065608_add_address_and_payment_columns_to_orders_table', 3),
(109, '2024_07_24_065718_create_guest_orders_table', 3),
(110, '2024_07_26_151432_add_delete_at_columns_to_variant_attributes_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `address_detail` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status_id`, `deleted_at`, `created_at`, `updated_at`, `shipping_method`, `payment`, `address_detail`, `ward`, `district`, `city`) VALUES
(69, 3, 3607800.00, 4, NULL, '2024-09-18 14:48:39', '2024-09-18 14:56:33', 'Tiêu chuẩn', 'COD', 'hà Nội', 'Hương Sơn', 'Lạng Giang', 'Bắc Giang'),
(70, 3, 2842000.00, 1, NULL, '2024-09-18 14:57:37', '2024-09-18 14:59:34', 'Tiêu chuẩn', 'COD', 'Cao sơn', 'Cao Sơn', 'Bạch Thông', 'Bắc Kạn'),
(71, 5, 3031350.00, 2, NULL, '2024-09-18 15:00:38', '2024-09-18 15:06:41', 'Tiêu chuẩn', 'online_card', 'Poly', 'Mỹ Đình 1', 'Nam Từ Liêm', 'Hà Nội'),
(72, 5, 1341000.00, 2, NULL, '2024-09-18 15:03:47', '2024-09-18 17:52:51', 'Tiêu chuẩn', 'online_card', 'SVĐ Mỹ Đình', 'Mỹ Đình 1', 'Nam Từ Liêm', 'Hà Nội'),
(73, 5, 0.00, 6, NULL, '2024-09-18 16:38:32', '2024-09-18 16:38:43', NULL, NULL, NULL, NULL, NULL, NULL),
(74, 3, 1518000.00, 2, NULL, '2024-09-18 17:15:17', '2024-09-18 17:52:41', 'Tiêu chuẩn', 'COD', 'Địa chỉ', 'Láng Tròn', 'Giá Rai', 'Bạc Liêu'),
(75, 3, 691500.00, 4, NULL, '2024-09-18 17:45:35', '2024-09-18 17:52:19', 'Tiêu chuẩn', 'COD', 'Địa chỉ', 'Châu Minh', 'Hiệp Hòa', 'Bắc Giang'),
(76, 3, 619000.00, 5, NULL, '2024-09-18 17:48:42', '2024-09-18 17:50:26', 'Tiêu chuẩn', 'online_card', 'abc', 'Bình Ba', 'Châu Đức', 'Bà Rịa - Vũng Tàu'),
(77, 3, 319999.00, 5, NULL, '2024-09-18 17:56:37', '2024-09-18 18:19:35', 'Tiêu chuẩn', 'COD', 'dsdw', 'Hoà Long', 'Bà Rịa', 'Bà Rịa - Vũng Tàu'),
(78, 3, 919997.00, 1, NULL, '2024-09-22 20:26:48', '2024-09-22 20:29:55', 'Tiêu chuẩn', 'COD', 'ABC', 'Dương Đức', 'Lạng Giang', 'Bắc Giang'),
(79, 3, 619998.00, 1, NULL, '2024-09-22 20:43:29', '2024-09-23 00:33:51', 'Tiêu chuẩn', 'COD', 'fghh', 'Bình Ba', 'Châu Đức', 'Bà Rịa - Vũng Tàu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_history`
--

CREATE TABLE `order_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(144, 69, 35, 489, 4, 989000.00, NULL, '2024-09-18 14:54:05', '2024-09-18 14:54:05'),
(145, 69, 36, 501, 2, 599000.00, NULL, '2024-09-18 14:54:24', '2024-09-18 14:54:24'),
(146, 70, 81, 831, 3, 250000.00, NULL, '2024-09-18 14:57:37', '2024-09-18 14:58:09'),
(147, 70, 78, 813, 2, 413000.00, NULL, '2024-09-18 14:57:49', '2024-09-18 14:57:49'),
(148, 70, 77, 803, 3, 422000.00, NULL, '2024-09-18 14:58:03', '2024-09-18 14:58:55'),
(149, 71, 33, 457, 2, 369000.00, NULL, '2024-09-18 15:00:38', '2024-09-18 15:00:38'),
(150, 71, 33, 467, 2, 369000.00, NULL, '2024-09-18 15:00:41', '2024-09-18 15:00:41'),
(151, 71, 33, 472, 3, 369000.00, NULL, '2024-09-18 15:00:44', '2024-09-18 15:00:44'),
(152, 71, 32, 453, 4, 349500.00, NULL, '2024-09-18 15:01:04', '2024-09-18 15:01:04'),
(153, 71, 32, 454, 1, 349500.00, NULL, '2024-09-18 15:01:12', '2024-09-18 15:01:12'),
(156, 72, 30, 444, 5, 149000.00, NULL, '2024-09-18 15:03:50', '2024-09-18 15:04:32'),
(158, 72, 30, 439, 2, 149000.00, NULL, '2024-09-18 15:04:13', '2024-09-18 15:04:28'),
(161, 72, 30, 445, 1, 149000.00, NULL, '2024-09-18 15:04:24', '2024-09-18 15:04:24'),
(162, 72, 30, 440, 1, 149000.00, NULL, '2024-09-18 15:04:30', '2024-09-18 15:04:30'),
(167, 74, 78, 812, 3, 413000.00, NULL, '2024-09-18 17:15:30', '2024-09-18 17:16:32'),
(168, 74, 36, 501, 3, 599000.00, NULL, '2024-09-18 17:16:02', '2024-09-18 17:16:13'),
(169, 75, 77, 806, 2, 422000.00, NULL, '2024-09-18 17:45:35', '2024-09-18 17:47:04'),
(171, 75, 79, 816, 1, 539000.00, NULL, '2024-09-18 17:46:31', '2024-09-18 17:46:31'),
(172, 76, 36, 501, 1, 599000.00, NULL, '2024-09-18 17:48:42', '2024-09-18 17:48:42'),
(173, 77, 22, 334, 1, 299999.00, NULL, '2024-09-18 17:56:37', '2024-09-18 17:56:37'),
(174, 78, 23, 361, 3, 299999.00, NULL, '2024-09-22 20:26:48', '2024-09-22 20:27:09'),
(176, 79, 22, 334, 2, 299999.00, NULL, '2024-09-23 00:33:31', '2024-09-23 00:33:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, 'Active', NULL, '2024-07-26 03:33:26', NULL),
(2, 'Confirmed', NULL, 'Active', NULL, '2024-07-26 03:35:58', NULL),
(3, 'Shipped', NULL, 'Active', NULL, '2024-07-26 03:35:59', NULL),
(4, 'Delivered', NULL, 'Active', NULL, '2024-07-26 03:36:00', NULL),
(5, 'Cancelled', NULL, 'Active', NULL, '2024-07-26 03:36:01', NULL),
(6, 'Cart', 'Cart', 'Active', NULL, '2024-09-16 04:22:36', '2024-09-16 04:23:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API token', 'dc38f2c3ddb8521a29115b7d6fb1f35924103ec726a441abe99e6ea0e5fff539', '[\"*\"]', '2024-08-06 19:31:01', NULL, '2024-07-25 21:38:46', '2024-08-06 19:31:01'),
(2, 'App\\Models\\User', 1, 'API token', '3ff3e88125141ac23fa7ac8dce287f9e15fe27377f2aeede46698f9c7d1e0780', '[\"*\"]', NULL, NULL, '2024-07-26 09:18:18', '2024-07-26 09:18:18'),
(3, 'App\\Models\\User', 1, 'API token', '92877b3155448cbf13a90cb8a99e7c90a81145ce06d4bdee8a70808ea3c987cc', '[\"*\"]', NULL, NULL, '2024-07-26 09:18:21', '2024-07-26 09:18:21'),
(4, 'App\\Models\\User', 1, 'API token', 'afa3ae1c10fd8b9d22a280dd9a2a2389b3c44401bfc8202b4ebd68a2b56668b8', '[\"*\"]', NULL, NULL, '2024-08-06 19:26:28', '2024-08-06 19:26:28'),
(5, 'App\\Models\\User', 1, 'API token', 'bbf9cc577d3a087873afc055519f30c15c50ae5669719876f70814bb78b97731', '[\"*\"]', '2024-08-24 00:10:28', NULL, '2024-08-06 19:28:55', '2024-08-24 00:10:28'),
(6, 'App\\Models\\User', 1, 'API token', '041c3a00be3b7fd6f62f6cab40eedec407726f6e44aedc725a042faabb797c3b', '[\"*\"]', '2024-08-11 21:32:30', NULL, '2024-08-06 19:35:26', '2024-08-11 21:32:30'),
(7, 'App\\Models\\User', 1, 'API token', '49d460609d3734b2cedb487622a2d5a01c25c8380b6dd5d5c0da089c463fc00c', '[\"*\"]', '2024-08-11 20:50:28', NULL, '2024-08-08 22:14:10', '2024-08-11 20:50:28'),
(8, 'App\\Models\\User', 1, 'API token', '1869140969bee9efb33d4f7280738df491924272d15219aabce341b2dc07921d', '[\"*\"]', '2024-08-24 19:49:34', NULL, '2024-08-08 23:49:06', '2024-08-24 19:49:34'),
(9, 'App\\Models\\User', 1, 'API token', 'e7e7411e8e1b3f4a06067a4e6990a06ef61ccd288ac5a715dadddb5f26f28607', '[\"*\"]', '2024-08-11 21:29:14', NULL, '2024-08-11 20:50:58', '2024-08-11 21:29:14'),
(10, 'App\\Models\\User', 1, 'API token', '3a3790e270dbabff0f91fe15418149ec10b374681d4dd2aca1b7679f2ebc15c0', '[\"*\"]', '2024-08-11 21:30:09', NULL, '2024-08-11 21:29:45', '2024-08-11 21:30:09'),
(11, 'App\\Models\\User', 1, 'API token', 'b999fdde97835d80afea9816852369be7feab84706c259daa431e7be88b17a24', '[\"*\"]', '2024-08-16 01:22:25', NULL, '2024-08-11 21:32:55', '2024-08-16 01:22:25'),
(12, 'App\\Models\\User', 1, 'API token', '1d3e2a28faf895177ac98a2696c4bbc6a2287d4faef7dce4e64694918414875a', '[\"*\"]', '2024-08-16 01:54:15', NULL, '2024-08-16 01:54:14', '2024-08-16 01:54:15'),
(13, 'App\\Models\\User', 1, 'API token', 'a393f11987cbd8f8b7dd55156a981e1b9791bb51a206296e5c587eb587577cec', '[\"*\"]', '2024-08-16 01:54:18', NULL, '2024-08-16 01:54:17', '2024-08-16 01:54:18'),
(14, 'App\\Models\\User', 1, 'API token', 'fdb59fbac9694753cbd8277bd7c5ccccf29a306d46b4024829d91a02b7e0f67a', '[\"*\"]', '2024-08-16 01:55:52', NULL, '2024-08-16 01:55:51', '2024-08-16 01:55:52'),
(15, 'App\\Models\\User', 1, 'API token', '56908de4e5539add2aaf632b2b29fad649cb309ff1879afcba3cad6fd45d56be', '[\"*\"]', '2024-08-18 23:46:50', NULL, '2024-08-16 01:58:34', '2024-08-18 23:46:50'),
(16, 'App\\Models\\User', 1, 'API token', '297abc0d99a33bbd6930902c1674549882a0e4fed215db9bde61caf6182f4085', '[\"*\"]', '2024-08-22 21:04:28', NULL, '2024-08-18 23:48:29', '2024-08-22 21:04:28'),
(17, 'App\\Models\\User', 1, 'API token', '1a2fbb0b4ae03bbdf5e74229890714fbf116d689ac62efc40992cc68f70e5e72', '[\"*\"]', '2024-08-23 00:51:34', NULL, '2024-08-22 21:11:12', '2024-08-23 00:51:34'),
(18, 'App\\Models\\User', 1, 'API token', 'b3afb4cc220c1ee97dade97f5bfb6f193619d9d39a6192b2915d751c81a57dee', '[\"*\"]', '2024-08-25 10:00:42', NULL, '2024-08-25 07:56:12', '2024-08-25 10:00:42'),
(19, 'App\\Models\\User', 1, 'API token', 'd55233961627e7e3086c447e0028ea9b9231d0e1a4139e69e5408a78669f6924', '[\"*\"]', '2024-08-25 08:00:30', NULL, '2024-08-25 07:57:22', '2024-08-25 08:00:30'),
(20, 'App\\Models\\User', 1, 'API token', '9609093c03631240fd9d9553aec98822403572b43b52c9948f157ce11ed04874', '[\"*\"]', '2024-08-25 10:32:16', NULL, '2024-08-25 08:04:36', '2024-08-25 10:32:16'),
(21, 'App\\Models\\User', 1, 'API token', 'ce3865855d6cc5539aa434b4cf04845fac29fa0206eedf5d8abecf672289bf29', '[\"*\"]', '2024-08-25 12:30:45', NULL, '2024-08-25 11:15:26', '2024-08-25 12:30:45'),
(22, 'App\\Models\\User', 1, 'API token', 'e41f2d1bf42d7a3a2c38c84acebc8e85c98a4ef53513906a41603169cf4d2c45', '[\"*\"]', '2024-08-25 22:43:33', NULL, '2024-08-25 22:41:27', '2024-08-25 22:43:33'),
(23, 'App\\Models\\User', 1, 'API token', 'c5aff0117cfe00ee9762aac0be0c565428d4c3e8e331e55dbf45fd8247c61662', '[\"*\"]', '2024-08-25 23:29:41', NULL, '2024-08-25 23:29:25', '2024-08-25 23:29:41'),
(24, 'App\\Models\\User', 1, 'API token', '3bf9853d48509dbec88886ed5146829c4630d7e435f22bb7524dd7c2d084278c', '[\"*\"]', '2024-08-25 23:30:49', NULL, '2024-08-25 23:30:20', '2024-08-25 23:30:49'),
(25, 'App\\Models\\User', 1, 'API token', '125321a547104616b9bcc00c7181e8f0ab2f2454b11904909f8a7c5030c7a1eb', '[\"*\"]', '2024-08-25 23:35:52', NULL, '2024-08-25 23:35:19', '2024-08-25 23:35:52'),
(26, 'App\\Models\\User', 1, 'API token', '24a3e3f989780832f63f913e33a00c3c73a4a6e28ea0fc4b4efa9ff14d1fea2d', '[\"*\"]', '2024-08-26 01:42:57', NULL, '2024-08-26 01:42:09', '2024-08-26 01:42:57'),
(27, 'App\\Models\\User', 1, 'API token', '5268e951f5d0d9feec7fda8bc39a7a049c6fb7c5348033dbc8678b64587aadf1', '[\"*\"]', '2024-08-26 01:44:41', NULL, '2024-08-26 01:43:45', '2024-08-26 01:44:41'),
(28, 'App\\Models\\User', 1, 'API token', '582dfaadcaecd82dc37ad94e5893b93dc230ce12df6642e9bd198b53bce5cdae', '[\"*\"]', '2024-08-26 01:45:56', NULL, '2024-08-26 01:45:39', '2024-08-26 01:45:56'),
(29, 'App\\Models\\User', 1, 'API token', '642e54370f25cff42bee1604e85ddc7a645bb0f6201df654d81e8b8ab62e86a9', '[\"*\"]', '2024-08-26 01:50:40', NULL, '2024-08-26 01:50:33', '2024-08-26 01:50:40'),
(30, 'App\\Models\\User', 1, 'API token', '317e90f41ac9584330ab7e00605621c8c8b7f403a06d1532c47d14c9e499e0ca', '[\"*\"]', '2024-08-26 01:51:51', NULL, '2024-08-26 01:51:40', '2024-08-26 01:51:51'),
(31, 'App\\Models\\User', 1, 'API token', 'bffadf07a4eee234beefa4be8e6bab8f6588b22aefe520ba54d085bd6dc79c68', '[\"*\"]', '2024-08-26 02:35:56', NULL, '2024-08-26 02:35:43', '2024-08-26 02:35:56'),
(32, 'App\\Models\\User', 1, 'API token', '262c96bb8338739342f42e64acc8eb87b937b2114cdc1383a5634154e803bbe9', '[\"*\"]', '2024-08-26 02:37:31', NULL, '2024-08-26 02:37:03', '2024-08-26 02:37:31'),
(33, 'App\\Models\\User', 1, 'API token', 'a6970b48a439eb1e7f7c1d7026369826c6c0c2a994971524f0e53da192803e6c', '[\"*\"]', '2024-08-26 02:38:19', NULL, '2024-08-26 02:38:09', '2024-08-26 02:38:19'),
(34, 'App\\Models\\User', 1, 'API token', '1475df2c08107c084b25ea551c2ed8c7c85faf1adc5592d942a486e47c438543', '[\"*\"]', '2024-08-26 02:39:06', NULL, '2024-08-26 02:38:54', '2024-08-26 02:39:06'),
(35, 'App\\Models\\User', 1, 'API token', '6d3e2cd07cc938833c5341ab3db44fe6232475275ecfd228451840f0c83204ad', '[\"*\"]', '2024-08-26 02:41:01', NULL, '2024-08-26 02:40:34', '2024-08-26 02:41:01'),
(36, 'App\\Models\\User', 1, 'API token', 'aae099df18d30b3e76066ad5243a012463a492f0f27ba8c54491025f44125f21', '[\"*\"]', '2024-08-26 02:44:05', NULL, '2024-08-26 02:44:03', '2024-08-26 02:44:05'),
(37, 'App\\Models\\User', 1, 'API token', '92204baff02fa387a91ddb51a1582a1dce5d411d741532728ad7013a5e3ddf90', '[\"*\"]', '2024-08-26 08:40:03', NULL, '2024-08-26 08:22:31', '2024-08-26 08:40:03'),
(38, 'App\\Models\\User', 1, 'API token', '35f16a3ee8dc9a3820f6d84d12043edbf7680fa927ce60c03144b3258ffc3890', '[\"*\"]', '2024-08-26 08:45:21', NULL, '2024-08-26 08:31:44', '2024-08-26 08:45:21'),
(39, 'App\\Models\\User', 1, 'API token', '4a9f3ca2abdac33807e35ba8880e9b99e7f2562ddbb17288732487007c142c5c', '[\"*\"]', '2024-08-26 08:58:45', NULL, '2024-08-26 08:50:47', '2024-08-26 08:58:45'),
(40, 'App\\Models\\User', 2, 'tienuser', 'b2d157f9eeb447d9e0f78a024cd92394f232cf998f5f1d1b3fa10e87eea5aff0', '[\"*\"]', '2024-08-26 09:14:42', NULL, '2024-08-26 09:11:22', '2024-08-26 09:14:42'),
(41, 'App\\Models\\User', 2, 'API token', 'ca4ee002fce5a81c02a417511295ba32afbe613556bff32a9aa8e35525d24772', '[\"*\"]', '2024-08-26 09:26:12', NULL, '2024-08-26 09:18:54', '2024-08-26 09:26:12'),
(42, 'App\\Models\\User', 1, 'API token', 'a66dd05246b8f8aa14e92f4521f0e685a572d4275e842b667960c1f2a3a39b77', '[\"*\"]', NULL, NULL, '2024-08-26 09:27:21', '2024-08-26 09:27:21'),
(43, 'App\\Models\\User', 1, 'API token', '0b707d48d62de62532a727baf9c51f301d845a07bf54ee384a33cf26f1fb089b', '[\"*\"]', '2024-08-26 09:38:02', NULL, '2024-08-26 09:28:02', '2024-08-26 09:38:02'),
(44, 'App\\Models\\User', 2, 'API token', 'db9b47391783753900b9aad40fc307e10a8d04c1b1c08e96fd5401844c2d2362', '[\"*\"]', '2024-08-26 09:44:40', NULL, '2024-08-26 09:39:37', '2024-08-26 09:44:40'),
(45, 'App\\Models\\User', 2, 'API token', 'f07c76253a6312c001beeb3fb5590056d4dc1520993ebfddf602e9ff5b0f02de', '[\"*\"]', NULL, NULL, '2024-08-26 09:45:24', '2024-08-26 09:45:24'),
(46, 'App\\Models\\User', 1, 'API token', '677ec2264f3b8b9ced23227f8e9dc064ac55dab375eba942c4e259e861981e5f', '[\"*\"]', '2024-08-26 09:46:56', NULL, '2024-08-26 09:45:39', '2024-08-26 09:46:56'),
(47, 'App\\Models\\User', 1, 'API token', '869438e24039843f51e5d2c2cafec0db11e1d81bcba99676ecdfc9a59067d34f', '[\"*\"]', NULL, NULL, '2024-08-26 09:52:17', '2024-08-26 09:52:17'),
(48, 'App\\Models\\User', 3, 'Customer', '84d7565c181cc0628b768c692af3f62ee76490cdfa92a0e7f392b090df15635c', '[\"*\"]', NULL, NULL, '2024-08-26 13:09:32', '2024-08-26 13:09:32'),
(49, 'App\\Models\\User', 4, 'AdminRole', '477b431212babb913074d346d14c3a949f40773f64b3e28f8b25b2e447f6770b', '[\"*\"]', NULL, NULL, '2024-08-26 13:13:24', '2024-08-26 13:13:24'),
(50, 'App\\Models\\User', 4, 'API token', '070db9d697e29a82912bf9837c2f2d632b08388490839c456299430615baa0f9', '[\"*\"]', '2024-08-26 13:18:30', NULL, '2024-08-26 13:14:24', '2024-08-26 13:18:30'),
(51, 'App\\Models\\User', 3, 'API token', '775582a1b72b9ebea2145825cf55cbbe274fd796ba1555df83503dcbadf079b6', '[\"*\"]', '2024-08-26 15:06:34', NULL, '2024-08-26 13:18:51', '2024-08-26 15:06:34'),
(52, 'App\\Models\\User', 4, 'API token', 'f703c77a32a26e1abc488e07585a652e0ce7e86c146b7c57e1bf2de68652ffe3', '[\"*\"]', '2024-08-26 17:18:12', NULL, '2024-08-26 15:07:10', '2024-08-26 17:18:12'),
(53, 'App\\Models\\User', 3, 'API token', '9119d23d30be494ff12ec4416634038d9432dbe59b6e6ef61c4c112984322f43', '[\"*\"]', '2024-08-26 17:19:00', NULL, '2024-08-26 17:18:33', '2024-08-26 17:19:00'),
(54, 'App\\Models\\User', 4, 'API token', '507624645babf3904ff47ae4420cbfd1e7b68c223cfa4d7c51d9d468357b27d0', '[\"*\"]', NULL, NULL, '2024-08-26 17:24:17', '2024-08-26 17:24:17'),
(55, 'App\\Models\\User', 3, 'API token', '9d3a15d2dc8f948393a1f332e45929bc8957d8b02e23955d7c509cdc644ce452', '[\"*\"]', '2024-08-26 18:04:23', NULL, '2024-08-26 17:53:04', '2024-08-26 18:04:23'),
(56, 'App\\Models\\User', 4, 'API token', '60cffce06efac069b8c0ba882e1aee57df9de7146639979002d3e655fa12775a', '[\"*\"]', '2024-08-26 17:59:14', NULL, '2024-08-26 17:58:23', '2024-08-26 17:59:14'),
(57, 'App\\Models\\User', 4, 'API token', '194bfa1aea80ac34efd84a2b5790a192dc132bd78bc2faa7a92f0f4ff120f3be', '[\"*\"]', '2024-08-26 19:58:01', NULL, '2024-08-26 18:05:06', '2024-08-26 19:58:01'),
(58, 'App\\Models\\User', 3, 'API token', '7aed7b1d91b54651cb75c9b331c1db948c1fe5fba1a0b416646c70209fbdd59c', '[\"*\"]', '2024-09-05 00:34:28', NULL, '2024-09-05 00:26:42', '2024-09-05 00:34:28'),
(59, 'App\\Models\\User', 3, 'API token', '417537275cba6dfc6b3f4c9a585b95fc90f1a088793939d8abfbf47601e10075', '[\"*\"]', '2024-09-05 01:13:41', NULL, '2024-09-05 00:56:42', '2024-09-05 01:13:41'),
(60, 'App\\Models\\User', 3, 'API token', '364d0089670d14d5bc62382ff54f4105db183e9d875f38c1921b376a366ccfab', '[\"*\"]', '2024-09-05 01:21:42', NULL, '2024-09-05 01:18:14', '2024-09-05 01:21:42'),
(61, 'App\\Models\\User', 3, 'API token', 'e3c5594d3c41c268300b133d51d0cd6a1122cd368420fa1d48c3ca0e2d2b903c', '[\"*\"]', '2024-09-05 01:23:31', NULL, '2024-09-05 01:23:04', '2024-09-05 01:23:31'),
(62, 'App\\Models\\User', 3, 'API token', '0eee14da189fb607502693483f6a2246084dd59e527ee5da2ed11735f2293557', '[\"*\"]', '2024-09-05 01:35:11', NULL, '2024-09-05 01:28:33', '2024-09-05 01:35:11'),
(63, 'App\\Models\\User', 3, 'API token', '43152f994e4d9a4facb20aae744f403717ab1e3888ce30f1878f390f6d4efebf', '[\"*\"]', '2024-09-05 01:45:11', NULL, '2024-09-05 01:35:37', '2024-09-05 01:45:11'),
(64, 'App\\Models\\User', 3, 'API token', '6b63910990b3579f580a86a0647390be9b6249013b123904823859fb5edd689d', '[\"*\"]', '2024-09-05 01:48:19', NULL, '2024-09-05 01:47:51', '2024-09-05 01:48:19'),
(65, 'App\\Models\\User', 3, 'API token', 'cb49e378f8f08c1b57c3d4745a66c175c7593db4ec28e1489b516ad5bcd1320f', '[\"*\"]', '2024-09-05 02:05:44', NULL, '2024-09-05 01:53:21', '2024-09-05 02:05:44'),
(66, 'App\\Models\\User', 3, 'API token', '32c7b56fc1217e44615336739c83b8b5a4927614f9fba7c6b502d106afbfa55d', '[\"*\"]', '2024-09-10 21:20:25', NULL, '2024-09-10 19:52:07', '2024-09-10 21:20:25'),
(67, 'App\\Models\\User', 3, 'API token', 'b5f09270e20583577e1e8ac50218f523c84e90512a98a1d65a382d793f210765', '[\"*\"]', '2024-09-10 20:54:39', NULL, '2024-09-10 19:57:41', '2024-09-10 20:54:39'),
(68, 'App\\Models\\User', 4, 'API token', 'cfee744f53509d27f967efab8f63f68636e65cf034548462065ec5a35ccb5ea0', '[\"*\"]', '2024-09-10 21:53:27', NULL, '2024-09-10 21:50:21', '2024-09-10 21:53:27'),
(69, 'App\\Models\\User', 4, 'API token', '60e3da7f6e96cb27b1fba71a85f7e25db42fb260a47a59d5aca01016680cb8d8', '[\"*\"]', NULL, NULL, '2024-09-10 21:50:51', '2024-09-10 21:50:51'),
(70, 'App\\Models\\User', 3, 'API token', '93901e3173c398fbddf55489027b4861ced0560427c96be1002a1f4f5222c7d0', '[\"*\"]', '2024-09-10 23:23:27', NULL, '2024-09-10 23:23:26', '2024-09-10 23:23:27'),
(71, 'App\\Models\\User', 3, 'API token', '7d907e689a54d1acfa5392d65c764b3248b4df46e479e33742c6a2d9995d32ee', '[\"*\"]', '2024-09-10 23:26:25', NULL, '2024-09-10 23:24:18', '2024-09-10 23:26:25'),
(72, 'App\\Models\\User', 3, 'API token', '6cd4bc7495ae5e9c2cce407fb44408a826407fb83a9386e5efe098ba06ec4d50', '[\"*\"]', '2024-09-11 01:47:43', NULL, '2024-09-10 23:29:10', '2024-09-11 01:47:43'),
(73, 'App\\Models\\User', 4, 'API token', 'df8ed44238acb932bcb0826fa19ccdbbb442e383f13676d7bce22aed6c3e8c9d', '[\"*\"]', NULL, NULL, '2024-09-11 02:03:20', '2024-09-11 02:03:20'),
(74, 'App\\Models\\User', 3, 'API token', '1e6b2e21196011af3050d6583367996e5480b22674b7ec56eae42a25a5ad5d47', '[\"*\"]', '2024-09-11 07:41:55', NULL, '2024-09-11 07:37:11', '2024-09-11 07:41:55'),
(75, 'App\\Models\\User', 3, 'API token', '2100f481182f8396f61b5b9b3d32b8918462bc22296429ba7a77e3952b0d4cf5', '[\"*\"]', '2024-09-15 06:34:07', NULL, '2024-09-15 06:29:57', '2024-09-15 06:34:07'),
(76, 'App\\Models\\User', 3, 'API token', '600e05944493abc7cddfd3ff66d90743191b163c27125200042b2b1b086c0d20', '[\"*\"]', '2024-09-15 06:36:29', NULL, '2024-09-15 06:34:41', '2024-09-15 06:36:29'),
(77, 'App\\Models\\User', 4, 'API token', '7e98c5380f9d90af391080d03f9258efe2d8e1f519d0ecbe96a25161d6a13665', '[\"*\"]', NULL, NULL, '2024-09-15 06:59:21', '2024-09-15 06:59:21'),
(78, 'App\\Models\\User', 3, 'API token', '43ccd99bb890fce5aed1a98fb0782dcee40881c520cd93f710bff5219bf25b2f', '[\"*\"]', '2024-09-15 09:00:48', NULL, '2024-09-15 07:10:03', '2024-09-15 09:00:48'),
(79, 'App\\Models\\User', 3, 'API token', '4444bcbba5e7dae44bf770c5719740fdc0fb17225066fad0da06218dabf8a71d', '[\"*\"]', '2024-09-15 19:50:36', NULL, '2024-09-15 19:42:57', '2024-09-15 19:50:36'),
(80, 'App\\Models\\User', 3, 'API token', '75fafee7aabeef3c3186ceca6b0f9e870c67e31f7e33b67bc98a3b0a29be02c1', '[\"*\"]', '2024-09-15 21:37:59', NULL, '2024-09-15 19:50:57', '2024-09-15 21:37:59'),
(81, 'App\\Models\\User', 3, 'API token', 'bb37987511edb8ff9dd6fe91623751b1e66df5e9f9de0ea79df0929a61d8d3ba', '[\"*\"]', '2024-09-15 20:04:54', NULL, '2024-09-15 20:04:42', '2024-09-15 20:04:54'),
(82, 'App\\Models\\User', 3, 'API token', '80bcbfeb8c54af131264a21fc428d79c65f659c988e13698ee1861eefedfc135', '[\"*\"]', '2024-09-15 21:39:35', NULL, '2024-09-15 21:38:22', '2024-09-15 21:39:35'),
(83, 'App\\Models\\User', 3, 'API token', 'aa2d0ab5515333a1449af6822f2c58a58efc3c601b46344d7ca38c9f66d1d3c0', '[\"*\"]', '2024-09-16 07:17:39', NULL, '2024-09-16 04:26:56', '2024-09-16 07:17:39'),
(84, 'App\\Models\\User', 3, 'API token', 'd69ec83c5addb603b801dc60b76891da1975a4c1c1fcf8aded486b4bf3ad181d', '[\"*\"]', '2024-09-16 11:18:36', NULL, '2024-09-16 10:40:58', '2024-09-16 11:18:36'),
(85, 'App\\Models\\User', 4, 'API token', '93e70ca8f2c205218a97da9354dc63fac6ff7646683ecdae7ed938a2738db74e', '[\"*\"]', NULL, NULL, '2024-09-16 19:25:55', '2024-09-16 19:25:55'),
(86, 'App\\Models\\User', 3, 'API token', 'cee9aa0ebb14f3eace3c7790fb72bdcd312644fe5e60a9d4ad2877f9f2aee7ce', '[\"*\"]', '2024-09-16 23:03:52', NULL, '2024-09-16 20:41:52', '2024-09-16 23:03:52'),
(87, 'App\\Models\\User', 3, 'API token', '3a8db9b27572a8dce9735d546d7e062d614dd727d3e0baaa0c5fa335fbc7b308', '[\"*\"]', '2024-09-16 23:07:00', NULL, '2024-09-16 23:06:01', '2024-09-16 23:07:00'),
(88, 'App\\Models\\User', 3, 'API token', '958864aff98403560bab16e3918a84c5ec33e4892d2c5372c69e72da54b93449', '[\"*\"]', '2024-09-16 23:09:53', NULL, '2024-09-16 23:09:52', '2024-09-16 23:09:53'),
(89, 'App\\Models\\User', 3, 'API token', 'eb5289073da2cc261ec13750ea77b703a641a61f44b96150cc5bf35ebbf5f847', '[\"*\"]', '2024-09-17 13:18:14', NULL, '2024-09-17 12:53:10', '2024-09-17 13:18:14'),
(90, 'App\\Models\\User', 4, 'API token', '8a04b420acf44650da090cf2e3a73efd6b1a204a8ed2ad58945cf98129c3c0df', '[\"*\"]', NULL, NULL, '2024-09-17 13:00:17', '2024-09-17 13:00:17'),
(91, 'App\\Models\\User', 3, 'API token', 'd7b6703ed5a44f2e5d133e5871a74f70b304fc6a9db089109418fc9da2ed8f89', '[\"*\"]', '2024-09-17 13:30:26', NULL, '2024-09-17 13:16:43', '2024-09-17 13:30:26'),
(92, 'App\\Models\\User', 4, 'API token', 'c064b54ea42ea86aaedd2e9f4bbf9db5d250fdc81660fbeeb6263fc95ef336e2', '[\"*\"]', NULL, NULL, '2024-09-17 13:36:23', '2024-09-17 13:36:23'),
(93, 'App\\Models\\User', 3, 'API token', '80fa753325a57bb0e4286d01c0f6d5b032b9ac5bb59d51e5f015797e3f1f74a4', '[\"*\"]', '2024-09-17 20:03:56', NULL, '2024-09-17 18:06:17', '2024-09-17 20:03:56'),
(94, 'App\\Models\\User', 4, 'API token', 'c756e33e6c6a63a0e30b20509735a3cdfc58446812e23b4b8c4c62f1d631c9af', '[\"*\"]', '2024-09-18 10:51:01', NULL, '2024-09-17 18:08:40', '2024-09-18 10:51:01'),
(95, 'App\\Models\\User', 3, 'API token', 'e6c507839ad5fb15dfd75082db16b1c6391c370c71e29bb20a22a71bf1022151', '[\"*\"]', '2024-09-17 21:33:58', NULL, '2024-09-17 18:55:12', '2024-09-17 21:33:58'),
(96, 'App\\Models\\User', 4, 'API token', 'e265c6d038f727a5fa9f9774ecfd902799f54defa96e8725f304343247ca8da8', '[\"*\"]', NULL, NULL, '2024-09-17 20:04:12', '2024-09-17 20:04:12'),
(97, 'App\\Models\\User', 3, 'API token', 'a647d939df3baff9cf71f2913ab2277166a8ec33cb800fccc7a4a978d95b2c3a', '[\"*\"]', '2024-09-17 20:23:15', NULL, '2024-09-17 20:09:38', '2024-09-17 20:23:15'),
(98, 'App\\Models\\User', 3, 'API token', '206d9b9bcd340e172f1a2ab7c7e1492cbae2caa22853c7f039acdd80d6732095', '[\"*\"]', '2024-09-17 20:23:19', NULL, '2024-09-17 20:18:59', '2024-09-17 20:23:19'),
(99, 'App\\Models\\User', 3, 'API token', '256435f01b7794b41fe9d8269973f337e9babff9298fedccb85b9e6d4b32f412', '[\"*\"]', '2024-09-17 21:21:27', NULL, '2024-09-17 21:18:43', '2024-09-17 21:21:27'),
(100, 'App\\Models\\User', 3, 'API token', 'b19f49b69e6e9b007b408a7c01c1e48212442f5f30ba3ab563c7facea9b30d51', '[\"*\"]', '2024-09-17 23:19:45', NULL, '2024-09-17 21:24:57', '2024-09-17 23:19:45'),
(101, 'App\\Models\\User', 3, 'API token', '93c7a84a507ff1218c2241a2e8e09fb40af58e9d613b44251849dc93badd6786', '[\"*\"]', '2024-09-18 00:37:07', NULL, '2024-09-17 23:09:23', '2024-09-18 00:37:07'),
(102, 'App\\Models\\User', 3, 'API token', '400a0b83044c6a6a286ec51433382e8c6f1ae7129f1022e1ede4ce3ea6580077', '[\"*\"]', '2024-09-18 02:58:14', NULL, '2024-09-18 00:32:51', '2024-09-18 02:58:14'),
(103, 'App\\Models\\User', 4, 'API token', 'ae8b6a429c144c518e05216e84d2f96001ebc672e82fafbda4dc686bb48e978c', '[\"*\"]', NULL, NULL, '2024-09-18 01:46:06', '2024-09-18 01:46:06'),
(104, 'App\\Models\\User', 4, 'API token', 'b3a74f9a84a6e355a4d09c3467ff0906648fdbdca4a92fd38c3221281a711136', '[\"*\"]', NULL, NULL, '2024-09-18 02:54:44', '2024-09-18 02:54:44'),
(105, 'App\\Models\\User', 3, 'API token', 'b3b7ba7204cf928e16efd0c4c161e86a5df9acf8ec5845f3b620b078a99f2c1c', '[\"*\"]', '2024-09-18 11:07:32', NULL, '2024-09-18 09:00:36', '2024-09-18 11:07:32'),
(106, 'App\\Models\\User', 4, 'API token', '5aa81f902ac88ce1192d282d5b28af3428f49db47cfb5a5216212cc5aceca5b2', '[\"*\"]', NULL, NULL, '2024-09-18 09:10:13', '2024-09-18 09:10:13'),
(107, 'App\\Models\\User', 4, 'API token', '300e8b26a11fd264d21d724f194a8f9d598236ac94a630be292fa5931f355b88', '[\"*\"]', NULL, NULL, '2024-09-18 09:25:27', '2024-09-18 09:25:27'),
(108, 'App\\Models\\User', 4, 'API token', '0e50dda5dc850dd13fe738acc78bbbf25691d5c2405167d868356223e617dd51', '[\"*\"]', NULL, NULL, '2024-09-18 09:28:46', '2024-09-18 09:28:46'),
(109, 'App\\Models\\User', 3, 'API token', 'e127080c5819627d9d66fc714286e5b17fe9b38e4473cd1b4a8c4a787e95a395', '[\"*\"]', '2024-09-18 10:16:35', NULL, '2024-09-18 10:15:49', '2024-09-18 10:16:35'),
(110, 'App\\Models\\User', 4, 'API token', '7e96ff935fa7c0945d51a837135b08a02ecf093539d9f7e405be784529571745', '[\"*\"]', '2024-09-18 11:34:19', NULL, '2024-09-18 10:34:08', '2024-09-18 11:34:19'),
(111, 'App\\Models\\User', 3, 'API token', '0c78af3906e3cc7a564f81c055fa09100be6d2ec89cc07957997bfae4184a4e2', '[\"*\"]', '2024-09-18 11:11:38', NULL, '2024-09-18 11:09:15', '2024-09-18 11:11:38'),
(112, 'App\\Models\\User', 3, 'API token', 'ccca68865446e44413e86cda75cca60ed0faa1901fcca84533f4f82ec03f70e5', '[\"*\"]', '2024-09-18 11:20:07', NULL, '2024-09-18 11:13:15', '2024-09-18 11:20:07'),
(113, 'App\\Models\\User', 5, 'Hữu Tiến', 'f792e6cb003b85c4ac840f89e3e0812473bb38b90ddd1b51fbb88bc2e24ff8d9', '[\"*\"]', '2024-09-18 11:41:54', NULL, '2024-09-18 11:23:01', '2024-09-18 11:41:54'),
(114, 'App\\Models\\User', 3, 'API token', 'c7e360c81b313e55cd62165e8e17ac93d684f663ab25b01b695846c2b65c2fbd', '[\"*\"]', '2024-09-18 14:59:40', NULL, '2024-09-18 11:47:11', '2024-09-18 14:59:40'),
(115, 'App\\Models\\User', 4, 'API token', 'e13bd3e391364720316ecc366f0c30de184835cdd42fabe20724f27e95a97a2b', '[\"*\"]', NULL, NULL, '2024-09-18 11:49:35', '2024-09-18 11:49:35'),
(116, 'App\\Models\\User', 4, 'API token', '9866485755f19ab00adecdc6412a73eb586a03e159d035295b5ff109d9ecf827', '[\"*\"]', NULL, NULL, '2024-09-18 12:04:18', '2024-09-18 12:04:18'),
(117, 'App\\Models\\User', 4, 'API token', 'ab9f9efa1b26f72139799e6020865cf7a66eb63da3e7365a8dff04e5120ec9f1', '[\"*\"]', NULL, NULL, '2024-09-18 12:48:06', '2024-09-18 12:48:06'),
(118, 'App\\Models\\User', 5, 'API token', '4fa7c4db70839ab3d28f3957fd87e94c2ff25fd9373fc072098791b271e00486', '[\"*\"]', '2024-09-18 16:38:44', NULL, '2024-09-18 15:00:20', '2024-09-18 16:38:44'),
(119, 'App\\Models\\User', 3, 'API token', 'cc771ba2ef32f1222c44e058cda7e0c58d73e11f3282c0e230bce87e973e0573', '[\"*\"]', '2024-09-18 17:18:03', NULL, '2024-09-18 17:14:38', '2024-09-18 17:18:03'),
(120, 'App\\Models\\User', 4, 'API token', '13a3e2c39b84e9967d16bfcb036fc83325bd4eba05aabf77d2c3bc85ab7b4d53', '[\"*\"]', NULL, NULL, '2024-09-18 17:18:30', '2024-09-18 17:18:30'),
(121, 'App\\Models\\User', 3, 'API token', '10c4af5c03e6b6011584c376a92393242a15624a20fb4f5d698fa4892e8f9bd1', '[\"*\"]', '2024-09-23 00:33:51', NULL, '2024-09-18 17:44:53', '2024-09-23 00:33:51'),
(122, 'App\\Models\\User', 4, 'API token', '62ef97180268f703bb2a9bb8f5693d7e7e4cddf3238d2a04ccbe8ac8fde1c4ec', '[\"*\"]', NULL, NULL, '2024-09-18 17:50:44', '2024-09-18 17:50:44'),
(123, 'App\\Models\\User', 4, 'API token', '975a4eaecaff1e75b2853f4461defa866af86ba11b40a069ef828ed3253f8a41', '[\"*\"]', NULL, NULL, '2024-09-22 20:31:31', '2024-09-22 20:31:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `points` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `price_old`, `quantity`, `view`, `category_id`, `brand_id`, `promotion`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(17, 'Áo Polo Nam Thêu Ngực', 'Khám phá chiếc áo polo nam tính, khoẻ khoắn cùng những tính năng vượt trội mang lại sự thoải mái cho người mặc. Thiết kế phối cổ cùng điểm nhấn phối ngực giúp cho chiếc nào này trở nên thú vị hơn, nam tính mà vẫn trẻ trung, khác biệt.', 299999.00, 350000.00, 100, 66, 10, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:27:06', '2024-09-18 18:03:17'),
(18, 'Áo Polo Nam In Họa Tiết Ngôi Sao', 'Khám phá chiếc áo polo nam tính, khoẻ khoắn cùng những tính năng vượt trội mang lại sự thoải mái cho người mặc. Thiết kế phối cổ cùng điểm nhấn phối ngực giúp cho chiếc nào này trở nên thú vị hơn, nam tính mà vẫn trẻ trung, khác biệt.', 299999.00, 350000.00, 100, 2, 10, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:31:45', '2024-09-17 20:09:46'),
(19, 'ÁO POLO NAM CAN VAI TÚI CƠI', 'Chất liệu nhẹ tênh, co giãn tốt giúp bạn luôn vận động dễ dàng. Lựa chọn hoàn hảo cho phong cách sống năng động và thân thiện với môi trường bằng cách sử dụng nguyên liệu tái chế. Kháng khuẩn, khử mùi loại bỏ vi khuẩn gây mùi, giữ cơ thể luôn fresh. Chống tia UV bảo vệ da khỏi tác hại của ánh nắng mặt trời.', 299999.00, 350000.00, 100, 14, 10, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:37:20', '2024-09-18 17:14:17'),
(20, 'Áo Polo Nam Airycool Giữ Form Thoáng Mát', 'Form suông thoải mái, phối bo kẻ ở cổ và tay áo. Chất thun lạnh siêu thoáng mát. Công nghệ làm mát FREEZING là điểm đặc biệt giúp tăng tiêu tán bức xạ nhiệt và hạn chế tối đa hấp thụ nhiệt vào cơ thể.', 299999.00, 350000.00, 100, 6, 10, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:41:47', '2024-09-17 20:21:27'),
(21, 'Áo Polo Nữ Gấu Bo', 'Chiếc áo polo Cafe vừa lành tính trong chất liệu, vừa mới lạ trong thiết kế. Không chỉ có khả năng chống tia UV, áo polo YODY với thiết kế phối cổ cùng điểm nhấn cúc vạt áo giúp cho tủ đồ của các chị em thêm phần ấn tượng.', 299999.00, 350000.00, 100, 12, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:49:51', '2024-09-16 23:35:21'),
(22, 'Áo Polo Nữ Cafe Dệt Tổ Ong Phối Dây Dệt', 'Form dáng slimfit ôm vừa phải, tôn dáng người mặc. Cổ bẻ thanh lịch, phối dây dệt nổi bật ở vai tạo điểm nhấn khỏe khoắn, năng động. Màu trơn đơn giản, dễ dàng phối đồ với nhiều trang phục khác nhau. Chất liệu cao cấp, thân thiện với môi trường.', 299999.00, 350000.00, 100, 26, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:51:15', '2024-09-23 00:33:30'),
(23, 'Áo Polo Nữ Cafe Dệt Tổ Ong Trụ Bo Cúc Bấm', 'Áo polo form dáng slimfit ôm vừa phải, tôn dáng người mặc. Cổ trụ bo cúc bấm tiện lợi, dễ dàng đóng mở. Nẹp áo và bo cổ phối màu nhẹ nhàng, tinh tế. Dễ dàng phối đồ với nhiều trang phục khác nhau. Chất liệu cao cấp, thân thiện với môi trường.', 299999.00, 350000.00, 100, 44, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:52:37', '2024-12-17 23:25:30'),
(24, 'Áo Polo Nữ Bạc Hà In Everyday Wear', 'Áo polo form dáng slimfit ôm vừa phải, tôn dáng người mặc. Cổ trụ bo cúc bấm tiện lợi, dễ dàng đóng mở. Nẹp áo và bo cổ phối màu nhẹ nhàng, tinh tế. Dễ dàng phối đồ với nhiều trang phục khác nhau. Chất liệu cao cấp, thân thiện với môi trường.', 299999.00, 350000.00, 100, 16, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:53:59', '2024-09-17 09:24:33'),
(25, 'Áo Polo Thể Thao Nữ Trụ Áo Ép Sim', 'Vải Airycool công nghệ Freezing tiến tiến giúp giải nhiệt cơ thể cho ngày hè mát mẻ. Chỉ số chạm mát tức thì Qmax 0.19. Thông thoáng, thấm hút mồ hôi tốt. Khả năng co giãn, giữ form tốt.', 379000.00, 450000.00, 100, 12, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:55:47', '2024-09-18 01:31:29'),
(26, 'Áo Polo Nữ Recycle Clean Việt Nam Form Rộng', 'Dòng sản phẩm sử dụng nguyên liệu tái chế từ chai nhựa Việt Nam. Mỗi sản phẩm sẽ góp phần bảo vệ môi trường của chính chúng ta. Chất liệu vải mềm mại, thông thoáng, thấm hút tốt. Thoải mái mặc mỗi ngày mà không lo nhăn nhàu.', 149000.00, 200000.00, 100, 6, 33, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 11:57:24', '2024-09-17 20:22:04'),
(27, 'Áo Yoguu Dài Tay Có Cổ Phối Kẻ', 'Mang tinh thần và chất riêng của giới trẻ thế hệ mới, chiếc áo thể hiện sự trẻ trung, độc bản khác biệt. Vải nỉ hai mặt dày dặn, giữ ấm tốt, mềm mại và có độ co dãn. Kiểu dáng rộng, cổ polo trẻ trung,in kẻ phối và hình thêu thân trước.', 199000.00, 230000.00, 100, 16, 34, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:03:38', '2024-09-17 09:57:03'),
(28, 'Đồ Bộ Nữ Lửng Thêu End Less Bột Ngô', 'Vải thân thiện với môi trường, siêu co giãn nhờ cấu trúc lò xo xoắn đàn hồi vượt trội. Sợi vải có nguồn gốc từ thiên nhiên. Độ bền cao, tiếp xúc trên da mềm mại, dễ chịu. Thoải mái hơn vào hè khi tốc độ hút và khô nhanh.', 199500.00, 230000.00, 100, 11, 47, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:06:34', '2024-09-18 16:38:30'),
(29, 'Áo Dài Tay Kid Happy Face Mickey', 'Sản phẩm áo dài tay trẻ trung năng động phù hợp với các bạn thiếu niên. Chất vải dày dặn, giữ ấm hiệu quả lại in hình Mickey siêu ấn tượng. Đây hứa hẹn là món quà yêu thích trong tủ đồ các bạn nhỏ mùa này.', 469000.00, 555000.00, 100, 4, 61, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:11:07', '2024-09-18 02:56:19'),
(30, 'Áo Dài Tay Kid Tomorrow', 'Sản phẩm áo dài tay trẻ trung năng động phù hợp với các bạn thiếu niên. Chất vải dày dặn, giữ ấm hiệu quả lại in hình Mickey siêu ấn tượng. Đây hứa hẹn là món quà yêu thích trong tủ đồ các bạn nhỏ mùa này.', 149000.00, 200000.00, 100, 6, 61, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:15:17', '2024-09-18 15:04:21'),
(31, 'Đầm Đông Nữ Tay Dài Phối Trễ Vai', 'Form dáng xoè cùng tay dài phối trễ vai nữ tính mang đến sự thanh lịch và sang trọng cho người mặc. Có 2 cách diện độc đáo là mặc váy liền hoặc tách rời phần chân váy. Thích hợp cho những buổi tiệc nhẹ, tiệc cuối năm hay gặp gỡ bạn bè.', 349500.00, 400000.00, 100, 0, 51, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:17:52', '2024-08-26 12:17:52'),
(32, 'Váy Thun Nữ Dáng Rộng Phố Tay Madrid', 'Sợi compact có độ bền gấp 3 lần cotton thường. Thấm hút mồ hôi cực tốt, thoáng mát thích hợp với thời tiết nóng ẩm của Việt Nam. Co giãn tốt, thích hợp với chuyển động của cơ thể khi hoạt động. Hình in ở ngực áo MADRID năng động, cá tính.', 184500.00, 220000.00, 100, 4, 51, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:19:54', '2024-09-18 15:01:10'),
(33, 'Chân Váy Nữ Ly Súp Trẻ Trung', 'Thiết kế trẻ trung ly súp tạo điểm nhấn, kiểu dáng chữ A dễ mặc, dễ phối đồ. Cá tính và năng động, tôn dáng, che khuyết điểm, phù hợp mọi hoàn cảnh. Chất liệu thông minh co giãn 2 chiều thoải mái vận động, mềm mại, thấm hút tốt, hạn chế nhăn.', 369000.00, 455000.00, 100, 8, 52, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:22:22', '2024-09-18 15:00:51'),
(34, 'Chân Váy Nữ Xoè Túi Sườn 7 Mảnh', 'Thiết kế trẻ trung ly súp tạo điểm nhấn, kiểu dáng chữ A dễ mặc, dễ phối đồ. Cá tính và năng động, tôn dáng, che khuyết điểm, phù hợp mọi hoàn cảnh. Chất liệu thông minh co giãn 2 chiều thoải mái vận động, mềm mại, thấm hút tốt, hạn chế nhăn.', 234500.00, 300000.00, 100, 0, 52, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:27:06', '2024-08-26 12:27:06'),
(35, 'Áo Phao Nam Mũ Nhám Cài Siêu Ấm', 'Áo phao giữ ấm tốt nhờ kiểu dệt của hai hệ sợi vuông góc với nhau khăng khít, giúp cản gió, cách nhiệt, giữ ấm hiệu quả. sử dụng sợi Polyester chi số lớn, tạo bề mặt vừa đứng phom vừa mềm mại, vừa giữ ấm tốt. Bền, dễ chăm sóc, dễ bảo quản.', 989000.00, 1000000.00, 100, 8, 14, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:30:22', '2024-09-18 14:54:14'),
(36, 'Áo Phao Nam 3S Siêu Nhẹ Tay Raglan', 'Áo phao giữ ấm tốt nhờ kiểu dệt của hai hệ sợi vuông góc với nhau khăng khít, giúp cản gió, cách nhiệt, giữ ấm hiệu quả. sử dụng sợi Polyester chi số lớn, tạo bề mặt vừa đứng phom vừa mềm mại, vừa giữ ấm tốt. Bền, dễ chăm sóc, dễ bảo quản.', 599000.00, 700000.00, 100, 25, 14, NULL, 'Giảm giá', 'active', NULL, '2024-08-26 12:31:48', '2024-09-18 17:48:39'),
(76, 'Sơ Mi Tay Dài Nam Knit', 'Là sự kết hợp hoàn hảo giữa form áo sơ mi cơ bản và cấu trúc dệt vòng co giãn từ chất chất liệu đến từ Nhật Bản. Độ co giãn đa chiều giúp người mặc thoải mái trong từng cử động và thoả sức với hoạt động hàng ngày.', 584000.00, 649000.00, 20, 5, 12, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 12:50:36', '2024-09-18 12:52:20'),
(77, 'Sơ Mi Dài Tay Bamboo Kẻ Caro', 'Vải sợi tre mát ngay khi chạm vào cùng khả năng hấp thụ không khí và độ ẩm tốt. Hạn chế nhăn trong quá trình sử dụng, hấp thụ và làm bay mồ hôi nhanh chóng. Thiết kế cơ bản kẻ caro nhỏ, cổ đức và nẹp áo giữ phom trong suốt quá trình sử dụng.', 422000.00, 469000.00, 35, 21, 12, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 12:55:56', '2024-09-18 18:10:13'),
(78, 'Áo Sơ Mi Nam Tay Ngắn Nano Chống Nhăn Khử Mùi', 'Vài Nano khử mùi, kháng khuẩn và thấm hút mồ hôi tốt. Hạn chế nhăn với form áo đứng và giữ nếp giúp người mặc luôn diện những mẫu áo phẳng phiu. Thiết kế mới, lá cổ mở rộng hơn về phía cầu vai, có ly gấp sau lưng.', 413000.00, 459999.00, 23, 15, 12, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 12:59:23', '2024-09-18 18:14:47'),
(79, 'Bộ Đông Nữ Gấu Buông Trẻ Trung', 'Kiểu dáng cơ bản trẻ trung và năng động mang đến cảm giác thoải mái khi mặc. Thiết kế có đường cắt giữa thân và gắn mác gấu làm điểm nhấn. Thích hợp mặc đi chơi, đi làm hoặc mặc ở nhà', 539000.00, 599999.00, 18, 6, 47, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 13:01:56', '2024-09-18 17:46:27'),
(80, 'Bộ Đông Nữ Quần Suông', 'Bộ đồ nữ với quần suông rộng rãi thoải mái và trẻ trung, năng động thích hợp mặc đi dạo phố, chạy bộ hay ở nhà. Kết hợp với áo giữ nhiệt, áo khoác tùy vào điều kiện thời tiết. Mặt vải đanh chắc không bị bai dão, ít xù giúp giữ ấm tốt.', 719000.00, 799000.00, 21, 20, 47, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 13:03:43', '2024-09-18 14:49:05'),
(81, 'Bộ Đồ Yoguu In Choose Happys', 'Kiểu dáng unisex rộng rãi, trẻ trung, phù hợp cho cả nam và nữ. Hình in chữ \"Choose Happy\" trendy, tạo điểm nhấn cá tính. Chất liệu cao cấp, mềm mại, thoải mái. Thiết kế năng động, dễ phối đồ Kết hợp với áo giữ nhiệt, áo khoác tùy điều kiện thời tiết.', 629000.00, 699000.00, 37, 73, 47, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 13:05:45', '2024-09-22 20:43:13'),
(82, 'test', 'da', 99000.00, 200000.00, 23, 9, 10, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 14:16:14', '2024-09-22 20:37:26'),
(83, 'Sản phẩm mới DATN', 'Mô tả sản phẩm aocs khoác', 250000.00, 300000.00, 20, 13, 60, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 17:59:08', '2024-09-22 20:44:01'),
(84, 'mới 2', 'Mô tả', 150000.00, 200000.00, 30, 3, 10, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-18 18:04:49', '2024-09-18 18:06:12'),
(85, 'test', 'dfsdf', 99000.00, 300000.00, 43, 15, 18, NULL, 'Giảm giá đặc biệt', 'active', NULL, '2024-09-22 20:34:13', '2024-09-22 20:39:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value_id` bigint(20) UNSIGNED NOT NULL,
  `additional_price` decimal(10,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_thumbnail`, `deleted_at`, `created_at`, `updated_at`) VALUES
(27, 17, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-yody-apm7217-nau-4.jpg', 1, NULL, '2024-08-26 11:27:06', '2024-08-26 11:27:06'),
(28, 17, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-yody-apm7217-nau-3.jpg', 0, NULL, '2024-08-26 11:27:06', '2024-08-26 11:27:06'),
(29, 17, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-yody-apm7217-nau-5.jpg', 0, NULL, '2024-08-26 11:27:06', '2024-08-26 11:27:06'),
(30, 18, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7467-XLU%20(1).JPG', 1, NULL, '2024-08-26 11:31:45', '2024-08-26 11:31:45'),
(31, 18, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7467-XLU%20(7).JPG', 0, NULL, '2024-08-26 11:31:45', '2024-08-26 11:31:45'),
(32, 18, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7467-XLU%20(6).JPG', 0, NULL, '2024-08-26 11:31:45', '2024-08-26 11:31:45'),
(33, 19, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7247-NAD%20(1).jpg', 1, NULL, '2024-08-26 11:37:20', '2024-08-26 11:37:20'),
(34, 19, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7247-NAD%20(2).jpg', 0, NULL, '2024-08-26 11:37:20', '2024-08-26 11:37:20'),
(35, 19, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nam-APM7247-NAD%20(3).jpg', 0, NULL, '2024-08-26 11:37:20', '2024-08-26 11:37:20'),
(36, 20, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apm5083-tra-5.jpg', 1, NULL, '2024-08-26 11:41:47', '2024-08-26 11:41:47'),
(37, 20, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apm5083-tra-1.jpg', 0, NULL, '2024-08-26 11:41:47', '2024-08-26 11:41:47'),
(38, 20, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apm5083-tra-2.jpg', 0, NULL, '2024-08-26 11:41:47', '2024-08-26 11:41:47'),
(39, 21, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-APN7136-XAH-3%20(1).JPG', 1, NULL, '2024-08-26 11:49:51', '2024-08-26 11:49:51'),
(40, 21, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-APN7136-XAH-3%20(2).JPG', 0, NULL, '2024-08-26 11:49:51', '2024-08-26 11:49:51'),
(41, 21, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-APN7136-XAH-3%20(8).JPG', 0, NULL, '2024-08-26 11:49:51', '2024-08-26 11:49:51'),
(42, 22, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7028-den-cvn6206-nau-3.jpg', 1, NULL, '2024-08-26 11:51:15', '2024-08-26 11:51:15'),
(43, 22, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7028-den-cvn6206-nau-5.jpg', 0, NULL, '2024-08-26 11:51:15', '2024-08-26 11:51:15'),
(44, 22, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7028-den-cvn6206-nau-6.jpg', 0, NULL, '2024-08-26 11:51:15', '2024-08-26 11:51:15'),
(45, 23, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7012-nav-qkm3072-bsa-5.jpg', 1, NULL, '2024-08-26 11:52:37', '2024-08-26 11:52:37'),
(46, 23, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7012-nav-qkm3072-bsa-6.jpg', 0, NULL, '2024-08-26 11:52:37', '2024-08-26 11:52:37'),
(47, 23, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/apn7012-nav-qkm3072-bsa-7.jpg', 0, NULL, '2024-08-26 11:52:37', '2024-08-26 11:52:37'),
(48, 24, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-apn6226-tra-ssn6020-den-4-yody.jpg', 1, NULL, '2024-08-26 11:53:59', '2024-08-26 11:53:59'),
(49, 24, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-apn6226-tra-ssn6020-den-5-yody.jpg', 0, NULL, '2024-08-26 11:53:59', '2024-08-26 11:53:59'),
(50, 24, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-polo-nu-yody-apn6226-tra-ssn6020-den-3-yody.jpg', 0, NULL, '2024-08-26 11:53:59', '2024-08-26 11:53:59'),
(51, 25, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/san6050-den-sjn4004-tra-05993.jpg', 1, NULL, '2024-08-26 11:55:47', '2024-08-26 11:55:47'),
(52, 25, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/san6050-den-sjn4004-tra-05995.jpg', 0, NULL, '2024-08-26 11:55:47', '2024-08-26 11:55:47'),
(53, 25, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/san6050-den-sjn4004-tra-06003.jpg', 0, NULL, '2024-08-26 11:55:47', '2024-08-26 11:55:47'),
(54, 26, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/apn6258-xla-cvn5148-nad-04955.jpg?v=1690163488000', 1, NULL, '2024-08-26 11:57:24', '2024-08-26 11:57:24'),
(55, 26, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/apn6258-xla-cvn5148-nad-04960.jpg?v=1690163488000', 0, NULL, '2024-08-26 11:57:24', '2024-08-26 11:57:24'),
(56, 26, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/apn6258-xla-cvn5148-nad-04963.jpg?v=1690163488000', 0, NULL, '2024-08-26 11:57:24', '2024-08-26 11:57:24'),
(57, 27, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/gua6014-kla-5.jpg', 1, NULL, '2024-08-26 12:03:38', '2024-08-26 12:03:38'),
(58, 27, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/gua6014-kla-8.jpg', 0, NULL, '2024-08-26 12:03:38', '2024-08-26 12:03:38'),
(59, 27, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/gua6014-kla-1.jpg', 0, NULL, '2024-08-26 12:03:38', '2024-08-26 12:03:38'),
(60, 28, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/bdn6016-dn1-4.jpg?v=1690163486780', 1, NULL, '2024-08-26 12:06:34', '2024-08-26 12:06:34'),
(61, 28, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/bdn6016-dn1-9.jpg?v=1690163486780', 0, NULL, '2024-08-26 12:06:34', '2024-08-26 12:06:34'),
(62, 28, 'https://m.yodycdn.com/fit-in/filters:format(webp)/100/438/408/products/bdn6016-dn1-3.jpg?v=1690163486780', 0, NULL, '2024-08-26 12:06:34', '2024-08-26 12:06:34'),
(63, 29, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-dai-tay-tre-em-mickey-yody-atk6170-trg-9.jpg', 1, NULL, '2024-08-26 12:11:07', '2024-08-26 12:11:07'),
(64, 29, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-dai-tay-tre-em-mickey-yody-atk6170-trg-7.jpg', 0, NULL, '2024-08-26 12:11:07', '2024-08-26 12:11:07'),
(65, 29, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-dai-tay-tre-em-mickey-yody-atk6170-trg-8.jpg', 0, NULL, '2024-08-26 12:11:07', '2024-08-26 12:11:07'),
(66, 30, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-thun-tre-em-atk7024-dee-1.jpg', 1, NULL, '2024-08-26 12:15:17', '2024-08-26 12:15:17'),
(67, 30, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-thun-tre-em-atk7024-dee-2.jpg', 0, NULL, '2024-08-26 12:15:17', '2024-08-26 12:15:17'),
(68, 30, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-thun-tre-em-atk7024-dee-4.jpg', 0, NULL, '2024-08-26 12:15:17', '2024-08-26 12:15:17'),
(69, 31, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vay-nu-dam-lien-than-vdn6258-tra-6.jpg', 1, NULL, '2024-08-26 12:17:52', '2024-08-26 12:17:52'),
(70, 31, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vay-nu-dam-lien-than-vdn6258-tra-5.jpg', 0, NULL, '2024-08-26 12:17:52', '2024-08-26 12:17:52'),
(71, 31, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vay-nu-dam-lien-than-vdn6258-tra-1.jpg', 0, NULL, '2024-08-26 12:17:52', '2024-08-26 12:17:52'),
(72, 32, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vtn6014-dtv-6-75da344e-8e41-48db-9062-17bd7af4bbd1.jpg', 1, NULL, '2024-08-26 12:19:54', '2024-08-26 12:19:54'),
(73, 32, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vtn6014-dtv-7.jpg', 0, NULL, '2024-08-26 12:19:54', '2024-08-26 12:19:54'),
(74, 32, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/vtn6014-dtv-8.jpg', 0, NULL, '2024-08-26 12:19:54', '2024-08-26 12:19:54'),
(75, 33, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-cvn7036-nad-1.jpg', 1, NULL, '2024-08-26 12:22:22', '2024-08-26 12:22:22'),
(76, 33, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-cvn7036-nad-2.jpg', 0, NULL, '2024-08-26 12:22:22', '2024-08-26 12:22:22'),
(77, 33, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-cvn7036-nad-5.jpg', 0, NULL, '2024-08-26 12:22:22', '2024-08-26 12:22:22'),
(78, 34, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-CVN7090-NAD%20(1).jpg', 1, NULL, '2024-08-26 12:27:06', '2024-08-26 12:27:06'),
(79, 34, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-CVN7090-NAD%20(2).jpg', 0, NULL, '2024-08-26 12:27:06', '2024-08-26 12:27:06'),
(80, 34, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/chan-vay-nu-CVN7090-NAD%20(4).jpg', 0, NULL, '2024-08-26 12:27:06', '2024-08-26 12:27:06'),
(81, 35, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-01.jpg', 1, NULL, '2024-08-26 12:30:22', '2024-08-26 12:30:22'),
(82, 35, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-03.jpg', 0, NULL, '2024-08-26 12:30:22', '2024-08-26 12:30:22'),
(83, 35, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/pvm6003-gir-smm6097-nau-atm6010-den-04.jpg', 0, NULL, '2024-08-26 12:30:22', '2024-08-26 12:30:22'),
(84, 36, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-phao-nam-3s-yody-phm6005-ghi-35.jpg', 1, NULL, '2024-08-26 12:31:48', '2024-08-26 12:31:48'),
(85, 36, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-phao-nam-3s-yody-phm6005-ghi-37.jpg', 0, NULL, '2024-08-26 12:31:48', '2024-08-26 12:31:48'),
(86, 36, 'https://m.yodycdn.com/fit-in/filters:format(webp)/products/ao-phao-nam-3s-yody-phm6005-ghi-38.jpg', 0, NULL, '2024-08-26 12:31:48', '2024-08-26 12:31:48'),
(147, 76, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689040/ue46o1hmukwqbomkcufx.webp', 0, NULL, '2024-09-18 12:50:41', '2024-09-18 12:50:41'),
(148, 76, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689042/pu7b1lxj1zpavbzzxsib.webp', 0, NULL, '2024-09-18 12:50:43', '2024-09-18 12:50:43'),
(149, 76, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689044/jpznskw7ybmh3139uvs7.webp', 0, NULL, '2024-09-18 12:50:45', '2024-09-18 12:50:45'),
(150, 77, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689358/gjunmn74hjd0offx9qja.webp', 0, NULL, '2024-09-18 12:55:58', '2024-09-18 12:55:58'),
(151, 77, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689360/msdfuywuw1plbqrkweeq.webp', 0, NULL, '2024-09-18 12:56:01', '2024-09-18 12:56:01'),
(152, 77, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689362/n0ai58e3ewpffizl01rb.webp', 0, NULL, '2024-09-18 12:56:03', '2024-09-18 12:56:03'),
(153, 78, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689567/vwjbobts23n0qyqvdsvc.webp', 0, NULL, '2024-09-18 12:59:27', '2024-09-18 12:59:27'),
(154, 78, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689569/bsgomy9ipticlwywlfnj.webp', 0, NULL, '2024-09-18 12:59:30', '2024-09-18 12:59:30'),
(155, 78, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689571/eszm85d3ymiubwnd8q8m.webp', 0, NULL, '2024-09-18 12:59:32', '2024-09-18 12:59:32'),
(156, 79, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689721/hkfbxhpjnutw7chz3wkg.webp', 0, NULL, '2024-09-18 13:02:01', '2024-09-18 13:02:01'),
(157, 79, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689723/uir8scoylzwojjqg8twa.webp', 0, NULL, '2024-09-18 13:02:04', '2024-09-18 13:02:04'),
(158, 79, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689725/er3qomebjb5mm3sd1fnr.webp', 0, NULL, '2024-09-18 13:02:06', '2024-09-18 13:02:06'),
(159, 80, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689829/yahhfo4uzajyf5c7a8ri.webp', 0, NULL, '2024-09-18 13:03:49', '2024-09-18 13:03:49'),
(160, 80, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689831/ichlguhgckht67moteqn.webp', 0, NULL, '2024-09-18 13:03:52', '2024-09-18 13:03:52'),
(161, 80, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689833/uemds0xw1tl4qozofb4s.webp', 0, NULL, '2024-09-18 13:03:54', '2024-09-18 13:03:54'),
(162, 81, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689947/bug3a1iv57p5jbddadxk.webp', 0, NULL, '2024-09-18 13:05:48', '2024-09-18 13:05:48'),
(163, 81, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689949/jd15drzo8ahcee7d6ll6.webp', 0, NULL, '2024-09-18 13:05:50', '2024-09-18 13:05:50'),
(164, 81, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726689951/scmpbqw2wyqrdbckpvwa.webp', 0, NULL, '2024-09-18 13:05:52', '2024-09-18 13:05:52'),
(165, 82, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726694178/ihobnin9sdwvemorqqzc.webp', 0, NULL, '2024-09-18 14:16:18', '2024-09-18 14:16:18'),
(166, 83, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726707549/wutwuyb95ydeihatfxlp.webp', 0, NULL, '2024-09-18 17:59:10', '2024-09-18 17:59:10'),
(167, 83, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726707552/k0iqhjdw9mgexxpzoy9y.webp', 0, NULL, '2024-09-18 17:59:12', '2024-09-18 17:59:12'),
(168, 83, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726707554/gc3g1cio80powqyofuug.webp', 0, NULL, '2024-09-18 17:59:14', '2024-09-18 17:59:14'),
(169, 84, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1726707891/lbrcxmypxk682c79giio.webp', 0, NULL, '2024-09-18 18:04:51', '2024-09-18 18:04:51'),
(170, 85, 'https://res.cloudinary.com/dfsvi4vox/image/upload/v1727062455/idoetv1sj2p4kxrpbdci.webp', 0, NULL, '2024-09-22 20:34:16', '2024-09-22 20:34:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `sku`, `stock`, `price`, `thumbnail`, `is_available`, `deleted_at`, `created_at`, `updated_at`) VALUES
(202, 17, 'SKU-Đen-S-Lanh', 100, 299999.00, NULL, 0, NULL, '2024-08-26 11:27:40', '2024-09-18 12:05:34'),
(203, 17, 'SKU-Đen-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:27:40', '2024-08-26 11:27:40'),
(204, 17, 'SKU-Đen-S-', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:27:40', '2024-08-26 11:27:40'),
(205, 17, 'SKU-Đen-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(206, 17, 'SKU-Đen-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(207, 17, 'SKU-Đen-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(208, 17, 'SKU-Đen-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(209, 17, 'SKU-Đen-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(210, 17, 'SKU-Đen-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(211, 17, 'SKU-Đen-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(212, 17, 'SKU-Đen-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(213, 17, 'SKU-Đen-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(214, 17, 'SKU-Đỏ-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(215, 17, 'SKU-Đỏ-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(216, 17, 'SKU-Đỏ-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(217, 17, 'SKU-Đỏ-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(218, 17, 'SKU-Đỏ-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(219, 17, 'SKU-Đỏ-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(220, 17, 'SKU-Đỏ-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(221, 17, 'SKU-Đỏ-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(222, 17, 'SKU-Đỏ-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(223, 17, 'SKU-Trắng-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(224, 17, 'SKU-Trắng-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:57', '2024-08-26 11:28:57'),
(225, 17, 'SKU-Trắng-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(226, 17, 'SKU-Trắng-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(227, 17, 'SKU-Trắng-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(228, 17, 'SKU-Trắng-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(229, 17, 'SKU-Trắng-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(230, 17, 'SKU-Trắng-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(231, 17, 'SKU-Trắng-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:28:58', '2024-08-26 11:28:58'),
(232, 18, 'SKU-Đen-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(233, 18, 'SKU-Đen-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(234, 18, 'SKU-Đen-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(235, 18, 'SKU-Đen-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(236, 18, 'SKU-Đen-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(237, 18, 'SKU-Đen-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(238, 18, 'SKU-Đen-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(239, 18, 'SKU-Đen-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(240, 18, 'SKU-Đen-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:31:59', '2024-08-26 11:31:59'),
(241, 18, 'SKU-Đỏ-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(242, 18, 'SKU-Đỏ-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(243, 18, 'SKU-Đỏ-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(244, 18, 'SKU-Đỏ-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(245, 18, 'SKU-Đỏ-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(246, 18, 'SKU-Đỏ-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(247, 18, 'SKU-Đỏ-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(248, 18, 'SKU-Đỏ-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(249, 18, 'SKU-Đỏ-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(250, 18, 'SKU-Trắng-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(251, 18, 'SKU-Trắng-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(252, 18, 'SKU-Trắng-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(253, 18, 'SKU-Trắng-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(254, 18, 'SKU-Trắng-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(255, 18, 'SKU-Trắng-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(256, 18, 'SKU-Trắng-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(257, 18, 'SKU-Trắng-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(258, 18, 'SKU-Trắng-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:32:00', '2024-08-26 11:32:00'),
(259, 19, 'SKU-Đen-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(260, 19, 'SKU-Đen-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(261, 19, 'SKU-Đen-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(262, 19, 'SKU-Đen-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(263, 19, 'SKU-Đen-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(264, 19, 'SKU-Đen-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(265, 19, 'SKU-Đen-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(266, 19, 'SKU-Đen-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(267, 19, 'SKU-Đen-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(268, 19, 'SKU-Đen-XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(269, 19, 'SKU-Đen-XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(270, 19, 'SKU-Đen-XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(271, 19, 'SKU-Đen-2XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(272, 19, 'SKU-Đen-2XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(273, 19, 'SKU-Đen-2XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(274, 19, 'SKU-Đen-3XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(275, 19, 'SKU-Đen-3XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(276, 19, 'SKU-Đen-3XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(277, 19, 'SKU-Đỏ-S-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(278, 19, 'SKU-Đỏ-S-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(279, 19, 'SKU-Đỏ-S-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(280, 19, 'SKU-Đỏ-M-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(281, 19, 'SKU-Đỏ-M-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(282, 19, 'SKU-Đỏ-M-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(283, 19, 'SKU-Đỏ-L-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(284, 19, 'SKU-Đỏ-L-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(285, 19, 'SKU-Đỏ-L-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(286, 19, 'SKU-Đỏ-XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(287, 19, 'SKU-Đỏ-XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(288, 19, 'SKU-Đỏ-XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(289, 19, 'SKU-Đỏ-2XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(290, 19, 'SKU-Đỏ-2XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(291, 19, 'SKU-Đỏ-2XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(292, 19, 'SKU-Đỏ-3XL-Cotton', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(293, 19, 'SKU-Đỏ-3XL-Lanh', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(294, 19, 'SKU-Đỏ-3XL-Thun', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:38:04', '2024-08-26 11:38:04'),
(295, 20, 'SKU-Đen-S', 97, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-09-15 19:45:17'),
(296, 20, 'SKU-Đen-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(297, 20, 'SKU-Đen-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(298, 20, 'SKU-Đen-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(299, 20, 'SKU-Đen-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(300, 20, 'SKU-Đen-3XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(301, 20, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(302, 20, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(303, 20, 'SKU-Đỏ-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(304, 20, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(305, 20, 'SKU-Đỏ-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(306, 20, 'SKU-Đỏ-3XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(307, 20, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(308, 20, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(309, 20, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(310, 20, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(311, 20, 'SKU-Trắng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(312, 20, 'SKU-Trắng-3XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(313, 20, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(314, 20, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(315, 20, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(316, 20, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(317, 20, 'SKU-Hồng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(318, 20, 'SKU-Hồng-3XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:44:31', '2024-08-26 11:44:31'),
(319, 21, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(320, 21, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(321, 21, 'SKU-Đỏ-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(322, 21, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(323, 21, 'SKU-Đỏ-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(324, 21, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(325, 21, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(326, 21, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(327, 21, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(328, 21, 'SKU-Trắng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(329, 21, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(330, 21, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(331, 21, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(332, 21, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(333, 21, 'SKU-Hồng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:50:24', '2024-08-26 11:50:24'),
(334, 22, 'SKU-Đen-S', 98, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-09-23 00:33:51'),
(335, 22, 'SKU-Đen-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(336, 22, 'SKU-Đen-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(337, 22, 'SKU-Đen-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(338, 22, 'SKU-Đen-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(339, 22, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(340, 22, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(341, 22, 'SKU-Đỏ-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(342, 22, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(343, 22, 'SKU-Đỏ-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(344, 22, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(345, 22, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(346, 22, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(347, 22, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(348, 22, 'SKU-Trắng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(349, 22, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(350, 22, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(351, 22, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(352, 22, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(353, 22, 'SKU-Hồng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:51:33', '2024-08-26 11:51:33'),
(354, 23, 'SKU-Đen-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-09-18 01:47:36'),
(355, 23, 'SKU-Đen-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(356, 23, 'SKU-Đen-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(357, 23, 'SKU-Đen-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(358, 23, 'SKU-Đen-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(359, 23, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(360, 23, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-09-16 21:05:31'),
(361, 23, 'SKU-Đỏ-L', 97, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-09-22 20:29:55'),
(362, 23, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(363, 23, 'SKU-Đỏ-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(364, 23, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(365, 23, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(366, 23, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(367, 23, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(368, 23, 'SKU-Trắng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(369, 23, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(370, 23, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(371, 23, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(372, 23, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(373, 23, 'SKU-Hồng-2XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:52:48', '2024-08-26 11:52:48'),
(374, 24, 'SKU-Đen-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(375, 24, 'SKU-Đen-M', 99, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-09-10 23:26:25'),
(376, 24, 'SKU-Đen-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(377, 24, 'SKU-Đen-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(378, 24, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(379, 24, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(380, 24, 'SKU-Đỏ-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(381, 24, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(382, 24, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(383, 24, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(384, 24, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(385, 24, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(386, 24, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(387, 24, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(388, 24, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(389, 24, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(390, 24, 'SKU-Xám-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(391, 24, 'SKU-Xám-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(392, 24, 'SKU-Xám-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(393, 24, 'SKU-Xám-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:54:18', '2024-08-26 11:54:18'),
(394, 25, 'SKU-Đen-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-09-16 21:05:31'),
(395, 25, 'SKU-Đen-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-08-26 11:56:00'),
(396, 25, 'SKU-Đen-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-08-26 11:56:00'),
(397, 25, 'SKU-Đen-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-08-26 11:56:00'),
(398, 25, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-08-26 11:56:00'),
(399, 25, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:00', '2024-08-26 11:56:00'),
(400, 25, 'SKU-Đỏ-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(401, 25, 'SKU-Đỏ-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(402, 25, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(403, 25, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(404, 25, 'SKU-Trắng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(405, 25, 'SKU-Trắng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(406, 25, 'SKU-Hồng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(407, 25, 'SKU-Hồng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(408, 25, 'SKU-Hồng-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(409, 25, 'SKU-Hồng-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(410, 25, 'SKU-Xám-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(411, 25, 'SKU-Xám-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(412, 25, 'SKU-Xám-L', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(413, 25, 'SKU-Xám-XL', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:56:01', '2024-08-26 11:56:01'),
(414, 26, 'SKU-Đỏ-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:57:56', '2024-08-26 11:57:56'),
(415, 26, 'SKU-Đỏ-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:57:56', '2024-08-26 11:57:56'),
(416, 26, 'SKU-Trắng-S', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:57:56', '2024-08-26 11:57:56'),
(417, 26, 'SKU-Trắng-M', 100, 299999.00, NULL, 1, NULL, '2024-08-26 11:57:56', '2024-08-26 11:57:56'),
(418, 27, 'SKU-Đen-S', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-09-10 20:29:48'),
(419, 27, 'SKU-Đen-M', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(420, 27, 'SKU-Đen-L', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(421, 27, 'SKU-Đỏ-S', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(422, 27, 'SKU-Đỏ-M', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(423, 27, 'SKU-Đỏ-L', 102, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-09-10 20:28:25'),
(424, 27, 'SKU-Trắng-S', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(425, 27, 'SKU-Trắng-M', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(426, 27, 'SKU-Trắng-L', 100, 199999.00, NULL, 1, NULL, '2024-08-26 12:04:39', '2024-08-26 12:04:39'),
(427, 28, 'SKU-Đen-S', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(428, 28, 'SKU-Đen-M', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(429, 28, 'SKU-Đỏ-S', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(430, 28, 'SKU-Đỏ-M', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(431, 28, 'SKU-Trắng-S', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(432, 28, 'SKU-Trắng-M', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(433, 28, 'SKU-Hồng-S', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(434, 28, 'SKU-Hồng-M', 100, 199500.00, NULL, 1, NULL, '2024-08-26 12:07:06', '2024-08-26 12:07:06'),
(435, 29, 'SKU-Đen-S', 114, 469000.00, NULL, 1, NULL, '2024-08-26 12:12:10', '2024-09-18 09:10:43'),
(436, 29, 'SKU-Đỏ-S', 100, 469000.00, NULL, 1, NULL, '2024-08-26 12:12:10', '2024-08-26 12:12:10'),
(437, 29, 'SKU-Trắng-S', 100, 469000.00, NULL, 1, NULL, '2024-08-26 12:12:10', '2024-08-26 12:12:10'),
(438, 29, 'SKU-Hồng-S', 100, 469000.00, NULL, 1, NULL, '2024-08-26 12:12:10', '2024-08-26 12:12:10'),
(439, 30, 'SKU-Đen-S', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-09-18 17:52:51'),
(440, 30, 'SKU-Đen-M', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-09-18 17:52:51'),
(441, 30, 'SKU-Đỏ-S', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-08-26 12:15:45'),
(442, 30, 'SKU-Đỏ-M', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-08-26 12:15:45'),
(443, 30, 'SKU-Trắng-S', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-08-26 12:15:45'),
(444, 30, 'SKU-Trắng-M', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-09-18 17:52:51'),
(445, 30, 'SKU-Hồng-S', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-09-18 17:52:51'),
(446, 30, 'SKU-Hồng-M', 100, 149000.00, NULL, 1, NULL, '2024-08-26 12:15:45', '2024-08-26 12:15:45'),
(447, 31, 'SKU-Trắng-S', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(448, 31, 'SKU-Trắng-M', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(449, 31, 'SKU-Trắng-L', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(450, 31, 'SKU-Hồng-S', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(451, 31, 'SKU-Hồng-M', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(452, 31, 'SKU-Hồng-L', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:18:23', '2024-08-26 12:18:23'),
(453, 32, 'SKU-Trắng-S', 108, 349500.00, NULL, 1, NULL, '2024-08-26 12:20:18', '2024-09-18 15:06:41'),
(454, 32, 'SKU-Trắng-M', 102, 349500.00, NULL, 1, NULL, '2024-08-26 12:20:18', '2024-09-18 15:06:41'),
(455, 32, 'SKU-Hồng-S', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:20:18', '2024-08-26 12:20:18'),
(456, 32, 'SKU-Hồng-M', 100, 349500.00, NULL, 1, NULL, '2024-08-26 12:20:18', '2024-08-26 12:20:18'),
(457, 33, 'SKU-Đen-S', 104, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-09-18 15:06:41'),
(458, 33, 'SKU-Đen-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(459, 33, 'SKU-Đen-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(460, 33, 'SKU-Đen-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(461, 33, 'SKU-Đỏ-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(462, 33, 'SKU-Đỏ-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(463, 33, 'SKU-Đỏ-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(464, 33, 'SKU-Đỏ-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(465, 33, 'SKU-Trắng-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(466, 33, 'SKU-Trắng-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(467, 33, 'SKU-Trắng-L', 104, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-09-18 15:06:41'),
(468, 33, 'SKU-Trắng-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(469, 33, 'SKU-Hồng-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(470, 33, 'SKU-Hồng-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(471, 33, 'SKU-Hồng-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-08-26 12:22:50'),
(472, 33, 'SKU-Hồng-XL', 106, 369000.00, NULL, 1, NULL, '2024-08-26 12:22:50', '2024-09-18 15:06:41'),
(473, 34, 'SKU-Đỏ-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(474, 34, 'SKU-Đỏ-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(475, 34, 'SKU-Đỏ-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(476, 34, 'SKU-Đỏ-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(477, 34, 'SKU-Trắng-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(478, 34, 'SKU-Trắng-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(479, 34, 'SKU-Trắng-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(480, 34, 'SKU-Trắng-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(481, 34, 'SKU-Hồng-S', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(482, 34, 'SKU-Hồng-M', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(483, 34, 'SKU-Hồng-L', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(484, 34, 'SKU-Hồng-XL', 100, 369000.00, NULL, 1, NULL, '2024-08-26 12:27:22', '2024-08-26 12:27:22'),
(485, 35, 'SKU-Đen-S', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(486, 35, 'SKU-Đen-M', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(487, 35, 'SKU-Đen-L', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(488, 35, 'SKU-Đen-XL', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(489, 35, 'SKU-Đỏ-S', 108, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-09-18 14:56:33'),
(490, 35, 'SKU-Đỏ-M', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(491, 35, 'SKU-Đỏ-L', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(492, 35, 'SKU-Đỏ-XL', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(493, 35, 'SKU-Trắng-S', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(494, 35, 'SKU-Trắng-M', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(495, 35, 'SKU-Trắng-L', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(496, 35, 'SKU-Trắng-XL', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(497, 35, 'SKU-Hồng-S', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(498, 35, 'SKU-Hồng-M', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(499, 35, 'SKU-Hồng-L', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(500, 35, 'SKU-Hồng-XL', 100, 989000.00, NULL, 1, NULL, '2024-08-26 12:30:42', '2024-08-26 12:30:42'),
(501, 36, 'SKU-Đen-S', 101, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-09-18 17:52:41'),
(502, 36, 'SKU-Đen-M', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(503, 36, 'SKU-Đen-L', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(504, 36, 'SKU-Đen-XL', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(505, 36, 'SKU-Đỏ-S', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(506, 36, 'SKU-Đỏ-M', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(507, 36, 'SKU-Đỏ-L', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(508, 36, 'SKU-Đỏ-XL', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(509, 36, 'SKU-Trắng-S', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(510, 36, 'SKU-Trắng-M', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(511, 36, 'SKU-Trắng-L', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(512, 36, 'SKU-Trắng-XL', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(513, 36, 'SKU-Hồng-S', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(514, 36, 'SKU-Hồng-M', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(515, 36, 'SKU-Hồng-L', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(516, 36, 'SKU-Hồng-XL', 100, 599000.00, NULL, 1, NULL, '2024-08-26 12:31:58', '2024-08-26 12:31:58'),
(781, 76, 'SKU-Trắng-M', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(782, 76, 'SKU-Trắng-L', 21, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(783, 76, 'SKU-Trắng-XL', 22, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(784, 76, 'SKU-Trắng-2XL', 23, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(785, 76, 'SKU-Trắng-3XL', 20, 584000.00, NULL, 1, '2024-09-18 12:51:19', '2024-09-18 12:51:15', '2024-09-18 12:51:19'),
(786, 76, 'SKU-Xám-M', 24, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(787, 76, 'SKU-Xám-L', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(788, 76, 'SKU-Xám-XL', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(789, 76, 'SKU-Xám-2XL', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:15', '2024-09-18 12:52:01'),
(790, 76, 'SKU-Xám-3XL', 20, 584000.00, NULL, 1, '2024-09-18 12:51:19', '2024-09-18 12:51:15', '2024-09-18 12:51:19'),
(791, 76, 'SKU-Trắng-3XL', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:25', '2024-09-18 12:52:01'),
(792, 76, 'SKU-Xám-3XL', 20, 584000.00, NULL, 1, NULL, '2024-09-18 12:51:25', '2024-09-18 12:52:01'),
(793, 77, 'SKU-Nâu-M', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(794, 77, 'SKU-Nâu-L', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(795, 77, 'SKU-Nâu-2XL', 35, 422.10, NULL, 1, '2024-09-18 12:56:46', '2024-09-18 12:56:23', '2024-09-18 12:56:46'),
(796, 77, 'SKU-Cam-M', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(797, 77, 'SKU-Cam-L', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(798, 77, 'SKU-Cam-2XL', 35, 422.10, NULL, 1, '2024-09-18 12:56:46', '2024-09-18 12:56:23', '2024-09-18 12:56:46'),
(799, 77, 'SKU-Xám-M', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(800, 77, 'SKU-Xám-L', 35, 422.10, NULL, 1, '2024-09-18 12:57:05', '2024-09-18 12:56:23', '2024-09-18 12:57:05'),
(801, 77, 'SKU-Xám-2XL', 35, 422.10, NULL, 1, '2024-09-18 12:56:46', '2024-09-18 12:56:23', '2024-09-18 12:56:46'),
(802, 77, 'SKU-Đen-S', 35, 422.10, NULL, 1, '2024-09-18 12:57:25', '2024-09-18 12:57:05', '2024-09-18 12:57:25'),
(803, 77, 'SKU-M-Nâu', 32, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(804, 77, 'SKU-M-Xám', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(805, 77, 'SKU-M-Cam', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(806, 77, 'SKU-L-Nâu', 39, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(807, 77, 'SKU-L-Xám', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(808, 77, 'SKU-L-Cam', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(809, 77, 'SKU-2XL-Nâu', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(810, 77, 'SKU-2XL-Xám', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(811, 77, 'SKU-2XL-Cam', 35, 422000.00, NULL, 1, '2024-09-18 18:10:13', '2024-09-18 12:57:25', '2024-09-18 18:10:13'),
(812, 78, 'SKU-L-Trắng', 23, 413000.00, NULL, 1, NULL, '2024-09-18 13:00:07', '2024-09-18 17:52:41'),
(813, 78, 'SKU-L-Xám', 21, 413000.00, NULL, 1, NULL, '2024-09-18 13:00:07', '2024-09-18 14:59:34'),
(814, 78, 'SKU-XL-Trắng', 12, 413000.00, NULL, 1, NULL, '2024-09-18 13:00:07', '2024-09-18 13:00:15'),
(815, 78, 'SKU-XL-Xám', 21, 413000.00, NULL, 1, NULL, '2024-09-18 13:00:07', '2024-09-18 13:00:15'),
(816, 79, 'SKU-Cam-M', 20, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 17:52:19'),
(817, 79, 'SKU-Cam-L', 18, 530000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(818, 79, 'SKU-Trắng-M', 14, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(819, 79, 'SKU-Trắng-L', 18, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(820, 79, 'SKU-Hồng-M', 16, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(821, 79, 'SKU-Hồng-L', 19, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(822, 79, 'SKU-Đỏ-M', 17, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(823, 79, 'SKU-Đỏ-L', 18, 539000.00, NULL, 1, NULL, '2024-09-18 13:02:21', '2024-09-18 13:02:46'),
(824, 80, 'SKU-Nâu-L', 19, 719000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 14:47:07'),
(825, 80, 'SKU-Nâu-M', 18, 718000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 14:47:07'),
(826, 80, 'SKU-Đen-L', 17, 717000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 14:47:07'),
(827, 80, 'SKU-Đen-M', 16, 716000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 14:47:07'),
(828, 80, 'SKU-Cam-L', 21, 719000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 14:47:07'),
(829, 80, 'SKU-Cam-M', 21, 719000.00, NULL, 1, NULL, '2024-09-18 13:04:26', '2024-09-18 13:04:37'),
(830, 81, 'SKU-Đen-S', 20, 200000.00, NULL, 1, NULL, '2024-09-18 13:06:45', '2024-09-18 14:35:21'),
(831, 81, 'SKU-Đen-M', 27, 250000.00, NULL, 1, NULL, '2024-09-18 13:06:45', '2024-09-18 14:59:34'),
(832, 81, 'SKU-Hồng-S', 30, 250000.00, NULL, 1, NULL, '2024-09-18 13:06:45', '2024-09-18 14:35:21'),
(833, 81, 'SKU-Hồng-M', 30, 250000.00, NULL, 1, NULL, '2024-09-18 13:06:45', '2024-09-18 14:35:21'),
(834, 82, 'SKU-Đỏ-S', 23, 99000.00, NULL, 1, NULL, '2024-09-18 14:16:24', '2024-09-18 14:16:24'),
(835, 83, 'SKU-Đen-S', 21, 250000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(836, 83, 'SKU-Đen-M', 22, 270000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(837, 83, 'SKU-Đỏ-S', 23, 250000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(838, 83, 'SKU-Đỏ-M', 24, 270000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(839, 83, 'SKU-Trắng-S', 25, 250000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(840, 83, 'SKU-Trắng-M', 26, 270000.00, NULL, 1, NULL, '2024-09-18 17:59:30', '2024-09-18 18:00:40'),
(841, 83, 'SKU-Đen-L', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(842, 83, 'SKU-Đen-XL', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(843, 83, 'SKU-Đỏ-L', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(844, 83, 'SKU-Đỏ-XL', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(845, 83, 'SKU-Trắng-L', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(846, 83, 'SKU-Trắng-XL', 20, 250000.00, NULL, 1, '2024-09-18 17:59:52', '2024-09-18 17:59:43', '2024-09-18 17:59:52'),
(847, 84, 'SKU-Đen-S', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(848, 84, 'SKU-Đen-M', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(849, 84, 'SKU-Đen-L', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(850, 84, 'SKU-Đỏ-S', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(851, 84, 'SKU-Đỏ-M', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(852, 84, 'SKU-Đỏ-L', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(853, 84, 'SKU-Trắng-S', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(854, 84, 'SKU-Trắng-M', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(855, 84, 'SKU-Trắng-L', 0, 0.00, NULL, 1, NULL, '2024-09-18 18:05:02', '2024-09-18 18:05:44'),
(856, 77, 'SKU-Đỏ-4XL', 35, 422000.00, NULL, 1, NULL, '2024-09-18 18:10:13', '2024-09-18 18:10:13'),
(857, 77, 'SKU-Đỏ-3XL', 35, 422000.00, NULL, 1, NULL, '2024-09-18 18:10:13', '2024-09-18 18:10:13'),
(858, 77, 'SKU-Đen-4XL', 35, 422000.00, NULL, 1, NULL, '2024-09-18 18:10:13', '2024-09-18 18:10:13'),
(859, 77, 'SKU-Đen-3XL', 35, 422000.00, NULL, 1, NULL, '2024-09-18 18:10:13', '2024-09-18 18:10:13'),
(860, 85, 'SKU-Đen-M', 43, 99000.00, NULL, 1, '2024-09-22 20:35:39', '2024-09-22 20:34:26', '2024-09-22 20:35:39'),
(861, 85, 'SKU-Đen-S', 43, 99000.00, NULL, 1, '2024-09-22 20:39:23', '2024-09-22 20:34:26', '2024-09-22 20:39:23'),
(862, 85, 'SKU-Đỏ-M', 43, 99000.00, NULL, 1, '2024-09-22 20:35:13', '2024-09-22 20:34:26', '2024-09-22 20:35:13'),
(863, 85, 'SKU-Đỏ-S', 43, 99000.00, NULL, 1, '2024-09-22 20:35:13', '2024-09-22 20:34:26', '2024-09-22 20:35:13'),
(864, 85, 'SKU-Đen-XL', 43, 99000.00, NULL, 1, '2024-09-22 20:35:08', '2024-09-22 20:35:05', '2024-09-22 20:35:08'),
(865, 85, 'SKU-Đỏ-XL', 43, 99000.00, NULL, 1, '2024-09-22 20:35:08', '2024-09-22 20:35:05', '2024-09-22 20:35:08'),
(866, 85, 'SKU-Đỏ-M', 43, 99000.00, NULL, 1, '2024-09-22 20:35:39', '2024-09-22 20:35:18', '2024-09-22 20:35:39'),
(867, 85, 'SKU-Đỏ-S', 43, 99000.00, NULL, 1, '2024-09-22 20:39:23', '2024-09-22 20:35:18', '2024-09-22 20:39:23'),
(868, 85, 'SKU-Trắng-M', 43, 99000.00, NULL, 1, '2024-09-22 20:35:39', '2024-09-22 20:35:18', '2024-09-22 20:35:39'),
(869, 85, 'SKU-Trắng-S', 43, 99000.00, NULL, 1, '2024-09-22 20:35:39', '2024-09-22 20:35:18', '2024-09-22 20:35:39'),
(870, 85, 'SKU-', 43, 99000.00, NULL, 1, '2024-09-22 20:39:29', '2024-09-22 20:39:23', '2024-09-22 20:39:29'),
(871, 85, 'SKU-Đỏ', 43, 99000.00, NULL, 1, NULL, '2024-09-22 20:39:29', '2024-09-22 20:39:29'),
(872, 85, 'SKU-Trắng', 43, 99000.00, NULL, 1, NULL, '2024-09-22 20:39:29', '2024-09-22 20:39:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sclasses`
--

CREATE TABLE `sclasses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `role`, `email_verified_at`, `password`, `date_of_birth`, `address`, `phone_number`, `points`, `remember_token`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Root', NULL, 'root@gmail.com', 'admin', NULL, '$2y$12$c95J/rYvbADvnY71kU8g/eAxrGmu0p2eRXWTGLjSAqx4j.i1EVrJa', '2024-07-18', 'Hà Nội', '0987654321', 0, NULL, 'Active', NULL, '2024-07-17 14:01:57', '2024-08-26 17:25:51'),
(3, 'Customer', NULL, 'customer@gmail.com', 'user', NULL, '$2y$12$WfFck/HoO.emVNGMyGFLDesR42m3FZq/p56E2tI71bewAsL0gswvy', '2024-08-06', 'Hà Nội', '0987654321', 0, NULL, 'Active', NULL, '2024-08-26 13:09:32', '2024-08-26 13:09:32'),
(4, 'AdminRole', NULL, 'adminrole@gmail.com', 'admin', NULL, '$2y$12$i9ACqPZvbzKF23N35GkXj.SG/ZqRDvLycE2iUTgtjbYFQto4q2d4.', '2024-08-06', 'Hà Nội', '0987654321', 0, NULL, 'Active', NULL, '2024-08-26 13:13:24', '2024-08-26 13:13:24'),
(5, 'Hữu Tiến', NULL, 'tienbhph15160@fpt.edu.vn', 'user', NULL, '$2y$12$BmxfmTNEdidAciT0CaXj/ucKEpoJ/3LaXb3o860tgm7BdYfXW44.O', '2009-02-11', NULL, '0963421043', 0, NULL, 'Active', NULL, '2024-09-18 11:23:01', '2024-09-18 17:54:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant_attributes`
--

CREATE TABLE `variant_attributes` (
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value_id` bigint(20) UNSIGNED NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `variant_attributes`
--

INSERT INTO `variant_attributes` (`variant_id`, `attribute_id`, `value_id`, `id`, `deleted_at`) VALUES
(202, 1, 1, 386, NULL),
(202, 2, 8, 387, NULL),
(203, 1, 1, 389, NULL),
(203, 2, 8, 390, NULL),
(204, 1, 1, 392, NULL),
(204, 2, 8, 393, NULL),
(205, 1, 1, 395, NULL),
(205, 2, 8, 396, NULL),
(206, 1, 1, 398, NULL),
(206, 2, 8, 399, NULL),
(207, 1, 1, 401, NULL),
(207, 2, 8, 402, NULL),
(208, 1, 1, 404, NULL),
(208, 2, 9, 405, NULL),
(209, 1, 1, 407, NULL),
(209, 2, 9, 408, NULL),
(210, 1, 1, 410, NULL),
(210, 2, 9, 411, NULL),
(211, 1, 1, 413, NULL),
(211, 2, 10, 414, NULL),
(212, 1, 1, 416, NULL),
(212, 2, 10, 417, NULL),
(213, 1, 1, 419, NULL),
(213, 2, 10, 420, NULL),
(214, 1, 2, 422, NULL),
(214, 2, 8, 423, NULL),
(215, 1, 2, 425, NULL),
(215, 2, 8, 426, NULL),
(216, 1, 2, 428, NULL),
(216, 2, 8, 429, NULL),
(217, 1, 2, 431, NULL),
(217, 2, 9, 432, NULL),
(218, 1, 2, 434, NULL),
(218, 2, 9, 435, NULL),
(219, 1, 2, 437, NULL),
(219, 2, 9, 438, NULL),
(220, 1, 2, 440, NULL),
(220, 2, 10, 441, NULL),
(221, 1, 2, 443, NULL),
(221, 2, 10, 444, NULL),
(222, 1, 2, 446, NULL),
(222, 2, 10, 447, NULL),
(223, 1, 3, 449, NULL),
(223, 2, 8, 450, NULL),
(224, 1, 3, 452, NULL),
(224, 2, 8, 453, NULL),
(225, 1, 3, 455, NULL),
(225, 2, 8, 456, NULL),
(226, 1, 3, 458, NULL),
(226, 2, 9, 459, NULL),
(227, 1, 3, 461, NULL),
(227, 2, 9, 462, NULL),
(228, 1, 3, 464, NULL),
(228, 2, 9, 465, NULL),
(229, 1, 3, 467, NULL),
(229, 2, 10, 468, NULL),
(230, 1, 3, 470, NULL),
(230, 2, 10, 471, NULL),
(231, 1, 3, 473, NULL),
(231, 2, 10, 474, NULL),
(232, 1, 1, 476, NULL),
(232, 2, 8, 477, NULL),
(233, 1, 1, 479, NULL),
(233, 2, 8, 480, NULL),
(234, 1, 1, 482, NULL),
(234, 2, 8, 483, NULL),
(235, 1, 1, 485, NULL),
(235, 2, 9, 486, NULL),
(236, 1, 1, 488, NULL),
(236, 2, 9, 489, NULL),
(237, 1, 1, 491, NULL),
(237, 2, 9, 492, NULL),
(238, 1, 1, 494, NULL),
(238, 2, 10, 495, NULL),
(239, 1, 1, 497, NULL),
(239, 2, 10, 498, NULL),
(240, 1, 1, 500, NULL),
(240, 2, 10, 501, NULL),
(241, 1, 2, 503, NULL),
(241, 2, 8, 504, NULL),
(242, 1, 2, 506, NULL),
(242, 2, 8, 507, NULL),
(243, 1, 2, 509, NULL),
(243, 2, 8, 510, NULL),
(244, 1, 2, 512, NULL),
(244, 2, 9, 513, NULL),
(245, 1, 2, 515, NULL),
(245, 2, 9, 516, NULL),
(246, 1, 2, 518, NULL),
(246, 2, 9, 519, NULL),
(247, 1, 2, 521, NULL),
(247, 2, 10, 522, NULL),
(248, 1, 2, 524, NULL),
(248, 2, 10, 525, NULL),
(249, 1, 2, 527, NULL),
(249, 2, 10, 528, NULL),
(250, 1, 3, 530, NULL),
(250, 2, 8, 531, NULL),
(251, 1, 3, 533, NULL),
(251, 2, 8, 534, NULL),
(252, 1, 3, 536, NULL),
(252, 2, 8, 537, NULL),
(253, 1, 3, 539, NULL),
(253, 2, 9, 540, NULL),
(254, 1, 3, 542, NULL),
(254, 2, 9, 543, NULL),
(255, 1, 3, 545, NULL),
(255, 2, 9, 546, NULL),
(256, 1, 3, 548, NULL),
(256, 2, 10, 549, NULL),
(257, 1, 3, 551, NULL),
(257, 2, 10, 552, NULL),
(258, 1, 3, 554, NULL),
(258, 2, 10, 555, NULL),
(259, 1, 1, 557, NULL),
(259, 2, 8, 558, NULL),
(260, 1, 1, 560, NULL),
(260, 2, 8, 561, NULL),
(261, 1, 1, 563, NULL),
(261, 2, 8, 564, NULL),
(262, 1, 1, 566, NULL),
(262, 2, 9, 567, NULL),
(263, 1, 1, 569, NULL),
(263, 2, 9, 570, NULL),
(264, 1, 1, 572, NULL),
(264, 2, 9, 573, NULL),
(265, 1, 1, 575, NULL),
(265, 2, 10, 576, NULL),
(266, 1, 1, 578, NULL),
(266, 2, 10, 579, NULL),
(267, 1, 1, 581, NULL),
(267, 2, 10, 582, NULL),
(268, 1, 1, 584, NULL),
(268, 2, 11, 585, NULL),
(269, 1, 1, 587, NULL),
(269, 2, 11, 588, NULL),
(270, 1, 1, 590, NULL),
(270, 2, 11, 591, NULL),
(271, 1, 1, 593, NULL),
(271, 2, 12, 594, NULL),
(272, 1, 1, 596, NULL),
(272, 2, 12, 597, NULL),
(273, 1, 1, 599, NULL),
(273, 2, 12, 600, NULL),
(274, 1, 1, 602, NULL),
(274, 2, 13, 603, NULL),
(275, 1, 1, 605, NULL),
(275, 2, 13, 606, NULL),
(276, 1, 1, 608, NULL),
(276, 2, 13, 609, NULL),
(277, 1, 2, 611, NULL),
(277, 2, 8, 612, NULL),
(278, 1, 2, 614, NULL),
(278, 2, 8, 615, NULL),
(279, 1, 2, 617, NULL),
(279, 2, 8, 618, NULL),
(280, 1, 2, 620, NULL),
(280, 2, 9, 621, NULL),
(281, 1, 2, 623, NULL),
(281, 2, 9, 624, NULL),
(282, 1, 2, 626, NULL),
(282, 2, 9, 627, NULL),
(283, 1, 2, 629, NULL),
(283, 2, 10, 630, NULL),
(284, 1, 2, 632, NULL),
(284, 2, 10, 633, NULL),
(285, 1, 2, 635, NULL),
(285, 2, 10, 636, NULL),
(286, 1, 2, 638, NULL),
(286, 2, 11, 639, NULL),
(287, 1, 2, 641, NULL),
(287, 2, 11, 642, NULL),
(288, 1, 2, 644, NULL),
(288, 2, 11, 645, NULL),
(289, 1, 2, 647, NULL),
(289, 2, 12, 648, NULL),
(290, 1, 2, 650, NULL),
(290, 2, 12, 651, NULL),
(291, 1, 2, 653, NULL),
(291, 2, 12, 654, NULL),
(292, 1, 2, 656, NULL),
(292, 2, 13, 657, NULL),
(293, 1, 2, 659, NULL),
(293, 2, 13, 660, NULL),
(294, 1, 2, 662, NULL),
(294, 2, 13, 663, NULL),
(295, 1, 1, 665, NULL),
(295, 2, 8, 666, NULL),
(296, 1, 1, 667, NULL),
(296, 2, 9, 668, NULL),
(297, 1, 1, 669, NULL),
(297, 2, 10, 670, NULL),
(298, 1, 1, 671, NULL),
(298, 2, 11, 672, NULL),
(299, 1, 1, 673, NULL),
(299, 2, 12, 674, NULL),
(300, 1, 1, 675, NULL),
(300, 2, 13, 676, NULL),
(301, 1, 2, 677, NULL),
(301, 2, 8, 678, NULL),
(302, 1, 2, 679, NULL),
(302, 2, 9, 680, NULL),
(303, 1, 2, 681, NULL),
(303, 2, 10, 682, NULL),
(304, 1, 2, 683, NULL),
(304, 2, 11, 684, NULL),
(305, 1, 2, 685, NULL),
(305, 2, 12, 686, NULL),
(306, 1, 2, 687, NULL),
(306, 2, 13, 688, NULL),
(307, 1, 3, 689, NULL),
(307, 2, 8, 690, NULL),
(308, 1, 3, 691, NULL),
(308, 2, 9, 692, NULL),
(309, 1, 3, 693, NULL),
(309, 2, 10, 694, NULL),
(310, 1, 3, 695, NULL),
(310, 2, 11, 696, NULL),
(311, 1, 3, 697, NULL),
(311, 2, 12, 698, NULL),
(312, 1, 3, 699, NULL),
(312, 2, 13, 700, NULL),
(313, 1, 4, 701, NULL),
(313, 2, 8, 702, NULL),
(314, 1, 4, 703, NULL),
(314, 2, 9, 704, NULL),
(315, 1, 4, 705, NULL),
(315, 2, 10, 706, NULL),
(316, 1, 4, 707, NULL),
(316, 2, 11, 708, NULL),
(317, 1, 4, 709, NULL),
(317, 2, 12, 710, NULL),
(318, 1, 4, 711, NULL),
(318, 2, 13, 712, NULL),
(319, 1, 2, 713, NULL),
(319, 2, 8, 714, NULL),
(320, 1, 2, 715, NULL),
(320, 2, 9, 716, NULL),
(321, 1, 2, 717, NULL),
(321, 2, 10, 718, NULL),
(322, 1, 2, 719, NULL),
(322, 2, 11, 720, NULL),
(323, 1, 2, 721, NULL),
(323, 2, 12, 722, NULL),
(324, 1, 3, 723, NULL),
(324, 2, 8, 724, NULL),
(325, 1, 3, 725, NULL),
(325, 2, 9, 726, NULL),
(326, 1, 3, 727, NULL),
(326, 2, 10, 728, NULL),
(327, 1, 3, 729, NULL),
(327, 2, 11, 730, NULL),
(328, 1, 3, 731, NULL),
(328, 2, 12, 732, NULL),
(329, 1, 4, 733, NULL),
(329, 2, 8, 734, NULL),
(330, 1, 4, 735, NULL),
(330, 2, 9, 736, NULL),
(331, 1, 4, 737, NULL),
(331, 2, 10, 738, NULL),
(332, 1, 4, 739, NULL),
(332, 2, 11, 740, NULL),
(333, 1, 4, 741, NULL),
(333, 2, 12, 742, NULL),
(334, 1, 1, 743, NULL),
(334, 2, 8, 744, NULL),
(335, 1, 1, 745, NULL),
(335, 2, 9, 746, NULL),
(336, 1, 1, 747, NULL),
(336, 2, 10, 748, NULL),
(337, 1, 1, 749, NULL),
(337, 2, 11, 750, NULL),
(338, 1, 1, 751, NULL),
(338, 2, 12, 752, NULL),
(339, 1, 2, 753, NULL),
(339, 2, 8, 754, NULL),
(340, 1, 2, 755, NULL),
(340, 2, 9, 756, NULL),
(341, 1, 2, 757, NULL),
(341, 2, 10, 758, NULL),
(342, 1, 2, 759, NULL),
(342, 2, 11, 760, NULL),
(343, 1, 2, 761, NULL),
(343, 2, 12, 762, NULL),
(344, 1, 3, 763, NULL),
(344, 2, 8, 764, NULL),
(345, 1, 3, 765, NULL),
(345, 2, 9, 766, NULL),
(346, 1, 3, 767, NULL),
(346, 2, 10, 768, NULL),
(347, 1, 3, 769, NULL),
(347, 2, 11, 770, NULL),
(348, 1, 3, 771, NULL),
(348, 2, 12, 772, NULL),
(349, 1, 4, 773, NULL),
(349, 2, 8, 774, NULL),
(350, 1, 4, 775, NULL),
(350, 2, 9, 776, NULL),
(351, 1, 4, 777, NULL),
(351, 2, 10, 778, NULL),
(352, 1, 4, 779, NULL),
(352, 2, 11, 780, NULL),
(353, 1, 4, 781, NULL),
(353, 2, 12, 782, NULL),
(354, 1, 1, 783, NULL),
(354, 2, 8, 784, NULL),
(355, 1, 1, 785, NULL),
(355, 2, 9, 786, NULL),
(356, 1, 1, 787, NULL),
(356, 2, 10, 788, NULL),
(357, 1, 1, 789, NULL),
(357, 2, 11, 790, NULL),
(358, 1, 1, 791, NULL),
(358, 2, 12, 792, NULL),
(359, 1, 2, 793, NULL),
(359, 2, 8, 794, NULL),
(360, 1, 2, 795, NULL),
(360, 2, 9, 796, NULL),
(361, 1, 2, 797, NULL),
(361, 2, 10, 798, NULL),
(362, 1, 2, 799, NULL),
(362, 2, 11, 800, NULL),
(363, 1, 2, 801, NULL),
(363, 2, 12, 802, NULL),
(364, 1, 3, 803, NULL),
(364, 2, 8, 804, NULL),
(365, 1, 3, 805, NULL),
(365, 2, 9, 806, NULL),
(366, 1, 3, 807, NULL),
(366, 2, 10, 808, NULL),
(367, 1, 3, 809, NULL),
(367, 2, 11, 810, NULL),
(368, 1, 3, 811, NULL),
(368, 2, 12, 812, NULL),
(369, 1, 4, 813, NULL),
(369, 2, 8, 814, NULL),
(370, 1, 4, 815, NULL),
(370, 2, 9, 816, NULL),
(371, 1, 4, 817, NULL),
(371, 2, 10, 818, NULL),
(372, 1, 4, 819, NULL),
(372, 2, 11, 820, NULL),
(373, 1, 4, 821, NULL),
(373, 2, 12, 822, NULL),
(374, 1, 1, 823, NULL),
(374, 2, 8, 824, NULL),
(375, 1, 1, 825, NULL),
(375, 2, 9, 826, NULL),
(376, 1, 1, 827, NULL),
(376, 2, 10, 828, NULL),
(377, 1, 1, 829, NULL),
(377, 2, 11, 830, NULL),
(378, 1, 2, 831, NULL),
(378, 2, 8, 832, NULL),
(379, 1, 2, 833, NULL),
(379, 2, 9, 834, NULL),
(380, 1, 2, 835, NULL),
(380, 2, 10, 836, NULL),
(381, 1, 2, 837, NULL),
(381, 2, 11, 838, NULL),
(382, 1, 3, 839, NULL),
(382, 2, 8, 840, NULL),
(383, 1, 3, 841, NULL),
(383, 2, 9, 842, NULL),
(384, 1, 3, 843, NULL),
(384, 2, 10, 844, NULL),
(385, 1, 3, 845, NULL),
(385, 2, 11, 846, NULL),
(386, 1, 4, 847, NULL),
(386, 2, 8, 848, NULL),
(387, 1, 4, 849, NULL),
(387, 2, 9, 850, NULL),
(388, 1, 4, 851, NULL),
(388, 2, 10, 852, NULL),
(389, 1, 4, 853, NULL),
(389, 2, 11, 854, NULL),
(390, 1, 5, 855, NULL),
(390, 2, 8, 856, NULL),
(391, 1, 5, 857, NULL),
(391, 2, 9, 858, NULL),
(392, 1, 5, 859, NULL),
(392, 2, 10, 860, NULL),
(393, 1, 5, 861, NULL),
(393, 2, 11, 862, NULL),
(394, 1, 1, 863, NULL),
(394, 2, 8, 864, NULL),
(395, 1, 1, 865, NULL),
(395, 2, 9, 866, NULL),
(396, 1, 1, 867, NULL),
(396, 2, 10, 868, NULL),
(397, 1, 1, 869, NULL),
(397, 2, 11, 870, NULL),
(398, 1, 2, 871, NULL),
(398, 2, 8, 872, NULL),
(399, 1, 2, 873, NULL),
(399, 2, 9, 874, NULL),
(400, 1, 2, 875, NULL),
(400, 2, 10, 876, NULL),
(401, 1, 2, 877, NULL),
(401, 2, 11, 878, NULL),
(402, 1, 3, 879, NULL),
(402, 2, 8, 880, NULL),
(403, 1, 3, 881, NULL),
(403, 2, 9, 882, NULL),
(404, 1, 3, 883, NULL),
(404, 2, 10, 884, NULL),
(405, 1, 3, 885, NULL),
(405, 2, 11, 886, NULL),
(406, 1, 4, 887, NULL),
(406, 2, 8, 888, NULL),
(407, 1, 4, 889, NULL),
(407, 2, 9, 890, NULL),
(408, 1, 4, 891, NULL),
(408, 2, 10, 892, NULL),
(409, 1, 4, 893, NULL),
(409, 2, 11, 894, NULL),
(410, 1, 5, 895, NULL),
(410, 2, 8, 896, NULL),
(411, 1, 5, 897, NULL),
(411, 2, 9, 898, NULL),
(412, 1, 5, 899, NULL),
(412, 2, 10, 900, NULL),
(413, 1, 5, 901, NULL),
(413, 2, 11, 902, NULL),
(414, 1, 2, 903, NULL),
(414, 2, 8, 904, NULL),
(415, 1, 2, 905, NULL),
(415, 2, 9, 906, NULL),
(416, 1, 3, 907, NULL),
(416, 2, 8, 908, NULL),
(417, 1, 3, 909, NULL),
(417, 2, 9, 910, NULL),
(418, 1, 1, 911, NULL),
(418, 2, 8, 912, NULL),
(419, 1, 1, 913, NULL),
(419, 2, 9, 914, NULL),
(420, 1, 1, 915, NULL),
(420, 2, 10, 916, NULL),
(421, 1, 2, 917, NULL),
(421, 2, 8, 918, NULL),
(422, 1, 2, 919, NULL),
(422, 2, 9, 920, NULL),
(423, 1, 2, 921, NULL),
(423, 2, 10, 922, NULL),
(424, 1, 3, 923, NULL),
(424, 2, 8, 924, NULL),
(425, 1, 3, 925, NULL),
(425, 2, 9, 926, NULL),
(426, 1, 3, 927, NULL),
(426, 2, 10, 928, NULL),
(427, 1, 1, 929, NULL),
(427, 2, 8, 930, NULL),
(428, 1, 1, 931, NULL),
(428, 2, 9, 932, NULL),
(429, 1, 2, 933, NULL),
(429, 2, 8, 934, NULL),
(430, 1, 2, 935, NULL),
(430, 2, 9, 936, NULL),
(431, 1, 3, 937, NULL),
(431, 2, 8, 938, NULL),
(432, 1, 3, 939, NULL),
(432, 2, 9, 940, NULL),
(433, 1, 4, 941, NULL),
(433, 2, 8, 942, NULL),
(434, 1, 4, 943, NULL),
(434, 2, 9, 944, NULL),
(435, 1, 1, 945, NULL),
(435, 2, 8, 946, NULL),
(436, 1, 2, 947, NULL),
(436, 2, 8, 948, NULL),
(437, 1, 3, 949, NULL),
(437, 2, 8, 950, NULL),
(438, 1, 4, 951, NULL),
(438, 2, 8, 952, NULL),
(439, 1, 1, 953, NULL),
(439, 2, 8, 954, NULL),
(440, 1, 1, 955, NULL),
(440, 2, 9, 956, NULL),
(441, 1, 2, 957, NULL),
(441, 2, 8, 958, NULL),
(442, 1, 2, 959, NULL),
(442, 2, 9, 960, NULL),
(443, 1, 3, 961, NULL),
(443, 2, 8, 962, NULL),
(444, 1, 3, 963, NULL),
(444, 2, 9, 964, NULL),
(445, 1, 4, 965, NULL),
(445, 2, 8, 966, NULL),
(446, 1, 4, 967, NULL),
(446, 2, 9, 968, NULL),
(447, 1, 3, 969, NULL),
(447, 2, 8, 970, NULL),
(448, 1, 3, 971, NULL),
(448, 2, 9, 972, NULL),
(449, 1, 3, 973, NULL),
(449, 2, 10, 974, NULL),
(450, 1, 4, 975, NULL),
(450, 2, 8, 976, NULL),
(451, 1, 4, 977, NULL),
(451, 2, 9, 978, NULL),
(452, 1, 4, 979, NULL),
(452, 2, 10, 980, NULL),
(453, 1, 3, 981, NULL),
(453, 2, 8, 982, NULL),
(454, 1, 3, 983, NULL),
(454, 2, 9, 984, NULL),
(455, 1, 4, 985, NULL),
(455, 2, 8, 986, NULL),
(456, 1, 4, 987, NULL),
(456, 2, 9, 988, NULL),
(457, 1, 1, 989, NULL),
(457, 2, 8, 990, NULL),
(458, 1, 1, 991, NULL),
(458, 2, 9, 992, NULL),
(459, 1, 1, 993, NULL),
(459, 2, 10, 994, NULL),
(460, 1, 1, 995, NULL),
(460, 2, 11, 996, NULL),
(461, 1, 2, 997, NULL),
(461, 2, 8, 998, NULL),
(462, 1, 2, 999, NULL),
(462, 2, 9, 1000, NULL),
(463, 1, 2, 1001, NULL),
(463, 2, 10, 1002, NULL),
(464, 1, 2, 1003, NULL),
(464, 2, 11, 1004, NULL),
(465, 1, 3, 1005, NULL),
(465, 2, 8, 1006, NULL),
(466, 1, 3, 1007, NULL),
(466, 2, 9, 1008, NULL),
(467, 1, 3, 1009, NULL),
(467, 2, 10, 1010, NULL),
(468, 1, 3, 1011, NULL),
(468, 2, 11, 1012, NULL),
(469, 1, 4, 1013, NULL),
(469, 2, 8, 1014, NULL),
(470, 1, 4, 1015, NULL),
(470, 2, 9, 1016, NULL),
(471, 1, 4, 1017, NULL),
(471, 2, 10, 1018, NULL),
(472, 1, 4, 1019, NULL),
(472, 2, 11, 1020, NULL),
(473, 1, 2, 1021, NULL),
(473, 2, 8, 1022, NULL),
(474, 1, 2, 1023, NULL),
(474, 2, 9, 1024, NULL),
(475, 1, 2, 1025, NULL),
(475, 2, 10, 1026, NULL),
(476, 1, 2, 1027, NULL),
(476, 2, 11, 1028, NULL),
(477, 1, 3, 1029, NULL),
(477, 2, 8, 1030, NULL),
(478, 1, 3, 1031, NULL),
(478, 2, 9, 1032, NULL),
(479, 1, 3, 1033, NULL),
(479, 2, 10, 1034, NULL),
(480, 1, 3, 1035, NULL),
(480, 2, 11, 1036, NULL),
(481, 1, 4, 1037, NULL),
(481, 2, 8, 1038, NULL),
(482, 1, 4, 1039, NULL),
(482, 2, 9, 1040, NULL),
(483, 1, 4, 1041, NULL),
(483, 2, 10, 1042, NULL),
(484, 1, 4, 1043, NULL),
(484, 2, 11, 1044, NULL),
(485, 1, 1, 1045, NULL),
(485, 2, 8, 1046, NULL),
(486, 1, 1, 1047, NULL),
(486, 2, 9, 1048, NULL),
(487, 1, 1, 1049, NULL),
(487, 2, 10, 1050, NULL),
(488, 1, 1, 1051, NULL),
(488, 2, 11, 1052, NULL),
(489, 1, 2, 1053, NULL),
(489, 2, 8, 1054, NULL),
(490, 1, 2, 1055, NULL),
(490, 2, 9, 1056, NULL),
(491, 1, 2, 1057, NULL),
(491, 2, 10, 1058, NULL),
(492, 1, 2, 1059, NULL),
(492, 2, 11, 1060, NULL),
(493, 1, 3, 1061, NULL),
(493, 2, 8, 1062, NULL),
(494, 1, 3, 1063, NULL),
(494, 2, 9, 1064, NULL),
(495, 1, 3, 1065, NULL),
(495, 2, 10, 1066, NULL),
(496, 1, 3, 1067, NULL),
(496, 2, 11, 1068, NULL),
(497, 1, 4, 1069, NULL),
(497, 2, 8, 1070, NULL),
(498, 1, 4, 1071, NULL),
(498, 2, 9, 1072, NULL),
(499, 1, 4, 1073, NULL),
(499, 2, 10, 1074, NULL),
(500, 1, 4, 1075, NULL),
(500, 2, 11, 1076, NULL),
(501, 1, 1, 1077, NULL),
(501, 2, 8, 1078, NULL),
(502, 1, 1, 1079, NULL),
(502, 2, 9, 1080, NULL),
(503, 1, 1, 1081, NULL),
(503, 2, 10, 1082, NULL),
(504, 1, 1, 1083, NULL),
(504, 2, 11, 1084, NULL),
(505, 1, 2, 1085, NULL),
(505, 2, 8, 1086, NULL),
(506, 1, 2, 1087, NULL),
(506, 2, 9, 1088, NULL),
(507, 1, 2, 1089, NULL),
(507, 2, 10, 1090, NULL),
(508, 1, 2, 1091, NULL),
(508, 2, 11, 1092, NULL),
(509, 1, 3, 1093, NULL),
(509, 2, 8, 1094, NULL),
(510, 1, 3, 1095, NULL),
(510, 2, 9, 1096, NULL),
(511, 1, 3, 1097, NULL),
(511, 2, 10, 1098, NULL),
(512, 1, 3, 1099, NULL),
(512, 2, 11, 1100, NULL),
(513, 1, 4, 1101, NULL),
(513, 2, 8, 1102, NULL),
(514, 1, 4, 1103, NULL),
(514, 2, 9, 1104, NULL),
(515, 1, 4, 1105, NULL),
(515, 2, 10, 1106, NULL),
(516, 1, 4, 1107, NULL),
(516, 2, 11, 1108, NULL),
(781, 1, 3, 1635, NULL),
(781, 2, 9, 1636, NULL),
(782, 1, 3, 1637, NULL),
(782, 2, 10, 1638, NULL),
(783, 1, 3, 1639, NULL),
(783, 2, 11, 1640, NULL),
(784, 1, 3, 1641, NULL),
(784, 2, 12, 1642, NULL),
(785, 1, 3, 1643, NULL),
(785, 2, 13, 1644, NULL),
(786, 1, 5, 1645, NULL),
(786, 2, 9, 1646, NULL),
(787, 1, 5, 1647, NULL),
(787, 2, 10, 1648, NULL),
(788, 1, 5, 1649, NULL),
(788, 2, 11, 1650, NULL),
(789, 1, 5, 1651, NULL),
(789, 2, 12, 1652, NULL),
(790, 1, 5, 1653, NULL),
(790, 2, 13, 1654, NULL),
(791, 1, 3, 1655, NULL),
(791, 2, 13, 1656, NULL),
(792, 1, 5, 1657, NULL),
(792, 2, 13, 1658, NULL),
(793, 1, 6, 1659, NULL),
(793, 2, 9, 1660, NULL),
(794, 1, 6, 1661, NULL),
(794, 2, 10, 1662, NULL),
(795, 1, 6, 1663, NULL),
(795, 2, 12, 1664, NULL),
(796, 1, 7, 1665, NULL),
(796, 2, 9, 1666, NULL),
(797, 1, 7, 1667, NULL),
(797, 2, 10, 1668, NULL),
(798, 1, 7, 1669, NULL),
(798, 2, 12, 1670, NULL),
(799, 1, 5, 1671, NULL),
(799, 2, 9, 1672, NULL),
(800, 1, 5, 1673, NULL),
(800, 2, 10, 1674, NULL),
(801, 1, 5, 1675, NULL),
(801, 2, 12, 1676, NULL),
(802, 1, 1, 1677, NULL),
(802, 2, 8, 1678, NULL),
(803, 2, 9, 1679, NULL),
(803, 1, 6, 1680, NULL),
(804, 2, 9, 1681, NULL),
(804, 1, 5, 1682, NULL),
(805, 2, 9, 1683, NULL),
(805, 1, 7, 1684, NULL),
(806, 2, 10, 1685, NULL),
(806, 1, 6, 1686, NULL),
(807, 2, 10, 1687, NULL),
(807, 1, 5, 1688, NULL),
(808, 2, 10, 1689, NULL),
(808, 1, 7, 1690, NULL),
(809, 2, 12, 1691, NULL),
(809, 1, 6, 1692, NULL),
(810, 2, 12, 1693, NULL),
(810, 1, 5, 1694, NULL),
(811, 2, 12, 1695, NULL),
(811, 1, 7, 1696, NULL),
(812, 2, 10, 1697, NULL),
(812, 1, 3, 1698, NULL),
(813, 2, 10, 1699, NULL),
(813, 1, 5, 1700, NULL),
(814, 2, 11, 1701, NULL),
(814, 1, 3, 1702, NULL),
(815, 2, 11, 1703, NULL),
(815, 1, 5, 1704, NULL),
(816, 1, 7, 1705, NULL),
(816, 2, 9, 1706, NULL),
(817, 1, 7, 1707, NULL),
(817, 2, 10, 1708, NULL),
(818, 1, 3, 1709, NULL),
(818, 2, 9, 1710, NULL),
(819, 1, 3, 1711, NULL),
(819, 2, 10, 1712, NULL),
(820, 1, 4, 1713, NULL),
(820, 2, 9, 1714, NULL),
(821, 1, 4, 1715, NULL),
(821, 2, 10, 1716, NULL),
(822, 1, 2, 1717, NULL),
(822, 2, 9, 1718, NULL),
(823, 1, 2, 1719, NULL),
(823, 2, 10, 1720, NULL),
(824, 1, 6, 1721, NULL),
(824, 2, 10, 1722, NULL),
(825, 1, 6, 1723, NULL),
(825, 2, 9, 1724, NULL),
(826, 1, 1, 1725, NULL),
(826, 2, 10, 1726, NULL),
(827, 1, 1, 1727, NULL),
(827, 2, 9, 1728, NULL),
(828, 1, 7, 1729, NULL),
(828, 2, 10, 1730, NULL),
(829, 1, 7, 1731, NULL),
(829, 2, 9, 1732, NULL),
(830, 1, 1, 1733, NULL),
(830, 2, 8, 1734, NULL),
(831, 1, 1, 1735, NULL),
(831, 2, 9, 1736, NULL),
(832, 1, 4, 1737, NULL),
(832, 2, 8, 1738, NULL),
(833, 1, 4, 1739, NULL),
(833, 2, 9, 1740, NULL),
(834, 1, 2, 1741, NULL),
(834, 2, 8, 1742, NULL),
(835, 1, 1, 1743, NULL),
(835, 2, 8, 1744, NULL),
(836, 1, 1, 1745, NULL),
(836, 2, 9, 1746, NULL),
(837, 1, 2, 1747, NULL),
(837, 2, 8, 1748, NULL),
(838, 1, 2, 1749, NULL),
(838, 2, 9, 1750, NULL),
(839, 1, 3, 1751, NULL),
(839, 2, 8, 1752, NULL),
(840, 1, 3, 1753, NULL),
(840, 2, 9, 1754, NULL),
(841, 1, 1, 1755, NULL),
(841, 2, 10, 1756, NULL),
(842, 1, 1, 1757, NULL),
(842, 2, 11, 1758, NULL),
(843, 1, 2, 1759, NULL),
(843, 2, 10, 1760, NULL),
(844, 1, 2, 1761, NULL),
(844, 2, 11, 1762, NULL),
(845, 1, 3, 1763, NULL),
(845, 2, 10, 1764, NULL),
(846, 1, 3, 1765, NULL),
(846, 2, 11, 1766, NULL),
(847, 1, 1, 1767, NULL),
(847, 2, 8, 1768, NULL),
(848, 1, 1, 1769, NULL),
(848, 2, 9, 1770, NULL),
(849, 1, 1, 1771, NULL),
(849, 2, 10, 1772, NULL),
(850, 1, 2, 1773, NULL),
(850, 2, 8, 1774, NULL),
(851, 1, 2, 1775, NULL),
(851, 2, 9, 1776, NULL),
(852, 1, 2, 1777, NULL),
(852, 2, 10, 1778, NULL),
(853, 1, 3, 1779, NULL),
(853, 2, 8, 1780, NULL),
(854, 1, 3, 1781, NULL),
(854, 2, 9, 1782, NULL),
(855, 1, 3, 1783, NULL),
(855, 2, 10, 1784, NULL),
(856, 1, 2, 1785, NULL),
(856, 2, 129, 1786, NULL),
(857, 1, 2, 1787, NULL),
(857, 2, 13, 1788, NULL),
(858, 1, 1, 1789, NULL),
(858, 2, 129, 1790, NULL),
(859, 1, 1, 1791, NULL),
(859, 2, 13, 1792, NULL),
(860, 1, 1, 1793, NULL),
(860, 2, 9, 1794, NULL),
(861, 1, 1, 1795, NULL),
(861, 2, 8, 1796, NULL),
(862, 1, 2, 1797, NULL),
(862, 2, 9, 1798, NULL),
(863, 1, 2, 1799, NULL),
(863, 2, 8, 1800, NULL),
(864, 1, 1, 1801, NULL),
(864, 2, 11, 1802, NULL),
(865, 1, 2, 1803, NULL),
(865, 2, 11, 1804, NULL),
(866, 1, 2, 1805, NULL),
(866, 2, 9, 1806, NULL),
(867, 1, 2, 1807, NULL),
(867, 2, 8, 1808, NULL),
(868, 1, 3, 1809, NULL),
(868, 2, 9, 1810, NULL),
(869, 1, 3, 1811, NULL),
(869, 2, 8, 1812, NULL),
(871, 1, 2, 1813, NULL),
(872, 1, 3, 1814, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `guest_orders`
--
ALTER TABLE `guest_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_orders_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `history_points`
--
ALTER TABLE `history_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_points_user_id_foreign` (`user_id`),
  ADD KEY `history_points_point_id_foreign` (`point_id`),
  ADD KEY `history_points_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_status_id_foreign` (`status_id`);

--
-- Chỉ mục cho bảng `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_history_order_id_foreign` (`order_id`),
  ADD KEY `order_history_status_id_foreign` (`status_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `product_attributes_value_id_foreign` (`value_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `sclasses`
--
ALTER TABLE `sclasses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_attributes_variant_id_foreign` (`variant_id`),
  ADD KEY `variant_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `variant_attributes_value_id_foreign` (`value_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `guest_orders`
--
ALTER TABLE `guest_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `history_points`
--
ALTER TABLE `history_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT cho bảng `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=873;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sclasses`
--
ALTER TABLE `sclasses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1815;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `guest_orders`
--
ALTER TABLE `guest_orders`
  ADD CONSTRAINT `guest_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `history_points`
--
ALTER TABLE `history_points`
  ADD CONSTRAINT `history_points_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `history_points_point_id_foreign` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`),
  ADD CONSTRAINT `history_points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_history_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_attributes_value_id_foreign` FOREIGN KEY (`value_id`) REFERENCES `attribute_values` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD CONSTRAINT `variant_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `variant_attributes_value_id_foreign` FOREIGN KEY (`value_id`) REFERENCES `attribute_values` (`id`),
  ADD CONSTRAINT `variant_attributes_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`);

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
