-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2025 at 02:59 PM
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
-- Database: `water_distribution_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `LogID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Action` varchar(100) NOT NULL,
  `Details` text DEFAULT NULL,
  `IPAddress` varchar(45) DEFAULT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`LogID`, `AdminID`, `Action`, `Details`, `IPAddress`, `UserAgent`, `CreatedAt`) VALUES
(1, 1, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:09:49'),
(2, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:09:49'),
(3, 1, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:09:51'),
(4, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:01'),
(5, 1, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:03'),
(6, 1, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:11'),
(7, 1, 'Application Review', 'Application #4 for \'Sponsor\' by Edwin Lirio <edwin@gmail.com> was Approved', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:11'),
(8, 1, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:11'),
(9, 1, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:12'),
(10, 1, 'Application Review', 'Application #3 for \'Client\' by Gabriel Salazar <gabriel@gmail.com> was Approved', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:12'),
(11, 1, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:12'),
(12, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:13'),
(13, 1, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:15'),
(14, 1, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:37'),
(15, 1, 'Visit', 'Visited service.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:40'),
(16, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:42'),
(17, 1, 'Visit', 'Visited contact page (contact.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:43'),
(18, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:10:45'),
(19, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:13:16'),
(20, 1, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:20:22'),
(21, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:20:24'),
(22, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:22:10'),
(23, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:22:13'),
(24, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:22:14'),
(25, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:22:16'),
(26, 1, 'Visit', 'Visited User Directory (admin_users.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:22:33'),
(27, 1, 'Logout', 'Administrator logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-05 16:23:57'),
(28, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:43:45'),
(29, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:43:45'),
(30, 6, 'Visit', 'Visited Profile Page as Admin (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:43:48'),
(31, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:43:50'),
(32, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:45:37'),
(33, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:45:39'),
(34, 6, 'Visit', 'Visited Profile Page as Admin (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:45:41'),
(35, 6, 'Logout', 'Administrator logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:46:18'),
(36, 7, 'Visit', 'Visited Profile Page as User (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:46:38'),
(37, 7, 'Visit', 'Visited Profile Page as User (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:46:50'),
(38, 7, 'Update', 'Updated Profile Information (Name/Email/Contact)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-06 12:46:50'),
(39, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:08:57'),
(40, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:08:57'),
(41, 6, 'Visit', 'Visited blog.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:00'),
(42, 6, 'Visit', 'Visited service.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:07'),
(43, 6, 'Visit', 'Visited About Page (about.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:10'),
(44, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:12'),
(45, 6, 'Visit', 'Visited About Page (about.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:28'),
(46, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:29'),
(47, 6, 'Visit', 'Visited About Page (about.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:43'),
(48, 6, 'Visit', 'Visited service.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:48'),
(49, 6, 'Visit', 'Visited blog.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:52'),
(50, 6, 'Visit', 'Visited features page (feature.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:09:57'),
(51, 6, 'Visit', 'Visited team page (team.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:00'),
(52, 6, 'Visit', 'Visited testimonials page (testimonial.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:03'),
(53, 6, 'Visit', 'Visited 404 page (404.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:04'),
(54, 6, 'Visit', 'Visited 404 page (404.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:22'),
(55, 6, 'Visit', 'Visited testimonials page (testimonial.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:24'),
(56, 6, 'Visit', 'Visited contact page (contact.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:25'),
(57, 6, 'Visit', 'Visited contact page (contact.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:33'),
(58, 6, 'Visit', 'Visited features page (feature.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:37'),
(59, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:39'),
(60, 6, 'Visit', 'Visited contact page (contact.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:42'),
(61, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:10:44'),
(62, 6, 'Visit', 'Visited Profile Page as Admin (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:11:16'),
(63, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:11:19'),
(64, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:16:07'),
(65, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:16:07'),
(66, 6, 'Visit', 'Visited Profile Page as Admin (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:16:11'),
(67, 6, 'Logout', 'Administrator logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-09 22:17:17'),
(68, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:00:45'),
(69, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:00:51'),
(70, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:00:52'),
(71, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:00:59'),
(72, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:01:06'),
(73, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:01:06'),
(74, 9, 'Visit', 'Visited Profile Page as Attendant (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:01:45'),
(75, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:01:51'),
(76, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:02:02'),
(77, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:51:20'),
(78, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:51:22'),
(79, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:51:23'),
(80, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:51:23'),
(81, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 00:51:23'),
(82, 9, 'Visit', 'Visited Finance Blockchain Explorer as Attendant (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:20:34'),
(83, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:20:52'),
(84, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:20:52'),
(85, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:20:55'),
(86, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:21:25'),
(87, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:21:30'),
(88, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:21:33'),
(89, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:38'),
(90, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:40'),
(91, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:42'),
(92, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:43'),
(93, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:44'),
(94, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:46'),
(95, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:27:47'),
(96, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:29:48'),
(97, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:29:51'),
(98, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:37:37'),
(99, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:37:38'),
(100, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:38:24'),
(101, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 01:38:25'),
(102, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:35'),
(103, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:36'),
(104, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:36'),
(105, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:37'),
(106, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:37'),
(107, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:06:37'),
(108, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:48:36'),
(109, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-10 02:50:35'),
(110, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:11:48'),
(111, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:11:48'),
(112, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:11:49'),
(113, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:14:16'),
(114, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:19:59'),
(115, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:21:06'),
(116, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:21:53'),
(117, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:22:04'),
(118, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:24:21'),
(119, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 14:24:24'),
(120, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 15:58:10'),
(121, 6, 'Logout', 'Administrator logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 15:58:54'),
(122, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 15:59:14'),
(123, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 15:59:14'),
(124, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:08:21'),
(125, 6, 'Logout', 'Administrator logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:08:30'),
(126, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:09:28'),
(127, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:09:28'),
(128, 6, 'Visit', 'Visited Profile Page as Admin (profile.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:09:31'),
(129, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:09:32'),
(130, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:09:56'),
(131, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:01'),
(132, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:03'),
(133, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:04'),
(134, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:05'),
(135, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:07'),
(136, 6, 'Visit', 'Visited Admin Applications (admin_applications.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:08'),
(137, 6, 'Visit', 'Visited contact page (contact.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:10'),
(138, 6, 'Visit', 'Visited blog.php', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:13'),
(139, 6, 'Visit', 'Visited homepage (index.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:16'),
(140, 6, 'Visit', 'Visited Admin Dashboard (admin_dashboard.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:30'),
(141, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:32'),
(142, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:43'),
(143, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:46'),
(144, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:51'),
(145, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:54'),
(146, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:57'),
(147, 6, 'Visit', 'Visited Admin Audit Logs (admin_audit.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:10:59'),
(148, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:11:02'),
(149, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:12:39'),
(150, 6, 'Visit', 'Visited Finance Blockchain Explorer as Admin (finance_summary.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:16:12'),
(151, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-10 17:16:22'),
(152, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-17 14:24:44'),
(153, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-17 14:24:44'),
(154, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-17 14:24:47'),
(155, 6, 'Login', 'Administrator logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 10:27:45'),
(156, 6, 'Visit', 'Visited Terms & Conditions (terms_conditions.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 10:27:45'),
(157, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 10:27:48'),
(158, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 10:48:08'),
(159, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 11:35:15'),
(160, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 12:30:07'),
(161, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 14:52:38'),
(162, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 15:11:47'),
(163, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 15:17:50'),
(164, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 15:37:47'),
(165, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 16:43:13'),
(166, 6, 'Visit', 'Visited Blockchain Explorer as Admin (chain_explorer.php)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', '2025-09-19 16:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `blockchain_records`
--

CREATE TABLE `blockchain_records` (
  `RecordID` int(11) NOT NULL,
  `BlockID` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `Hash` varchar(256) DEFAULT NULL,
  `Proof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blockchain_records`
--

INSERT INTO `blockchain_records` (`RecordID`, `BlockID`, `TransactionID`, `Timestamp`, `Hash`, `Proof`) VALUES
(1, 28, 38, '2025-08-26 22:20:48', '9101a3c827e46bf297e09e6d82855ebc771fdec1628ba4555fe3fa23326dd8b8', 2857),
(2, 30, 39, '2025-08-26 23:10:52', '6d26b87f2a8ff2ab9318d76029c8dedea89691ddfb86cd9536df2dd4ef179a13', 183791),
(3, 30, 40, '2025-08-26 23:10:52', '898f5157dd9763198040bc8f040add0a3514b7c62633e9ef069ef77a05b6c9e3', 183791),
(4, 31, 41, '2025-08-26 23:28:16', 'dbcab4a5d4a661eeb431783be1e53dbb636d3ab5e2520b1480438d56287d2466', 47343),
(5, 31, 42, '2025-08-26 23:28:16', '7d5d383e3ef2cab6ba70654baf2ad126438b261d6a073b78a7573df412f265e3', 47343),
(6, 32, 43, '2025-08-27 17:11:51', '3337438105c7cc4271c5484a3745eba13611d775dd454e72e549f81b022603d6', 2756),
(7, 33, 44, '2025-08-27 17:29:15', '4e68302ae8fb4b95c20c59b374df1af7859379aaf194825502fc9cfa63f99518', 217842),
(8, 34, 45, '2025-09-10 02:18:21', '13a97edb356a55ae5ca66da704601c1db7865e06e3f0b01b79d70d12c99f8fea', 40185),
(9, 35, 46, '2025-09-10 14:08:42', '30a951b28af36b71384bbfd572bcd595b8245225b25be341fd5f9655453585c9', 38483),
(10, 36, 47, '2025-09-10 17:22:31', 'd31fc252d8b1a70d435737bbd7d55da6c619bd2e601ed1fc45040985dc921135', 76793),
(11, 37, 48, '2025-09-15 14:36:55', 'ba9209630baa017519acc45263c58b57664186038f615e935e17ebc4a9d3f940', 65454),
(12, 37, 49, '2025-09-15 14:36:55', '364744466e28ba92337e2511f6ebc01d900b68e165d94607f44d20e5b1a496c0', 65454),
(13, 37, 50, '2025-09-15 14:36:55', 'cd082b300d13437cf3c712f7c9e412d1c09088c8879e5319f22f06e46c04dc0e', 65454),
(14, 38, 51, '2025-09-17 14:22:52', 'b84ec5b1c7639a615f68661bb6712f0486b8e999b1337688f735f1befedf1a93', 48475),
(15, 38, 52, '2025-09-17 14:22:52', 'f6278b00a128df0d905b5a54bcd81a224e56a445001f3493705b539cc993fabf', 48475),
(16, 39, 53, '2025-09-17 14:23:13', '89f19f0509921ec58a325f6015295c0d900e8971a745aab1e087ff654f94b06a', 11130),
(17, 40, 54, '2025-09-17 14:23:32', '9fcfa9b931dc4f7202bb9c3c208d4c54caad3b9cc0a0fbef1ad417404e519dc5', 75366),
(18, 41, 55, '2025-09-17 14:24:12', '56af2536c88d28aff25c1b8d457ced3d516f5b42212d315c3c56c95a751af3f2', 108646),
(19, 42, 56, '2025-09-17 14:42:16', '21f28401164da21e0be31c39f658860578ac45e3b18b1f655053783030bf0464', 15188),
(20, 42, 57, '2025-09-17 14:42:16', '289b29f751082759a6bb8199288298bfcb58855cf5e63d6ae025910f1fc1a8ba', 15188),
(21, 42, 58, '2025-09-17 14:42:16', '18c9b92d2b115f8552b43b3d2360afdfcaaa1812589c78045d35e17b529100bb', 15188),
(22, 42, 59, '2025-09-17 14:42:16', 'fed286be50858ec25fc3b47a61507bf17274f0667ccc6aa7c8f30270f881b5bf', 15188),
(23, 42, 60, '2025-09-17 14:42:16', '59e98003495873680fbe87ba2cbfb6f47733cff2ce7f09e42a024dc4b6696fd5', 15188),
(24, 42, 61, '2025-09-17 14:42:16', '7b7afb747d5c8818e10e8772fe324b88238b93ceefb72a4e9ac86562150ce2fb', 15188),
(25, 42, 62, '2025-09-17 14:42:16', '5f7eb35134354bd6e6f1bd4e86b659af9c33c396e3a5c4c146bbc8e0a19eac5c', 15188),
(26, 42, 63, '2025-09-17 14:42:16', '41127b73ec65b8ff1a42c55507275b51d66dc523781a5df1ab319a202ca461f6', 15188),
(27, 42, 64, '2025-09-17 14:42:16', '4af752e39386c060f062ab1497a5332f2b8313cb13bc966b5586c0e4e4668d69', 15188),
(28, 42, 65, '2025-09-17 14:42:16', '93b2cb8903cd319a7f496c8e8af5ebdfad21184617585aa574220636d69c8576', 15188),
(29, 42, 66, '2025-09-17 14:42:16', '9c8d7e21cc2b6888a5c2a07654a6b33be2f0b816d6674c003c4b50875d519027', 15188),
(30, 42, 67, '2025-09-17 14:42:16', '9d2d46c3863ffbf2fdac794148b3374ade6d699fcd6de8b4886bab48cdfd25e7', 15188),
(31, 42, 68, '2025-09-17 14:42:16', 'b61e72bbeaa7c97c0e9fe80fa2bfab26884b351be313b762e1ccd937116b84ea', 15188),
(32, 42, 69, '2025-09-17 14:42:16', 'e8d38bc2f467c2e87020ea5ec0633f1501025602edbdfbc13d988870a1c6f1ca', 15188),
(33, 42, 70, '2025-09-17 14:42:16', 'd4e1ea2dbcb3bed558cfca19b41f22ec696a882c5d64d60328e40f5ab2f686f3', 15188),
(34, 42, 71, '2025-09-17 14:42:16', '1e5fc3b2af08172863432c0520d73a03e85756d058754745b91eb06650f5f448', 15188),
(35, 42, 72, '2025-09-17 14:42:16', 'bc14f32b5ee5da70cb8ccf846931a91c5b865c87fece40f2988e6b3ed3be1400', 15188),
(36, 42, 73, '2025-09-17 14:42:16', 'f5e836b70a6dac8b3c7dac9eb2c370928e37a9e7bd9426e2d610d74e613acdca', 15188),
(37, 42, 74, '2025-09-17 14:42:16', 'c4cb1ef5b349954719795e3c375d55f93dbda21a755c1f2268bd07a594f5e816', 15188),
(38, 42, 75, '2025-09-17 14:42:16', '19831f6da97214dd2aedabf0c5d3b0691222d89cba42f352fdcb3006affcd878', 15188),
(39, 42, 76, '2025-09-17 14:42:16', '256cac4a9f1340044726127f4b2138fef0e62ed49d69fd7e48b33ce26dbb4bfa', 15188),
(40, 42, 77, '2025-09-17 14:42:16', '66e33188bcdf26b93204bcf876262b588d1386e4d1f039a86c4b78e43188cdec', 15188),
(41, 42, 78, '2025-09-17 14:42:16', 'f89a998d14e7240a5e8ebcf8f3c3c4fd95c0aaa550b7524b22c8551c067c0562', 15188),
(42, 42, 79, '2025-09-17 14:42:16', '3b3e8ac46b0e41586e15805aa9123a41a559881b54db25a3c96ab18be89b45e8', 15188),
(43, 42, 80, '2025-09-17 14:42:16', '6c4006abc9da26513187325e240b32e7b3b71520ed8021f4b68589f938a6c57b', 15188),
(44, 42, 81, '2025-09-17 14:42:16', 'c457e93260aff6dc8805d111e224c4151ba936455d86a22e38a43fcf9aac7df9', 15188),
(45, 42, 82, '2025-09-17 14:42:16', 'bfd78677213ea6300c2ef8d28e84ec0232afd8a917e6e77643b00255aefbc5b9', 15188),
(46, 42, 83, '2025-09-17 14:42:16', '8a75f36aaca71f2fa9acff708577113ec2fb7fe7cd7129e70af2ad1aa53438d7', 15188),
(47, 42, 84, '2025-09-17 14:42:16', 'c18924447a36709b40d55f5b3835fadb25bb25e7060c24b04f316b92e438200e', 15188),
(48, 42, 85, '2025-09-17 14:42:16', '324769167632cef44cbd81f55bf30541eb81b0acded005c60530bc6f4e15cc31', 15188),
(49, 42, 86, '2025-09-17 14:42:16', '9db6105ddb984faab03af297d93b39ab0a7968e856cc534a3f7a0c6fa3b0dfb6', 15188),
(50, 42, 87, '2025-09-17 14:42:16', '5fad712a11c790f980cb1315402c5f32a40d2468d1db305faed301d605112dc1', 15188),
(51, 42, 88, '2025-09-17 14:42:16', 'ecf23ec68ee721db0c641367cf858a79d588fd35d126322a66fef1aed60288d1', 15188),
(52, 42, 89, '2025-09-17 14:42:16', '8b32a72c9d0a179124c1e8d1ca1474d694116f280e1e4699a3f1dd95964d64a4', 15188),
(53, 42, 90, '2025-09-17 14:42:16', '9d35bece8d7f31f738e28d8f218a46300b7eb7cffa0cba16ea4594d18465f9bd', 15188),
(54, 42, 91, '2025-09-17 14:42:16', '3b532081826a09fafd3814d83031ab756c10da58291e93d0b17a8e98fe8d2a0f', 15188),
(55, 42, 92, '2025-09-17 14:42:16', '03cac9475b3e3dc63a306d980c1356f5c9911a178f02222e24e9fc98fdd5733c', 15188),
(56, 42, 93, '2025-09-17 14:42:16', '02c81febf86717b9d3b5fa3ec712556cc7bcca8dc03ba7381aad04a2d44ecf69', 15188),
(57, 42, 94, '2025-09-17 14:42:16', '76f555e4b340b59679f1438b5ad4355e0dda97632dc9f751489fff21a640dc4f', 15188),
(58, 42, 95, '2025-09-17 14:42:16', '28110b3341bf4eefcea17ee9f783db1240751d0223bf0183a615aab3f7e90d38', 15188),
(59, 42, 96, '2025-09-17 14:42:16', 'b768f55afd730de0aa371e208ab8a7dfcaaf8ad29d33126b5bfe2d1ec292eb40', 15188),
(60, 42, 97, '2025-09-17 14:42:16', '60fa7f472e7a9f6729e931c47b86b1ee5835dcd58bafc0372aacac3293d131e2', 15188),
(61, 43, 98, '2025-09-17 14:58:38', '304522e3f13fd37d3bd3090f96fe5c4d8082829a411f6a5542f87a6d6b8d95c3', 132952),
(62, 43, 99, '2025-09-17 14:58:38', '50732a5c38eea473efe4f179a7bab7cba0ef5285834884bd5da92db40e122cf6', 132952),
(63, 43, 100, '2025-09-17 14:58:38', '073b3ccb67aaa373316eda4794ee9e08b3f1ce134cc1bc4fd1c3b4c29e21cd92', 132952),
(64, 43, 101, '2025-09-17 14:58:38', '4be52b17daf7d099fc94f0674a8e45af1be6ec0be5a961519cf34326a1f8d26f', 132952),
(65, 43, 102, '2025-09-17 14:58:38', '7246653e07ed82215dd5a25d3f1fe037310aa3c3006e5089d7d0b789efba90f5', 132952),
(66, 43, 103, '2025-09-17 14:58:38', 'be6348a8f89835581c164585b5090875a4ce5a45179d83a5569e3e55f1b6ed77', 132952),
(67, 43, 104, '2025-09-17 14:58:38', '18e5294a8e32a0fb189d11ca91791377b99f8bda639d0abfa8ff0a35161c0eaa', 132952),
(68, 43, 105, '2025-09-17 14:58:38', '6488dbc45945f11f69980ab37bd8c2c5c66d15f55ed693f87143ead8a824ed51', 132952),
(69, 43, 106, '2025-09-17 14:58:38', '31af4ebed5634931b3523636ead1ddcff9d0577acc3e6016e31d29a6bf3c5550', 132952),
(70, 43, 107, '2025-09-17 14:58:38', '7e40e17177bd3af49768f55d6069fb642ed87df4263772ba1232cb88b29ef4d5', 132952),
(71, 43, 108, '2025-09-17 14:58:38', '1decd19292300c652391856cdd9491ee158ac5207c98104663e8904c7575e089', 132952),
(72, 43, 109, '2025-09-17 14:58:38', 'eefd039a25daf85a76dab592d8265370f7a01ca747a3c28ac5c97af3b89eb7a2', 132952),
(73, 44, 110, '2025-09-17 15:01:53', '2f0feb0f766616d03e09eac6ec243665a5a6b996df0817b1a374bafbe966545e', 6181),
(74, 44, 111, '2025-09-17 15:01:53', '082fe52761ee1d24e0701b9c821df64c5fbfa5d32a5d43d5a17b46b598f7af29', 6181),
(75, 45, 115, '2025-09-19 10:46:22', '702e6d0fbcac26b2334c08ea5771e731f67f34d68e964d56b0c058a330d24acc', 155193),
(76, 46, 116, '2025-09-19 11:24:41', '2c43514c8d87be32d1a8ba2225bae49c8a38970a1c8cdb761677dbdd1587d2cb', 18924),
(77, 46, 117, '2025-09-19 11:24:41', '18816cf67ea91bff3cd820122ef31c3f695bc4285e3909bde116ecc31d24d851', 18924),
(78, 46, 118, '2025-09-19 11:24:41', 'c8de54036c7d59deed8c41ef71640081acc83b05abf754c84dc892f7ad4a757e', 18924),
(79, 46, 119, '2025-09-19 11:24:41', '3a9a9602d3fcf1d5946c7a3d48fddc87c69cb4de584798d44e3ac08b25ea6d98', 18924),
(80, 46, 120, '2025-09-19 11:24:41', '352ede0ae0ad1526579e879c2d7c5597c1645d2a5599ad741a2a10164f83c63c', 18924),
(81, 46, 121, '2025-09-19 11:24:41', '3c41950891c0751427d40758d6206cd098db6e1604841f120440675ddfb0c803', 18924),
(82, 46, 122, '2025-09-19 11:24:41', '8edb640f00c52267e60d11be9c0806449242fe12fded5d808612ab1a9f71df68', 18924),
(83, 46, 123, '2025-09-19 11:24:41', '71d5862a506b7500f7f6b55500ec8cababac48b7835bdb89603cf4a18a0f1c98', 18924),
(84, 46, 124, '2025-09-19 11:24:41', 'da0842812332fdc507e926daed14de019022d1c9e742c72c4e382fc2f1e92f5e', 18924),
(85, 46, 125, '2025-09-19 11:24:41', '234c6a52823f50c8bbb104c082ed2cf59af032ee92f71c20cfbc5e96f27eb1f3', 18924),
(86, 46, 126, '2025-09-19 11:24:41', '0d6ffeb8cb989f04a7aca105ad5b75a481a0e23a3421df1a60ed1d6e7a1c3ce4', 18924),
(87, 46, 127, '2025-09-19 11:24:41', '9953fc916a8be200509d4ae1a009acf271722c2fee760d4d8cbd29f4f4da221f', 18924),
(88, 46, 128, '2025-09-19 11:24:41', 'b76d9b1b1382d809f39e207f9e85e06a33c59a19f7af4ec29898820f78e32afc', 18924),
(89, 46, 129, '2025-09-19 11:24:41', '7bebc8a0188ae0ce2caedc45958cc7c016ccecdc4628064a452ef2fd10390419', 18924),
(90, 46, 130, '2025-09-19 11:24:41', '8a08404e7cd5b4e432a6e09ca8032d495c76773dd0b3e1d83ac820e6960b1939', 18924),
(91, 46, 131, '2025-09-19 11:24:41', '816302d9eacb1bc11a8c00f5a1cea70c4d1879316f7645ece3672e7cbf6359b1', 18924),
(92, 46, 132, '2025-09-19 11:24:41', '8535c776df7c223348f3709b1534ac105bb84dbd373204482569ed58f4d1112f', 18924),
(93, 46, 133, '2025-09-19 11:24:41', '0702c739fdf7f6c111190b9f1633e536e5e0666c4e02a8d1c42abaf5240d1567', 18924),
(94, 46, 134, '2025-09-19 11:24:41', 'f590b6d8d720568dd44fef329749dd74dbd63cf6c24c33db26ebcfc271c6c19d', 18924),
(95, 46, 135, '2025-09-19 11:24:41', '9b83b9124b4fe0375191e4d9565c22ba83f49b5a52e5ae9f0ea34d1022eec29e', 18924),
(96, 46, 136, '2025-09-19 11:24:41', '5adf51cd389a38d577552f7707a8e96944455a17543e8a2225d0e3f0e9bd95c4', 18924),
(97, 46, 137, '2025-09-19 11:24:41', '9122a7cc1d1b27a3a9ce45ffb55810ed9962a28958f37461e6f0b8db0acad5e9', 18924),
(98, 46, 138, '2025-09-19 11:24:41', '5190a4103d282c455050d1122ca50f4e05b7f9a0af3a42e00b8234289899ccd6', 18924),
(99, 46, 139, '2025-09-19 11:24:41', '4e4c767588f9ba91159816ae52ea6f1f511a1ac279fd78f9a470702d5d8a2603', 18924),
(100, 46, 140, '2025-09-19 11:24:41', '6f04eb45ef5f1d7200511bcc814746f567c2ac16c472433484c14bd82e56c67d', 18924),
(101, 46, 141, '2025-09-19 11:24:41', '43d222c7d004d1d212540720c9c437fdf3da557e9f80e14225cff1a78f93c6bc', 18924),
(102, 46, 142, '2025-09-19 11:24:41', '4cc70009e470d08824b0714df59c1711036a1eda666924f81791ba6941350b2d', 18924),
(103, 46, 143, '2025-09-19 11:24:41', '2928bd744f7d682a3485289447b00fc307ef77d603c9fa999aed0415e6b7f838', 18924),
(104, 46, 144, '2025-09-19 11:24:41', '136ba6f6b694f133de79f356d9d5596f68f3aff02d41e771acc73e259a0a2afd', 18924),
(105, 46, 145, '2025-09-19 11:24:41', '4cfcbc6a9cb9455456c8ae41261edf0cad279a5c7f304e7c0b7d39ab535008a1', 18924),
(106, 46, 146, '2025-09-19 11:24:41', '84a6837139eeb62108994d9a3a8c98c8bd369cd908676408944e1936be0dc92d', 18924),
(107, 46, 147, '2025-09-19 11:24:41', 'b0d01d9182703396ba014780fb9fbdbd97e8780115cfc731b77384d92cac9f76', 18924),
(108, 46, 148, '2025-09-19 11:24:41', '9d2ef86d54db7991821a4768eb65c03f75546439fbf5afa4675f5b2cdf8abc7a', 18924),
(109, 46, 149, '2025-09-19 11:24:41', '2bc25abb5ee5dcc26e4597f86ef0a9f1b3b8586cdd5b763a146b3281ded0c497', 18924),
(110, 46, 150, '2025-09-19 11:24:41', 'd7d4fa65bb746d63480fcff93a485aec204ed91a9a80a468d742180e52a74936', 18924),
(111, 46, 151, '2025-09-19 11:24:41', 'fe375136c76dc2279348727daa2175d90c8ad9f0774c094e345b4f1d070778bb', 18924),
(112, 46, 152, '2025-09-19 11:24:41', '31c44b5b5339614e7e1cdae3c47ae81e38323bac5e1a3b1c72aabe0cd70f69d9', 18924),
(113, 46, 153, '2025-09-19 11:24:41', '2e3718dbf7199b19d09bda28dceed818267947fed31bf8fa6e8bf27a968c1ca6', 18924),
(114, 46, 154, '2025-09-19 11:24:41', '77f4e3215d74677b57660c8359bb2a908bb1c541f32328c52b06615a780a09da', 18924),
(115, 46, 155, '2025-09-19 11:24:41', 'e51987f11148ba3357c35da31033b80e91ac3b0bc8070d07cca00a2c3fc8167b', 18924),
(116, 46, 156, '2025-09-19 11:24:41', '1bdd638b51011f6d5798f95455047245f0395ba8589d9029f1afae74b0af6426', 18924),
(117, 46, 157, '2025-09-19 11:24:41', '8961b3685760963f8ab5514c1e93cc39a27d2e59eab951f58a74871bfb8950f5', 18924),
(118, 46, 158, '2025-09-19 11:24:41', '3d1afbe8ef11f2440ad09e7bc49e358a4a2ac27129f6d9bca05d68b53cbf4cf5', 18924),
(119, 46, 159, '2025-09-19 11:24:41', 'a2f204c0f131ea8a56bf35ca91615e2e0076b9ecae40054782fb71b984ed77c6', 18924),
(120, 46, 160, '2025-09-19 11:24:41', '859349291f568c6ae5b5e4774a67619950696df54019c13b6d1ca53c7784ee2e', 18924),
(121, 46, 161, '2025-09-19 11:24:41', '33fff8f5cbbba4d86a86f9ea2f6fd90e44547db140553b7b71e14ca44abb8501', 18924),
(122, 46, 162, '2025-09-19 11:24:41', 'c873846c945bb3a7c502d1bb69c97197c4ab6231e85b7dd253a7476826c1b932', 18924),
(123, 46, 163, '2025-09-19 11:24:41', 'a58a3a132b270edffbe242079ae257df0a174c79cde3e03d01959a0c9e1afae2', 18924),
(124, 46, 164, '2025-09-19 11:24:41', 'aa0d80b0126cfb36ebbd7a625e5fa81350f3803e65e27004d474bb361c12e177', 18924),
(125, 46, 165, '2025-09-19 11:24:41', 'a269a72d496b8ff24d9dcc7222316a8e985540ab53a9e12f63ab850c9e811e26', 18924),
(126, 46, 166, '2025-09-19 11:24:41', '6f9010eae0eb08456a66fb75a237ed3d4cc83718369467239369de71800cf3c1', 18924),
(127, 46, 167, '2025-09-19 11:24:41', '506a8edc62247a1e4933e28089c90577331f5066b3af18565addfdded4a2efde', 18924),
(128, 46, 168, '2025-09-19 11:24:41', 'c08b9813f7fb45e923d8b7bb5487f9bf5fb67d12e6556c4d978d8cd7680bf637', 18924),
(129, 46, 169, '2025-09-19 11:24:41', '503b66c8de0a1562d8d778e10866048947c7d8a60dac9f38dd73c6adc27000ea', 18924),
(130, 46, 170, '2025-09-19 11:24:41', '178df743bdd7abc4b76bfc2417cfa660039aa19d4bf4daddb71ceb92ef4c80cf', 18924),
(131, 46, 171, '2025-09-19 11:24:41', 'd949ddbdcb89dca5524dfe8260c16f1b1384b1e2ab00c7395fd5f5c84ac6baf8', 18924),
(132, 46, 172, '2025-09-19 11:24:41', 'add1525fc9e8e5f7acad41f2e40e9fed83cca1885b4342d26a3b2d65f57f213a', 18924),
(133, 46, 173, '2025-09-19 11:24:41', '7b20c662af255d8cf9c18817bf93f76c8fed020723b484be27fda4bf1d439fdb', 18924),
(134, 46, 174, '2025-09-19 11:24:41', '274b366b440b4b901e6b82dd2948ae9fa0e0e28923e0f8fab9e1b06e71efce41', 18924),
(135, 46, 175, '2025-09-19 11:24:41', 'a6a1b4eab43a1099d30bd2565969b7d7534a420a838f0ae3a9f2e2537c741de4', 18924),
(136, 46, 176, '2025-09-19 11:24:41', '752904510bf71cff37194839504a6cbb4df47a4af71c2a62f36d0159d9c4dab6', 18924),
(137, 46, 177, '2025-09-19 11:24:41', 'b0ee1afc210800eb042eb923dec350709adc18b5242695a2704dac7ba9cfa459', 18924),
(138, 46, 178, '2025-09-19 11:24:41', '9d6e6590d8e123e0ea44744064b273aaae779e1f5ab3e2385ca30cf05bcb89b6', 18924),
(139, 46, 179, '2025-09-19 11:24:41', '33fce382de156df3e98e67531f2bf5ef50d366fb0426f171356a3b431508fe4a', 18924),
(140, 46, 180, '2025-09-19 11:24:41', 'abe5b786ca6a832f77dc645021578f2edb50bbd4bf2942b061ce21b4506ab1b6', 18924),
(141, 46, 181, '2025-09-19 11:24:41', 'ae397874632d1a9b218fbe30a2026287304e40462027da2059faa54a067446c5', 18924),
(142, 46, 182, '2025-09-19 11:24:41', '06f6fda1b6fc149f784fde5fecf2a2e171e5fb769d4b38ab2e5ac2363d390133', 18924),
(143, 46, 183, '2025-09-19 11:24:41', '26a6a5958f179f16687f97a92f400a44fdda57619e5cd19e0b232d42dede0ef2', 18924),
(144, 46, 184, '2025-09-19 11:24:41', '2114484dd905e769a7c79ffe82e612b72b2e51a12249f700d0718dfab3dbd1e0', 18924),
(145, 46, 185, '2025-09-19 11:24:41', '493a6e71e5e9a4488a7e94ba27042244a1ee8980dfd3cc2db88c56a3cb03952b', 18924),
(146, 46, 186, '2025-09-19 11:24:41', 'bfc68b191796f731b6f3ca1f4d3d6f1e0f54099d0419073d87409a3ca1c2a7a5', 18924),
(147, 46, 187, '2025-09-19 11:24:41', 'c9d551b2c983923c874192e8077f100bce24bb401699df20214f536ed4c8c73b', 18924),
(148, 46, 188, '2025-09-19 11:24:41', '81003cb46e8a4c5214d3f190f1d3ef9e07e3b8982900c45aaf4cbb55b8991139', 18924),
(149, 46, 189, '2025-09-19 11:24:41', 'bdb4ea65701aafdb043b31c230a07ce63c10322b1cffbb8183423271d73eba53', 18924),
(150, 46, 190, '2025-09-19 11:24:41', '15def0c0b27d8253a2c2952fe64fa9ef1485313d1711effae116f592feb60617', 18924),
(151, 46, 191, '2025-09-19 11:24:41', '101f7696ae0046bb27f21714fadf22f42593f5a7f631d9f16eaa7b4b27a9b97a', 18924),
(152, 46, 192, '2025-09-19 11:24:41', 'fda19e7998c9b01aef39246876b0f0fc20fce789af7e82df4d987ca6b89c92e7', 18924),
(153, 46, 193, '2025-09-19 11:24:41', '55ea98500f7f9f3dd4d4cd4775a6ce6b59067ca380835c85f27e2c805a1c9386', 18924),
(154, 46, 194, '2025-09-19 11:24:41', 'b68e0e38bc03e85414ccec711d25b2b17ccff65fecb11b9dc736fb4846a498b6', 18924),
(155, 46, 195, '2025-09-19 11:24:41', '2c0b5b93144a1b1a1da53a9b7fb91cd374b60038b3f147f16af0dbd72e087a6d', 18924),
(156, 46, 196, '2025-09-19 11:24:41', '277652217cc850b20c40ca5892abe28ea0a1af25bddfe92575cf63db076543a6', 18924),
(157, 46, 197, '2025-09-19 11:24:41', '9306ae8207cb26bc8c5b1d17d71b2b9cdd374c3c54323d963f24a62b5ffd2d95', 18924),
(158, 46, 198, '2025-09-19 11:24:41', '7683ace9f2df82cc95f063677e99d5b7dd5304ebc01d04a93cf93a2b5bc4e5af', 18924),
(159, 46, 199, '2025-09-19 11:24:41', 'a07790148707d4efe656850cd19972ba62cbfa5aaa62c64d88b78c235e43675f', 18924),
(160, 46, 200, '2025-09-19 11:24:41', '13ad6967c321c963192b878ed40e249daa5f36338738fe9d84fa842ae6970ceb', 18924),
(161, 46, 201, '2025-09-19 11:24:41', 'be6b0df226bd1a4b30531c582216e456b7f7e9a21c40ef8febc82bfb7e377373', 18924),
(162, 46, 202, '2025-09-19 11:24:41', '8136eadc9223f8c712a56716883a75e6ac0c72d980e5239286b8c3469b3f31df', 18924),
(163, 46, 203, '2025-09-19 11:24:41', '328342f1f8cbd1681079d1fdc1dcc8a526c68d24af2be373705e7dba3f9810a2', 18924),
(164, 46, 204, '2025-09-19 11:24:41', '4c7d30ed65cbec9f658e1beb522f2f53db96dd8f0e3475c3bec10d284b3ea84f', 18924),
(165, 46, 205, '2025-09-19 11:24:41', '6341ebf066fbfabbb249ba234747ff7dda5803f52d17c28dcdd866465f52c6ae', 18924),
(166, 46, 206, '2025-09-19 11:24:41', '9c440e84eb33ef1311a7da1dca30c3a7b2db0a77283b520889e23f8c470403ae', 18924),
(167, 46, 207, '2025-09-19 11:24:41', '0c33dc6e6758273c64821205de716043b1ee9e767b27a99f5c85c2cf898e758a', 18924),
(168, 46, 208, '2025-09-19 11:24:41', '9d8bb679e1ca968ef6dc08863485475b8051036ecedf159f0624965ca61687e4', 18924),
(169, 46, 209, '2025-09-19 11:24:41', '9e2c4aa8cf4fdd19d8bdc0cd10bf29127f802d7c65fe2062e79c05b3b6192de6', 18924),
(170, 46, 210, '2025-09-19 11:24:41', '5fc1a7821698a2a47b782eb6b8bd72444914a513665019b8925447fa51832b4b', 18924),
(171, 46, 211, '2025-09-19 11:24:41', '27c8cc5337068457a589cf7707f75f711e68452c4ab80edb4ab9edb46c5fd798', 18924),
(172, 46, 212, '2025-09-19 11:24:41', '57cdee89d6b64bad3472fb49d6447462f1946ed4e723249227791eb0168c32e4', 18924),
(173, 46, 213, '2025-09-19 11:24:41', '9743e449e8d9f08621614f9b48da567f9cca2f90b62a5231d13d6362f2b08f57', 18924),
(174, 46, 214, '2025-09-19 11:24:41', '43a4d23210103b8c23805da1e0e67d6ea39603ec80ffc24a390ed1f197b80f32', 18924),
(175, 46, 215, '2025-09-19 11:24:41', 'f976976f2ba69c5329e3d0ff3cad2648271e4993f0a9cf9d5aa24af07854ad78', 18924),
(176, 46, 216, '2025-09-19 11:24:41', 'fcddd73122c9527842e921520dc2bf022006a6d26819e6dd4e55593cd6d42a08', 18924),
(177, 46, 217, '2025-09-19 11:24:41', 'b0fa8290896556c558f6f93e74f0bc5d57414e2d7bb839ff58e2e03ac725ed3a', 18924),
(178, 46, 218, '2025-09-19 11:24:41', '3f341fd89eabdaaadf14db685846595ef989df95718d76b90033ff1bdda46551', 18924),
(179, 46, 219, '2025-09-19 11:24:41', '1a28debbc966177d90835e06b5183934f3b79b850f3654bc82c9c150d3e7aab2', 18924),
(180, 46, 220, '2025-09-19 11:24:41', '4ef14f167f261b2003880a1b9a7817054d1a9079670561c7477082f331f482d7', 18924),
(181, 46, 221, '2025-09-19 11:24:41', '3801abfc4db57d5a31354198d1aec71f0a23fa3978fc382991e3e393cad9d101', 18924),
(182, 46, 222, '2025-09-19 11:24:41', 'f6fd0bb7446b5ffcae033ab158ffbd63f215c32958cbf3c44497f2d96a23bbb3', 18924),
(183, 46, 223, '2025-09-19 11:24:41', '5c64600d366cdb61ac988fa8c5accea9847cb3aa5276977c8db3fd7611d3ad5f', 18924),
(184, 46, 224, '2025-09-19 11:24:41', '6e6f0548b17e3fdc6325b4317cffce561c915dfdba11ced8912f597aa9e856c2', 18924),
(185, 46, 225, '2025-09-19 11:24:41', '67d5aaa8468626a13b96a587450f4c1d8d2ad2a7b4828072a73c721ae6e63ddb', 18924),
(186, 46, 226, '2025-09-19 11:24:41', '91dff2b3ffd6a590bb486c23e994e9a9fa0b8ad5a3cb29f2e0cd47f8105b17e9', 18924),
(187, 46, 227, '2025-09-19 11:24:41', 'd322217f1750354ad014ba4df719685207d6eb444269bee152f59fbc0b346a3c', 18924),
(188, 46, 228, '2025-09-19 11:24:41', '41d88994436fb94b4505554b984d98d67866bf587bc799d9ff39eb446676336b', 18924),
(189, 46, 229, '2025-09-19 11:24:41', 'd4af797237ac80df612fd75f0611db38e174bbf68ca853a8d69fa02353e9d967', 18924),
(190, 46, 230, '2025-09-19 11:24:41', 'e5ce7f47ba0c58701f4908949724c946b3ab9437f2df2fe662d202742e9a9151', 18924),
(191, 46, 231, '2025-09-19 11:24:41', '65809a5a602d24255d6b574611ac71b322a4d5295321ae3369df3d0097c9b909', 18924),
(192, 46, 232, '2025-09-19 11:24:41', 'b0f929b3e33353f4699094bf26b77e1af2187896b10a7ef512cb55499e4c95da', 18924),
(193, 47, 233, '2025-09-19 11:32:13', 'c00d8dac2937fa53c6d50fef70b96216cde6ae92cdd9a86baea1a7647f9e75fd', 76393),
(194, 47, 234, '2025-09-19 11:32:13', 'a07dd43596c1ac923336fcfa2774a0d49924a96af003d30d29c55f6a4690e79e', 76393),
(195, 47, 235, '2025-09-19 11:32:13', '9d0a802ea90569e87cae92dcb1bad6c1a01731e9b21cc4aba875a15c23b524cf', 76393),
(196, 47, 236, '2025-09-19 11:32:13', 'b3bff0cecb0706bf23feb7e41fc88db41345a99f05262c936fd0192794a29714', 76393),
(197, 47, 237, '2025-09-19 11:32:13', '39985b656e46f1dbbf8cf67a865f8a33e26e662896f8f6b6d362d44e5c6df41a', 76393),
(198, 47, 238, '2025-09-19 11:32:13', 'c03481568372516be1355970a10669fd6877347302824eb87b0a95e103245f8c', 76393),
(199, 47, 239, '2025-09-19 11:32:13', '4714de363abec4afcf46cd8aeb0b8346efea6eabf1580f0a3ff3b4bdbe4acfac', 76393),
(200, 47, 240, '2025-09-19 11:32:13', '12c1f46523e010cc673d957fc5dc8bafdcedc8d075b853c9fa5b44a055dac6b7', 76393),
(201, 47, 241, '2025-09-19 11:32:13', '5f5b8646b12a22c589289bceffb8c967584d455eaee4557c9fb6c0cc64856b0a', 76393),
(202, 48, 242, '2025-09-19 11:35:08', '7e2e011af052bf03bb47e0effbfb90a33572933e4421f1659f3448a8203525f5', 14650),
(203, 49, 243, '2025-09-19 12:29:51', 'e5a52832263b2ef134a26fc7eaee6483d1924ff8ed7e2ae80aa5d48cb64d0fd3', 131582),
(204, 49, 244, '2025-09-19 12:29:51', '2f1dc98e0f9ca336788f76a3d70839f390745ebf419151621aa0bfc9b6b15655', 131582),
(205, 49, 245, '2025-09-19 12:29:51', '9fe4f772d2e8f8dee370b0db4c93f62e2d2c42e861c0361dbf15e850112a57d9', 131582),
(206, 49, 246, '2025-09-19 12:29:51', '03cd6b90ae0f0d1f2f04e7ff400b8d0e637d7f6bff59140c7637a69b280e2ce4', 131582),
(207, 49, 247, '2025-09-19 12:29:51', '42e5bfd5c51b579d0f4d6a799f286bc98d32411f2b93519857b93ca339e23e06', 131582),
(208, 49, 248, '2025-09-19 12:29:51', 'ca81386484e0e5ff6969a02f8ae7d47272cf113afdc070648c002f240a0af75d', 131582),
(209, 49, 249, '2025-09-19 12:29:51', 'f8d9756f27b78dabda0c200329fd2cbfe40082700921591cc94730a78affd52b', 131582),
(210, 49, 250, '2025-09-19 12:29:51', '6fbbeb372cdcfba41658514973c2c3fd5f27f6752668cba751eb1bd44413a87b', 131582),
(211, 49, 251, '2025-09-19 12:29:51', '6b478e7410bef2622140e529407313babcbe1e034b68c7c1fb9fb245d876a3a1', 131582),
(212, 49, 252, '2025-09-19 12:29:51', '8f424b7d3571735deaafec33420d0b78cc5ea94efb47a8a8a5517da8d30d27c0', 131582),
(213, 49, 253, '2025-09-19 12:29:51', '4c9c465bd9ddadb0f03385d19cda933e2b87bb637c51270aae50dd9de16a82d9', 131582),
(214, 49, 254, '2025-09-19 12:29:51', '7cf6d20260001b8e545ab1bccaae7ee5c74b2d543193987a2516565364c5a32b', 131582),
(215, 49, 255, '2025-09-19 12:29:51', '1382c9986fb80f95ddb32c3608a0ab79e3389e8cc5716d9146a3228e861693f2', 131582),
(216, 49, 256, '2025-09-19 12:29:51', 'ad0303e158f887ac7533ec709c36d10b2dde2cc39a798d4fff713cce01decf03', 131582),
(217, 49, 257, '2025-09-19 12:29:51', 'f83ffba9219543aec02c3932f97773f905dd18cb1397f851fdbccd84f976ee65', 131582),
(218, 49, 258, '2025-09-19 12:29:51', '1faa8646f00fe787265049088432343216b99b6e9a9c5d4e9504d53122cba235', 131582),
(219, 49, 259, '2025-09-19 12:29:51', '9c284ce15efa823b0a45cef8b822c27b6de58b1e3ce7577c69b9722eb233717f', 131582),
(220, 49, 260, '2025-09-19 12:29:51', '9649ca6649d58478ffd801a9ff5a80f55c0b7ff7db34cd17d255534c0f32ebb6', 131582),
(221, 49, 261, '2025-09-19 12:29:51', '039dd004c5230cd1fa40619bac05a39e38ebf46ab2381ba2b0c923e82f476bda', 131582),
(222, 49, 262, '2025-09-19 12:29:51', '77c3977756e5964ba3d93dc7d44a6c420f67468e8c987f9603fcb5ba52119a48', 131582),
(223, 49, 263, '2025-09-19 12:29:51', '622092dbe50b2fbda340e7e6369f2c35b628ddaf6b3ac669ad05ac29685887b5', 131582),
(224, 49, 264, '2025-09-19 12:29:51', '506fc23a4c4b0a75f313e312fc5005ddbe4512cc8dacc13e6f9424c7abfc2222', 131582),
(225, 49, 265, '2025-09-19 12:29:51', 'a0bd3aa0a5130187e96c919c428bdccbea71928842556d840aae58dae74a7efd', 131582),
(226, 49, 266, '2025-09-19 12:29:51', '6c84254c41a64aa1cfd2db522d5de913cec2559df1080713a00253a389a4fca8', 131582),
(227, 49, 267, '2025-09-19 12:29:51', '7937a94ed476e4dc3d359512b4c3dd80743edfc125324b6d43de3c2cb3c11d33', 131582),
(228, 49, 268, '2025-09-19 12:29:51', '08679079b1ffbea649ca96e855822fa847908edac58f5de3413e47404f06e042', 131582),
(229, 49, 269, '2025-09-19 12:29:51', 'a58b62481df67ea05a08213a0ab48dfa768de7b8cf90f8f971c7037a95e9cdd3', 131582),
(230, 49, 270, '2025-09-19 12:29:51', '843021a16f35762e893addb7077646052f595120a022b1a2ede4f1cf80c0a7ec', 131582),
(231, 49, 271, '2025-09-19 12:29:51', '901dae727459263d870b397e13958050429da481b166c8cb675e314c39d337b2', 131582),
(232, 49, 272, '2025-09-19 12:29:51', '4d01f1a3b14ae7b72c36446c765893c7aa4f552a49d9503154e07e8f95fa240d', 131582),
(233, 49, 273, '2025-09-19 12:29:51', '2e2da66bc23f3ad6c0de5b1c719f6e1a98e263243fa2eca87b6b253b11fa31c6', 131582),
(234, 49, 274, '2025-09-19 12:29:51', '23d609ce1d712700a01fca9eba7f6b38e18fa8a12fbb8ed54c3288c12576df52', 131582),
(235, 49, 275, '2025-09-19 12:29:51', '14c5b9f4792af14c3bcb1178828c7e8d5b23d487a8fc281cf0a31283b56f3402', 131582),
(236, 49, 276, '2025-09-19 12:29:51', '9a53c42e5a8b7bb44c490636ed5f4701c8b10e861b86857f74c8aeda1699e65c', 131582),
(237, 49, 277, '2025-09-19 12:29:51', 'cd428c665df0f497953f343cbd455d6cf75d482288ca9e8a2b2c8ab1df8386d3', 131582),
(238, 49, 278, '2025-09-19 12:29:51', 'b78d0140b9df78016242a3cd4ed7ef26af3619782f653770350768e29d0525f3', 131582),
(239, 49, 279, '2025-09-19 12:29:51', '2ea620ed031e4a1f7f2128cc21cc870318200908d7f4bdfd897e4239f977c106', 131582),
(240, 49, 280, '2025-09-19 12:29:51', 'eacf7f28f0f531ea96e9d377cd2f8174754e815d9bbfa35c808b436ae964aa55', 131582),
(241, 49, 281, '2025-09-19 12:29:51', '96b368f0bf27f9948efb8ccd2c73c1a352294fa38f184c17a86048e390b087f8', 131582),
(242, 49, 282, '2025-09-19 12:29:51', '1a06410d8febc95d8998ddbb9bcaa02e74a253db8af6ebe9955830c28be7d4ab', 131582),
(243, 49, 283, '2025-09-19 12:29:51', '67197a5994426f4cd025801c262f413f827b72d3b6f824b046bc1fb0f897ba89', 131582),
(244, 49, 284, '2025-09-19 12:29:51', 'eec05eb8e47bc4e587384954e2ad27ad7e3e509cec9e7ea4dcce2622d79e2ec7', 131582),
(245, 49, 285, '2025-09-19 12:29:51', '8e3e63107a26112cb3ecf1360e7dd1b66210cdaa4bb090ec03ebf80012093237', 131582),
(246, 49, 286, '2025-09-19 12:29:51', 'f35c9bab01e7f7a3ed1acb724f37a491bd1ceda64917803432038e3b6d61d558', 131582),
(247, 49, 287, '2025-09-19 12:29:51', '8510d27ae0e094400817ee07ce193552554b3d64f8287c45505940e29bf72534', 131582),
(248, 49, 288, '2025-09-19 12:29:51', '041b3f79098b197aff9772d9096cf1d94a991cf880092d177b94abdd20e857f5', 131582),
(249, 49, 289, '2025-09-19 12:29:51', 'af826879771063c81b28d16002a0e8e176fd6eddf9a43a53e86b62fd519fd3eb', 131582),
(250, 49, 290, '2025-09-19 12:29:51', 'cc3c323e980ad2c24487a7a7dc86ea54e247945cc67d350a31c2f171f0de58a0', 131582),
(251, 49, 291, '2025-09-19 12:29:51', '6075c7cbfec0263167cca1cd434a622f305a60ccf2562f1ee7457b33fb4156e0', 131582),
(252, 49, 292, '2025-09-19 12:29:51', '17eef97de06c7e837be3adce7adafe2bbb24b0238f0b8781bef36ae96b970197', 131582),
(253, 49, 293, '2025-09-19 12:29:51', '649f20c31c0e843232b7527409ab032f041def4d40fa443d44578e9cc12a521e', 131582),
(254, 49, 294, '2025-09-19 12:29:51', '286f08796abc7f32da221436d2ea29fea908e48086482a868d877582dc39b76c', 131582),
(255, 49, 295, '2025-09-19 12:29:51', '449f341234ca43a03cbe0f648e4b9b36d2a3789293ebbd4206ed1e3fec9802fb', 131582),
(256, 49, 296, '2025-09-19 12:29:51', '0d6bc771eb3cb539ae7447e395ca705515a30e46551e4cc33b7806feed001948', 131582),
(257, 49, 297, '2025-09-19 12:29:51', 'f7b72c659c9ab7ed5000a5e57f680a28db8c93cb48d8109220c0fb7e531a8b96', 131582),
(258, 49, 298, '2025-09-19 12:29:51', 'a551ab7630c46fd1153afc23376f188f13adf6d202003de3c1091c99a3cd790f', 131582),
(259, 49, 299, '2025-09-19 12:29:51', 'cd61fd4f5ff3f5fed9a8931396895202969fdcc87c1185fe93a38fb9761141b7', 131582),
(260, 49, 300, '2025-09-19 12:29:51', '75a4412744d20f65dc98b5a4dc6518877be10333824d18666361f49f4de3018e', 131582),
(261, 49, 301, '2025-09-19 12:29:51', 'ad165a381e61b437102c2f6113bec711731fe1ebb61a405ac03521a8334f8640', 131582),
(262, 49, 302, '2025-09-19 12:29:51', '68f8f02b6094eb1a6c644ddecef0d28928fc880e266a46b8d2b64878e3e8e274', 131582),
(263, 49, 303, '2025-09-19 12:29:51', '66de7ddcc64d7eb2d3f6d1556f2f708578e832447eae3762e59b0af8e51e0c2d', 131582),
(264, 49, 304, '2025-09-19 12:29:51', 'dbc1942608dc95987cae4b94d36640e55d56b01453c4a51284ff1744c611e45d', 131582),
(265, 49, 305, '2025-09-19 12:29:51', '44f6c0e2ca080ab5e6f3814d2144eb92d99374bd9bb2e5d2adc06958d75eb8a6', 131582),
(266, 49, 306, '2025-09-19 12:29:51', '6b573a5fa2ab2f9b52061f3830d972c4013d5076079aa4e4c2e367e38a1861b1', 131582),
(267, 49, 307, '2025-09-19 12:29:51', '47d36fa6736a7cbb0ce6cdc0d217f055b33072716f1828e8e0f048be4ed0b122', 131582),
(268, 49, 308, '2025-09-19 12:29:51', 'f7145a9811239e24210e779b65667a7638e2b9ac0d2ae135308fbffd8f3a2f57', 131582),
(269, 49, 309, '2025-09-19 12:29:51', 'd31053114724f33033c0fb8186cfe21dd8441c07d3a80f63b680d7d1db0a8e75', 131582),
(270, 49, 310, '2025-09-19 12:29:51', 'acf81d30bd8568a37c2892b6aa021480e2dc2c386271ed4cbaa28c8a7b3b85ae', 131582),
(271, 49, 311, '2025-09-19 12:29:51', '57d46e0b41c2e561fe3150f422c5d7937cf5cdac207a3f29cdac4fb4f1efb96d', 131582),
(272, 49, 312, '2025-09-19 12:29:51', 'a4b9e403c71fdb37cfbe80a8416ff61922abd1aab1c72c3160e9dcad022e929c', 131582),
(273, 49, 313, '2025-09-19 12:29:51', '0e32a368ad2ec676f981214a1b6e218611c4bedb1321da94f611f48e03f98d8e', 131582),
(274, 49, 314, '2025-09-19 12:29:51', '207c22a6e89c93136dc96a30332e59ad2c50510331c5223e6fe4c2d88c8688f0', 131582),
(275, 49, 315, '2025-09-19 12:29:51', '2fad24c2d4b316a4cf24c69b0b4b090aacc262ab6365fbb4cd5a05b84cd3325b', 131582),
(276, 49, 316, '2025-09-19 12:29:51', '1d209ce7389c1de272bae0e3f4b9f88767d9cb0f1321df495fb26b1dd06fa93d', 131582),
(277, 49, 317, '2025-09-19 12:29:51', '9e3c5204863fdf5ce152c1ef7f7556b23c5e176971e2d6d72c48d3a9e9b5b992', 131582),
(278, 49, 318, '2025-09-19 12:29:51', 'df8f9640ba2ee22d65e7962aa535734e4105ba2d0e628f9167bc49483bec87de', 131582),
(279, 49, 319, '2025-09-19 12:29:51', '7c43c68299d292f4d74f7070f6003a9105e2552c281d13eb3b88b0394469332a', 131582),
(280, 49, 320, '2025-09-19 12:29:51', 'a5ae6a7422352f894c74894925cd909ffd0ae203422c5097c5e580f1c99e6eb1', 131582),
(281, 49, 321, '2025-09-19 12:29:51', '33d306e392127eaf6cf60409bbbe7d7420ddc14ca989e19832f44d7ea6f3755d', 131582),
(282, 49, 322, '2025-09-19 12:29:51', '929f257aeb3875a3e035e38dfc16aaefe487de6a96df819a4a4d6dac110d1917', 131582),
(283, 49, 323, '2025-09-19 12:29:51', 'b1f61bf737a78b85f25e97e9a2bbd29087b8a14388175e0b71c25a9e252f22c4', 131582),
(284, 49, 324, '2025-09-19 12:29:51', '0a9858e32dd80f58b183bfb7ebafd08a39048a88db8bfaea5fd60061fbedd4d4', 131582),
(285, 49, 325, '2025-09-19 12:29:51', 'c4fc09692a34ffea2b3b37cdeaa75d64437c4d0de131cb2da9cc10fb013e1fcb', 131582),
(286, 49, 326, '2025-09-19 12:29:51', '3f15f1ed7d793e2aeef97fab102269cafb165ca0e2209d213b68e200d110f3ab', 131582),
(287, 49, 327, '2025-09-19 12:29:51', '5a8a2399335e9da050d8c8b8c2137c02e4972dd78c283fbe1e28e9c8b7130108', 131582),
(288, 49, 328, '2025-09-19 12:29:51', 'd210aeb11b5f03a9b5af33c68ebef43d05e1b077b01456276ca6e522708c566a', 131582),
(289, 49, 329, '2025-09-19 12:29:51', '6b50ab5d019551c401ad0a0b4007653ebad1a91e184c298a3c3d321ade99b21b', 131582),
(290, 49, 330, '2025-09-19 12:29:51', 'a74362074d1e57fdc36a834eda6ffa48a71bd34b4ad6bab6c47e659c56a2e2c3', 131582),
(291, 49, 331, '2025-09-19 12:29:51', 'f6993c9df5922229cff2d38c76fe1a1377d13e43c1dcb1aa10010851cfbdf029', 131582),
(292, 49, 332, '2025-09-19 12:29:51', '3ea4a36160d0bd77464dcbc64057b1fe347a89210f594013e9528579b3ffb704', 131582),
(293, 49, 333, '2025-09-19 12:29:51', '9a8dc979cdde9c9530097622ebd5ed3963227e933db45826895206a435ccaa0d', 131582),
(294, 49, 334, '2025-09-19 12:29:51', '26d42e4b8f6c38ac5b094f6406fc50e6ae4b4e72f0f609b5a975d5aef0b26555', 131582),
(295, 49, 335, '2025-09-19 12:29:51', '2b5991b8b3701cc2ad696fe182d86417728b5367b4e0379dd1f0f3945df00698', 131582),
(296, 49, 336, '2025-09-19 12:29:51', 'd978c679392de88d3c64a35cd37426d3518a91228e34532699880a8f26a00d95', 131582),
(297, 49, 337, '2025-09-19 12:29:51', 'eacfc68455f320b32a5738b9d437a8b808c376316cd1cbe49bd22230edc22110', 131582),
(298, 49, 338, '2025-09-19 12:29:51', '9482735c8200d52b5ee095c885e768c9d55b7a5b7ad55c79f3dc61665cf7ed41', 131582),
(299, 49, 339, '2025-09-19 12:29:51', '5cbb365a9a19484d4b64dde9eac542f8090ebcea7c2f991c1b79faada9b1bfff', 131582),
(300, 49, 340, '2025-09-19 12:29:51', '94a751fd7c7f160b1f10974904b9a997ce8a6a54c8972189b4d9f7b937c585e6', 131582),
(301, 49, 341, '2025-09-19 12:29:51', '242725bdd8ba9be174aadbe930b167f10db1956f1ed38101fed43af67b0300a6', 131582),
(302, 49, 342, '2025-09-19 12:29:51', 'b892b8a7b79367f9b564f28d5c3b6a4bad700ae63205f43d9cd27879f8a0fb60', 131582),
(303, 49, 343, '2025-09-19 12:29:51', '5313ca28ff1f4d775f96220a78f6a54863fcb83c82dc4394b6db1b345bcc4409', 131582),
(304, 49, 344, '2025-09-19 12:29:51', '7084947a1f3af517ff40cd11dd85f59a8c6e5f6ff36bf72e13b7998834494fa7', 131582),
(305, 49, 345, '2025-09-19 12:29:51', '532977b7d392b270ddb15b5c47c3d283e42ed38704ca113c916a3c69974e6e86', 131582),
(306, 49, 346, '2025-09-19 12:29:51', '2955e235107e726d6478b592ae0991d4a7c69b989e8dbbb636e2641ae8ddfb65', 131582),
(307, 49, 347, '2025-09-19 12:29:51', '2b6450006681bde09f2fb84b341fe5edba8eafb3aed85c6cc86506111cf1d271', 131582),
(308, 49, 348, '2025-09-19 12:29:51', '4d5ff2189b8c2c8ef19b8519aaa65fa2f564518ef3cf1856eace610670613bf9', 131582),
(309, 49, 349, '2025-09-19 12:29:51', '58f4633c29e805f0fef55e26560d5778ab2c99d3fdce828ad79bf69184189b7b', 131582),
(310, 49, 350, '2025-09-19 12:29:51', '8cae460190c3dda5659d42f617c6e050dcf94c2567361752066ea4e75b354262', 131582),
(311, 49, 351, '2025-09-19 12:29:51', 'b6d9aa4def120ae0441e33486b495bfa5c2cebe96cb0ef711d7929886107052f', 131582),
(312, 49, 352, '2025-09-19 12:29:51', 'd7ac137be6428e9c58fd0857393277456058eeb34da081d9907f157dabee8561', 131582),
(313, 49, 353, '2025-09-19 12:29:51', 'be2010e3adb0a993287706c134868111bbb0c803dbe4333dd35618d8376450c6', 131582),
(314, 49, 354, '2025-09-19 12:29:51', 'aaa5bc2934b6a931c211098de52209d4c88d6d325491ef4a1d18b1c767f8b84e', 131582),
(315, 49, 355, '2025-09-19 12:29:51', 'a8703d2046bfc709b56f8ce9ff0e392006a9324d9ae72a87628d4f4df13cee71', 131582),
(316, 49, 356, '2025-09-19 12:29:51', '52be88c905f1b2a37356b15186d404c57366aea5cc6e615bf7bdd0828da0365f', 131582),
(317, 49, 357, '2025-09-19 12:29:51', 'e9e5641933bb442449afdbfa0ea6d017e466bbbec2ff2257e734f92dd187332b', 131582),
(318, 49, 358, '2025-09-19 12:29:51', '3bdfffe2e642f9210672adddbddbf0c6940e2bf7fe08118daf24b76b76e0c8f9', 131582),
(319, 49, 359, '2025-09-19 12:29:51', 'e278ffc4cfd301be54384a9a6fde2434364770301b1f7549b5f842367cce2ff1', 131582),
(320, 49, 360, '2025-09-19 12:29:51', '719537d169b07b4b9682b49aaa4f4c567ef1e602ec5bb691e0045b372e68c33a', 131582),
(321, 49, 361, '2025-09-19 12:29:51', 'b074140099c83c2dc314ef21f6dd657e25b2c5e3aaa04a8c66ad600f1147f0a3', 131582),
(322, 49, 362, '2025-09-19 12:29:51', '6c435ec15a96572d4061100f61d2a591fcc1d498d8415e691e66a55f6f56a021', 131582),
(323, 49, 363, '2025-09-19 12:29:51', '9571fdcf23f2f7a264f3f8c0595aa9d073e19e23a4a6f543f38215702a54857b', 131582),
(324, 49, 364, '2025-09-19 12:29:51', '8117a5acc7826ca87392761cfbdc13d2b555a62165d7a850badbeda1f20fd5e0', 131582),
(325, 49, 365, '2025-09-19 12:29:51', 'd49fdb0fcab4ab7f448ff44ff829271b77305c21dd17b3a2f2e7e99b7884787f', 131582),
(326, 49, 366, '2025-09-19 12:29:51', '9eefa7cad8dfc792ac50d78a56264206e7054fb860b1b9a578ebec40331a9847', 131582),
(327, 49, 367, '2025-09-19 12:29:51', '3466b298541443bdf9cd579e9d1eac8963d6af231b3683e2a599b1d21cbd5d7b', 131582),
(328, 49, 368, '2025-09-19 12:29:52', '3e52cef6f86782a4a150c723be0fece0693b7834f3837dd0519f42adedda4933', 131582),
(329, 49, 369, '2025-09-19 12:29:52', 'fd43b6d5b15579b496c3e86792b428fe139e6e0f7bec0f9e3e32a7be0c89740a', 131582),
(330, 49, 370, '2025-09-19 12:29:52', 'fa3e4636853a9880a0cd79165ab38a06014f98fbd918b094d3a1b5e07382ca00', 131582),
(331, 49, 371, '2025-09-19 12:29:52', '6a6b4bbb50ea5de6682159fe3673042bd9a29d2f22500944af51d139c4fb1a62', 131582),
(332, 49, 372, '2025-09-19 12:29:52', '1c05ea114973eddc7f2f07c15b25cf8141208ea2a43f5512b5a0dffbcac5b88a', 131582),
(333, 49, 373, '2025-09-19 12:29:52', 'f10f2fc0985f44fbe6d9d1a3fe8e5ce8b51efad8066d8828d3a79b1b5d9cc243', 131582),
(334, 49, 374, '2025-09-19 12:29:52', 'd92e791a25a4d1647a3d476b4ca748e39a15c2c47d2bd4c675f03de2a048a047', 131582),
(335, 49, 375, '2025-09-19 12:29:52', 'bc30126724eb7665e855b91b6c0a874b02447c4cd20d8a9cd830b517e0d5afbb', 131582),
(336, 49, 376, '2025-09-19 12:29:52', '3fac2e77f0b9bc8a283a87868c446ec5f6bf8b90af41c236f99b695f52c36261', 131582),
(337, 49, 377, '2025-09-19 12:29:52', 'bfd65ad98156320a16148747b43bf2bc6665ab5bb80744d915c003e61b9c1026', 131582),
(338, 49, 378, '2025-09-19 12:29:52', 'fb3863544fb82e89e1a82b3240d5d05eab2905594b7016a86f79c7c41df5cc5e', 131582),
(339, 49, 379, '2025-09-19 12:29:52', '3fb124ab33059b7d454451aa44c655e8e6ac1a8b59fb876fc8d44748e74d9dbb', 131582),
(340, 49, 380, '2025-09-19 12:29:52', '5b86bcc26be6a763c9a3f76ce7ea5ff3034dc671a7cebfbc2e2dcd932692c243', 131582),
(341, 49, 381, '2025-09-19 12:29:52', '71ec345fb8c35141644659dccb9f1f57edbea8a704fc5c073793352659e24de6', 131582),
(342, 49, 382, '2025-09-19 12:29:52', '1c65be37a5684469e8700a25954419b08723b186f9a21fb428c61a5c00e6c213', 131582),
(343, 49, 383, '2025-09-19 12:29:52', 'fe417330ef1d001cd6d7f2ab5e0033d6eb970a7516416da7cb1053d9386481d0', 131582),
(344, 49, 384, '2025-09-19 12:29:52', '10b64141e5a795b8d52faa359f0bb39e5d7be02165f58e5d42a9f8a7b7e6f330', 131582),
(345, 49, 385, '2025-09-19 12:29:52', '5b986eaba64a54e239328a30b1027d1977882eb125a9501ac5b950c2a800fafe', 131582),
(346, 49, 386, '2025-09-19 12:29:52', '742f78c490ae59c33d66f49d585c28a56941e44d3fbc3d9911da79914aebd188', 131582),
(347, 49, 387, '2025-09-19 12:29:52', '5ce94f2acac4b69c30dd7eacd8cbcdfd82405b0f46d2f410f3c4db78b5541503', 131582),
(348, 49, 388, '2025-09-19 12:29:52', 'c6bf54fb72c6736fe221a051db9601373485134e2ebf091efee47eb4b7140bdb', 131582),
(349, 49, 389, '2025-09-19 12:29:52', '8a208b6185895bf21a3fba007f81433b7e2265fafbd2221d974153ae43290ff1', 131582),
(350, 49, 390, '2025-09-19 12:29:52', '22aecd41f26b59911f28f636fd36dcc1632636579b33438c11aa0c766840ddd2', 131582),
(351, 49, 391, '2025-09-19 12:29:52', '1ef28f227e9dcac7c26738182161dde906db1afb3c2719aa6c93cbb34c391dbb', 131582),
(352, 50, 392, '2025-09-19 12:31:26', '96f3b4d93a9121c7e604ab755a854d4dfdc03b77404548db261880e242494886', 18968),
(353, 50, 393, '2025-09-19 12:31:26', '01055ae3cf2dd7c9905a393d7fcdacd8cf83be37ef7550e20d0fd4e1894d4cef', 18968),
(354, 50, 394, '2025-09-19 12:31:26', 'ba8458db9e1f4c02885460d4bf0e954fbce5acb0d457b42a51de83db9596d0bd', 18968),
(355, 50, 395, '2025-09-19 12:31:26', 'c320759913a1e8e7649f352ae1c30bbae0a9f57ee61bf09a7bc927df7eed602a', 18968),
(356, 50, 396, '2025-09-19 12:31:26', '228538cec05d54a16f8d8cb40a0a430e215468769828bc5deb40fed1113865ab', 18968),
(357, 50, 397, '2025-09-19 12:31:26', '4b232c9a34d1aba9dd37ddd4a3970992af82159267ec51e38647422f94fd4c7c', 18968),
(358, 50, 398, '2025-09-19 12:31:26', '56bbefd3ea5484bc85649efbd107b9f7cd683991068a0fb13830fa8fb3f29e1a', 18968),
(359, 50, 399, '2025-09-19 12:31:26', '5dc18ad3cd2f2c4758185bf83737f0fb23f728c747cd1648e8903314e1caa15a', 18968),
(360, 50, 400, '2025-09-19 12:31:26', 'e20f43ee90b7a0c6222fadb8255688f18a414b84cbae57e47516b10f6690e69c', 18968),
(361, 50, 401, '2025-09-19 12:31:26', 'fe40d49e8875c86d595357036590d89862442636dcda93433bbd7a3f7722f5c3', 18968),
(362, 50, 402, '2025-09-19 12:31:26', '44d4dde7b41a07919b9fb14f6ade0430393740f3eedeef085aa3279ecb4d96d2', 18968),
(363, 50, 403, '2025-09-19 12:31:26', '33a14c1d8d86eac11d8b00aaa27f1f48994e51db91c8f96b0a15445fc0789447', 18968),
(364, 50, 404, '2025-09-19 12:31:26', '0f8e773ee3a7b2905cf8daf49e54fab13ecafad6632636eb407921cf424e03f3', 18968),
(365, 51, 405, '2025-09-19 13:40:20', '398d25e94edf33d1bd59278f0c4844fc8ff5d4a5328273baae5fb67e27372664', 6956),
(366, 51, 406, '2025-09-19 13:40:20', '18737f3e5637525c3a0633cb5f6679f8a99ddd2f79e24812a840a1300238de09', 6956),
(367, 51, 407, '2025-09-19 13:40:20', 'f4c16a32307aa5d8b5bc56e32c6e4990c807cf3f2b277d6ae04fc14f7b80be55', 6956),
(368, 51, 408, '2025-09-19 13:40:20', 'b5b865d9d9830bc337d7cee7e161f1279bcd7972996af47eeff37c7f2fc3d97d', 6956),
(369, 51, 409, '2025-09-19 13:40:20', '51d60c70c0ff16ef6e07469de62f31ab4f6db355cb6fc60458ff0e6ecc010cbe', 6956),
(370, 51, 410, '2025-09-19 13:40:20', '3c8596a516e062f95e7e1caf3052f0e3c2e3bd2f257e152d45328b5733a85e60', 6956),
(371, 51, 411, '2025-09-19 13:40:20', 'a9bd7ea4f10dd51bec74d09d6789b061de2a08e402d82c55e6ac72d406876365', 6956),
(372, 51, 412, '2025-09-19 13:40:20', '29959a4712328d5a096438540d3cc27e44e7b1c9bd88c2f9f1b2bd0764f4eb53', 6956),
(373, 51, 413, '2025-09-19 13:40:20', '96517650858225b6287e7b49275468f03b2a0c0830d435dec276cce311b597fa', 6956),
(374, 51, 414, '2025-09-19 13:40:20', 'fe11cf9c8b2338a15aea137f7bb7a0a9a4a1a92beb94983e3d3503e209e94f05', 6956),
(375, 51, 415, '2025-09-19 13:40:20', '108120cca4e7ab71493c1700da9872366a855837603aaeb2bc9d212841e42dbd', 6956),
(376, 51, 416, '2025-09-19 13:40:20', 'feba13c41504f09f1b634094100cb89f63d15f9169ea394a8f199901246a93ce', 6956),
(377, 51, 417, '2025-09-19 13:40:20', 'ffba119fc7b17e86f263f199ef8a85e558db558929cef665a47072c158d1c965', 6956),
(378, 51, 418, '2025-09-19 13:40:20', '83a9a9964f4bc2a95735c9fa8d2498cb355daff37149ed580e8928e9a385de97', 6956),
(379, 51, 419, '2025-09-19 13:40:20', 'c0531ea14eef35deccdebefc199ffdd29a0d8740f29e0e1a2631414af9aa252d', 6956),
(380, 51, 420, '2025-09-19 13:40:20', '0ca11321285c352b6e9cc2cb4f4ba55cc08eaf6c6200a421b77474e55858c209', 6956),
(381, 51, 421, '2025-09-19 13:40:20', '481bc0c4f61d08e634b183fc7c92750def72204ac894fb7114b645b8330942c5', 6956),
(382, 51, 422, '2025-09-19 13:40:20', '96ab0f64ea6b4319d9a1e606a7a003e5f2ea0052e9fae208e849635dfaed6727', 6956),
(383, 51, 423, '2025-09-19 13:40:20', '6baea1638bc2cef5ed0e287b73c0104e20213fde7ca847c9759ff8d74d59319d', 6956),
(384, 51, 424, '2025-09-19 13:40:20', '5ace9adb1ec9dccdec64af50ef246cbd7461463927c5caf52e6b4a0f3dcd0ba6', 6956),
(385, 51, 425, '2025-09-19 13:40:20', 'fae1654f3360cc8d13bb621f10e5be7b4e40ae67c08afb30140705c3a7e4150a', 6956),
(386, 51, 426, '2025-09-19 13:40:20', '709a4da86a6e90ca6d95bea8c7273f9537222b55d757f8cf93abda8c5324980c', 6956),
(387, 51, 427, '2025-09-19 13:40:20', '846ea74f120584fc58615532d71baa697ac1afd72a4af3da1589884d59bd7942', 6956),
(388, 51, 428, '2025-09-19 13:40:20', 'b883ad2440666bbe16468eff60a8babb55580cde6907629b7b8cb3082ea5d523', 6956),
(389, 51, 429, '2025-09-19 13:40:20', '07162174b2e5f63aac30af27586c101849d9ee7c75e6dec7406e082a157653e0', 6956),
(390, 51, 430, '2025-09-19 13:40:20', '2fd6593718ccf802ee52be83872464051c8c67181bc26afc8b5f2a327530c4f0', 6956),
(391, 51, 431, '2025-09-19 13:40:20', '182c3a7b35a52121f6d845185a577e2259289db37ecf22f8ad94f4293de231cb', 6956),
(392, 51, 432, '2025-09-19 13:40:20', '3fdba39334708e644204f14ab1de42372a6e80c9567e68cb391f714b4946bd2d', 6956),
(393, 51, 433, '2025-09-19 13:40:20', '9fba605f9d9ef239b177c68e49724cbf824e03d96bf500f9a0503b5158d322d9', 6956),
(394, 51, 434, '2025-09-19 13:40:20', 'af71ccabb3453ef62dcefc96ba101d66243dba1cf33e7bdcc11945bf7b750e1d', 6956),
(395, 51, 435, '2025-09-19 13:40:20', '85e01bb2c648e13a375305acde24be2a0695bae85c1600a761a3054b6c39554d', 6956),
(396, 51, 436, '2025-09-19 13:40:20', 'afbc9006b70fd919069712013e9cd524619689e3005ebf93f815f5b6bd189234', 6956),
(397, 51, 437, '2025-09-19 13:40:20', '3d3c4806ae12e001b1eaf717cff5c5e009e74778715756692e17e30e8285ce5a', 6956),
(398, 51, 438, '2025-09-19 13:40:20', '32653e99510c1cd6c8e02571991ad5311522d03f77b37ddcb06c7f6b5a449b2f', 6956),
(399, 51, 439, '2025-09-19 13:40:20', '6b172b29685375cb5154d75f2ce38d1cc70c2f8fe15a999f8bbb8535185b1153', 6956),
(400, 51, 440, '2025-09-19 13:40:20', 'd3dd172f7a8582adbffb30af453060ad7dc892af63a472e5185c69fbd26e99ac', 6956),
(401, 51, 441, '2025-09-19 13:40:20', '2928ec86f3d610bef95d5d52036e2e5347d8aaa8bffd282b02c66d20877108de', 6956),
(402, 51, 442, '2025-09-19 13:40:20', '15555de3190bc76209bbecfa8a49a7efb000990915103eefd6e34498aa991ff0', 6956),
(403, 51, 443, '2025-09-19 13:40:20', '828bb38ab12c05a25cae363b62a94a938f5547bf7d0dda4751c265f0697cc0f2', 6956),
(404, 51, 444, '2025-09-19 13:40:20', '85fd96a3a33abb0c6334b1cef0ceac4dc5a500fd5fdc9e886b7e067b00864ba8', 6956),
(405, 51, 445, '2025-09-19 13:40:20', '6ef5853fe8e0eddac94939e5689ee51dad64ef0da2f0f366e8233c02f70c96af', 6956),
(406, 51, 446, '2025-09-19 13:40:20', '604ed783b5d82f4f20138dd6c142ff81b10b2fdc586360f9d36dd7df6d333540', 6956),
(407, 51, 447, '2025-09-19 13:40:20', '14d22410ae9a0ee0dbacbd1ebec07c954d6ff7ad3fdc422f8e9a462ab43995b1', 6956),
(408, 51, 448, '2025-09-19 13:40:20', 'd89a02c378efd4734cd4b14c69d925d625c1cefd2dc797a78c1659ce8039f413', 6956),
(409, 51, 449, '2025-09-19 13:40:20', '3ed6a981add230ad87c9c016a027908cd1338c83882b8d06e7e77f26c3a88770', 6956),
(410, 51, 450, '2025-09-19 13:40:20', '1abc6cbecec93255160c786c007a5a40bbe13fedac74a05f2aaf96bc75c489b2', 6956),
(411, 51, 451, '2025-09-19 13:40:20', '3e37d633a132e07ffb072866620b362909397a0ae893d1762783bd264df29077', 6956),
(412, 51, 452, '2025-09-19 13:40:20', 'e093bef68272e97dac932db6db9a8ab025248693970c44bd8e50b505922f8637', 6956),
(413, 51, 453, '2025-09-19 13:40:20', 'b1497551fe8f5224e9df63f8638fc2b9f3e61f72ab1d0f15e52218ffcd0a3897', 6956),
(414, 51, 454, '2025-09-19 13:40:20', '75c7dd83d7f5b5b3178787d3c22222362d72677258509553fe45c2df83072c66', 6956),
(415, 51, 455, '2025-09-19 13:40:20', '2bbb2d7735378ae57f12c4a7a842bd29ce7cdd0dc2eb8a4dc5428f191ce89b6c', 6956),
(416, 51, 456, '2025-09-19 13:40:20', '05dd35d914042da3d2157624dc3b8482264df6293e9b1522bafe5faf0e0ade92', 6956),
(417, 51, 457, '2025-09-19 13:40:20', '1c988ecbdd33e502bb86e1a19a9382e4c25ea898be7ece6860e3d10fb35165c8', 6956),
(418, 51, 458, '2025-09-19 13:40:20', '272626c7a4ab04d8007523f0753e5968b4057041cb9870629f0ccf3b720a37e6', 6956),
(419, 51, 459, '2025-09-19 13:40:20', '32be0eb2955c150c754366ba915136077958ee5919ef3719b28a35ec5e8e05e3', 6956),
(420, 51, 460, '2025-09-19 13:40:20', 'ca468b1bc0a30e2ef1c704e0b445e302c9451dd8ac1fb9848718f3a0c4945843', 6956),
(421, 51, 461, '2025-09-19 13:40:20', '670d302288d23e081223d3058be581d50b1263cd495e68b02782e078bc29229f', 6956),
(422, 51, 462, '2025-09-19 13:40:20', '9c97b33ea1cddb046dd7d0bc5dd1d8d0bbcf6e6b601f373a456f4be7249b8585', 6956),
(423, 51, 463, '2025-09-19 13:40:20', 'c213a0c1fb9c7bba02158ae5918eea9fa28799b1c0fb586340e5ec30332b30ce', 6956),
(424, 51, 464, '2025-09-19 13:40:20', '39069dad2f4a3ef75fc0ec0ebc314610c53a52138815205039bc9f67fb4ea013', 6956),
(425, 51, 465, '2025-09-19 13:40:20', 'a4cbdb1e0616b0ae8a5cfe4246619556d4d7c8b2361d217a24cba6ebe12cda5b', 6956),
(426, 51, 466, '2025-09-19 13:40:20', 'c7af7a52f1aff1d4203ab82740325a65ba5f8904699af5c8e76555a98fe27bfc', 6956),
(427, 51, 467, '2025-09-19 13:40:20', '8c1e8294552d58fba18ad901850fd8388718b621f4f1398750dcfdddcd7c7c54', 6956),
(428, 51, 468, '2025-09-19 13:40:20', '6ba88c71b5d477342174d2d8f53c05053edecf7951f05994aa8b2b5ecee3adc6', 6956),
(429, 51, 469, '2025-09-19 13:40:20', 'b66411d87ec04fb2e029f447149f577c44d4ed097c41f371e6e05f1a1f9883f7', 6956),
(430, 51, 470, '2025-09-19 13:40:20', '76e1c59c38317b8c944330f61be50f982d9b0595d032ced6980f2474d3fce401', 6956),
(431, 51, 471, '2025-09-19 13:40:20', 'ca733813257c20f119a92e39da154d8e9ac09581da3114c977a3df7020ad87c3', 6956),
(432, 51, 472, '2025-09-19 13:40:20', 'baac0e9897685f3ddf73d06f54f8c9775db06f4a13e0a8f3bddac77d6e69a2e8', 6956),
(433, 51, 473, '2025-09-19 13:40:20', '0e15dbe7f6ff027b296e8114db40de07c73261ec963e6fc45c146b5e95766a28', 6956),
(434, 51, 474, '2025-09-19 13:40:20', 'fc1e0b68c320b64238c3fa128c4a0151f293ef35ec281c15c2d3e8b5bdcde107', 6956),
(435, 51, 475, '2025-09-19 13:40:20', '80c96b4e0693f7030942f2f65a38fae94a34dd83558a1c7e19584cfd533b9fdd', 6956),
(436, 51, 476, '2025-09-19 13:40:20', '1bc33e58f4caa03d96fc8ec4c7c6ea2ee93e990714a8e1f37d94c9e2a682cfd2', 6956),
(437, 51, 477, '2025-09-19 13:40:20', 'd34f72b53b5cc41d410ea444ecac22b2e28a5b54c175e5846a6776bc52c9c079', 6956),
(438, 51, 478, '2025-09-19 13:40:20', 'ba117e84c104e754489e7192c126ff48c8961559595d9ad761938d8a17b8f249', 6956),
(439, 51, 479, '2025-09-19 13:40:20', '941f3e100a3215873b187493abfaf2844cba2e1944463c495db9373b21a103f0', 6956),
(440, 51, 480, '2025-09-19 13:40:20', 'be80fbdad3f1fedd3fe90c1cbfb12b87bb03d9c6e9558097195521f4e7b58383', 6956),
(441, 51, 481, '2025-09-19 13:40:20', '54c876b08fc51798f68086462acf91ad0575e2f125ae5db154b63d491e5e0ddb', 6956),
(442, 51, 482, '2025-09-19 13:40:20', '710ac6bc716d32dd7f28058bfd27544c5ccc060d208b63165281b44d15d6d9c3', 6956),
(443, 51, 483, '2025-09-19 13:40:20', '827cba92c87d96732c6514e1050290c35fe6c3ab4b669129cea4eef0c70b9216', 6956),
(444, 51, 484, '2025-09-19 13:40:20', '173fc9501845dcba78264218cd798371b6add03fc86c290ad233d793aebab53a', 6956),
(445, 51, 485, '2025-09-19 13:40:20', 'f3ba5a64d56b43bb04d1b626b87e0d359e7d6e6f1e935229eefa6565f12591c6', 6956),
(446, 51, 486, '2025-09-19 13:40:20', '345aa9b2d2c2769c3e3e9b22da90008af404f98b4d0b4ae4c74e0f880a87384b', 6956);
INSERT INTO `blockchain_records` (`RecordID`, `BlockID`, `TransactionID`, `Timestamp`, `Hash`, `Proof`) VALUES
(447, 51, 487, '2025-09-19 13:40:20', 'fa8448112dfc044910cd35a6e07491a61a302a6f1072db6c27d12c354937692f', 6956),
(448, 51, 488, '2025-09-19 13:40:20', 'c00311b09fa1880f8554f974a194ac4b768ce00b43a79c0de00df4aa6351274d', 6956),
(449, 51, 489, '2025-09-19 13:40:20', '5b5bb716a80f4df17b01ffdbe63c17a5a0e737f6014d3bf6ddfa60ff3093cb01', 6956),
(450, 51, 490, '2025-09-19 13:40:20', '11734f604fdd63d80910332dfe66e0eca97cd099b1c41e41b5afc3d2b60d0995', 6956),
(451, 51, 491, '2025-09-19 13:40:20', 'af95d84fe500842e5d361845e59c0d0cbf8baae5ddf089338d463067913e796c', 6956),
(452, 51, 492, '2025-09-19 13:40:20', '7ec9103f3ae95388c08a1974adaf402996e0d4d227ba01fe665918cac2778a5a', 6956),
(453, 51, 493, '2025-09-19 13:40:20', 'abfab9bf17c7cbacb3d32ef15cb9b250d5d3b1e34a1a01c29201e917ce1fa68b', 6956),
(454, 51, 494, '2025-09-19 13:40:20', 'e0832844f2a7e4a87b62bae7e7327646fd739acef15aea65e11fcb557336576b', 6956),
(455, 51, 495, '2025-09-19 13:40:20', 'fad82c81cf4d8ba4d12aadb3ad02d953b2f687900263795d1ad146c7ea0e774f', 6956),
(456, 51, 496, '2025-09-19 13:40:20', '64430aea29d61b577d4874bfc42cdae4560d931a0da457df60dfb72968644f8d', 6956),
(457, 51, 497, '2025-09-19 13:40:20', '277d01101c63f1198710fceeef582d14a131dc220bd08991887d44e7e05cd79c', 6956),
(458, 51, 498, '2025-09-19 13:40:20', 'd47ddb0187a88c512268b7d75701a7cafd88338207ed4602b0b3505130b8395c', 6956),
(459, 51, 499, '2025-09-19 13:40:20', '0e7ceffa67d54f2464cadf7d04fc03e84234026eacd06a4dd3d9ff837c8f0ab2', 6956),
(460, 51, 500, '2025-09-19 13:40:20', 'a860b1b1004fd72d929f70052fb21f0373c30177e05e0defe883dda57aa0b6c5', 6956),
(461, 51, 501, '2025-09-19 13:40:20', 'c928df097c4e350ab902deaf722bdb346489a4355058ddbc2abedb6a33959f02', 6956),
(462, 51, 502, '2025-09-19 13:40:20', 'f9ddfdb6b9e20d5579a2b4f35b9ce82a898318567afae2da6753b74ca80cbc74', 6956),
(463, 51, 503, '2025-09-19 13:40:20', '24f532f0ed88c43bc3c56fc8917adf2c299d13a81027053ac6df62c8c2f21f94', 6956),
(464, 51, 504, '2025-09-19 13:40:20', '68db3024d7648bafc8ff94caeb1b54cbf5edd7bf923c40aa67c88ef3d120ff86', 6956),
(465, 51, 505, '2025-09-19 13:40:20', 'da0ceeb3f450ad16cb0d45c97b6ca1ad62f202f36fbee7790d7ed54faa0edf40', 6956),
(466, 51, 506, '2025-09-19 13:40:20', 'e2f6bf79ba754c995252c9c3721511f6c84bb48f7808a4d043d0e823c9c4b7af', 6956),
(467, 51, 507, '2025-09-19 13:40:20', 'ddca2d348b97732a9e99060a6960186a8dc42b60ef9edd669a0fb5b7ce1a1b29', 6956),
(468, 51, 508, '2025-09-19 13:40:20', 'a82755c999900f75fe5090ccd4fbf209220d04e274f2e8b6ee534c45891da01c', 6956),
(469, 51, 509, '2025-09-19 13:40:20', '833b2f6fc0c1dda56d7faa1106edad510d4de3b07a19ccd6dabef06f77e266ab', 6956),
(470, 51, 510, '2025-09-19 13:40:20', '41d894082dd88cce54d9dbc45d4e496c33fd25f26dd242a7017b1f1fa4789ff8', 6956),
(471, 51, 511, '2025-09-19 13:40:20', '64cb064d01b579dfce13b0b32a0e2f7e80cc85a3e71a92b301bdd893c06d0293', 6956),
(472, 51, 512, '2025-09-19 13:40:20', '042d4cf32d1b0d9b52e25585f0e892b276a6e48ac3533abc8777f6a51eea7b57', 6956),
(473, 51, 513, '2025-09-19 13:40:20', 'eba1c7520c5cb9f4a072b405b0669ef10cef9a54d4fc7838e36ca2faa4737573', 6956),
(474, 51, 514, '2025-09-19 13:40:20', '5dac95b4b361a2397f536330ef8f1025611ace73c14e931c2b3aaf2c37f4e6ad', 6956),
(475, 51, 515, '2025-09-19 13:40:20', '978121155a0806392d827a8e99f8bb0524a9bc4e2a95671fa229762e283cb9f9', 6956),
(476, 51, 516, '2025-09-19 13:40:20', '9c59cd183c62b4ffd97203908e3209122def72c89f27ce64122a782876a0a48b', 6956),
(477, 51, 517, '2025-09-19 13:40:20', '23ac13fdf949f001bf95721514b18aab90d2f746ddcdee0602aded0c07376279', 6956),
(478, 51, 518, '2025-09-19 13:40:20', '2cdbad3aacd853ba49ee3e642649abff122f32a927c5c4ef6d9baaf9438047de', 6956),
(479, 51, 519, '2025-09-19 13:40:20', '895d39461e1ded72780382fbb1f62b58b5024c5b84bd576500dfd232b5d5e655', 6956),
(480, 51, 520, '2025-09-19 13:40:20', '780c4cc042b3b41542227794512d133f33ccdf6e8cdb54297eee7a2ba4a2f3ae', 6956),
(481, 51, 521, '2025-09-19 13:40:20', '823485b6de0ed54a81f75bac162bf5d3e606d1d0dbc59073d47d211a820f08e6', 6956),
(482, 51, 522, '2025-09-19 13:40:20', 'a43bddac9f663485e4288f80ba5c69ecce99d7c1fc28a05e906ac5816a9717e3', 6956),
(483, 51, 523, '2025-09-19 13:40:20', '53417f49678e56d45f4157994062e03b878799a9f866f4022ff4022f1d819e52', 6956),
(484, 51, 524, '2025-09-19 13:40:20', '816e390b2f09d05211157607cff021d1dc0812469dd4968b25b31f0a665160a2', 6956),
(485, 51, 525, '2025-09-19 13:40:20', '4cb7e1e886c9772058ed9196c91e3125b541c89f6226f1c3130934e6eb672f12', 6956),
(486, 51, 526, '2025-09-19 13:40:20', 'b04c79d429d7267b209a6b66fe8718e60339687de722baaae34a621ab5c90248', 6956),
(487, 51, 527, '2025-09-19 13:40:20', '80a119b2ef0388a93444cf1c8f76e2f1babfd7e9a3bb88893921c7d3d040f8c8', 6956),
(488, 51, 528, '2025-09-19 13:40:20', 'ea7d2886e856629a47a83a23d2e3b29366157dc1f620da99c8b4d168ce2c0333', 6956),
(489, 51, 529, '2025-09-19 13:40:20', 'b4995b3e3b7a6978b2ef3bc2c0f70afce4f9f391af0dac3ab2a4cb43fdb7b082', 6956),
(490, 51, 530, '2025-09-19 13:40:20', 'd89b666ffa312ae4c60cffc98d8c305eebcc255dbc1727da86699a8065ea87f1', 6956),
(491, 51, 531, '2025-09-19 13:40:20', '1bf6287a5158d425e053cff9aca0c8a8977885d1bef4506dad0e316f2dfa586a', 6956),
(492, 51, 532, '2025-09-19 13:40:20', '10b24d0eb60f37c1fdb15379dc84b0f4f9cbf7402aa0d352d3d1e682a2b07cfd', 6956),
(493, 51, 533, '2025-09-19 13:40:20', 'd8cdc7b66ba41d0d3a6eafc65f21411f5af731f94102dce03d2c96401a2b118d', 6956),
(494, 51, 534, '2025-09-19 13:40:20', 'e7c7a8519e6b8f946a18554658cb206c3e7b8542bba95ea5dda3633c6073f90d', 6956),
(495, 51, 535, '2025-09-19 13:40:20', '6818f895f56b4581f354fe86954eef68bbfe8d3c7034d8c2dc515ed2f85c0fc4', 6956),
(496, 51, 536, '2025-09-19 13:40:20', '4143a3e8537ecf6dd757c3270890a9f7585650c273eed9c36e0fad3b1c35c60f', 6956),
(497, 51, 537, '2025-09-19 13:40:20', '0fdca1a7e77bac7d692f935577f39bfc18610d7325b4b5a4ca7883715b7970bf', 6956),
(498, 51, 538, '2025-09-19 13:40:20', '45741b2bac8d3e7a36ed9a924a56731be5c3b5195f4ff396181c833ba95c8234', 6956),
(499, 51, 539, '2025-09-19 13:40:20', '772a865d5d84d7c61810c4d77745dcbf53617538225a84551a66ca8af187db18', 6956),
(500, 51, 540, '2025-09-19 13:40:20', '588f2a2e731c43099737b02203522a68160732b6aefe982961f8ef57e36a4eda', 6956),
(501, 51, 541, '2025-09-19 13:40:20', '534bf686e3b42bec8ea26f99a2aae256daf78e5f0bc824f747ed5745f19eb57e', 6956),
(502, 51, 542, '2025-09-19 13:40:20', '9e54d6a17d52e2b2e231dabaafbab54995a4df7380503d943a0d3a76a23758aa', 6956),
(503, 51, 543, '2025-09-19 13:40:20', 'a2a19805da1728e761e49a9ee69921ab146936eed6e0e1aaae09ae826ea7275e', 6956),
(504, 51, 544, '2025-09-19 13:40:20', '93192c53156c231bd25a6d93f584e444be94cbc35ad85dbc82c4d885b43aa342', 6956),
(505, 51, 545, '2025-09-19 13:40:20', '008d75b5a84fe7dc7fe916331cb27c0a7896b314f771038b4cc45ac4e11d5721', 6956),
(506, 51, 546, '2025-09-19 13:40:20', 'd4a028418eb9b1852558f27099f564c5d86b0f5f030c6d7a7185cffb4a6f5fe0', 6956),
(507, 51, 547, '2025-09-19 13:40:20', '7cbc87786b4ba891db56abd355d0bcaa24b1fd056529c8706bdf09181c151b67', 6956),
(508, 51, 548, '2025-09-19 13:40:20', '0a34fcd1237d5ff12c8b216a04e2825ae837beef3418845eb40b5b8c9af7eb43', 6956),
(509, 51, 549, '2025-09-19 13:40:20', 'f00f327c6a44fab83e383299069402c03661d269ab958334e2362f8ab33a4541', 6956),
(510, 51, 550, '2025-09-19 13:40:20', '594bd8d3d7ad9bca9eb90c5eb71333886c5a2da841c5f0e118d5109cd836d5ea', 6956),
(511, 51, 551, '2025-09-19 13:40:20', '2fcb32cbb4de9c451ad8dacf3590cb5bbaf5adf0d14e9f066f939b7b2649ff56', 6956),
(512, 51, 552, '2025-09-19 13:40:20', '974f73d8868d75edd1ab6268d7dd4e50f4ca1c126b429940234452f6bcfa3e20', 6956),
(513, 51, 553, '2025-09-19 13:40:20', '959f0c2fbaf6280f245f6ee6cc7b3b92c20ad7562b87ec78c1d748eea90f3781', 6956),
(514, 51, 554, '2025-09-19 13:40:20', '67d10aa605e2ce72fe00d17b5e89db735648daafed870b88b9bdf6c01818b3b2', 6956),
(515, 51, 555, '2025-09-19 13:40:20', 'c69679424b5ddfc0db9505f18f6ae81ac7cf47c6504e134f27174fe170a3316a', 6956),
(516, 51, 556, '2025-09-19 13:40:20', '309f0edbb0a09a03cb6e616a85f5d30f4744523e5f108aa860994769c8967256', 6956),
(517, 51, 557, '2025-09-19 13:40:20', '23009369ccf47e0c63982bc7ab7087aa1a0f69066790238e5a9e73d8e5e5a74d', 6956),
(518, 51, 558, '2025-09-19 13:40:20', '561be306aa02fca2b1017594fe2bbf9b8837d175afbfcb78677f02403125f825', 6956),
(519, 51, 559, '2025-09-19 13:40:20', '66e0ce7123cc63282e99c4bf740f84d0d3420916c57bf90e7ec143a1eec425d2', 6956),
(520, 51, 560, '2025-09-19 13:40:20', '80ce2efcabb42601c3a1b7c3833315f4e7b45f45f342ab8ed65fc7c1dca4024f', 6956),
(521, 51, 561, '2025-09-19 13:40:20', '1e46e69e9d8ba3ca2685f781c6fecad9f28620c4635cdbdf82fadc9791a0f81a', 6956),
(522, 51, 562, '2025-09-19 13:40:20', 'b19a73d5c104ef3a3365c4648d718034b97222774d9ca71baa19bb6ae45700ef', 6956),
(523, 51, 563, '2025-09-19 13:40:20', 'f5e8abba77936d4f626282273d3d15f95276b664fb57ab7486dd60cdcd0e7e8b', 6956),
(524, 51, 564, '2025-09-19 13:40:20', '80d18d48c991f16649e57f0d22f02a184356a04fcc5ae4311f91952410842e0f', 6956),
(525, 51, 565, '2025-09-19 13:40:20', 'fc1a90d136aee98c3d2597d9bffdc1a6a0b093319d3a96825a1f906a43bd626c', 6956),
(526, 52, 566, '2025-09-19 13:48:02', 'e77a13edf5a9b89080e4e1cceb144ab3fe00968a2f30fdbb3f455b9c0561eaca', 111472),
(527, 52, 567, '2025-09-19 13:48:02', '9f215ef4644a4f6246ded74a3922af24122bb907abbd3c47d09ba828cb8fe69e', 111472),
(528, 52, 568, '2025-09-19 13:48:02', '11e2445f0581801f7a6d7138b9ebcd132291f58d50f882ea74fd30ba1e2efa42', 111472),
(529, 52, 569, '2025-09-19 13:48:02', '5825e6b63dcc573c5d684f1beabf6500b29ed4faf42e43fb13ad33e14270797e', 111472),
(530, 52, 570, '2025-09-19 13:48:02', '3bfc735769ad2250b2fed34d7c4c485006ad159f2bff7053aab801067a202337', 111472),
(531, 53, 571, '2025-09-19 14:09:13', 'a06cce9322b886293748731ce46ae8a3b845c294c1ab51e5bbf11d9728216ce7', 28891),
(532, 54, 572, '2025-09-19 14:32:44', '0fdd133a8f3daa7536f572de12f4532ed0e2e04f6958040b7a1d6915c1155058', 147743),
(533, 54, 573, '2025-09-19 14:32:44', '374b4a88a1349d1dda5515ff73030291c7626f56789ec1720456247a7ad0146f', 147743),
(534, 54, 574, '2025-09-19 14:32:44', '9baa66fef79c0d6a0278bc97675d45ccfbf69a94d59566341ba4cc65c100979a', 147743),
(535, 54, 575, '2025-09-19 14:32:44', 'db85e60d3035ba0af8182fcd664bccfc0adb10ddc42a6c5f893b5f74ed28ee65', 147743),
(536, 54, 576, '2025-09-19 14:32:44', '6c4f77cefea72e9f897dfa164552acff1f535cb29efe1a0c323adda89d3c35dd', 147743),
(537, 54, 577, '2025-09-19 14:32:44', '76569d2fc0f72763daf9775bcc6ac5c6318d18c03d545e578240740ba4b7bb00', 147743),
(538, 54, 578, '2025-09-19 14:32:44', 'b04d54b84f8a9860c33515e61312da41be2d546dac8544c9dc5032bc1bfa113f', 147743),
(539, 54, 579, '2025-09-19 14:32:44', '751a704aeafd1f9d9f33d75a29e0feb7920b0604a31221e438455002c0337206', 147743),
(540, 54, 580, '2025-09-19 14:32:44', '54073b6cb205b05b4ce9f77bcb7c10494317f92d876e0bebfffb0f2aa83f61ce', 147743),
(541, 54, 581, '2025-09-19 14:32:44', '97a046608a19c31aa6a95f3c50f78b1ecaf44c1ba70d7e0c6946dbaddfe6fe6c', 147743),
(542, 54, 582, '2025-09-19 14:32:44', '1f228c51c52034224c4c768add3d7f25f93cdd04e841779d56bec5e37ab2a2d3', 147743),
(543, 54, 583, '2025-09-19 14:32:44', '36c085191f94daf986c938b2b34b239860b1463cd1242fb38a424c624ee35373', 147743),
(544, 54, 584, '2025-09-19 14:32:44', '1abd2a866529b9adb7e5e9a6ca93507c52dc0c6684fed6e22159c902f674ee07', 147743),
(545, 54, 585, '2025-09-19 14:32:44', 'de2a047e52ae46069c18c6aba3810a690ac0649e057b70959bee7f7ce3cd59fb', 147743),
(546, 54, 586, '2025-09-19 14:32:44', '9856d3380fcfb20255ece400cacc2341690e7f50dd4e498b38febe90fbac400f', 147743),
(547, 54, 587, '2025-09-19 14:32:44', '8c0187e4871316ce4b95ff54850195b874030785540d0d9daa90270f4a633a34', 147743),
(548, 54, 588, '2025-09-19 14:32:44', '41d137c197bf23d51693198f446a3a87e9f6af36d977f34cbc6b586fdf2d99a5', 147743),
(549, 54, 589, '2025-09-19 14:32:44', 'bdb682f51fc6875cadb57c4920d01a00a51756c7a1e71ff6610b508f87a1d0e9', 147743),
(550, 54, 590, '2025-09-19 14:32:44', 'd2d8e91f13def7505f6f7ffc2a19368f6a9d5544e69f58e2f1eb06b6c26c6423', 147743),
(551, 54, 591, '2025-09-19 14:32:44', '2d23b7a4423e303035fbc18dc4a06fecd2154419be048366b25e04f89cb92f9e', 147743),
(552, 54, 592, '2025-09-19 14:32:44', '18ac9c8e7025d9954f4398cfdac6ec111dc951b3edf8bd9dcac9d90cf999e343', 147743),
(553, 54, 593, '2025-09-19 14:32:44', '0577b49a73485fcee37265cde62ab6799bd414266dc13251f667c9017cceed57', 147743),
(554, 54, 594, '2025-09-19 14:32:44', '041c6732422c9eaa2822a4ef6d9e1b24c9c611a64d4c44764846b0ee3c3f1717', 147743),
(555, 54, 595, '2025-09-19 14:32:44', 'bca586580533dac083757cf904e8639713685306ddea965314ed0bcf9a1d1acc', 147743),
(556, 54, 596, '2025-09-19 14:32:44', 'c6b2c0fe85f7bbf67d9adffb1a8d2a8c813c9ec4348d634cb7a876c37bf20ee2', 147743),
(557, 54, 597, '2025-09-19 14:32:44', '90b06b88ee070eeb506b76b2db2310400fc0e34ae511f05abd66a2c65839c124', 147743),
(558, 54, 598, '2025-09-19 14:32:44', '5a77261472a4a40b63e532afeeb365be9d3c684ca5bbc75c2c3a7a914e14cbe3', 147743),
(559, 54, 599, '2025-09-19 14:32:44', 'a1372b2e0426c02f0f45e5eb495ad345cfa2b22d56cb279d6abf321df4272dcc', 147743),
(560, 54, 600, '2025-09-19 14:32:44', '998b9ac5365855e341e49f93786fcd32ccb943a0e952d86f1b23f3969d2921ec', 147743),
(561, 55, 601, '2025-09-19 14:52:03', '027ab316e1451f1d01dc795fd17d7daf779d057982b1b968d364f412ecc5a918', 42441),
(562, 55, 602, '2025-09-19 14:52:03', '8506b5d61d3ba5ce75edc353611623b0134508f68a62c3dcd04d70b74f07c3cb', 42441),
(563, 55, 603, '2025-09-19 14:52:03', '5403d594a4018b5a54a7ca5b8394c836f16af55a4a2181064a32511a07f1fec4', 42441),
(564, 55, 604, '2025-09-19 14:52:03', 'f63bc5715f15d1ff4fbcb205f12dd3beba5560d757c41a434a390ac3236dc3cd', 42441),
(565, 55, 605, '2025-09-19 14:52:03', '84e4cefe8fb72cf99a97892d93b2b95789bb43660ccf0c1a11636bcd10695e57', 42441),
(566, 55, 606, '2025-09-19 14:52:03', '57dab917eaa5c97b27e2431ee067df2f66b24c9bd5eb6a6a9d5c05e2f5972262', 42441),
(567, 55, 607, '2025-09-19 14:52:03', '09a6d92552bb785654ee246638deb545124d2ef95a3f9ec5979508414fc432dd', 42441),
(568, 55, 608, '2025-09-19 14:52:03', '7626a0456e23f4bb00f81bf098a51eec2b8ece9e7cad21dc2a88dd9c665a709e', 42441),
(569, 55, 609, '2025-09-19 14:52:03', '84c12e72902be0687b75b78396e6cae29381b147d11d290d839a251d573aae7e', 42441),
(570, 55, 610, '2025-09-19 14:52:03', 'd0b45f50bf86412fb8e34589ccd091947abb5a91c491301cd14324abbb0e17a5', 42441),
(571, 55, 611, '2025-09-19 14:52:03', '396d026db4448a6c66d15bd4d752141ade90a640fe2c4c674fb0b4f467b78e17', 42441),
(572, 55, 612, '2025-09-19 14:52:03', 'c7db6bc2dff932d8cff9c6ad4b4c1c4c4c5cf5bec173216bab0773f960cb7379', 42441),
(573, 55, 613, '2025-09-19 14:52:03', '23bb52b473c5f81250200a0f5c17653e9f2a686fbdad87cfa53d71fcbaaa0986', 42441),
(574, 55, 614, '2025-09-19 14:52:03', '42bcc7d43c7e57dc136f8b95983721d379cfdc1ec4d30ce88741bd2a2cd43e50', 42441),
(575, 55, 615, '2025-09-19 14:52:03', '30a395885edaa76b361b678b575502f6b8517e33fd416f12b9d305b27ace935d', 42441),
(576, 55, 616, '2025-09-19 14:52:03', 'ff58921dc74c1565cc466b0e853cf841218496d4b154922440f1f2a7c370c265', 42441),
(577, 55, 617, '2025-09-19 14:52:03', 'f3fdabe87a325d105e7770a492499e5d5cf384d917e0fed831f214ccd14f8ace', 42441),
(578, 55, 618, '2025-09-19 14:52:03', '0edd8ae3791ccf041aebe8c647ca597af2eee4d7d0cd296579b0df2f99bf3543', 42441),
(579, 55, 619, '2025-09-19 14:52:03', '2511e52b0852aa91855b373dfb97dc9fa35425d17e095ecc67239211fb98b7a1', 42441),
(580, 55, 620, '2025-09-19 14:52:03', '75127d4f6a482c09a4ec437728a1d0d1c4df41b950f66670f6d1f8d71ae473da', 42441),
(581, 55, 621, '2025-09-19 14:52:03', '6a59ae301d91ea505b9424d54607fcdb96e10e92088e33e77a7c3b1d66f13fde', 42441),
(582, 55, 622, '2025-09-19 14:52:03', 'dfe587d76c66289db65f8331d840cabc87ed45999318772ae26f31168929d82c', 42441),
(583, 55, 623, '2025-09-19 14:52:03', '4d78451480475883fccfa445169f4cbadb9f9a6e33f700e6f340c3d23cd67505', 42441),
(584, 55, 624, '2025-09-19 14:52:03', 'a1c16751dc55b38cef8da322cb240300347390a0c93a07d4ab660ea008d5ec44', 42441),
(585, 55, 625, '2025-09-19 14:52:03', 'df006bd3a6f3987a56ca6dd60c65a8e507990c95bd220e4b1c4fd64566d985dd', 42441),
(586, 55, 626, '2025-09-19 14:52:03', '37f18ab6dd13adbadec75a8c6484f0d3ed01dc8bff0411ced00ba3ffe056671c', 42441),
(587, 55, 627, '2025-09-19 14:52:03', 'b9e8aec37eacecd7a70433109421564d1e13d88897d2cbff15208d6a9969f372', 42441),
(588, 55, 628, '2025-09-19 14:52:03', 'ec38ae78ac33d67e1afa480ecd9d3403809c67da9a5192d95a8208d1a5c7fd7a', 42441),
(589, 55, 629, '2025-09-19 14:52:03', 'e1363b47f697789a55227f72adcc75cdaf0b373e24ff51c8543444599d79fd02', 42441),
(590, 55, 630, '2025-09-19 14:52:03', '76a1c0a9e3c59f9c743980d33590d54192b5fc3f7a706f356b0d978671347234', 42441),
(591, 55, 631, '2025-09-19 14:52:03', 'a6b1fb8df0b5f69c0f3d6e42f89302e63c127ef13dcabf8ff4e66ab4eb5c3640', 42441),
(592, 56, 632, '2025-09-19 15:11:32', '80967d5d5ce8141d27606d7c4a25f90ba78ee22e8e845ea8053a7b59955cc333', 103475),
(593, 56, 633, '2025-09-19 15:11:32', '81185cf78ed2a4bf0349fa5b98b4e6402c5e6cef20378279af803245148ce3b7', 103475),
(594, 57, 634, '2025-09-19 15:11:36', '7a02b9e63ab92f92cf753988e5d4932a7c6ebc1b0045498184bf72e689b6c7d5', 50845),
(595, 58, 635, '2025-09-19 15:17:32', 'ace5e3e3f3843c3c48e2fa1d8afef396cef074110329cebfc4ed7e6ec11419ed', 20953),
(596, 58, 636, '2025-09-19 15:17:32', '184326832b28ba2a98a5a073c1e587f0a879496c06ac765853f050c6eff0d47e', 20953),
(597, 58, 637, '2025-09-19 15:17:32', '5e51210ab24e5f8f369f105a4d39d6311c08a9dd0311cd70a5f0b4487c227514', 20953),
(598, 58, 638, '2025-09-19 15:17:32', 'cab586d802c1f10f4699fdb8a84f162f03e83269d6b50f160b24f4129f531dee', 20953),
(599, 59, 639, '2025-09-19 15:34:03', 'bb0a54dca8337b7c311c331bdf4289d6d0a97d79a86dccf7685b865c9aa3a2c7', 32794),
(600, 59, 640, '2025-09-19 15:34:03', '0a0127ce668a4e12ad374932e7531ff7ff433a81fa2a841a01741d6ab03709af', 32794),
(601, 59, 641, '2025-09-19 15:34:03', '74507850007c22aed0664a102ba17b691d0d68ba960d76e4e19f5cbb26bd0651', 32794),
(602, 59, 642, '2025-09-19 15:34:03', '1bb7ead821fe48ccea8798208546f14031f3b5742895edc2726cf1ec41f5f8d7', 32794),
(603, 59, 643, '2025-09-19 15:34:03', '741cc9f9a486e6b0d37a881b94c00150c95510a0e84bc1fa29c9697bb409f5fc', 32794),
(604, 60, 644, '2025-09-19 15:37:42', '6b5ab32b5122e661b17ce060bac8f4cd17e4b53ea1e4e9e4eb8dfc3613796137', 39735),
(605, 61, 645, '2025-09-19 15:48:01', 'f5c7c9a566b981faaa7f7f91f9fd897bedb1b39254c9791ad33562dcd029b299', 2896),
(606, 61, 646, '2025-09-19 15:48:01', '8d11ea37cc291a31d0f419109cd05610b6449b52fe46788b9ce3b08cf1f06e36', 2896),
(607, 62, 647, '2025-09-19 15:49:11', 'ef0ff70fddd33e699e184c315c490db97e22cbee9963ad614edec460e4b88adb', 21567),
(608, 63, 648, '2025-09-19 15:54:48', '6b2586a6bd5713f5f6e88c8f243067d1c771a527f6da77ff7ec1e135c7fd676e', 96685),
(609, 63, 649, '2025-09-19 15:54:48', 'ec47838076d1003bd828491b0c64c6294375001289b4f6f788bd261bc942d74c', 96685),
(610, 64, 650, '2025-09-19 16:01:13', '1ddfec1d73a342017b5a045bd1d2d5a62f5345f986ef191a1ac68246065a14bd', 3683),
(611, 64, 651, '2025-09-19 16:01:13', '7be63d78da1a94d8fe9f70ad29d5637c9a00a31faa8cb21ce19c10b2aa4758b3', 3683),
(612, 64, 652, '2025-09-19 16:01:13', 'c428f75be5f2f8072018f8617d54ccf2b479e54bd089f258079ffa18092f7284', 3683),
(613, 64, 653, '2025-09-19 16:01:13', '6f6b1e604d5c56e3acd30e6405b3283271495241bba2a26028b6070d59df7b94', 3683),
(614, 65, 654, '2025-09-19 16:14:43', '3bfa487c329e6ce6b17e90a9455a456af2df558e4da8024f81a7c4cfc96874d0', 5193),
(615, 65, 655, '2025-09-19 16:14:43', '14c5592d6c35e2b926f6bfd61d421f8e7c596ef4ea63531fbb74701a0ac925b8', 5193),
(616, 65, 656, '2025-09-19 16:14:43', 'f6c871c38614d3875494e2b4c6685e75d4018bb37b9e840c2469347eaecb37bf', 5193),
(617, 65, 657, '2025-09-19 16:14:43', '08e9954e1d26b1b4e96b6945cdb535c4589da2874ddc61815fe483230af9f7f1', 5193),
(618, 65, 658, '2025-09-19 16:14:43', '2a3ce5eb7d647bc0f258c594128fd5541d34e44484064d12d5a454afae4a3804', 5193),
(619, 65, 659, '2025-09-19 16:14:43', 'eb812c7555e4f89dbe9afe7b34281c7f7eccf44df4edbf9de74d5dd3074243c2', 5193),
(620, 65, 660, '2025-09-19 16:14:43', '898df186c4ca22c51a5b0d27b8176751ab1e9e1381a88f04b94df4854df06f90', 5193),
(621, 66, 661, '2025-09-19 16:23:11', '6c00db2eb76ed1d580f44f3f19cbeb7126ba427c8cca01aec63c2a8aa4c99f88', 19251),
(622, 67, 662, '2025-09-19 16:42:58', '641a12320f4d2e894ae6bf456f2fb845b93dc02cdd5fe833beeb43c979ca273c', 15534),
(623, 68, 663, '2025-09-19 16:50:25', '4736d73a10494d1325e4fdac0fad461bab3f4011bbf4cef9599754b17a1ac5d4', 94463),
(624, 69, 664, '2025-09-19 18:48:06', '16e56b15c6997da6f0905ec4fae415cef7340e464e9c8211eb94e6d2526291bf', 233725),
(625, 69, 665, '2025-09-19 18:48:06', 'dddc3bcf79b6862c3a41d9b01aeba9f486534255f91f78bd80419180664b5c09', 233725),
(626, 69, 666, '2025-09-19 18:48:06', 'ec63ba3feef5b8509d5fd04207f96f8ea9a08d2d96b14ec05437ca7d14b4e38b', 233725),
(627, 69, 667, '2025-09-19 18:48:06', '37ed25a9c1a7ae3d20e97afca78a3e7bf230f02a95550f275230cf41a5ca1d4b', 233725),
(628, 69, 668, '2025-09-19 18:48:06', '91519b811b762f9b336dd71ec7097b3b4f78f2d88bbab638389c49928f0dab83', 233725);

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `BlockID` int(11) NOT NULL,
  `BlockIndex` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Hash` varchar(255) NOT NULL,
  `PreviousHash` varchar(255) NOT NULL,
  `Proof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`BlockID`, `BlockIndex`, `Timestamp`, `Hash`, `PreviousHash`, `Proof`) VALUES
(28, 2, '2025-08-26 22:20:48', '5622eb5884100d8c32ac2521d6acc47ceda66fae33f88ae862aca391541440df', '083eac203e59382d283080c77fdca7852c1be66e714b1b763b8a5e2f7188ebe8', 2857),
(29, 3, '2025-08-26 22:21:36', '9bef2e5c8f36c30e2ef2b1bbdb8b332c1c5b6da7b34d68833d74597a358c2da2', 'fde86e56857a691a7fac27067f8ccebbda4e48fc18d1795bd3519edfafff8269', 27927),
(30, 3, '2025-08-26 23:10:52', '9dbd0807a4cd205124a39069a7aeb669c5ce68d6ae984eb7060fd456534ee22d', '9bef2e5c8f36c30e2ef2b1bbdb8b332c1c5b6da7b34d68833d74597a358c2da2', 183791),
(31, 4, '2025-08-26 23:28:16', '662b1fd80813a19bac33a92fb47e51594a64fd15140224f92a8a1ccdda305770', '9dbd0807a4cd205124a39069a7aeb669c5ce68d6ae984eb7060fd456534ee22d', 47343),
(32, 5, '2025-08-27 17:11:51', '45ccbae153853b9542b88beb27592f29378303f9f6c619b8ca711fe28cc53ea6', '662b1fd80813a19bac33a92fb47e51594a64fd15140224f92a8a1ccdda305770', 2756),
(33, 6, '2025-08-27 17:29:15', 'bf11856f6261404e0712415ff41d779baac5ebf739cc16ce9547158ab93235f3', '45ccbae153853b9542b88beb27592f29378303f9f6c619b8ca711fe28cc53ea6', 217842),
(34, 7, '2025-09-10 02:18:21', '87b14ea603f2bf081dde6cb913000c17a4cedcb2511a654c5ea734319a16abf3', 'bf11856f6261404e0712415ff41d779baac5ebf739cc16ce9547158ab93235f3', 40185),
(35, 8, '2025-09-10 14:08:42', '4b6e9617e0452705900c1965643f668954c9f49be5ce1859edd8f0c58e343913', '87b14ea603f2bf081dde6cb913000c17a4cedcb2511a654c5ea734319a16abf3', 38483),
(36, 9, '2025-09-10 17:22:31', '4f59018c301ccd4f6e9a6628548b1fa9554e998751085ec9d43949963618956e', '4b6e9617e0452705900c1965643f668954c9f49be5ce1859edd8f0c58e343913', 76793),
(37, 10, '2025-09-15 14:36:55', '1e9bb10e3cabff17c2a4c75d5b1e54b22194940288b3cc4cd7c8c6660e8ef725', '4f59018c301ccd4f6e9a6628548b1fa9554e998751085ec9d43949963618956e', 65454),
(38, 11, '2025-09-17 14:22:52', 'd22769ea4dff620589bd9f2bd1d195a59f9c2da7d1d6536a33fd93b952ef82df', '1e9bb10e3cabff17c2a4c75d5b1e54b22194940288b3cc4cd7c8c6660e8ef725', 48475),
(39, 12, '2025-09-17 14:23:13', 'fe14cd0212e3bd31537a1871f62daa9a609d2d43188e5a1e1c93b7af4ca389b1', 'd22769ea4dff620589bd9f2bd1d195a59f9c2da7d1d6536a33fd93b952ef82df', 11130),
(40, 13, '2025-09-17 14:23:32', 'd9ef533f980b7e581bba204b1299c878b807616b6c90b2dc03e819535aee5814', 'fe14cd0212e3bd31537a1871f62daa9a609d2d43188e5a1e1c93b7af4ca389b1', 75366),
(41, 14, '2025-09-17 14:24:12', '09141658a82e92ad0b27e50101817afbbd9d510e542ad250cdd3609bb4659ee7', 'd9ef533f980b7e581bba204b1299c878b807616b6c90b2dc03e819535aee5814', 108646),
(42, 15, '2025-09-17 14:42:16', '5d1c7ba722b2f68c57c58a8e1fbb23663acea59f543514563047b4ca32f6a805', '09141658a82e92ad0b27e50101817afbbd9d510e542ad250cdd3609bb4659ee7', 15188),
(43, 16, '2025-09-17 14:58:38', '03b624be833015c79823325be61dbf84e6e34de03e313417323c14579ff21623', '5d1c7ba722b2f68c57c58a8e1fbb23663acea59f543514563047b4ca32f6a805', 132952),
(44, 17, '2025-09-17 15:01:53', 'c05293a30ff4fa66c9c33ef9dc041e0d1650bffde92a45f3346c64fc9f9a6908', '03b624be833015c79823325be61dbf84e6e34de03e313417323c14579ff21623', 6181),
(45, 18, '2025-09-19 10:46:22', '854f4df1a2abca4a6c345be4b46a36f714124592206992e2e88741b52ed33fc3', 'c05293a30ff4fa66c9c33ef9dc041e0d1650bffde92a45f3346c64fc9f9a6908', 155193),
(46, 19, '2025-09-19 11:24:41', '2fd9d045394c785831ae111a567ed083b125767c2f70ced0134907d9a3c80242', '854f4df1a2abca4a6c345be4b46a36f714124592206992e2e88741b52ed33fc3', 18924),
(47, 20, '2025-09-19 11:32:13', 'bc21658c1823b8156f1c39f77d8b47587df18ac41e2c09f98e4e46719e4ecf69', '2fd9d045394c785831ae111a567ed083b125767c2f70ced0134907d9a3c80242', 76393),
(48, 21, '2025-09-19 11:35:08', 'c501309aad1301091737a3b9300c4deb005658767ea9f6f5f261158d16d9b577', 'bc21658c1823b8156f1c39f77d8b47587df18ac41e2c09f98e4e46719e4ecf69', 14650),
(49, 22, '2025-09-19 12:29:51', 'ee55d369eaa9d6104350e2ccdcf4cf724b9d19e360ea93f8c4480a26650caca5', 'c501309aad1301091737a3b9300c4deb005658767ea9f6f5f261158d16d9b577', 131582),
(50, 23, '2025-09-19 12:31:26', 'fa828a9d4065a2e4325fe2af8752c1d9f2ce5928b70f3a588db87176b6e61f5b', 'ee55d369eaa9d6104350e2ccdcf4cf724b9d19e360ea93f8c4480a26650caca5', 18968),
(51, 24, '2025-09-19 13:40:20', '64ad9df58842a473cd48fc923ab2bb11fd22a3fc46fadcec141fdba299085e91', 'fa828a9d4065a2e4325fe2af8752c1d9f2ce5928b70f3a588db87176b6e61f5b', 6956),
(52, 25, '2025-09-19 13:48:02', '7fccef5d4a9b6a1a24a7bbe9dc7d34b95e02efb3f34ea762084e44079da7e970', '64ad9df58842a473cd48fc923ab2bb11fd22a3fc46fadcec141fdba299085e91', 111472),
(53, 26, '2025-09-19 14:09:13', '23c1d6523cebe0f289069abf0f4c2f7f472e71ef6fd9fc954949420e34b98308', '7fccef5d4a9b6a1a24a7bbe9dc7d34b95e02efb3f34ea762084e44079da7e970', 28891),
(54, 27, '2025-09-19 14:32:44', '10f1bec8f0d5365ee8737b979de5dd7bbd03bf69ac93a525628dfc130578c4d8', '23c1d6523cebe0f289069abf0f4c2f7f472e71ef6fd9fc954949420e34b98308', 147743),
(55, 28, '2025-09-19 14:52:03', 'f075a7e08ee0494754d5a16564c6eb26ea2e7631cab5de03047b3c60d97336ad', '10f1bec8f0d5365ee8737b979de5dd7bbd03bf69ac93a525628dfc130578c4d8', 42441),
(56, 29, '2025-09-19 15:11:32', '66895ed5017101294fdabf8adcfd4edfebdfc01921fa8a8abd82d24f3fb9222a', 'f075a7e08ee0494754d5a16564c6eb26ea2e7631cab5de03047b3c60d97336ad', 103475),
(57, 30, '2025-09-19 15:11:36', 'c9d76a54239147295b68622d107e0235e6dba2150ef22dddd4864e3983d36e5e', '66895ed5017101294fdabf8adcfd4edfebdfc01921fa8a8abd82d24f3fb9222a', 50845),
(58, 31, '2025-09-19 15:17:32', '304222c823a7fdd648dd81c7ea1b3278ab347588393d6c495dadb0b300de5789', 'c9d76a54239147295b68622d107e0235e6dba2150ef22dddd4864e3983d36e5e', 20953),
(59, 32, '2025-09-19 15:34:03', '614685cb6c40c582b1e1b6dfadc7a0937b3fb743781b7318f685cb2ec569a06f', '304222c823a7fdd648dd81c7ea1b3278ab347588393d6c495dadb0b300de5789', 32794),
(60, 33, '2025-09-19 15:37:42', '5491a7a269167bc2696869b6c19790ae8870ec8ba82150b51428e66a9fc6e5c2', '614685cb6c40c582b1e1b6dfadc7a0937b3fb743781b7318f685cb2ec569a06f', 39735),
(61, 34, '2025-09-19 15:48:01', '02a9eca4fc89ed8ccceea78203cd10cb651de298692108664d3780e26bb0d0e5', '5491a7a269167bc2696869b6c19790ae8870ec8ba82150b51428e66a9fc6e5c2', 2896),
(62, 35, '2025-09-19 15:49:11', '446647cd882281e5c9a6da1e14d22acc4c7db265dd4fc64bbf9f32418c0ca35f', '02a9eca4fc89ed8ccceea78203cd10cb651de298692108664d3780e26bb0d0e5', 21567),
(63, 36, '2025-09-19 15:54:48', 'b4d1ca9f860b32467c3cdf22314c8e126327ff9878c4eb76ebad6237e85dc229', '446647cd882281e5c9a6da1e14d22acc4c7db265dd4fc64bbf9f32418c0ca35f', 96685),
(64, 37, '2025-09-19 16:01:13', 'dd64803c6da4ff0c64b8d98c5d88cc8079862d97969e60a17d10c090c4134a95', 'b4d1ca9f860b32467c3cdf22314c8e126327ff9878c4eb76ebad6237e85dc229', 3683),
(65, 38, '2025-09-19 16:14:43', '71cb1bb6d40d7b010fbd741f0a5cde56e6b3cf042ef32ba768669b805eaa67ac', 'dd64803c6da4ff0c64b8d98c5d88cc8079862d97969e60a17d10c090c4134a95', 5193),
(66, 39, '2025-09-19 16:23:11', 'd4f3c3b6701314093d48bda30e81dc2e49b92eebae1a30624b1b578df7978250', '71cb1bb6d40d7b010fbd741f0a5cde56e6b3cf042ef32ba768669b805eaa67ac', 19251),
(67, 40, '2025-09-19 16:42:58', '32e58d2c9f34ba1aaf6e8b302033e313675bb75b9ae157689f0fe31e1f5435dd', 'd4f3c3b6701314093d48bda30e81dc2e49b92eebae1a30624b1b578df7978250', 15534),
(68, 41, '2025-09-19 16:50:25', '14dfdfd5f440ec2961ad283f03f2af72a05b633ad57eb747452aa35b1ba52a54', '32e58d2c9f34ba1aaf6e8b302033e313675bb75b9ae157689f0fe31e1f5435dd', 94463),
(69, 42, '2025-09-19 18:48:06', '4515ac37889778b2dd25196ea1f6a3bd73715248e8b5c03cf8fed8ec6a4d5f7a', '14dfdfd5f440ec2961ad283f03f2af72a05b633ad57eb747452aa35b1ba52a54', 233725);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `BlogID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Excerpt` text NOT NULL,
  `Content` longtext NOT NULL,
  `ImagePath` varchar(255) DEFAULT NULL,
  `AuthorID` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` enum('draft','published','archived') DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`BlogID`, `Title`, `Excerpt`, `Content`, `ImagePath`, `AuthorID`, `CreatedAt`, `UpdatedAt`, `Status`) VALUES
