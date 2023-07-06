-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2023 at 02:45 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `routines`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_class`
--

CREATE TABLE `assigned_class` (
  `id` int UNSIGNED NOT NULL,
  `class_no` int DEFAULT NULL,
  `schedule_id` bigint UNSIGNED DEFAULT NULL,
  `class_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_courses_to_teachers`
--

CREATE TABLE `assign_courses_to_teachers` (
  `id` int UNSIGNED NOT NULL,
  `session_id` int UNSIGNED DEFAULT NULL,
  `teacher_id` int UNSIGNED DEFAULT NULL,
  `courses` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_courses_to_teachers`
--

INSERT INTO `assign_courses_to_teachers` (`id`, `session_id`, `teacher_id`, `courses`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 4, 1, '1', '2023-06-10 07:01:56', '2023-06-10 07:01:56', 'yes'),
(2, 7, 8, '2', '2023-06-10 07:02:11', '2023-06-10 07:02:11', 'yes'),
(3, 4, 9, '2', '2023-06-10 07:06:56', '2023-06-10 07:06:56', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int UNSIGNED NOT NULL,
  `batch_no` int DEFAULT NULL COMMENT '12,13',
  `department_id` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `batch_no`, `department_id`, `shift_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2018, 1, 2, 'no', '2020-08-09 18:57:07', '2023-06-25 04:46:30'),
(2, 2019, 1, 1, 'yes', '2020-08-09 18:57:48', '2023-06-10 06:21:30'),
(3, 2022, 3, 2, 'yes', '2020-08-09 19:05:18', '2023-06-10 06:22:23'),
(4, 2022, 6, 1, 'yes', '2020-09-21 06:59:33', '2023-06-10 06:22:09'),
(5, 2021, 5, 2, 'yes', '2020-09-21 06:59:39', '2023-06-10 06:21:54'),
(6, 2020, 2, 2, 'yes', '2020-09-21 06:59:47', '2023-06-10 06:21:43'),
(7, 2023, 2, 2, 'yes', '2023-06-08 08:50:45', '2023-06-08 08:50:45'),
(8, 2018, 3, 2, 'yes', '2023-06-09 06:53:41', '2023-06-09 06:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `batch_sessions`
--

CREATE TABLE `batch_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_id` int DEFAULT NULL,
  `session_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_slots`
--

CREATE TABLE `class_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `time_slot_id` int DEFAULT NULL,
  `number_of_class` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int UNSIGNED NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CSE 222, CEN 431 ..etc',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `course_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=Theory,1=Sessional'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `credit`, `course_code`, `created_at`, `updated_at`, `is_active`, `course_type`) VALUES
(1, 'Data Communication', '3', 'CSE435', '2020-07-18 19:19:30', '2020-11-30 06:26:31', 'yes', '0'),
(2, 'Theory of Computing', '3', 'CSE317', '2020-07-18 19:20:11', '2020-07-18 19:20:11', 'yes', '0'),
(3, 'Operating System Concepts', '3', 'CSE231', '2020-07-18 19:20:48', '2020-07-18 19:20:48', 'yes', '0'),
(4, 'Operating System Concepts Sessional', '1.5', 'CSE232', '2020-07-18 19:21:04', '2020-07-18 19:21:04', 'yes', '1'),
(6, 'Diff. Equations and F.A', '3', 'MATH325', '2020-11-23 16:46:54', '2020-11-23 16:46:54', 'yes', '0'),
(7, 'Computer Peripherals & Interfacing', '3', 'CSE333', '2020-11-23 16:47:48', '2020-11-23 16:47:48', 'yes', '0'),
(8, 'Introduction to Computer & Programming Techniques', '3', 'CSE212', '2020-11-23 16:48:07', '2020-11-23 16:48:07', 'yes', '0'),
(9, 'Mobile and Telecommunication', '3', 'CSE443', '2020-11-23 16:48:57', '2020-11-23 16:48:57', 'yes', '0'),
(10, 'Software Engineering', '3', 'CSE321', '2020-11-23 16:49:17', '2020-11-23 16:49:17', 'yes', '0'),
(11, 'Artificial Intelligence', '3', 'CSE342', '2020-11-23 16:49:45', '2023-06-18 22:57:38', 'yes', '1'),
(12, 'Simulation & Modeling Sessional', '1.5', 'CSE424', '2020-11-23 16:50:07', '2020-11-23 16:50:07', 'yes', '0'),
(13, 'Multimedia Systems Design Sessional', '1.5', 'CSE448', '2020-11-23 16:51:09', '2020-11-23 16:51:09', 'yes', '1');

