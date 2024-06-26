-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 10, 2021 at 12:18 PM
-- Server version: 5.7.28
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cattle2`
--

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
CREATE TABLE IF NOT EXISTS `breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(11) NOT NULL,
  `breeding_date` date NOT NULL,
  `breeding_type` enum('Artificial Insemination','Natural Insemination') NOT NULL DEFAULT 'Artificial Insemination',
  `breeding_status` enum('Observation','Success','Failed') NOT NULL DEFAULT 'Success',
  `expected_birth_date` date NOT NULL,
  `cost` int(11) NOT NULL,
  `ai_worker_id` int(11) NOT NULL,
  `comments` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cattle`
--

DROP TABLE IF EXISTS `cattle`;
CREATE TABLE IF NOT EXISTS `cattle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `cattle_type_id` int(11) NOT NULL,
  `status` enum('Active','Sold','Died') NOT NULL DEFAULT 'Active',
  `father_insemination` enum('Artificial Insemination','Natural Insemination') NOT NULL DEFAULT 'Artificial Insemination',
  `parent_id` int(11) DEFAULT NULL,
  `purchase_source` varchar(255) NOT NULL,
  `purchase_amount` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `farm_entry_date` date NOT NULL,
  `purchase_image` varchar(255) DEFAULT NULL,
  `latest_image` varchar(255) DEFAULT NULL,
  `middleman` varchar(11) DEFAULT NULL,
  `species` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `teeth` int(11) NOT NULL,
  `expected_sale_price` int(11) NOT NULL,
  `daily_expense` int(11) NOT NULL,
  `birth_type` enum('Prematured','Well') NOT NULL DEFAULT 'Well',
  `comments` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cattle`
--

INSERT INTO `cattle` (`id`, `title`, `cattle_type_id`, `status`, `father_insemination`, `parent_id`, `purchase_source`, `purchase_amount`, `purchase_date`, `farm_entry_date`, `purchase_image`, `latest_image`, `middleman`, `species`, `date_of_birth`, `teeth`, `expected_sale_price`, `daily_expense`, `birth_type`, `comments`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, '07', 1, 'Active', 'Artificial Insemination', NULL, 'CAT- Abdul Hakim', 18000, '2018-06-22', '2018-06-22', 'uploads/ltfNojhnDLNUk7Ogn1UOKKh8HSwELnkHJBlCDio1.jpeg', 'uploads/FIL7juzmk8HJZjF5yNpUzMEoV86lzDNYrDFL6lNK.jpeg', 'Abdul Hakim', 'Friesian Cross', '2018-01-22', 0, 150000, 150, 'Well', 'First time give birth a male calfat 06.03.20. Calf\'s body weight 25 kg. Purchased from Abdul Hakim Govt. farm calf ( Rohinga)@18000. Latest image & update with Alamin@17.03.20', 1, '2020-01-04 09:09:20', '2020-03-17 07:47:39', NULL),
(14, '14', 1, 'Active', 'Artificial Insemination', NULL, 'GUK', 15000, '2018-10-06', '2019-11-26', 'uploads/dzvmpmmWhc2igf259VnFsm47F44iAqj5LCNJqIdp.jpeg', 'uploads/qBV6fhDedkQ5KIDdZsFjWtPVD0mgnsOrDHu4p8oK.jpeg', 'Anamul', 'Friesian', '2016-11-13', 4, 250000, 200, 'Well', 'Purchased from GUK. Latest image & updated with Alamin @17.03.20', 1, '2020-01-04 09:29:50', '2020-03-17 08:09:37', NULL),
(38, '38', 1, 'Active', 'Artificial Insemination', NULL, 'GUK ( Gram Unnayan Karmo)', 175000, '2018-06-25', '2019-11-26', 'uploads/VHO8IZSogPPeCAK6lqem5m49Md2ipljttuZay1qq.jpeg', 'uploads/u429y3yvbSMxMFhwhbYtHiDNXUv1if720flkfOAV.jpeg', 'Anamul', 'Friesian', '2017-12-31', 8, 0, 0, 'Well', 'গাক থেকে ক্রয় করা হয়েছে। শুরুতে দুধ দেবার পরিমান ১৭ কেজি। বর্তমানে ১৩ কেজি। ফার্মে বাচ্চা দিয়েছে ২ বার। প্রথম বাচ্চা বকনা ( আই ডি- ) । ১৩.০১.২০ তারিখে আনুমানিক বাজার মূল্য  ৮০০০০। দ্বিতীয় বাচ্চা ষাঁড় বাছুর ( আই ডি-)। latest image & update with Alamin @17.03.20', 1, '2020-01-06 04:31:27', '2021-08-10 05:47:05', NULL),
(41, '41', 1, 'Active', 'Artificial Insemination', NULL, 'Anamul', 100000, '2018-10-08', '2019-11-26', 'uploads/Do1do1kowtDYNY3j1bEy7RVCQ4oe9xYMzoWcK5rS.jpeg', 'uploads/1HECpvbKq7Za1wL6Fhng4TOAAOw3zCgznZfmmqGg.jpeg', 'Anamul', 'Friesian', '2017-12-31', 8, 200000, 150, 'Well', 'Latest image & update with Alamin @17.03.20', 1, '2020-01-06 05:08:01', '2020-03-17 07:40:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cattle_costs`
--

DROP TABLE IF EXISTS `cattle_costs`;
CREATE TABLE IF NOT EXISTS `cattle_costs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cattle_types`
--

DROP TABLE IF EXISTS `cattle_types`;
CREATE TABLE IF NOT EXISTS `cattle_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cattle_types`
--