(1, 'Water Conservation Tips for Households', 'Discover simple ways to reduce water waste at home and save on your utility bills.', 'Water is one of our most precious resources. In this article, we’ll explore practical tips for households to conserve water. These include fixing leaks promptly, using water-efficient appliances, harvesting rainwater, and practicing mindful usage. Every drop counts toward building a sustainable future.', 'uploads/blogs/blog_68b7e8ce995d3.jpg', 1, '2025-09-03 15:01:36', '2025-09-03 15:05:50', 'published'),
(2, 'HydroLink System Updates', 'Learn about the latest updates and improvements in the HydroLink platform.', 'We’re continuously enhancing HydroLink to serve you better. Recent updates include improved dashboard analytics, a more user-friendly interface, and a new contact inquiry system for easier support. Stay tuned for more improvements as we roll out additional features.', 'uploads/blogs/blog_68b7e953b7032.png', 1, '2025-09-03 15:08:03', '2025-09-03 15:08:10', 'published'),
(3, 'Community Outreach: Clean Water Initiative', 'How our team partnered with local communities to ensure access to safe drinking water.', 'Last month, HydroLink sponsored a clean water initiative in partnership with local government units. Together, we distributed water filters and conducted workshops on water safety practices. This is part of our mission to ensure safe water access for everyone.', 'uploads/blogs/blog_68b7e9bd60605.jpg', 1, '2025-09-03 15:09:49', '2025-09-03 15:09:49', 'published');