-- --------------------------------------------------------

--
-- Table structure for table `course_offers`
--

CREATE TABLE `course_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `batch_id` int DEFAULT NULL,
  `courses` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearly_session_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_offers`
--

INSERT INTO `course_offers` (`id`, `batch_id`, `courses`, `yearly_session_id`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 1, '1,9,10,12', 4, 'yes', '2020-11-20 01:49:15', '2023-06-18 22:54:53'),
(5, 4, '3,4,5', 4, 'yes', '2020-11-20 01:49:25', '2020-11-20 01:49:25'),
(6, 5, '1,3,4', 4, 'yes', '2020-11-20 01:49:34', '2020-11-20 01:49:34'),
(7, 1, '1,2,3,4,11,12', 7, 'yes', '2023-06-08 09:01:16', '2023-06-08 09:01:16'),
(8, 7, '1,3,6,10,11,12,13', 7, 'yes', '2023-06-08 09:11:33', '2023-06-10 07:11:02'),
(9, 8, '1,2,3', 7, 'yes', '2023-06-09 06:59:34', '2023-06-09 06:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` bigint UNSIGNED NOT NULL,
  `day_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `day_title`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Sunday', 'SUN', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00'),
(3, 'Monday', 'MON', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00'),
(4, 'Tuesday', 'TUE', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00'),
(5, 'Wednesday', 'WED', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00'),
(6, 'Thursday', 'THU', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00'),
(7, 'Friday', 'FRI', 'yes', '2020-09-20 18:15:00', '2020-09-20 18:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `day_wise_slots`
--

CREATE TABLE `day_wise_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `day_id` int DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `class_slot` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `day_wise_slots`
--

INSERT INTO `day_wise_slots` (`id`, `day_id`, `time_slot_id`, `class_slot`, `created_at`, `updated_at`) VALUES
(118, 6, 1, 1, '2020-10-03 23:25:13', '2020-11-18 19:50:06'),
(119, 6, 2, 9, '2020-10-03 23:25:13', '2020-11-18 19:50:06'),
(120, 6, 3, 8, '2020-10-03 23:25:13', '2020-11-18 19:50:06'),
(121, 6, 4, 4, '2020-10-03 23:25:13', '2020-11-18 19:49:29'),
(122, 6, 5, 5, '2020-10-03 23:25:13', '2020-11-18 19:50:06'),
(123, 6, 6, 9, '2020-10-03 23:25:13', '2020-11-18 19:50:06'),
(124, 7, 7, 3, '2020-10-03 23:25:29', '2020-11-18 19:50:06'),
(125, 7, 8, 1, '2020-10-03 23:25:29', '2020-11-18 19:50:06'),
(126, 7, 6, 4, '2020-10-03 23:25:29', '2020-11-18 19:50:06'),
(133, 3, 1, 2, '2020-10-07 10:40:00', '2020-11-18 19:50:04'),
(134, 3, 2, 5, '2020-10-07 10:40:00', '2020-11-18 19:50:05'),
(135, 3, 3, 4, '2020-10-07 10:40:00', '2020-11-18 19:50:05'),
(136, 3, 4, 7, '2020-10-07 10:40:00', '2020-11-18 19:50:05'),
(137, 3, 5, 3, '2020-10-07 10:40:00', '2020-11-18 19:50:05'),
(138, 3, 6, 4, '2020-10-07 10:40:00', '2020-11-18 19:50:05'),
(139, 4, 1, 8, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(140, 4, 2, 8, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(141, 4, 3, 6, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(142, 4, 4, 4, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(143, 4, 5, 7, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(144, 4, 6, 3, '2020-10-07 10:40:09', '2020-11-18 19:50:05'),
(145, 5, 1, 5, '2020-10-07 10:40:21', '2020-11-18 19:50:05'),
(146, 5, 2, 5, '2020-10-07 10:40:21', '2020-11-18 19:50:05'),
(147, 5, 3, 4, '2020-10-07 10:40:21', '2020-11-18 19:50:05'),
(148, 5, 4, 3, '2020-10-07 10:40:21', '2020-11-18 19:50:06'),
(149, 5, 5, 2, '2020-10-07 10:40:21', '2020-11-18 19:50:06'),
(150, 5, 6, 1, '2020-10-07 10:40:21', '2020-11-18 19:50:06'),
(170, 1, 6, 4, '2023-06-09 06:58:12', '2023-06-09 06:58:12'),
(171, 2, 9, 1, '2023-06-19 09:25:12', '2023-06-24 09:23:31'),
(172, 2, 6, 2, '2023-06-19 09:25:12', '2023-06-21 09:06:25'),
(173, 2, 2, 3, '2023-06-19 09:25:12', '2023-06-19 09:25:12'),
(174, 2, 4, 4, '2023-06-19 09:25:12', '2023-06-19 09:25:12'),
(175, 2, 3, 5, '2023-06-19 09:25:12', '2023-06-19 09:25:12'),
(176, 2, 5, 6, '2023-06-19 09:25:12', '2023-06-19 09:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int UNSIGNED NOT NULL,
  `department_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CSE, EEE, MBA',
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BCIS', 'yes', '2021-05-18 16:21:41', '2023-06-08 08:45:41'),
(2, 'BCA', 'yes', '2021-05-18 16:21:45', '2023-06-10 06:04:58'),
(3, 'BBA', 'yes', '2020-07-22 07:43:26', '2023-06-09 06:52:19'),
(5, 'BBM', 'yes', '2020-07-22 07:43:51', '2023-06-08 08:46:16'),
(6, 'BSC CSIT', 'yes', '2023-06-10 06:20:40', '2023-06-10 06:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_10_12_132446_create_users_table', 1),
(4, '2019_12_14_132446_create_assign_courses_to_teachers_table', 1),
(5, '2019_12_14_132446_create_assigned_class_table', 1),
(6, '2019_12_14_132446_create_batch_table', 1),
(7, '2019_12_14_132446_create_courses_table', 1),
(8, '2019_12_14_132446_create_departments_table', 1),
(9, '2019_12_14_132446_create_rooms_table', 1),
(10, '2019_12_14_132446_create_sections_table', 1),
(11, '2019_12_14_132446_create_sessions_table', 1),
(12, '2019_12_14_132446_create_shift_table', 1),
(13, '2019_12_14_132446_create_teachers_table', 1),
(14, '2019_12_15_132446_create_students_table', 1),
(15, '2020_07_21_083159_create_teacher_ranks_table', 1),
(16, '2020_08_03_125500_create_batch_sessions_table', 1),
(17, '2020_08_03_125738_create_shift_sessions_table', 1),
(18, '2020_08_03_134307_create_yearly_sessions_table', 1),
(19, '2020_08_31_042012_create_time_slots_table', 1),
(20, '2020_09_01_141322_create_section_students', 1),
(21, '2020_09_14_113252_create_students_log_table', 1),
(22, '2020_09_22_161931_create_class_slots_table', 1),
(23, '2020_09_22_162714_create_days_table', 1),
(24, '2020_09_26_073116_create_day_wise_slots', 1),
(25, '2020_09_27_121219_create_teachers_offday_table', 1),
(26, '2020_10_06_070643_create_routine_table', 1),
(27, '2020_10_26_140017_create_routine_committee_requests_table', 1),
(28, '2020_11_19_200110_create_course_offers_table', 1);

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
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int UNSIGNED NOT NULL,
  `building` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_no` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `room_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=Theory,1=Lab',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `building`, `room_no`, `capacity`, `room_type`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'A', '101', 60, '0', '2020-07-21 01:05:22', '2020-09-21 06:41:55', 'yes'),
(2, 'A', '102', 70, '0', '2020-07-21 01:09:18', '2020-09-21 06:42:02', 'yes'),
(4, 'B', '203', 100, '1', '2020-07-21 01:09:55', '2020-09-21 06:42:06', 'yes'),
(5, 'B', '103', 100, '1', '2020-07-21 01:21:27', '2023-06-18 22:58:41', 'yes'),
(6, 'A', '401', 65, '1', '2020-09-21 06:42:30', '2023-06-10 06:19:42', 'yes'),
(7, 'A', '301', 50, '0', '2020-11-18 19:43:08', '2020-11-18 19:43:08', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `routine`
--

CREATE TABLE `routine` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `batch_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `day_id` int DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `edited_by` int DEFAULT NULL,
  `yearly_session_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `routine`
--

INSERT INTO `routine` (`id`, `teacher_id`, `batch_id`, `section_id`, `day_id`, `time_slot_id`, `course_id`, `room_id`, `created_by`, `edited_by`, `yearly_session_id`, `is_active`, `created_at`, `updated_at`) VALUES
(27, 1, 8, NULL, 2, 9, 1, 1, 1, NULL, 4, 'yes', '2023-06-26 08:51:17', '2023-06-26 08:51:17'),
(28, 1, 8, NULL, 2, 6, 1, 1, 1, NULL, 4, 'yes', '2023-06-26 08:52:23', '2023-06-26 08:52:23'),
(29, 8, 8, NULL, 2, 2, 2, 2, 1, NULL, 4, 'yes', '2023-06-26 08:56:18', '2023-06-26 08:56:18'),
(30, 9, 8, NULL, 2, 4, 3, 6, 1, 1, 4, 'yes', '2023-06-27 22:24:03', '2023-06-27 22:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `routine_committee_requests`
--

CREATE TABLE `routine_committee_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `expire_after` int DEFAULT '2',
  `expired_date` datetime NOT NULL,
  `request_status` enum('expired','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `routine_committee_requests`
--

INSERT INTO `routine_committee_requests` (`id`, `sender_id`, `receiver_id`, `expire_after`, `expired_date`, `request_status`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 2, '2023-06-15 19:13:49', 'active', '2023-06-14 07:43:49', '2023-06-14 07:43:49'),
(3, 1, 8, 2, '2023-06-26 20:52:46', 'active', '2023-06-24 09:22:46', '2023-06-24 09:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int UNSIGNED NOT NULL,
  `section_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A,B,C..etc',
  `parent` int NOT NULL DEFAULT '0',
  `slug` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('theory','lab') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'theory',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `parent`, `slug`, `type`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'A', 0, 'a', 'theory', '2020-08-10 09:40:48', '2020-08-10 09:40:48', 'yes'),
(2, 'B', 0, 'b', 'theory', '2020-08-10 09:40:52', '2020-08-10 09:40:52', 'yes'),
(3, 'A1', 1, 'a1', 'lab', '2020-09-21 06:58:18', '2020-09-21 06:58:18', 'yes'),
(4, 'A2', 1, 'a2', 'lab', '2020-09-21 06:58:24', '2020-09-21 06:58:24', 'yes'),
(5, 'B1', 2, 'b1', 'lab', '2020-09-21 06:58:38', '2020-09-21 06:58:38', 'yes'),
(6, 'B2', 2, 'b2', 'lab', '2020-09-21 06:58:44', '2020-09-21 06:58:44', 'yes'),
(7, 'C', 0, 'c', 'theory', '2020-11-17 23:07:48', '2020-11-17 23:07:48', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `section_students`
--

CREATE TABLE `section_students` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `section_type` enum('lab','theory') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `students` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_students`
--

INSERT INTO `section_students` (`id`, `student_id`, `section_id`, `section_type`, `is_active`, `students`, `created_at`, `updated_at`) VALUES
(33, 18, 1, 'theory', 'yes', 50, '2020-10-06 18:10:23', '2020-10-06 18:10:23'),
(34, 18, 2, 'theory', 'yes', 50, '2020-10-06 18:10:23', '2020-10-06 18:10:23'),
(35, 18, 3, 'lab', 'yes', 25, '2020-11-18 11:23:50', '2020-11-18 11:23:50'),
(36, 18, 4, 'lab', 'yes', 25, '2020-11-18 11:23:50', '2020-11-18 11:23:50'),
(37, 18, 5, 'lab', 'yes', 25, '2020-11-18 11:23:50', '2020-11-18 11:23:50'),
(38, 18, 6, 'lab', 'yes', 25, '2020-11-18 11:23:50', '2020-11-18 11:23:50'),
(39, 17, 1, 'theory', 'yes', 50, '2020-11-18 11:26:13', '2020-11-18 11:26:13'),
(40, 20, 1, 'theory', 'yes', 30, '2020-11-18 18:50:52', '2020-11-18 18:50:52'),
(41, 20, 2, 'theory', 'yes', 30, '2020-11-18 18:50:52', '2020-11-18 18:50:52'),
(50, 21, 1, 'theory', 'yes', 40, '2020-11-18 19:14:36', '2020-11-18 19:14:36'),
(51, 21, 2, 'theory', 'yes', 30, '2020-11-18 19:14:36', '2020-11-18 19:14:36'),
(52, 24, 1, 'theory', 'yes', 35, '2020-11-21 02:17:48', '2020-11-21 02:17:48'),
(53, 24, 2, 'theory', 'yes', 25, '2020-11-21 02:17:48', '2020-11-21 02:17:48'),
(54, 30, 1, 'theory', 'yes', 55, '2020-11-21 19:45:30', '2020-11-21 19:45:30'),
(57, 30, 3, 'lab', 'yes', 55, '2020-11-21 19:49:21', '2020-11-21 19:49:21'),
(58, 32, 1, 'theory', 'yes', 20, '2023-06-09 07:23:16', '2023-06-09 07:23:16'),
(59, 32, 2, 'theory', 'yes', 20, '2023-06-09 07:23:16', '2023-06-09 07:23:16'),
(60, 33, 1, 'theory', 'yes', 25, '2023-06-10 07:12:09', '2023-06-10 07:12:09'),
(61, 33, 2, 'theory', 'yes', 25, '2023-06-10 07:12:09', '2023-06-10 07:12:09'),
(62, 34, 1, 'theory', 'yes', 35, '2023-06-10 07:12:57', '2023-06-10 07:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int UNSIGNED NOT NULL,
  `session_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Summer, Spring ..etc',
  `session_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_name`, `session_code`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Even Semester', NULL, '2020-07-31 21:27:57', '2023-06-28 09:24:22', 'yes'),
(2, 'Odd Semester', NULL, '2020-08-07 18:51:23', '2023-06-28 09:24:54', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` int UNSIGNED NOT NULL,
  `shift_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'day/evening',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `shift_name`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Day', 'D', 'yes', '2021-05-18 16:21:50', '2021-05-18 16:21:50'),
(2, 'Morning', 'M', 'yes', '2021-05-18 16:21:53', '2021-05-18 16:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `shift_sessions`
--

CREATE TABLE `shift_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `session_id` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `day_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shift_sessions`
--

INSERT INTO `shift_sessions` (`id`, `session_id`, `shift_id`, `day_id`, `is_active`, `created_at`, `updated_at`) VALUES
(11, 4, 1, NULL, 'yes', '2020-08-07 19:08:28', '2020-08-07 22:40:06'),
(14, 2, 1, NULL, 'yes', '2020-08-07 19:26:02', '2020-08-07 19:26:02'),
(16, 1, 2, NULL, 'yes', '2020-08-07 19:51:32', '2020-08-07 22:45:17'),
(17, 2, 2, NULL, 'yes', '2020-08-07 19:51:36', '2020-08-07 19:51:36'),
(18, 4, 2, NULL, 'yes', '2020-08-07 19:51:42', '2020-08-07 19:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `number_of_student` int NOT NULL,
  `batch_id` int DEFAULT NULL,
  `yearly_session_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `number_of_student`, `batch_id`, `yearly_session_id`, `is_active`, `created_at`, `updated_at`) VALUES
(35, 40, 8, 7, 'yes', '2023-06-10 07:18:09', '2023-06-10 07:18:09'),
(36, 50, 2, 4, 'yes', '2023-06-18 22:55:28', '2023-06-18 22:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `students_log`
--

CREATE TABLE `students_log` (
  `id` bigint UNSIGNED NOT NULL,
  `number_of_student` int NOT NULL,
  `batch_id` int DEFAULT NULL,
  `yearly_session_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `join_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `slug`, `rank_id`, `department_id`, `is_active`, `join_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'DS', 3, 2, 'yes', '2020-07-02', '2020-07-22 18:15:00', '2023-06-20 00:58:19'),
(8, 8, 'SC', 3, 1, 'yes', '1970-01-01', '2020-11-23 16:58:38', '2023-06-20 00:58:00'),
(9, 9, 'SN', 3, 3, 'yes', '1988-10-11', '2020-11-23 17:00:33', '2023-06-20 00:58:32'),
(10, 10, 'AS', 3, 1, 'yes', '1970-01-01', '2020-11-23 17:01:39', '2023-06-20 00:58:43'),
(11, 11, 'SS', 1, 1, 'yes', '1970-01-01', '2020-11-23 17:02:46', '2023-06-20 00:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `teachers_offday`
--

CREATE TABLE `teachers_offday` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `day_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers_offday`
--

INSERT INTO `teachers_offday` (`id`, `teacher_id`, `day_id`, `is_active`, `created_at`, `updated_at`) VALUES
(19, 3, 2, 'yes', '2020-09-25 14:41:34', '2020-09-25 14:41:34'),
(20, 3, 7, 'yes', '2020-09-25 14:41:34', '2020-09-25 14:41:34'),
(25, 4, 3, 'yes', '2020-09-29 11:56:11', '2020-09-29 11:56:11'),
(26, 4, 4, 'yes', '2020-09-29 11:56:11', '2020-09-29 11:56:11'),
(27, 6, 6, 'yes', '2020-11-18 19:16:23', '2020-11-18 19:16:23'),
(28, 6, 7, 'yes', '2020-11-18 19:16:23', '2020-11-18 19:16:23'),
(31, 5, 4, 'yes', '2020-11-18 19:16:43', '2020-11-18 19:16:43'),
(32, 5, 5, 'yes', '2020-11-18 19:16:43', '2020-11-18 19:16:43'),
(33, 2, 4, 'yes', '2020-11-18 19:46:38', '2020-11-18 19:46:38'),
(34, 2, 7, 'yes', '2020-11-18 19:46:38', '2020-11-18 19:46:38'),
(75, 9, 5, 'yes', '2020-11-26 10:34:11', '2020-11-26 10:34:11'),
(76, 8, 3, 'yes', '2020-11-28 00:03:48', '2020-11-28 00:03:48'),
(77, 10, 7, 'yes', '2020-11-28 00:03:52', '2020-11-28 00:03:52'),
(78, 11, 6, 'yes', '2020-11-28 00:03:55', '2020-11-28 00:03:55'),
(79, 12, 4, 'yes', '2020-11-28 00:03:59', '2020-11-28 00:03:59'),
(81, 1, 7, 'yes', '2023-06-10 07:40:50', '2023-06-10 07:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_ranks`
--

CREATE TABLE `teacher_ranks` (
  `id` bigint UNSIGNED NOT NULL,
  `rank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_ranks`
--

INSERT INTO `teacher_ranks` (`id`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Lecturer', 'yes', '2020-07-23 00:15:00', '2020-07-23 00:15:00'),
(3, 'Sr. Lecturer', 'yes', '2020-07-26 17:43:52', '2020-07-26 17:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `from`, `to`, `shift_id`, `is_active`, `type`, `created_at`, `updated_at`) VALUES
(1, '09:00:00', '10:00:00', 2, 'yes', '1', '2020-09-21 07:09:45', '2023-06-18 23:09:42'),
(2, '10:55:00', '11:55:00', 2, 'yes', '1', '2020-09-21 07:09:57', '2023-06-18 23:10:07'),
(3, '12:00:00', '13:25:00', 1, 'yes', '1', '2020-09-21 07:10:12', '2020-09-21 07:10:12'),
(4, '11:00:00', '12:00:00', 1, 'yes', '1', '2020-09-21 07:10:26', '2023-06-10 06:18:25'),
(5, '12:30:00', '13:30:00', 1, 'yes', '1', '2020-09-21 07:10:43', '2023-06-10 06:17:21'),
(6, '08:00:00', '09:00:00', 2, 'yes', '2', '2020-09-21 07:11:01', '2023-06-18 23:09:21'),
(7, '09:30:00', '22:30:00', 2, 'yes', '2', '2020-09-24 06:55:28', '2023-06-10 06:15:57'),
(8, '13:00:00', '14:00:00', 1, 'yes', '2', '2020-09-24 06:55:43', '2023-06-10 06:16:32'),
(9, '07:00:00', '08:00:00', 2, 'yes', '1', '2023-06-08 08:54:30', '2023-06-08 08:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1=male,2=female',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('superadmin','admin','subadmin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `is_teacher` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `in_committee` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `key`, `firstname`, `lastname`, `date_of_birth`, `username`, `gender`, `email`, `email_verified_at`, `password`, `role`, `is_active`, `is_teacher`, `in_committee`, `remember_token`, `photo`, `contact`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Deepa', 'Shrestha', '1985-07-26', 'superadmin', 2, 'deepa@gmail.com', NULL, '$2y$10$BDEqdP2s7Rbao.gARzrhOu/IE44B8cvUxiuiQUSIEhRIQaoLvjSwC', 'admin', 'yes', 'yes', 'yes', 'zoWi91R7UlwQjShvMRjnqWw3NFk9YEM9d5ORWBusW4gc0MUjdHF5MqXPQMcQ', NULL, '9860164578', '2020-07-20 18:56:06', '2023-06-20 00:58:19'),
(8, NULL, 'Shova', 'Chaudhary', '1988-02-16', 'shova_chaudhary', 2, 'shova@gmail.com', NULL, '$2y$10$ANSZ3pj85771HtzCTov/tOtgIpizEgH0JSmhSpCBz7j.pFzpxYbLG', 'user', 'yes', 'yes', 'no', NULL, NULL, '01833788270', '2020-11-23 16:58:36', '2023-06-20 00:58:00'),
(9, NULL, 'Sneha', 'Nakarmi', '1983-11-10', 'sheha_nakarmi', 2, 'sneha@gmail.com', NULL, '$2y$10$r7Y34KOXmnpk14SDsZmZq.xEGjzjrcgAwNgfZjGMyzV01COMZUluS', 'user', 'yes', 'yes', 'yes', NULL, NULL, '98418564958', '2020-11-23 17:00:33', '2023-06-20 00:58:32'),
(10, NULL, 'Ashesh', 'Shakya', '1970-01-01', 'chibi_ashesh', 1, 'shorty@gmail.com', NULL, '$2y$10$DiZ2XvKpumZ0Xle26.Wn8e1991qrYLdBBovAxlwubGcNP9et1ydf2', 'user', 'yes', 'yes', 'yes', NULL, NULL, '98621451256', '2020-11-23 17:01:39', '2023-06-20 00:58:43'),
(11, NULL, 'Sagar', 'Shrestha', '1972-06-07', 'sagar_shrestha', 2, 'sagar@gmail.com', NULL, '$2y$10$nRWkA54MdA1lfzPlGceYouExvY3evkuwfqgwTKywKh4Yw59Gq4B1C', 'user', 'yes', 'yes', 'no', NULL, NULL, '01845110925', '2020-11-23 17:02:46', '2023-06-20 00:58:54'),
(12, NULL, 'Sanam', 'Maharjan', '1970-06-11', 'sanam_maharjan', 1, 'sanam@gmail.com', NULL, '$2y$10$MLofd29BH7b4LwqAkMiU.OEroguzKBDd7ksj28xrsHFlf3RoAnIOK', 'user', 'yes', 'yes', 'no', NULL, NULL, '98745612133', '2020-11-23 17:04:07', '2023-06-19 09:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `yearly_sessions`
--

CREATE TABLE `yearly_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `session_id` int DEFAULT NULL,
  `year` year DEFAULT NULL,
  `is_active` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yearly_sessions`
--

INSERT INTO `yearly_sessions` (`id`, `session_id`, `year`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 1, 2020, 'yes', '2020-10-06 18:09:03', '2020-10-13 07:13:23'),
(5, 2, 2020, 'yes', '2020-10-06 18:09:03', '2023-06-20 02:34:32'),
(7, 1, 2023, 'yes', '2023-06-08 08:51:55', '2023-06-20 02:34:37'),
(8, 2, 2023, 'no', '2023-06-08 08:51:55', '2023-06-14 07:47:35'),
(10, 1, 2024, 'no', '2023-06-10 06:55:29', '2023-06-10 06:55:29'),
(11, 2, 2024, 'no', '2023-06-10 06:55:29', '2023-06-14 07:47:23'),
(13, 1, 2025, 'no', '2023-06-28 09:13:57', '2023-06-28 09:13:57'),
(14, 2, 2025, 'no', '2023-06-28 09:13:57', '2023-06-28 09:13:57'),
(15, 1, 2026, 'no', '2023-06-28 09:15:21', '2023-06-28 09:15:21'),
(16, 2, 2026, 'yes', '2023-06-28 09:15:21', '2023-06-28 09:22:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_class`
--
ALTER TABLE `assigned_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_courses_to_teachers`
--
ALTER TABLE `assign_courses_to_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch_sessions`
--
ALTER TABLE `batch_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_slots`
--
ALTER TABLE `class_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_course_code_unique` (`course_code`);

--
-- Indexes for table `course_offers`
--
ALTER TABLE `course_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `days_day_title_unique` (`day_title`),
  ADD UNIQUE KEY `days_slug_unique` (`slug`);

--
-- Indexes for table `day_wise_slots`
--
ALTER TABLE `day_wise_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routine`
--
ALTER TABLE `routine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routine_committee_requests`
--
ALTER TABLE `routine_committee_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_students`
--
ALTER TABLE `section_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shifts_slug_unique` (`slug`);

--
-- Indexes for table `shift_sessions`
--
ALTER TABLE `shift_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_log`
--
ALTER TABLE `students_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers_offday`
--
ALTER TABLE `teachers_offday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_ranks`
--
ALTER TABLE `teacher_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `yearly_sessions`
--
ALTER TABLE `yearly_sessions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_class`
--
ALTER TABLE `assigned_class`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_courses_to_teachers`
--
ALTER TABLE `assign_courses_to_teachers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `batch_sessions`
--
ALTER TABLE `batch_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_slots`
--
ALTER TABLE `class_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_offers`
--
ALTER TABLE `course_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `day_wise_slots`
--
ALTER TABLE `day_wise_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `routine`
--
ALTER TABLE `routine`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `routine_committee_requests`
--
ALTER TABLE `routine_committee_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `section_students`
--
ALTER TABLE `section_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shift_sessions`
--
ALTER TABLE `shift_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `students_log`
--
ALTER TABLE `students_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teachers_offday`
--
ALTER TABLE `teachers_offday`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `teacher_ranks`
--
ALTER TABLE `teacher_ranks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `yearly_sessions`
--
ALTER TABLE `yearly_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