INSERT INTO `cattle_types` (`id`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cow', 'Active', '2020-01-29 02:08:13', '2020-01-29 02:08:13', NULL),
(2, 'OX', 'Active', '2020-01-29 02:10:04', '2020-01-29 02:10:04', NULL),
(3, 'Heifer', 'Active', '2020-01-29 02:10:25', '2020-01-29 02:10:25', NULL),
(4, 'Male Calf', 'Active', '2020-01-29 02:10:51', '2020-01-29 02:10:51', NULL),
(5, 'Female Calf', 'Active', '2020-01-29 02:11:07', '2020-01-29 02:11:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cattle_weights`
--

DROP TABLE IF EXISTS `cattle_weights`;
CREATE TABLE IF NOT EXISTS `cattle_weights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `country_code` char(2) NOT NULL DEFAULT '',
  `currency_code` char(3) DEFAULT NULL,
  `capital` varchar(30) DEFAULT NULL,
  `continent_name` varchar(100) NOT NULL,
  `continent_code` char(2) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_code`, `currency_code`, `capital`, `continent_name`, `continent_code`, `status`) VALUES
(1, 'Andorra', 'AD', 'EUR', 'Andorra la Vella', 'Europe', 'EU', 'Active'),
(2, 'United Arab Emirates', 'AE', 'AED', 'Abu Dhabi', 'Asia', 'AS', 'Active'),
(3, 'Afghanistan', 'AF', 'AFN', 'Kabul', 'Asia', 'AS', 'Active'),
(4, 'Antigua and Barbuda', 'AG', 'XCD', 'St. John\'s', 'North America', 'NA', 'Active'),
(5, 'Anguilla', 'AI', 'XCD', 'The Valley', 'North America', 'NA', 'Active'),
(6, 'Albania', 'AL', 'ALL', 'Tirana', 'Europe', 'EU', 'Active'),
(7, 'Armenia', 'AM', 'AMD', 'Yerevan', 'Asia', 'AS', 'Active'),
(8, 'Angola', 'AO', 'AOA', 'Luanda', 'Africa', 'AF', 'Active'),
(9, 'Antarctica', 'AQ', '', '', 'Antarctica', 'AN', 'Active'),
(10, 'Argentina', 'AR', 'ARS', 'Buenos Aires', 'South America', 'SA', 'Active'),
(11, 'American Samoa', 'AS', 'USD', 'Pago Pago', 'Oceania', 'OC', 'Active'),
(12, 'Austria', 'AT', 'EUR', 'Vienna', 'Europe', 'EU', 'Active'),
(13, 'Australia', 'AU', 'AUD', 'Canberra', 'Oceania', 'OC', 'Active'),
(14, 'Aruba', 'AW', 'AWG', 'Oranjestad', 'North America', 'NA', 'Active'),
(15, 'Åland Islands', 'AX', 'EUR', 'Mariehamn', 'Europe', 'EU', 'Active'),
(16, 'Azerbaijan', 'AZ', 'AZN', 'Baku', 'Asia', 'AS', 'Active'),
(17, 'Bosnia and Herzegovina', 'BA', 'BAM', 'Sarajevo', 'Europe', 'EU', 'Active'),
(18, 'Barbados', 'BB', 'BBD', 'Bridgetown', 'North America', 'NA', 'Active'),
(19, 'Bangladesh', 'BD', 'BDT', 'Dhaka', 'Asia', 'AS', 'Active'),
(20, 'Belgium', 'BE', 'EUR', 'Brussels', 'Europe', 'EU', 'Active'),
(21, 'Burkina Faso', 'BF', 'XOF', 'Ouagadougou', 'Africa', 'AF', 'Active'),
(22, 'Bulgaria', 'BG', 'BGN', 'Sofia', 'Europe', 'EU', 'Active'),
(23, 'Bahrain', 'BH', 'BHD', 'Manama', 'Asia', 'AS', 'Active'),
(24, 'Burundi', 'BI', 'BIF', 'Bujumbura', 'Africa', 'AF', 'Active'),
(25, 'Benin', 'BJ', 'XOF', 'Porto-Novo', 'Africa', 'AF', 'Active'),
(26, 'Saint Barthélemy', 'BL', 'EUR', 'Gustavia', 'North America', 'NA', 'Active'),
(27, 'Bermuda', 'BM', 'BMD', 'Hamilton', 'North America', 'NA', 'Active'),
(28, 'Brunei Darussalam', 'BN', 'BND', 'Bandar Seri Begawan', 'Asia', 'AS', 'Active'),
(29, 'Bolivia', 'BO', 'BOB', 'Sucre', 'South America', 'SA', 'Active'),
(30, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'USD', '', 'North America', 'NA', 'Active'),
(31, 'Brazil', 'BR', 'BRL', 'Brasília', 'South America', 'SA', 'Active'),
(32, 'Bahamas', 'BS', 'BSD', 'Nassau', 'North America', 'NA', 'Active'),
(33, 'Bhutan', 'BT', 'BTN', 'Thimphu', 'Asia', 'AS', 'Active'),
(34, 'Bouvet Island', 'BV', 'NOK', '', 'Antarctica', 'AN', 'Active'),
(35, 'Botswana', 'BW', 'BWP', 'Gaborone', 'Africa', 'AF', 'Active'),
(36, 'Belarus', 'BY', 'BYR', 'Minsk', 'Europe', 'EU', 'Active'),
(37, 'Belize', 'BZ', 'BZD', 'Belmopan', 'North America', 'NA', 'Active'),
(38, 'Canada', 'CA', 'CAD', 'Ottawa', 'North America', 'NA', 'Active'),
(39, 'Cocos [Keeling] Islands', 'CC', 'AUD', 'West Island', 'Asia', 'AS', 'Active'),
(40, 'Democratic Republic of the Congo', 'CD', 'COD', 'Kinshasa', 'Africa', 'AF', 'Active'),
(41, 'Central African Republic', 'CF', 'XAF', 'Bangui', 'Africa', 'AF', 'Active'),
(42, 'Republic of the Congo', 'CG', 'XAF', 'Brazzaville', 'Africa', 'AF', 'Active'),
(43, 'Switzerland', 'CH', 'CHF', 'Berne', 'Europe', 'EU', 'Active'),
(44, 'Ivory Coast', 'CI', 'XOF', 'Yamoussoukro', 'Africa', 'AF', 'Active'),
(45, 'Cook Islands', 'CK', 'NZD', 'Avarua', 'Oceania', 'OC', 'Active'),
(46, 'Chile', 'CL', 'CLP', 'Santiago', 'South America', 'SA', 'Active'),
(47, 'Cameroon', 'CM', 'XAF', 'Yaoundé', 'Africa', 'AF', 'Active'),
(48, 'China', 'CN', 'CNY', 'Beijing', 'Asia', 'AS', 'Active'),
(49, 'Colombia', 'CO', 'COP', 'Bogotá', 'South America', 'SA', 'Active'),
(50, 'Costa Rica', 'CR', 'CRC', 'San José', 'North America', 'NA', 'Active'),
(51, 'Cuba', 'CU', 'CUP', 'Havana', 'North America', 'NA', 'Active'),
(52, 'Cape Verde', 'CV', 'CVE', 'Praia', 'Africa', 'AF', 'Active'),
(53, 'Curaçao', 'CW', 'ANG', 'Willemstad', 'North America', 'NA', 'Active'),
(54, 'Christmas Island', 'CX', 'AUD', 'The Settlement', 'Asia', 'AS', 'Active'),
(55, 'Cyprus', 'CY', 'EUR', 'Nicosia', 'Europe', 'EU', 'Active'),
(56, 'Czech Republic', 'CZ', 'CZK', 'Prague', 'Europe', 'EU', 'Active'),
(57, 'Germany', 'DE', 'EUR', 'Berlin', 'Europe', 'EU', 'Active'),
(58, 'Djibouti', 'DJ', 'DJF', 'Djibouti', 'Africa', 'AF', 'Active'),
(59, 'Denmark', 'DK', 'DKK', 'Copenhagen', 'Europe', 'EU', 'Active'),
(60, 'Dominica', 'DM', 'XCD', 'Roseau', 'North America', 'NA', 'Active'),
(61, 'Dominican Republic', 'DO', 'DOP', 'Santo Domingo', 'North America', 'NA', 'Active'),
(62, 'Algeria', 'DZ', 'DZD', 'Algiers', 'Africa', 'AF', 'Active'),
(63, 'Ecuador', 'EC', 'USD', 'Quito', 'South America', 'SA', 'Active'),
(64, 'Estonia', 'EE', 'EUR', 'Tallinn', 'Europe', 'EU', 'Active'),
(65, 'Egypt', 'EG', 'EGP', 'Cairo', 'Africa', 'AF', 'Active'),
(66, 'Western Sahara', 'EH', 'MAD', 'El Aaiún', 'Africa', 'AF', 'Active'),
(67, 'Eritrea', 'ER', 'ERN', 'Asmara', 'Africa', 'AF', 'Active'),
(68, 'Spain', 'ES', 'EUR', 'Madrid', 'Europe', 'EU', 'Active'),
(69, 'Ethiopia', 'ET', 'ETB', 'Addis Ababa', 'Africa', 'AF', 'Active'),
(70, 'Finland', 'FI', 'EUR', 'Helsinki', 'Europe', 'EU', 'Active'),
(71, 'Fiji', 'FJ', 'FJD', 'Suva', 'Oceania', 'OC', 'Active'),
(72, 'Falkland Islands', 'FK', 'FKP', 'Stanley', 'South America', 'SA', 'Active'),
(73, 'Micronesia', 'FM', 'USD', 'Palikir', 'Oceania', 'OC', 'Active'),
(74, 'Faroe Islands', 'FO', 'DKK', 'Tórshavn', 'Europe', 'EU', 'Active'),
(75, 'France', 'FR', 'EUR', 'Paris', 'Europe', 'EU', 'Active'),
(76, 'Gabon', 'GA', 'XAF', 'Libreville', 'Africa', 'AF', 'Active'),
(77, 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBP', 'London', 'Europe', 'EU', 'Active'),
(78, 'Grenada', 'GD', 'XCD', 'St. George\'s', 'North America', 'NA', 'Active'),
(79, 'Georgia', 'GE', 'GEL', 'Tbilisi', 'Asia', 'AS', 'Active'),
(80, 'French Guiana', 'GF', 'EUR', 'Cayenne', 'South America', 'SA', 'Active'),
(81, 'Guernsey', 'GG', 'GBP', 'St Peter Port', 'Europe', 'EU', 'Active'),
(82, 'Ghana', 'GH', 'GHS', 'Accra', 'Africa', 'AF', 'Active'),
(83, 'Gibraltar', 'GI', 'GIP', 'Gibraltar', 'Europe', 'EU', 'Active'),
(84, 'Greenland', 'GL', 'DKK', 'Nuuk', 'North America', 'NA', 'Active'),
(85, 'Gambia', 'GM', 'GMD', 'Banjul', 'Africa', 'AF', 'Active'),
(86, 'Guinea', 'GN', 'GNF', 'Conakry', 'Africa', 'AF', 'Active'),
(87, 'Guadeloupe', 'GP', 'EUR', 'Basse-Terre', 'North America', 'NA', 'Active'),
(88, 'Equatorial Guinea', 'GQ', 'XAF', 'Malabo', 'Africa', 'AF', 'Active'),
(89, 'Greece', 'GR', 'EUR', 'Athens', 'Europe', 'EU', 'Active'),
(90, 'South Georgia and the South Sandwich Islands', 'GS', 'GBP', 'Grytviken', 'Antarctica', 'AN', 'Active'),
(91, 'Guatemala', 'GT', 'GTQ', 'Guatemala City', 'North America', 'NA', 'Active'),
(92, 'Guam', 'GU', 'USD', 'Hagåtña', 'Oceania', 'OC', 'Active'),
(93, 'Guinea-Bissau', 'GW', 'XOF', 'Bissau', 'Africa', 'AF', 'Active'),
(94, 'Guyana', 'GY', 'GYD', 'Georgetown', 'South America', 'SA', 'Active'),
(95, 'Hong Kong', 'HK', 'HKD', 'Hong Kong', 'Asia', 'AS', 'Active'),
(96, 'Heard Island and McDonald Islands', 'HM', 'AUD', '', 'Antarctica', 'AN', 'Active'),
(97, 'Honduras', 'HN', 'HNL', 'Tegucigalpa', 'North America', 'NA', 'Active'),
(98, 'Croatia', 'HR', 'HRK', 'Zagreb', 'Europe', 'EU', 'Active'),
(99, 'Haiti', 'HT', 'HTG', 'Port-au-Prince', 'North America', 'NA', 'Active'),
(100, 'Hungary', 'HU', 'HUF', 'Budapest', 'Europe', 'EU', 'Active'),
(101, 'Indonesia', 'ID', 'IDR', 'Jakarta', 'Asia', 'AS', 'Active'),
(102, 'Ireland', 'IE', 'EUR', 'Dublin', 'Europe', 'EU', 'Active'),
(103, 'Israel', 'IL', 'ILS', '', 'Asia', 'AS', 'Active'),
(104, 'Isle of Man', 'IM', 'GBP', 'Douglas', 'Europe', 'EU', 'Active'),
(105, 'India', 'IN', 'INR', 'New Delhi', 'Asia', 'AS', 'Active'),
(106, 'British Indian Ocean Territory', 'IO', 'USD', '', 'Asia', 'AS', 'Active'),
(107, 'Iraq', 'IQ', 'IQD', 'Baghdad', 'Asia', 'AS', 'Active'),
(108, 'Iran', 'IR', 'IRR', 'Tehran', 'Asia', 'AS', 'Active'),
(109, 'Iceland', 'IS', 'ISK', 'Reykjavik', 'Europe', 'EU', 'Active'),
(110, 'Italy', 'IT', 'EUR', 'Rome', 'Europe', 'EU', 'Active'),
(111, 'Jersey', 'JE', 'GBP', 'Saint Helier', 'Europe', 'EU', 'Active'),
(112, 'Jamaica', 'JM', 'JMD', 'Kingston', 'North America', 'NA', 'Active'),
(113, 'Jordan', 'JO', 'JOD', 'Amman', 'Asia', 'AS', 'Active'),
(114, 'Japan', 'JP', 'JPY', 'Tokyo', 'Asia', 'AS', 'Active'),
(115, 'Kenya', 'KE', 'KES', 'Nairobi', 'Africa', 'AF', 'Active'),
(116, 'Kyrgyzstan', 'KG', 'KGS', 'Bishkek', 'Asia', 'AS', 'Active'),
(117, 'Cambodia', 'KH', 'KHR', 'Phnom Penh', 'Asia', 'AS', 'Active'),
(118, 'Kiribati', 'KI', 'AUD', 'Tarawa', 'Oceania', 'OC', 'Active'),
(119, 'Comoros', 'KM', 'KMF', 'Moroni', 'Africa', 'AF', 'Active'),
(120, 'Saint Kitts and Nevis', 'KN', 'XCD', 'Basseterre', 'North America', 'NA', 'Active'),
(121, 'North Korea', 'KP', 'KPW', 'Pyongyang', 'Asia', 'AS', 'Active'),
(122, 'South Korea', 'KR', 'KRW', 'Seoul', 'Asia', 'AS', 'Active'),
(123, 'Kuwait', 'KW', 'KWD', 'Kuwait City', 'Asia', 'AS', 'Active'),
(124, 'Cayman Islands', 'KY', 'KYD', 'George Town', 'North America', 'NA', 'Active'),
(125, 'Kazakhstan', 'KZ', 'KZT', 'Astana', 'Asia', 'AS', 'Active'),
(126, 'Laos', 'LA', 'LAK', 'Vientiane', 'Asia', 'AS', 'Active'),
(127, 'Lebanon', 'LB', 'LBP', 'Beirut', 'Asia', 'AS', 'Active'),
(128, 'Saint Lucia', 'LC', 'XCD', 'Castries', 'North America', 'NA', 'Active'),
(129, 'Liechtenstein', 'LI', 'CHF', 'Vaduz', 'Europe', 'EU', 'Active'),
(130, 'Sri Lanka', 'LK', 'LKR', 'Colombo', 'Asia', 'AS', 'Active'),
(131, 'Liberia', 'LR', 'LRD', 'Monrovia', 'Africa', 'AF', 'Active'),
(132, 'Lesotho', 'LS', 'LSL', 'Maseru', 'Africa', 'AF', 'Active'),
(133, 'Lithuania', 'LT', 'EUR', 'Vilnius', 'Europe', 'EU', 'Active'),
(134, 'Luxembourg', 'LU', 'EUR', 'Luxembourg', 'Europe', 'EU', 'Active'),
(135, 'Latvia', 'LV', 'EUR', 'Riga', 'Europe', 'EU', 'Active'),
(136, 'Libya', 'LY', 'LYD', 'Tripoli', 'Africa', 'AF', 'Active'),
(137, 'Morocco', 'MA', 'MAD', 'Rabat', 'Africa', 'AF', 'Active'),
(138, 'Monaco', 'MC', 'EUR', 'Monaco', 'Europe', 'EU', 'Active'),
(139, 'Moldova', 'MD', 'MDL', 'Chişinău', 'Europe', 'EU', 'Active'),
(140, 'Montenegro', 'ME', 'EUR', 'Podgorica', 'Europe', 'EU', 'Active'),
(141, 'Saint Martin', 'MF', 'EUR', 'Marigot', 'North America', 'NA', 'Active'),
(142, 'Madagascar', 'MG', 'MGA', 'Antananarivo', 'Africa', 'AF', 'Active'),
(143, 'Marshall Islands', 'MH', 'USD', 'Majuro', 'Oceania', 'OC', 'Active'),
(144, 'North Macedonia', 'MK', 'MKD', 'Skopje', 'Europe', 'EU', 'Active'),
(145, 'Mali', 'ML', 'XOF', 'Bamako', 'Africa', 'AF', 'Active'),
(146, 'Myanmar [Burma]', 'MM', 'MMK', 'Nay Pyi Taw', 'Asia', 'AS', 'Active'),
(147, 'Mongolia', 'MN', 'MNT', 'Ulan Bator', 'Asia', 'AS', 'Active'),
(148, 'Macao', 'MO', 'MOP', 'Macao', 'Asia', 'AS', 'Active'),
(149, 'Northern Mariana Islands', 'MP', 'USD', 'Saipan', 'Oceania', 'OC', 'Active'),
(150, 'Martinique', 'MQ', 'EUR', 'Fort-de-France', 'North America', 'NA', 'Active'),
(151, 'Mauritania', 'MR', 'MRO', 'Nouakchott', 'Africa', 'AF', 'Active'),
(152, 'Montserrat', 'MS', 'XCD', 'Plymouth', 'North America', 'NA', 'Active'),
(153, 'Malta', 'MT', 'EUR', 'Valletta', 'Europe', 'EU', 'Active'),
(154, 'Mauritius', 'MU', 'MUR', 'Port Louis', 'Africa', 'AF', 'Active'),
(155, 'Maldives', 'MV', 'MVR', 'Malé', 'Asia', 'AS', 'Active'),
(156, 'Malawi', 'MW', 'MWK', 'Lilongwe', 'Africa', 'AF', 'Active'),
(157, 'Mexico', 'MX', 'MXN', 'Mexico City', 'North America', 'NA', 'Active'),
(158, 'Malaysia', 'MY', 'MYR', 'Kuala Lumpur', 'Asia', 'AS', 'Active'),
(159, 'Mozambique', 'MZ', 'MZN', 'Maputo', 'Africa', 'AF', 'Active'),
(160, 'Namibia', 'NA', 'NAD', 'Windhoek', 'Africa', 'AF', 'Active'),
(161, 'New Caledonia', 'NC', 'XPF', 'Noumea', 'Oceania', 'OC', 'Active'),
(162, 'Niger', 'NE', 'XOF', 'Niamey', 'Africa', 'AF', 'Active'),
(163, 'Norfolk Island', 'NF', 'AUD', 'Kingston', 'Oceania', 'OC', 'Active'),
(164, 'Nigeria', 'NG', 'NGN', 'Abuja', 'Africa', 'AF', 'Active'),
(165, 'Nicaragua', 'NI', 'NIO', 'Managua', 'North America', 'NA', 'Active'),
(166, 'Netherlands', 'NL', 'EUR', 'Amsterdam', 'Europe', 'EU', 'Active'),
(167, 'Norway', 'NO', 'NOK', 'Oslo', 'Europe', 'EU', 'Active'),
(168, 'Nepal', 'NP', 'NPR', 'Kathmandu', 'Asia', 'AS', 'Active'),
(169, 'Nauru', 'NR', 'AUD', '', 'Oceania', 'OC', 'Active'),
(170, 'Niue', 'NU', 'NZD', 'Alofi', 'Oceania', 'OC', 'Active'),
(171, 'New Zealand', 'NZ', 'NZD', 'Wellington', 'Oceania', 'OC', 'Active'),
(172, 'Oman', 'OM', 'OMR', 'Muscat', 'Asia', 'AS', 'Active'),
(173, 'Panama', 'PA', 'PAB', 'Panama City', 'North America', 'NA', 'Active'),
(174, 'Peru', 'PE', 'PEN', 'Lima', 'South America', 'SA', 'Active'),
(175, 'French Polynesia', 'PF', 'XPF', 'Papeete', 'Oceania', 'OC', 'Active'),
(176, 'Papua New Guinea', 'PG', 'PGK', 'Port Moresby', 'Oceania', 'OC', 'Active'),
(177, 'Philippines', 'PH', 'PHP', 'Manila', 'Asia', 'AS', 'Active'),
(178, 'Pakistan', 'PK', 'PKR', 'Islamabad', 'Asia', 'AS', 'Active'),
(179, 'Poland', 'PL', 'PLN', 'Warsaw', 'Europe', 'EU', 'Active'),
(180, 'Saint Pierre and Miquelon', 'PM', 'EUR', 'Saint-Pierre', 'North America', 'NA', 'Active'),
(181, 'Pitcairn Islands', 'PN', 'NZD', 'Adamstown', 'Oceania', 'OC', 'Active'),
(182, 'Puerto Rico', 'PR', 'USD', 'San Juan', 'North America', 'NA', 'Active'),
(183, 'Palestine', 'PS', 'ILS', '', 'Asia', 'AS', 'Active'),
(184, 'Portugal', 'PT', 'EUR', 'Lisbon', 'Europe', 'EU', 'Active'),
(185, 'Palau', 'PW', 'USD', 'Melekeok - Palau State Capital', 'Oceania', 'OC', 'Active'),
(186, 'Paraguay', 'PY', 'PYG', 'Asunción', 'South America', 'SA', 'Active'),
(187, 'Qatar', 'QA', 'QAR', 'Doha', 'Asia', 'AS', 'Active'),
(188, 'Réunion', 'RE', 'EUR', 'Saint-Denis', 'Africa', 'AF', 'Active'),
(189, 'Romania', 'RO', 'RON', 'Bucharest', 'Europe', 'EU', 'Active'),
(190, 'Serbia', 'RS', 'RSD', 'Belgrade', 'Europe', 'EU', 'Active'),
(191, 'Russia', 'RU', 'RUB', 'Moscow', 'Europe', 'EU', 'Active'),
(192, 'Rwanda', 'RW', 'RWF', 'Kigali', 'Africa', 'AF', 'Active'),
(193, 'Saudi Arabia', 'SA', 'SAR', 'Riyadh', 'Asia', 'AS', 'Active'),
(194, 'Solomon Islands', 'SB', 'SBD', 'Honiara', 'Oceania', 'OC', 'Active'),
(195, 'Seychelles', 'SC', 'SCR', 'Victoria', 'Africa', 'AF', 'Active'),
(196, 'Sudan', 'SD', 'SDG', 'Khartoum', 'Africa', 'AF', 'Active'),
(197, 'Sweden', 'SE', 'SEK', 'Stockholm', 'Europe', 'EU', 'Active'),
(198, 'Singapore', 'SG', 'SGD', 'Singapore', 'Asia', 'AS', 'Active'),
(199, 'Saint Helena', 'SH', 'SHP', 'Jamestown', 'Africa', 'AF', 'Active'),
(200, 'Slovenia', 'SI', 'EUR', 'Ljubljana', 'Europe', 'EU', 'Active'),
(201, 'Svalbard and Jan Mayen', 'SJ', 'NOK', 'Longyearbyen', 'Europe', 'EU', 'Active'),
(202, 'Slovakia', 'SK', 'EUR', 'Bratislava', 'Europe', 'EU', 'Active'),
(203, 'Sierra Leone', 'SL', 'SLL', 'Freetown', 'Africa', 'AF', 'Active'),
(204, 'San Marino', 'SM', 'EUR', 'San Marino', 'Europe', 'EU', 'Active'),
(205, 'Senegal', 'SN', 'XOF', 'Dakar', 'Africa', 'AF', 'Active'),
(206, 'Somalia', 'SO', 'SOS', 'Mogadishu', 'Africa', 'AF', 'Active'),
(207, 'Suriname', 'SR', 'SRD', 'Paramaribo', 'South America', 'SA', 'Active'),
(208, 'South Sudan', 'SS', 'SSP', 'Juba', 'Africa', 'AF', 'Active'),
(209, 'São Tomé and Príncipe', 'ST', 'STD', 'São Tomé', 'Africa', 'AF', 'Active'),
(210, 'El Salvador', 'SV', 'USD', 'San Salvador', 'North America', 'NA', 'Active'),
(211, 'Sint Maarten', 'SX', 'ANG', 'Philipsburg', 'North America', 'NA', 'Active'),
(212, 'Syria', 'SY', 'SYP', 'Damascus', 'Asia', 'AS', 'Active'),
(213, 'Swaziland', 'SZ', 'SZL', 'Mbabane', 'Africa', 'AF', 'Active'),
(214, 'Turks and Caicos Islands', 'TC', 'USD', 'Cockburn Town', 'North America', 'NA', 'Active'),
(215, 'Chad', 'TD', 'XAF', 'N\'Djamena', 'Africa', 'AF', 'Active'),
(216, 'French Southern Territories', 'TF', 'EUR', 'Port-aux-Français', 'Antarctica', 'AN', 'Active'),
(217, 'Togo', 'TG', 'XOF', 'Lomé', 'Africa', 'AF', 'Active'),
(218, 'Thailand', 'TH', 'THB', 'Bangkok', 'Asia', 'AS', 'Active'),
(219, 'Tajikistan', 'TJ', 'TJS', 'Dushanbe', 'Asia', 'AS', 'Active'),
(220, 'Tokelau', 'TK', 'NZD', '', 'Oceania', 'OC', 'Active'),
(221, 'East Timor', 'TL', 'USD', 'Dili', 'Oceania', 'OC', 'Active'),
(222, 'Turkmenistan', 'TM', 'TMT', 'Ashgabat', 'Asia', 'AS', 'Active'),
(223, 'Tunisia', 'TN', 'TND', 'Tunis', 'Africa', 'AF', 'Active'),
(224, 'Tonga', 'TO', 'TOP', 'Nuku\'alofa', 'Oceania', 'OC', 'Active'),
(225, 'Turkey', 'TR', 'TRY', 'Ankara', 'Asia', 'AS', 'Active'),
(226, 'Trinidad and Tobago', 'TT', 'TTD', 'Port of Spain', 'North America', 'NA', 'Active'),
(227, 'Tuvalu', 'TV', 'AUD', 'Funafuti', 'Oceania', 'OC', 'Active'),
(228, 'Taiwan', 'TW', 'TWD', 'Taipei', 'Asia', 'AS', 'Active'),
(229, 'Tanzania', 'TZ', 'TZS', 'Dodoma', 'Africa', 'AF', 'Active'),
(230, 'Ukraine', 'UA', 'UAH', 'Kyiv', 'Europe', 'EU', 'Active'),
(231, 'Uganda', 'UG', 'UGX', 'Kampala', 'Africa', 'AF', 'Active'),
(232, 'U.S. Minor Outlying Islands', 'UM', 'USD', '', 'Oceania', 'OC', 'Active'),
(233, 'United States', 'US', 'USD', 'Washington', 'North America', 'NA', 'Active'),
(234, 'Uruguay', 'UY', 'UYU', 'Montevideo', 'South America', 'SA', 'Active'),
(235, 'Uzbekistan', 'UZ', 'UZS', 'Tashkent', 'Asia', 'AS', 'Active'),
(236, 'Vatican City', 'VA', 'EUR', 'Vatican', 'Europe', 'EU', 'Active'),
(237, 'Saint Vincent and the Grenadines', 'VC', 'XCD', 'Kingstown', 'North America', 'NA', 'Active'),
(238, 'Venezuela', 'VE', 'VEF', 'Caracas', 'South America', 'SA', 'Active'),
(239, 'British Virgin Islands', 'VG', 'USD', 'Road Town', 'North America', 'NA', 'Active'),
(240, 'U.S. Virgin Islands', 'VI', 'USD', 'Charlotte Amalie', 'North America', 'NA', 'Active'),
(241, 'Vietnam', 'VN', 'VND', 'Hanoi', 'Asia', 'AS', 'Active'),
(242, 'Vanuatu', 'VU', 'VUV', 'Port Vila', 'Oceania', 'OC', 'Active'),
(243, 'Wallis and Futuna', 'WF', 'XPF', 'Mata-Utu', 'Oceania', 'OC', 'Active'),
(244, 'Samoa', 'WS', 'WST', 'Apia', 'Oceania', 'OC', 'Active'),
(245, 'Kosovo', 'XK', 'EUR', 'Pristina', 'Europe', 'EU', 'Active'),
(246, 'Yemen', 'YE', 'YER', 'Sanaa', 'Asia', 'AS', 'Active'),
(247, 'Mayotte', 'YT', 'EUR', 'Mamoutzou', 'Africa', 'AF', 'Active'),
(248, 'South Africa', 'ZA', 'ZAR', 'Pretoria', 'Africa', 'AF', 'Active'),
(249, 'Zambia', 'ZM', 'ZMW', 'Lusaka', 'Africa', 'AF', 'Active'),
(250, 'Zimbabwe', 'ZW', 'ZWL', 'Harare', 'Africa', 'AF', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `daily_wages`
--

DROP TABLE IF EXISTS `daily_wages`;
CREATE TABLE IF NOT EXISTS `daily_wages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `wages` int(11) NOT NULL,
  `paying_status` enum('Paid','Unpaid') NOT NULL DEFAULT 'Unpaid',
  `work_date` date NOT NULL,
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_logs`
--

DROP TABLE IF EXISTS `event_logs`;
CREATE TABLE IF NOT EXISTS `event_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `end_point` varchar(100) NOT NULL,
  `changes` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3534 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
CREATE TABLE IF NOT EXISTS `file_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_types`
--

INSERT INTO `file_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'jpg', 'Active', '2019-06-22 08:43:39', '2019-06-22 08:43:39'),
(2, 'jpeg', 'Active', '2019-06-22 08:43:54', '2019-06-22 08:43:54'),
(3, 'png', 'Active', '2019-06-22 08:44:05', '2019-06-22 08:44:05'),
(4, 'gif', 'Active', '2019-06-22 08:44:14', '2019-06-22 08:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `inventory_image` varchar(255) DEFAULT NULL,
  `inventory_type_id` int(11) NOT NULL,
  `inventory_unit_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `warranty` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `instruction` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `name`, `inventory_image`, `inventory_type_id`, `inventory_unit_id`, `source`, `warranty`, `description`, `instruction`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 'Chair', 'uploads/j5TNeCSgs5HVr5JCaUJkOM5A1brCXFmDJxL5Qmrc.jpeg', 6, 7, 'hailt', '1 Year', 'Furniture from Hatil', 'what??', 1, '2020-01-15 15:26:48', '2020-01-15 15:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stocks`
--

DROP TABLE IF EXISTS `inventory_stocks`;
CREATE TABLE IF NOT EXISTS `inventory_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_stocks`
--

INSERT INTO `inventory_stocks` (`id`, `inventory_id`, `quantity`, `cost`, `created_by`, `created_at`, `updated_at`) VALUES
(18, 7, 5, 5000, 1, '2020-01-15 15:30:31', '2020-01-15 15:30:31'),
(19, 7, -2, 0, 1, '2020-01-15 15:31:31', '2020-01-15 15:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_types`
--

DROP TABLE IF EXISTS `inventory_types`;
CREATE TABLE IF NOT EXISTS `inventory_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_types`
--

INSERT INTO `inventory_types` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(6, 'other', 'Active', '2019-12-18 10:56:31', '2019-12-18 10:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_units`
--

DROP TABLE IF EXISTS `inventory_units`;
CREATE TABLE IF NOT EXISTS `inventory_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_units`
--

INSERT INTO `inventory_units` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Other', 'Active', '2019-12-18 11:09:09', '2019-12-18 11:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
CREATE TABLE IF NOT EXISTS `ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Income','Expense') DEFAULT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `details` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1896 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `type`, `date`, `amount`, `tag_id`, `details`, `created_by`, `created_at`, `updated_at`) VALUES
(1861, 'Expense', '2019-11-02', 10678, 2, 'Milk Sale', 1, '2020-03-20 01:26:03', '2020-03-20 01:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `full_page` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
CREATE TABLE IF NOT EXISTS `medicines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `identify_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `next_follow_up_date` date NOT NULL,
  `special_dose` text NOT NULL,
  `regular_dose` text NOT NULL,
  `comments` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_15_062636_entrust_setup_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `milks`
--

DROP TABLE IF EXISTS `milks`;
CREATE TABLE IF NOT EXISTS `milks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cattle_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `morning_amount` int(11) NOT NULL,
  `noon_amount` int(11) NOT NULL,
  `after_noon_amount` int(11) NOT NULL,
  `comments` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `milks`
--

INSERT INTO `milks` (`id`, `cattle_id`, `date`, `morning_amount`, `noon_amount`, `after_noon_amount`, `comments`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 41, '2020-03-13', 10, 8, 5, NULL, 1, '2020-03-13 13:13:31', '2021-07-26 07:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `fa_icon` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `sorting` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `fa_icon`, `status`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Cattle', 'cattle', 'fa-paw', 'Active', 1, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(2, 'Cattle Types', 'cattle-types', 'fa-th', 'Active', 2, '2020-03-22 09:49:11', '2020-03-22 10:12:19'),
(3, 'Medicines', 'medicines', 'fa-medkit', 'Active', 3, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(4, 'Breeds', 'breeds', 'fa-crosshairs', 'Active', 4, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(5, 'Milks', 'milks', 'fa-flask', 'Active', 5, '2020-03-22 09:57:13', '2020-03-22 12:42:47'),
(6, 'Ledgers', 'ledgers', 'fa-columns', 'Active', 6, '2020-03-22 09:58:05', '2020-03-22 12:40:34'),
(7, 'Tags', 'tags', 'fa-tag', 'Active', 7, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(8, 'Leaves', 'leaves', 'fa-calendar-plus-o', 'Active', 8, '2020-03-22 09:59:37', '2020-03-22 12:54:27'),
(9, 'Salaries', 'salaries', 'fa-money', 'Active', 9, '2020-03-22 10:00:03', '2020-03-22 13:05:52'),
(10, 'Daily Wages', 'daily-wages', 'fa-gg', 'Active', 10, '2020-03-22 10:00:55', '2020-03-22 13:17:12'),
(11, 'Inventories', 'inventories', 'fa-cube', 'Active', 11, '2020-03-22 10:05:52', '2020-03-22 13:27:21'),
(12, 'Inventory Stocks', 'inventory-stocks', 'fa-cubes', 'Active', 12, '2020-03-22 10:07:44', '2020-03-22 13:49:47'),
(13, 'Inventory Types', 'inventory-types', 'fa-th-large', 'Active', 13, '2020-03-22 10:09:15', '2020-03-22 13:44:13'),
(14, 'inventory Units', 'inventory-units', 'fa-sitemap', 'Active', 14, '2020-03-22 10:09:44', '2020-03-22 13:47:09'),
(15, 'Modules', 'modules', 'fa-suitcase', 'Active', 15, '2020-03-22 10:10:30', '2020-03-22 14:58:16'),
(16, 'Roles', 'roles', 'fa-users', 'Active', 16, '2020-03-22 10:10:45', '2020-03-22 13:55:24'),
(17, 'Permissions', 'permissions', 'fa-key', 'Active', 17, '2020-03-22 10:11:03', '2020-03-22 14:07:19'),
(18, 'Users', 'users', 'fa-user', 'Active', 18, '2020-03-22 10:11:25', '2020-03-22 14:10:28'),
(19, 'Event Logs', 'event-logs', 'fa-file-archive-o', 'Active', 20, '2020-03-22 10:11:45', '2020-03-22 14:19:29'),
(20, 'Countries', 'countries', 'fa-globe', 'Active', 21, '2020-03-22 10:13:51', '2020-03-22 10:14:18'),
(21, 'Settings', 'settings', 'fa-cogs', 'Active', 22, '2020-03-22 10:15:01', '2020-03-22 10:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'cattle.index', 'Listing page of all cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(2, 1, 'cattle.create', 'Display the form for creating new cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(3, 1, 'cattle.edit', 'Display the form for editing a cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(4, 1, 'cattle.show', 'Show detail information for a cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(5, 1, 'cattle.store', 'Store action for creating a new cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(6, 1, 'cattle.update', 'Update action for updating a cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(7, 1, 'cattle.destroy', 'Delete action for removing a cattle', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(8, 1, 'cattle.exportXLSX', 'Export all cattle in excel', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(9, 1, 'cattle.printDetails', 'Export cattle details in pdf', NULL, '2020-03-22 09:46:47', '2020-03-22 09:46:47'),
(10, 2, 'cattle_types.index', 'Listing page of all cattletypes', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(11, 2, 'cattle_types.create', 'Display the form for creating new cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(12, 2, 'cattle_types.edit', 'Display the form for editing a cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(13, 2, 'cattle_types.show', 'Show detail information for a cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(14, 2, 'cattle_types.store', 'Store action for creating a new cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(15, 2, 'cattle_types.update', 'Update action for updating a cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(16, 2, 'cattle_types.destroy', 'Delete action for removing a cattletype', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(17, 2, 'cattle_types.exportXLSX', 'Export all cattletypes in excel', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(18, 2, 'cattle_types.printDetails', 'Export cattletype details in pdf', NULL, '2020-03-22 09:49:11', '2020-03-22 09:49:11'),
(19, 3, 'medicines.index', 'Listing page of all medicines', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(20, 3, 'medicines.create', 'Display the form for creating new medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(21, 3, 'medicines.edit', 'Display the form for editing a medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(22, 3, 'medicines.show', 'Show detail information for a medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(23, 3, 'medicines.store', 'Store action for creating a new medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(24, 3, 'medicines.update', 'Update action for updating a medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(25, 3, 'medicines.destroy', 'Delete action for removing a medicine', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(26, 3, 'medicines.exportXLSX', 'Export all medicines in excel', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(27, 3, 'medicines.printDetails', 'Export medicine details in pdf', NULL, '2020-03-22 09:55:45', '2020-03-22 09:55:45'),
(28, 4, 'breeds.index', 'Listing page of all breeds', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(29, 4, 'breeds.create', 'Display the form for creating new breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(30, 4, 'breeds.edit', 'Display the form for editing a breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(31, 4, 'breeds.show', 'Show detail information for a breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(32, 4, 'breeds.store', 'Store action for creating a new breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(33, 4, 'breeds.update', 'Update action for updating a breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(34, 4, 'breeds.destroy', 'Delete action for removing a breed', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(35, 4, 'breeds.exportXLSX', 'Export all breeds in excel', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(36, 4, 'breeds.printDetails', 'Export breed details in pdf', NULL, '2020-03-22 09:56:36', '2020-03-22 09:56:36'),
(37, 5, 'milks.index', 'Listing page of all milks', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(38, 5, 'milks.create', 'Display the form for creating new milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(39, 5, 'milks.edit', 'Display the form for editing a milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(40, 5, 'milks.show', 'Show detail information for a milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(41, 5, 'milks.store', 'Store action for creating a new milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(42, 5, 'milks.update', 'Update action for updating a milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(43, 5, 'milks.destroy', 'Delete action for removing a milk', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(44, 5, 'milks.exportXLSX', 'Export all milks in excel', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(45, 5, 'milks.printDetails', 'Export milk details in pdf', NULL, '2020-03-22 09:57:13', '2020-03-22 09:57:13'),
(46, 6, 'ledgers.index', 'Listing page of all ledgers', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(47, 6, 'ledgers.create', 'Display the form for creating new ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(48, 6, 'ledgers.edit', 'Display the form for editing a ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(49, 6, 'ledgers.show', 'Show detail information for a ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(50, 6, 'ledgers.store', 'Store action for creating a new ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(51, 6, 'ledgers.update', 'Update action for updating a ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(52, 6, 'ledgers.destroy', 'Delete action for removing a ledger', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(53, 6, 'ledgers.exportXLSX', 'Export all ledgers in excel', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(54, 6, 'ledgers.printDetails', 'Export ledger details in pdf', NULL, '2020-03-22 09:58:05', '2020-03-22 09:58:05'),
(55, 7, 'tags.index', 'Listing page of all tags', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(56, 7, 'tags.create', 'Display the form for creating new tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(57, 7, 'tags.edit', 'Display the form for editing a tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(58, 7, 'tags.show', 'Show detail information for a tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(59, 7, 'tags.store', 'Store action for creating a new tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(60, 7, 'tags.update', 'Update action for updating a tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(61, 7, 'tags.destroy', 'Delete action for removing a tag', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(62, 7, 'tags.exportXLSX', 'Export all tags in excel', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(63, 7, 'tags.printDetails', 'Export tag details in pdf', NULL, '2020-03-22 09:58:44', '2020-03-22 09:58:44'),
(64, 8, 'leaves.index', 'Listing page of all leaves', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(65, 8, 'leaves.create', 'Display the form for creating new leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(66, 8, 'leaves.edit', 'Display the form for editing a leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(67, 8, 'leaves.show', 'Show detail information for a leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(68, 8, 'leaves.store', 'Store action for creating a new leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(69, 8, 'leaves.update', 'Update action for updating a leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(70, 8, 'leaves.destroy', 'Delete action for removing a leaf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(71, 8, 'leaves.exportXLSX', 'Export all leaves in excel', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(72, 8, 'leaves.printDetails', 'Export leaf details in pdf', NULL, '2020-03-22 09:59:37', '2020-03-22 09:59:37'),
(73, 9, 'salaries.index', 'Listing page of all salaries', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(74, 9, 'salaries.create', 'Display the form for creating new salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(75, 9, 'salaries.edit', 'Display the form for editing a salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(76, 9, 'salaries.show', 'Show detail information for a salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(77, 9, 'salaries.store', 'Store action for creating a new salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(78, 9, 'salaries.update', 'Update action for updating a salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(79, 9, 'salaries.destroy', 'Delete action for removing a salary', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(80, 9, 'salaries.exportXLSX', 'Export all salaries in excel', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(81, 9, 'salaries.printDetails', 'Export salary details in pdf', NULL, '2020-03-22 10:00:03', '2020-03-22 10:00:03'),
(82, 10, 'daily_wages.index', 'Listing page of all daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(83, 10, 'daily_wages.create', 'Display the form for creating new daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(84, 10, 'daily_wages.edit', 'Display the form for editing a daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(85, 10, 'daily_wages.show', 'Show detail information for a daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(86, 10, 'daily_wages.store', 'Store action for creating a new daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(87, 10, 'daily_wages.update', 'Update action for updating a daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(88, 10, 'daily_wages.destroy', 'Delete action for removing a daily wage', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(89, 10, 'daily_wages.exportXLSX', 'Export all daily wages in excel', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(90, 10, 'daily_wages.printDetails', 'Export daily wages details in pdf', NULL, '2020-03-22 10:00:55', '2020-03-22 10:00:55'),
(91, 11, 'inventories.index', 'Listing page of all inventories', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(92, 11, 'inventories.create', 'Display the form for creating new inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(93, 11, 'inventories.edit', 'Display the form for editing a inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(94, 11, 'inventories.show', 'Show detail information for a inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(95, 11, 'inventories.store', 'Store action for creating a new inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(96, 11, 'inventories.update', 'Update action for updating a inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(97, 11, 'inventories.destroy', 'Delete action for removing a inventory', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(98, 11, 'inventories.exportXLSX', 'Export all inventories in excel', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(99, 11, 'inventories.printDetails', 'Export inventory details in pdf', NULL, '2020-03-22 10:05:52', '2020-03-22 10:05:52'),
(100, 12, 'inventory_stocks.index', 'Listing page of all inventory_stocks', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(101, 12, 'inventory_stocks.create', 'Display the form for creating new inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(102, 12, 'inventory_stocks.edit', 'Display the form for editing a inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(103, 12, 'inventory_stocks.show', 'Show detail information for a inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(104, 12, 'inventory_stocks.store', 'Store action for creating a new inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(105, 12, 'inventory_stocks.update', 'Update action for updating a inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(106, 12, 'inventory_stocks.destroy', 'Delete action for removing a inventory_stock', NULL, '2020-03-22 10:07:44', '2020-03-22 10:07:44'),
(107, 12, 'inventory_stocks.exportXLSX', 'Export all inventory_stocks in excel', NULL, '2020-03-22 10:07:45', '2020-03-22 10:07:45'),
(108, 12, 'inventory_stocks.printDetails', 'Export inventory_stock details in pdf', NULL, '2020-03-22 10:07:45', '2020-03-22 10:07:45'),
(109, 13, 'inventory_types.index', 'Listing page of all inventory_types', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(110, 13, 'inventory_types.create', 'Display the form for creating new inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(111, 13, 'inventory_types.edit', 'Display the form for editing a inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(112, 13, 'inventory_types.show', 'Show detail information for a inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(113, 13, 'inventory_types.store', 'Store action for creating a new inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(114, 13, 'inventory_types.update', 'Update action for updating a inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(115, 13, 'inventory_types.destroy', 'Delete action for removing a inventory_type', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(116, 13, 'inventory_types.exportXLSX', 'Export all inventory_types in excel', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(117, 13, 'inventory_types.printDetails', 'Export inventory_type details in pdf', NULL, '2020-03-22 10:09:15', '2020-03-22 10:09:15'),
(118, 14, 'inventory_units.index', 'Listing page of all inventory_units', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(119, 14, 'inventory_units.create', 'Display the form for creating new inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(120, 14, 'inventory_units.edit', 'Display the form for editing a inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(121, 14, 'inventory_units.show', 'Show detail information for a inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(122, 14, 'inventory_units.store', 'Store action for creating a new inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(123, 14, 'inventory_units.update', 'Update action for updating a inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(124, 14, 'inventory_units.destroy', 'Delete action for removing a inventory_unit', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(125, 14, 'inventory_units.exportXLSX', 'Export all inventory_units in excel', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(126, 14, 'inventory_units.printDetails', 'Export inventory_unit details in pdf', NULL, '2020-03-22 10:09:44', '2020-03-22 10:09:44'),
(127, 15, 'modules.index', 'Listing page of all modules', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(128, 15, 'modules.create', 'Display the form for creating new module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(129, 15, 'modules.edit', 'Display the form for editing a module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(130, 15, 'modules.show', 'Show detail information for a module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(131, 15, 'modules.store', 'Store action for creating a new module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(132, 15, 'modules.update', 'Update action for updating a module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(133, 15, 'modules.destroy', 'Delete action for removing a module', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(134, 15, 'modules.exportXLSX', 'Export all modules in excel', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(135, 15, 'modules.printDetails', 'Export module details in pdf', NULL, '2020-03-22 10:10:30', '2020-03-22 10:10:30'),
(136, 16, 'roles.index', 'Listing page of all roles', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(137, 16, 'roles.create', 'Display the form for creating new role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(138, 16, 'roles.edit', 'Display the form for editing a role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(139, 16, 'roles.show', 'Show detail information for a role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(140, 16, 'roles.store', 'Store action for creating a new role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(141, 16, 'roles.update', 'Update action for updating a role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(142, 16, 'roles.destroy', 'Delete action for removing a role', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(143, 16, 'roles.exportXLSX', 'Export all roles in excel', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(144, 16, 'roles.printDetails', 'Export role details in pdf', NULL, '2020-03-22 10:10:45', '2020-03-22 10:10:45'),
(145, 17, 'permissions.index', 'Listing page of all permissions', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(146, 17, 'permissions.create', 'Display the form for creating new permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(147, 17, 'permissions.edit', 'Display the form for editing a permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(148, 17, 'permissions.show', 'Show detail information for a permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(149, 17, 'permissions.store', 'Store action for creating a new permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(150, 17, 'permissions.update', 'Update action for updating a permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(151, 17, 'permissions.destroy', 'Delete action for removing a permission', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(152, 17, 'permissions.exportXLSX', 'Export all permissions in excel', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(153, 17, 'permissions.printDetails', 'Export permission details in pdf', NULL, '2020-03-22 10:11:03', '2020-03-22 10:11:03'),
(154, 18, 'users.index', 'Listing page of all users', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(155, 18, 'users.create', 'Display the form for creating new user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(156, 18, 'users.edit', 'Display the form for editing a user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(157, 18, 'users.show', 'Show detail information for a user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(158, 18, 'users.store', 'Store action for creating a new user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(159, 18, 'users.update', 'Update action for updating a user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(160, 18, 'users.destroy', 'Delete action for removing a user', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(161, 18, 'users.exportXLSX', 'Export all users in excel', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(162, 18, 'users.printDetails', 'Export user details in pdf', NULL, '2020-03-22 10:11:25', '2020-03-22 10:11:25'),
(163, 19, 'event_logs.index', 'Listing page of all event_logs', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(164, 19, 'event_logs.create', 'Display the form for creating new event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(165, 19, 'event_logs.edit', 'Display the form for editing a event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(166, 19, 'event_logs.show', 'Show detail information for a event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(167, 19, 'event_logs.store', 'Store action for creating a new event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(168, 19, 'event_logs.update', 'Update action for updating a event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(169, 19, 'event_logs.destroy', 'Delete action for removing a event_log', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(170, 19, 'event_logs.exportXLSX', 'Export all event_logs in excel', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(171, 19, 'event_logs.printDetails', 'Export event_log details in pdf', NULL, '2020-03-22 10:11:45', '2020-03-22 10:11:45'),
(172, 20, 'countries.index', 'Listing page of all countries', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(173, 20, 'countries.create', 'Display the form for creating new country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(174, 20, 'countries.edit', 'Display the form for editing a country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(175, 20, 'countries.show', 'Show detail information for a country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(176, 20, 'countries.store', 'Store action for creating a new country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(177, 20, 'countries.update', 'Update action for updating a country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(178, 20, 'countries.destroy', 'Delete action for removing a country', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(179, 20, 'countries.exportXLSX', 'Export all countries in excel', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(180, 20, 'countries.printDetails', 'Export country details in pdf', NULL, '2020-03-22 10:13:51', '2020-03-22 10:13:51'),
(181, 21, 'settings.index', 'Listing page of all settings', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(182, 21, 'settings.create', 'Display the form for creating new setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(183, 21, 'settings.edit', 'Display the form for editing a setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(184, 21, 'settings.show', 'Show detail information for a setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(185, 21, 'settings.store', 'Store action for creating a new setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(186, 21, 'settings.update', 'Update action for updating a setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(187, 21, 'settings.destroy', 'Delete action for removing a setting', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(188, 21, 'settings.exportXLSX', 'Export all settings in excel', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(189, 21, 'settings.printDetails', 'Export setting details in pdf', NULL, '2020-03-22 10:15:01', '2020-03-22 10:15:01'),
(190, 1, 'cattle.bodyWeight', 'Listing of all body weights of cattle', NULL, '2020-03-22 11:55:25', '2020-03-22 11:55:25'),
(191, 1, 'cattle.storeBodyWeight', 'Store body weights for a cattle', NULL, '2020-03-22 11:56:36', '2020-03-22 11:56:36'),
(192, 1, 'destroyBodyWeight', 'Delete body weights for a cattle', NULL, '2020-03-22 11:57:09', '2020-03-22 11:57:09'),
(193, 1, 'cattle.costs', 'Listing of all costs for a cattle', NULL, '2020-03-22 11:57:50', '2020-03-22 11:57:50'),
(194, 1, 'cattle.storeCost', 'Store cost for a cattle', NULL, '2020-03-22 11:58:19', '2020-03-22 11:58:19'),
(195, 1, 'cattle.destroyCost', 'Delete cost for a cattle', NULL, '2020-03-22 11:58:48', '2020-03-22 11:58:48'),
(196, 6, 'ledgers.balanceSheet', 'Display balance sheet', NULL, '2020-03-22 12:44:05', '2020-03-22 12:44:05'),
(197, 6, 'ledgers.printBalanceSheet', 'Download balance sheet as pdf', NULL, '2020-03-22 12:46:09', '2020-03-22 12:46:09'),
(198, 12, 'inventory_stocks.consume', 'Consume inventory stock', NULL, '2020-03-22 13:40:28', '2020-03-22 13:40:28'),
(199, 16, 'roles.module-permissions', 'Display list of all permissions for modules', NULL, '2020-03-22 13:58:57', '2020-03-22 13:58:57'),
(200, 16, 'roles.assign_permissions', 'Store assigned permission in database', NULL, '2020-03-22 14:05:51', '2020-03-22 14:05:51'),
(201, 21, 'settings.all', 'Display all configarations', NULL, '2020-03-22 14:29:29', '2020-03-22 14:29:29'),
(202, 21, 'settings.update_batch', 'Store all settings options', NULL, '2020-03-22 14:31:01', '2020-03-22 14:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`,`module_id`),
  KEY `module_id` (`module_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `module_id`) VALUES
(1, 6, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1),
(5, 6, 1),
(6, 6, 1),
(7, 6, 1),
(8, 6, 1),
(9, 6, 1),
(190, 6, 1),
(191, 6, 1),
(192, 6, 1),
(193, 6, 1),
(194, 6, 1),
(195, 6, 1),
(10, 6, 2),
(11, 6, 2),
(12, 6, 2),
(13, 6, 2),
(14, 6, 2),
(15, 6, 2),
(16, 6, 2),
(17, 6, 2),
(18, 6, 2),
(19, 6, 3),
(20, 6, 3),
(21, 6, 3),
(22, 6, 3),
(23, 6, 3),
(24, 6, 3),
(25, 6, 3),
(26, 6, 3),
(27, 6, 3),
(28, 6, 4),
(29, 6, 4),
(30, 6, 4),
(31, 6, 4),
(32, 6, 4),
(33, 6, 4),
(34, 6, 4),
(35, 6, 4),
(36, 6, 4),
(37, 6, 5),
(38, 6, 5),
(39, 6, 5),
(40, 6, 5),
(41, 6, 5),
(42, 6, 5),
(43, 6, 5),
(44, 6, 5),
(45, 6, 5),
(46, 6, 6),
(47, 6, 6),
(48, 6, 6),
(49, 6, 6),
(50, 6, 6),
(51, 6, 6),
(52, 6, 6),
(53, 6, 6),
(54, 6, 6),
(196, 6, 6),
(197, 6, 6),
(55, 6, 7),
(56, 6, 7),
(57, 6, 7),
(58, 6, 7),
(59, 6, 7),
(60, 6, 7),
(61, 6, 7),
(62, 6, 7),
(63, 6, 7),
(64, 6, 8),
(65, 6, 8),
(66, 6, 8),
(67, 6, 8),
(68, 6, 8),
(69, 6, 8),
(70, 6, 8),
(71, 6, 8),
(72, 6, 8),
(73, 6, 9),
(74, 6, 9),
(75, 6, 9),
(76, 6, 9),
(77, 6, 9),
(78, 6, 9),
(79, 6, 9),
(80, 6, 9),
(81, 6, 9),
(82, 6, 10),
(83, 6, 10),
(84, 6, 10),
(85, 6, 10),
(86, 6, 10),
(87, 6, 10),
(88, 6, 10),
(89, 6, 10),
(90, 6, 10),
(91, 6, 11),
(92, 6, 11),
(93, 6, 11),
(94, 6, 11),
(95, 6, 11),
(96, 6, 11),
(97, 6, 11),
(98, 6, 11),
(99, 6, 11),
(100, 6, 12),
(101, 6, 12),
(102, 6, 12),
(103, 6, 12),
(104, 6, 12),
(105, 6, 12),
(106, 6, 12),
(107, 6, 12),
(108, 6, 12),
(198, 6, 12),
(109, 6, 13),
(110, 6, 13),
(111, 6, 13),
(112, 6, 13),
(113, 6, 13),
(114, 6, 13),
(115, 6, 13),
(116, 6, 13),
(117, 6, 13),
(118, 6, 14),
(119, 6, 14),
(120, 6, 14),
(121, 6, 14),
(122, 6, 14),
(123, 6, 14),
(124, 6, 14),
(125, 6, 14),
(126, 6, 14),
(127, 6, 15),
(128, 6, 15),
(129, 6, 15),
(130, 6, 15),
(131, 6, 15),
(132, 6, 15),
(133, 6, 15),
(134, 6, 15),
(135, 6, 15),
(136, 6, 16),
(137, 6, 16),
(138, 6, 16),
(139, 6, 16),
(140, 6, 16),
(141, 6, 16),
(142, 6, 16),
(143, 6, 16),
(144, 6, 16),
(199, 6, 16),
(200, 6, 16),
(145, 6, 17),
(146, 6, 17),
(147, 6, 17),
(148, 6, 17),
(149, 6, 17),
(150, 6, 17),
(151, 6, 17),
(152, 6, 17),
(153, 6, 17),
(154, 6, 18),
(155, 6, 18),
(156, 6, 18),
(157, 6, 18),
(158, 6, 18),
(159, 6, 18),
(160, 6, 18),
(161, 6, 18),
(162, 6, 18),
(163, 6, 19),
(164, 6, 19),
(165, 6, 19),
(166, 6, 19),
(167, 6, 19),
(168, 6, 19),
(169, 6, 19),
(170, 6, 19),
(171, 6, 19),
(172, 6, 20),
(173, 6, 20),
(174, 6, 20),
(175, 6, 20),
(176, 6, 20),
(177, 6, 20),
(178, 6, 20),
(179, 6, 20),
(180, 6, 20),
(181, 6, 21),
(182, 6, 21),
(183, 6, 21),
(184, 6, 21),
(185, 6, 21),
(186, 6, 21),
(187, 6, 21),
(188, 6, 21),
(189, 6, 21),
(201, 6, 21),
(202, 6, 21);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator of whole site', 'Admin is the topmost role for whole site. This role can take any action all over the site', '2019-06-16 08:55:50', '2019-06-16 08:56:58'),
(2, 'Employee', 'Permanent Employee', 'Permanent Employee', '2019-06-16 09:00:45', '2019-12-21 05:40:06'),
(3, 'Day-Labour', 'Temporary Employee', 'Temporary Employee', '2019-12-21 05:41:04', '2019-12-21 05:41:04'),
(4, 'Doctor', 'Doctor', 'Doctor is responsible for cattle treatment', '2020-01-31 02:22:14', '2020-01-31 02:22:14'),
(5, 'AI Worker', 'AI Worker', 'Artificial Insemination Worker', '2020-01-31 02:46:44', '2020-01-31 02:46:44'),
(6, 'Moderator', 'Moderator', 'Sub admin of site admin', '2020-03-22 10:15:52', '2020-03-22 10:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `salary_date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `constant` varchar(255) NOT NULL,
  `value` varchar(100) NOT NULL,
  `field_type` enum('Text','Options','File') NOT NULL DEFAULT 'Text',
  `options` varchar(255) NOT NULL,
  `sorting` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `constant`, `value`, `field_type`, `options`, `sorting`, `status`) VALUES
(1, 'Is Event Logs Enable', 'IS_EVENT_LOGS_ENABLE', '1', 'Options', 'Yes|1,No|0', 5, '1'),
(2, 'Site Name', 'SITE_NAME', 'Cattle Master', 'Text', '', 1, '1'),
(3, 'Footer Text', 'FOOTER_TEXT', 'Copyright © 2019 Bogra Livestock. All rights reserved.', 'Text', '', 6, '1'),
(4, 'Site Email', 'SITE_EMAIL', 'cattle@admin.com', 'Text', '', 3, '1'),
(5, 'Is Admin Privilege Enable', 'IS_ADMIN_PRIVILEGE_ENABLE', '1', 'Options', 'Yes|1,No|0', 4, '1'),
(6, 'Site Logo', 'SITE_LOGO', 'logo-1573649351.png', 'File', '', 8, '1'),
(7, 'Site Short Name', 'SITE_SHORT_NAME', 'CM', 'Text', '', 2, '1'),
(8, 'Version', 'VERSION', 'Version 1.0', 'Text', '', 7, '1'),
(9, 'Site Phone', 'SITE_PHONE', '01734232826', 'Text', '', 3, '1'),
(10, 'Birth Duration (Days)', 'BIRTH_DURATION', '90', 'Text', '', 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(29, 'Tools/ Repair', 'Active', 1, '2020-02-06 14:38:20', '2020-02-06 14:38:20'),
(28, 'Gift/Charity', 'Active', 1, '2020-02-05 16:17:15', '2020-02-05 16:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

DROP TABLE IF EXISTS `uploaded_files`;
CREATE TABLE IF NOT EXISTS `uploaded_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) NOT NULL,
  `file_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uploaded_files`
--

INSERT INTO `uploaded_files` (`id`, `filename`, `original_filename`, `file_type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(20, '1.png', '1.png', 3, 1, '2019-06-23 11:34:50', '2021-07-29 13:02:41'),
(30, '44.jpg', 'images.jpg', 1, 44, '2019-12-21 11:49:17', '2019-12-21 11:49:17'),
(31, '45.jpg', 'person_3.jpg', 1, 45, '2019-12-21 13:59:26', '2019-12-21 13:59:26'),
(33, '47.jpg', '(JPEG Image, 241 × 209 pixels).jpg', 1, 47, '2020-01-31 08:48:52', '2020-01-31 08:48:52'),
(36, '50.png', 'speaker-3.png', 3, 50, '2020-02-01 08:25:38', '2020-02-01 08:25:38'),
(38, '52.jpg', 'amin..jpg', 1, 52, '2020-02-09 11:55:01', '2020-02-09 11:55:01'),
(39, '53.jpg', 'Sahidul.jpg', 1, 53, '2020-02-09 12:28:48', '2020-02-09 12:28:48'),
(42, '56.JPG', 'Aminur Rahman.JPG', 1, 56, '2020-02-09 12:57:06', '2020-02-09 12:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `country_id` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Inactive',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `country_id`, `phone`, `email`, `email_verified_at`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'Male', 19, '01734232826', 'admin@admin.com', NULL, 'Active', '$2y$10$wUqKn3B0qozCo/JeWIOBVud06ZF5ER3HerhqznVY33YGnmieGYu.i', 'Tk5avD5d86pJlQZjmTcpAcwUuSJECY5dqzP6t2itmQn5pal4vaRaawD3YVof', '2019-03-16 08:42:29', '2021-08-01 05:50:39');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `permission_role_ibfk_3` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