-- --------------------------------------------------------

--
-- Table structure for table `clientapplications`
--

CREATE TABLE `clientapplications` (
  `ClientAppID` int(11) NOT NULL,
  `ApplicationID` int(11) NOT NULL,
  `SiteName` varchar(150) NOT NULL,
  `Location` text DEFAULT NULL,
  `DeviceInfo` varchar(150) DEFAULT NULL,
  `OperatingHours` varchar(100) DEFAULT NULL,
  `ContactPerson` varchar(150) DEFAULT NULL,
  `ContactNumber` varchar(50) DEFAULT NULL,
  `AttachmentFile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientapplications`
--

INSERT INTO `clientapplications` (`ClientAppID`, `ApplicationID`, `SiteName`, `Location`, `DeviceInfo`, `OperatingHours`, `ContactPerson`, `ContactNumber`, `AttachmentFile`) VALUES
(1, 2, 'SBCA', 'SBCA', 'TANK 1', '8am-5pm', 'JP', '09369669536', NULL),
(2, 3, 'Barangay 70 Water Kiosk', 'Paranaque City', 'Tank #080', '10AM - 6PM', 'Gabriel Salazar', '+639468069127', '68ba9a66b25b2_Client Document.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `SiteName` varchar(150) NOT NULL,
  `Location` text DEFAULT NULL,
  `DeviceInfo` varchar(150) DEFAULT NULL,
  `OperatingHours` varchar(100) DEFAULT NULL,
  `ContactPerson` varchar(150) DEFAULT NULL,
  `ContactNumber` varchar(50) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PaymentPerBottle` decimal(10,2) NOT NULL DEFAULT 15.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `UserID`, `SiteName`, `Location`, `DeviceInfo`, `OperatingHours`, `ContactPerson`, `ContactNumber`, `CreatedAt`, `Balance`, `PaymentPerBottle`) VALUES
(1, 8, 'SBCA', 'SBCA', NULL, NULL, 'JP', '09369669536', '2025-08-26 16:45:10', 0.00, 15.00),
(2, 10, 'Barangay 70 Water Kiosk', 'Paranaque City', NULL, NULL, 'Gabriel Salazar', '+639468069127', '2025-09-05 16:10:12', 0.00, 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `dispense_logs`
--

CREATE TABLE `dispense_logs` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AttendantID` int(11) NOT NULL,
  `DispenseTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `AmountDispensed` decimal(5,2) DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_blocks`
--

CREATE TABLE `finance_blocks` (
  `BlockID` int(11) NOT NULL,
  `BlockIndex` int(11) NOT NULL,
  `BlockTimestamp` datetime NOT NULL,
  `BlockHash` varchar(64) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Hash` varchar(255) NOT NULL,
  `PreviousHash` varchar(255) NOT NULL,
  `Proof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_blocks`
--

INSERT INTO `finance_blocks` (`BlockID`, `BlockIndex`, `BlockTimestamp`, `BlockHash`, `Timestamp`, `Hash`, `PreviousHash`, `Proof`) VALUES
(1, 1, '2025-09-10 02:01:16', '08f3aaea2fef17e933ace0c37e4a6b589e93829efa49ff307a65c39eed47eb5e', '0000-00-00 00:00:00', '', '0', 100),
(2, 2, '2025-09-10 02:01:19', '16a08c0f492ff5ca78c504967d4879b1946fddc7960eadfd4e44f5352ada895f', '0000-00-00 00:00:00', '', '08f3aaea2fef17e933ace0c37e4a6b589e93829efa49ff307a65c39eed47eb5e', 4451),
(3, 3, '2025-09-10 02:01:20', '50a5c38706b96c94fe3aa5897085df8d323c496f599ab9e9029e4cdb101d0234', '0000-00-00 00:00:00', '', '16a08c0f492ff5ca78c504967d4879b1946fddc7960eadfd4e44f5352ada895f', 308),
(4, 4, '2025-09-10 02:01:20', '16d2bcf21a54e6ef1940bf960af7132b91c3b9d0b8f41d06d125bd27bc779f4d', '0000-00-00 00:00:00', '', '50a5c38706b96c94fe3aa5897085df8d323c496f599ab9e9029e4cdb101d0234', 77342),
(5, 5, '2025-09-10 02:01:21', 'd60ce5c48b5925736caaf3e5f7a4f44af47a46ecc8c2f408628a8c2d82be3680', '0000-00-00 00:00:00', '', '16d2bcf21a54e6ef1940bf960af7132b91c3b9d0b8f41d06d125bd27bc779f4d', 60013),
(6, 6, '2025-09-10 02:01:21', '4182e8259c7bc68fdbd67a8fd878e45d2def5c9f75ab7fbc74f627aafa3e2460', '0000-00-00 00:00:00', '', 'd60ce5c48b5925736caaf3e5f7a4f44af47a46ecc8c2f408628a8c2d82be3680', 10080),
(7, 7, '2025-09-10 02:01:21', '3573c7d2aadd6b88f6f636c744932a7484d5a9d2fb51992ee600af83a48409b8', '0000-00-00 00:00:00', '', '4182e8259c7bc68fdbd67a8fd878e45d2def5c9f75ab7fbc74f627aafa3e2460', 112312),
(8, 8, '2025-09-10 02:01:21', 'f47d216399abd8cb7d1b64685f8832521de944506fa9bd2378a313b702d5bcec', '0000-00-00 00:00:00', '', '3573c7d2aadd6b88f6f636c744932a7484d5a9d2fb51992ee600af83a48409b8', 79451),
(9, 9, '2025-09-10 02:01:21', '76de906ec6638dfede94f3057c29f405188d4bb912c970d227c46c3af11d96f1', '0000-00-00 00:00:00', '', 'f47d216399abd8cb7d1b64685f8832521de944506fa9bd2378a313b702d5bcec', 21446),
(10, 10, '2025-09-10 02:01:22', 'd66b3bbc4d7b4808ab2ba29211e94b00727f6801846a095f9cff37791971621d', '0000-00-00 00:00:00', '', '76de906ec6638dfede94f3057c29f405188d4bb912c970d227c46c3af11d96f1', 190087),
(11, 11, '2025-09-10 02:01:22', '30d9604a5e1f10244ad4a9fb3eacbaa4f747b140b47c587d4a3d989e44423271', '0000-00-00 00:00:00', '', 'd66b3bbc4d7b4808ab2ba29211e94b00727f6801846a095f9cff37791971621d', 21290),
(12, 12, '2025-09-10 02:01:22', '3ac3fc8890a9beae3e65d90b8e567aa5ccbc5809e976e96c67acac493127811e', '0000-00-00 00:00:00', '', '30d9604a5e1f10244ad4a9fb3eacbaa4f747b140b47c587d4a3d989e44423271', 73686),
(13, 13, '2025-09-10 02:01:22', 'a6a1bc56f36b5ac9290c83102e86683a0ddeb87249c8774cdeb0b4fcdf27b10f', '0000-00-00 00:00:00', '', '3ac3fc8890a9beae3e65d90b8e567aa5ccbc5809e976e96c67acac493127811e', 4611),
(14, 14, '2025-09-10 02:01:22', 'b7f50852933069ef14dbfda7af8c512a2103ef4628faa637283691e4d167b2a3', '0000-00-00 00:00:00', '', 'a6a1bc56f36b5ac9290c83102e86683a0ddeb87249c8774cdeb0b4fcdf27b10f', 8992),
(15, 15, '2025-09-10 02:01:22', 'a4aaa4a1bcf189d61bedbf47f11ed61fffc4af0b2198d3d90db75d8060e04142', '0000-00-00 00:00:00', '', 'b7f50852933069ef14dbfda7af8c512a2103ef4628faa637283691e4d167b2a3', 12176),
(16, 16, '2025-09-10 02:01:23', 'e45d6a14cbe8d13a00526e99467a064eb27dc88139b57b56cb498f2ce26270d1', '0000-00-00 00:00:00', '', 'a4aaa4a1bcf189d61bedbf47f11ed61fffc4af0b2198d3d90db75d8060e04142', 94676),
(17, 17, '2025-09-10 02:01:23', 'e34fc432f1417cb4d87300671874c2f078bc8b3c105c1cfb909a1c05e5731c04', '0000-00-00 00:00:00', '', 'e45d6a14cbe8d13a00526e99467a064eb27dc88139b57b56cb498f2ce26270d1', 93169),
(18, 18, '2025-09-10 02:01:23', 'fa5b14c15e2fbca5f7dd993cc3f5355136481e1cb7b20bc491bf0aa6f49dfc60', '0000-00-00 00:00:00', '', 'e34fc432f1417cb4d87300671874c2f078bc8b3c105c1cfb909a1c05e5731c04', 68825),
(19, 19, '2025-09-10 02:01:23', '828c8f5107eccdd406cdb22004f566eab7a702e34b1e2793efbd39b4b83729fe', '0000-00-00 00:00:00', '', 'fa5b14c15e2fbca5f7dd993cc3f5355136481e1cb7b20bc491bf0aa6f49dfc60', 133422),
(20, 20, '2025-09-10 02:01:24', '96159e450b2a646cd2bc33a0debfd7ad6ad913853aad20fcf1f13888ebd67f19', '0000-00-00 00:00:00', '', '828c8f5107eccdd406cdb22004f566eab7a702e34b1e2793efbd39b4b83729fe', 198131),
(21, 21, '2025-09-10 02:01:24', '9174b37e7205d22a02c7a2e055f62e8bdea31d17da54e11e5dc36af325b76899', '0000-00-00 00:00:00', '', '96159e450b2a646cd2bc33a0debfd7ad6ad913853aad20fcf1f13888ebd67f19', 31046),
(22, 22, '2025-09-10 02:01:24', 'f67f005ca11e8b72f84598e9d817c2abd17c4b036b8142990bd90dc92531a31b', '0000-00-00 00:00:00', '', '9174b37e7205d22a02c7a2e055f62e8bdea31d17da54e11e5dc36af325b76899', 137488),
(23, 23, '2025-09-10 02:01:24', 'd988b06df0cc998f7f7c05274d9ae3358de2b50c66af59aa13d3e3726cfcdc56', '0000-00-00 00:00:00', '', 'f67f005ca11e8b72f84598e9d817c2abd17c4b036b8142990bd90dc92531a31b', 33088),
(24, 24, '2025-09-10 02:01:25', 'ffc0db98317a3acde896c48141879c1079a7c326c0a1c6307c57fe96e7ba2f31', '0000-00-00 00:00:00', '', 'd988b06df0cc998f7f7c05274d9ae3358de2b50c66af59aa13d3e3726cfcdc56', 2644),
(25, 25, '2025-09-10 02:01:25', 'd2f38a1d914f633383beb601ef06d8fac10617fbdfc2c83f9d8d09883a33c291', '0000-00-00 00:00:00', '', 'ffc0db98317a3acde896c48141879c1079a7c326c0a1c6307c57fe96e7ba2f31', 78678),
(26, 26, '2025-09-10 02:01:25', 'e075240123306eb1c5160ecdf4a8f13d05adf832757a91f6bbe15d901aa41a51', '0000-00-00 00:00:00', '', 'd2f38a1d914f633383beb601ef06d8fac10617fbdfc2c83f9d8d09883a33c291', 17751),
(27, 27, '2025-09-10 02:01:25', '2f2f783deb3ae58e4df797fb334dd17fb8dacc457d896f1d5743084e402a5efe', '0000-00-00 00:00:00', '', 'e075240123306eb1c5160ecdf4a8f13d05adf832757a91f6bbe15d901aa41a51', 159207),
(28, 28, '2025-09-10 02:48:31', '0000ee3b9023bca57a1a96c88ff43324e5e74b82876f8208ffd905c976019d21', '2025-09-10 02:48:31', '0000ee3b9023bca57a1a96c88ff43324e5e74b82876f8208ffd905c976019d21', '', 14642),
(29, 29, '2025-09-10 02:50:26', '00006c6e5323e8b27f702d2667b08122e067cb65686b1f26ef7390fa1711ac21', '2025-09-10 02:50:26', '00006c6e5323e8b27f702d2667b08122e067cb65686b1f26ef7390fa1711ac21', '0000ee3b9023bca57a1a96c88ff43324e5e74b82876f8208ffd905c976019d21', 4065),
(30, 30, '2025-09-10 14:08:18', '0000d1a701b42991dcecf0121ce6fa292d28b86ad8a0f0e9ef7185e2c8234cf2', '2025-09-10 14:08:18', '0000d1a701b42991dcecf0121ce6fa292d28b86ad8a0f0e9ef7185e2c8234cf2', '00006c6e5323e8b27f702d2667b08122e067cb65686b1f26ef7390fa1711ac21', 980),
(31, 31, '2025-09-10 17:16:01', '0000881373a4947eee94090a296dac36f0a5144883aa368cd400ba5f84497e4f', '2025-09-10 17:16:01', '0000881373a4947eee94090a296dac36f0a5144883aa368cd400ba5f84497e4f', '0000d1a701b42991dcecf0121ce6fa292d28b86ad8a0f0e9ef7185e2c8234cf2', 80862);

-- --------------------------------------------------------

--
-- Table structure for table `finance_records`
--

CREATE TABLE `finance_records` (
  `RecordID` int(11) NOT NULL,
  `BlockID` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL,
  `TxHash` varchar(255) NOT NULL,
  `Proof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_records`
--

INSERT INTO `finance_records` (`RecordID`, `BlockID`, `TransactionID`, `TxHash`, `Proof`) VALUES
(1, 28, 1, 'fec24c01390816524d7ad624cb8cc92e92b715b7f551c981a5c724be3c1b05cc', 14642),
(2, 28, 2, '65496b1bf5deff6ba9369e8d4981511d665de2924be9d578b596f0fc2b9798ee', 14642),
(3, 28, 3, '7f10c68d1301b4061da9a448560ecd1e33d7770f44727ab864bd8c019b213b9a', 14642),
(4, 28, 4, '57d1977c2d66d21440b9eb6ecdfa6de1418da62a55feb62a5292cb3b11ccf7bb', 14642),
(5, 28, 5, '8a9c02525c9964d75fdc2d0af7b7c4b9f749a8b8247001a5005546bf6fd43fb4', 14642),
(6, 28, 6, '836ddd179a143baba78644854000ab12183779e4cba9bc23e5d3214dd5980851', 14642),
(7, 28, 7, '42a7f6bf92752c7487d0aaaa3f2b9ea4d7a236cd062b09dfc89ab7cbdc343881', 14642),
(8, 28, 8, 'c2a24661106a4e8ab9b6acff67aa8fb6ee4d4758b3b4b039410f725a6d619d39', 14642),
(9, 29, 9, '04b0f4bfa3bb709d937a51c881b1988911febe874e16021fcb28ad1930bce39e', 4065),
(10, 30, 10, 'e0a7c0e9b6c8353de27d95813e113f0bb7bc43e2c5b0222bbb5520c06a788e4a', 980),
(11, 31, 11, '93a3ec571a46b7ebc49f52243c44cd41d32dbfd589985a2214ce9bac0a97cef5', 80862);

-- --------------------------------------------------------

--
-- Stand-in structure for view `finance_summary`
-- (See below for the actual view)
--
CREATE TABLE `finance_summary` (
`BlockID` int(11)
,`BlockIndex` int(11)
,`BlockTimestamp` datetime
,`BlockHash` varchar(255)
,`PreviousHash` varchar(255)
,`Proof` int(11)
,`RecordID` int(11)
,`TransactionID` int(11)
,`SponsorID` int(11)
,`ClientID` int(11)
,`Amount` float
,`Party` enum('Sponsor','Client','Company')
,`TxType` enum('WaterCredit','WaterDebit','CompanyFund')
,`TxTimestamp` datetime
,`TxHash` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `financial_transactions`
--

CREATE TABLE `financial_transactions` (
  `TransactionID` int(11) NOT NULL,
  `SponsorID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `Amount` float NOT NULL,
  `Party` enum('Sponsor','Client','Company') NOT NULL,
  `TxType` enum('WaterCredit','WaterDebit','CompanyFund') NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `TxTimestamp` datetime NOT NULL,
  `TxHash` varchar(255) NOT NULL,
  `Details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `financial_transactions`
--

INSERT INTO `financial_transactions` (`TransactionID`, `SponsorID`, `ClientID`, `Amount`, `Party`, `TxType`, `Timestamp`, `TxTimestamp`, `TxHash`, `Details`) VALUES
(1, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:14:34', '2025-09-10 02:14:34', 'fec24c01390816524d7ad624cb8cc92e92b715b7f551c981a5c724be3c1b05cc', NULL),
(2, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:15:07', '2025-09-10 02:15:07', '65496b1bf5deff6ba9369e8d4981511d665de2924be9d578b596f0fc2b9798ee', NULL),
(3, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:17:19', '2025-09-10 02:17:19', '7f10c68d1301b4061da9a448560ecd1e33d7770f44727ab864bd8c019b213b9a', NULL),
(4, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:25:50', '2025-09-10 02:25:50', '57d1977c2d66d21440b9eb6ecdfa6de1418da62a55feb62a5292cb3b11ccf7bb', NULL),
(5, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:29:25', '2025-09-10 02:29:25', '8a9c02525c9964d75fdc2d0af7b7c4b9f749a8b8247001a5005546bf6fd43fb4', NULL),
(6, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:30:25', '2025-09-10 02:30:25', '836ddd179a143baba78644854000ab12183779e4cba9bc23e5d3214dd5980851', NULL),
(7, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:31:46', '2025-09-10 02:31:46', '42a7f6bf92752c7487d0aaaa3f2b9ea4d7a236cd062b09dfc89ab7cbdc343881', NULL),
(8, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:48:24', '2025-09-10 02:48:24', 'c2a24661106a4e8ab9b6acff67aa8fb6ee4d4758b3b4b039410f725a6d619d39', 'Test sponsorship ₱20 credit'),
(9, 1, 2, 20, 'Sponsor', '', '2025-09-10 02:50:23', '2025-09-10 02:50:23', '04b0f4bfa3bb709d937a51c881b1988911febe874e16021fcb28ad1930bce39e', 'Test sponsorship ₱20 credit'),
(10, 1, 2, 20, 'Sponsor', '', '2025-09-10 14:08:01', '2025-09-10 14:08:01', 'e0a7c0e9b6c8353de27d95813e113f0bb7bc43e2c5b0222bbb5520c06a788e4a', 'Test sponsorship ₱20 credit'),
(11, 1, 2, 20, 'Sponsor', '', '2025-09-10 17:15:40', '2025-09-10 17:15:40', '93a3ec571a46b7ebc49f52243c44cd41d32dbfd589985a2214ce9bac0a97cef5', 'Test sponsorship ₱20 credit');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `InquiryID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Message` text NOT NULL,
  `Status` enum('Pending','Resolved') DEFAULT 'Pending',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`InquiryID`, `UserID`, `Subject`, `Message`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 9, 'Issue with Water Usage Report', 'I noticed that my water consumption report for August seems unusually high compared to my actual usage. Could you please check if there might be a discrepancy in the recorded data?', 'Pending', '2025-09-03 03:57:10', '2025-09-03 04:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `roleapplications`
--

CREATE TABLE `roleapplications` (
  `ApplicationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RoleRequested` enum('Sponsor','Client') NOT NULL,
  `SubmittedAt` datetime DEFAULT current_timestamp(),
  `Status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `ReviewedBy` int(11) DEFAULT NULL,
  `ReviewedAt` datetime DEFAULT NULL,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roleapplications`
--

INSERT INTO `roleapplications` (`ApplicationID`, `UserID`, `RoleRequested`, `SubmittedAt`, `Status`, `ReviewedBy`, `ReviewedAt`, `Notes`) VALUES
(1, 5, 'Sponsor', '2025-08-26 16:42:32', 'Approved', 6, '2025-08-26 16:45:09', 'I want my brand to be known'),
(2, 8, 'Client', '2025-08-26 16:44:56', 'Approved', 6, '2025-08-26 16:45:10', 'To increase revenue\''),
(3, 10, 'Client', '2025-09-05 16:08:06', 'Approved', 1, '2025-09-05 16:10:12', 'To provide clean and safe drinking water to our barangay.'),
(4, 11, 'Sponsor', '2025-09-05 16:09:39', 'Approved', 1, '2025-09-05 16:10:11', 'We believe in promoting access to safe drinking water for communities.');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorapplications`
--

CREATE TABLE `sponsorapplications` (
  `SponsorAppID` int(11) NOT NULL,
  `ApplicationID` int(11) NOT NULL,
  `SponsorName` varchar(150) NOT NULL,
  `ContactPerson` varchar(150) DEFAULT NULL,
  `ContactNumber` varchar(50) DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `PreferredArea` text DEFAULT NULL,
  `AttachmentFile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsorapplications`
--

INSERT INTO `sponsorapplications` (`SponsorAppID`, `ApplicationID`, `SponsorName`, `ContactPerson`, `ContactNumber`, `Budget`, `PreferredArea`, `AttachmentFile`) VALUES
(1, 1, 'SBCA Water Distribution', 'Walglen', '09319669536', 20000.00, 'SBCA faculty', NULL),
(2, 4, 'Edwin Company', 'Edwin Lirio', '+639999999999', 20000.00, 'Edwin Community', '68ba9ac3ef16e_Sponsor Document.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `sponsorships`
--

CREATE TABLE `sponsorships` (
  `SponsorID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `AdDetails` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsorships`
--

INSERT INTO `sponsorships` (`SponsorID`, `UserID`, `Amount`, `AdDetails`) VALUES
(1, 5, 19980.00, 'SBCA faculty'),
(2, 11, 20000.00, 'Edwin Community');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT current_timestamp(),
  `WaterAmount` int(11) DEFAULT NULL,
  `Hash` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_links`
--

CREATE TABLE `transaction_links` (
  `LinkID` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL,
  `SponsorID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Contact` varchar(15) DEFAULT NULL,
  `Role` enum('Admin','Client','Sponsor','User','Attendant') NOT NULL,
  `QRCode` varchar(255) DEFAULT NULL,
  `TermsAccepted` tinyint(1) NOT NULL DEFAULT 0,
  `TermsAcceptedAt` datetime DEFAULT NULL,
  `DailyLimitClaim` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `Email`, `PasswordHash`, `Contact`, `Role`, `QRCode`, `TermsAccepted`, `TermsAcceptedAt`, `DailyLimitClaim`) VALUES
(1, 'Marc Jansen V. Santos', 'santosmack06@gmail.com', '$2y$10$KvZpzOsViZtvAstcYbRwz.dXDgNqRPLbEaXJNpJYCYUTRzGaR7xGO', '+639496247905', 'Admin', 'USR-1-68abf7bb6b7c9', 1, '2025-09-01 18:57:57', 0),
(5, 'Walglen', 'walglen@gmail.com', '$2y$10$v56sBibVOcljQFVQXn9zieOn0S2wa48ONvA3Ed/FeP4/CSP30QXYq', '+639698267107', 'Sponsor', 'USR-5-68ad4b9791dd1', 0, NULL, 0),
(6, 'Glen Abel', 'glen@gmail.com', '$2y$10$FhQ3aU1e4rfh.nCg3W7sMOIc.Z2PhJet/56bndo8kd65.SzFJ79rq', '+639876543210', 'Admin', 'USR-6-68ad6d5211086', 0, NULL, 0),
(7, 'Law', 'lawrence@gmail.com', '$2y$10$y3FSt8H.fIrB/I.p6Wp4EuxO2sAZWLJSCHRjHDR9IGlFuwlBcwvsK', '+639321012345', 'User', 'USR-7-68ad6dba2ea30', 0, NULL, 0),
(8, 'JP', 'JP@gmail.com', '$2y$10$Dds1cJoTJ71wnFlXomdy4eUcUVJF2LhDBaVEG3XApRiPLR6L73zw.', '+639444444444', 'Client', 'USR-8-68ad73cec42ac', 0, NULL, 0),
(9, 'Ronan Zachary L. Ortencio', 'ronan@gmail.com', '$2y$10$rMaEQYdnBJ1t.WAlqWzP6uV3x7K2dAipNwJGGAPp0sCFpop3KXI7O', '+639468069127', 'Attendant', 'USR-9-68b7b23c72c4a', 1, '2025-09-03 11:13:23', 0),
(10, 'Gabriel Salazar', 'gabriel@gmail.com', '$2y$10$C2S.5C1bRHmq7mE5pH24KOjvaE9tnCDBYkpFK6hrA0pRetTdDBmeO', '+639135682694', 'Client', 'USR-10-68ba9a1bce159', 1, '2025-09-05 16:07:19', 0),
(11, 'Edwin Lirio', 'edwin@gmail.com', '$2y$10$zgi92anFSlC2YeFrYdcR0.AnRYVP1Wib9uv/.5lzS099xiA6x6rka', '09999999999', 'Sponsor', 'USR-11-68ba9a8a8fdbc', 1, '2025-09-05 16:08:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `SessionID` varchar(128) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ExpiresAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`SessionID`, `UserID`, `ExpiresAt`) VALUES
('25b6pfi3spiailq1hlndmi3cug', 7, '2025-09-07 06:46:34'),
('53hj2c10sdnm7nqhhcpe9rkqt8', 6, '2025-09-11 11:09:28'),
('67ot05eq6lsim3mgilbfimp6hs', 5, '2025-08-28 11:12:46'),
('6fmki4g9bug2u26vpkc12vrokn', 6, '2025-09-18 08:24:44'),
('7gevqg1u1s7gs6paknhb4jn22q', 1, '2025-09-04 06:20:27'),
('dgrsvf09tboag13la0tdfuul76', 6, '2025-09-20 04:27:45'),
('dkr11dbgtn8sg5ja15g7a5hfd1', 1, '2025-09-02 12:56:33'),
('ftklhq2cgp7etueaa7k3aoc18d', 7, '2025-08-28 11:32:20'),
('gja24f93gn8rprt9a8c0gej37l', 1, '2025-09-06 10:09:49'),
('iksjkfe7dugenhekf7v95gioq5', 1, '2025-09-04 08:48:43'),
('jmh02pf1k5e92d2prvrfsf5oke', 1, '2025-09-01 10:34:43'),
('l5eccql42jdebebrgia3bsuha1', 6, '2025-09-10 19:20:52'),
('s9r7pqpqihigr97ahbmjoaae6q', 1, '2025-09-02 08:20:20'),
('sea7m61363nl871ogf9tn8diub', 5, '2025-08-27 17:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `water_dispenses`
--

CREATE TABLE `water_dispenses` (
  `DispenseID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `SponsorID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `DispenseDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_dispenses`
--

INSERT INTO `water_dispenses` (`DispenseID`, `UserID`, `SponsorID`, `ClientID`, `Quantity`, `DispenseDate`) VALUES
(35, 1, 1, 1, 1, '2025-08-26 22:02:15'),
(36, 1, 1, 1, 1, '2025-08-26 22:03:14'),
(37, 1, 1, 1, 1, '2025-08-26 22:07:08'),
(38, 1, 1, 1, 1, '2025-08-26 22:20:37'),
(39, 1, 1, 1, 1, '2025-08-26 23:10:49'),
(40, 1, 1, 1, 1, '2025-08-26 23:10:50'),
(41, 1, 1, 1, 1, '2025-08-26 23:28:10'),
(42, 1, 1, 1, 1, '2025-08-26 23:28:12'),
(43, 1, 1, 1, 1, '2025-08-27 17:11:27'),
(44, 1, 1, 1, 1, '2025-08-27 17:29:09'),
(45, 1, 1, 1, 1, '2025-09-10 02:18:10'),
(46, 1, 1, 1, 1, '2025-09-10 14:08:05'),
(47, 1, 1, 1, 1, '2025-09-10 17:15:52'),
(48, 1, 1, 1, 1, '2025-09-15 14:34:52'),
(49, 1, 1, 1, 1, '2025-09-15 14:34:52'),
(50, 1, 1, 1, 1, '2025-09-15 14:34:53'),
(51, 1, 1, 1, 0, '2025-09-17 14:21:42'),
(52, 1, 1, 1, 0, '2025-09-17 14:22:11'),
(53, 1, 1, 1, 0, '2025-09-17 14:23:13'),
(54, 1, 1, 1, 0, '2025-09-17 14:23:27'),
(55, 1, 1, 1, 0, '2025-09-17 14:24:07'),
(56, 1, 1, 1, 0, '2025-09-17 14:33:52'),
(57, 1, 1, 1, 0, '2025-09-17 14:40:13'),
(58, 1, 1, 1, 0, '2025-09-17 14:40:14'),
(59, 1, 1, 1, 0, '2025-09-17 14:40:15'),
(60, 1, 1, 1, 0, '2025-09-17 14:40:16'),
(61, 1, 1, 1, 0, '2025-09-17 14:40:17'),
(62, 1, 1, 1, 0, '2025-09-17 14:40:18'),
(63, 1, 1, 1, 0, '2025-09-17 14:40:19'),
(64, 1, 1, 1, 0, '2025-09-17 14:40:20'),
(65, 1, 1, 1, 0, '2025-09-17 14:40:21'),
(66, 1, 1, 1, 0, '2025-09-17 14:40:22'),
(67, 1, 1, 1, 0, '2025-09-17 14:40:23'),
(68, 1, 1, 1, 0, '2025-09-17 14:40:24'),
(69, 1, 1, 1, 0, '2025-09-17 14:40:25'),
(70, 1, 1, 1, 0, '2025-09-17 14:40:26'),
(71, 1, 1, 1, 0, '2025-09-17 14:40:27'),
(72, 1, 1, 1, 0, '2025-09-17 14:40:28'),
(73, 1, 1, 1, 0, '2025-09-17 14:40:29'),
(74, 1, 1, 1, 0, '2025-09-17 14:40:30'),
(75, 1, 1, 1, 0, '2025-09-17 14:40:31'),
(76, 1, 1, 1, 0, '2025-09-17 14:40:32'),
(77, 1, 1, 1, 0, '2025-09-17 14:40:33'),
(78, 1, 1, 1, 0, '2025-09-17 14:40:34'),
(79, 1, 1, 1, 0, '2025-09-17 14:40:35'),
(80, 1, 1, 1, 0, '2025-09-17 14:40:36'),
(81, 1, 1, 1, 0, '2025-09-17 14:40:37'),
(82, 1, 1, 1, 0, '2025-09-17 14:40:38'),
(83, 1, 1, 1, 0, '2025-09-17 14:40:39'),
(84, 1, 1, 1, 0, '2025-09-17 14:40:40'),
(85, 1, 1, 1, 0, '2025-09-17 14:40:41'),
(86, 1, 1, 1, 0, '2025-09-17 14:40:42'),
(87, 1, 1, 1, 0, '2025-09-17 14:40:43'),
(88, 1, 1, 1, 0, '2025-09-17 14:40:44'),
(89, 1, 1, 1, 0, '2025-09-17 14:40:45'),
(90, 1, 1, 1, 0, '2025-09-17 14:40:46'),
(91, 1, 1, 1, 0, '2025-09-17 14:40:47'),
(92, 1, 1, 1, 0, '2025-09-17 14:40:48'),
(93, 1, 1, 1, 0, '2025-09-17 14:40:49'),
(94, 1, 1, 1, 0, '2025-09-17 14:40:50'),
(95, 1, 1, 1, 0, '2025-09-17 14:40:51'),
(96, 1, 1, 1, 0, '2025-09-17 14:40:52'),
(97, 1, 1, 1, 0, '2025-09-17 14:40:53'),
(98, 1, 1, 1, 0, '2025-09-17 14:44:33'),
(99, 1, 1, 1, 0, '2025-09-17 14:44:34'),
(100, 1, 1, 1, 0, '2025-09-17 14:46:22'),
(101, 1, 1, 1, 0, '2025-09-17 14:46:22'),
(102, 1, 1, 1, 0, '2025-09-17 14:46:23'),
(103, 1, 1, 1, 0, '2025-09-17 14:46:24'),
(104, 1, 1, 1, 0, '2025-09-17 14:46:25'),
(105, 1, 1, 1, 0, '2025-09-17 14:46:29'),
(106, 1, 1, 1, 0, '2025-09-17 14:46:30'),
(107, 1, 1, 1, 0, '2025-09-17 14:51:21'),
(108, 1, 1, 1, 0, '2025-09-17 14:51:22'),
(109, 1, 1, 1, 0, '2025-09-17 14:51:23'),
(110, 1, 1, 1, 0, '2025-09-17 15:01:02'),
(111, 1, 1, 1, 0, '2025-09-17 15:01:30'),
(112, 1, 1, 1, 1, '2025-09-17 15:35:45'),
(113, 1, 1, 1, 1, '2025-09-17 15:35:46'),
(114, 1, 1, 1, 1, '2025-09-17 15:35:51'),
(115, 1, 1, 1, 1, '2025-09-19 10:45:45'),
(116, 1, 1, 1, 1, '2025-09-19 11:03:41'),
(117, 1, 1, 1, 1, '2025-09-19 11:03:43'),
(118, 1, 1, 1, 1, '2025-09-19 11:03:47'),
(119, 1, 1, 1, 1, '2025-09-19 11:03:58'),
(120, 1, 1, 1, 1, '2025-09-19 11:04:17'),
(121, 1, 1, 1, 1, '2025-09-19 11:04:18'),
(122, 1, 1, 1, 1, '2025-09-19 11:04:18'),
(123, 1, 1, 1, 1, '2025-09-19 11:04:19'),
(124, 1, 1, 1, 1, '2025-09-19 11:04:19'),
(125, 1, 1, 1, 1, '2025-09-19 11:04:20'),
(126, 1, 1, 1, 1, '2025-09-19 11:04:20'),
(127, 1, 1, 1, 1, '2025-09-19 11:04:21'),
(128, 1, 1, 1, 1, '2025-09-19 11:04:21'),
(129, 1, 1, 1, 1, '2025-09-19 11:04:21'),
(130, 1, 1, 1, 1, '2025-09-19 11:04:22'),
(131, 1, 1, 1, 1, '2025-09-19 11:04:22'),
(132, 1, 1, 1, 1, '2025-09-19 11:04:23'),
(133, 1, 1, 1, 1, '2025-09-19 11:04:24'),
(134, 1, 1, 1, 1, '2025-09-19 11:04:24'),
(135, 1, 1, 1, 1, '2025-09-19 11:04:24'),
(136, 1, 1, 1, 1, '2025-09-19 11:04:25'),
(137, 1, 1, 1, 1, '2025-09-19 11:04:25'),
(138, 1, 1, 1, 1, '2025-09-19 11:11:15'),
(139, 1, 1, 1, 1, '2025-09-19 11:11:15'),
(140, 1, 1, 1, 1, '2025-09-19 11:11:16'),
(141, 1, 1, 1, 1, '2025-09-19 11:11:17'),
(142, 1, 1, 1, 1, '2025-09-19 11:11:19'),
(143, 1, 1, 1, 1, '2025-09-19 11:11:20'),
(144, 1, 1, 1, 1, '2025-09-19 11:11:21'),
(145, 1, 1, 1, 1, '2025-09-19 11:11:22'),
(146, 1, 1, 1, 1, '2025-09-19 11:11:23'),
(147, 1, 1, 1, 1, '2025-09-19 11:11:23'),
(148, 1, 1, 1, 1, '2025-09-19 11:11:24'),
(149, 1, 1, 1, 1, '2025-09-19 11:11:25'),
(150, 1, 1, 1, 1, '2025-09-19 11:11:27'),
(151, 1, 1, 1, 1, '2025-09-19 11:11:28'),
(152, 1, 1, 1, 1, '2025-09-19 11:11:29'),
(153, 1, 1, 1, 1, '2025-09-19 11:11:30'),
(154, 1, 1, 1, 1, '2025-09-19 11:11:31'),
(155, 1, 1, 1, 1, '2025-09-19 11:11:32'),
(156, 1, 1, 1, 1, '2025-09-19 11:11:33'),
(157, 1, 1, 1, 1, '2025-09-19 11:11:33'),
(158, 1, 1, 1, 1, '2025-09-19 11:11:34'),
(159, 1, 1, 1, 1, '2025-09-19 11:11:36'),
(160, 1, 1, 1, 1, '2025-09-19 11:11:37'),
(161, 1, 1, 1, 1, '2025-09-19 11:11:38'),
(162, 1, 1, 1, 1, '2025-09-19 11:11:39'),
(163, 1, 1, 1, 1, '2025-09-19 11:11:40'),
(164, 1, 1, 1, 1, '2025-09-19 11:15:16'),
(165, 1, 1, 1, 1, '2025-09-19 11:15:16'),
(166, 1, 1, 1, 1, '2025-09-19 11:15:17'),
(167, 1, 1, 1, 1, '2025-09-19 11:15:17'),
(168, 1, 1, 1, 1, '2025-09-19 11:15:17'),
(169, 1, 1, 1, 1, '2025-09-19 11:15:18'),
(170, 1, 1, 1, 1, '2025-09-19 11:15:19'),
(171, 1, 1, 1, 1, '2025-09-19 11:15:19'),
(172, 1, 1, 1, 1, '2025-09-19 11:15:19'),
(173, 1, 1, 1, 1, '2025-09-19 11:15:20'),
(174, 1, 1, 1, 1, '2025-09-19 11:15:20'),
(175, 1, 1, 1, 1, '2025-09-19 11:15:21'),
(176, 1, 1, 1, 1, '2025-09-19 11:15:21'),
(177, 1, 1, 1, 1, '2025-09-19 11:15:21'),
(178, 1, 1, 1, 1, '2025-09-19 11:15:22'),
(179, 1, 1, 1, 1, '2025-09-19 11:15:22'),
(180, 1, 1, 1, 1, '2025-09-19 11:15:23'),
(181, 1, 1, 1, 1, '2025-09-19 11:15:23'),
(182, 1, 1, 1, 1, '2025-09-19 11:15:24'),
(183, 1, 1, 1, 1, '2025-09-19 11:15:24'),
(184, 1, 1, 1, 1, '2025-09-19 11:15:24'),
(185, 1, 1, 1, 1, '2025-09-19 11:15:25'),
(186, 1, 1, 1, 1, '2025-09-19 11:15:26'),
(187, 1, 1, 1, 1, '2025-09-19 11:15:26'),
(188, 1, 1, 1, 1, '2025-09-19 11:15:27'),
(189, 1, 1, 1, 1, '2025-09-19 11:15:27'),
(190, 1, 1, 1, 1, '2025-09-19 11:15:28'),
(191, 1, 1, 1, 1, '2025-09-19 11:15:28'),
(192, 1, 1, 1, 1, '2025-09-19 11:15:29'),
(193, 1, 1, 1, 1, '2025-09-19 11:15:29'),
(194, 1, 1, 1, 1, '2025-09-19 11:15:29'),
(195, 1, 1, 1, 1, '2025-09-19 11:15:30'),
(196, 1, 1, 1, 1, '2025-09-19 11:15:30'),
(197, 1, 1, 1, 1, '2025-09-19 11:15:31'),
(198, 1, 1, 1, 1, '2025-09-19 11:17:34'),
(199, 1, 1, 1, 1, '2025-09-19 11:17:36'),
(200, 1, 1, 1, 1, '2025-09-19 11:17:40'),
(201, 1, 1, 1, 1, '2025-09-19 11:17:42'),
(202, 1, 1, 1, 1, '2025-09-19 11:18:04'),
(203, 1, 1, 1, 1, '2025-09-19 11:18:05'),
(204, 1, 1, 1, 1, '2025-09-19 11:18:06'),
(205, 1, 1, 1, 1, '2025-09-19 11:18:06'),
(206, 1, 1, 1, 1, '2025-09-19 11:18:06'),
(207, 1, 1, 1, 1, '2025-09-19 11:18:07'),
(208, 1, 1, 1, 1, '2025-09-19 11:18:07'),
(209, 1, 1, 1, 1, '2025-09-19 11:18:08'),
(210, 1, 1, 1, 1, '2025-09-19 11:18:08'),
(211, 1, 1, 1, 1, '2025-09-19 11:18:09'),
(212, 1, 1, 1, 1, '2025-09-19 11:18:09'),
(213, 1, 1, 1, 1, '2025-09-19 11:18:10'),
(214, 1, 1, 1, 1, '2025-09-19 11:18:10'),
(215, 1, 1, 1, 1, '2025-09-19 11:18:11'),
(216, 1, 1, 1, 1, '2025-09-19 11:18:11'),
(217, 1, 1, 1, 1, '2025-09-19 11:18:11'),
(218, 1, 1, 1, 1, '2025-09-19 11:18:12'),
(219, 1, 1, 1, 1, '2025-09-19 11:18:12'),
(220, 1, 1, 1, 1, '2025-09-19 11:18:13'),
(221, 1, 1, 1, 1, '2025-09-19 11:18:13'),
(222, 1, 1, 1, 1, '2025-09-19 11:18:14'),
(223, 1, 1, 1, 1, '2025-09-19 11:18:14'),
(224, 1, 1, 1, 1, '2025-09-19 11:18:15'),
(225, 1, 1, 1, 1, '2025-09-19 11:18:15'),
(226, 1, 1, 1, 1, '2025-09-19 11:18:16'),
(227, 1, 1, 1, 1, '2025-09-19 11:18:16'),
(228, 1, 1, 1, 1, '2025-09-19 11:18:17'),
(229, 1, 1, 1, 1, '2025-09-19 11:18:17'),
(230, 1, 1, 1, 1, '2025-09-19 11:18:17'),
(231, 1, 1, 1, 1, '2025-09-19 11:18:18'),
(232, 1, 1, 1, 1, '2025-09-19 11:18:18'),
(233, 1, 1, 1, 1, '2025-09-19 11:25:53'),
(234, 1, 1, 1, 1, '2025-09-19 11:26:11'),
(235, 1, 1, 1, 1, '2025-09-19 11:26:19'),
(236, 1, 1, 1, 1, '2025-09-19 11:26:26'),
(237, 1, 1, 1, 1, '2025-09-19 11:26:31'),
(238, 1, 1, 1, 1, '2025-09-19 11:26:42'),
(239, 1, 1, 1, 1, '2025-09-19 11:27:07'),
(240, 1, 1, 1, 1, '2025-09-19 11:27:32'),
(241, 1, 1, 1, 1, '2025-09-19 11:27:35'),
(242, 1, 1, 1, 1, '2025-09-19 11:34:35'),
(243, 1, 1, 1, 1, '2025-09-19 11:48:55'),
(244, 1, 1, 1, 1, '2025-09-19 11:49:56'),
(245, 1, 1, 1, 1, '2025-09-19 11:50:57'),
(246, 1, 1, 1, 1, '2025-09-19 11:58:50'),
(247, 1, 1, 1, 1, '2025-09-19 11:59:23'),
(248, 1, 1, 1, 1, '2025-09-19 11:59:26'),
(249, 1, 1, 1, 1, '2025-09-19 11:59:33'),
(250, 1, 1, 1, 1, '2025-09-19 11:59:44'),
(251, 1, 1, 1, 1, '2025-09-19 11:59:45'),
(252, 1, 1, 1, 1, '2025-09-19 11:59:45'),
(253, 1, 1, 1, 1, '2025-09-19 11:59:46'),
(254, 1, 1, 1, 1, '2025-09-19 11:59:46'),
(255, 1, 1, 1, 1, '2025-09-19 11:59:47'),
(256, 1, 1, 1, 1, '2025-09-19 11:59:47'),
(257, 1, 1, 1, 1, '2025-09-19 11:59:47'),
(258, 1, 1, 1, 1, '2025-09-19 11:59:48'),
(259, 1, 1, 1, 1, '2025-09-19 11:59:48'),
(260, 1, 1, 1, 1, '2025-09-19 11:59:49'),
(261, 1, 1, 1, 1, '2025-09-19 11:59:49'),
(262, 1, 1, 1, 1, '2025-09-19 11:59:50'),
(263, 1, 1, 1, 1, '2025-09-19 11:59:50'),
(264, 1, 1, 1, 1, '2025-09-19 11:59:51'),
(265, 1, 1, 1, 1, '2025-09-19 11:59:51'),
(266, 1, 1, 1, 1, '2025-09-19 11:59:51'),
(267, 1, 1, 1, 1, '2025-09-19 11:59:52'),
(268, 1, 1, 1, 1, '2025-09-19 11:59:52'),
(269, 1, 1, 1, 1, '2025-09-19 11:59:53'),
(270, 1, 1, 1, 1, '2025-09-19 11:59:53'),
(271, 1, 1, 1, 1, '2025-09-19 11:59:54'),
(272, 1, 1, 1, 1, '2025-09-19 11:59:54'),
(273, 1, 1, 1, 1, '2025-09-19 11:59:55'),
(274, 1, 1, 1, 1, '2025-09-19 11:59:55'),
(275, 1, 1, 1, 1, '2025-09-19 11:59:55'),
(276, 1, 1, 1, 1, '2025-09-19 11:59:56'),
(277, 1, 1, 1, 1, '2025-09-19 11:59:56'),
(278, 1, 1, 1, 1, '2025-09-19 11:59:57'),
(279, 1, 1, 1, 1, '2025-09-19 11:59:57'),
(280, 1, 1, 1, 1, '2025-09-19 11:59:57'),
(281, 1, 1, 1, 1, '2025-09-19 11:59:58'),
(282, 1, 1, 1, 1, '2025-09-19 11:59:58'),
(283, 1, 1, 1, 1, '2025-09-19 11:59:59'),
(284, 1, 1, 1, 1, '2025-09-19 11:59:59'),
(285, 1, 1, 1, 1, '2025-09-19 12:00:00'),
(286, 1, 1, 1, 1, '2025-09-19 12:03:15'),
(287, 1, 1, 1, 1, '2025-09-19 12:03:24'),
(288, 1, 1, 1, 1, '2025-09-19 12:03:26'),
(289, 1, 1, 1, 1, '2025-09-19 12:03:33'),
(290, 1, 1, 1, 1, '2025-09-19 12:03:39'),
(291, 1, 1, 1, 1, '2025-09-19 12:03:55'),
(292, 1, 1, 1, 1, '2025-09-19 12:03:56'),
(293, 1, 1, 1, 1, '2025-09-19 12:03:56'),
(294, 1, 1, 1, 1, '2025-09-19 12:03:57'),
(295, 1, 1, 1, 1, '2025-09-19 12:03:57'),
(296, 1, 1, 1, 1, '2025-09-19 12:03:58'),
(297, 1, 1, 1, 1, '2025-09-19 12:03:58'),
(298, 1, 1, 1, 1, '2025-09-19 12:03:59'),
(299, 1, 1, 1, 1, '2025-09-19 12:03:59'),
(300, 1, 1, 1, 1, '2025-09-19 12:03:59'),
(301, 1, 1, 1, 1, '2025-09-19 12:04:00'),
(302, 1, 1, 1, 1, '2025-09-19 12:04:00'),
(303, 1, 1, 1, 1, '2025-09-19 12:04:01'),
(304, 1, 1, 1, 1, '2025-09-19 12:04:02'),
(305, 1, 1, 1, 1, '2025-09-19 12:04:02'),
(306, 1, 1, 1, 1, '2025-09-19 12:04:02'),
(307, 1, 1, 1, 1, '2025-09-19 12:04:03'),
(308, 1, 1, 1, 1, '2025-09-19 12:04:03'),
(309, 1, 1, 1, 1, '2025-09-19 12:04:04'),
(310, 1, 1, 1, 1, '2025-09-19 12:04:04'),
(311, 1, 1, 1, 1, '2025-09-19 12:04:04'),
(312, 1, 1, 1, 1, '2025-09-19 12:04:05'),
(313, 1, 1, 1, 1, '2025-09-19 12:04:05'),
(314, 1, 1, 1, 1, '2025-09-19 12:04:06'),
(315, 1, 1, 1, 1, '2025-09-19 12:04:06'),
(316, 1, 1, 1, 1, '2025-09-19 12:04:07'),
(317, 1, 1, 1, 1, '2025-09-19 12:04:07'),
(318, 1, 1, 1, 1, '2025-09-19 12:04:08'),
(319, 1, 1, 1, 1, '2025-09-19 12:04:08'),
(320, 1, 1, 1, 1, '2025-09-19 12:04:09'),
(321, 1, 1, 1, 1, '2025-09-19 12:04:09'),
(322, 1, 1, 1, 1, '2025-09-19 12:04:09'),
(323, 1, 1, 1, 1, '2025-09-19 12:04:10'),
(324, 1, 1, 1, 1, '2025-09-19 12:04:11'),
(325, 1, 1, 1, 1, '2025-09-19 12:04:11'),
(326, 1, 1, 1, 1, '2025-09-19 12:04:11'),
(327, 1, 1, 1, 1, '2025-09-19 12:04:12'),
(328, 1, 1, 1, 1, '2025-09-19 12:04:12'),
(329, 1, 1, 1, 1, '2025-09-19 12:04:13'),
(330, 1, 1, 1, 1, '2025-09-19 12:04:13'),
(331, 1, 1, 1, 1, '2025-09-19 12:04:13'),
(332, 1, 1, 1, 1, '2025-09-19 12:04:14'),
(333, 1, 1, 1, 1, '2025-09-19 12:04:14'),
(334, 1, 1, 1, 1, '2025-09-19 12:04:15'),
(335, 1, 1, 1, 1, '2025-09-19 12:04:15'),
(336, 1, 1, 1, 1, '2025-09-19 12:04:16'),
(337, 1, 1, 1, 1, '2025-09-19 12:04:16'),
(338, 1, 1, 1, 1, '2025-09-19 12:04:17'),
(339, 1, 1, 1, 1, '2025-09-19 12:04:17'),
(340, 1, 1, 1, 1, '2025-09-19 12:04:18'),
(341, 1, 1, 1, 1, '2025-09-19 12:04:18'),
(342, 1, 1, 1, 1, '2025-09-19 12:04:19'),
(343, 1, 1, 1, 1, '2025-09-19 12:04:19'),
(344, 1, 1, 1, 1, '2025-09-19 12:04:19'),
(345, 1, 1, 1, 1, '2025-09-19 12:04:20'),
(346, 1, 1, 1, 1, '2025-09-19 12:04:22'),
(347, 1, 1, 1, 1, '2025-09-19 12:04:23'),
(348, 1, 1, 1, 1, '2025-09-19 12:04:23'),
(349, 1, 1, 1, 1, '2025-09-19 12:04:24'),
(350, 1, 1, 1, 1, '2025-09-19 12:04:25'),
(351, 1, 1, 1, 1, '2025-09-19 12:04:25'),
(352, 1, 1, 1, 1, '2025-09-19 12:04:26'),
(353, 1, 1, 1, 1, '2025-09-19 12:04:26'),
(354, 1, 1, 1, 1, '2025-09-19 12:04:26'),
(355, 1, 1, 1, 1, '2025-09-19 12:04:27'),
(356, 1, 1, 1, 1, '2025-09-19 12:04:27'),
(357, 1, 1, 1, 1, '2025-09-19 12:04:28'),
(358, 1, 1, 1, 1, '2025-09-19 12:09:28'),
(359, 1, 1, 1, 1, '2025-09-19 12:09:29'),
(360, 1, 1, 1, 1, '2025-09-19 12:09:30'),
(361, 1, 1, 1, 1, '2025-09-19 12:09:44'),
(362, 1, 1, 1, 1, '2025-09-19 12:09:45'),
(363, 1, 1, 1, 1, '2025-09-19 12:09:45'),
(364, 1, 1, 1, 1, '2025-09-19 12:09:46'),
(365, 1, 1, 1, 1, '2025-09-19 12:09:46'),
(366, 1, 1, 1, 1, '2025-09-19 12:09:47'),
(367, 1, 1, 1, 1, '2025-09-19 12:09:47'),
(368, 1, 1, 1, 1, '2025-09-19 12:09:48'),
(369, 1, 1, 1, 1, '2025-09-19 12:09:48'),
(370, 1, 1, 1, 1, '2025-09-19 12:09:48'),
(371, 1, 1, 1, 1, '2025-09-19 12:09:49'),
(372, 1, 1, 1, 1, '2025-09-19 12:09:49'),
(373, 1, 1, 1, 1, '2025-09-19 12:09:50'),
(374, 1, 1, 1, 1, '2025-09-19 12:09:50'),
(375, 1, 1, 1, 1, '2025-09-19 12:09:51'),
(376, 1, 1, 1, 1, '2025-09-19 12:09:51'),
(377, 1, 1, 1, 1, '2025-09-19 12:09:52'),
(378, 1, 1, 1, 1, '2025-09-19 12:09:52'),
(379, 1, 1, 1, 1, '2025-09-19 12:09:53'),
(380, 1, 1, 1, 1, '2025-09-19 12:09:53'),
(381, 1, 1, 1, 1, '2025-09-19 12:11:24'),
(382, 1, 1, 1, 1, '2025-09-19 12:12:24'),
(383, 1, 1, 1, 1, '2025-09-19 12:13:25'),
(384, 1, 1, 1, 1, '2025-09-19 12:14:25'),
(385, 1, 1, 1, 1, '2025-09-19 12:15:26'),
(386, 1, 1, 1, 1, '2025-09-19 12:16:26'),
(387, 1, 1, 1, 1, '2025-09-19 12:25:15'),
(388, 1, 1, 1, 1, '2025-09-19 12:25:23'),
(389, 1, 1, 1, 1, '2025-09-19 12:25:29'),
(390, 1, 1, 1, 1, '2025-09-19 12:25:31'),
(391, 1, 1, 1, 1, '2025-09-19 12:26:06'),
(392, 1, 1, 1, 1, '2025-09-19 12:30:24'),
(393, 1, 1, 1, 1, '2025-09-19 12:30:25'),
(394, 1, 1, 1, 1, '2025-09-19 12:30:25'),
(395, 1, 1, 1, 1, '2025-09-19 12:30:25'),
(396, 1, 1, 1, 1, '2025-09-19 12:30:26'),
(397, 1, 1, 1, 1, '2025-09-19 12:30:26'),
(398, 1, 1, 1, 1, '2025-09-19 12:30:27'),
(399, 1, 1, 1, 1, '2025-09-19 12:30:27'),
(400, 1, 1, 1, 1, '2025-09-19 12:30:28'),
(401, 1, 1, 1, 1, '2025-09-19 12:30:28'),
(402, 1, 1, 1, 1, '2025-09-19 12:30:29'),
(403, 1, 1, 1, 1, '2025-09-19 12:30:29'),
(404, 1, 1, 1, 1, '2025-09-19 12:30:30'),
(405, 1, 1, 1, 1, '2025-09-19 12:35:54'),
(406, 1, 1, 1, 1, '2025-09-19 12:35:57'),
(407, 1, 1, 1, 1, '2025-09-19 12:36:02'),
(408, 1, 1, 1, 1, '2025-09-19 12:36:16'),
(409, 1, 1, 1, 1, '2025-09-19 12:36:20'),
(410, 1, 1, 1, 1, '2025-09-19 12:36:32'),
(411, 1, 1, 1, 1, '2025-09-19 12:37:22'),
(412, 1, 1, 1, 1, '2025-09-19 12:37:22'),
(413, 1, 1, 1, 1, '2025-09-19 12:37:23'),
(414, 1, 1, 1, 1, '2025-09-19 12:37:23'),
(415, 1, 1, 1, 1, '2025-09-19 12:37:24'),
(416, 1, 1, 1, 1, '2025-09-19 12:37:24'),
(417, 1, 1, 1, 1, '2025-09-19 12:37:25'),
(418, 1, 1, 1, 1, '2025-09-19 12:37:25'),
(419, 1, 1, 1, 1, '2025-09-19 12:37:25'),
(420, 1, 1, 1, 1, '2025-09-19 12:37:26'),
(421, 1, 1, 1, 1, '2025-09-19 12:37:26'),
(422, 1, 1, 1, 1, '2025-09-19 12:37:27'),
(423, 1, 1, 1, 1, '2025-09-19 12:37:27'),
(424, 1, 1, 1, 1, '2025-09-19 12:37:28'),
(425, 1, 1, 1, 1, '2025-09-19 12:37:28'),
(426, 1, 1, 1, 1, '2025-09-19 12:44:47'),
(427, 1, 1, 1, 1, '2025-09-19 12:45:09'),
(428, 1, 1, 1, 1, '2025-09-19 12:45:16'),
(429, 1, 1, 1, 1, '2025-09-19 12:45:29'),
(430, 1, 1, 1, 1, '2025-09-19 12:45:54'),
(431, 1, 1, 1, 1, '2025-09-19 12:47:24'),
(432, 1, 1, 1, 1, '2025-09-19 12:47:24'),
(433, 1, 1, 1, 1, '2025-09-19 12:47:25'),
(434, 1, 1, 1, 1, '2025-09-19 12:47:25'),
(435, 1, 1, 1, 1, '2025-09-19 12:47:25'),
(436, 1, 1, 1, 1, '2025-09-19 12:47:26'),
(437, 1, 1, 1, 1, '2025-09-19 12:47:26'),
(438, 1, 1, 1, 1, '2025-09-19 12:47:27'),
(439, 1, 1, 1, 1, '2025-09-19 12:47:27'),
(440, 1, 1, 1, 1, '2025-09-19 12:47:28'),
(441, 1, 1, 1, 1, '2025-09-19 12:47:28'),
(442, 1, 1, 1, 1, '2025-09-19 12:47:29'),
(443, 1, 1, 1, 1, '2025-09-19 12:47:29'),
(444, 1, 1, 1, 1, '2025-09-19 12:47:30'),
(445, 1, 1, 1, 1, '2025-09-19 12:47:30'),
(446, 1, 1, 1, 1, '2025-09-19 12:47:30'),
(447, 1, 1, 1, 1, '2025-09-19 12:47:31'),
(448, 1, 1, 1, 1, '2025-09-19 12:47:31'),
(449, 1, 1, 1, 1, '2025-09-19 12:47:32'),
(450, 1, 1, 1, 1, '2025-09-19 12:47:32'),
(451, 1, 1, 1, 1, '2025-09-19 12:47:33'),
(452, 1, 1, 1, 1, '2025-09-19 12:47:33'),
(453, 1, 1, 1, 1, '2025-09-19 12:47:34'),
(454, 1, 1, 1, 1, '2025-09-19 12:47:34'),
(455, 1, 1, 1, 1, '2025-09-19 12:47:35'),
(456, 1, 1, 1, 1, '2025-09-19 12:50:38'),
(457, 1, 1, 1, 1, '2025-09-19 12:50:43'),
(458, 1, 1, 1, 1, '2025-09-19 12:50:43'),
(459, 1, 1, 1, 1, '2025-09-19 12:50:44'),
(460, 1, 1, 1, 1, '2025-09-19 12:50:44'),
(461, 1, 1, 1, 1, '2025-09-19 12:50:45'),
(462, 1, 1, 1, 1, '2025-09-19 12:50:45'),
(463, 1, 1, 1, 1, '2025-09-19 12:50:46'),
(464, 1, 1, 1, 1, '2025-09-19 12:50:46'),
(465, 1, 1, 1, 1, '2025-09-19 12:50:47'),
(466, 1, 1, 1, 1, '2025-09-19 12:50:47'),
(467, 1, 1, 1, 1, '2025-09-19 12:50:47'),
(468, 1, 1, 1, 1, '2025-09-19 12:50:48'),
(469, 1, 1, 1, 1, '2025-09-19 12:50:48'),
(470, 1, 1, 1, 1, '2025-09-19 12:50:49'),
(471, 1, 1, 1, 1, '2025-09-19 12:50:49'),
(472, 1, 1, 1, 1, '2025-09-19 12:50:50'),
(473, 1, 1, 1, 1, '2025-09-19 12:53:01'),
(474, 1, 1, 1, 1, '2025-09-19 12:53:01'),
(475, 1, 1, 1, 1, '2025-09-19 12:53:01'),
(476, 1, 1, 1, 1, '2025-09-19 12:53:02'),
(477, 1, 1, 1, 1, '2025-09-19 12:53:02'),
(478, 1, 1, 1, 1, '2025-09-19 12:53:03'),
(479, 1, 1, 1, 1, '2025-09-19 12:53:03'),
(480, 1, 1, 1, 1, '2025-09-19 12:53:04'),
(481, 1, 1, 1, 1, '2025-09-19 12:53:04'),
(482, 1, 1, 1, 1, '2025-09-19 12:53:05'),
(483, 1, 1, 1, 1, '2025-09-19 12:53:05'),
(484, 1, 1, 1, 1, '2025-09-19 12:53:06'),
(485, 1, 1, 1, 1, '2025-09-19 12:53:06'),
(486, 1, 1, 1, 1, '2025-09-19 12:53:06'),
(487, 1, 1, 1, 1, '2025-09-19 12:58:48'),
(488, 1, 1, 1, 1, '2025-09-19 12:59:12'),
(489, 1, 1, 1, 1, '2025-09-19 12:59:13'),
(490, 1, 1, 1, 1, '2025-09-19 12:59:13'),
(491, 1, 1, 1, 1, '2025-09-19 12:59:14'),
(492, 1, 1, 1, 1, '2025-09-19 12:59:14'),
(493, 1, 1, 1, 1, '2025-09-19 12:59:15'),
(494, 1, 1, 1, 1, '2025-09-19 12:59:16'),
(495, 1, 1, 1, 1, '2025-09-19 12:59:16'),
(496, 1, 1, 1, 1, '2025-09-19 12:59:17'),
(497, 1, 1, 1, 1, '2025-09-19 12:59:17'),
(498, 1, 1, 1, 1, '2025-09-19 12:59:18'),
(499, 1, 1, 1, 1, '2025-09-19 12:59:18'),
(500, 1, 1, 1, 1, '2025-09-19 12:59:19'),
(501, 1, 1, 1, 1, '2025-09-19 13:09:29'),
(502, 1, 1, 1, 1, '2025-09-19 13:09:30'),
(503, 1, 1, 1, 1, '2025-09-19 13:09:31'),
(504, 1, 1, 1, 1, '2025-09-19 13:09:31'),
(505, 1, 1, 1, 1, '2025-09-19 13:09:32'),
(506, 1, 1, 1, 1, '2025-09-19 13:09:32'),
(507, 1, 1, 1, 1, '2025-09-19 13:09:32'),
(508, 1, 1, 1, 1, '2025-09-19 13:09:33'),
(509, 1, 1, 1, 1, '2025-09-19 13:09:33'),
(510, 1, 1, 1, 1, '2025-09-19 13:09:34'),
(511, 1, 1, 1, 1, '2025-09-19 13:09:34'),
(512, 1, 1, 1, 1, '2025-09-19 13:09:35'),
(513, 1, 1, 1, 1, '2025-09-19 13:11:06'),
(514, 1, 1, 1, 1, '2025-09-19 13:11:12'),
(515, 1, 1, 1, 1, '2025-09-19 13:11:23'),
(516, 1, 1, 1, 1, '2025-09-19 13:11:26'),
(517, 1, 1, 1, 1, '2025-09-19 13:11:30'),
(518, 1, 1, 1, 1, '2025-09-19 13:11:36'),
(519, 1, 1, 1, 1, '2025-09-19 13:11:49'),
(520, 1, 1, 1, 1, '2025-09-19 13:11:54'),
(521, 1, 1, 1, 1, '2025-09-19 13:12:08'),
(522, 1, 1, 1, 1, '2025-09-19 13:12:08'),
(523, 1, 1, 1, 1, '2025-09-19 13:12:08'),
(524, 1, 1, 1, 1, '2025-09-19 13:12:09'),
(525, 1, 1, 1, 1, '2025-09-19 13:12:09'),
(526, 1, 1, 1, 1, '2025-09-19 13:12:10'),
(527, 1, 1, 1, 1, '2025-09-19 13:12:11'),
(528, 1, 1, 1, 1, '2025-09-19 13:12:11'),
(529, 1, 1, 1, 1, '2025-09-19 13:12:11'),
(530, 1, 1, 1, 1, '2025-09-19 13:15:50'),
(531, 1, 1, 1, 1, '2025-09-19 13:15:52'),
(532, 1, 1, 1, 1, '2025-09-19 13:15:56'),
(533, 1, 1, 1, 1, '2025-09-19 13:16:00'),
(534, 1, 1, 1, 1, '2025-09-19 13:16:05'),
(535, 1, 1, 1, 1, '2025-09-19 13:16:23'),
(536, 1, 1, 1, 1, '2025-09-19 13:16:23'),
(537, 1, 1, 1, 1, '2025-09-19 13:16:23'),
(538, 1, 1, 1, 1, '2025-09-19 13:16:24'),
(539, 1, 1, 1, 1, '2025-09-19 13:16:25'),
(540, 1, 1, 1, 1, '2025-09-19 13:16:25'),
(541, 1, 1, 1, 1, '2025-09-19 13:16:26'),
(542, 1, 1, 1, 1, '2025-09-19 13:16:26'),
(543, 1, 1, 1, 1, '2025-09-19 13:16:27'),
(544, 1, 1, 1, 1, '2025-09-19 13:16:27'),
(545, 1, 1, 1, 1, '2025-09-19 13:16:28'),
(546, 1, 1, 1, 1, '2025-09-19 13:18:15'),
(547, 1, 1, 1, 1, '2025-09-19 13:18:20'),
(548, 1, 1, 1, 1, '2025-09-19 13:18:27'),
(549, 1, 1, 1, 1, '2025-09-19 13:18:36'),
(550, 1, 1, 1, 1, '2025-09-19 13:18:43'),
(551, 1, 1, 1, 1, '2025-09-19 13:19:17'),
(552, 1, 1, 1, 1, '2025-09-19 13:19:30'),
(553, 1, 1, 1, 1, '2025-09-19 13:19:31'),
(554, 1, 1, 1, 1, '2025-09-19 13:19:31'),
(555, 1, 1, 1, 1, '2025-09-19 13:19:32'),
(556, 1, 1, 1, 1, '2025-09-19 13:19:32'),
(557, 1, 1, 1, 1, '2025-09-19 13:19:33'),
(558, 1, 1, 1, 1, '2025-09-19 13:19:33'),
(559, 1, 1, 1, 1, '2025-09-19 13:19:34'),
(560, 1, 1, 1, 1, '2025-09-19 13:19:34'),
(561, 1, 1, 1, 1, '2025-09-19 13:24:06'),
(562, 1, 1, 1, 1, '2025-09-19 13:24:11'),
(563, 1, 1, 1, 1, '2025-09-19 13:24:25'),
(564, 1, 1, 1, 1, '2025-09-19 13:24:32'),
(565, 1, 1, 1, 1, '2025-09-19 13:24:40'),
(566, 1, 1, 1, 1, '2025-09-19 13:44:48'),
(567, 1, 1, 1, 1, '2025-09-19 13:44:50'),
(568, 1, 1, 1, 1, '2025-09-19 13:44:59'),
(569, 1, 1, 1, 1, '2025-09-19 13:45:02'),
(570, 1, 1, 1, 1, '2025-09-19 13:45:03'),
(571, 1, 1, 1, 1, '2025-09-19 14:05:26'),
(572, 1, 1, 1, 1, '2025-09-19 14:11:47'),
(573, 1, 1, 1, 1, '2025-09-19 14:11:47'),
(574, 1, 1, 1, 1, '2025-09-19 14:11:48'),
(575, 1, 1, 1, 1, '2025-09-19 14:11:48'),
(576, 1, 1, 1, 1, '2025-09-19 14:11:49'),
(577, 1, 1, 1, 1, '2025-09-19 14:11:49'),
(578, 1, 1, 1, 1, '2025-09-19 14:11:50'),
(579, 1, 1, 1, 1, '2025-09-19 14:11:50'),
(580, 1, 1, 1, 1, '2025-09-19 14:11:50'),
(581, 1, 1, 1, 1, '2025-09-19 14:11:51'),
(582, 1, 1, 1, 1, '2025-09-19 14:11:51'),
(583, 1, 1, 1, 1, '2025-09-19 14:11:52'),
(584, 1, 1, 1, 1, '2025-09-19 14:11:52'),
(585, 1, 1, 1, 1, '2025-09-19 14:11:53'),
(586, 1, 1, 1, 1, '2025-09-19 14:11:53'),
(587, 1, 1, 1, 1, '2025-09-19 14:11:53'),
(588, 1, 1, 1, 1, '2025-09-19 14:11:54'),
(589, 1, 1, 1, 1, '2025-09-19 14:11:54'),
(590, 1, 1, 1, 1, '2025-09-19 14:11:55'),
(591, 1, 1, 1, 1, '2025-09-19 14:11:55'),
(592, 1, 1, 1, 1, '2025-09-19 14:11:56'),
(593, 1, 1, 1, 1, '2025-09-19 14:11:56'),
(594, 1, 1, 1, 1, '2025-09-19 14:18:20'),
(595, 1, 1, 1, 1, '2025-09-19 14:19:20'),
(596, 1, 1, 1, 1, '2025-09-19 14:20:21'),
(597, 1, 1, 1, 1, '2025-09-19 14:21:24'),
(598, 1, 1, 1, 1, '2025-09-19 14:24:36'),
(599, 1, 1, 1, 1, '2025-09-19 14:25:37'),
(600, 1, 1, 1, 1, '2025-09-19 14:29:06'),
(601, 1, 1, 1, 1, '2025-09-19 14:32:45'),
(602, 1, 1, 1, 1, '2025-09-19 14:33:16'),
(603, 1, 1, 1, 1, '2025-09-19 14:33:16'),
(604, 1, 1, 1, 1, '2025-09-19 14:33:17'),
(605, 1, 1, 1, 1, '2025-09-19 14:33:17'),
(606, 1, 1, 1, 1, '2025-09-19 14:33:18'),
(607, 1, 1, 1, 1, '2025-09-19 14:33:18'),
(608, 1, 1, 1, 1, '2025-09-19 14:33:18'),
(609, 1, 1, 1, 1, '2025-09-19 14:33:49'),
(610, 1, 1, 1, 1, '2025-09-19 14:33:50'),
(611, 1, 1, 1, 1, '2025-09-19 14:33:50'),
(612, 1, 1, 1, 1, '2025-09-19 14:34:20'),
(613, 1, 1, 1, 1, '2025-09-19 14:34:21'),
(614, 1, 1, 1, 1, '2025-09-19 14:34:52'),
(615, 1, 1, 1, 1, '2025-09-19 14:35:22'),
(616, 1, 1, 1, 1, '2025-09-19 14:36:23'),
(617, 1, 1, 1, 1, '2025-09-19 14:37:50'),
(618, 1, 1, 1, 1, '2025-09-19 14:38:21'),
(619, 1, 1, 1, 1, '2025-09-19 14:38:21'),
(620, 1, 1, 1, 1, '2025-09-19 14:38:22'),
(621, 1, 1, 1, 1, '2025-09-19 14:38:22'),
(622, 1, 1, 1, 1, '2025-09-19 14:38:23'),
(623, 1, 1, 1, 1, '2025-09-19 14:38:23'),
(624, 1, 1, 1, 1, '2025-09-19 14:38:24'),
(625, 1, 1, 1, 1, '2025-09-19 14:44:11'),
(626, 1, 1, 1, 1, '2025-09-19 14:46:06'),
(627, 1, 1, 1, 1, '2025-09-19 14:47:50'),
(628, 1, 1, 1, 1, '2025-09-19 14:48:51'),
(629, 1, 1, 1, 1, '2025-09-19 14:49:52'),
(630, 1, 1, 1, 1, '2025-09-19 14:50:52'),
(631, 1, 1, 1, 1, '2025-09-19 14:51:53'),
(632, 1, 1, 1, 1, '2025-09-19 14:52:53'),
(633, 1, 1, 1, 1, '2025-09-19 15:10:35'),
(634, 1, 1, 1, 1, '2025-09-19 15:11:36'),
(635, 1, 1, 1, 1, '2025-09-19 15:12:37'),
(636, 1, 1, 1, 1, '2025-09-19 15:13:38'),
(637, 1, 1, 1, 1, '2025-09-19 15:14:38'),
(638, 1, 1, 1, 1, '2025-09-19 15:15:39'),
(639, 1, 1, 1, 1, '2025-09-19 15:23:11'),
(640, 1, 1, 1, 1, '2025-09-19 15:23:18'),
(641, 1, 1, 1, 1, '2025-09-19 15:31:25'),
(642, 1, 1, 1, 1, '2025-09-19 15:32:04'),
(643, 1, 1, 1, 1, '2025-09-19 15:32:40'),
(644, 1, 1, 1, 1, '2025-09-19 15:34:27'),
(645, 1, 1, 1, 1, '2025-09-19 15:40:17'),
(646, 1, 1, 1, 1, '2025-09-19 15:47:54'),
(647, 1, 1, 1, 1, '2025-09-19 15:48:57'),
(648, 1, 1, 1, 1, '2025-09-19 15:53:38'),
(649, 1, 1, 1, 1, '2025-09-19 15:54:40'),
(650, 1, 1, 1, 1, '2025-09-19 15:55:41'),
(651, 1, 1, 1, 1, '2025-09-19 15:56:42'),
(652, 1, 1, 1, 1, '2025-09-19 15:57:43'),
(653, 1, 1, 1, 1, '2025-09-19 15:58:44'),
(654, 1, 1, 1, 1, '2025-09-19 16:03:25'),
(655, 1, 1, 1, 1, '2025-09-19 16:04:26'),
(656, 1, 1, 1, 1, '2025-09-19 16:05:27'),
(657, 1, 1, 1, 1, '2025-09-19 16:06:28'),
(658, 1, 1, 1, 1, '2025-09-19 16:07:29'),
(659, 1, 1, 1, 1, '2025-09-19 16:08:30'),
(660, 1, 1, 1, 1, '2025-09-19 16:09:30'),
(661, 1, 1, 1, 1, '2025-09-19 16:20:49'),
(662, 1, 1, 1, 4, '2025-09-19 16:42:12'),
(663, 1, 1, 1, 4, '2025-09-19 16:50:17'),
(664, 1, 1, 1, 1, '2025-09-19 18:46:26'),
(665, 1, 1, 1, 1, '2025-09-19 18:46:26'),
(666, 1, 1, 1, 1, '2025-09-19 18:46:27'),
(667, 1, 1, 1, 1, '2025-09-19 18:46:27'),
(668, 1, 1, 1, 1, '2025-09-19 18:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `water_tanks`
--

CREATE TABLE `water_tanks` (
  `TankID` int(11) NOT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `CurrentLevel` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `finance_summary`
--
DROP TABLE IF EXISTS `finance_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `finance_summary`  AS SELECT `fb`.`BlockID` AS `BlockID`, `fb`.`BlockIndex` AS `BlockIndex`, `fb`.`Timestamp` AS `BlockTimestamp`, `fb`.`Hash` AS `BlockHash`, `fb`.`PreviousHash` AS `PreviousHash`, `fb`.`Proof` AS `Proof`, `fr`.`RecordID` AS `RecordID`, `ft`.`TransactionID` AS `TransactionID`, `ft`.`SponsorID` AS `SponsorID`, `ft`.`ClientID` AS `ClientID`, `ft`.`Amount` AS `Amount`, `ft`.`Party` AS `Party`, `ft`.`TxType` AS `TxType`, `ft`.`Timestamp` AS `TxTimestamp`, `fr`.`TxHash` AS `TxHash` FROM ((`finance_blocks` `fb` join `finance_records` `fr` on(`fb`.`BlockID` = `fr`.`BlockID`)) join `financial_transactions` `ft` on(`fr`.`TransactionID` = `ft`.`TransactionID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `fk_audit_admin` (`AdminID`);

--
-- Indexes for table `blockchain_records`
--
ALTER TABLE `blockchain_records`
  ADD PRIMARY KEY (`RecordID`),
  ADD KEY `fk_blockchain_records_block` (`BlockID`),
  ADD KEY `fk_blockchain_records_dispense` (`TransactionID`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`BlockID`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`BlogID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- Indexes for table `clientapplications`
--
ALTER TABLE `clientapplications`
  ADD PRIMARY KEY (`ClientAppID`),
  ADD KEY `fk_client_application` (`ApplicationID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `dispense_logs`
--
ALTER TABLE `dispense_logs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AttendantID` (`AttendantID`);

--
-- Indexes for table `finance_blocks`
--
ALTER TABLE `finance_blocks`
  ADD PRIMARY KEY (`BlockID`);

--
-- Indexes for table `finance_records`
--
ALTER TABLE `finance_records`
  ADD PRIMARY KEY (`RecordID`),
  ADD KEY `BlockID` (`BlockID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD PRIMARY KEY (`TransactionID`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`InquiryID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `roleapplications`
--
ALTER TABLE `roleapplications`
  ADD PRIMARY KEY (`ApplicationID`),
  ADD UNIQUE KEY `unique_request` (`UserID`,`RoleRequested`,`Status`);

--
-- Indexes for table `sponsorapplications`
--
ALTER TABLE `sponsorapplications`
  ADD PRIMARY KEY (`SponsorAppID`),
  ADD KEY `fk_sponsor_application` (`ApplicationID`);

--
-- Indexes for table `sponsorships`
--
ALTER TABLE `sponsorships`
  ADD PRIMARY KEY (`SponsorID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transaction_links`
--
ALTER TABLE `transaction_links`
  ADD PRIMARY KEY (`LinkID`),
  ADD KEY `TransactionID` (`TransactionID`),
  ADD KEY `SponsorID` (`SponsorID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `QRCode` (`QRCode`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `water_dispenses`
--
ALTER TABLE `water_dispenses`
  ADD PRIMARY KEY (`DispenseID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `SponsorID` (`SponsorID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `water_tanks`
--
ALTER TABLE `water_tanks`
  ADD PRIMARY KEY (`TankID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `blockchain_records`
--
ALTER TABLE `blockchain_records`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=629;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `BlockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `BlogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clientapplications`
--
ALTER TABLE `clientapplications`
  MODIFY `ClientAppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dispense_logs`
--
ALTER TABLE `dispense_logs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_blocks`
--
ALTER TABLE `finance_blocks`
  MODIFY `BlockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `finance_records`
--
ALTER TABLE `finance_records`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `InquiryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roleapplications`
--
ALTER TABLE `roleapplications`
  MODIFY `ApplicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sponsorapplications`
--
ALTER TABLE `sponsorapplications`
  MODIFY `SponsorAppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sponsorships`
--
ALTER TABLE `sponsorships`
  MODIFY `SponsorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_links`
--
ALTER TABLE `transaction_links`
  MODIFY `LinkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `water_dispenses`
--
ALTER TABLE `water_dispenses`
  MODIFY `DispenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=669;

--
-- AUTO_INCREMENT for table `water_tanks`
--
ALTER TABLE `water_tanks`
  MODIFY `TankID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_admin` FOREIGN KEY (`AdminID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `blockchain_records`
--
ALTER TABLE `blockchain_records`
  ADD CONSTRAINT `fk_blockchain_records_block` FOREIGN KEY (`BlockID`) REFERENCES `blocks` (`BlockID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_blockchain_records_dispense` FOREIGN KEY (`TransactionID`) REFERENCES `water_dispenses` (`DispenseID`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `clientapplications`
--
ALTER TABLE `clientapplications`
  ADD CONSTRAINT `fk_client_application` FOREIGN KEY (`ApplicationID`) REFERENCES `roleapplications` (`ApplicationID`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `dispense_logs`
--
ALTER TABLE `dispense_logs`
  ADD CONSTRAINT `dispense_logs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `dispense_logs_ibfk_2` FOREIGN KEY (`AttendantID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `finance_records`
--
ALTER TABLE `finance_records`
  ADD CONSTRAINT `finance_records_ibfk_1` FOREIGN KEY (`BlockID`) REFERENCES `finance_blocks` (`BlockID`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_records_ibfk_2` FOREIGN KEY (`TransactionID`) REFERENCES `financial_transactions` (`TransactionID`) ON DELETE CASCADE;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `sponsorapplications`
--
ALTER TABLE `sponsorapplications`
  ADD CONSTRAINT `fk_sponsor_application` FOREIGN KEY (`ApplicationID`) REFERENCES `roleapplications` (`ApplicationID`) ON DELETE CASCADE;

--
-- Constraints for table `sponsorships`
--
ALTER TABLE `sponsorships`
  ADD CONSTRAINT `sponsorships_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `transaction_links`
--
ALTER TABLE `transaction_links`
  ADD CONSTRAINT `transaction_links_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`),
  ADD CONSTRAINT `transaction_links_ibfk_2` FOREIGN KEY (`SponsorID`) REFERENCES `sponsorships` (`SponsorID`),
  ADD CONSTRAINT `transaction_links_ibfk_3` FOREIGN KEY (`ClientID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `water_dispenses`
--
ALTER TABLE `water_dispenses`
  ADD CONSTRAINT `water_dispenses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `water_dispenses_ibfk_2` FOREIGN KEY (`SponsorID`) REFERENCES `sponsorships` (`SponsorID`),
  ADD CONSTRAINT `water_dispenses_ibfk_3` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Constraints for table `water_tanks`
--
ALTER TABLE `water_tanks`
  ADD CONSTRAINT `water_tanks_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
