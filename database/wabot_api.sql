-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2025 at 08:40 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wabot_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `whatsapp_id` varchar(50) NOT NULL,
  `profile_picture` text,
  `is_business` tinyint(1) DEFAULT '0',
  `status` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(1205, 'Teddy Setiaji', '6285814367500', '6285814367500@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/305648718_212557737772110_1104750599570266295_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEcj6fJ2R7OfUVTN37sX5nS92pieQLQVEdk3x5g22m1xQ&oe=6877D67A&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:15:41', '2025-07-06 17:15:41'),
(1206, 'mamah gigit', '6289658070483', '6289658070483@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:41', '2025-07-06 17:15:41'),
(1207, 'cunil', '6289649156888', '6289649156888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401593_959040522400708_3656166492101800429_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEW88nnYE7U7NnCUELXb64o7tH81PW2YHfh67HQ4Hdqhg&oe=6877DE12&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:15:42', '2025-07-06 17:15:42'),
(1208, 'Jepri', '6283824283741', '6283824283741@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437492076_413383821615996_1467199917532477650_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGRM7BRM0g2natJAC-09WQD7SiFrMaPRDwY-idkSTnQ3g&oe=6877B3D6&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:15:42', '2025-07-06 17:15:42'),
(1209, 'Abubakar oxygen', '6287887084502', '6287887084502@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:42', '2025-07-06 17:15:42'),
(1210, 'Agus Karyo PT YAU', '6288217282901', '6288217282901@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455307745_573726741915664_5847330279790714803_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEbhZEeSBKjGxAivjv4zuXKFu53zjXAqqjcCoYcTzIe8w&oe=6877C571&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:15:43', '2025-07-06 17:15:43'),
(1211, 'windi', '235810985091195', '235810985091195@lid', NULL, 0, '', '2025-07-06 17:15:43', '2025-07-06 17:15:43'),
(1212, 'Muhidin vimala', '6281286095734', '6281286095734@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505567121_1383602412755223_5511277691847045413_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFTSfOAxNjG5ZraV_a7b4p51V4ashFPji7VztJiyX6ghw&oe=6877CBAD&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:43', '2025-07-06 17:15:43'),
(1213, 'smart tungky', '628159210608', '628159210608@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/486786106_2084940958641700_7787869175897432422_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFlFePWwWhlxjdUZNZDDD1v7NhusU49yH59sTsXnqlUrw&oe=6877DBCC&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:44', '2025-07-06 17:15:44'),
(1214, 'Taufik vvimala', '6289638272456', '6289638272456@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:44', '2025-07-06 17:15:44'),
(1215, 'Mas Makhi', '6281315990566', '6281315990566@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397471_878394270917873_4869443712590850767_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGGmvbtDXmusQOD6sVPumJFMkFoDj3eUFwRQPiuqwJn-g&oe=6877C6B7&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:15:44', '2025-07-06 17:15:44'),
(1216, 'SDM Keluarga Harapan', '6289669446141', '6289669446141@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505476530_1226820845314862_8511554733817992105_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGfvBduKVMaTeAjgLJwGUDh_oIqFb8tDDuOc7r9nH1Rg&oe=6877C691&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:15:45', '2025-07-06 17:15:45'),
(1217, 'Ratna vimala', '6289608784579', '6289608784579@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/456296917_1026068885859294_6633257433526824410_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEataS0FzZa_5DfwdxS-TQkpx5pob0ieP1FmKJ-rnZkIg&oe=6877E106&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:15:45', '2025-07-06 17:29:41'),
(1218, 'Rani Aryanty kp.rawa', '6281318046662', '6281318046662@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/460324533_554655273738793_2015634258647518170_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGovWKYh495Z-UB7Z7x6hcvl5PNG7ddtRm-sXb77cGEGg&oe=6877CCB6&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:15:45', '2025-07-06 17:15:45'),
(1219, 'Asep Bu ifah', '6285143521361', '6285143521361@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454356558_3740951079449996_7669982831283813923_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHG-zAgwifk2Nd5Ue81BK4aFr2hdUKeHfAQXaONMFGFDQ&oe=6877C030&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:15:46', '2025-07-06 17:15:46'),
(1220, 'Syafaaaaa', '6285780571417', '6285780571417@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:46', '2025-07-06 17:15:46'),
(1221, 'SWR ANUNG', '6285220312211', '6285220312211@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/436803734_1036355054509430_2763470821242045065_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG2YCfbMlOz5wTjGAzmqtiPYvEhQdnbL1Cf3Xh2mNpXhQ&oe=6877B128&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:15:46', '2025-07-06 17:15:46'),
(1222, 'Satria A.K.A Thakee', '6281298295322', '6281298295322@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/70422075_2899354026958003_1626688498104157453_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH1FoI00EhAp8RmkjGmDveozGG5Zbn7slQcFWIi27gx-w&oe=6877C339&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:15:47', '2025-07-06 17:15:47'),
(1223, 'dedik bromo', '6282232838100', '6282232838100@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:47', '2025-07-06 17:15:47'),
(1224, 'pc cibinong', '628569900450', '628569900450@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468592001_1124336302660971_6859132228701463547_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHknOJNP-jYCqYGfHHsqV08Cs_thLZ0PGh54duI-YMhiQ&oe=6877D088&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:15:48', '2025-07-06 17:15:48'),
(1225, 'mas rofik tetra', '6288214501348', '6288214501348@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/328139625_849602949431797_662588968310254202_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE8E33QU3tgDp8p_IzeBVupOOeOWiW-1UAYRMnwj6WD7g&oe=6877C3D4&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:15:48', '2025-07-06 17:15:48'),
(1226, 'ziaska net', '6285211677776', '6285211677776@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/489523902_670666075675584_1341680524420590121_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGgbaAta7BRYAgjMP_W4IHX1XuabWLtEX04WMTBitgDrQ&oe=6877B30E&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:15:48', '2025-07-06 17:15:48'),
(1227, 'fajar sd', '628999551157', '628999551157@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:49', '2025-07-06 17:15:49'),
(1228, 'ari consina', '6285781184909', '6285781184909@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/507987279_653436361048992_7658989016861959905_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGV2uL-39PiIcx3dXyk8y1VUM9Ebjt2gumtjw9PD6jHYA&oe=6877B158&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:15:49', '2025-07-06 17:15:49'),
(1229, 'vila gadog dipo', '6281293779958', '6281293779958@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:49', '2025-07-06 17:15:49'),
(1230, 'yuli st kuning', '6287870253827', '6287870253827@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:50', '2025-07-06 17:15:50'),
(1231, 'kang yudi las', '6283819812485', '6283819812485@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/471431650_622771563645280_5090311049046897072_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG7wUBKYU7rvp7cgDSEjlFPQTExVelRMqIcOZ-VRqDn0Q&oe=6877CD42&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:15:50', '2025-07-06 17:15:50'),
(1232, 'kost kenari ciheulet', '6283891813330', '6283891813330@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:50', '2025-07-06 17:15:50'),
(1233, 'JNE KURIR Muhamad Fikri Priyadi', '6288219761995', '6288219761995@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:51', '2025-07-06 17:15:51'),
(1234, 'rak', '6281282150330', '6281282150330@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437909535_1072516453814029_3092575941218110629_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEenSUkqWR8QGSkJ3OgPNuMl-tBx_vbk2YotR2iJzCi8w&oe=6877BE9F&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:51', '2025-07-06 17:15:51'),
(1235, 'sandi kubang', '6281295627526', '6281295627526@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878509_1205666301027361_9071554081614001054_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFM2AlWMq_Oq-nFCNY7W4x71u_kQdraSVvdVsTlnEhjVQ&oe=6877DC87&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:15:51', '2025-07-06 17:15:51'),
(1236, 'Julfrianus Sitepu GOLF', '6285158846581', '6285158846581@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/486687515_1143021884266738_223590076820033471_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHZQyFdYO0--_hLKNHdnR4hBLr6jJZH-N54XuekxRn1sg&oe=6877B665&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:15:52', '2025-07-06 17:15:52'),
(1237, 'bu erni pa dudung', '6288212030164', '6288212030164@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872075_1238707464312340_2701039906592903598_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH-iOv2LaEaFUXwDdqyUKr7zJ-zsV4MF9hSdD0IdTb9ng&oe=6877DF6F&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:15:52', '2025-07-06 17:29:48'),
(1238, 'Sofi Sparta Computindo', '6287772727379', '6287772727379@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/487884586_2153297091770192_7303594679290989556_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGfkB-ZX6uvvdKv5VMITLwDNjoudtyvszYpmC0x8t8epQ&oe=6877C893&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:15:53', '2025-07-06 17:15:53'),
(1239, 'ben hardi mugen', '6281291354695', '6281291354695@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399856_623675797094886_7948713076617966003_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFxorsCwugQJngqIH6MHgrh8fZawauBZUD7M9OZPyxl_w&oe=6877D8DB&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:53', '2025-07-06 17:15:53'),
(1240, 'hikevision sukasari', '6282299467547', '6282299467547@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:53', '2025-07-06 17:15:53'),
(1241, 'ss', '6287872021811', '6287872021811@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/460849594_961153445828821_2414531611119194545_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHgQ3vcnsgvn-xEL-xKMrKwqj1ofbOlrjlXoTfRlVPZ0Q&oe=6877C4AC&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:15:54', '2025-07-06 17:15:54'),
(1242, 'sonet', '6281510876525', '6281510876525@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:54', '2025-07-06 17:15:54'),
(1243, 'ss 1', '6281584187772', '6281584187772@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:55', '2025-07-06 17:15:55'),
(1244, 'prima freshmart', '6287770001107', '6287770001107@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:55', '2025-07-06 17:15:55'),
(1245, 'tika aktif 2', '6287887858700', '6287887858700@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:55', '2025-07-06 17:15:55'),
(1246, 'toko kabel sinar jaya', '6281315300834', '6281315300834@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:56', '2025-07-06 17:15:56'),
(1247, 'sofyan jci', '628129459536', '628129459536@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868729_557618610727229_43716086662824701_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEnZNJWE_12qO4nc0ezII6UqM9UVMRmxA6GEC430NbFNw&oe=6877DD96&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:15:56', '2025-07-06 17:15:56'),
(1248, 'VEGA VMALA', '62895393634803', '62895393634803@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:56', '2025-07-06 17:15:56'),
(1249, 'monitor depok', '6285159206776', '6285159206776@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455163835_527959809903785_2849404059205032979_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF18q2lEzGSseXO0avKBrIQ5rNup-dWOZ5qFtFm0_eVsg&oe=6877DF4D&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:57', '2025-07-06 17:29:52'),
(1250, 'Wulan Rizqita Bona', '52884217561091', '52884217561091@lid', NULL, 0, '', '2025-07-06 17:15:57', '2025-07-06 17:15:57'),
(1251, 'septi JCI New', '6281212100558', '6281212100558@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:15:57', '2025-07-06 17:15:57'),
(1252, 'kmi buendang', '628811280966', '628811280966@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397759_514935541036479_6231361920055262830_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG1z-49ZFMLJ_k5zR8nGxYQhfFME47_CuhyjutI3jbGpA&oe=6877CD61&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:15:58', '2025-07-06 17:15:58'),
(1253, 'Muhammad Nu\'man Nulhakim', '6281617474769', '6281617474769@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/438174884_491199836713891_445830441003182210_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGOoUtXBBT-GFOInlh5tSRANDKYKvRn7CjDuRFTLEPiSA&oe=6877DE25&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:15:58', '2025-07-06 17:15:58'),
(1254, 'A mul jkt', '233607700467794', '233607700467794@lid', NULL, 0, '', '2025-07-06 17:15:58', '2025-07-06 17:15:58'),
(1255, 'leli', '6289683007656', '6289683007656@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508602091_1230126878603346_4892796112023257866_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGFTpYPgbHFnjR0ECJlgvyarB1ipt8kYpQOq0y7-mUfeA&oe=6877D78F&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:15:59', '2025-07-06 17:15:59'),
(1256, 'ade jaro', '6281266841888', '6281266841888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/399873321_893699539604872_4159492412972523723_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEYSSRfzLMZCZWBk_CIm8OWPC87yj6VKQxxQp_Tw_FzQw&oe=6877BD30&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:15:59', '2025-07-06 17:15:59'),
(1257, 'Kaos polos Citereup', '6282111624758', '6282111624758@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/489426178_533870899434045_8426555318041890326_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFs0AmsTnLkUZPLGXvu-igQLL70gs3qE-Fkr18nEQBGVQ&oe=6877CA4E&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:00', '2025-07-06 17:16:00'),
(1258, 'andrew production', '6281332172276', '6281332172276@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473393369_3155889457882776_5543448339553531223_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG8immz_bWXqR67rUlPcFFw_IP8pg3lKCN2dPMtxPKXFw&oe=6877BD49&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:00', '2025-07-06 17:16:00'),
(1259, 'Caaii alkai', '6281349195206', '6281349195206@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:00', '2025-07-06 17:16:00'),
(1260, 'Dika Danil', '62895365057875', '62895365057875@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491873596_1225113722138057_1441079289248228532_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGqMcZ90ZfSP782-wSLXrJZelT5nS6QW_A8kcPNv5ZVlg&oe=6877D0A1&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:01', '2025-07-06 17:16:01'),
(1261, 'reika adik susan', '6281353504710', '6281353504710@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:01', '2025-07-06 17:16:01'),
(1262, 'Bapa Haji oman', '6282120468844', '6282120468844@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/421055022_1521611071790645_3479859554167183391_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG9z1lYhjDBOt65qeuQ_N1TG-i4gkekCwEvD7EN4aGBaA&oe=6877BE89&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:01', '2025-07-06 17:16:01'),
(1263, 'jenal', '6289698492406', '6289698492406@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/346191480_1456625051812300_4547837917036924927_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFfzhaHhfx4Ia7N2-uv_4RHQ5DsWUKvPQJSD3j3bqwxAg&oe=6877D9EF&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:02', '2025-07-06 17:16:02'),
(1264, 'KMI Oktaviani', '6281282327457', '6281282327457@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:02', '2025-07-06 17:16:02'),
(1265, 'Kadus cipayung Ali', '6289524827887', '6289524827887@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425606716_7268773396540261_493587804843266343_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE-DZ63v0z1GPnY2fx2Xl4EmZzxeMVM7p1Vt5Zc3jDLyg&oe=6877C1C8&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:02', '2025-07-06 17:16:02'),
(1266, 'Riyan San Beler', '6285813582989', '6285813582989@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875915_643582748719728_3683639750400008186_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFWAZ6u5ZBvjNKEjnfxZT4TulslQnjE00th6mETxvn4Vg&oe=6877D6C5&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:03', '2025-07-06 17:16:03'),
(1267, 'bu hany pkmb SMK', '6285772627674', '6285772627674@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872157_1714053542524088_2345805579066363309_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF4CoWeNLnk2tbwuDYc9pHn51uIHlEOc98q88ELylctRQ&oe=6877C106&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:03', '2025-07-06 17:16:03'),
(1268, 'ustad rahman', '6289638304212', '6289638304212@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/470776579_1793424018156803_3159141162402090778_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEzE_N5VGguJVst5W1AnfZqyQhRuy-JSFJPgQ7RDqdSBg&oe=6877DBFA&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:03', '2025-07-06 17:16:03'),
(1269, 'aki tokped', '6281388222278', '6281388222278@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/222091661_399457401700058_2884571179214375068_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHn1LSjWz8NHaaExnzo6gYNLcmSU68-ntiFmKPIu7AMZA&oe=6877BD1B&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:16:04', '2025-07-06 17:16:04'),
(1270, 'yyy', '62895617703271', '62895617703271@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:04', '2025-07-06 17:16:04'),
(1271, 'bona kamra', '6283811995999', '6283811995999@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491843243_1276685434460538_1910467452865981065_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGH99F8LK_8ixZzldyrHJwENnT7m9mCLyeq-MywqfmG4g&oe=6877AD1B&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:05', '2025-07-06 17:16:05'),
(1272, 'Rena', '135098229907613', '135098229907613@lid', NULL, 0, '', '2025-07-06 17:16:05', '2025-07-06 17:16:05'),
(1273, 'bangjuri', '6282122223730', '6282122223730@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:05', '2025-07-06 17:16:05'),
(1274, 'YANA IT RSPG', '62818482460', '62818482460@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:06', '2025-07-06 17:16:06'),
(1275, 'made si', '6285717336070', '6285717336070@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:06', '2025-07-06 17:16:06'),
(1276, 'Raja adung', '62895392953706', '62895392953706@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/509670351_1497078317937169_1289127419498421121_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEP6yBcZmt4r2hcuIuHm9kQ-Is70cXJBjWupBGPHjUVmQ&oe=6877DF36&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:07', '2025-07-06 17:30:01'),
(1277, 'Ricky ASNET', '145380398346445', '145380398346445@lid', NULL, 0, '', '2025-07-06 17:16:07', '2025-07-06 17:16:07'),
(1278, 'dyana be', '6282211173997', '6282211173997@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:07', '2025-07-06 17:16:07'),
(1279, 'teh dewi', '6285772325600', '6285772325600@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:08', '2025-07-06 17:16:08'),
(1280, 'WA AMUNG', '6289604317197', '6289604317197@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875086_1455294842154161_4564961264924153536_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE__MOC1JihBKyoJIimjK8bWuKjZdInOkT89JRj7r5Dsg&oe=6877B73E&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:08', '2025-07-06 17:16:08'),
(1281, 'sewa fo jakbar', '62816773222', '62816773222@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/71401423_306533000313136_1680851925959452315_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHbs_Qg9rLPSGcB6Yj76jVoSnIeZ2RxlCBrRki4d1QI8Q&oe=6877B3B7&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:09', '2025-07-06 17:16:09'),
(1282, 'Toto Budiyanto', '6281318436214', '6281318436214@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/56122091_350206888852135_6396481415109672960_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGZ-ibolJ86W4jwOM5OxrZA6jdICcbyOxnk69YikotGHQ&oe=6877C5B9&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:09', '2025-07-06 17:16:09'),
(1283, 'akrilik 3meter ciampea', '6285691242550', '6285691242550@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:09', '2025-07-06 17:16:09'),
(1284, 'villa new edelwis pasir angin', '6282122560001', '6282122560001@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475937602_1304018758002122_5699252491343181241_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGVDT9WlxhUuSF_1l4bDyV_O1EpPlcXoJXTWm-qZ0oc-w&oe=6877D07A&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:10', '2025-07-06 17:16:10'),
(1285, 'kmi pa asep', '6281563556437', '6281563556437@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/419734526_1079350556674055_488339813845440282_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHSDnemD2zHE97jEIQSCqHJGHJ5NqvvH6cOpwivkYjkow&oe=6877C4D8&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:10', '2025-07-06 17:16:10'),
(1286, 'kmi deni', '6285746213213', '6285746213213@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/265531398_1337639423334746_1600729394444495569_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH9Kb3sllsgV1bq4_oSUUOPPeQGUIu2epgxUi5cpG0X2w&oe=6877CDA0&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:10', '2025-07-06 17:16:10'),
(1287, 'vc pelo', '6282228273811', '6282228273811@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:11', '2025-07-06 17:16:11'),
(1288, 'arum', '6281287572747', '6281287572747@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:11', '2025-07-06 17:16:11'),
(1289, 'pa kamal', '6285779460600', '6285779460600@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/147073691_2166384923519729_758045815696910215_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHTWf7xOpv3kQq5FZDuj4FC78O1lgZYdgTqbhXEKkOMgg&oe=6877CC4A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:11', '2025-07-06 17:16:11'),
(1290, 'cititex sablon bogor', '6285156733125', '6285156733125@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491867798_3609665102502688_6072463383266398975_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFDFC5uqpmpB0o4u-U_koAqLKVV5ji-0OJwbbKk_uhF4A&oe=6877C27D&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:12', '2025-07-06 17:16:12'),
(1291, 'gundaling', '6281311228399', '6281311228399@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491841578_1212303880398895_2277272005112653806_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHIZP4aTejC_ReeJFEWm-b9hn3DZdTIJyOyHayOIAzAPw&oe=6877D2B1&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:12', '2025-07-06 17:16:12'),
(1292, 'DR MOBIL CIBUBUR', '6285817653292', '6285817653292@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491900157_1217598873216908_1253947835838798294_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHBL4mHkgXoKWSNgjXBlPUUbmMRmEjNZM7q7a5lAMPILA&oe=6877C975&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:12', '2025-07-06 17:16:12'),
(1293, 'iwan setiawan', '6287789488642', '6287789488642@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473395110_462270083506049_8604520584687551216_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEdHWJ0uhqEGaNhdxYa-ZZxMReaQMFQ4KPAQfJ8lWW2bw&oe=6877E140&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:13', '2025-07-06 17:30:07'),
(1294, 'bunda yusman', '6285311714278', '6285311714278@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/453599738_3699849980264442_4914290999420922664_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHOFexKfglX3xYmodM46yN9D5SxDUxEaWL-W7OlcfNwoQ&oe=6877D5E9&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:13', '2025-07-06 17:16:13'),
(1295, 'ikur', '6285312170172', '6285312170172@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/484442488_666223652634915_2502360408332090627_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wESyEIubXFWZPOdSzQ-O40V-EGuRn-vaMM4XQqLUI8i9A&oe=6877DD09&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:13', '2025-07-06 17:16:13'),
(1296, 'kamra om jey', '6285287498283', '6285287498283@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:14', '2025-07-06 17:16:14'),
(1297, 'ikbal xl', '6287873625068', '6287873625068@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/511306310_1290489052962454_3975911505079361035_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGkwV_q2ziSFPIeD7YVM_PV-I1okVX3j2erh736fw7Agw&oe=6877D877&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:14', '2025-07-06 17:16:14'),
(1298, 'Alam biznet', '6285940916118', '6285940916118@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473402138_4084828118461617_7769179545556170136_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHSGxAdelyUFTcbjsk6AhkoZH6s1x803J9QwOmazto8ow&oe=6877D195&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:15', '2025-07-06 17:16:15'),
(1299, 'umar kp rawa', '6281318722366', '6281318722366@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/472246152_1652128392321454_5022200147511819871_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGNYsjX0NbvQnU_e-tV82b2uhQo0n58av1z5yNlxp0btw&oe=6877C118&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:15', '2025-07-06 17:16:15'),
(1300, 'herlina putri po mct', '6285693463254', '6285693463254@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:15', '2025-07-06 17:16:15'),
(1301, 'Bunda Dira', '6285946988781', '6285946988781@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:16', '2025-07-06 17:16:16'),
(1302, 'bu yatmi', '6282123395062', '6282123395062@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/294326296_2337265423103876_1872641365242779695_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGItU9PuDClthFjWzm9vK2GGfHi-_ot4AwyPcrUNMGASA&oe=6877D90F&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:16', '2025-07-06 17:16:16'),
(1303, 'sifa', '628818035939', '628818035939@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:17', '2025-07-06 17:16:17'),
(1304, 'teh hj andri', '6285219528953', '6285219528953@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839782_2558638247802598_172256873097920318_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGl__mRU6KMcAaFnJJDpciOzI89b_vU4AZbkSStmLf0gg&oe=6877BFE3&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:17', '2025-07-06 17:16:17'),
(1305, 'pubg prabu', '6285809202347', '6285809202347@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:17', '2025-07-06 17:16:17'),
(1306, 'mitra jaya abadi box panel', '6282117174477', '6282117174477@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/411965922_931139335399081_5897767326405577218_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHXg1TNIVeaeQmKC2KUMbfCMTigVTgALrX0a3A7XUfiAA&oe=6877C582&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:18', '2025-07-06 17:16:18'),
(1307, 'YusrilFSiregar', '6285162631178', '6285162631178@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:18', '2025-07-06 17:16:18'),
(1308, '*uwiwuwiw', '628128515221', '628128515221@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:18', '2025-07-06 17:16:18'),
(1309, 'Pubg amar', '6281288881436', '6281288881436@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878446_1417853469526176_1099654386080242820_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wExRkoOtglHztuLkpjch3Fx2eV4WC2a5xnXps7Ul0nyCw&oe=6877D18A&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:19', '2025-07-06 17:16:19'),
(1310, 'kost pak iyus', '6285780442983', '6285780442983@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491877112_1829163354599357_6351123814019317015_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHd0GvzlMOuhxcXSo6BqYPrH1eeyEbzSqR_K1PKsxNvWA&oe=6877ABD5&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:19', '2025-07-06 17:16:19'),
(1311, 'cetak ktp bohor', '6285715930811', '6285715930811@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:19', '2025-07-06 17:16:19'),
(1312, 'Jihar', '6289637843016', '6289637843016@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:20', '2025-07-06 17:16:20'),
(1313, 'Hj Komarudin', '6282312324986', '6282312324986@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/397001351_339556885427304_7152035851765576756_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG-Ag-n2nu31M73n9mxrmTrUDEmqMBx1EngrPNn7-kk7g&oe=6877AA02&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:20', '2025-07-06 17:16:20'),
(1314, 'ferli anyar', '6289526898089', '6289526898089@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:20', '2025-07-06 17:16:20'),
(1315, 'yessi jlm', '6281314530397', '6281314530397@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475365547_3154598814737004_1277504934809882793_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE0i3se9VORuliWOUuTFHwhUptrmgZjI0sQXvr2hi_xqQ&oe=6877CE92&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:21', '2025-07-06 17:16:21'),
(1316, 'mtc', '6281281232231', '6281281232231@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:21', '2025-07-06 17:16:21'),
(1317, 'firdha vmala', '6281240218052', '6281240218052@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:22', '2025-07-06 17:16:22'),
(1318, 'Lia Hendrawati WIFI LUDI', '628561256844', '628561256844@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868264_1634742807196555_1460879817714202857_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGw0immpp_-bNKSv_odRTaUxYTK6RhdvoztkjcdHIWJ6w&oe=6877B413&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:22', '2025-07-06 17:16:22'),
(1319, 'teh iyoh', '6283877338006', '6283877338006@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/458345575_517263727913008_3255374143915404307_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEIAnaDJoTIzJB2r0BtE6mpXAcRKOIJv0YJhtfzll8YGw&oe=6877C476&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:22', '2025-07-06 17:16:22'),
(1320, 'bang juned', '6282111574959', '6282111574959@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491846927_2200016997096932_8293335469346299234_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFXKw2HUuEGzFElq55W3maCmKJEbt06_OUoVXeesEPGPA&oe=6877C36C&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:23', '2025-07-06 17:16:23'),
(1321, 'polos.co.id', '6281806367878', '6281806367878@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/156128770_504094720738762_3596654404510589329_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEY6rc53YqpXhUZKVSLZ_REpyVa_LgLiEIGmFitw0KRtA&oe=6877AD0B&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:23', '2025-07-06 17:16:23'),
(1322, 'lapakoutdoor', '628561104803', '628561104803@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:23', '2025-07-06 17:16:23'),
(1323, 'mamah cai', '6281349617008', '6281349617008@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:24', '2025-07-06 17:16:24'),
(1324, 'ADY FIBER OPTIC', '628159998788', '628159998788@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/418601455_7775582055836763_2879705185442804169_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFDPzMeEG0gpg6uUvXXhpT7LpZNr0kWDFdakglexqkdQg&oe=6877D17D&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:24', '2025-07-06 17:16:24'),
(1325, 'Yopi Yuliansyah', '6287797074054', '6287797074054@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872036_1094671792564288_6694659329972066906_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHnbpSfPuWMCbB_ax85d4RJWm_CNP6dDys4Lm5HcNpPsA&oe=6877B533&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:24', '2025-07-06 17:16:24'),
(1326, 'NS2 Fiber Optic', '6287868572107', '6287868572107@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/344749659_182769361375282_6839354358267584660_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEgOMu3iBXxN8ZuU-gkiYU3T1zF082DUXigZu_qcKfCtA&oe=6877B809&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:25', '2025-07-06 17:16:25'),
(1327, 'sabana gugun wifi', '6281213218811', '6281213218811@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:25', '2025-07-06 17:16:25'),
(1328, 'Irvan kopet kprawa', '6289614640234', '6289614640234@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:26', '2025-07-06 17:16:26'),
(1329, 'astri maria', '6289515665623', '6289515665623@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/490822830_552913394065276_5824489818693948121_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF6jnK4LKw7PW1eaIbDDiy3xz89mgho8vxnQe6nmRqyfQ&oe=6877B8FF&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:26', '2025-07-06 17:16:26'),
(1330, 'teh ita', '628998765849', '628998765849@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427771391_377917908458482_3679679816479018171_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHA-HYbESPD3HpjMf3LtsTJBZMIoThlJQR9fTpGM81q9w&oe=6877D18E&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:26', '2025-07-06 17:16:26'),
(1331, 'Mbku', '6282378381410', '6282378381410@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454927627_498211669601583_3717593354029353706_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3kGmsVqmWi-Fq3h-E_opmIJ1AX_zuLyFuw4pmvW9zWw&oe=6877BC33&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:27', '2025-07-06 17:16:27'),
(1332, 'kredivo', '6281291040029', '6281291040029@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/375909988_757729566158322_5058887430504643573_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHDo38kiQpl4kCNqHaslTMtOpFl5RQ8OEjzzB6EmW7jOw&oe=6877BC29&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:27', '2025-07-06 17:16:27'),
(1333, 'Ariatransport', '6287776745867', '6287776745867@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491887315_1422713018671103_7182997084031296658_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF0D2xvgAojg_Puy3W38HODbik7-Ulv41_L8R3PCGloiw&oe=6877C39C&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:27', '2025-07-06 17:16:27'),
(1334, 'ence AChepy', '6285215424818', '6285215424818@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491885810_704281812446251_3925523481871824330_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG2c-m8lDXszrvb-Ag1i8QXFayvmMPqksGBrgtFzRfbCA&oe=6877CAE2&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:28', '2025-07-06 17:16:28'),
(1335, 'smart tedi', '628161919331', '628161919331@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/471372922_3774326372781411_3955436529061866469_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFlbdso_KGTuqulKChtbiOJU8xjT_ub_oUS6jScnAagYQ&oe=6877B93F&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:28', '2025-07-06 17:16:28'),
(1336, 'Sijarwo', '6289528725934', '6289528725934@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:28', '2025-07-06 17:16:28'),
(1337, 'Mukhlis Sunandar Bin Umar', '6285718779383', '6285718779383@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839518_4035727933366918_8296966868802895769_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wESOy6kcSHbSA8hzz4IGFIdE7dmWNBxtyNpR3IL-q8JAg&oe=6877C199&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:29', '2025-07-06 17:16:29'),
(1338, 'fakih vmala', '6283153612009', '6283153612009@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:29', '2025-07-06 17:16:29'),
(1339, 'Asep Iskandar', '6281381162979', '6281381162979@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/487037608_650436927711771_3619968498267581835_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGQzQU98bmzkiI25vKUUe9osOqjkEL71isRjn77luY1RQ&oe=6877C1E4&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:29', '2025-07-06 17:16:29'),
(1340, 'Alfi HJ DADEN', '6285156921452', '6285156921452@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/420798181_498837669312701_1640007848884920453_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGdodof0Si-qVnBtamvnVq2taxYYzSpuxUSjz5OllqKA&oe=6877AF1C&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:30', '2025-07-06 17:16:30'),
(1341, 'NOC ASNET', '6281350007359', '6281350007359@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/221489866_883536355574428_1647912879229770619_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHj90p-Q7LuzAV6P63W5WHBNFMcJzpb0-_avsMFSXvVOQ&oe=6877C980&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:30', '2025-07-06 17:16:30'),
(1342, 'nayah aquatic', '152282914140338', '152282914140338@lid', NULL, 0, '', '2025-07-06 17:16:30', '2025-07-06 17:16:30'),
(1343, 'ipink', '6285710912837', '6285710912837@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399459_582174281468343_4251667852624011555_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEFspRx4Tk4RB5VT_9dfWJfmgHEn_I7B4jrgSnoQcf71w&oe=6877BCFF&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:31', '2025-07-06 17:16:31'),
(1344, 'kaos polos mania', '6287891235777', '6287891235777@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473395076_966120311697953_6567105465755786183_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFKSDCm_RJHDVXRAkXeBjQGZ5wOSOVZPJxTlNL1nxw9UQ&oe=6877BF11&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:31', '2025-07-06 17:16:31'),
(1345, 'rino Si', '6289638648336', '6289638648336@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/202717030_734014114414748_8791853935023825486_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG_2O-2DGscMVd49mVtOEVyeWfFdhgXn9j9HS7wCp-6Pw&oe=6877B54F&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:32', '2025-07-06 17:16:32'),
(1346, 'e.ebilling.id', '6281382826875', '6281382826875@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/300524429_454700816718057_8378215897341069500_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEs83_5wclkiKpV-X60w31fHRV8n9wGP0-PcXRkhvPRSQ&oe=6877D006&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:32', '2025-07-06 17:16:32'),
(1347, 'kaos bkk', '6281398001980', '6281398001980@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/119987117_185599796340961_4551236517677405750_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEghHnzzoTxASicnzUpPd4ejUuMCAu4c4vnIs6j7vZFIQ&oe=6877C19B&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:32', '2025-07-06 17:16:32'),
(1348, 'JOKO', '6282125826837', '6282125826837@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/328197840_806531991067989_6493094683137377182_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFqNeZmrdOTZUVraGIVv4oZ7UYC1Nv2JqDeRhAqx_Q-0A&oe=6877CE7F&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:33', '2025-07-06 17:16:33'),
(1349, 'toko material mekar jaya', '6287785025166', '6287785025166@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/57099254_371933476747621_5932746348687261696_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHq1hsaYvjOfoewWCrBDLhCXyC97yq5aO6XaNARVWDfpQ&oe=6877D23D&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:33', '2025-07-06 17:16:33'),
(1350, 'cc', '6281288743595', '6281288743595@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:33', '2025-07-06 17:16:33'),
(1351, 'dudan sri vimala 06', '6289654090969', '6289654090969@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510432113_1079564114071550_7439202955909615056_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFJ23lOAcilRpihlN992hBPsrBFUQIMuQnwuBivqt5YKw&oe=6877DDD2&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:34', '2025-07-06 17:16:34'),
(1352, 'zee manggo', '6289520659692', '6289520659692@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:34', '2025-07-06 17:16:34'),
(1353, 'Yohana n9va', '62895360718725', '62895360718725@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/132964422_2819812331630754_8156701626877647211_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF_5B2mL_Erc-5NlIPn4uyapVmoyAMtcZRDZbfo-Dhdwg&oe=6877CE23&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:34', '2025-07-06 17:16:34'),
(1354, 'Aditia NASGOR ENGKI', '6285793609580', '6285793609580@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:35', '2025-07-06 17:16:35'),
(1355, 'irmayanti', '6285380290503', '6285380290503@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:35', '2025-07-06 17:16:35'),
(1356, '0856-9205-6029', '6285692056029', '6285692056029@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/121579424_156741916090394_109707933787871818_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHAa1XvjkbQNZoZXYEqcX1rra6Ux7OcWKJEMydl1HaiSA&oe=6877DBEB&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:35', '2025-07-06 17:16:35'),
(1357, 'mardianto new', '6288213283261', '6288213283261@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505148216_2756179184579259_2104896244091925716_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGn4L1soWhDUI7tGJnUHmgDgHnrtthzSU8UDuyO3u_2eQ&oe=6877D597&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:36', '2025-07-06 17:16:36'),
(1358, 'Bojes Waamung', '6285813893251', '6285813893251@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866770_3066429660180655_1705368109228052951_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHui-A6Ce3x9s9rQJLAv53P-qV9N7SIwVIPK2f7MdOmVA&oe=6877BC9E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:16:36', '2025-07-06 17:16:36'),
(1359, 'willi', '219447579115667', '219447579115667@lid', NULL, 0, '', '2025-07-06 17:16:36', '2025-07-06 17:16:36'),
(1360, 'vcmi', '6283844250385', '6283844250385@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:37', '2025-07-06 17:16:37'),
(1361, 'ikhsan RT RWNET PS MUNCANG', '6285880098758', '6285880098758@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:37', '2025-07-06 17:16:37'),
(1362, 'NADA', '62881022236730', '62881022236730@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876700_1573532996649269_5873321636160268970_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFgr4fol1ggYq9uXAMiYX9LekWvUIhVV7W3hbkEAKZ_8g&oe=6877B1A7&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:37', '2025-07-06 17:16:37'),
(1363, 'Telsel Eko2', '6281280090373', '6281280090373@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868955_1029214579316427_2643629413270865691_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wELAHv4_itlTtIHZeQn5blYRLr-WVD6v40fgfvhV-5Edw&oe=6877B94D&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:38', '2025-07-06 17:16:38'),
(1364, 'RW DANAMON', '6281284339579', '6281284339579@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:38', '2025-07-06 17:16:38'),
(1365, 'wchat1', '6281585016700', '6281585016700@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:39', '2025-07-06 17:16:39'),
(1366, 'PUBG IREN', '62811290072', '62811290072@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:39', '2025-07-06 17:16:39'),
(1367, 'aade Si', '628982034217', '628982034217@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:39', '2025-07-06 17:16:39'),
(1368, 'teteh antik Ica 🌸', '6281318625347', '6281318625347@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437172398_1146898016557436_7407512639670332369_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFVh9ljgSVzuYa-4B6vMHO4EPuuuIGrJn2xOUWO_OK6WQ&oe=6877ABA8&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:40', '2025-07-06 17:16:40'),
(1369, 'kaos polos murah bogor', '6281215005305', '6281215005305@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844212_1019366760295519_3941101410510987824_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFNYHOXvcusV7YhBrSHHxvjV_xi2ie7ER6DEE9XJfZwUQ&oe=6877DBE2&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:40', '2025-07-06 17:16:40'),
(1370, 'Sofyan Tavia', '6287882629624', '6287882629624@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:40', '2025-07-06 17:16:40'),
(1371, 'smart sylvia', '6281299001165', '6281299001165@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:41', '2025-07-06 17:16:41'),
(1372, 'si janip', '6289616963395', '6289616963395@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488850226_1718774675662877_7320192055585293699_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFNnufU-e01Fdm8Kor63vqcLdp3_yCJlWkYDH2qQ4b4wg&oe=6877D603&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:41', '2025-07-06 17:16:41'),
(1373, 'reset password dvr', '6285156089548', '6285156089548@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:41', '2025-07-06 17:16:41'),
(1374, 'longor3 Si', '6289628245956', '6289628245956@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491867287_1390234445634085_3763067181516187793_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG4DRpOryxFTVsPofbdsw9CbU0PPtt81tjaOfTcE3-mHQ&oe=6877C8F3&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:42', '2025-07-06 17:16:42'),
(1375, 'hardi bu yatmi neew', '6289604181234', '6289604181234@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:42', '2025-07-06 17:16:42'),
(1376, 'jesica', '6285788632757', '6285788632757@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:42', '2025-07-06 17:16:42'),
(1377, 'pian lekdut', '6283877219849', '6283877219849@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874391_1056410789747187_3446018264907262144_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGWJBWtDLOMglpYJ5v_sMpFsjlyi3cl6g5yvPDdJUf6MQ&oe=6877CD8A&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:43', '2025-07-06 17:16:43'),
(1378, 'kaos andalas', '6285103020077', '6285103020077@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/157174851_426386459586865_2791749017446232663_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHD-66tbOgr3dwK4p0V9l4s490cylFZPMpdDmQLlfpKWg&oe=6877B6D7&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:43', '2025-07-06 17:16:43'),
(1379, 'lisensi jws khalifah', '6282282672010', '6282282672010@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425354481_325658727139835_5525300470931938550_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGOfFZ3-0QcJnveFrZgPY4kK-NxyiGM0h3X2S_AZ13ltQ&oe=6877B1E8&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:16:44', '2025-07-06 17:16:44'),
(1380, 'Yogi jizah', '6282133669700', '6282133669700@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:44', '2025-07-06 17:16:44'),
(1381, 'bram anyar', '6285695222800', '6285695222800@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875970_2155654108284824_1255966773705614442_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGGG4ArPQh-R64b6eW87VOE5jNb_HczdDFz5dQLyxjWfQ&oe=6877B99D&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:44', '2025-07-06 17:16:44'),
(1382, 'tungki sinarmas', '628811232852', '628811232852@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868740_1019759370109815_339738939232467067_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFiYc9D68pGFMEvI-tAxko-mTO1L-okmMakdWoN8ltJbA&oe=6877AEE7&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:45', '2025-07-06 17:16:45'),
(1383, 'teh pipih', '6283821155217', '6283821155217@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:45', '2025-07-06 17:16:45'),
(1384, 'asep gete', '6281292372585', '6281292372585@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425164133_1297346601676261_8317691054846212628_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFCEs73QamNjI0TgQkxWPTeTorooNOzafbT7uJLifQJSw&oe=6877B75A&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:45', '2025-07-06 17:16:45'),
(1385, 'Yuli vmala', '62895349166432', '62895349166432@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454247927_1051782906542018_7281679402064727385_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFsjfxSkpGUYRNXx1IGRXyfb4DxuG0IzqbxE8FqhjcPYA&oe=6877E089&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:46', '2025-07-06 17:30:38'),
(1386, 'wandi Mas', '6285780378148', '6285780378148@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/297118409_1958400231216463_2356949965210026668_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHeKI4I1sdia7ND33QQEQfZVXaFwl9hA2fQ5qaH-Hb5cw&oe=6877D62E&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:16:46', '2025-07-06 17:16:46'),
(1387, 'gatot wisma77', '6285694416113', '6285694416113@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:46', '2025-07-06 17:16:46'),
(1388, 'Erie Ch grand cempaka', '62817883886', '62817883886@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:47', '2025-07-06 17:16:47'),
(1389, 'poco 8/256 nfc 1,5', '6287761790896', '6287761790896@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:47', '2025-07-06 17:16:47'),
(1390, 'kmi padiki', '628118467898', '628118467898@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513569031_571282686056543_6185318320292364945_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEum81MAIETliMcoUPmjA1reYqxG3En9_F3YSC_9r8TTQ&oe=6877DBD3&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:48', '2025-07-06 17:16:48'),
(1391, 'Ajshfrmhrn', '6281412163143', '6281412163143@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:48', '2025-07-06 17:16:48'),
(1392, 'nurul tantan', '62895627282444', '62895627282444@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:48', '2025-07-06 17:16:48'),
(1393, 'dpt bca', '6285832100899', '6285832100899@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399253_1672089906711885_2298815633149790208_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGw94hCPXwRuO932AIAu5OKE47M6o45wZ-QJPKRRGgGvQ&oe=6877DC9A&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:48', '2025-07-06 17:16:48'),
(1394, 'Dhody Harry Saputra', '6289673640856', '6289673640856@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/486793918_1409824743722277_6452843065383128525_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEyj-gZUKGlkiUF3WiKsPsKo8Mp1CeDScTzA9Zafflqog&oe=6877B2BC&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:49', '2025-07-06 17:16:49'),
(1395, 'juak evic cibinong', '62895613232125', '62895613232125@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:49', '2025-07-06 17:16:49'),
(1396, 'ega egin Rahil', '6289602984863', '6289602984863@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:50', '2025-07-06 17:16:50'),
(1397, '❤️ Ita ~ Aponno Tohata ❤️', '6289527233385', '6289527233385@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491870688_1785942148965220_5829239985461342267_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGYMT1KgY65oVlUps178XWx_f3Zz_DWnGRNY5OAJvt6BA&oe=6877D629&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:50', '2025-07-06 17:16:50');
INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(1398, 'lola', '6281586134152', '6281586134152@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:50', '2025-07-06 17:16:50'),
(1399, 'Saeful HJ DEDE', '6285772616369', '6285772616369@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/485462398_1338818007480511_2363783268132482751_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFxk42yRtRnqZOYUNjjdsl3mepsTiGp-uvJgsfnOAbyZg&oe=6877D253&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:51', '2025-07-06 17:16:51'),
(1400, 'wahyu aquatic bekasi', '6282208428782', '6282208428782@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:51', '2025-07-06 17:16:51'),
(1401, 'IKMAL.ANYAR DEUI', '6285282925656', '6285282925656@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:52', '2025-07-06 17:16:52'),
(1402, 'yohana ML1', '6282123666039', '6282123666039@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:52', '2025-07-06 17:16:52'),
(1403, 'bella pak umang Agis', '6282123156604', '6282123156604@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508987377_729845172751727_7381937987218241896_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFHSQ76unqZKDkhZx-kFS2vpZdCdEV7hwu8qegzU1-fbg&oe=6877B146&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:16:52', '2025-07-06 17:16:52'),
(1404, 'sapto', '6281293206876', '6281293206876@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/123734471_712595716347398_2235514348129925851_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF7QzzTkCDcb6I4yjIy-5Y9W-JzBIx7VNVuTWTpZ-t9dQ&oe=6877C33A&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:16:53', '2025-07-06 17:16:53'),
(1405, 'wood house farm', '209972428308536', '209972428308536@lid', 'https://pps.whatsapp.net/v/t61.24694-24/455953322_1842034376325074_626291335916118429_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFmBvR2dGw19uTG5veBKvXSHKEq4vUwI4ckh51toCCDfg&oe=6877DAA1&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:53', '2025-07-06 17:16:53'),
(1406, 'Ustd ponpes alam', '6285759108040', '6285759108040@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:53', '2025-07-06 17:16:53'),
(1407, 'Oby danamon', '6287721920219', '6287721920219@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:54', '2025-07-06 17:16:54'),
(1408, 'gaga', '6282213732097', '6282213732097@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473404076_1012452287760567_3699324582356270323_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGqfNG_NtTwv_mm8WmKA8SNgB-8NUuK_AKcnKisTyEx2A&oe=6877D82E&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:16:54', '2025-07-06 17:16:54'),
(1409, 'PROPESIONAN NETWORK', '6281772339269', '6281772339269@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:55', '2025-07-06 17:16:55'),
(1410, 'jci niko', '628118889888', '628118889888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/56153813_651067255331673_9177025658943963136_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGPZvubQlOlbXEjkhoU4OTROFV9zJZ8TIqy30wQRb7VTw&oe=6877AAF5&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:16:55', '2025-07-06 17:16:55'),
(1411, 'dri led store', '6283807679940', '6283807679940@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:55', '2025-07-06 17:16:55'),
(1412, 'wood house farm', '62816707961', '62816707961@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455953322_1842034376325074_626291335916118429_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFmBvR2dGw19uTG5veBKvXSHKEq4vUwI4ckh51toCCDfg&oe=6877DAA1&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:16:56', '2025-07-06 17:16:56'),
(1413, 'grill puri avia', '6287877734378', '6287877734378@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:56', '2025-07-06 17:16:56'),
(1414, 'Achmad gcr 2', '6281388132259', '6281388132259@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:56', '2025-07-06 17:16:56'),
(1415, 'ine vmala -irgi', '6287885575429', '6287885575429@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840159_1196454068644443_2204156494371643828_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHml5Jj8FcpCnZTESJv3CqW4OiynWXBDaUWgGtYfvwjMg&oe=6877ABCF&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:16:57', '2025-07-06 17:16:57'),
(1416, 'rrq', '6285236444818', '6285236444818@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:57', '2025-07-06 17:16:57'),
(1417, 'tele vc', '6285243840878', '6285243840878@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:57', '2025-07-06 17:16:57'),
(1418, 'ustd rahman', '6289601324889', '6289601324889@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401070_4159123561073185_7642794906037512525_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGKg160f6adCxd1j54D0ZS8NLVNcotshcp5K0UeclS6hA&oe=6877D116&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:16:58', '2025-07-06 17:16:58'),
(1419, 'jual monitor bogor', '6282113711088', '6282113711088@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437678157_1391584754874176_179841370766706660_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH25m_FlclOrJO9ppWM_LRN8dWHtcYWFz8KrlBNfMclIA&oe=6877CEDE&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:16:58', '2025-07-06 17:16:58'),
(1420, 'mas pur vimala', '62895349166406', '62895349166406@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/439299509_429496183315029_2623667019874588326_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEAT0RWOQY_HIlyVFspzloKcBG2XPARKfaqBUhzzdNrXg&oe=6877B31A&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:16:58', '2025-07-06 17:16:58'),
(1421, 'aramex bojong gede', '62895702572140', '62895702572140@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:59', '2025-07-06 17:16:59'),
(1422, 'sewa bus 1', '6281808625869', '6281808625869@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:16:59', '2025-07-06 17:16:59'),
(1423, 'YULI INVESTASI', '6285864032104', '6285864032104@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491909207_1006580601538571_8765154948546569122_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFzXAut3erjrhcHrB4iJ0SgKJPQkNUzczZa1jVgFUUWPQ&oe=6877D977&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:16:59', '2025-07-06 17:16:59'),
(1424, 'NEMO.SYS', '6285212501945', '6285212501945@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/439427318_812740670750344_3100948241384498841_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEswbh9RrVfTgXbcDEoz7adfsyBzkE81SzTFsz_4dVGqQ&oe=6877CE5A&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:00', '2025-07-06 17:17:00'),
(1425, 'toko listrik andalus', '62895352009090', '62895352009090@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/69311669_2367156740202991_6445238270400921600_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF-34GYO36tpoT-RRtNyM3_ibNUiJbC2Wdb8X6sI5oTFg&oe=6877C470&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:00', '2025-07-06 17:17:00'),
(1426, 'manage', '6285782346222', '6285782346222@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483048931_1720555345552448_615146747973261085_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE39MvQaNzdWm1pOqBauMwM4ts2R1sVC26XhcfCTEKRGw&oe=6877CCFF&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:00', '2025-07-06 17:17:00'),
(1427, 'Syabil battery/PT Syabil Energy Persada', '6281270902507', '6281270902507@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:01', '2025-07-06 17:17:01'),
(1428, 'ratu kaca film sukasari', '6281213352802', '6281213352802@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/462692964_1819309915543036_4193597822201008363_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3oRNfpznl0nUx5Er72mmD0vRazgN6D3AvTCGS8AfrSg&oe=6877B352&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:01', '2025-07-06 17:17:01'),
(1429, 'Abo Jambu 2', '6285717666147', '6285717666147@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457793807_27059007313747495_6986958996339149511_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEg4ojppAUcEJQSZlHnUD80GsSTPPELsQnuXYine9NhXw&oe=6877AC32&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:02', '2025-07-06 17:17:02'),
(1430, 'ADMIN BOGOR GROSIR CCTV', '6281380006943', '6281380006943@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491841503_1014457323653361_41604514129737398_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEbaxwyZ0vJwBmIsf6mnaB87aErs5sC-DcaLlEEOcYeMw&oe=6877BD9E&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:02', '2025-07-06 17:17:02'),
(1431, 'mas proyek gcr', '6282124708880', '6282124708880@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876821_682664008138784_963492612793112274_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEt4y2Q1iX56-DxGMzwBLV4A6iEG1v72cNMeQItI7dzzA&oe=6877D7A8&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:02', '2025-07-06 17:17:02'),
(1432, 'lek pardi', '62895342333373', '62895342333373@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:03', '2025-07-06 17:17:03'),
(1433, 'kmi windi', '6285693342482', '6285693342482@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483489628_1002684278437374_3754654340638939885_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFzzCpet-U_jTMkqQ66mO8ert0lvYIXaa50327s08tnTQ&oe=6877C00A&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:03', '2025-07-06 17:17:03'),
(1434, 'kmi sandra', '6281212704996', '6281212704996@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:03', '2025-07-06 17:17:03'),
(1435, 'irgi danamon', '6289687401961', '6289687401961@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:04', '2025-07-06 17:17:04'),
(1436, 'Ari', '6282211880900', '6282211880900@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/75280973_486316001973800_7808153776807230695_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEtp4DX5i95mYwZ3RFblAUf_yYz1NLs7J941T8jFGW5kw&oe=6877C972&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:04', '2025-07-06 17:17:04'),
(1437, 'PT Suprim DGADOG Pakan Utama', '108070084571358', '108070084571358@lid', 'https://pps.whatsapp.net/v/t61.24694-24/306106219_1698592030542015_774829419788173879_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGqwvpHpNYsDXajnY_00Nklru6l1IOrYhbbIHBBj1Xszw&oe=6877B769&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:04', '2025-07-06 17:17:04'),
(1438, 'Pa rt raya foot', '6285882090713', '6285882090713@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/342070897_1549744045509131_7172151930305578787_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEcH700PmzVMOtQz3eo7x2FlYwruHCnU91OSxgGYpHwpg&oe=6877B61A&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:05', '2025-07-06 17:17:05'),
(1439, 'spartacomputer', '6287780149485', '6287780149485@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840966_1466617037841905_8309856800190950933_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhB9IjLFLR8Fxkb7V6QEY5o6TxGgrv129rC99pzecCLA&oe=6877C689&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:05', '2025-07-06 17:17:05'),
(1440, 'jci eva', '6281382168078', '6281382168078@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:05', '2025-07-06 17:17:05'),
(1441, 'Mami VeRReL temen rio', '6289652162262', '6289652162262@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:06', '2025-07-06 17:17:06'),
(1442, 'pubg cipan', '6287713887007', '6287713887007@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:06', '2025-07-06 17:17:06'),
(1443, 'nuryadin', '6283811409360', '6283811409360@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866882_2179897349122722_4037860453289435065_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEMO6U_oEnyPhv4jCukFq1gTlzYKPinEdkYzKQR4F5f4g&oe=6877D98A&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:07', '2025-07-06 17:17:07'),
(1444, 'Rimo Mulyana', '6283812357611', '6283812357611@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:07', '2025-07-06 17:17:07'),
(1445, 'teh idaa', '6288808309556', '6288808309556@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491841824_1265289208445582_4422964257695121649_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEZwn-PKCt5D6a9FqD-WHNXjm_0DaUi14iI7aun_zoxrw&oe=6877CACB&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:07', '2025-07-06 17:17:07'),
(1446, 'Om Jess', '6289517393986', '6289517393986@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/371931564_293493343423618_5174923973489050523_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFiMYwRiuvH5CcUinHF4exZPSyKdqgWbRAFniSeNuskGg&oe=6877B15B&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:08', '2025-07-06 17:17:08'),
(1447, 'Pa H zaini', '6281314840024', '6281314840024@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:08', '2025-07-06 17:17:08'),
(1448, 'Pa Asep dini', '6287874906170', '6287874906170@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:08', '2025-07-06 17:17:08'),
(1449, 'jane sinarmas', '6288809013789', '6288809013789@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:09', '2025-07-06 17:17:09'),
(1450, 'Tabung Jaya Oxygen Bakom', '6282112098503', '6282112098503@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473400354_626142226686975_2087444882904674112_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE1-Pg7aK5vXdu4SRjUhs462iIG6QRjoQ0XDrUEfABAfA&oe=6877A706&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:09', '2025-07-06 17:17:09'),
(1451, 'B oki', '628129203996', '628129203996@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/459238451_1277615926716168_8379566109263524027_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHGj6ZtQV-Rbrsh08WD3Qs1nb8zIxDjpWiEO6EM3UIdcg&oe=6877DA41&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:09', '2025-07-06 17:17:09'),
(1452, 'Wandi Citok', '6285882292184', '6285882292184@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510283501_23992964223723246_7436921068688206501_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFBMcmR3HjOIa8_zeO2jveYebQarQyacGcigXubtXcNmA&oe=6877D4A6&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:10', '2025-07-06 17:17:10'),
(1453, 'angga gondrong', '6289646462561', '6289646462561@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473406593_662049343171682_4855009738171262958_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3ag32wo4nQPnvLGmPvNNvJVKzAiotaYLuUQTMlSwVyA&oe=6877AC7D&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:10', '2025-07-06 17:17:10'),
(1454, 'Rizky komputer bekasi', '6282313561756', '6282313561756@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425188941_1366186547374458_7431023385967940970_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHlkXTaBoqduLuvKqg0k7DaLMntcFn8KqtaI4d1HxMPQw&oe=6877D3D2&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:10', '2025-07-06 17:17:10'),
(1455, 'rohim', '6289613288192', '6289613288192@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468730398_2744939219046292_4934893832070139850_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGK4LGcqYqPqXMLcTjvT-S1TWSd7O3QYsnqliiYAaEgRg&oe=6877B7B6&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:11', '2025-07-06 17:17:11'),
(1456, 'Pa jupri golp', '6283819497413', '6283819497413@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:11', '2025-07-06 17:17:11'),
(1457, 'aterial hj asep', '6282125826501', '6282125826501@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/74945146_289725931983082_8810965953830865113_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH8oAnNx1wRzjb1otuB-UwkYQiaaLwrRyaDx_WUztjk0A&oe=6877DA6B&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:11', '2025-07-06 17:17:11'),
(1458, 'Spa bunda', '6281617192866', '6281617192866@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473411526_1526902698008266_1254519259687989094_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHAFHAp2gsc_jl6kyXL9b1CeardrbeaGqnmp6wU8QWA1A&oe=6877BDAB&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:12', '2025-07-06 17:17:12'),
(1459, 'scp adrian', '6287722054892', '6287722054892@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/233607762_521218412804110_7780581646985714088_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHEGicVQdXmENY8L4AyONAyFV8owTSZ_L0aCpgVgJVZag&oe=6877AFCF&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:12', '2025-07-06 17:17:12'),
(1460, 'TATANG', '6289605196677', '6289605196677@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491838972_1763175124234186_8653237586431121387_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEeX8XEUKiepIfILI8x7lch5enirpUDlVH9utoM_GhYrw&oe=6877A843&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:12', '2025-07-06 17:17:12'),
(1461, 'Supernova computer depok', '6285717766616', '6285717766616@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473402710_541868588335533_876775327983934224_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHUlwdk28xMC1Vw1Xbp2SSzNVraQ7WARJWnaMe8rLnmLQ&oe=6877A6D9&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:13', '2025-07-06 17:17:13'),
(1462, 'mitra 8', '6285230990881', '6285230990881@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/151697017_477518486954740_560590536454900354_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFEb7dv59ml0xz281U0DurXMfOHEobQ7kSLN165cGSi8A&oe=6877D083&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:13', '2025-07-06 17:17:13'),
(1463, 'Bohir teh ani', '6289619879726', '6289619879726@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491841614_744039698558593_2010345006547497380_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHTvHh_l2KGFGe8YW0UPJqjPJkq6wmzoYGgz9CfDygjCQ&oe=6877C056&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:13', '2025-07-06 17:17:13'),
(1464, 'naysila', '6283185219934', '6283185219934@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:14', '2025-07-06 17:17:14'),
(1465, 'sintaamelia', '6289521541466', '6289521541466@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:14', '2025-07-06 17:17:14'),
(1466, 'Repal_Dika Vmala', '6285813930377', '6285813930377@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:15', '2025-07-06 17:17:15'),
(1467, 'Indah', '225181444350138', '225181444350138@lid', NULL, 0, '', '2025-07-06 17:17:15', '2025-07-06 17:17:15'),
(1468, 'Ulfa', '6285711377543', '6285711377543@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427391673_833008132186459_3397260412422861507_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wETbi-T4KM52BhIsqkHQwH0cpBKYzdB3h6fA8Dbvf8M1g&oe=6877C940&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:15', '2025-07-06 17:17:15'),
(1469, 'Dhenz Maulana', '6281399755715', '6281399755715@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/181156402_2323372017815431_4459707817462933671_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGEecH3NZNP98gmNsuH5epPVGCL-KnSLm-mfxo5Yw-B0A&oe=6877DD60&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:16', '2025-07-06 17:17:16'),
(1470, 'Lussi Bee', '6281332925562', '6281332925562@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/424638452_370472339254077_7728581568806308101_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFq_9Xt4CM9bl1fv2Rzols2o-BHZxwdaTvg_yO8oYIMtw&oe=6877BCCB&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:16', '2025-07-06 17:17:16'),
(1471, 'jci fatia', '6282110620800', '6282110620800@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:16', '2025-07-06 17:17:16'),
(1472, 'Prima', '6285711000616', '6285711000616@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:17', '2025-07-06 17:17:17'),
(1473, 'linda bu juju', '62881025688125', '62881025688125@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:17', '2025-07-06 17:17:17'),
(1474, 'acrilic cutting cipayung', '6285221778788', '6285221778788@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:17', '2025-07-06 17:17:17'),
(1475, 'willi', '62895364935567', '62895364935567@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:18', '2025-07-06 17:17:18'),
(1476, 'boncus', '6285716505002', '6285716505002@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/371327173_276449125148355_168231626974839754_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEAd4A9GO1v531NkCTwMb1i0rD2zHZWPrgbZknEgzvFZw&oe=6877CC55&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:18', '2025-07-06 17:17:18'),
(1477, 'Irfan_Asnet', '6285710893295', '6285710893295@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:19', '2025-07-06 17:17:19'),
(1478, 'al andalusy', '6282251845791', '6282251845791@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:19', '2025-07-06 17:17:19'),
(1479, 'mas ahmad jxb', '6289603541693', '6289603541693@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872942_1027977649246612_632698383197412742_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEDsvmEACSfCj7wyMlN6Cnd-jGL1OO3ww20Ey_lDzsEPQ&oe=6877DC0A&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:19', '2025-07-06 17:17:19'),
(1480, 'Apuk Alfa', '6285695775909', '6285695775909@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:20', '2025-07-06 17:17:20'),
(1481, 'smart indra', '628811281688', '628811281688@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:20', '2025-07-06 17:17:20'),
(1482, 'hioso', '8613760140712', '8613760140712@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844794_716946217422324_8813978802269347660_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHhA1xCz93Gzneynooo4C0SbJmYWp2W547BvI3KlLxDQg&oe=6877B8AD&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:20', '2025-07-06 17:17:20'),
(1483, '0817-7235-9894', '6281772359894', '6281772359894@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475976874_3037785956360564_3234987951226302815_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGpeyfL2L1uGJ7HnaqeFDNUupkqrUPod0GvJE-SRVvN7w&oe=6877AC88&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:21', '2025-07-06 17:17:21'),
(1484, 'teing micet', '6289668921643', '6289668921643@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:21', '2025-07-06 17:17:21'),
(1485, 'tehlina', '6289698744992', '6289698744992@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:22', '2025-07-06 17:17:22'),
(1486, 'Piknik bus', '6281238888966', '6281238888966@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:22', '2025-07-06 17:17:22'),
(1487, 'danil', '6285693079737', '6285693079737@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/402284399_24225724953738034_6197881768485533921_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHb7rz2bfjQMrqkZY6-3bUynAkmYMaXq1CkUwdqZG-MAg&oe=6877CCFE&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:22', '2025-07-06 17:17:22'),
(1488, 'Rico PT. suprim', '6282299448774', '6282299448774@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/486097783_3996043240668838_2662099082300678578_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH2vt0Vqy0EREspBzy6UGslmSdLfCnSQMq_PdRo1ciMVQ&oe=6877DD1B&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:23', '2025-07-06 17:17:23'),
(1489, 'Suryadi Diana', '6287770591719', '6287770591719@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:23', '2025-07-06 17:17:23'),
(1490, 'Jafar Sidik', '6285211301516', '6285211301516@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491883741_1617485026305900_7653907559636399950_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEeQXLqpm8NVbNPunI_lNPVfoa--YR38fy9TtEto9x7yQ&oe=6877BE27&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:23', '2025-07-06 17:17:23'),
(1491, 'LARDI FIBER OPTIC', '6285236295668', '6285236295668@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/322091941_230798782622003_8997236228214237218_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEknaKpTsa4zoaaiQC-e3W_XmE46Ms5s85yCeA5QSE2Pw&oe=6877D4F9&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:24', '2025-07-06 17:17:24'),
(1492, '66', '6281288652907', '6281288652907@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491849507_600014565916857_8095693201225091857_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFSUSK4MyzHBLgaszeHbovYqy75eHN0JuUwdZoIBuPVdw&oe=6877BC49&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:24', '2025-07-06 17:17:24'),
(1493, 'ms print', '6282124371776', '6282124371776@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473408364_643087402030354_8118644539939738991_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFBJz-J_xKmwSchW4selaKYu7Vsh9tvcAovZRcqNaZF7A&oe=6877AACB&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:24', '2025-07-06 17:17:24'),
(1494, 'Idrus begenk', '6289519047303', '6289519047303@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/482533375_1703075033967490_8927817604544766300_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhhRE4UefJ3fxXi7wzVr9TW-gz-pYWCiwfXd1v6AoovA&oe=6877CAEF&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:25', '2025-07-06 17:17:25'),
(1495, 'lypz lyla', '6281584270383', '6281584270383@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:25', '2025-07-06 17:17:25'),
(1496, 'ajis gagap', '62895328072791', '62895328072791@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455000716_1815695602297214_2898809005446190521_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wERv5HBmmIEyPKOOQMjojEZtAeEi45L2aeKfyfLnnhdBg&oe=6877A96D&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:25', '2025-07-06 17:17:25'),
(1497, 'bima ady PT YAU', '6282234415123', '6282234415123@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/428340637_1810606072753926_6873292606157388322_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHaUa8SC5jqyStjitY9Fh8PRhMGE9LcWUfoLzl7grNt6Q&oe=6877B2A1&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:26', '2025-07-06 17:17:26'),
(1498, 'Kmi Agus', '6288210687794', '6288210687794@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866726_698297556344317_8864293951171871071_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEgr5SWY5UFOOGnMnEBbTI6RHrORnQiqSYrRtD8bUkRIQ&oe=6877C24C&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:17:26', '2025-07-06 17:17:26'),
(1499, 'Chrairudin PT GUNUNG GELIS', '6281382590888', '6281382590888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401038_1301828527778483_4024647061374783448_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHSr_Dw6GxU5VOZIRGmV1TNvt3_ml_-rOGGffg7dHejWg&oe=6877A926&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:26', '2025-07-06 17:17:26'),
(1500, 'ruli rcn', '6285894926889', '6285894926889@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/515084731_1240107723805167_5556733714556757546_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEqe-LUDKlrNZb0YWJYQU1XDNJwOaDk4KRt14B9jIFxTg&oe=6877C787&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:27', '2025-07-06 17:17:27'),
(1501, 'om tomi', '6282124373375', '6282124373375@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871264_1831601154054331_1740408527871879845_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFimo-qYyPDziSzZS0oUWzSueJkc47IOWf-PYBfkgOQMA&oe=6877A688&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:27', '2025-07-06 17:17:27'),
(1502, 'andhika PWM', '6281210358888', '6281210358888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/305811214_2027589274101076_6686656274882559715_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGe8ljyot3Hg6FUxiCFdwP0BKDG68X5wJoLefrd8Iqwhw&oe=6877C0B1&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:27', '2025-07-06 17:17:27'),
(1503, 'anak mas pur Wulan Purwitasari', '6289675391679', '6289675391679@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868839_1410036573757219_2992650858641118438_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHahpqBcJwbaCLQqwJBeZ0kFaug2FoKcV-lGVyGupA3EA&oe=6877BE28&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:28', '2025-07-06 17:17:28'),
(1504, 'izul', '6285693208852', '6285693208852@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491904976_1196158321501630_3240564923704999196_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFlN5y8yL9sv2RPRVm2shRAuZxMgetmVhPx7lKWuVw8iQ&oe=6877D9B3&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:28', '2025-07-06 17:17:28'),
(1505, 'arduino jaya perkasa', '6282111545939', '6282111545939@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/315751152_1160418594576853_4051135337574610597_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFHqDhPNGyLKVA2y3hUaZ5TvYjgAUUZDRaFIuTl3so46g&oe=6877BC30&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:28', '2025-07-06 17:17:28'),
(1506, 'MAS ELY WARUNG CATRIN', '628129039359', '628129039359@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491887291_1453604932673443_4844274721603041430_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG2tzsX8X5JGmRvpDVJ4NXMt_4ojDGhMaOgKAW9w9ok-Q&oe=6877C5A9&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:29', '2025-07-06 17:17:29'),
(1507, 'NIKO JLM', '628561303070', '628561303070@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/463150216_1725590934870784_4021586111097252323_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFBYSfIoQ4KiyHs21_yfGAPMfOMeZYj_CgZX0E6v04vCg&oe=6877ACDD&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:29', '2025-07-06 17:17:29'),
(1508, 'ANEN JEBOB', '6289671619427', '6289671619427@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868670_9721681841279036_4650959613816231394_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHoi7xUT9XqfsjrQJFLmW5CEvANL9yKbg3eP6--E23hzg&oe=6877D57A&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:29', '2025-07-06 17:17:29'),
(1509, 'Ramdani ade elax', '6281212698800', '6281212698800@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425049584_432865425843795_3387489154731996676_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEYUKyxv-JdLzflVk2tjVVdtNA50THiUcqWvtK-mGgNjA&oe=6877B213&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:30', '2025-07-06 17:17:30'),
(1510, 'mas girin', '6285693921787', '6285693921787@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/128181865_143282897168926_1757688080186266723_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG-sLNVO4zfTxeDMWdT0a6lIst0HzbcGbqt77JhjB0EkQ&oe=6877ACF3&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:30', '2025-07-06 17:17:30'),
(1511, 'noping2', '6285251142288', '6285251142288@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:30', '2025-07-06 17:17:30'),
(1512, 'ZuPreem / Rcom / Premia suprime pakan utama', '6282122771258', '6282122771258@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491867509_2149005385577133_4485992003698068459_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF2aVkISd04vuKn0DYOrU16kZZlNVtb6haB3H4JpFmO3A&oe=6877D185&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:31', '2025-07-06 17:17:31'),
(1513, 'OWNER VILA BOENDA MOELIA', '6285716181111', '6285716181111@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878507_1237141908068531_6979640976063676435_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEVkrrVGwoK-Zmpdf1C7pRHfk-j4bYioY6n3o-URouSOQ&oe=6877C5CC&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:31', '2025-07-06 17:17:31'),
(1514, 'Caduk', '6288292234823', '6288292234823@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:31', '2025-07-06 17:17:31'),
(1515, 'bu ifah pak asep', '6281285949887', '6281285949887@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:32', '2025-07-06 17:17:32'),
(1516, 'pak samugih pandaan', '6282139798996', '6282139798996@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866353_1367661807818254_5123293038541860883_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHifysHTjFXpNT8_Hru4bp_nVrZXZQ2FC-54TIre32kyg&oe=6877CBD9&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:32', '2025-07-06 17:17:32'),
(1517, 'SMART Iwan', '628811280210', '628811280210@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437147717_1225799665450170_3002861710672402465_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHfggFbhupuHzIcyT2zr4o5aDbYSZocm19rlWPteyshlg&oe=6877DD3E&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:32', '2025-07-06 17:17:32'),
(1518, 'shopndruve sukasari', '6281240009541', '6281240009541@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/421077469_895908249128855_3632718196269361881_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF-bh2P5kAgIwRzIYxE54KsS3ZlZ82BawkVlG1K72J3cg&oe=6877DB1F&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:33', '2025-07-06 17:17:33'),
(1519, 'jual naked', '62895619058298', '62895619058298@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:33', '2025-07-06 17:17:33'),
(1520, 'DARA SEPTIANI', '280654654771453', '280654654771453@lid', NULL, 0, '', '2025-07-06 17:17:33', '2025-07-06 17:17:33'),
(1521, 'Vhera kp.rawa', '6289631852175', '6289631852175@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871346_1228719158645544_540977879914775382_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFYMtyNgPSIQiUUIL-NzzYUcULHfgk0Cgsd5yQGDikY9A&oe=6877B5B0&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:34', '2025-07-06 17:17:34'),
(1522, 'echie mku', '6282297379811', '6282297379811@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/462203960_1545995216234565_115210784916271783_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHD_ab1zMsk1YxbP3ph-WHzQczx_6lLXg-Q0jEogMV5bg&oe=6877A6D3&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:34', '2025-07-06 17:17:34'),
(1523, 'om agus', '6285691591661', '6285691591661@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/56153807_2376137805753211_219411372138561536_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGi4tlQllMqrJKsKLA7mh6NTXLVliZmT-zm169kvDG5kw&oe=6877AD57&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:34', '2025-07-06 17:17:34'),
(1524, 'rijal RCN', '6281646963300', '6281646963300@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:35', '2025-07-06 17:17:35'),
(1525, 'sintaamelia', '68036811857958', '68036811857958@lid', NULL, 0, '', '2025-07-06 17:17:35', '2025-07-06 17:17:35'),
(1526, 'niko global network', '6289604328975', '6289604328975@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468930773_591271503589285_2383380980594596319_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQckib-ix7dc5D6mwlw7Y6Dp5czb789TUbJM14As-8fA&oe=6877B76B&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:36', '2025-07-06 17:17:36'),
(1527, 'yanled display', '6281299642430', '6281299642430@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:36', '2025-07-06 17:17:36'),
(1528, 'Tnggp Richard XL', '6281927134290', '6281927134290@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/160125487_1091444004701365_821255794761172087_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEoxGmA5iEhTP-nm1P0X5SWy8nv055XmwIhRiUzjATDHg&oe=6877D3DB&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:36', '2025-07-06 17:17:36'),
(1529, 'pandu camp', '628157111309', '628157111309@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/456031132_554255437063743_1685821334915791534_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEgjgIv4nTWmDnt9eo-4iJPYHNR6CILnmpEq4wPJsOR-w&oe=6877D17F&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:37', '2025-07-06 17:17:37'),
(1530, 'tiktok shee', '6283803669552', '6283803669552@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:37', '2025-07-06 17:17:37'),
(1531, 'pubg Rojok', '6282218593027', '6282218593027@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:37', '2025-07-06 17:17:37'),
(1532, 'yani kredit hp', '6285770409644', '6285770409644@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/511310250_1272238307758434_4857736344724280688_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFvIxZ3w68jtqKPsAWCYGbzVur_Syx-qILZ0KzvweSCOQ&oe=6877BFAB&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:38', '2025-07-06 17:17:38'),
(1533, 'pubg devii', '6281317128001', '6281317128001@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:38', '2025-07-06 17:17:38'),
(1534, 'ASNET Icha R. Permani', '6285695967395', '6285695967395@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/384821712_676438501249488_784353669311554143_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGHaphgZtMH-MzbtwaSc1Jx03CVkZZzNn_3euWLnyYrDg&oe=6877AAEA&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:38', '2025-07-06 17:17:38'),
(1535, 'indihome cisarua', '58660797575323', '58660797575323@lid', 'https://pps.whatsapp.net/v/t61.24694-24/457198404_1093845098972667_6758514698839029881_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHn5lPoRrzAgVTTJL-I3EtygVW9aYHv-TJEXZi7qNl2uQ&oe=6877B511&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:39', '2025-07-06 17:17:39'),
(1536, 'SENTATEL', '6285694251022', '6285694251022@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/159117833_979765266139126_2271727520113598550_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHT_O2UvqmVkQMF3W4Q6hcqyHuefKjV9D6zFkfj0Wat-g&oe=6877AAD1&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:39', '2025-07-06 17:17:39'),
(1537, 'Ida Sanjaya', '6281297222115', '6281297222115@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:39', '2025-07-06 17:17:39'),
(1538, 'swt mardianto', '6287889148343', '6287889148343@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875249_2035984230144238_3126886015812765191_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEMFLs0FQlQ7skxV8CN9nsuA4IjxzTo9WIPTVR-_JTTjg&oe=6877CE9A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:40', '2025-07-06 17:17:40'),
(1539, 'ricardo JLM', '6285718168107', '6285718168107@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/299310819_796105098073202_5103911449931523192_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFCQXPoC_bpXSyGRco0oDCRwwPWr5Vzj3UFEke-OQiByw&oe=6877D10D&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:40', '2025-07-06 17:17:40'),
(1540, 'pak dede rt4', '628129643306', '628129643306@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/262074756_508772274225461_9198406566144200186_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFFdvTym8kk4Sj2bTn9wjM6M1h6Md1BMvZoIektgc2rgg&oe=6877A90C&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:40', '2025-07-06 17:17:40'),
(1541, 'NANA-EHFS', '6285659553251', '6285659553251@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488561341_1434873921228947_404626986650744016_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wER0cRbqKna10uUSHy8clj1_3SiMDB8he-9J_l0VdswOA&oe=6877DDA7&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:41', '2025-07-06 17:17:41'),
(1542, 'fitriah kamra', '6281285339342', '6281285339342@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874679_1234258008487578_7968407433736223254_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEtpvoONhS98r-sNK6ACFOTp_eV0zN9nG-Jers_ExlLwQ&oe=6877AE6F&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:17:41', '2025-07-06 17:17:41'),
(1543, 'smart teguh', '6289695006147', '6289695006147@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405857_1326747471673711_4842985723092449081_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGzQw31WHH67b-q_3J_JpzobtxyvcqQrqMnf5u36jDMXg&oe=6877AE86&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:41', '2025-07-06 17:17:41'),
(1544, '🇲🇨HerryTristanto🇮🇩', '6283819186454', '6283819186454@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:42', '2025-07-06 17:17:42'),
(1545, 'ALLIEF KPRAWA', '62895330305650', '62895330305650@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:42', '2025-07-06 17:17:42'),
(1546, 'Markaz Print Digital', '6285810802833', '6285810802833@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488417596_550625777639617_7741412425257913848_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFQCGzOLNSVSQTmP3Feo0WTBnnACkKGOBSnkUXgvN9NUA&oe=6877B178&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:43', '2025-07-06 17:17:43'),
(1547, 'Afhien Sopian desa', '6289510632430', '6289510632430@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399707_2100399980382972_292942835920657536_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG4SS7WeUpaX6jg9b-WmKzl9iK6OzqJ-BhlE3tfpXKpkw&oe=6877D2E4&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:43', '2025-07-06 17:17:43'),
(1548, 'futurestore', '6281220100358', '6281220100358@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488608960_696299729632058_2880550402491352433_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEEaHqQ8_Z0JlUsJbGxR6p2GuBRlh5jXIR9XANgTTuZqw&oe=6877DE22&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:17:43', '2025-07-06 17:17:43'),
(1549, 'Riana kp.rawa', '6285718045438', '6285718045438@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:44', '2025-07-06 17:17:44'),
(1550, 'Tikaaa', '6282126881297', '6282126881297@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491891682_1596587314362102_4918235756743334023_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEojINT3ufdMJ37A81Y-zJdf6R9JTC60KL68S2AKUDwUg&oe=6877AB3A&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:44', '2025-07-06 17:17:44'),
(1551, 'neti', '6285711867562', '6285711867562@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:45', '2025-07-06 17:17:45'),
(1552, 'hildayat hildeword', '6287722177009', '6287722177009@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/441128277_848781489954711_2246489286529196577_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHXVmqWoxMoBLVd0PA1Vsb1S3_96F3_WkB385IOc6us0Q&oe=6877BC87&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:45', '2025-07-06 17:17:45'),
(1553, 'hendra kost nutri', '6287870124039', '6287870124039@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/266487175_2816408975319720_6896807444351081338_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGsYtFcg850w6sDZXnO4df1DMoi-QMe6dko2e9TyVFBUg&oe=6877B9E1&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:45', '2025-07-06 17:17:45'),
(1554, 'rem balwadi', '6282260006464', '6282260006464@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/319946034_2642748985866422_4137104450582068113_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFKeh0NjLR01byCQj6zqYHiH3ZtDGgI-MTTFFmOOuy8Dw&oe=6877B849&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:17:46', '2025-07-06 17:17:46'),
(1555, 'kmi vidi', '6281284678778', '6281284678778@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/159808556_1210595766032632_9180213498704096998_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHzDYG2bkV1Hv5jSV7-TDqTzEOuxMswcIE2e7vLRGUmgA&oe=6877BB52&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:46', '2025-07-06 17:17:46'),
(1556, 'L lucky', '6285716989944', '6285716989944@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876060_3648523118785397_7774940214704161755_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH5WP7rtkHx2PXsdGtPp20B1HJ7hLAYZw4q2MiJgFSWEg&oe=6877CD3C&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:46', '2025-07-06 17:17:46'),
(1557, 'vhara gadog', '6285693933384', '6285693933384@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839763_922256503362627_8980200906628327022_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEV9JAy-u7HbdatVvO7VFHOQ5liLyFhRi-ae-qaQEQ6bQ&oe=6877BB77&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:47', '2025-07-06 17:17:47'),
(1558, 'art techno', '6283879952900', '6283879952900@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/345256120_245348941742664_6385165916464115033_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFsBIZIk-gXaZKxV9d3Xyf0EWGsVkEdStEtEbNEzsTCqw&oe=6877D10F&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:47', '2025-07-06 17:17:47'),
(1559, 'DTF Dhik4 4 print', '6281310092124', '6281310092124@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513066229_713891931380277_1746992481482231192_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE44yrmrjufPj5GNpaKCbN14JCL33qu7SxUL8h4HOXiyQ&oe=6877DC49&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:17:47', '2025-07-06 17:17:47'),
(1560, 'azis gian hamdani', '6281293374316', '6281293374316@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/394124407_903341947876659_8842551379380861205_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEx7M47JlzAVfeCg53oWUmFlo9Yfyd47nrUVn-7bKWQBw&oe=6877D9CE&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:48', '2025-07-06 17:17:48'),
(1561, 'pamelia', '6288294072402', '6288294072402@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:48', '2025-07-06 17:17:48'),
(1562, 'lek marno', '6287872373040', '6287872373040@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:48', '2025-07-06 17:17:48'),
(1563, 'Kmi Dodi', '6287889343807', '6287889343807@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/362648268_1446070769459407_1998073097816347974_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGWVoNpfWQdVJLOpnTOLPhA7QT-7ZeJ3tLpE4YubQoiZg&oe=6877BE33&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:49', '2025-07-06 17:17:49'),
(1564, 'LM ELECTRONIK', '6281384420271', '6281384420271@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55944304_2385747181655919_2593963000410931200_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH6mDPdp2rfpoGRhwOt5yR-hU1b1ACP9TszISDJQHDHiA&oe=6877CE25&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:49', '2025-07-06 17:17:49'),
(1565, 'kmi santi', '6281362123241', '6281362123241@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/466844486_2238036496576164_4428547249149609229_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhZl-5MaNXHqzYQhsRfD2SIf44MceGbhGrt1x3MXR22g&oe=6877CAA9&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:49', '2025-07-06 17:17:49'),
(1566, 'tika ig aktif', '6281515828841', '6281515828841@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874335_1260209342450206_2489705192200990154_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHy7YP5JllbAhkQp7-xx6DinEM3j0e65YV2ghmIe4OKjw&oe=6877CC7A&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:50', '2025-07-06 17:17:50'),
(1567, 'dwi missi', '6281347114227', '6281347114227@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:50', '2025-07-06 17:17:50'),
(1568, 'Ka Hj Merni', '6287870561851', '6287870561851@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:51', '2025-07-06 17:17:51'),
(1569, '088213273899', '6288213273899', '6288213273899@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:51', '2025-07-06 17:17:51'),
(1570, 'rusli indihome', '6282210079617', '6282210079617@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:51', '2025-07-06 17:17:51'),
(1571, 'pubg riki', '6281284888807', '6281284888807@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878509_733963489148253_2686265851860511350_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEKTZRDbYfeisR_oZ2YR4wEzVW5mdK-TAVKPvq06OnPLQ&oe=6877C2A0&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:17:52', '2025-07-06 17:17:52'),
(1572, 'Sekdes', '62895355223256', '62895355223256@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:52', '2025-07-06 17:17:52'),
(1573, 'arteck printer', '6281287894455', '6281287894455@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/339502190_900127751256470_7789929239926213880_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEWyYW-eoufr0Z-4ebxuB8YN53Po-blA7EdjRAV6nLxag&oe=6877D7F9&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:17:53', '2025-07-06 17:17:53'),
(1574, 'erik Si', '6289638372558', '6289638372558@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/403772728_1054552102417394_4695849701115831881_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHKYZaOr3nzeshyJdqR6n-fomYxwtTSZndLng389cdnCg&oe=6877CB64&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:17:53', '2025-07-06 17:17:53'),
(1575, 'penbo taman', '6285710676357', '6285710676357@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:53', '2025-07-06 17:17:53'),
(1576, 'wahyu vmala', '6289605197722', '6289605197722@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/438935158_1513921589198393_9061804164106100197_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHIOQyueJVPmQFiFpTFYLrV2PHVdO2E-FGIfie1uGW5JQ&oe=6877BA87&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:17:54', '2025-07-06 17:17:54'),
(1577, 'MSG', '6282130526833', '6282130526833@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510641677_1424084635294006_5380522367141391006_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFMz93dIicKj7r68KTUhKBarRwZivqvVMYlP5mHmVaJLQ&oe=6877DE83&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:17:54', '2025-07-06 17:17:54'),
(1578, 'vocher unlock tool', '6289616245664', '6289616245664@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/351207769_224036160434609_6793351729876214716_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHXSfb4-gNiq8hrrhxaSYSRD9V8mz4JkBhqX_ZDkZPsYg&oe=6877DD4E&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:17:54', '2025-07-06 17:17:54'),
(1579, 'Leli indra', '628982045247', '628982045247@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:55', '2025-07-06 17:17:55'),
(1580, 'padma printing', '628161815218', '628161815218@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/156274807_1022889168307352_1177889949362732832_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGiyXDd9y06NnRnmOy1hcrmUNZ_6XiuWqVkK6Y7R58DsA&oe=6877AC7F&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:55', '2025-07-06 17:17:55'),
(1581, 'Indra', '6285881043990', '6285881043990@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473398677_1020263139920709_1842988775132921484_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGUa792urCZWk4_Dte_7Odo7_NlVyNn4hHe4A5X5EKqpA&oe=6877C5B7&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:56', '2025-07-06 17:17:56'),
(1582, 'zeda elektrik', '6287776416418', '6287776416418@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/57364938_1007403112982652_8554653450003021824_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGmVFTIGX5ZCtiGI5GTpvkeLhbyVBQowxAdj3E87ZfR7w&oe=6877B79B&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:56', '2025-07-06 17:17:56'),
(1583, 'lik Khasir', '628161698892', '628161698892@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:56', '2025-07-06 17:17:56'),
(1584, 'PMB..', '6285161884221', '6285161884221@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:57', '2025-07-06 17:17:57');
INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(1585, 'toko rotan', '6281905064253', '6281905064253@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55905019_1010739662454707_6906722202729578496_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFHchHz0_nrzTfLDVHuYIYyymVArBwGxCI-RqQCICbZCQ&oe=6877D868&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:57', '2025-07-06 17:17:57'),
(1586, 'ucok tavia', '6282112841135', '6282112841135@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:57', '2025-07-06 17:17:57'),
(1587, '技术刘support hioso', '8617749884279', '8617749884279@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:17:58', '2025-07-06 17:17:58'),
(1588, 'surade', '6289678744178', '6289678744178@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425049587_7662735150487088_3253218824246552939_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFSE5TtSRt42M2Oaq8ov_dF0oZZKz80UVOfSWvoK4QK3w&oe=6877B3F4&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:17:58', '2025-07-06 17:17:58'),
(1589, 'mamah yusril', '6289636178759', '6289636178759@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473412156_575648361474680_9151857660970803265_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFcde1X7MlDlIWSVqQbSP481k-yX1t3S3fmxeArH_FirQ&oe=6877BACF&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:17:58', '2025-07-06 17:17:58'),
(1590, 'aramic', '6285959049105', '6285959049105@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875780_1937291187078453_7642298464543557058_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG7vPCYmNQUM2mDemaw5L7DA78R1jfi27W6TPMXuhXrIg&oe=6877CDE5&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:17:59', '2025-07-06 17:17:59'),
(1591, 'mahar cai', '6281363431535', '6281363431535@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491836467_24093691416901077_3048268066575001154_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGpRY291NQo_o9yKqLycA9H7PwtzsPXwlyJZa5QFk2dZQ&oe=6877C3CF&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:17:59', '2025-07-06 17:17:59'),
(1592, 'pubg fai', '6281315509778', '6281315509778@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506270733_1078413677502298_7905594934052163811_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHfsWNLscZsWp-xqMsNWC9GeDTqk8-QykGBDXcox37N1Q&oe=6877D5FF&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:17:59', '2025-07-06 17:17:59'),
(1593, 'silver vape', '6281267779920', '6281267779920@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:00', '2025-07-06 17:18:00'),
(1594, 'ompeee', '6281289837039', '6281289837039@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840829_1411611603607981_6850918749007643606_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEpGniQOP0jCmq1gwKBusL8viJBs2Xnehi4lX9Yl3wHYg&oe=6877D74B&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:00', '2025-07-06 17:18:00'),
(1595, 'rizal sicepat', '6285773380356', '6285773380356@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399463_471977919040740_2872506959749795175_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE9lOkVZwQT0T0ced7u5zZvJO9_Wnw0ENzcqZYimkcz8w&oe=6877CC9C&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:00', '2025-07-06 17:18:00'),
(1596, 'Arya ASNET', '6289605494725', '6289605494725@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:01', '2025-07-06 17:18:01'),
(1597, 'mahdi radar bogot', '6285215621582', '6285215621582@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468588456_536696225855246_5238012385888448640_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFCEfW_qxbbnwqw5IlM_p92TYfxOr2w_UupPiYgCqyhGg&oe=6877D213&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:01', '2025-07-06 17:18:01'),
(1598, 'udin pojok figura', '6282225035252', '6282225035252@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:01', '2025-07-06 17:18:01'),
(1599, 'Acuy BT', '6285781112117', '6285781112117@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:02', '2025-07-06 17:18:02'),
(1600, 'Pubg 041', '628569020002', '628569020002@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483484182_8421224137980885_3943638395525006372_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHfw0yTdPe8OGkjWQcD6-PW0sGnMq1W6YXyBwT69yQHQA&oe=6877C8DD&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:02', '2025-07-06 17:18:02'),
(1601, 'Beno kamra', '6281313169375', '6281313169375@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/482117546_9128128927312985_1668890242067800679_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFwYwT0pZASlRvQCpI4NkovEoIvVIrc6jf7jx_buKDchw&oe=6877C080&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:03', '2025-07-06 17:18:03'),
(1602, 'kmi butati', '628121076509', '628121076509@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/297013537_530998128913175_3919203142482323760_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHlJYwV0bih5PljPOFW337gDjGwe8p_cX--Wo5DmDxmUw&oe=6877ABDF&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:03', '2025-07-06 17:18:03'),
(1603, 'bu ambar', '6285284667311', '6285284667311@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:03', '2025-07-06 17:18:03'),
(1604, 'outdoor. co. id 1', '6285233111156', '6285233111156@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491867263_1629667420934363_264033348960790828_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG04PyXh3WQCmhRMFxVlQmg53cIg9OsHSes_GfYF-0H2w&oe=6877DAD2&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:18:04', '2025-07-06 17:18:04'),
(1605, 'sidik', '6283807922121', '6283807922121@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483751071_1672174026725341_5313315329541758466_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGMODQA3bHWMJ81w_IXDoBtwagua5x4p9974e8Y7a1gBg&oe=6877B623&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:04', '2025-07-06 17:18:04'),
(1606, 'b miptah', '6289694522928', '6289694522928@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:04', '2025-07-06 17:18:04'),
(1607, 'sicepat faisal', '6283896929368', '6283896929368@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:05', '2025-07-06 17:18:05'),
(1608, 'Babeh', '6281310725502', '6281310725502@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/422401629_1237425930585832_7052975622283372821_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEQ1IYWpt9DPzazFMNhXXMLWe2TKRsHRUWboFzCS6TOWw&oe=6877D245&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:05', '2025-07-06 17:18:05'),
(1609, 'teteh tinder', '628129560149', '628129560149@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:05', '2025-07-06 17:18:05'),
(1610, 'smart David', '6282113686811', '6282113686811@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/406263817_366821409070770_7170587381689359413_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEdf0l--V11zqNoHtf5EKTgFlMatr10DLZW8Vca15Ctug&oe=6877CAEF&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:18:06', '2025-07-06 17:18:06'),
(1611, 'SI UJO', '90577269997761', '90577269997761@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491875259_1315922940103180_7649848939798331778_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFaSYqbqbqy5zALLIKYcrAubqpUBUovDhN0wgSvhp0vqA&oe=6877BAB6&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:06', '2025-07-06 17:18:06'),
(1612, 'Ferry GCR', '6285776138031', '6285776138031@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:07', '2025-07-06 17:18:07'),
(1613, 'dwi yuliana', '6289627246458', '6289627246458@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:07', '2025-07-06 17:18:07'),
(1614, '.', '6287808899927', '6287808899927@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:07', '2025-07-06 17:18:07'),
(1615, 'anah komputer', '6283811017968', '6283811017968@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:08', '2025-07-06 17:18:08'),
(1616, 'pulpstone', '6281949115657', '6281949115657@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55963741_671659220010807_8973627548382527488_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHZXMbSMBrG065jtIPQUdjjlmQ4c4s3baISA6gtHW6u_g&oe=6877CB81&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:08', '2025-07-06 17:18:08'),
(1617, 'Nitro', '6285607783337', '6285607783337@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508455564_3788645884766572_4011097326644181929_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3oeGnfzNeIU4o8jFmoMd4LEwC5fEq3sHEDDIyvTgr7g&oe=6877BA84&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:08', '2025-07-06 17:18:08'),
(1618, 'istri a dedi', '6289517734246', '6289517734246@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:09', '2025-07-06 17:18:09'),
(1619, 'vio op mct', '6285715880410', '6285715880410@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:09', '2025-07-06 17:18:09'),
(1620, 'jisung kprawa', '6283898588525', '6283898588525@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:09', '2025-07-06 17:18:09'),
(1621, 'Ipul PIK BU DEWI', '6281905221911', '6281905221911@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:10', '2025-07-06 17:18:10'),
(1622, 'anah komputer', '211282477203544', '211282477203544@lid', NULL, 0, '', '2025-07-06 17:18:10', '2025-07-06 17:18:10'),
(1623, 'andi atmo', '6285813786330', '6285813786330@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:10', '2025-07-06 17:18:10'),
(1624, 'nenden kprawa', '6289662962776', '6289662962776@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:11', '2025-07-06 17:18:11'),
(1625, 'ari Si', '6285723332226', '6285723332226@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55944301_2054283438197521_2532913364602978304_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGr5VyKsFYcQ1vBQq7jb68PmmRHxy5rDXwiPAW1lTAZyQ&oe=6877CA25&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:11', '2025-07-06 17:18:11'),
(1626, 'cw myrep', '6281210814295', '6281210814295@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:11', '2025-07-06 17:18:11'),
(1627, 'teh nani', '6281284921344', '6281284921344@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:12', '2025-07-06 17:18:12'),
(1628, 'oxygen cimelati', '6281398600882', '6281398600882@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473411974_1015155680563514_6293772380881255270_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE1Nor1W0m032tdHPdG1Q5Ek-PrXrHHF3n580oV26nxKw&oe=6877D68E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:18:12', '2025-07-06 17:18:12'),
(1629, 'Arkhan Abqori', '628161118608', '628161118608@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491838567_891026809816378_6409600736785047568_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFUN6TnGjkRVNpXOdKl9lXQV7pXPSEBhAbfj6L4XZ4osg&oe=6877D719&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:12', '2025-07-06 17:18:12'),
(1630, 'pak Ijat', '6281297154636', '6281297154636@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455263832_9075804605786582_5244115730848517133_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHBdDXXM7PE9_kmJHrLxvaus-s_wW4otIpPF0U0zn9VSg&oe=6877CFFD&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:13', '2025-07-06 17:18:13'),
(1631, 'GCR Kurniawan', '178537562648771', '178537562648771@lid', 'https://pps.whatsapp.net/v/t61.24694-24/509721905_3561391324170345_967086381940274480_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFyqZyzD8nM7omu3JAZLOp0DCk2-aJSZ9NBSLAphnFNpw&oe=6877CE63&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:13', '2025-07-06 17:18:13'),
(1632, '🩷Nenty🩷', '6289636217337', '6289636217337@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:13', '2025-07-06 17:18:13'),
(1633, 'Bagus pubg', '179602899087476', '179602899087476@lid', 'https://pps.whatsapp.net/v/t61.24694-24/488868889_1125724612642201_7702454099209846991_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG9hpV_X_7OzYeTIKRCh75vdB7EVWSgDpkhV0CXUvf1JA&oe=6877C6DC&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:14', '2025-07-06 17:18:14'),
(1634, 'Eglobaltech id', '385951688360', '385951688360@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/436803735_1639755446803490_8623694691508619221_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE7q6eOLqslqrahqpTOFgi7unHJlZCuN98jPEcR4ZonxA&oe=6877D12B&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:18:14', '2025-07-06 17:18:14'),
(1635, 'rhani prasetia', '628125559771', '628125559771@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:15', '2025-07-06 17:18:15'),
(1636, 'mi store caringin', '6289513304853', '6289513304853@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:15', '2025-07-06 17:18:15'),
(1637, 'undanan shopee', '6281902103838', '6281902103838@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/317680992_1220348838554536_4050557175602543844_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE_zhIYxkr-O_tNhdPWssGr4t2Afn2b6IazEgCnzJjW9w&oe=6877BFFF&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:15', '2025-07-06 17:18:15'),
(1638, 'onu kingnet', '6285934382759', '6285934382759@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/317696188_159162410168085_2087668559904373224_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFdT7KEOOPa8Uh_T5KVn-davL7L2g0xu1VUGtDKJhmW_A&oe=6877A917&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:16', '2025-07-06 17:18:16'),
(1639, 'BJK Komputer', '6281323458499', '6281323458499@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/411222568_3545596588996578_1469645981624713958_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEvocQbsEN3ZB5Xfsxa6Myyk9hpVpNFtsq4kDREO4SzLA&oe=6877BC07&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:18:16', '2025-07-06 17:18:16'),
(1640, 'om lomee', '6285216710815', '6285216710815@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/412470375_1516834292212838_4177825492412375907_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGxpxy60-392KjU2rvjScaf7G1szFcwBEeJWFP8JfOgUQ&oe=6877C879&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:16', '2025-07-06 17:18:16'),
(1641, 'Hanifah nazwa', '62895352089537', '62895352089537@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:17', '2025-07-06 17:18:17'),
(1642, 'Rt Rwnet paski', '628562786460', '628562786460@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473411883_1009581444436885_1770042000751599850_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQYfDRYCelnUDWyO4ScwjcctV4v-X8H_j7uMbYvGIxlQ&oe=6877AE9C&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:17', '2025-07-06 17:18:17'),
(1643, 'ana J', '6285777321864', '6285777321864@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:17', '2025-07-06 17:18:17'),
(1644, 'mas tri vmala', '62817866796', '62817866796@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/406097380_295862590106788_4101547193838984938_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE9-be3pFZz4BaZwM1OFmdZrSdXbRT25ciJI5mcLJQj7A&oe=6877B30F&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:18', '2025-07-06 17:18:18'),
(1645, 'nayah aquatic', '6283891414403', '6283891414403@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:18', '2025-07-06 17:18:18'),
(1646, 'Part laptop bogor', '6285726924609', '6285726924609@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:18', '2025-07-06 17:18:18'),
(1647, 'Cubek', '628568184685', '628568184685@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/85546696_110577947095292_9014863344158856912_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEhhBr9MldeOpqC5NIEoPBO5T2G9r7I7K8FB_1Ffdrx4w&oe=6877D212&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:19', '2025-07-06 17:18:19'),
(1648, 'suciani ML', '6285753633497', '6285753633497@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505442807_713644581826729_1830875339658973985_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3AHRZkDw7NXfxuCqPJTXHonfPGlYv5xStDtiH-X6q5w&oe=6877AB46&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:18:19', '2025-07-06 17:18:19'),
(1649, 'germo', '6289652368795', '6289652368795@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:19', '2025-07-06 17:18:19'),
(1650, 'Kmi Tyas', '6281380174526', '6281380174526@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473402146_986725096639882_1902882003953890926_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEN3CrTm_Nq7BJpY86bxh-7tZ2usDm8Mpq4qaWwB9LAag&oe=6877A6D6&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:20', '2025-07-06 17:18:20'),
(1651, 'ustd ukieh', '6285711074816', '6285711074816@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491842556_1570871447222705_8211469207985750945_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEQwzHkfsixecT-qvVHz_0tsHu47H9lrEyR4Gw4qsvTeg&oe=6877CB4F&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:18:20', '2025-07-06 17:18:20'),
(1652, 'sewa splicer budi', '6281387241133', '6281387241133@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473398230_552370001131349_3793205874087734320_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEJp_2LkuE6d_j6bA5c9tfiu8V7pZ0aMq132Zg7fagswA&oe=6877DC2B&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:21', '2025-07-06 17:18:21'),
(1653, 'icha andraya', '6281317199371', '6281317199371@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:21', '2025-07-06 17:18:21'),
(1654, 'Esty IG', '6285365739791', '6285365739791@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:21', '2025-07-06 17:18:21'),
(1655, 'kmi pak komar', '6281225047007', '6281225047007@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868285_1044474914307490_2255174051754107087_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFq6Iah1Hy64rj9V2Qrgy-OPB_TrGEhHr2NOoOL3nNFZQ&oe=6877C0F0&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:22', '2025-07-06 17:18:22'),
(1656, 'Wahyudin kprawa', '6281586018830', '6281586018830@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/376464581_1365861750951239_1767532469364756529_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFoxdgkO1BxW2Ys2bPW7jJI3UlKOlLLLRB_PrT9Y0kkzg&oe=6877C5E5&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:18:22', '2025-07-06 17:18:22'),
(1657, 'manggo bela', '6285718324109', '6285718324109@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473412512_8742807579154595_8759331830042454374_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGN_xZQC4cT8BFKaI7_dtibLbcozscfIuOOvqKczyWEaA&oe=6877BA57&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:18:22', '2025-07-06 17:18:22'),
(1658, 'Arul NEW', '6282113342495', '6282113342495@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:23', '2025-07-06 17:18:23'),
(1659, 'Iman', '6281515678910', '6281515678910@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:23', '2025-07-06 17:18:23'),
(1660, 'PUBG IREN', '175406581837933', '175406581837933@lid', NULL, 0, '', '2025-07-06 17:18:24', '2025-07-06 17:18:24'),
(1661, 'Hardi buyatmi', '628179040298', '628179040298@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:24', '2025-07-06 17:18:24'),
(1662, 'Rena', '6285693757776', '6285693757776@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:24', '2025-07-06 17:18:24'),
(1663, 'cimong shonada', '6285692451927', '6285692451927@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/415535718_600681932199917_6075562634491729636_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhk5XW6G1RW4Tj7ZDf0ijnVBn-FqfNYiYEVhLHt6D_TQ&oe=6877B3F6&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:25', '2025-07-06 17:18:25'),
(1664, 'Firman Hadiansyah IPF', '6285771779811', '6285771779811@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:25', '2025-07-06 17:18:25'),
(1665, 'PUBG Kynaa', '6281288000240', '6281288000240@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:25', '2025-07-06 17:18:25'),
(1666, 'icha andraya', '1963420815503', '1963420815503@lid', NULL, 0, '', '2025-07-06 17:18:26', '2025-07-06 17:18:26'),
(1667, 'RIA', '6287770843454', '6287770843454@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508563553_1612660956096392_6908870226161477182_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFwThMYcoTxtEXq1E0TMVSOO6kLqZnfojxelyDYoGNCIw&oe=6877B061&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:26', '2025-07-06 17:18:26'),
(1668, 'abde didin udiklat', '271102764929096', '271102764929096@lid', NULL, 0, '', '2025-07-06 17:18:26', '2025-07-06 17:18:26'),
(1669, 'Randi ferdiansyah ASNET', '6281284690762', '6281284690762@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874335_1359298838485123_1018127204011950099_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG0PWWyLgivW9wu_M9uVs6KSTrX3eBuCdXyz-5uCiib3Q&oe=6877D938&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:18:27', '2025-07-06 17:18:27'),
(1670, 'DARA SEPTIANI', '6285893535771', '6285893535771@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:27', '2025-07-06 17:18:27'),
(1671, 'Anisa Anis kprawi', '62895336167343', '62895336167343@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468703687_1793263518178111_2464652514628103366_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGISRMUueiPrjKMJGNPv0qFswgvZpDz891L5sYp0o7VzQ&oe=6877C079&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:27', '2025-07-06 17:18:27'),
(1672, 'teleng stm', '6282111157040', '6282111157040@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/474774256_993648035638620_4427822921181400165_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wETh7WBtUItaGf4sNDWu9KHFxC6pY7OhrCgC2N22mjRRA&oe=6877C084&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:28', '2025-07-06 17:18:28'),
(1673, 'Pascha elta', '6282311785725', '6282311785725@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:28', '2025-07-06 17:18:28'),
(1674, 'Rudi RW NeW', '6289516975668', '6289516975668@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/466052253_1498329324159168_3715088860106107525_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEKADTbG5oIZn6PYuNJSa_nLgmtvQ_WpNA1ExsyZX8S9A&oe=6877D35A&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:18:29', '2025-07-06 17:18:29'),
(1675, 'Gozel Ahmad', '6283811933550', '6283811933550@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397006_1591743978175812_2407187824535898710_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHrPttmoBdReUe3hpfyyRignvXmdELfaTY4wU7x5sY8Wg&oe=6877DAE2&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:29', '2025-07-06 17:18:29'),
(1676, 'jci tri', '6281273597522', '6281273597522@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506982167_2239401403161008_3941546448318542030_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFPNu6sL6-wSCsATvZR6kIi4wbA6ckjjrUQRaE0RV_Fsg&oe=6877AE7B&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:29', '2025-07-06 17:18:29'),
(1677, 'HJ Edi', '6281808419174', '6281808419174@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:30', '2025-07-06 17:18:30'),
(1678, 'Ricky ASNET', '6281292147341', '6281292147341@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:30', '2025-07-06 17:18:30'),
(1679, 'smart pa ded', '62818723136', '62818723136@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:30', '2025-07-06 17:18:30'),
(1680, 'teh nur', '6285711835700', '6285711835700@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491882767_1828573041057306_6650515877346507730_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFIALq-K8x76XxCq2jOMrOhE-iHv4Q3YPxiPvDOAGwrhw&oe=6877BF3D&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:31', '2025-07-06 17:18:31'),
(1681, 'NEMO.TECH', '6283133326024', '6283133326024@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427419298_444838191872172_7087055269017760148_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEPF7BRI0MfoN9WOPBRgjE3pMtKBUD0lczNbxgqktLDGQ&oe=6877B7BC&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:31', '2025-07-06 17:18:31'),
(1682, 'Fajar Arif Muttaqin RT RWNET BOJONEGORO', '6282140501327', '6282140501327@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:31', '2025-07-06 17:18:31'),
(1683, 'Erie Ch grand cempaka', '128621536628779', '128621536628779@lid', NULL, 0, '', '2025-07-06 17:18:32', '2025-07-06 17:18:32'),
(1684, 'indihome cisarua', '6289651484969', '6289651484969@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457198404_1093845098972667_6758514698839029881_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHn5lPoRrzAgVTTJL-I3EtygVW9aYHv-TJEXZi7qNl2uQ&oe=6877B511&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:32', '2025-07-06 17:18:32'),
(1685, 'Teh tuti sasmita kprawa', '6289687898083', '6289687898083@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:33', '2025-07-06 17:18:33'),
(1686, 'jci suroo', '628989826702', '628989826702@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:33', '2025-07-06 17:18:33'),
(1687, 'otong sexy', '6283811384418', '6283811384418@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868251_1721522215235817_3906950385190509350_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHlb2EHdmHDypcGLSHfUM_kGei1FVyFAK2hEL7MslZlRw&oe=6877CBEE&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:34', '2025-07-06 17:18:34'),
(1688, 'bapa hendra client sablon', '6285715338740', '6285715338740@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:34', '2025-07-06 17:18:34'),
(1689, 'kost piero', '6281316248665', '6281316248665@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:35', '2025-07-06 17:18:35'),
(1690, 'teh iti fadila zovanka', '6285714822057', '6285714822057@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:35', '2025-07-06 17:18:35'),
(1691, 'bu anes', '6281295846823', '6281295846823@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491886646_1262147928946521_5319061643870660248_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFYJhNLbSpCPLBY_uHYq9-sqGrmlN-nPY9XCemEiL0lWw&oe=6877D9C1&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:35', '2025-07-06 17:18:35'),
(1692, 'vina', '6289683086321', '6289683086321@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:36', '2025-07-06 17:18:36'),
(1693, 'view', '6282216767252', '6282216767252@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:36', '2025-07-06 17:18:36'),
(1694, 'Adi Sofiyan trafic counter', '6285215187404', '6285215187404@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:36', '2025-07-06 17:18:36'),
(1695, 'made si', '277094160453753', '277094160453753@lid', NULL, 0, '', '2025-07-06 17:18:37', '2025-07-06 17:18:37'),
(1696, 'SYEHK ZAZAT', '6289662924000', '6289662924000@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874423_976615910946904_37174871114704285_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEqxatXAyXqSTGaSamsoRHou0IPciMUvB6nZ-TEt8zCEw&oe=6877B347&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:37', '2025-07-06 17:18:37'),
(1697, 'FADILA SABU', '62895611954719', '62895611954719@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/514243603_1856497531748438_4266652172354544452_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGY8gSz5_vJ43-KjpDKWWKhQbdLD-zxk0IsBOIW88Edow&oe=6877C2A7&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:37', '2025-07-06 17:18:37'),
(1698, 'Bool', '62895322460777', '62895322460777@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/423816275_806050201542088_7683103866708560135_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGun-R0Xq4a47FWYpDYfeD6Io5sWqzW9xattbHvmEnFtQ&oe=6877D16F&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:38', '2025-07-06 17:18:38'),
(1699, 'ROFI-Cahaya Anugrah Teknik', '6285233789289', '6285233789289@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401569_4000592236885701_295362828443632641_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE3IyxXuKyfe_KyKL2e1FvW4tRO-gzA-vCylyoZGHbuKQ&oe=6877B0D4&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:38', '2025-07-06 17:18:38'),
(1700, 'mei bu aida', '62895371105447', '62895371105447@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:38', '2025-07-06 17:18:38'),
(1701, 'rafi vmala', '6289624253459', '6289624253459@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:39', '2025-07-06 17:18:39'),
(1702, 'om agus', '6287874928295', '6287874928295@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:39', '2025-07-06 17:18:39'),
(1703, 'cagur wa', '6285714103579', '6285714103579@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399450_532928012535365_1751279693252221324_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGFqC9-4hPKyEDhtgD_w_BUbIw4D2z5eQn6PAenvvBgaw&oe=6877C467&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:40', '2025-07-06 17:18:40'),
(1704, 'Deddy kprawa', '6287870642922', '6287870642922@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:40', '2025-07-06 17:18:40'),
(1705, 'istri sekdes & Dzakiy', '6289519183837', '6289519183837@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:40', '2025-07-06 17:18:40'),
(1706, 'Mas deni YAU', '6282139776997', '6282139776997@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878959_1849444752567058_5790701540077495524_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFx3jcVsf0eF4hIJoHuB_19_KyPnPSMXA90TYwCd8a65Q&oe=6877BB59&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:41', '2025-07-06 17:18:41'),
(1707, 'yusril', '62895622139462', '62895622139462@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/465924924_1249919439464530_809598237901002360_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEoDQ63FHfmXubuYrMMxe9fnM62DTKfaoui0Fy-fdpf6w&oe=6877D0D8&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:41', '2025-07-06 17:18:41'),
(1708, 'rio bus', '62811968444', '62811968444@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:42', '2025-07-06 17:18:42'),
(1709, 'Gian anggiwa JALIM', '6285817899475', '6285817899475@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:42', '2025-07-06 17:18:42'),
(1710, 'DTF SPS LAUTAN WARNA', '628118959678', '628118959678@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491846022_709055082060878_5605244274205851334_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEYnGDQxtTmTW8Umds_KwCSUyIZgcm6YERQV1skL0DtxA&oe=6877B1E5&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:42', '2025-07-06 17:18:42'),
(1711, 'deryan biznet', '6287872010069', '6287872010069@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:43', '2025-07-06 17:18:43'),
(1712, 'grosir kaos bogor', '6285782528126', '6285782528126@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875917_1327048585063642_5920099994223293007_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG0CUdQ5CdBuGU4YjeG4svsdFKUf4MdEe9ikAZ69LsYHg&oe=6877CD47&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:43', '2025-07-06 17:18:43'),
(1713, 'Selaras SPS', '628176676899', '628176676899@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:43', '2025-07-06 17:18:43'),
(1714, 'kuy vilage megamendung', '6281230001699', '6281230001699@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473402115_1234394668106419_6567469121889407948_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFZhp9_7KRw0EkelTsFFk5WWq260R6V4rfuIs5rYEU2qw&oe=6877CE5D&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:44', '2025-07-06 17:18:44'),
(1715, 'jual note fe nipu', '6282189857567', '6282189857567@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:44', '2025-07-06 17:18:44'),
(1716, 'konduit shopee', '6288225977821', '6288225977821@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405756_1927480741112461_3209467668920436198_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEoVgelBXudp6ui8rE2rnGRqToUs_8mwd-4fZGxlr-KLg&oe=6877D87F&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:44', '2025-07-06 17:18:44'),
(1717, 'smart olin', '6285692683136', '6285692683136@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/431671982_1708770242860200_7263668102233252602_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEQhr5BJBYTPe8bmoLO4770FFb7lB5rmy08Px6e2h3bBg&oe=6877C2F1&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:45', '2025-07-06 17:18:45'),
(1718, 'ustad nanag vmala', '6285782517022', '6285782517022@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:45', '2025-07-06 17:18:45'),
(1719, 'yessi teras air', '6289621234227', '6289621234227@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:46', '2025-07-06 17:18:46'),
(1720, 'jual motor', '6283141325852', '6283141325852@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:46', '2025-07-06 17:18:46'),
(1721, 'A mul jkt', '6281284012567', '6281284012567@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:46', '2025-07-06 17:18:46'),
(1722, 'Tiar', '6281295584841', '6281295584841@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868914_671887832428894_3969641876608804883_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHVT4NLqjYP7dD_YY4-MzoHw1RTdUiRm7bcGsEFGNeQ9w&oe=6877B89A&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:47', '2025-07-06 17:18:47'),
(1723, 'Bos Oji', '628128239484', '628128239484@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/164970729_4461077673902903_4121644228323125966_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF0sJhI-lWHtPggVSqB3rkX30k1vE2HABO8SfT7qUdioQ&oe=6877B99B&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:18:47', '2025-07-06 17:18:47'),
(1724, 'Gilang', '6287770911102', '6287770911102@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/484568890_690225853562971_5433600901166268279_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHJYnTZSEQ8KpQxtPidTn1Za_xb1So-LVecJuikW661UQ&oe=6877BBBE&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:47', '2025-07-06 17:18:47'),
(1725, 'bee nuri', '6281239362576', '6281239362576@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405934_1901840230632761_595575203212421513_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGgzixfJBTMZ-V2FgGNuL7jyNor-LDXB5oEIFNi2b2cKA&oe=6877C8C7&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:18:48', '2025-07-06 17:18:48'),
(1726, 'Ritaa Resita budi sudarsono', '6281212695336', '6281212695336@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/486294438_2147828988986400_4939707723582462385_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFtMZHPVFiMdc2f9HWIVPtkGNTwp0DxCKYPx4yz4UPT5A&oe=6877A726&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:48', '2025-07-06 17:18:48'),
(1727, 'dede bencoy', '6289682613526', '6289682613526@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/302308767_2358230991009930_7973509547754569768_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEiXQaTuYZgZBUtbPhv765rNSGLsSgYc3WiXO4pAPsACQ&oe=6877B440&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:48', '2025-07-06 17:18:48'),
(1728, 'mintarsih kprawa wifi', '6285892901594', '6285892901594@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508648995_592725223641616_2685360954161896954_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wETEaKq3buhNAYtoooZ0WCFdu5mfMs2YkJrMKIFSCl5Xg&oe=6877CEA3&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:49', '2025-07-06 17:18:49'),
(1729, 'FARHAN BRI', '6287808028235', '6287808028235@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:49', '2025-07-06 17:18:49'),
(1730, 'Citra', '100129159794942', '100129159794942@lid', NULL, 0, '', '2025-07-06 17:18:49', '2025-07-06 17:18:49'),
(1731, 'smart ardhy', '6281284007772', '6281284007772@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:50', '2025-07-06 17:18:50'),
(1732, 'Pak arif PMB', '6287883983404', '6287883983404@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:50', '2025-07-06 17:18:50'),
(1733, 'Kmi Nur stiasih', '628811280970', '628811280970@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/511012786_1761955137690120_24263523145545352_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHUpumOBYJHCnajCfs_onGZNzvrOVugHjqrVsyMrBWG1Q&oe=6877D747&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:51', '2025-07-06 17:18:51'),
(1734, 'reyhansyah vmala', '6285716046587', '6285716046587@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483658734_902311851929127_8355732060925222589_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFajuJxvWWfKyG80o1Y4UzUgRO8W6xmCsaTwWYSifacNA&oe=6877C2C9&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:51', '2025-07-06 17:18:51'),
(1735, 'bulani toang', '6287742003045', '6287742003045@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/424527279_917640956236213_2283638065941635522_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFW6Icb--gFljHCnIX6URw8K1k6oz6ebvdQ3zXvl7XHuQ&oe=6877D458&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:51', '2025-07-06 17:18:51'),
(1736, 'Bolang Lagi', '6281382247754', '6281382247754@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:52', '2025-07-06 17:18:52'),
(1737, 'lik sukimin', '62895613106332', '62895613106332@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473410263_1144206564025496_2481239106496628269_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wENkpiYnDri2L08T1-W0WrFV1Cy-VhOioFfq15g8HvPlQ&oe=6877D3FC&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:18:52', '2025-07-06 17:18:52'),
(1738, 'ibu tatang sekdes', '6289614517408', '6289614517408@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875893_1139826148192131_475761163254692774_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGe9ufK9wGETEzu5h73zPMLLb3rDguo7HMHJMUdy_8nqQ&oe=6877D967&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:18:52', '2025-07-06 17:18:52'),
(1739, 'FAN LED Reklame bandung', '6289651383147', '6289651383147@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840895_722501304044840_5609339334141744294_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHxZBxMoT_EGMOjCqXMuo1Lx8PiVNd12kg13oh5VDoLbg&oe=6877C9E6&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:53', '2025-07-06 17:18:53'),
(1740, 'Y A YA kost  ciawi bocil', '6289516160533', '6289516160533@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:53', '2025-07-06 17:18:53'),
(1741, 'istri samsul edi vmala', '6281285240044', '6281285240044@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473396809_532618109830770_4285533552754522936_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEXmMARrfrprJsGaVuP7P7dLsl_dJGUxgsD7N7l6JMJwQ&oe=6877ACCF&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:18:53', '2025-07-06 17:18:53'),
(1742, 'hj dede', '6283819133916', '6283819133916@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491873178_1114154143812024_3929774395922979900_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHFsMy5iZrf74da-Ir7yaJ5Sc78Qx9lR0tDu5A4NQ8o0g&oe=6877D8B0&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:54', '2025-07-06 17:18:54'),
(1743, 'Karya', '62895350286919', '62895350286919@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506897835_1381331629616762_464713080307419656_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFmEGL3Hp51-gXSVRanfjreTNGgFs3HguP5aVsfuyzusw&oe=6877B461&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:54', '2025-07-06 17:18:54'),
(1744, 'diben aquatic', '6285736226049', '6285736226049@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/418586111_2534273250296809_5419590112540785110_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGRzUzHKu3udOGlQrYc3l_gfROh3HRatJVZ1s7AbeOdjg&oe=6877C99A&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:18:54', '2025-07-06 17:18:54'),
(1745, 'service splicer bogor', '6281287561367', '6281287561367@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457505618_529181963114476_7827958958158484421_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHmFDJPAQEh1LURvp7yiQY_cVOvkj8Yzf9Oeb1dNC4XMw&oe=6877DD82&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:18:55', '2025-07-06 17:18:55'),
(1746, 'topup', '6281294322879', '6281294322879@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:55', '2025-07-06 17:18:55'),
(1747, 'Bapak isna', '628159702213', '628159702213@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:56', '2025-07-06 17:18:56'),
(1748, 'kelewih new', '6287863683431', '6287863683431@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:56', '2025-07-06 17:18:56'),
(1749, 'GCR Kurniawan', '628121806524', '628121806524@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/509721905_3561391324170345_967086381940274480_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFyqZyzD8nM7omu3JAZLOp0DCk2-aJSZ9NBSLAphnFNpw&oe=6877CE63&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:56', '2025-07-06 17:18:56'),
(1750, 'Bu iyyam', '6282167569474', '6282167569474@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:57', '2025-07-06 17:18:57'),
(1751, 'FEBRI SOS', '6285782948188', '6285782948188@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454512915_2270942753268006_5958146122773270335_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGqUy4X74ulEmMzu_h-40EzyHnD4mk6G2UKBaCstnBQcg&oe=6877BB40&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:18:57', '2025-07-06 17:18:57'),
(1752, 'teh sri karya', '6289673635454', '6289673635454@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876352_1329026064840241_2282666550943603119_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGCmpCXnspCsBWDELWEA5e5YZpbvcYNl2TN9AFZW05u_A&oe=6877B875&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:18:57', '2025-07-06 17:18:57'),
(1753, 'A iyang vmala', '62895331100249', '62895331100249@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399911_1570471400322621_2145278296200649474_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHS4lx3NGYb6VNDkZ2gZb5SAYejj8mCPAnkrbZNfLGZ1w&oe=6877C834&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:18:58', '2025-07-06 17:18:58'),
(1754, 'Iren', '6281545174115', '6281545174115@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513710979_741026321641600_2337431891342706320_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF463r50ZcsL7sjgDBZ9HeVEucEsvDHid-o8vnmeD4_rA&oe=6877AE16&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:18:58', '2025-07-06 17:18:58'),
(1755, 'PUBG MASKUY', '62895330891443', '62895330891443@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:18:59', '2025-07-06 17:18:59'),
(1756, 'casing x86 jaktim', '6281279475778', '6281279475778@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/406059603_334117062722082_5798187348971423300_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFEvoGB1dgqY8MkRanZlJG-94kJBY0vDelQSUmKA270Ww&oe=6877DD88&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:18:59', '2025-07-06 17:18:59'),
(1757, 'acuuu', '6285770033967', '6285770033967@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/470494148_1604364940448875_2536012197906938268_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHag_VC_ehWv9O5QzkHnRBdUcz9j2dPxbgWnIKAJ9EqwQ&oe=6877D225&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:18:59', '2025-07-06 17:18:59'),
(1758, 'si anen', '6287874955457', '6287874955457@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:00', '2025-07-06 17:19:00'),
(1759, 'pit obo', '6289527158080', '6289527158080@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:00', '2025-07-06 17:19:00'),
(1760, 'Bogor grosir cctv', '6285693007488', '6285693007488@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/471750185_1831976687545662_8149875676141175717_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHrpnuf6zutMCTkDzGcFJqEkarnSpSQu8trPYqgoR9Wmw&oe=6877BB6B&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:00', '2025-07-06 17:19:00'),
(1761, 'udin bisznet', '6289523372298', '6289523372298@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:01', '2025-07-06 17:19:01'),
(1762, 'yuliarti', '6287770017456', '6287770017456@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508563862_1223787802201086_5086536227335125691_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGrTW68YfWje1hUHWkD4xC_HJWfJX4rp-QzafzTNm68JA&oe=6877D381&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:01', '2025-07-06 17:19:01'),
(1763, 'longor Si', '6285718110249', '6285718110249@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:01', '2025-07-06 17:19:01'),
(1764, 'arfan', '6282210484707', '6282210484707@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:02', '2025-07-06 17:19:02'),
(1765, 'kmi pak hendra', '628119935929', '628119935929@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/424425263_1140820543941767_8503462063263447558_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHmTLbMaAX2QOWZBhjuZZDYc4a6VupxJVIZlca7D_-A6Q&oe=6877B9F1&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:02', '2025-07-06 17:19:02'),
(1766, 'Pa Dudung Abdullah', '6282115123720', '6282115123720@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/206814653_3068894266711114_3231106883652709101_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHgJ71Nq7lJzATcuY_TtnGioEx-YtFR12YHtkxl0BXG5w&oe=6877B95D&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:02', '2025-07-06 17:19:02'),
(1767, 'rachmawati hostddns', '62895614433778', '62895614433778@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/445995842_475514281538217_3891236027982057898_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHIx5lF6B6iXLLzoAIjm3kzODM_bMDEMpFPWsQroNXvhQ&oe=6877C1C7&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:03', '2025-07-06 17:19:03'),
(1768, 'kmi ayuma', '6285732767662', '6285732767662@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506021643_1667700590550117_6512779009965472226_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGPWJil35KeIB_Lc_RrkOo5OL196-dzHXUwyFYCCkaBBw&oe=6877BB24&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:03', '2025-07-06 17:19:03'),
(1769, 'sperpart ac bogor', '6287820912253', '6287820912253@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875257_2098911710581047_8542399975307755826_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFRBC2EA4pt67wX4olHwEE2OP2_7LydCsZ0grOVDxRkMg&oe=6877BC64&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:19:03', '2025-07-06 17:19:03'),
(1770, 'M R. Nawawi', '6283892704133', '6283892704133@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:04', '2025-07-06 17:19:04'),
(1771, 'om abun', '628979949697', '628979949697@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:04', '2025-07-06 17:19:04'),
(1772, 'wc lee', '6281386318179', '6281386318179@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513509874_628553056284164_4161195585152640637_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH4WV5_T2uUXZNyWgBFTpAHfMpC1YG8jRLghojUdhXvFg&oe=6877C5B8&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:19:04', '2025-07-06 17:19:04'),
(1773, 'kaos polos cilendek', '6287855201035', '6287855201035@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488448739_1395309174978971_8532243918611730164_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHlcjXGBmCnDJEO2VHQz6wFkorw3SanMTqQjyPyfOeDtQ&oe=6877C450&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:19:05', '2025-07-06 17:19:05'),
(1774, 'G.net Usman', '6282114096090', '6282114096090@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506239065_1829226104606552_2320221573547644168_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG8YdHuuroYbR2PLUV9U6umHJtR93kc5RXnkuQuMsInTw&oe=6877BD4F&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:05', '2025-07-06 17:19:05'),
(1775, 'Bapa Khasanudin', '6281285313844', '6281285313844@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:05', '2025-07-06 17:19:05'),
(1776, 'Bos oleh oleh', '6281384947735', '6281384947735@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/181228966_1096487544167798_5093252689958641123_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGBOI5Vao-Xz81pdT3mJXSwKwuhmqtahVtwkFVv2oHLug&oe=6877B196&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:06', '2025-07-06 17:19:06'),
(1777, 'reset cctv hikvision', '6281222229728', '6281222229728@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473410428_1222448406123597_3563505899125490416_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHuhmSyo3J65LNfnXdumoz3isIfEIajileMlgVpFP7IBw&oe=6877BA21&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:06', '2025-07-06 17:19:06'),
(1778, 'cp 1', '6289696265789', '6289696265789@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/515770356_1444246669916399_72796736842267231_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFWyBZCPAtXz8YStxWNo_y1qK-FJ4nHUSglDaBK7SXsaA&oe=6877D9C9&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:06', '2025-07-06 17:19:06'),
(1779, 'sesilia lintasarta', '6281313795959', '6281313795959@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:07', '2025-07-06 17:19:07'),
(1780, 'ibu ainah kamal vmala', '6281931691815', '6281931691815@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491867361_1389901945940924_8885544644945086817_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFzr3tzj0bja529BNgTXcZHnmbs4CWVuHv_Ws0CA_oDrA&oe=6877D18A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:07', '2025-07-06 17:19:07'),
(1781, '*𝔄𝔰𝔶𝔲𝔯𝔞 𝔄𝔩 ℌ𝔞𝔡𝔦𝔰𝔱*', '6283819145386', '6283819145386@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:08', '2025-07-06 17:19:08'),
(1782, 'abil vmala', '6287838282637', '6287838282637@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:08', '2025-07-06 17:19:08'),
(1783, 'ruru marpaung', '6285368312661', '6285368312661@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:08', '2025-07-06 17:19:08'),
(1784, 'Fendy GRAND CEMPAKA', '62895326593220', '62895326593220@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/261382886_142307708138984_4626280990005988460_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wECVlF9_HDb4od7EmCnZdEPV14D8E9RaTvQkpIPuJJ8YQ&oe=6877B680&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:09', '2025-07-06 17:19:09'),
(1785, 'Sarpin PT NETVIELGroup Fiber Optik', '6287770003253', '6287770003253@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/438452938_2381468248872474_822859808603633116_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGgCXJtiSYXodty95pBGjiEmacHARhHsYtL0BkpwhScrg&oe=6877B042&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:09', '2025-07-06 17:19:09'),
(1786, 'Ali M3', '6285718635574', '6285718635574@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:10', '2025-07-06 17:19:10'),
(1787, '.**', '6285748825576', '6285748825576@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:10', '2025-07-06 17:19:10'),
(1788, 'Yuki kprawa Hermawan', '62895333291665', '62895333291665@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/360570819_1915611888803912_4681543858106739379_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGpao6r8SQUM0Fnc1zqXQDIZUudcaa3haNhYsmW57T1DA&oe=6877CC15&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:10', '2025-07-06 17:19:10'),
(1789, 'kiki engkong', '62895415340044', '62895415340044@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:10', '2025-07-06 17:19:10');
INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(1790, 'Aep Diding JCI', '6281294289199', '6281294289199@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:11', '2025-07-06 17:19:11'),
(1791, 'kodok kp.rawa', '628974419109', '628974419109@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871315_1914826889285180_5193867213076124951_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQ5j2Yu5hm9W10V5GNl0KgnqCqpMndshBOpsjs4A0gkA&oe=6877B688&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:11', '2025-07-06 17:19:11'),
(1792, 'Tamam DGADOG', '6285717904681', '6285717904681@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:12', '2025-07-06 17:19:12'),
(1793, 'jp elektrik bogor', '6281380249764', '6281380249764@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/256423778_2961391437460412_1304763380529211282_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFtCfQinE0t2EXXQ-svLjNqJ8x6To9WavvXKFF0AhPlpg&oe=6877BC5D&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:12', '2025-07-06 17:19:12'),
(1794, 'Jejen', '6285715944179', '6285715944179@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/68874233_482998785587608_3289703824977035264_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFZySCjMd0sZWno-WpINpnrYh5hQTunrLY9x2EY5NzKWg&oe=6877B766&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:12', '2025-07-06 17:19:12'),
(1795, 'om sabo Telkom', '6281283886196', '6281283886196@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/479744140_1175379297038772_1096030996410141461_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF7grvOOqHJzguKzpgifKH1kp8cSq2qo3wXeHla3O88FQ&oe=6877BF8A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:13', '2025-07-06 17:19:13'),
(1796, 'Deni Desa', '6285717171489', '6285717171489@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/442413818_7989787464421532_4510651495210602780_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEUIeNubNZiXUlVjP57feaYf4zLo9INZqTM3ZF8IUBslA&oe=6877C8EE&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:13', '2025-07-06 17:19:13'),
(1797, 'PUBG BIGBOS', '6285337820966', '6285337820966@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:13', '2025-07-06 17:19:13'),
(1798, 'DIMAS WAHYU', '6287711367056', '6287711367056@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:14', '2025-07-06 17:19:14'),
(1799, 'Yustina Anjani', '6281293052441', '6281293052441@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/466559234_1062302372255185_7550526709002160350_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEcXax0VQZ4WTnD8TGTik65JPOIoiFQ6LZT5RYDk5Lqbg&oe=6877AB4B&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:14', '2025-07-06 17:19:14'),
(1800, 'kaos polos intro', '6281918201777', '6281918201777@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:14', '2025-07-06 17:19:14'),
(1801, 'Nizar Novianto', '6285700801300', '6285700801300@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/377361248_1065430717716975_4238279326018834148_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF4Z8k9aphGEdUVZZPQoAI7OdA6XdG7l9yCxa6DjpsFuw&oe=6877C1AD&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:15', '2025-07-06 17:19:15'),
(1802, 'Safitri', '6285817495303', '6285817495303@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:15', '2025-07-06 17:19:15'),
(1803, 'Part laptop bogor', '114327768047630', '114327768047630@lid', NULL, 0, '', '2025-07-06 17:19:16', '2025-07-06 17:19:16'),
(1804, '1', '6281585681955', '6281585681955@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/467332539_538534429086263_2373729872355265526_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF3S5d3JR7NoR0vmC16R_hYFTtmUZMvMVXVf1Q8Ouh2xg&oe=6877A79C&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:19:16', '2025-07-06 17:19:16'),
(1805, 'Bieh', '6285842265565', '6285842265565@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:16', '2025-07-06 17:19:16'),
(1806, 'apotik sehat', '6285781120987', '6285781120987@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427771389_1644617576349351_5804155344328102272_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGbrih87tP1MpDUaMiQFHfMr9flrXRAstHIL_x5ioTAXA&oe=6877D3AD&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:17', '2025-07-06 17:19:17'),
(1807, 'mang adun cukur', '6281282266123', '6281282266123@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/299541498_1281866079220654_6318621990346839772_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEI5qVs04lpdOdvSSJsQ2mExoEODYmb4fkAP7xI8h5VGg&oe=6877B9C0&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:17', '2025-07-06 17:19:17'),
(1808, 'NADA', '200313483055260', '200313483055260@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491876700_1573532996649269_5873321636160268970_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFgr4fol1ggYq9uXAMiYX9LekWvUIhVV7W3hbkEAKZ_8g&oe=6877B1A7&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:17', '2025-07-06 17:19:17'),
(1809, 'ikbal kamra', '6289602897083', '6289602897083@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:18', '2025-07-06 17:19:18'),
(1810, 'Mba Nur ART', '6285722594227', '6285722594227@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866649_1707289146649985_689042541842743025_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGsnDG7q4YXikANwnXD_HcS2wUFNGXTdVjYEM0txY9ZQ&oe=6877C38B&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:18', '2025-07-06 17:19:18'),
(1811, 'marketing ISP', '6281283259933', '6281283259933@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:18', '2025-07-06 17:19:18'),
(1812, 'ustd agus', '6285718107019', '6285718107019@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506090919_708864145379444_52094918948879654_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHNpqPOsyaQYQyhko8vzqep1iwJE6RvMY1ICO6hPM1mMQ&oe=6877AB9A&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:19', '2025-07-06 17:19:19'),
(1813, 'aryani', '6287870530555', '6287870530555@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491883802_1170981385042828_4010188251421603796_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFUjhVyZe1wVJSChvXdaRy3JxVQ0gF-LWFm0W8Mukup9w&oe=6877C3A1&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:19', '2025-07-06 17:19:19'),
(1814, 'orion motor tajur', '6281399109977', '6281399109977@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/421974160_594038713004211_2928792755545776886_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHoO8-A9Vj3loXHQQgf6L6t7mlocX1x_00z29_CNPdVnA&oe=6877CBA2&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:19', '2025-07-06 17:19:19'),
(1815, 'om aldi', '628113877339', '628113877339@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:20', '2025-07-06 17:19:20'),
(1816, 'Vikon Doank SD PASIR ANGIN', '6281383983007', '6281383983007@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:20', '2025-07-06 17:19:20'),
(1817, 'Bu Ine 2', '6282261904023', '6282261904023@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473411183_4041027379556429_2596714328828862568_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEB0aXhk3_UtTaIa7gT1MJm_Fqozfk0AvVloyuryV-ANQ&oe=6877C2A6&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:21', '2025-07-06 17:19:21'),
(1818, 'Pak Opang SDN', '6287788144027', '6287788144027@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473409927_540258012463053_6968238327309054702_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGiziID94M-v8aWvmSNrbPWwMQOObJX-q_3v7ICvZliXw&oe=6877B937&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:21', '2025-07-06 17:19:21'),
(1819, 'alfi hjdaden', '6288210457493', '6288210457493@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473406923_515597611562552_1425813947169658903_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3esUOiIb131WydQnnlakgaXCHk0LsF7JQZq1a_62VUw&oe=6877B80A&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:21', '2025-07-06 17:19:21'),
(1820, 'pak mul', '6287787086458', '6287787086458@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:22', '2025-07-06 17:19:22'),
(1821, 'jual kawat kapas cipayung', '128475356770487', '128475356770487@lid', NULL, 0, '', '2025-07-06 17:19:22', '2025-07-06 17:19:22'),
(1822, 'Bonek', '6282246306662', '6282246306662@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/168728383_1206059523182506_2800301029628130684_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH00VIOmHOtgOMW52HMSkMxzjhPftpBqUmstICoGdPI5g&oe=6877D40F&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:22', '2025-07-06 17:19:22'),
(1823, 'Lik Waqi', '6287779178714', '6287779178714@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/441584692_3664058150511982_2310565835495952905_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wESqRssOyq2B1hVK7FDjDeYJRSYnXdrVOJobbtaLHd8ew&oe=6877C3B6&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:23', '2025-07-06 17:19:23'),
(1824, 'PT IPF Ziyad Al Mubarak', '6283827834319', '6283827834319@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/480116370_693524209697929_3916513209056660485_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG5UPY3672TrcaFguO7V_LcdDgBhWsMZcG4dN8aOGkyEg&oe=6877B5E5&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:23', '2025-07-06 17:19:23'),
(1825, 'cici sos', '6285892290380', '6285892290380@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427317025_1117672419677244_8898324575435528279_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHnuYcziUka9H3rfRUNdkM7i9wLWiRISZPv0gy6bdAJLg&oe=6877BEEA&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:23', '2025-07-06 17:19:23'),
(1826, 'Bodong', '6289614206854', '6289614206854@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/515483543_24934880832766218_1134943918710688061_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGj0PV3TJCM45h8NvrqAywFWjZtosW2p7nnzGbl1A_IVw&oe=6877B40E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:24', '2025-07-06 17:19:24'),
(1827, 'farid pa yoyo', '6281398386314', '6281398386314@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510409923_4154079968196591_4109452706100092518_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF042-kdjptKrNEJyGYvcsd0A1vXRLQR45YUmTpmiYwfg&oe=6877AA4A&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:24', '2025-07-06 17:19:24'),
(1828, 'wifi online bekasi', '6285811361008', '6285811361008@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/403938937_847647147056842_9133764536126206513_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGcChVDaz9KWR-qG2K0aL9WygIpdczNdHxMBvmdGoc7BQ&oe=6877B1AA&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:24', '2025-07-06 17:19:24'),
(1829, 'ani RT PANDI sumarni', '62895320962705', '62895320962705@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/445109627_806768721553633_3915809732698082282_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFDlCaLg2mpLszdeLOjbyOvgGNft0YuayVwlRcgPqvSKQ&oe=6877DBB5&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:25', '2025-07-06 17:19:25'),
(1830, 'WORK Bayu Waskito', '6285694920494', '6285694920494@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:25', '2025-07-06 17:19:25'),
(1831, 'Dhea Business', '6281293674400', '6281293674400@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:25', '2025-07-06 17:19:25'),
(1832, 'pa rahmat suzuki', '6281212748298', '6281212748298@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:26', '2025-07-06 17:19:26'),
(1833, 'alya inar', '119344726053009', '119344726053009@lid', NULL, 0, '', '2025-07-06 17:19:26', '2025-07-06 17:19:26'),
(1834, 'toaste booking', '6287874697565', '6287874697565@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491835066_1596732014331014_6968074672097953836_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFcdbOd5ygpDxT2-18oUu-JaL4IV4FP2IWaZP6s9vZy9A&oe=6877B76C&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:26', '2025-07-06 17:19:26'),
(1835, 'WA GW', '6285692961782', '6285692961782@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:27', '2025-07-06 17:19:27'),
(1836, 'velly Andra', '6283815237484', '6283815237484@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866702_1931142441047401_6131829065134242774_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHI_COveZuMTfQupcoLZ6j-z88EvIh9XYcFNEpdQliVtw&oe=6877CD58&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:27', '2025-07-06 17:19:27'),
(1837, 'kasminadi vmala', '6281280091540', '6281280091540@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455953322_1810813413006043_1560309946688583025_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHM4GPWDW_PtgFWW8jdoaWG6R0ItasO3hLsNxW-n3o0fg&oe=6877A9E8&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:28', '2025-07-06 17:19:28'),
(1838, 'Thorif raya food Sulhan', '6285777970280', '6285777970280@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473412257_975178247835743_2870347043662354142_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHIwOWe3_8dU9-7Bcm1KSXEV7WqoVlPR7Eer78mKQi7fA&oe=6877B336&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:19:28', '2025-07-06 17:19:28'),
(1839, 'Yani Suryani', '6283179959837', '6283179959837@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/504492433_1251318376581898_1507786630010345341_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF9YvnUUoLXXv0bpYmRmoyTyDGuG1m5QUPhYG3tlfYziA&oe=6877C481&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:28', '2025-07-06 17:19:28'),
(1840, 'aciw si', '628984204532', '628984204532@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:29', '2025-07-06 17:19:29'),
(1841, '𝑲𝒆𝒑𝒍𝒂𝒌 𝑺𝑷𝑬 sanjiwo meja sablon', '6287714910413', '6287714910413@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:29', '2025-07-06 17:19:29'),
(1842, 'mayaaaaa', '6287874884757', '6287874884757@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/487204434_995985918811578_4056198592219558860_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHqbsf7eiBCpyooZ37j44MKkQ43FnLKbLSnMcQYSHQPsQ&oe=6877D485&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:29', '2025-07-06 17:19:29'),
(1843, 'Fauziah Syamin', '6285776560005', '6285776560005@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:30', '2025-07-06 17:19:30'),
(1844, 'kmi eko ulfan', '6281296979102', '6281296979102@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/397268870_355031337180297_5948514894942387800_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFCkqtLE4QXmrrlCnZAkvB8pDYyO3nbhIBN8jrQmLsDww&oe=6877D85C&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:30', '2025-07-06 17:19:30'),
(1845, 'Wahyu Barata', '6285279969008', '6285279969008@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:30', '2025-07-06 17:19:30'),
(1846, 'jual poco 8 256 1,650 gadog', '62895404871860', '62895404871860@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/470468796_1491346644866914_1205412310370383112_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFR72lmwrZSKPt2F9TkFz_qS-6JD47c8EegW-sTEgrrzQ&oe=6877C0D7&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:31', '2025-07-06 17:19:31'),
(1847, 'Service hp Markas otodidak', '6281219374447', '6281219374447@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/346135554_232575079394644_6668598731129754603_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHaCQnTZ4QEZy1JiXXqoXp0BbM4R6YoXCmChVOOmDH_CQ&oe=6877C39E&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:31', '2025-07-06 17:19:31'),
(1848, 'indotrans data', '6281519051381', '6281519051381@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/420828551_3646734872304888_5445356590696329951_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE8A5wfDoPK8s0zFuLAN-G4Ws3L6aIuWhePYWE8OxAacg&oe=6877D710&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:31', '2025-07-06 17:19:31'),
(1849, 'kaos polos nakira', '6281291902129', '6281291902129@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/69550922_540088696730935_6484568046139604992_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGRzBAqWrdoI6GUwuZx0EvjmlWEX8OdxrlmsiStsVgZcA&oe=6877DC1B&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:19:32', '2025-07-06 17:19:32'),
(1850, 'yasin', '6289512560139', '6289512560139@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:32', '2025-07-06 17:19:32'),
(1851, 'Fellow', '628990624313', '628990624313@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:32', '2025-07-06 17:19:32'),
(1852, 'icha bodong', '62895386763934', '62895386763934@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:33', '2025-07-06 17:19:33'),
(1853, 'Lusiana yolanda', '6282320198998', '6282320198998@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:33', '2025-07-06 17:19:33'),
(1854, 'Wulan Rizqita Bona', '6285893077088', '6285893077088@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:34', '2025-07-06 17:19:34'),
(1855, 'Hesti bndungan bobo', '6289653881647', '6289653881647@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513058214_995120352543722_6957014724934214591_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFG0EjCJFBLRmDc1caK1phiY7UIt2jVFDyh1Ma84dwiAA&oe=6877AA9C&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:34', '2025-07-06 17:19:34'),
(1856, 'khalifah jws', '6285101269875', '6285101269875@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:34', '2025-07-06 17:19:34'),
(1857, 'Bonie Thea', '6283877454538', '6283877454538@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505216424_24361383656798970_5945677991097375626_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGPz5vHFAKB30WEJ7YjRB1KVMolAhSbZNvhQ3xSnqC_0w&oe=6877C3F3&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:35', '2025-07-06 17:19:35'),
(1858, 'service splicer', '6281287742809', '6281287742809@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:35', '2025-07-06 17:19:35'),
(1859, 'Mas mukshin', '6281903990303', '6281903990303@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:36', '2025-07-06 17:19:36'),
(1860, 'RNET PASMUN', '6289695097509', '6289695097509@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473403660_1390045675697590_1210093456086097972_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE6RJFUbKOx8eTuXESyipEHHSkR2t0pxWMueloYsdLiDA&oe=6877D766&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:36', '2025-07-06 17:19:36'),
(1861, 'aladin sablon sps', '6281293338775', '6281293338775@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/359679674_937017877384537_8891041889049252330_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE2J0IegcgnF7hFSh9y9CaVmVJ8NmApdbi7beTV5t96Yw&oe=6877B193&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:36', '2025-07-06 17:19:36'),
(1862, 'boim zedap', '6285886340299', '6285886340299@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/485516005_3040138616166900_5805395839460087380_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEHTQ1xXNAnxXkk1eNjRjXSvkVO2olhmIdB6nkFESaljw&oe=6877DB4E&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:37', '2025-07-06 17:19:37'),
(1863, 'vimala Alvi wijaya', '6281383092852', '6281383092852@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:37', '2025-07-06 17:19:37'),
(1864, 'pubg nausha', '6281210548274', '6281210548274@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491846602_3153900678118903_874160877426979466_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFmkGu8gKX5a_SIQdjzPUWsB3oVxn6xrSNqBShsC_qUIw&oe=6877BF3D&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:37', '2025-07-06 17:19:37'),
(1865, 'Syarimel Resort', '6282113675866', '6282113675866@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455183483_957466802913336_6898194484709786067_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFwuXJTRd3QaFOrYRRrFiB2yP0gzmcX0zZcyUeMf9TpLg&oe=6877BD9C&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:38', '2025-07-06 17:19:38'),
(1866, 'Puled', '628871379484', '628871379484@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397377_960451379539152_8286914359676229544_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG3Hg53ScYpqwDPPEBM84MxlhNpaHRD-7S4f4Z1WI-RGQ&oe=6877D684&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:38', '2025-07-06 17:19:38'),
(1867, 'SUCI MORATEL', '6281288713375', '6281288713375@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473412656_991187062865219_3549855631739517916_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHIJJLCwFbUKAl-brFY4oBfc1UzQmNhJe-J5oIaNnUXaA&oe=6877DDC1&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:38', '2025-07-06 17:19:38'),
(1868, 'kmi anas', '628158185046', '628158185046@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/141546062_255053466001072_1912251635720692450_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHm20p6IPlyZgLMBgwG9jEswZqsVjM3ewKxhCs6tG5TkQ&oe=6877BCF7&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:39', '2025-07-06 17:19:39'),
(1869, 'samsul bahri/edi vmala', '6281291992143', '6281291992143@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473399978_1212957414164825_7812180195331507664_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFr_CgkHlFr31LHk1R4_a56hAoupgsUeXNbMSmppkpXGw&oe=6877B387&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:39', '2025-07-06 17:19:39'),
(1870, 'Rizal KMI', '6289518854673', '6289518854673@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844445_3616411525331984_5130516586226976563_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH-5zIlgHreC9xg4Sws1po_DwL5PXsvWf7ZNT_0iuaN0A&oe=6877B60E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:40', '2025-07-06 17:19:40'),
(1871, 'ENGKONG NEW', '628561800967', '628561800967@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839057_1075527014622508_5259172532603685453_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFkIIooHVPadpAiZRxTqDC9wuQOtZ98WF8ga_lIjMCl8g&oe=6877CFA0&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:40', '2025-07-06 17:19:40'),
(1872, 'teh engkus kp.rawa', '6285771081797', '6285771081797@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/229976849_1281802168961439_7646277168974009535_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFZFQELNqIce3TufffSKJ9CVvuRfBaXOUaEuSL5meFzuQ&oe=6877A91B&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:40', '2025-07-06 17:19:40'),
(1873, 'kmi donald', '6281219792636', '6281219792636@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/106142685_715394512613068_7047704372042126802_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFHitfIAWQhulfqo643JZlN_oV_Nilrwi1_EkX8Sn4gGQ&oe=6877D9D1&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:41', '2025-07-06 17:19:41'),
(1874, 'Villa Cisarua', '6285888868966', '6285888868966@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473404567_593724253259463_8721326227336614799_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEPTQke65e8Y92jOA58gYfy9hddxiRT8eMYkIBkSai8qA&oe=6877DCF3&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:41', '2025-07-06 17:19:41'),
(1875, 'PUBG **', '63973672099996', '63973672099996@lid', NULL, 0, '', '2025-07-06 17:19:42', '2025-07-06 17:19:42'),
(1876, 'box panel', '628551935452', '628551935452@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/118816279_2409166452720416_991008313455118102_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFhliyksOar16Dim1yQBRAGj7aQYzMRWCEM8hSWYC0POw&oe=6877BF53&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:42', '2025-07-06 17:19:42'),
(1877, 'Adhi', '6289611400692', '6289611400692@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473398086_619509847702703_6634747390922584258_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGgpSqBOndZYQVWmrOTUNM0AoADSWIVfhncsETK3B5w6A&oe=6877AAD9&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:19:42', '2025-07-06 17:19:42'),
(1878, 'vc tato', '62895637363885', '62895637363885@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876677_3351004901720505_1848856297375127023_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEx1U9p-J4GGQtX9foLuaMJtjWfEoltnAmX5YoxtAGSjg&oe=6877AE07&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:43', '2025-07-06 17:19:43'),
(1879, 'M R. Nawawi', '114164559298664', '114164559298664@lid', NULL, 0, '', '2025-07-06 17:19:43', '2025-07-06 17:19:43'),
(1880, 'amelia vimala', '218691279028439', '218691279028439@lid', NULL, 0, '', '2025-07-06 17:19:43', '2025-07-06 17:19:43'),
(1881, 'bos yusman', '62818111638', '62818111638@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/351567073_254370927287741_6282278692918783279_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEz8lYJMCVOBqG7B_zahXji3bLp3gyjmpOOG-5-ZCcsfg&oe=6877C859&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:44', '2025-07-06 17:19:44'),
(1882, 'Ahmad', '6287780560073', '6287780560073@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:44', '2025-07-06 17:19:44'),
(1883, 'Puri Rahmawati', '6285777370068', '6285777370068@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/414765216_507038918466776_8753418415778238696_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGVZVqK-5rWt-1xYgPyVWMq5AmZGV_mmvYdhMdOZO17Fg&oe=6877CE34&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:44', '2025-07-06 17:19:44'),
(1884, 'Pak Kusnadi Jxb', '6287876196680', '6287876196680@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405899_1673090863625188_4357780242254716788_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFCfy397O3Xc1_iWs-UR1IkOlsdojGLmAx51dQV8k_zcA&oe=6877DE24&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:45', '2025-07-06 17:19:45'),
(1885, 'jci dodi', '6281316466868', '6281316466868@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868216_1209930750510404_6765093874313395033_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHL9Kj-k-RFKiVkO5aQOI5NDD6588UqmoJ9kLqg8vuPZw&oe=6877CC3A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:45', '2025-07-06 17:19:45'),
(1886, 'kmi andri mtc', '628179048855', '628179048855@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397945_1386011986089421_1708893061905863960_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHnpJNw6mKzu8jXUSxHIkWIr62NXpqJeIdkWIeTzths9Q&oe=6877DC43&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:46', '2025-07-06 17:19:46'),
(1887, 'mio m3 cianjur', '6285795434442', '6285795434442@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:46', '2025-07-06 17:19:46'),
(1888, 'HJ DED3 RW02', '6285780721216', '6285780721216@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:47', '2025-07-06 17:19:47'),
(1889, 'Oki Heryasnsyah', '628988547463', '628988547463@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:47', '2025-07-06 17:19:47'),
(1890, 'wa emung', '6289673346817', '6289673346817@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475199101_622147937336092_6654340531752724360_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEEjZW7oah9w8l8_OEx2xghyB55r4JJ9Gyz_3-voI77rA&oe=6877B4ED&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:47', '2025-07-06 17:19:47'),
(1891, 'Coing', '6285222140069', '6285222140069@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/509179534_1243111027481045_252778734101158737_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFvJAI-mJnqCZldP5UJavhDnHGc4kCK3v-qAE4yoc8Y0g&oe=6877D165&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:48', '2025-07-06 17:19:48'),
(1892, 'Clarisa fiber optic', '6289617690030', '6289617690030@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/424425123_2489211837948973_8008024454017220538_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFTuX16CDPoFgISJ6kKNXU28cJaJIIxdmL0VuM7AuXGPQ&oe=6877C6EA&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:48', '2025-07-06 17:19:48'),
(1893, 'putri beetlk', '6281770843312', '6281770843312@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:48', '2025-07-06 17:19:48'),
(1894, 'maulana rizkya  reviana', '62895617014716', '62895617014716@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:49', '2025-07-06 17:19:49'),
(1895, 'anak bu ine', '6285710343329', '6285710343329@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:49', '2025-07-06 17:19:49'),
(1896, 'ANNARA SUMANARA VIMALA', '6285872400131', '6285872400131@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871260_569236502712157_6733438587099545572_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFRgwWYeb5hEcRTYXZU7Uoy3YHwSMo2n7PGzFljUiVKsA&oe=6877C8EA&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:19:49', '2025-07-06 17:19:49'),
(1897, 'Awan Modol', '628814092183', '628814092183@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:50', '2025-07-06 17:19:50'),
(1898, 'jual vivo', '6285777217094', '6285777217094@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491843358_9971035332956971_1927886249734208672_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEWpB0YsMauFL7qjrmkaixeGfXvz7l094G7cpN0RmbsjA&oe=6877D6F6&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:50', '2025-07-06 17:19:50'),
(1899, 'nendi Auristella Alamsyah', '6281573355007', '6281573355007@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/446073988_2531030320429524_5643729157253235288_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHhF1qzm8CqarrcRjL5eqkso6hOuN-Yugds7yiMNBctZw&oe=6877C4E0&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:19:50', '2025-07-06 17:19:50'),
(1900, 'tika aktif 2', '60279933153332', '60279933153332@lid', NULL, 0, '', '2025-07-06 17:19:51', '2025-07-06 17:19:51'),
(1901, 'PUSPAJAYA POOL', '6281219138353', '6281219138353@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/343740118_571192471524468_1035743650063124996_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGn8a-HYFZNEenkjyjB5UnIYUsbVbCM31hHVrXg0RxxeQ&oe=6877AEAF&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:51', '2025-07-06 17:19:51'),
(1902, 'kmi tri', '6281359867901', '6281359867901@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473404533_1326951651679012_2749843048842967795_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE1jDs0wSHbsdPZX-_2TEVGVwoCa2Agzj3Dx_4g_klsoQ&oe=6877ADF4&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:51', '2025-07-06 17:19:51'),
(1903, 'IKMAL.ANYAR DEUI', '241716934250638', '241716934250638@lid', NULL, 0, '', '2025-07-06 17:19:52', '2025-07-06 17:19:52'),
(1904, 'Omdeden', '6281382488284', '6281382488284@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:52', '2025-07-06 17:19:52'),
(1905, 'SO arab pubg', '966500574780', '966500574780@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401232_1317024022882507_4404869084517386360_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEKKPbqqlLQvDIi3DIew1fCICVaTBoSAskY0b0_M0pNag&oe=6877ADC5&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:53', '2025-07-06 17:19:53'),
(1906, 'wc lee', '56010920173673', '56010920173673@lid', 'https://pps.whatsapp.net/v/t61.24694-24/513509874_628553056284164_4161195585152640637_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH4WV5_T2uUXZNyWgBFTpAHfMpC1YG8jRLghojUdhXvFg&oe=6877C5B8&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:19:53', '2025-07-06 17:19:53'),
(1907, 'gilang', '6287770054965', '6287770054965@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483665299_582079898201063_8976482644947401001_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEeHbFlVD_I-QOB1Aj9fxTvulFutLGj8cY25hfUtYjnOw&oe=6877B5E3&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:53', '2025-07-06 17:19:53'),
(1908, 'febrina vivin ramadiani', '62895328693178', '62895328693178@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491877667_10040827212680313_3884401288708330575_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHVImGUWNumJ0bdEktLdafhwMZTiF0CAQ0e0RB4lf3pqw&oe=6877ADC1&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:19:54', '2025-07-06 17:19:54'),
(1909, 'lisensi mikrotik', '628989611950', '628989611950@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55964176_1269162859915896_3439607787154309120_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHWgHYqoi3iS9523PtDBZqgSGE3VxKIeC1VbDLeUp4jkg&oe=6877CF2D&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:54', '2025-07-06 17:19:54'),
(1910, 'kmi arya', '6281314089932', '6281314089932@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473402171_1175448993942693_3657738476235075697_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHqSdBXvabVBQSmElxPtbJilOPnyoafTDDSO47Es7an3g&oe=6877CE0B&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:19:54', '2025-07-06 17:19:54'),
(1911, 'NIRERI', '6289521541485', '6289521541485@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:55', '2025-07-06 17:19:55'),
(1912, 'Ade budayat', '628121295391', '628121295391@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/56691622_373480176592675_8327499931161985024_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFoDB4Xr8iFQe8fY3or9WmZ03Znq_dEabhaVhIF4bfG7Q&oe=6877D4EE&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:19:55', '2025-07-06 17:19:55'),
(1913, 'vidy.yanuar', '6285894937157', '6285894937157@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:55', '2025-07-06 17:19:55'),
(1914, 'Om sabo', '6282113118717', '6282113118717@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454323084_8010157169069583_9115624367401860883_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHUEwQRhboQAKaebh_j2e6HPDJEBnDSwcAgdD4jklMoAg&oe=6877C514&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:19:56', '2025-07-06 17:19:56'),
(1915, 'Dede Supriyadi', '628118819707', '628118819707@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/431540261_2056423051403571_4537558126638197849_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF1NUy-aVyNKIc3OaRWj-fjlZiahiEFLY7epdEpAK7grA&oe=6877D2BE&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:19:56', '2025-07-06 17:19:56'),
(1916, 'gak jelas', '6289515287410', '6289515287410@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:56', '2025-07-06 17:19:56'),
(1917, 'druga foxy', '628989760480', '628989760480@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:57', '2025-07-06 17:19:57'),
(1918, 'sicepat dani', '6285691729297', '6285691729297@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:57', '2025-07-06 17:19:57'),
(1919, 'putra gunung PC', '6289605345210', '6289605345210@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839528_699884579454063_8334079535772508831_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH-lit-frVwObPmyQTCmyMY2I0_JxmhGj_2NZ1VGGwdsw&oe=6877AB4B&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:19:58', '2025-07-06 17:19:58'),
(1920, 'KENARI cipta karya network', '6281243933118', '6281243933118@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:58', '2025-07-06 17:19:58'),
(1921, 'mbak yani', '628122698877', '628122698877@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:58', '2025-07-06 17:19:58'),
(1922, 'smart Anto', '6285710180278', '6285710180278@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:19:59', '2025-07-06 17:19:59'),
(1923, 'bang jon gocar', '6281314505553', '6281314505553@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/436973786_1502963080428564_2256166474441740795_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGsvovVinNWtAjelXCX-jqHRqeuj47eSjyn2C-veF3Gg&oe=6877B2C0&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:19:59', '2025-07-06 17:19:59'),
(1924, 'sarah dewi safitri wifi rafi', '188497675722854', '188497675722854@lid', NULL, 0, '', '2025-07-06 17:20:00', '2025-07-06 17:20:00'),
(1925, 'Djoko Rompunk', '6285694077752', '6285694077752@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/168854187_2143646515800303_6984086983632648531_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG2kl8yABCEYuzLsuCZ0setXSvjrS3aOyz3SFODqFCk0w&oe=6877AE56&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:00', '2025-07-06 17:20:00'),
(1926, 'teing micet', '250259154456691', '250259154456691@lid', NULL, 0, '', '2025-07-06 17:20:00', '2025-07-06 17:20:00'),
(1927, 'Ateng', '6289531328444', '6289531328444@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491843269_1434283288006128_8933857514220442945_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHlo0Gdyn1gqPMcJF2W1j94M7aF2rraS6EkqDxUm7cqBg&oe=6877B31C&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:01', '2025-07-06 17:20:01'),
(1928, 'sap vita', '6281288761040', '6281288761040@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:01', '2025-07-06 17:20:01'),
(1929, 'kmi pak acep', '6281297084771', '6281297084771@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:01', '2025-07-06 17:20:01'),
(1930, 'telkom teknisi', '6281297948565', '6281297948565@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:02', '2025-07-06 17:20:02'),
(1931, 'MONYET PENIPU', '6285658839719', '6285658839719@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:02', '2025-07-06 17:20:02'),
(1932, 'yealink tokped', '6281296621539', '6281296621539@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/396320033_1032753924495955_5778781335312724955_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF8vruWdzk9yKw20TFdEnpDwRDDXlFRPGIO18EHqcDJcQ&oe=6877B086&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:02', '2025-07-06 17:20:02'),
(1933, 'DTF KEMBANG SEPATU', '6287800022118', '6287800022118@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872389_3958229571060872_4406930098116192487_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF2Znj5PCsfyS7puSODjCOemm6rL1gc_6UGol03Cqpj_w&oe=6877C785&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:03', '2025-07-06 17:20:03'),
(1934, 'Iyus kamra Maulana Yusuf', '6283819161148', '6283819161148@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:03', '2025-07-06 17:20:03'),
(1935, 'alex kamra', '6281585087036', '6281585087036@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876454_687282920855104_1662777792487358640_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHBEHjiGN69u3IwJQqQOSEq-aIcxof7W_lGJ6P_F7ltsQ&oe=6877C2A3&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:03', '2025-07-06 17:20:03'),
(1936, 'Agustian vmala', '6281383147433', '6281383147433@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871834_10055096001208670_8281505804092448870_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH85BFSWZwPivtkOgqgduyIJP1SeXR3wD1cEPcjuzu7Gg&oe=6877D50E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:04', '2025-07-06 17:20:04'),
(1937, 'SI UJO', '628995726386', '628995726386@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875259_1315922940103180_7649848939798331778_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFaSYqbqbqy5zALLIKYcrAubqpUBUovDhN0wgSvhp0vqA&oe=6877BAB6&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:04', '2025-07-06 17:20:04'),
(1938, 'ine vmala -irgi', '108967732752581', '108967732752581@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491840159_1196454068644443_2204156494371643828_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHml5Jj8FcpCnZTESJv3CqW4OiynWXBDaUWgGtYfvwjMg&oe=6877ABCF&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:04', '2025-07-06 17:20:04'),
(1939, 'jual kuota kaskus', '6285797323251', '6285797323251@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:05', '2025-07-06 17:20:05'),
(1940, 'toaste', '6281316669110', '6281316669110@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473406433_1181008416726439_8263564437715102113_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHz-ngn5Nw_7CiDYUZ33xoU3oP0ukabMjzPsjWMhkeOCQ&oe=6877CE51&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:05', '2025-07-06 17:20:05'),
(1941, 'anak pa hambali', '628568270773', '628568270773@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:06', '2025-07-06 17:20:06'),
(1942, 'telkom', '6281294455924', '6281294455924@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:06', '2025-07-06 17:20:06'),
(1943, 'given cell', '62817760123', '62817760123@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:06', '2025-07-06 17:20:06'),
(1944, 'kang burhan rancamaya', '6285799997222', '6285799997222@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840714_1232967208221703_7811630144362774144_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFWyvEfgePubT4CXg5kH9K9uU7QMfRUk70SGwMdj66NEA&oe=6877BCDF&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:07', '2025-07-06 17:20:07'),
(1945, 'interface master', '628978227807', '628978227807@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:07', '2025-07-06 17:20:07'),
(1946, 'oke print', '6285100726688', '6285100726688@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491877079_1204146627695453_2063703346431169090_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE6Xqc5iMEnJvDkn4PqTIpYFGSfOt2bVLK5qKpnBUHt5Q&oe=6877B501&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:07', '2025-07-06 17:20:07'),
(1947, 'jual note fe nipu', '165210799255562', '165210799255562@lid', NULL, 0, '', '2025-07-06 17:20:08', '2025-07-06 17:20:08'),
(1948, 'daus sabana', '6282110024125', '6282110024125@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:08', '2025-07-06 17:20:08'),
(1949, 'drone murah bogor 450rb', '6285890065986', '6285890065986@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:08', '2025-07-06 17:20:08'),
(1950, 'stepdan', '6281387938050', '6281387938050@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/236615524_353539479529537_8250559686982555310_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFBnqHK4y-hRAQ5hjwJBdHwwb84PVcgzwVVZUO45YEeKg&oe=6877BD9B&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:09', '2025-07-06 17:20:09'),
(1951, 'KAWAN VARIASI KACA FILM SUKASARI', '6282114765345', '6282114765345@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/429516805_3854448034879894_3962764206790805585_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFYV5Avpg1mFzbtiEYcszJZO_s1_jZLIVru5bSB9EaAAg&oe=6877AF2C&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:09', '2025-07-06 17:20:09'),
(1952, 'jci novi', '6285320115800', '6285320115800@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:09', '2025-07-06 17:20:09'),
(1953, 'Plau ok agus', '6285926574097', '6285926574097@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/471663294_1623371905216565_6062415230523334153_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEr4_7aUxAtUgJPvpNxb3wIbd-vtASucoyHX8kMyUstzQ&oe=6877BB21&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:10', '2025-07-06 17:20:10'),
(1954, 'istri maryono', '6285720632587', '6285720632587@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491838444_1416048086220473_1726158849587797802_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGowFhg4bd5aEQH1x2A_43lZ_lfSBjmSGWaUmxFufrUFw&oe=6877A97D&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:10', '2025-07-06 17:20:10'),
(1955, 'Pak RT Pandi 01', '6281319133641', '6281319133641@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/375877545_1071961000634331_6979154089923127407_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG9u3cT9latuYWfkLtl9KsOk3ll10dPY32f_TarcYOcHQ&oe=6877AF4B&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:11', '2025-07-06 17:20:11'),
(1956, 'Berli anak teh yuli', '6281385037591', '6281385037591@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:11', '2025-07-06 17:20:11'),
(1957, 'fajar cibedug', '628568690086', '628568690086@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/469580721_1642414189818901_544438208131055126_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHUSp97dzONUOK-jLP6XGf22880TFTAZBR5anttMBegNg&oe=6877BBFA&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:11', '2025-07-06 17:20:11'),
(1958, 'kodir tehnik ac', '6281936733233', '6281936733233@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/424432532_1016706079640419_5540379394826353452_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG9qpyJ1zNzVR0AIgjFbkqF7je1ZSiuy5ZPm_4ylMirHQ&oe=6877C378&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:12', '2025-07-06 17:20:12'),
(1959, 'indah artanti', '62895329049249', '62895329049249@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:12', '2025-07-06 17:20:12'),
(1960, 'bintang sukses elektrik box panel', '6282220600067', '6282220600067@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491878464_1781250249138884_3272491460546235855_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH_w_uxlWFW2tMa174ve862Y6R_CKJ3a3VWjbLOStv-Nw&oe=6877DCB6&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:12', '2025-07-06 17:20:12'),
(1961, 'Mamah 💞', '6289632317135', '6289632317135@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/467413926_563597803035153_1118254979832784560_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHshokZRYMeSr_VQXAUDkS3wzNJPmXTY4_MoOv7NfX2NA&oe=6877BB1C&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:13', '2025-07-06 17:20:13'),
(1962, 'eko adrie Tsel', '6281282834070', '6281282834070@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401706_1176350697165265_7350105210970685458_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEpqfv1vl_SoYWpn7jr1UWfe8aIf0nk88D-zlEKtd9IkQ&oe=6877C519&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:13', '2025-07-06 17:20:13'),
(1963, 'Abi', '628116024217', '628116024217@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457298202_1037257614558416_1610993480001131315_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG-UHom6G4TDeBab16hdhGRlg8L8VAxiLzwboQhOSOhnA&oe=6877C09A&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:13', '2025-07-06 17:20:13'),
(1964, 'Paul hamdan', '6289614701485', '6289614701485@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473409320_666786049346900_7918342107916723244_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHtsQIn2tn_TJCSOgnL3E1_4rEV-jcPHZ730vDuAVSZHQ&oe=6877B235&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:14', '2025-07-06 17:20:14'),
(1965, 'teh sri pa sobri', '6289696265771', '6289696265771@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844177_948918590525129_4547784281656231407_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFbS9gb0ipTQkTn5km1pdSgnhXUl1lur857EnbCkCvjuA&oe=6877B840&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:14', '2025-07-06 17:20:14'),
(1966, 'G Net', '6281296267266', '6281296267266@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:14', '2025-07-06 17:20:14'),
(1967, 'Slamet Azzam PABX', '6281584947450', '6281584947450@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:15', '2025-07-06 17:20:15'),
(1968, 'Ega pubg', '6282189348803', '6282189348803@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513343438_1373189027302014_5797515267302217984_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG8lu4heJByhunic-hq9PJ3zl90xhHiWXwioiOFNxq_1A&oe=6877BCFB&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:15', '2025-07-06 17:20:15'),
(1969, 'ute grosir', '62852191122181', '62852191122181@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/432570324_481763791155325_7718382937144988449_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFxL00rbJlIP5bZV_zCJs8Q4cfd6PXmOUC38uEDzh5tTw&oe=6877AA53&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:16', '2025-07-06 17:20:16'),
(1970, 'Anshory KMI-Pand', '6281334992750', '6281334992750@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513968902_1535262047849697_146346682430231745_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHJwzoXEQY-qJE2_o-FxmZTvg4TmJnhFxrfI40Zve30zg&oe=6877CA18&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:16', '2025-07-06 17:20:16'),
(1971, 'Exadaya', '6289524305379', '6289524305379@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/363118147_682878536597850_116869481612078575_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF5fq11_PBMrr3-2-8eFluuIa3HxxreWCRP5NwtVeU1Rg&oe=6877C34B&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:16', '2025-07-06 17:20:16'),
(1972, 'kost pak ici', '6287882326938', '6287882326938@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55963744_2019353068372907_3257716575003738112_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE1h7tfW82A17gld_bLR5dOa5YS6FIJ0ZNnmAF5SYsugg&oe=6877BB51&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:17', '2025-07-06 17:20:17'),
(1973, 'Indra Permana indihome', '6282124977658', '6282124977658@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:17', '2025-07-06 17:20:17'),
(1974, 'edi vmala', '6285772477014', '6285772477014@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:17', '2025-07-06 17:20:17'),
(1975, 'Eglobaltechno', '628988409756', '628988409756@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491842668_565812336324102_4080345075901365994_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHYEZKAsPlJ5J1FhzcEt3VzYZqM9XDK7QX7fPSP07726g&oe=6877C645&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:18', '2025-07-06 17:20:18'),
(1976, 'aldi mtc', '6285220304664', '6285220304664@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:18', '2025-07-06 17:20:18'),
(1977, 'Dewi Ali', '62816806285', '62816806285@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:19', '2025-07-06 17:20:19'),
(1978, 'EPON BOGOR', '6281385864280', '6281385864280@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/222307962_750753766179767_5307030135567039314_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF3_TLmBabqiwlt1P6qF6uWCqCAvWpZcrsp_1pNlNsp3w&oe=6877BABB&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:19', '2025-07-06 17:20:19'),
(1979, 'Mbak Welya', '6285693330176', '6285693330176@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491886283_1129449312267746_4749223940984695230_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQzTLUELusfgPS5rqByGVnCayQRU47BSFSFDFQ5FcFdQ&oe=6877A819&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:19', '2025-07-06 17:20:19'),
(1980, 'ocep', '6285811298981', '6285811298981@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/442170228_996450081864037_3083619195956228076_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE4Tv7G0Xb-DBCItoyveDxKQBzAK7VV3Frq-xMDtf45hw&oe=6877B77F&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:20', '2025-07-06 17:20:20'),
(1981, 'sarah dewi safitri wifi rafi', '6281806462586', '6281806462586@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:20', '2025-07-06 17:20:20');
INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(1982, 'jaya cell btm', '6281218911188', '6281218911188@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475177415_1346541086593514_5509930069107716390_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEAb01KOVKeqW61ikjfkXHuMrPyMn8HeOBsXf_Rsxg-Ng&oe=6877CD0B&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:20', '2025-07-06 17:20:20'),
(1983, 'dinda Bu', '6281389001688', '6281389001688@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405843_662231356140340_5084539562846589592_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF724jM2xeIm1vGrUJss9dZqGdQVl9EmMhePJBXY-0ZnQ&oe=6877B29E&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:21', '2025-07-06 17:20:21'),
(1984, 'Heru Pahe', '6285718275360', '6285718275360@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473396746_531453779942159_4131952953981794804_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH1OTnAVUK3OLOHAyjaAFMcylkuDeEVUP5ywkxwvccVLQ&oe=6877D67A&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:21', '2025-07-06 17:20:21'),
(1985, 'kmi astri', '628567690215', '628567690215@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454385822_519196037236482_4303510950156553209_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG75pltHFbOwQ2TzNBqQTV0sepUc-oJyGrQpwNyxI12Lw&oe=6877D771&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:22', '2025-07-06 17:20:22'),
(1986, 'abang Ahmad Apandi', '6287777781200', '6287777781200@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/125366535_535139544531785_966327071667400778_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH1x_qfP2EecafJTR6BAwS2UFDqim9WfYCrZ0TvT7dNsQ&oe=6877D0F3&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:22', '2025-07-06 17:20:22'),
(1987, 'usb to ttl 1', '6281806746830', '6281806746830@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/325584926_2978644088933975_3764635457125344316_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGoBpgCVqNfytQuDcAUkLFQ8aWbMl7sD09kAF6jadlLKg&oe=6877D7E7&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:22', '2025-07-06 17:20:22'),
(1988, 'jci gentar', '628999880833', '628999880833@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/328127122_1662115154609292_968961035387321430_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEU4SBQ4Y5SK3feBu2z2nQ9tHTfrUtPz8yaXd3O2Pb9UQ&oe=6877A76B&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:23', '2025-07-06 17:20:23'),
(1989, 'Bokap', '6281399909101', '6281399909101@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437978038_3821579931411741_7372827378978173901_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGiQH2VKDywo9Z2lk9ASlbIeE4EEU980ziMU69VlPVc8g&oe=6877BC0A&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:23', '2025-07-06 17:20:23'),
(1990, 'bunda', '6282213134528', '6282213134528@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:23', '2025-07-06 17:20:23'),
(1991, 'toni', '6281281200478', '6281281200478@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/431490711_2621041454744573_9071783121820817392_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGnIW4MMtW-zQ-eVfhSBGihWkDktaKFxOOdicW4mRLruw&oe=6877BFC8&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:24', '2025-07-06 17:20:24'),
(1992, 'teguh', '6281563549758', '6281563549758@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/248169037_661998751527781_2021174024033816672_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGobCagPla3UCPYYR7H0nZKkbwUwwsXFdNxuazUgEZhQ&oe=6877B5CD&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:24', '2025-07-06 17:20:24'),
(1993, 'Om Rancamaya', '6281321104599', '6281321104599@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491836534_1361507048460021_6108559613944569160_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGTVvxatmhxXelGtRZxnPqkpk1spDTjlkA0zWoTxiDc4Q&oe=6877D099&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:24', '2025-07-06 17:20:24'),
(1994, 'acil biznet', '6281212499904', '6281212499904@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:25', '2025-07-06 17:20:25'),
(1995, 'sewa fo PT PANCA WAHYU', '6282377619971', '6282377619971@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/400875346_864174271856133_2916370112447008706_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFAKz1S3_2_ZHQJU-qZA7sGWv_IISUMNiGQ0FMNBw_rPg&oe=6877DA56&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:25', '2025-07-06 17:20:25'),
(1996, 'sadap', '6281222470737', '6281222470737@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491838537_1063580559053415_3477306943698772076_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHsgzZjkTlrfU1cEzeeJOsdUX6gq9U_NyVWtz9_ySU8tw&oe=6877CC94&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:25', '2025-07-06 17:20:25'),
(1997, 'wawi kp rawa', '62895385013671', '62895385013671@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:26', '2025-07-06 17:20:26'),
(1998, 'maya home credit', '6289674199459', '6289674199459@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:26', '2025-07-06 17:20:26'),
(1999, 'lutfi grab', '971588982569', '971588982569@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427566085_1120064089199805_1042129489192588077_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wErmBPYctHsu1Tz4UlZLW_JnrYkf25ugZb0tT9cqgUljA&oe=6877BB4B&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:26', '2025-07-06 17:20:26'),
(2000, 'Ayah bunda internet', '6281381365929', '6281381365929@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/485871170_660713136679592_5888043986228380371_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE9QigXPArd03UqK2gawjlbIZ9XZ7xNwNl8fPjmFZPqpQ&oe=6877D890&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:27', '2025-07-06 17:20:27'),
(2001, 'kmi pasahid', '628811280962', '628811280962@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491871489_3416111491863267_3065989296902710978_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEvbT7_1snWmw1OMUMbvKztGoJZyPUdpKRwljVnQiYw5g&oe=6877BE6E&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:27', '2025-07-06 17:20:27'),
(2002, 'PUBG **', '6285216307528', '6285216307528@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:28', '2025-07-06 17:20:28'),
(2003, 'Sari', '6283820204818', '6283820204818@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/475479846_661080109718808_8101653733890681221_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEarJWkW0TgDm97_zT3I0hsL1DR3Pm3CJyyJUpT3G6pGQ&oe=6877ABC1&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:28', '2025-07-06 17:20:28'),
(2004, 'jawa ketoprak', '6285925165282', '6285925165282@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/56153876_2677228215684052_6716976521891807232_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEqeJgbuJrOp0av4bVc-1G1uyMUbjpiCn_dr0zNZ5GJng&oe=6877C6A8&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:28', '2025-07-06 17:20:28'),
(2005, 'Resta', '6289523067067', '6289523067067@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840306_3917322018488638_3649775253107720951_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHPepuKOljoUk7BFlq4pPSMcvKzu90ImY_gspXskDN_Pw&oe=6877DD63&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:29', '2025-07-06 17:20:29'),
(2006, 'Bagus pubg', '6285697044690', '6285697044690@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/488868889_1125724612642201_7702454099209846991_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG9hpV_X_7OzYeTIKRCh75vdB7EVWSgDpkhV0CXUvf1JA&oe=6877C6DC&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:29', '2025-07-06 17:20:29'),
(2007, 'Wa Edi', '6285717396650', '6285717396650@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491885216_1410222050216394_770007603650000537_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEoFgrh9SPxIUZ34oJS5w6P9Br0ZhL7XVzvjYhKZQODIg&oe=6877C44E&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:29', '2025-07-06 17:20:29'),
(2008, 'Arthur FO NETVIEL', '6281931312381', '6281931312381@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:30', '2025-07-06 17:20:30'),
(2009, 'jual poco 8 256 1,9', '6287840392877', '6287840392877@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:30', '2025-07-06 17:20:30'),
(2010, 'Hj ridwan', '6281280806811', '6281280806811@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:31', '2025-07-06 17:20:31'),
(2011, 'mamah ajeng', '6281282104695', '6281282104695@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/454894231_929874405240576_3881552272974915357_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGUTim9JzcugfiXjis97fPGe0EVIXXnQI14oFQ713QcgA&oe=6877BF98&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:31', '2025-07-06 17:20:31'),
(2012, 'rivan', '6281233320014', '6281233320014@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/440296297_547329424327439_74593690171578591_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFj-lltzIWV5MeDWl2WDIBslf45WRknPMMJ4SpZ4RyZug&oe=6877C424&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:31', '2025-07-06 17:20:31'),
(2013, 'rifal', '6281380066528', '6281380066528@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/185523906_135994998550234_8309753967952293497_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHifBXwdrB_--j9i2qjeFlBbHOTa3PyfshXdtdcl7JKPw&oe=6877CC6E&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:32', '2025-07-06 17:20:32'),
(2014, 'PUBG IRSYAD', '6282285276852', '6282285276852@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/483504111_1689826438553840_7307764233301212261_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE_I1u6C20rIR5AB7WkqRqkRsyv604W1KSGjMAA5VTc5Q&oe=6877A8FD&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:32', '2025-07-06 17:20:32'),
(2015, 'PAK MARGONO', '6289682961585', '6289682961585@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491868216_1258818575094856_6801867956764218383_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEkp2_cky6RCucLBA54gdt_URqb3q-TucwvDYqxLn5yWA&oe=6877DA39&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:32', '2025-07-06 17:20:32'),
(2016, 'Hanny PT SUPRIM', '628179024150', '628179024150@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/385532656_1015676966248521_1272114666505235953_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFMZq44m3wEVSmFJcW4WZtrUofHZQ_oBLT4BUtTLZ7K0w&oe=6877B956&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:33', '2025-07-06 17:20:33'),
(2017, 'Fajar Baner', '6289602589083', '6289602589083@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/269141045_4771246329665549_7424193089737948898_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH_rWgBIAZLSPekUd3LYvLpbD4eOD2xGofTp3QiTyMBSQ&oe=6877A9FE&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:33', '2025-07-06 17:20:33'),
(2018, 'Adung', '628567162022', '628567162022@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425308208_26249678074676163_1765239641731757038_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGr3zBa-eo7N2_6_TT8TyzqMPNSDpzdby7TShhFn47cJg&oe=6877D23C&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:33', '2025-07-06 17:20:33'),
(2019, 'Putri Diana', '6285773442145', '6285773442145@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844221_1228309615601070_4760901562990132618_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGMnHn_LL5Pe3e9vMOLtT11n3Kreqglms2vssSB4PmmgQ&oe=6877B399&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:34', '2025-07-06 17:20:34'),
(2020, 'PUBG Ridwan 2', '6289601730263', '6289601730263@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:34', '2025-07-06 17:20:34'),
(2021, 'yaya INAR', '6283162698297', '6283162698297@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:34', '2025-07-06 17:20:34'),
(2022, 'ko hendrik smart', '628811282710', '628811282710@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/75511901_605241980049309_7860711602681583635_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEVy0HI3epNakVFSWOaJuYU3-mDIqjYay5D19z_AQD2uQ&oe=6877DDFD&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:35', '2025-07-06 17:20:35'),
(2023, 'Mamah Irsyad kprawa', '6289516441135', '6289516441135@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/439361829_1823593831483928_7428083892106572669_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHyWB6GyTeDm16EyHLbqeF-3EAr92GCN4O_wky1Orl3bQ&oe=6877DC00&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:35', '2025-07-06 17:20:35'),
(2024, 'jci dwi', '628128423322', '628128423322@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/466172241_1120248919882936_6599868968090091758_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF9sJL1itS7jsbT1xF4sX6561UX33JT5FwQQerNJPSUQA&oe=6877C8A7&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:35', '2025-07-06 17:20:35'),
(2025, 'AkaBokir Beli patchcore', '6281901260075', '6281901260075@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872738_1289296319490018_5414939666624620047_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGCvpAr2NMlBqleb_jcXe5InForZu1dlW7EaLKIMZmbQw&oe=6877C392&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:36', '2025-07-06 17:20:36'),
(2026, 'cool plus kaca film balebinarum', '6281336666832', '6281336666832@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/489347774_657387633833133_6841745203194486262_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHVUD4EFWn4-AAFQQBF70-pK-b5Jzs2koppvm-PEsrTxw&oe=6877A868&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:36', '2025-07-06 17:20:36'),
(2027, 'windi', '6289611478189', '6289611478189@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:36', '2025-07-06 17:20:36'),
(2028, 'bu yuyun', '6289652097684', '6289652097684@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491872171_1887830348645281_7286260547591402453_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE6FtniAHWUJQEo-5aZU7YaoIHOGHYVGBnZc-Z3cPG1vA&oe=6877DD16&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:37', '2025-07-06 17:20:37'),
(2029, 'Rizki Herdian Mikrotik', '6289620696372', '6289620696372@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437984319_497884986056519_6485362427551867856_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHYD5l0UoC9C6iHDdJgUmjji1fCu4fFEcLMWok_TJyoFA&oe=6877DAF5&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:37', '2025-07-06 17:20:37'),
(2030, 'resa vmala', '6285718918413', '6285718918413@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:37', '2025-07-06 17:20:37'),
(2031, 'minyak bulus', '6287820141212', '6287820141212@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/350820199_2382233711938070_5695177840246505110_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFOoR3MqgGMHJ2SCyY6DifU2GP9kp0srAZiO5B1ZDUg8w&oe=6877C2DA&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:38', '2025-07-06 17:20:38'),
(2032, 'mira rabrusun', '6281398880656', '6281398880656@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491886311_1274789650762302_3043148330906392779_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFVek24D9RG3Ak0imqqjkhvpZiPwu2iB_sfA2Xashu0wA&oe=6877D651&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:38', '2025-07-06 17:20:38'),
(2033, 'wira moratelindo', '6288246863939', '6288246863939@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:38', '2025-07-06 17:20:38'),
(2034, 'paklek Surono 94 (Mbah Suro)', '6285280251572', '6285280251572@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/455815147_7873318869440176_3950663444238472524_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEuQwZUsxj250eoXZS9cd0PalrT9KIEPCalwr35WssEVA&oe=6877D9FE&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:39', '2025-07-06 17:20:39'),
(2035, 'kmi futina', '6287884285862', '6287884285862@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491876051_1383796266167009_2314937854142104163_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHpjNDXHGaKC9H4GhBAcb3UneA9DKdugTNclGOwtIhcHw&oe=6877D82B&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:39', '2025-07-06 17:20:39'),
(2036, 'iksan kp rawa', '6289668676948', '6289668676948@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/456063428_4047822182116410_4715086075830292972_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFGze5ZWEQFQI2fuX6D78QxP2nMX2-oAETfIf9SenPg5A&oe=6877B421&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:40', '2025-07-06 17:20:40'),
(2037, 'minta seting mikrotik', '6289665222226', '6289665222226@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:40', '2025-07-06 17:20:40'),
(2038, 'NITA JLM', '628979870781', '628979870781@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/317050824_121900110579230_547861409846004239_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhr72Ii4S83XH0AgpIpGWIOWZ-xfQctqV45hHx_9N54w&oe=6877D25A&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:41', '2025-07-06 17:20:41'),
(2039, 'dhea', '6282121993317', '6282121993317@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:41', '2025-07-06 17:20:41'),
(2040, 'Kaos polos bojong gede', '6285781898708', '6285781898708@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/467878544_950061273647538_3761318158571136680_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHwjOrmi_J8kRnsNI7a0Qanb36Dj5R0Kc9KfmBKguPlYg&oe=6877B2F0&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:41', '2025-07-06 17:20:41'),
(2041, 'Jci parmai', '6287881362209', '6287881362209@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:41', '2025-07-06 17:20:41'),
(2042, 'OTDR CENGKARENG', '6285778049716', '6285778049716@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/506070625_718931727961181_935725403213180009_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH0yCQq72VFKmXxYFtO6woynYC6fpc8Wq-zcMt-n0rNIA&oe=6877D44F&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:42', '2025-07-06 17:20:42'),
(2043, 'teh ema 2', '6289605184443', '6289605184443@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/456856428_856508629416210_3122350837606830809_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHmfwSUsm8_w6grTwB-6X7nz9GlbYFR24UOjHDlD_cBzw&oe=6877DDD3&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:42', '2025-07-06 17:20:42'),
(2044, 'Gundaling Sholeh Iskandar', '6287872243316', '6287872243316@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491869684_1371180180770940_2179076189031086109_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGRqnY9c9tsjwZAw22HkFoJtXQotWBqLcux7GLxnCiKjQ&oe=6877C2B4&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:43', '2025-07-06 17:20:43'),
(2045, 'lik sukimin', '6289522710295', '6289522710295@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/430444276_995141978702014_113733220845680281_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFvVdqqZCbDI4kdFkQt_wcArsnoHHV46AHSMgJlEUZElA&oe=6877B3E9&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:43', '2025-07-06 17:20:43'),
(2046, 'Ranu Taufiqurahman', '6287772548411', '6287772548411@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:43', '2025-07-06 17:20:43'),
(2047, 'Fari Dhiyau', '6281335304571', '6281335304571@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/96243517_144559797127778_2360298536148968084_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wExxCN7a8fhySdt8x2QNcwUS9WWF1fHxv6tur6Cv5Na-A&oe=6877AEEB&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:44', '2025-07-06 17:20:44'),
(2048, 'Planggan bus', '628568474010', '628568474010@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:44', '2025-07-06 17:20:44'),
(2049, 'SAID ATTAMIMI', '628161969466', '628161969466@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:44', '2025-07-06 17:20:44'),
(2050, 'anisa rena', '6287775198035', '6287775198035@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491886713_1028590322785494_5981223483550601243_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wECWwFzUWmepqlViqlU63S3TJW19nNoMxMH2qt2YVwBMg&oe=6877D867&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:45', '2025-07-06 17:20:45'),
(2051, 'bangbang GCR', '6281586914007', '6281586914007@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:45', '2025-07-06 17:20:45'),
(2052, 'heny kety', '6281286266685', '6281286266685@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866173_1541187477267316_5527702410454351031_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEIhJaosvStAwoAbp5HW8D-8bX3X-EdObkRdzPbsNHu5A&oe=6877AC50&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:46', '2025-07-06 17:20:46'),
(2053, 'astinet', '62811111665', '62811111665@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491845224_707822821660357_6609222211257168060_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEzeVON0tvDng8nfiyPs0ki7vEfVSFZII7NU8r0rVvoNg&oe=6877CA01&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:20:46', '2025-07-06 17:20:46'),
(2054, 'PUBG Kynaa', '235596840718588', '235596840718588@lid', NULL, 0, '', '2025-07-06 17:20:46', '2025-07-06 17:20:46'),
(2055, 'tknisi jlm', '6282213709112', '6282213709112@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875873_757269083683129_1571478477844752958_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE59v-tkxxPd143fRtq5wRpc1ayRynlaiubC4VyEkPjBQ&oe=6877BA53&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:47', '2025-07-06 17:20:47'),
(2056, 'jci carline', '6281808987195', '6281808987195@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:47', '2025-07-06 17:20:47'),
(2057, 'YAYASAN PANTI REHABILITASI SILIH ASIH', '6281211303155', '6281211303155@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:47', '2025-07-06 17:20:47'),
(2058, 'KANIA NENG NANIK', '6287777943778', '6287777943778@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/476577992_9347715005276233_7594431345927468284_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEJ5v0x_atVWhmiby2ucZMZBT3_oXggRNzVHGC7u49XHg&oe=6877CF2E&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:48', '2025-07-06 17:20:48'),
(2059, 'rem albawadi', '6285773000043', '6285773000043@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/328109950_152294144323604_8832964805619822730_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHG6JLLKdspAvLwLbeuSKWpBnYaCEODWot3OmBM1_e16Q&oe=6877DDAA&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:48', '2025-07-06 17:20:48'),
(2060, 'bram anyar', '166082660814972', '166082660814972@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491875970_2155654108284824_1255966773705614442_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGGG4ArPQh-R64b6eW87VOE5jNb_HczdDFz5dQLyxjWfQ&oe=6877B99D&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:49', '2025-07-06 17:20:49'),
(2061, 'ismi', '6289614019968', '6289614019968@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:49', '2025-07-06 17:20:49'),
(2062, 'NJ', '6285710047448', '6285710047448@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:49', '2025-07-06 17:20:49'),
(2063, 'kwing kwing', '6287878595600', '6287878595600@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401303_1163451055162796_964871584546576907_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG7WdkCfx0JkwkpPVL8jxIki5BdDC2VKwXUEGUtnIKTPg&oe=6877D1EB&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:20:50', '2025-07-06 17:20:50'),
(2064, 'rk gadai syariah', '6285714142712', '6285714142712@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:50', '2025-07-06 17:20:50'),
(2065, 'Smart Aji', '6287881000166', '6287881000166@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:50', '2025-07-06 17:20:50'),
(2066, 'abde didin udiklat', '6281290492057', '6281290492057@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:51', '2025-07-06 17:20:51'),
(2067, 'kmi pak enry', '628811280951', '628811280951@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875315_1079970040704108_5893922275361275774_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wESpzGRr9UPGXRuXzL_UYf5XROpgTLzJUkAfP6IuiJCRA&oe=6877DCAA&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:20:51', '2025-07-06 17:20:51'),
(2068, 'bogor combed', '628562000120', '628562000120@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/55964160_1367165103437889_7619935022975287296_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGphLS1Cveum8eHuYXusCqlLbr6PtiOql6uiFGc585k4Q&oe=6877B450&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:20:51', '2025-07-06 17:20:51'),
(2069, 'egga 2', '6282112287124', '6282112287124@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/394033491_3556546924618401_323017382397719210_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHzIOYJLMTv7Gu77fHU-IbbAa8prYqmq5JQA0-SjiPGEA&oe=6877B23D&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:52', '2025-07-06 17:20:52'),
(2070, 'pak hambali kp rawa', '6285810103449', '6285810103449@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840127_1675991799702642_8795580195287104812_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFNy3NtYe2ODJsc4inQ1MBRhaNTPO83_M5qn34smyvMdA&oe=6877C2DD&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:52', '2025-07-06 17:20:52'),
(2071, 'panjul', '6289523187070', '6289523187070@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491870145_1462640118065981_7800396975904441119_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHI6_t1amlFQ4bLlGCbDvBDA2qCgKM0y5tNcG29_gtw-w&oe=6877B05C&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:20:52', '2025-07-06 17:20:52'),
(2072, 'pubg isyana', '6283147510312', '6283147510312@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:53', '2025-07-06 17:20:53'),
(2073, 'L lucky', '107623340863606', '107623340863606@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491876060_3648523118785397_7774940214704161755_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH5WP7rtkHx2PXsdGtPp20B1HJ7hLAYZw4q2MiJgFSWEg&oe=6877CD3C&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:53', '2025-07-06 17:20:53'),
(2074, 'jci hari liaw', '6285287706278', '6285287706278@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:53', '2025-07-06 17:20:53'),
(2075, 'teh Aas', '6289605351365', '6289605351365@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491884793_740304331907470_4836028875476699882_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEwjmH2sl_mR12CfxEbfyZ0DvDhbQyG7Uxy1K-6AnPoUQ&oe=6877B3AB&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:20:54', '2025-07-06 17:20:54'),
(2076, 'rumah pilox elite', '6285710493249', '6285710493249@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/515415945_1088708829803783_1113957136510614861_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEsWPpjdycc-cpYovNhK9So3dLile8xBpOdXj7Ey5I9Jg&oe=6877CFFA&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:20:54', '2025-07-06 17:20:54'),
(2077, 'Mas resa', '628562564677', '628562564677@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:54', '2025-07-06 17:20:54'),
(2078, 'anisa rena', '194081015730222', '194081015730222@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491886713_1028590322785494_5981223483550601243_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wECWwFzUWmepqlViqlU63S3TJW19nNoMxMH2qt2YVwBMg&oe=6877D867&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:55', '2025-07-06 17:20:55'),
(2079, 'Billing alkind rais', '6281255220808', '6281255220808@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/389368981_1371968187064827_2726513923037609616_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wECFoVAxP_IUK1RpFaXfV_yWTryKCpo9vndJ0yJ6dfXGA&oe=6877B574&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:55', '2025-07-06 17:20:55'),
(2080, 'A Firman', '6285693135029', '6285693135029@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:55', '2025-07-06 17:20:55'),
(2081, 'Citra', '6285819911103', '6285819911103@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:56', '2025-07-06 17:20:56'),
(2082, 'panel box', '6281280839593', '6281280839593@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:20:56', '2025-07-06 17:20:56'),
(2083, 'Mas deni YAU', '15650911211568', '15650911211568@lid', 'https://pps.whatsapp.net/v/t61.24694-24/491878959_1849444752567058_5790701540077495524_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFx3jcVsf0eF4hIJoHuB_19_KyPnPSMXA90TYwCd8a65Q&oe=6877BB59&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:57', '2025-07-06 17:20:57'),
(2084, 'jual poco 8/128 1jt', '6282272757962', '6282272757962@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473412098_1214326210328850_1576787728127150302_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEqD1xFC6snxDliG5AUdY8yWZrZLoDJgC09ky79MXV9cg&oe=6877ACF7&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:57', '2025-07-06 17:20:57'),
(2085, 'melia biyang', '6283871521888', '6283871521888@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/431219111_972880824129891_3490683760766514464_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHUwN3rCMWYKhiH6O3PrWKjjvFeLmb7uIUSV42RXxSfFw&oe=6877B16D&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:57', '2025-07-06 17:20:57'),
(2086, 'adinda computer', '6281318571338', '6281318571338@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/421386406_665776018920380_3054968480130207188_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFjkhtyk5AC75A5RBomYc-yNPrDrVdVXEv9NB-rbqregQ&oe=6877ACBF&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:20:58', '2025-07-06 17:20:58'),
(2087, 'Dhenz Maulana', '275629761130643', '275629761130643@lid', 'https://pps.whatsapp.net/v/t61.24694-24/181156402_2323372017815431_4459707817462933671_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGEecH3NZNP98gmNsuH5epPVGCL-KnSLm-mfxo5Yw-B0A&oe=6877DD60&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:20:58', '2025-07-06 17:20:58'),
(2088, 'Dwi BT', '6289640557627', '6289640557627@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397816_605498732305713_3417671695678335611_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF00IWUEHXR9GiWhjk5cianqRavLVsbiPnetS81yMKrqA&oe=6877D492&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:20:58', '2025-07-06 17:20:58'),
(2089, 'susi', '6282211395203', '6282211395203@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491874930_1049259830254350_8898893419072540745_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEcHQserzsl5cijLN6Ukxp7Cp10Jtq5iQK5QHqU5SCXTw&oe=6877A863&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:20:59', '2025-07-06 17:20:59'),
(2090, 'jasa hacking', '6285213995916', '6285213995916@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/460145033_416809908099639_4457134880602065304_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFMI0NQkMXzM6Jq8LDQyYH0O4S8X5sRLNwx1x2cjWVTPw&oe=6877C650&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:20:59', '2025-07-06 17:20:59'),
(2091, 'sesilia lintasarta', '175698622828682', '175698622828682@lid', NULL, 0, '', '2025-07-06 17:21:00', '2025-07-06 17:21:00'),
(2092, 'alya inar', '6283150634781', '6283150634781@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:00', '2025-07-06 17:21:00'),
(2093, 'emon', '6289512965279', '6289512965279@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401657_508120598391605_7837593111064408913_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEfBKC0gnJhdpdbGBjCSeq2m5LyFBTYtEw8owk_7-V2rw&oe=6877BA56&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:00', '2025-07-06 17:21:00'),
(2094, 'pelanggan fo', '6281291421025', '6281291421025@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491869340_1424217828575952_7765760180560810738_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHZBw2gSNW_NPUhNZt06ty9EjWFrbFOCwk47fjrC0Ic6g&oe=6877AD26&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:01', '2025-07-06 17:21:01'),
(2095, 'nyunyu', '6285693309698', '6285693309698@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491842695_684696787647862_2127081261023305426_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGF7grFYEINCtlfG2o5AYpe4Gw2WtKW92IW6hvQ0p0zkQ&oe=6877B7EF&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:01', '2025-07-06 17:21:01'),
(2096, 'zelda durian', '62818639168', '62818639168@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491837300_1369811607595293_8037961705498806547_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEO5u3TEgCxG_qZnCVWQzFwFkTv0eOypJ58XuwPXWijUg&oe=6877B474&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:01', '2025-07-06 17:21:01'),
(2097, 'Aida vega vmala', '6281381504708', '6281381504708@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:02', '2025-07-06 17:21:02'),
(2098, 'markas print', '6281210237789', '6281210237789@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:02', '2025-07-06 17:21:02'),
(2099, 'perkakas gang kudus', '6282246120354', '6282246120354@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/145264154_412766134003330_632866133967694102_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG1COXDOhZBWv8rBOJKqSnwlPBpYjcZKzxNWVo0WAjNcg&oe=6877D35A&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:21:03', '2025-07-06 17:21:03'),
(2100, 'EMPI', '6289682714436', '6289682714436@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/435581462_497667836101922_5816203976464105456_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wENJMk3mAE3ZVp4mIJ1qmbLKcWzY2cVQeX-jV3jMQHdVw&oe=6877DB5E&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:03', '2025-07-06 17:21:03'),
(2101, 'ade kp.rawa', '6289604137599', '6289604137599@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/353062598_800704818156229_166740054653846098_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGWA5kpLfWdq-OZCiNdIxuSAPDiBYQ_MNQmzmzFKqVpMw&oe=6877B4BA&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:21:03', '2025-07-06 17:21:03'),
(2102, 'diki kmi', '628811239258', '628811239258@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510700608_1235970884664846_2690012871380945858_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE_lnvEJLv2bKETZNLYvqvsx7pC0Q1nG-dDU5xO5j11yQ&oe=6877CC80&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:21:04', '2025-07-06 17:21:04'),
(2103, 'Hj Daden', '6285313409621', '6285313409621@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473398964_646057124669801_2505117187293326915_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGwn7fek7gHwmuDgB5vdi-1GdDLiZmdKKvrA69-vP387Q&oe=6877BE01&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:04', '2025-07-06 17:21:04'),
(2104, 'Iwan Purwana', '6289638202928', '6289638202928@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/504079461_1931002807674628_9209813623618899537_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGhP6T415KhmpWFEWwAqm525zwwgcMcHBnt-YOpdylWlw&oe=6877C04B&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:04', '2025-07-06 17:21:04'),
(2105, 'mini jack gilrs', '6285863239925', '6285863239925@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:05', '2025-07-06 17:21:05'),
(2106, 'na tecim', '6285779666821', '6285779666821@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491840130_1944613546280462_6793955599798890195_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHG7CD3ibfrzsr8U5ad05FJ8v1jbaLNrWl0NPJs1deNSA&oe=6877CBC0&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:21:05', '2025-07-06 17:21:05'),
(2107, 'Muhammad Sauban Mauli', '6285710649720', '6285710649720@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/178993222_684909526029407_3706193240110243464_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGc1WP0S52ZQn7anjlFNZpeuPyEjSyjDdOzWrBiKnxMBQ&oe=6877B65C&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:05', '2025-07-06 17:21:05'),
(2108, 'A iwan kp rawa', '6289611511167', '6289611511167@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/414199286_2418324525018084_3487490421180078324_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHo-464uKTuuWfEQLpwAWmMTGTeAZbbvqw9oNyQpfZpHg&oe=6877C6BD&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:21:06', '2025-07-06 17:21:06'),
(2109, 'mamet', '6283898560898', '6283898560898@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:06', '2025-07-06 17:21:06'),
(2110, 'kohendrick', '628170760003', '628170760003@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/159030569_245217570994613_6386163320810620252_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGytSVWmDofUlvVt0zlQzGo001vlXAYCNM_aK052OA8uQ&oe=6877AAF8&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:06', '2025-07-06 17:21:06'),
(2111, 'Teh Ayak', '6285945471571', '6285945471571@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/425129701_1119089189132993_1683524384993429377_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQTY2ZiJj66vslZzpdvbxsz6yBU9CqOebtY1me7JtQvw&oe=6877BE8B&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:07', '2025-07-06 17:21:07'),
(2112, 'jual motor beat 3,7', '6285825097792', '6285825097792@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/505260466_1233377751473454_3114231505680800820_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE2D_VH_YQZBp59yJGOzPBqQXo0xpOvGkjT2OejRJM0oQ&oe=6877BCE1&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:07', '2025-07-06 17:21:07'),
(2113, 'Adung', '148717671809165', '148717671809165@lid', 'https://pps.whatsapp.net/v/t61.24694-24/425308208_26249678074676163_1765239641731757038_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGr3zBa-eo7N2_6_TT8TyzqMPNSDpzdby7TShhFn47cJg&oe=6877D23C&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:07', '2025-07-06 17:21:07'),
(2114, 'Gobal Network', '6287877362828', '6287877362828@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468964578_1234109181007800_1144612044290510141_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEiGK47pxGQGjE8pXinPCe-n-zN5QmMMKJLvp854J0VqA&oe=6877CBB8&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:08', '2025-07-06 17:21:08'),
(2115, 'istri ujo', '628558585161', '628558585161@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491883787_1250157283188434_1624611136085666113_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGh9na17LV5WwS12r4X_KmRR4TkcmPn43PKXpWofzlhOw&oe=6877D2A6&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:21:08', '2025-07-06 17:21:08'),
(2116, 'PA Hamdan', '6281282263631', '6281282263631@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405152_673883652046886_5944496337896472466_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG27zLe55sAWD85QOOePlfs0dNSqY0KTOqzVaqiuVpHDg&oe=6877D66B&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:08', '2025-07-06 17:21:08'),
(2117, 'P2 phone cell', '6281808119788', '6281808119788@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491873007_699419716030748_2086535905298989373_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHxV1HD7_W7C8M6S833JTAG7tsAqSespagc3i7oAhr1ZA&oe=6877D2A2&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:09', '2025-07-06 17:21:09'),
(2118, 'pak buyung', '6285814522129', '6285814522129@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401969_1128211019095428_2393514928033146518_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF0ju4K2VoRoCiwwlcfcRTOPJLfvSlDQVU2tKmIQByhoA&oe=6877CC20&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:21:09', '2025-07-06 17:21:09'),
(2119, 'Yaman Lutfi', '628558575510', '628558575510@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/216581233_106857831772027_5170631100153053327_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF0KYz-2Jcy_OdJ4O2AHKOOEYYqEsskdkLYX2ya-yAaoQ&oe=6877D81C&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:09', '2025-07-06 17:21:09'),
(2120, 'mang cecep indihome', '628121332310', '628121332310@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:10', '2025-07-06 17:21:10'),
(2121, 'A ano', '6285716312142', '6285716312142@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/328678503_3284040881834567_5225254302821912936_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGyLdoUPlTD6J42x6aWS1slQrv1JI0Pu72dnqGFhD0Jmg&oe=6877C5F2&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:10', '2025-07-06 17:21:10'),
(2122, 'Aldinotamba Vmala', '6285156063679', '6285156063679@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:10', '2025-07-06 17:21:10'),
(2123, 'lik kris', '6289678196198', '6289678196198@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875633_711957391420399_7899098021877714638_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEyTuUWYtoEoSrssnT6BB28s3U6TRrXhdJgfeNO4gxyEw&oe=6877C89E&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:11', '2025-07-06 17:21:11'),
(2124, 'kuat', '6281220006611', '6281220006611@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473405903_1371095994014993_7333607681254786295_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE7NGxr-cEK4nEKeFMzB1ViWJDxtjhB0TN-3RQm5iwy3Q&oe=6877C6D7&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:11', '2025-07-06 17:21:11'),
(2125, 'hikmah danamon', '6281287181223', '6281287181223@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/516452892_1206504451487225_7577844168193813445_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEzsF3RebBAoRguIvcBiufbVucXvIfWHhgsL7Oz8U93Aw&oe=6877DD62&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:11', '2025-07-06 17:21:11'),
(2126, 'jp printer', '6285816577569', '6285816577569@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491870203_698197632585167_466569325889984600_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHd52HYzv4hoZf0FkqEpREJHrs_6THEGm5D7jrzJCO9Mw&oe=6877BA2E&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:12', '2025-07-06 17:21:12'),
(2127, 'bu eli pak buyung', '6285770804043', '6285770804043@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/511320219_634149278994417_5578189545981667943_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGP6J3Uyr3aEIHKNAzeSvBz8YwfFa1weCsxSk1Skr92dA&oe=6877D54A&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:12', '2025-07-06 17:21:12'),
(2128, 'robi penipu', '6285298539577', '6285298539577@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468764908_2350214755336626_7391367694108560958_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEQ_Ul0nWz_1HXpvfl9h4N1A5N1BMey8EH0RkJeqOgGZQ&oe=6877DCF1&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:12', '2025-07-06 17:21:12'),
(2129, 'dissa badoo', '6285755872292', '6285755872292@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:13', '2025-07-06 17:21:13'),
(2130, 'Puji STAFF DESA', '6285780046843', '6285780046843@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491875735_760077776700712_4775790453530698240_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG0z8Ky97M7bAQLmVvzn7EgTzZbylUSYWv81gioJ0Gymw&oe=6877C501&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:13', '2025-07-06 17:21:13'),
(2131, 'Indah', '6285814076943', '6285814076943@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:14', '2025-07-06 17:21:14'),
(2132, 'yori', '6285774774909', '6285774774909@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:14', '2025-07-06 17:21:14'),
(2133, 'FITRIAH KAMRA 2', '6281386491373', '6281386491373@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/469240519_591579463552969_7675444393964265260_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF_H05GYIRDK-CkntaNeEolFS0HJhwjPdc0WMxJeZznSg&oe=6877D059&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:14', '2025-07-06 17:21:14'),
(2134, 'jaLim', '6285778108081', '6285778108081@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:15', '2025-07-06 17:21:15'),
(2135, 'Jundi', '6287744656638', '6287744656638@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491885851_604394336032313_6580837078646510222_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHk7oJXYJuiJ5PW3-JPOrqw50zRCQmMQ4j66pBZo_ZfcQ&oe=6877A86A&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:15', '2025-07-06 17:21:15'),
(2136, 'abid', '6285693063367', '6285693063367@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/515477623_596550493130145_752543605169557639_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHK5EgUtpIGswvQdaJCx94Z5DlQBYUxdB54vqAfr_nHYw&oe=6877C954&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:15', '2025-07-06 17:21:15'),
(2137, 'Yeng🖤', '6281808496470', '6281808496470@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513710979_24388313207441495_4175794489078937661_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFUp0i6Ssfo6V9sPTN1NUkifoto-5TODLbquG-n8ipn_w&oe=6877B75D&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:16', '2025-07-06 17:21:16'),
(2138, 'suprie', '6281584293026', '6281584293026@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:16', '2025-07-06 17:21:16'),
(2139, 'FITRI FADIL', '6285776696422', '6285776696422@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:16', '2025-07-06 17:21:16'),
(2140, 'teh ica 2', '6285810903294', '6285810903294@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491879572_1040606084828666_6622612524677740927_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFsiaXUlWdRDn9Jo-KXuOgkR31DlaCr7M89pLHpNAeyEw&oe=6877DAF7&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:17', '2025-07-06 17:21:17'),
(2141, 'teh eni agus', '6285710030030', '6285710030030@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/507750952_1426865088733528_2661439526758151785_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGT2rWdSH-rIPPvJ6U2AWtBl9t7L_dcXmIdiuYkgZN1FA&oe=6877C949&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:21:17', '2025-07-06 17:21:17'),
(2142, 'epso print', '6283875923804', '6283875923804@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/68304528_406192017000340_810340202836517304_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGt47tybcOl9vVwSbcaZPkfdeNd09gF6y0WXxgJ9A8oKg&oe=6877C693&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:17', '2025-07-06 17:21:17'),
(2143, 'DINASTI AUDIO', '6287725756114', '6287725756114@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/237782118_1299749737120866_7492690917514793381_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHGFdlkNWB6TcXNG5C8eYBguA3RQpyoPSBUHrpfrwc_sg&oe=6877B7F2&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:18', '2025-07-06 17:21:18'),
(2144, 'pubg firman elend', '6281278781327', '6281278781327@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:18', '2025-07-06 17:21:18'),
(2145, 'minta jasa rtr rw', '6281215474873', '6281215474873@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:18', '2025-07-06 17:21:18'),
(2146, 'kmi stiawan', '6281398955787', '6281398955787@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468563140_944812684247355_7955845452877467507_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG0E6H00GaKXe3-a9JdWlptZmOzstY51iWcmQHFY6-D-A&oe=6877B929&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:19', '2025-07-06 17:21:19'),
(2147, 'MDF bogor', '6281219989220', '6281219989220@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/468764907_1137181067923534_4346515860712920771_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEL4m8srGVwJFwErxm0iOyjDP0-sTvbkVBHikx6kAm8tw&oe=6877D7EA&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:19', '2025-07-06 17:21:19'),
(2148, 'Irhamulhaq', '6282246287074', '6282246287074@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:20', '2025-07-06 17:21:20'),
(2149, 'nana burung kprawa', '62895393637144', '62895393637144@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508549138_2099711537108073_7433617795195598016_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH59PRHGNgOVuouAhbgz339JnBrLjIR9ywUpR37Qcp1uQ&oe=6877C17C&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:20', '2025-07-06 17:21:20'),
(2150, 'Agus sandi vmala', '6285694164253', '6285694164253@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/487440496_3717763045184309_3936394048142113024_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFy8XQ6BQEg3H-4PloWKvPr-mopTHxt0n8NiRf6iRYH0g&oe=6877D4D5&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:20', '2025-07-06 17:21:20'),
(2151, 'season btm', '6281381397170', '6281381397170@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/445483230_1279460616353678_6445890894804849023_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEKJ8vn0Qylt_b-mJn20B1avjXyTJmEnCKGNpHKUg0o-w&oe=6877CF53&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:21', '2025-07-06 17:21:21'),
(2152, 'cw jual samsung', '6281219972397', '6281219972397@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:21', '2025-07-06 17:21:21'),
(2153, 'AGUNG GUNUNG GELIS', '628569969929', '628569969929@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:21', '2025-07-06 17:21:21'),
(2154, 'ateng', '6287711366446', '6287711366446@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:22', '2025-07-06 17:21:22'),
(2155, 'kiki bepwt', '6285607869756', '6285607869756@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:22', '2025-07-06 17:21:22'),
(2156, 'Desi asnet', '6285212443218', '6285212443218@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473396905_1123921352439502_5128083534641434595_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG29aPPsd-w0UU9BoFhhr04d9frAnwYlD0hhV_m2VWewA&oe=6877C50F&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:22', '2025-07-06 17:21:22'),
(2157, 'mio soul gt lengkap cibinong', '6285775156445', '6285775156445@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:23', '2025-07-06 17:21:23'),
(2158, 'Rian bandung', '6283820964648', '6283820964648@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/465929927_3852647651650145_8428579075722532213_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGZNlo1lXWaxL9C6lQ0FPgPSgcGEeAGLyof1kANWLb71A&oe=6877C8EC&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:23', '2025-07-06 17:21:23'),
(2159, 'ranen', '6285776451073', '6285776451073@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/439157820_3849246678652842_58074407524387646_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFmJmpWgKY4S3N-2YIFupAP7VMNmCMmXhAZ71XaylHPXQ&oe=6877C1A5&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:21:23', '2025-07-06 17:21:23'),
(2160, 'Ogie', '6289655417499', '6289655417499@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491869023_1363650214944441_7096326125227424830_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wE1kGLBNE9DAMLcyUSZqVZ82smDByqmg1QBeO8GX7KypQ&oe=6877CE68&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:24', '2025-07-06 17:21:24');
INSERT INTO `contacts` (`id`, `name`, `phone`, `whatsapp_id`, `profile_picture`, `is_business`, `status`, `created_at`, `updated_at`) VALUES
(2161, 'ez wifi koin', '6285786897199', '6285786897199@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:24', '2025-07-06 17:21:24'),
(2162, 'Egii Bubble', '6285882042334', '6285882042334@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473404424_2308535536179070_8053582358431970617_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH_nhO7mQaL2HjtzB-6OoUNKdk55UViWAt2upU0XVafog&oe=6877A8A2&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:24', '2025-07-06 17:21:24'),
(2163, 'limas bus', '628176300094', '628176300094@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/310110404_440667038172488_2320593037936386008_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFxWyg5hKqvb6jFvjl-95HMj3MLYgeHT2TaCszW9UYjTA&oe=6877DE15&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:25', '2025-07-06 17:21:25'),
(2164, 'marginda residen', '6281311489499', '6281311489499@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/516084804_1964562417647333_6083798980463253493_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHaZKGJLZEvd12FaEsgaYSaEYOXqQNhPpLyb6N63igdxw&oe=6877C065&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:25', '2025-07-06 17:21:25'),
(2165, 'M.eja', '628818086404', '628818086404@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473401049_637288575460965_2462946296356353520_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFi_Q1pR4xdEHE8V9Ob8ZiNYJLE8gSVC8iw5C4zGSejnA&oe=6877DAC4&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:25', '2025-07-06 17:21:25'),
(2166, 'HJ ANDRI', '628129417220', '628129417220@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508396305_1384821039474957_566625955921877517_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF2_iHbBQZTlZKjv8GZir_YFA_MGJMAxWT4EzX8PiEVlw&oe=6877C293&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:26', '2025-07-06 17:21:26'),
(2167, 'pipit gete', '6289654541181', '6289654541181@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:26', '2025-07-06 17:21:26'),
(2168, 'Iis vmala', '62895355221476', '62895355221476@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/510553993_1247112693861163_4837661349136072600_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGaz4_Pugy196imlu-SMIqtjK0zBdvJD80C36aYtR_kFw&oe=6877D739&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:21:26', '2025-07-06 17:21:26'),
(2169, 'Outdoor. co. id 2', '6285233111221', '6285233111221@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491889794_24282836191314176_3758578511265704821_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGHC-A8buK5p3Zgw_JCQNxLUBejZbH2LDfnGjO7YAgugw&oe=6877D32E&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:27', '2025-07-06 17:21:27'),
(2170, 'sally kredit hp', '6285716888882', '6285716888882@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513483500_3068974419940554_8635623810725583833_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFyhCiq4BkK82eQ39p3awzwL2G26l5NP0bsfFSt086h5A&oe=6877AA18&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:27', '2025-07-06 17:21:27'),
(2171, 'yadi pubg', '628989275714', '628989275714@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/437068910_501485709221559_1467954423702160047_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGzodcRKnOKG7hgoa4nGFPQrcH9jstu1NJ4lM0D7gyeoA&oe=6877B634&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:27', '2025-07-06 17:21:27'),
(2172, 'PT Suprim DGADOG Pakan Utama', '6282146687829', '6282146687829@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/306106219_1698592030542015_774829419788173879_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGqwvpHpNYsDXajnY_00Nklru6l1IOrYhbbIHBBj1Xszw&oe=6877B769&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:28', '2025-07-06 17:21:28'),
(2173, 'odon ganteng', '6283879059268', '6283879059268@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:28', '2025-07-06 17:21:28'),
(2174, 'kaos.polos mania', '6287843977711', '6287843977711@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/422500133_424618506749126_3148097755820497199_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGOBRsIDZiquyRSJ8BHhlrlHzv2L-Mhfakd0dvR3iK6Iw&oe=6877ADBC&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:21:28', '2025-07-06 17:21:28'),
(2175, 'perli', '6282114098788', '6282114098788@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:29', '2025-07-06 17:21:29'),
(2176, 'cemerlang cctv bogor', '628119961088', '628119961088@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/300849399_1225718528273037_630370410381915526_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEsuZoaC3gDtZ2toTcZYVyfQadfLXdTXV-jo-xKa17nJA&oe=6877C0BC&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:29', '2025-07-06 17:21:29'),
(2177, 'shella', '6283812895988', '6283812895988@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:29', '2025-07-06 17:21:29'),
(2178, 'cutting stiker tokped 1', '628999488299', '628999488299@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457825871_426963186499825_7397412542508167033_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGOjKVoj1kV3kVmNgh7fUiq5mIaBPTgOWgta3rHGZMiZw&oe=6877A8A2&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:30', '2025-07-06 17:21:30'),
(2179, 'LUDI', '6281381189001', '6281381189001@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/473397723_645095081327732_5165656749030093943_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGzplucAebrK49DHMHB1toS0HT0PRi363NDc3ZVfBccYQ&oe=6877B474&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:30', '2025-07-06 17:21:30'),
(2180, 'kikuk@ Ardi', '6287874712906', '6287874712906@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:31', '2025-07-06 17:21:31'),
(2181, 'dade BI', '6282348439263', '6282348439263@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:31', '2025-07-06 17:21:31'),
(2182, 'Tika IG', '6282261310125', '6282261310125@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/458627675_2259548517711435_4155097935730516935_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHQtSNUquPo_4jTE2nc5j8WtrmJ4_-irajNGXnt-hb9ng&oe=6877BF05&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:21:31', '2025-07-06 17:21:31'),
(2183, 'g', '628121845696', '628121845696@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/417318143_824368912909708_1208727446997496542_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH4OfUDYKDwwhDinHetOr7hQoBy9a_A6Uhu3e6ZQENRnA&oe=6877C71E&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:32', '2025-07-06 17:21:32'),
(2184, 'mas Takin M', '6285225419866', '6285225419866@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:32', '2025-07-06 17:21:32'),
(2185, 'Jaga vila dipo', '6283874564715', '6283874564715@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/513328776_1849157969200465_5776310714922685745_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEC-PbKCeP4OBMt5uYbGC-rpK2fLbbjADb9zL-m82K0Dg&oe=6877DA2C&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:32', '2025-07-06 17:21:32'),
(2186, 'aji gojel', '62895330868007', '62895330868007@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:33', '2025-07-06 17:21:33'),
(2187, 'tata rio', '6281275065678', '6281275065678@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491844217_585718863812974_8918324637545175031_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEtNL3_ztTvVho7UBCPzoH135wJ5Vp4QA6iY2I-rSDTAQ&oe=6877AE0C&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:33', '2025-07-06 17:21:33'),
(2188, 'kmi deni prod', '6281214151462', '6281214151462@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:33', '2025-07-06 17:21:33'),
(2189, 'Irham', '6289630490929', '6289630490929@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:34', '2025-07-06 17:21:34'),
(2190, 'pak wawan vimala', '628568889216', '628568889216@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/426606803_2572585719579003_1998344633140676890_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEXlY0lP7ClTzeopUhX1r2IxXwfD6v19v8ySbyXRXyMLQ&oe=6877A8FE&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:21:34', '2025-07-06 17:21:34'),
(2191, 'elektronmart.com', '6282114707747', '6282114707747@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:34', '2025-07-06 17:21:34'),
(2192, 'Indra bram', '6281325404792', '6281325404792@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/503996859_1722344438373046_7528163345544985759_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wGDrQVFcR_LMwovxo7W21vJeaLDO1wH7hMAtVJJbeCfBg&oe=6877D2DC&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:35', '2025-07-06 17:21:35'),
(2193, 'rak bogor', '6285779775397', '6285779775397@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/71285691_2363654320520894_6248581401204489706_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wG6wBIXTBTaxlXQw_lnOI1xLV9NmebCrvYf150F2ZpzcQ&oe=6877CCDC&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:35', '2025-07-06 17:21:35'),
(2194, 'Rina pak dede supriadi', '6281289603746', '6281289603746@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:35', '2025-07-06 17:21:35'),
(2195, 'pubg uziw', '6281342780462', '6281342780462@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:36', '2025-07-06 17:21:36'),
(2196, 'Aryanto', '6287774002476', '6287774002476@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:36', '2025-07-06 17:21:36'),
(2197, 'jual kawat kapas cipayung', '6287874377888', '6287874377888@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:36', '2025-07-06 17:21:36'),
(2198, 'jci fatia 1', '628111074002', '628111074002@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/368303458_831842338288255_993418727937738767_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEWmgYy74BKst5oayTYquVB43oF7iqyOmL4000E4k24Ng&oe=6877CAE3&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:37', '2025-07-06 17:21:37'),
(2199, 'lucy vmala', '6287874066558', '6287874066558@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/480549830_1158250775608747_1551759314622534676_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHTc_VvCRgHQw-7-OagRUHRz8Zb9R5q3COHlQ47wYXB8w&oe=6877BC0C&_nc_sid=5e03e0&_nc_cat=105', 0, '', '2025-07-06 17:21:37', '2025-07-06 17:21:37'),
(2200, 'sewa elf bogor', '6281315407666', '6281315407666@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:37', '2025-07-06 17:21:37'),
(2201, 'robi botak', '6285694112120', '6285694112120@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/504889934_710791048548795_600614999969285339_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFP3FpUfXvEPG23f_W_i9bkxBKIWhe_idSxUBFgeR4Kbg&oe=6877CA19&_nc_sid=5e03e0&_nc_cat=108', 0, '', '2025-07-06 17:21:38', '2025-07-06 17:21:38'),
(2202, 'javera kaos polos', '6282125064350', '6282125064350@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/346977523_277747101273665_6878755604900695170_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEGrRmmvwz3BxfxH15taQMNAZvMTMg0gRJ7QCdL-J0_aA&oe=6877C7B2&_nc_sid=5e03e0&_nc_cat=111', 0, '', '2025-07-06 17:21:38', '2025-07-06 17:21:38'),
(2203, 'bangbang GCR', '266507267387638', '266507267387638@lid', NULL, 0, '', '2025-07-06 17:21:38', '2025-07-06 17:21:38'),
(2204, 'hj nani', '628128224331', '628128224331@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/489462005_1093161572854263_7104581062236052865_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFTvVQ32jxeODiIGXbBm2kY_wGTLV40THL6SnDXz6t01g&oe=6877D1A2&_nc_sid=5e03e0&_nc_cat=102', 0, '', '2025-07-06 17:21:39', '2025-07-06 17:21:39'),
(2205, 'ompong BT', '6281284712340', '6281284712340@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/60470027_1184868148381037_1878036293410095104_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEMobcwZT-HukSBXV9fY3fEHaIBAvL3rVCmImzaXMporQ&oe=6877D01B&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:39', '2025-07-06 17:21:39'),
(2206, 'pubg bugs', '6281320995356', '6281320995356@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/403018402_178509658618130_867251712356072115_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHMDXjUrGu3996vW5ARdS6RZ6b78Zfyy-Crz6TX6lcRwA&oe=6877ADD1&_nc_sid=5e03e0&_nc_cat=109', 0, '', '2025-07-06 17:21:40', '2025-07-06 17:21:40'),
(2207, 'Ustad Semar', '6285710844973', '6285710844973@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491866782_2242859966112281_7728664808124815556_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wENAPscGkmLOrnLn1ON3r45jBufaVoG9wWc0KLcRnrNcw&oe=6877BD7A&_nc_sid=5e03e0&_nc_cat=103', 0, '', '2025-07-06 17:21:40', '2025-07-06 17:21:40'),
(2208, 'Mamah', '6285782532260', '6285782532260@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:40', '2025-07-06 17:21:40'),
(2209, 'RT tono', '6283872516939', '6283872516939@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/491839466_1844979166070926_2489240543086140702_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF779VosbXxHBceDISE3e_oN8FIT1kfV2j-kE5vlvPbBg&oe=6877CCA1&_nc_sid=5e03e0&_nc_cat=106', 0, '', '2025-07-06 17:21:41', '2025-07-06 17:21:41'),
(2210, 'kamannana', '6282211334423', '6282211334423@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/180488624_2767260373583354_6349753535337440605_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wH8ecyUMcBp8hNi7hOOlCiecHfV4t1rWG6rIlE6xzlA2Q&oe=6877BCB5&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:41', '2025-07-06 17:21:41'),
(2211, 'Pa Yudi', '628551434568', '628551434568@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/158228578_1017449568778344_8523937177425315345_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFEFpt_rmI6-b0rHwJ4xsuAINl0MPSbWQWYr_TGIQib3A&oe=6877C539&_nc_sid=5e03e0&_nc_cat=107', 0, '', '2025-07-06 17:21:42', '2025-07-06 17:21:42'),
(2212, 'amelia vimala', '6285730318418', '6285730318418@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:42', '2025-07-06 17:21:42'),
(2213, 'wahyu efendy', '6281310062985', '6281310062985@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/427076976_373157252278506_316864358200427297_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wHmCevTImdMcxLRXvnQvDpv_36_wWSkDUdQgYOjUM1sfA&oe=6877AC02&_nc_sid=5e03e0&_nc_cat=101', 0, '', '2025-07-06 17:21:42', '2025-07-06 17:21:42'),
(2214, 'Abi', '628128555062', '628128555062@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:43', '2025-07-06 17:21:43'),
(2215, 'pubg sabrina', '6285806291153', '6285806291153@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:43', '2025-07-06 17:21:43'),
(2216, 'Teh Ridha Vmala', '6281312350590', '6281312350590@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:43', '2025-07-06 17:21:43'),
(2217, 'Bpk Arif', '628988128055', '628988128055@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/457586950_1087814796474292_2764325856056314514_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wF_ee8qRlp_q-aa2uDdHWgRLZyzv5GgqOSf-LHiSZiUuA&oe=6877A7F0&_nc_sid=5e03e0&_nc_cat=100', 0, '', '2025-07-06 17:21:44', '2025-07-06 17:21:44'),
(2218, 'Agus GCR', '6281316413161', '6281316413161@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/508602091_2773673342820852_7390366594167569411_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wEuF8LvNzuvDq-oM1TgV2O7CUUjzDDIyYvJdGQ7WAh8Ww&oe=6877CE77&_nc_sid=5e03e0&_nc_cat=110', 0, '', '2025-07-06 17:21:44', '2025-07-06 17:21:44'),
(2219, 'sdn wiliam', '62811112386', '62811112386@s.whatsapp.net', NULL, 0, '', '2025-07-06 17:21:44', '2025-07-06 17:21:44'),
(2220, 'deni noviadi MORATEL', '6285888788409', '6285888788409@s.whatsapp.net', 'https://pps.whatsapp.net/v/t61.24694-24/476373352_3020300098120041_8721935238922922285_n.jpg?stp=dst-jpg_s96x96_tt6&ccb=11-4&oh=01_Q5Aa1wFTLftVwaoz2qF7aMAN0PslXjk8PHvwpEklAMqgNsUrYQ&oe=6877D342&_nc_sid=5e03e0&_nc_cat=104', 0, '', '2025-07-06 17:21:45', '2025-07-06 17:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `message_stats`
--

CREATE TABLE `message_stats` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sender_number` varchar(20) DEFAULT NULL,
  `target_number` varchar(255) NOT NULL,
  `target_type` enum('personal','group') DEFAULT 'personal',
  `message_length` int DEFAULT '0',
  `success` tinyint(1) DEFAULT '1',
  `error_message` text,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `message_stats`
--

INSERT INTO `message_stats` (`id`, `user_id`, `sender_number`, `target_number`, `target_type`, `message_length`, `success`, `error_message`, `sent_at`) VALUES
(1, 1, '6281234567890', '6287654321098@c.us', 'personal', 25, 1, NULL, '2025-07-06 17:57:34'),
(2, 1, '6281234567890', '6287654321099@c.us', 'personal', 50, 1, NULL, '2025-07-06 17:57:34'),
(3, 1, '6281234567890', '120363185287561070@g.us', 'group', 75, 1, NULL, '2025-07-06 17:57:34'),
(4, 1, '6281234567890', '6287654321100@c.us', 'personal', 30, 0, 'Nomor tidak terdaftar', '2025-07-06 17:57:34'),
(5, 1, '6281234567890', '6287654321101@c.us', 'personal', 40, 1, NULL, '2025-07-06 17:57:34'),
(6, 1, '6281234567890', '6287654321098@c.us', 'personal', 25, 1, NULL, '2025-07-06 17:58:50'),
(7, 1, '6281234567890', '6287654321099@c.us', 'personal', 50, 1, NULL, '2025-07-06 17:58:50'),
(8, 1, '6281234567890', '120363185287561070@g.us', 'group', 75, 1, NULL, '2025-07-06 17:58:50'),
(9, 1, '6281234567890', '6287654321100@c.us', 'personal', 30, 0, 'Nomor tidak terdaftar', '2025-07-06 17:58:50'),
(10, 1, '6281234567890', '6287654321101@c.us', 'personal', 40, 1, NULL, '2025-07-06 17:58:50'),
(11, 1, '6281234567890', '6287654321102@c.us', 'personal', 35, 1, NULL, '2025-07-06 17:58:50'),
(12, 1, '6281234567890', '120363185287561071@g.us', 'group', 60, 1, NULL, '2025-07-06 17:58:50'),
(13, 1, '6281234567890', '6287654321103@c.us', 'personal', 45, 0, 'Timeout', '2025-07-06 17:58:50'),
(14, 1, '6281234567890', '6287654321104@c.us', 'personal', 55, 1, NULL, '2025-07-06 17:58:50'),
(15, 1, '6281234567890', '6287654321105@c.us', 'personal', 20, 1, NULL, '2025-07-06 17:58:50'),
(16, 1, '628988409756', '628988409756@c.us', 'personal', 86, 1, NULL, '2025-07-06 19:13:08'),
(17, 1, '628988409756', '628988409756@c.us', 'personal', 86, 1, NULL, '2025-07-06 19:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text,
  `setting_type` enum('string','number','boolean','json') DEFAULT 'string',
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`, `setting_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'trial_duration_days', '7', 'number', 'Trial period duration in days', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(2, 'monthly_price', '50000', 'number', 'Monthly subscription price in IDR', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(3, 'yearly_price', '500000', 'number', 'Yearly subscription price in IDR', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(4, 'max_users_per_server', '100', 'number', 'Maximum users allowed per server', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(5, 'auto_approval', 'false', 'boolean', 'Auto approve new user registrations', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(6, 'maintenance_mode', 'false', 'boolean', 'Enable maintenance mode', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(7, 'app_name', 'Eglobaltech WA-Gateway', 'string', 'Application name', '2025-07-06 19:13:58', '2025-07-06 19:13:58'),
(8, 'admin_email', 'admin@eglobaltech.id', 'string', 'Admin email for notifications', '2025-07-06 19:13:58', '2025-07-06 19:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `api_key` varchar(64) DEFAULT NULL,
  `whatsapp_device_id` varchar(255) DEFAULT NULL,
  `whatsapp_device_name` varchar(255) DEFAULT NULL,
  `last_connected` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `subscription_type` enum('free','monthly','yearly') DEFAULT 'free',
  `expired_date` date DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_payment_date` date DEFAULT NULL,
  `payment_status` enum('active','expired','suspended','trial') DEFAULT 'trial',
  `trial_ends_at` date DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`, `api_key`, `whatsapp_device_id`, `whatsapp_device_name`, `last_connected`, `is_active`, `approved_by`, `approved_at`, `subscription_type`, `expired_date`, `created_date`, `last_payment_date`, `payment_status`, `trial_ends_at`, `phone_number`, `full_name`, `email`, `whatsapp_number`) VALUES
(1, 'admin', '$2y$10$6lSl1I4GMDV7PHn09LEu6eAg/cEntFJ.E06t.NNOfkxRid9hy3Cmm', 'admin', '2025-07-06 16:39:24', 'wa_f23d0652_e0a40aa8c6f894670da58205b7271d56', '628988409756:95@s.whatsapp.net', 'Eglobaltech.id', '2025-07-06 19:46:13', 1, NULL, NULL, 'yearly', NULL, '2025-07-06 19:12:57', NULL, 'active', '2025-07-14', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_api_usage`
--

CREATE TABLE `user_api_usage` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `endpoint` varchar(100) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `request_data` text,
  `response_status` int DEFAULT NULL,
  `response_time_ms` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_connections`
--

CREATE TABLE `user_connections` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `connection_status` enum('connected','disconnected','scanning','connecting') DEFAULT 'disconnected',
  `last_connected` timestamp NULL DEFAULT NULL,
  `last_disconnected` timestamp NULL DEFAULT NULL,
  `session_path` varchar(255) DEFAULT NULL,
  `qr_code` text,
  `device_info` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_connections`
--

INSERT INTO `user_connections` (`id`, `user_id`, `whatsapp_number`, `connection_status`, `last_connected`, `last_disconnected`, `session_path`, `qr_code`, `device_info`, `created_at`, `updated_at`) VALUES
(1, 1, '628988409756', 'connected', '2025-07-06 20:18:43', NULL, 'sessions/user_1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARQAAAEUCAYAAADqcMl5AAAAAklEQVR4AewaftIAABIOSURBVO3BQY4YybLgQDJR978yR0tfBZDIKLX+GzezP1hrrQse1lrrkoe11rrkYa21LnlYa61LHtZa65KHtda65GGttS55WGutSx7WWuuSh7XWuuRhrbUueVhrrUse1lrrkoe11rrkYa21LvnhI5W/qeImlaniC5WbKk5Upoo3VKaKE5Wp4g2Vk4qbVL6omFSmijdUTiomlb+p4ouHtda65GGttS55WGutS364rOImlS9UblI5qThR+UJlqphUpopJ5Q2VqeI3qdxUMalMFZPKpHKiMlX8poqbVG56WGutSx7WWuuSh7XWuuSHX6byRsUbKjepTBUnFScqU8WkcqIyVXxRMam8oTJVvFFxojJVTCpTxaQyqZyoTBWTylTxhspvUnmj4jc9rLXWJQ9rrXXJw1prXfLD/2cqTlS+UJkqTipOVE5UflPFFypfqEwVX1ScqEwVJypvVEwq/0se1lrrkoe11rrkYa21Lvnhf0zFpPJGxaTyRsWJyhcqU8WkcqJyonJTxRsqU8WkMlV8oTJVnKh8oTJV/C95WGutSx7WWuuSh7XWuuSHX1bxX6qYVE4qpopJZVI5qTipuKnii4o3VKaKSeWNikllqripYlI5qZhU3qi4qeJf8rDWWpc8rLXWJQ9rrXXJD5ep/EtUpopJ5URlqphUpopJZaqYVKaKSWWqmFSmikllqphUTlSmii8qJpUvVKaKSeVEZaqYVN6omFROVKaKE5V/2cNaa13ysNZalzystdYlP3xU8S9ReaPipOKkYlKZKr6oOKn4TRVvqHyhMlXcpPJGxRsqU8UXFf+XPKy11iUPa611ycNaa11if/CBylQxqdxUcaJyUjGpfFHxm1ROKiaVqWJS+U0Vk8obFZPKVHGiclJxonJTxaQyVZyo3FTxmx7WWuuSh7XWuuRhrbUu+eGXVUwqJxUnKlPFFxUnKjepfFFxU8WkMlVMKm9UnKhMKlPFb1I5qZhUTipOKk5U3qiYVE5UpoqbHtZa65KHtda65GGttS754R+jclIxqUwVk8qkclIxVUwqk8obFZPKb1I5UTlRmSpOVE4qflPFpPJGxaTyhspJxaQyVUwqU8UXFZPKVPHFw1prXfKw1lqXPKy11iX2Bx+onFT8JpXfVPGFylRxovJGxYnKVHGi8kbFicpU8ZtUTipOVL6omFSmijdUTiq+UJkqvnhYa61LHtZa65KHtda6xP7gIpWp4kTljYpJ5Y2KSeWLijdUpopJ5aRiUjmp+EJlqphUTiomlZOKL1TeqDhR+aJiUrmp4l/ysNZalzystdYlD2utdYn9wQcqb1ScqEwVb6hMFV+onFTcpHJS8YbKb6p4Q2WqmFSmijdU3qh4Q2WqmFSmijdUvqg4UTmp+OJhrbUueVhrrUse1lrrkh8uq7hJ5aTiROWmijdU3qiYVCaVqeKk4g2V31TxhspU8UbFicpUMamcqEwVk8pUMalMFZPKVDGpTCpTxd/0sNZalzystdYlD2utdckPl6mcVJxUfFHxhcobKlPFFypvqLxR8UXFicpJxW+qmFSmiqnijYpJZVI5UZkqJpWpYlI5qfgvPay11iUPa611ycNaa13yw2UVk8qkclIxqbxRMalMFZPKVDGpTCpTxRcVN6lMFW9UTCqTylRxUjGp/CaVqWJSmSreUHmjYlKZVL6omFROKn7Tw1prXfKw1lqXPKy11iX2BxepnFRMKlPFicpNFZPKScUXKicVk8pJxYnKScWkclJxojJVnKicVEwqN1VMKlPFpPJGxRcqU8WJylQxqUwVNz2stdYlD2utdcnDWmtdYn/wgcpUcaJyUjGpnFScqLxRcaLyRcWJylTxX1I5qZhUTiomlaniRGWqOFF5o2JSmSreUDmpmFSmikllqphUTiomlanii4e11rrkYa21LnlYa61LfvioYlI5qThRmSpOVH6TyknFGypTxVQxqUwVk8pJxd9UcaIyVUwqU8WJylTxRsWk8obKVDFVTCqTylRxUjGpTBUnKr/pYa21LnlYa61LHtZa65IfflnFpPKGylTxRsWkMlXcpDJVTBVvVEwqU8UbKlPFpDJVnKhMFZPKVDGpTBUnFW9UTConFZPKpPKGyhcqU8VUMalMFScVNz2stdYlD2utdcnDWmtd8sNHKlPFpDJVTCpTxRcVk8pUMamcVEwqk8obKicVk8obKlPFVDGpvKEyVZxUTConKlPFpDJVTCo3VUwqU8WkMlW8oXKiMlX8Sx7WWuuSh7XWuuRhrbUusT/4RSpvVEwqU8UbKicVk8obFScqU8VNKlPFb1KZKiaV31TxhspJxRcqU8Wk8kbFpDJVTCpTxYnKScUXD2utdcnDWmtd8rDWWpf8cJnKScWkclIxqbxR8V+qmFSmii8q3lCZKiaVqeJEZaqYVE4qTlROVN6o+EJlqjipmFTeqJhU/mUPa611ycNaa13ysNZal9gf/CKVqeJE5aRiUpkqfpPKScWJyknFicobFV+ovFHxhsoXFW+oTBWTyknFpHJSMalMFZPKScUbKlPFb3pYa61LHtZa65KHtda65IePVN5QmSqmihOVE5WpYlKZKiaVk4pJ5URlqphUJpWTikllqphUTiomlaniDZWpYlKZKt5QOVH5ouKNiknlpOILlZOKN1Smii8e1lrrkoe11rrkYa21LvnhsoovVH5TxUnFGxUnFZPKGxWTyhsVk8oXKl9UnKicVLxR8YXKScVNFZPKFxWTym96WGutSx7WWuuSh7XWusT+4C9SeaPiROWkYlKZKk5Upoo3VKaKE5Wp4kTlpOINlZOKSWWqOFE5qThRmSreULmp4r+kclLxNz2stdYlD2utdcnDWmtdYn/wgcpU8YbKv6ziROWmihOVNypOVH5TxaTyRcUbKicVk8pUcaJyUnGi8i+p+OJhrbUueVhrrUse1lrrkh/+MpWTijdUpooTlaniDZWpYlKZKt5QmSreqJhU3qh4Q2WquKliUrlJZao4UZkqJpUTlZOKN1SmihOVqeKmh7XWuuRhrbUueVhrrUt++KjiRGWqmFROVKaKE5WpYqqYVN6oOKmYVN6omFSmihOVqeJE5URlqjhReaNiUvmi4m9SmSpOKiaVE5Wp4kRlqpgqJpWp4ouHtda65GGttS55WGutS364TOWmiptUpooTlS8qJpU3Kk5UTlS+qHij4m+qOFH5TRVvqLxR8UbFicpvelhrrUse1lrrkoe11rrkh49UpopJZVI5UfmXVEwqJxWTyhsqU8UbFW+oTCo3qdxUcaIyVUwqU8Wk8obKScUbKjepTBW/6WGttS55WGutSx7WWuuSHy5TmSreUJkqJpWpYlJ5Q+WkYqqYVE4qvlB5Q+WmiknljYpJZaqYVE5U3lB5o+INlanijYoTlZOKL1Smii8e1lrrkoe11rrkYa21Lvnho4oTlS9UflPFicpUcaLyRsWkMlW8ofKbKiaVSWWqeKPijYpJ5QuVk4oTlZOKSeVvUvlND2utdcnDWmtd8rDWWpfYH3ygMlVMKicVk8pUMal8UTGpTBWTyhsVJyonFZPKVDGpTBVvqEwVk8pJxaTyRsWkMlVMKicVb6hMFW+o/E0Vk8pUcaIyVdz0sNZalzystdYlD2utdYn9wQcqU8UXKicVb6h8UfGbVE4qTlROKiaVk4pJ5Y2KSWWqmFROKm5SmSreUDmpmFRuqphUTipOVKaKLx7WWuuSh7XWuuRhrbUu+eGjit9U8YbKVPGGyonKVDGpTBWTyknFicpJxaQyVZyoTBWTyhsVk8pNKm9UTCpTxUnFpDKpTBVvqJyoTBWTyhsVNz2stdYlD2utdcnDWmtd8sNHKlPFGyonKicVb6i8oTJVTCpTxRsVJypTxaQyqZyovKHyhcpU8YbKGxW/SeWkYlI5qfhC5Q2VqeKmh7XWuuRhrbUueVhrrUt++GUqU8VJxX+p4kRlqjhROVGZKk5UTiomlZsqblKZKqaKSeUNlZOKSeULlaniRGWqOFE5qTipmFSmii8e1lrrkoe11rrkYa21Lvnho4qTiknlDZWpYlL5omJSmSqmihOVNyomlZOKSWVSOak4UXlD5aRiUvmi4kTlpopJ5Q2VN1ROKiaVSWWq+Jse1lrrkoe11rrkYa21LvnhI5WpYlL5ouKNikllqjipmFTeqDhReaNiUpkqvlA5qZhUpoovKr5QmSomlaliUnmj4guVk4oTlaliUnmj4qaHtda65GGttS55WGutS+wPLlKZKiaVf0nFGypTxaQyVUwqb1R8oXJSMalMFW+oTBVfqEwVJypTxaQyVZyoTBUnKm9UTCo3VUwqJxVfPKy11iUPa611ycNaa13yw0cqU8WkMlVMKicVb6hMFZPKicoXFW9UvKEyVZxUfKFyUjFVTCpTxW+qeEPlpoo3VKaKSeWk4l/ysNZalzystdYlD2utdYn9wS9SmSpOVE4qTlR+U8UbKm9UnKhMFZPKVDGpTBUnKn9TxRcqJxVfqLxRMam8UTGp/KaKLx7WWuuSh7XWuuRhrbUu+eEjld9UcaIyVZyonFScqEwVb1S8oTJVTCpTxaRyojJVTBVfqLyhMlVMKjepTBW/qWJSOVGZKt5QOam46WGttS55WGutSx7WWuuSHy6rmFQmlTdUTiomlanipoovVN6omFS+qHhDZaqYVE4qTlSmiknljYoTlaniRGWqmFROVKaKL1SmikllqjhRmSq+eFhrrUse1lrrkoe11rrkh48qTir+L1OZKm6qOFH5ouJE5Q2VqeJvqphUvlD5TRUnFZPKVHGiMlWcqEwVNz2stdYlD2utdcnDWmtd8sNHKicVk8pUcaLyhcpUcZPKGxUnKlPFicpNFZPKVPGFyhsVJxWTylRxUvGGyhcqJxVfqJxUTCpTxRcPa611ycNaa13ysNZal9gffKAyVZyovFExqUwVk8pUMalMFb9J5aRiUvmXVZyoTBUnKicVJypTxaQyVUwqJxWTyhsVb6hMFW+oTBWTyknFFw9rrXXJw1prXfKw1lqX2B/8IpW/qWJSmSq+UPlNFW+ofFExqbxRcaIyVZyonFRMKicVX6hMFW+o/KaKSWWqmFROKr54WGutSx7WWuuSh7XWuuSHj1TeqJhUpor/ksobFZPKVDGpvKFyUjGpTBWTyqQyVdxUcaIyVbxRMalMKicVk8pUMalMFW9UTCpTxaQyVUwqU8V/6WGttS55WGutSx7WWusS+4MPVL6oOFGZKk5UpopJZaqYVKaKSWWq+ELlpoo3VG6qOFF5o+ILlZOKE5U3Kk5U/qaKSWWquOlhrbUueVhrrUse1lrrkh8+qvhNFScqX6hMFZPKGypTxUnFpHKTylRxUvGGyhsVJyonKlPFGxUnKlPFpDJVTCpTxVQxqUwVb6hMFZPKicpU8cXDWmtd8rDWWpc8rLXWJT98pPI3VUwVN6mcVEwqU8UbKlPFicpUMalMFZPKGypTxRsqb1RMKicqU8VUcaIyVUwq/yWVqeJf9rDWWpc8rLXWJQ9rrXXJD5dV3KRyojJVTConFV9UnKhMFScqU8WJylRxUjGpnFS8oTJVfFExqZyonFRMFZPKScUbKlPFGxVfVEwqv+lhrbUueVhrrUse1lrrkh9+mcobFTdVnKj8TSpTxaTyhcpUMamcqHxRMam8UTGpnFS8oTJVTBUnKicVk8obKl+oTBV/08Naa13ysNZalzystdYlP/yPUzmpmFROKk5U/ksVk8pvqjipmFSmipOKN1ROKr6oOFGZKiaVqeI3qUwVk8pND2utdcnDWmtd8rDWWpf88D+uYlL5QmWqOKmYVE4qJpWp4o2KN1SmijdUTiomlZsq3lCZKt5QOVGZKk5U3qiYVP5LD2utdcnDWmtd8rDWWpf88MsqflPFpDJVTBVfVEwqv6liUpkqJpWpYlI5qXhD5aTipOJEZaqYVCaVL1SmikllqvhC5Y2KNyr+poe11rrkYa21LnlYa61L7A8+UPmbKiaVqWJS+aJiUvmiYlKZKk5UTiq+UHmj4guVNyq+UJkq3lA5qZhUTiomlf9SxRcPa611ycNaa13ysNZal9gfrLXWBQ9rrXXJw1prXfKw1lqXPKy11iUPa611ycNaa13ysNZalzystdYlD2utdcnDWmtd8rDWWpc8rLXWJQ9rrXXJw1prXfKw1lqX/D+ht0K6ioHwnwAAAABJRU5ErkJggg==', '{}', '2025-07-06 19:13:58', '2025-07-06 20:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `contact_avatar` text,
  `is_business` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `user_id`, `contact_name`, `contact_phone`, `contact_avatar`, `is_business`, `created_at`, `updated_at`) VALUES
(55, 1, '628988409756', '628988409756', NULL, 0, '2025-07-06 20:18:49', '2025-07-06 20:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_description` text,
  `participants_count` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) DEFAULT 'IDR',
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp_id` (`whatsapp_id`);

--
-- Indexes for table `message_stats`
--
ALTER TABLE `message_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_sender_number` (`sender_number`),
  ADD KEY `idx_sent_at` (`sent_at`),
  ADD KEY `idx_message_stats_user_id` (`user_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `api_key` (`api_key`),
  ADD UNIQUE KEY `api_key_2` (`api_key`),
  ADD UNIQUE KEY `api_key_3` (`api_key`),
  ADD KEY `idx_users_payment_status` (`payment_status`),
  ADD KEY `idx_users_expired_date` (`expired_date`);

--
-- Indexes for table `user_api_usage`
--
ALTER TABLE `user_api_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_date` (`user_id`,`created_at`),
  ADD KEY `idx_endpoint` (`endpoint`);

--
-- Indexes for table `user_connections`
--
ALTER TABLE `user_connections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_connection` (`user_id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_contact` (`user_id`,`contact_phone`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_group` (`user_id`,`group_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_transaction` (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2455;

--
-- AUTO_INCREMENT for table `message_stats`
--
ALTER TABLE `message_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_api_usage`
--
ALTER TABLE `user_api_usage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_connections`
--
ALTER TABLE `user_connections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message_stats`
--
ALTER TABLE `message_stats`
  ADD CONSTRAINT `message_stats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_api_usage`
--
ALTER TABLE `user_api_usage`
  ADD CONSTRAINT `user_api_usage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_connections`
--
ALTER TABLE `user_connections`
  ADD CONSTRAINT `user_connections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD CONSTRAINT `user_contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD CONSTRAINT `user_payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
