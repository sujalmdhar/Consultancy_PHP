-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 08:46 PM
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
-- Database: `23189654`
--
CREATE DATABASE IF NOT EXISTS `23189654` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `23189654`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `session_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `email`, `username`, `password`, `created_at`, `session_token`) VALUES
(6, 'Admin', 'Insight', 'insightadmin@gmail.com', 'Admin', '$2y$10$L9fF7yeHImFnZ3tjKm6XbeWtu/OaFn4/aKEgQ6faxFufmbjeFRs/y', '2024-06-22 10:03:16', 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `test_id`, `enrollment_date`) VALUES
(1, 1, 1, '2024-06-22');

-- --------------------------------------------------------

--
-- Table structure for table `proficiency_test`
--

CREATE TABLE `proficiency_test` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `difficulty` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proficiency_test`
--

INSERT INTO `proficiency_test` (`test_id`, `test_name`, `description`, `difficulty`, `admin_id`) VALUES
(1, 'IELTS', 'The International English Language Testing System (IELTS) is a globally recognized exam designed to assess the English language proficiency of non-native speakers. It evaluates four key skills: Listening, Reading, Writing, and Speaking. IELTS offers two versions: Academic, mainly for academic purposes such as university admissions, and General Training, often used for immigration and professional registration. The test structure includes listening to recordings and answering questions, reading passages and responding to prompts, writing essays based on given topics, and engaging in a face-to-face speaking interview. Scores range from 0 to 9 for each section and are averaged to produce an overall band score, which institutions use for admissions or employment decisions. ', 'The difficulty level of the IELTS exam can vary depending on the individual\'s proficiency in English and familiarity with the test format. Generally, the test is designed to assess a range of language abilities from basic to advanced levels. The Listening and Reading sections gradually increase in complexity, starting with easier tasks and progressing to more challenging ones. The Writing and Speaking sections require candidates to demonstrate not only language proficiency but also the ability to organize thoughts coherently and express ideas effectively.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`score_id`, `category`, `score`, `student_id`, `university_id`) VALUES
(1, 'IELTS', '7', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `email`, `phone`, `address`, `created_at`, `admin_id`) VALUES
(1, 'Student1', 'student1@gmail.com', '9800001282', 'Maitidevi', '2024-06-21 14:37:03', NULL),
(2, 'Student2', 'student2@gmail.com', '9800000000', 'Balkhu', '2024-06-21 14:41:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_score`
--

CREATE TABLE `test_score` (
  `test_score_id` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `score_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `minimum_band` float DEFAULT NULL,
  `scholarship` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`university_id`, `name`, `country`, `location`, `ranking`, `admin_id`, `minimum_band`, `scholarship`) VALUES
(1, 'University of Oxford', 'UK', 'Oxford', 3, 6, 7, 'Full scholarship'),
(2, 'Harvard University', 'USA', 'Cambridge', 12, 6, 7, 'Partial scholarship'),
(3, 'University of Toronto', 'Canada', 'Toronto', 18, 6, 6.5, 'No scholarship'),
(4, 'University of Melbourne', 'Australia', 'Melbourne', 27, 6, 6, 'Full scholarship'),
(5, 'University of Cambridge', 'UK', 'Cambridge', 30, 6, 7, 'Partial scholarship'),
(6, 'Stanford University', 'USA', 'Stanford', 33, 6, 5, 'No scholarship'),
(7, 'University of British Columbia', 'Canada', 'Vancouver', 34, 6, 6, 'Partial scholarship'),
(8, 'University of Sydney', 'Australia', 'Sydney', 42, 6, 7.5, 'Full scholarship'),
(9, 'Ludwig Maximilian University of Munich', 'Germany', 'Munich', 63, 6, 6.5, 'No scholarship'),
(10, 'University of Auckland', 'New Zealand', 'Auckland', 85, 6, 7, 'Partial scholarship'),
(11, 'University College London', 'UK', 'London', 90, 6, 7, 'Full scholarship'),
(12, 'California Institute of Technology (Caltech)', 'USA', 'Pasadena', 92, 6, 7, 'Partial scholarship'),
(13, 'McGill University', 'Canada', 'Montreal', 93, 6, 6, 'No scholarship'),
(14, 'Australian National University', 'Australia', 'Canberra', 99, 6, 7, 'Full scholarship'),
(15, 'Heidelberg University', 'Germany', 'Heidelberg', 102, 6, 6, 'Partial scholarship'),
(16, 'Victoria University of Wellington', 'New Zealand', 'Wellington', 112, 6, 5, 'No scholarship'),
(17, 'Imperial College London', 'UK', 'London', 128, 6, 7, 'Full scholarship'),
(18, 'Massachusetts Institute of Technology (MIT)', 'USA', 'Cambridge', 130, 6, 7, 'Partial scholarship'),
(19, 'University of Alberta', 'Canada', 'Edmonton', 139, 6, 6, 'No scholarship'),
(20, 'University of Queensland', 'Australia', 'Brisbane', 147, 6, 7, 'Full scholarship'),
(21, 'Technical University of Munich', 'Germany', 'Munich', 164, 6, 6, 'Partial scholarship'),
(22, 'University of Otago', 'New Zealand', 'Dunedin', 171, 6, 5, 'No scholarship'),
(23, 'University of Edinburgh', 'UK', 'Edinburgh', 201, 6, 6, 'Full scholarship'),
(25, 'University of Waterloo', 'Canada', 'Waterloo', 214, 6, 5, 'No scholarship'),
(26, 'Monash University', 'Australia', 'Melbourne', 231, 6, 6, 'Full scholarship'),
(27, 'Humboldt University of Berlin', 'Germany', 'Berlin', 247, 6, 5, 'Partial scholarship'),
(28, 'University of Canterbury', 'New Zealand', 'Christchurch', 259, 6, 6, 'No scholarship'),
(29, 'University of Manchester', 'UK', 'Manchester', 269, 6, 7, 'Full scholarship'),
(30, 'Yale University', 'USA', 'New Haven', 276, 6, 5, 'Partial scholarship'),
(31, 'University of Calgary', 'Canada', 'Calgary', 284, 6, 6, 'No scholarship'),
(36, 'Duke University', 'USA', 'Durham', 294, 6, 7, 'Partial scholarship'),
(37, 'University of Victoria', 'Canada', 'Victoria', 300, 6, 6, 'No scholarship'),
(38, 'Curtin University', 'Australia', 'Perth', 305, 6, 5, 'Full scholarship'),
(42, 'Columbia University', 'USA', 'New York', 311, 6, 7, 'Partial scholarship'),
(43, 'University of Montreal', 'Canada', 'Montreal', 314, 6, 5, 'No scholarship'),
(45, 'University of Tübingen', 'Germany', 'Tübingen', 324, 6, 6, 'Partial scholarship'),
(47, 'University of Pennsylvania', 'USA', 'Philadelphia', 333, 6, 7, 'Partial scholarship'),
(48, 'University of Ottawa', 'Canada', 'Ottawa', 345, 6, 5, 'No scholarship'),
(49, 'University of Technology Sydney', 'Australia', 'Sydney', 356, 6, 7, 'Full scholarship'),
(51, 'University of Waikato', 'New Zealand', 'Hamilton', 359, 6, 5, 'No scholarship'),
(52, 'University of Warwick', 'UK', 'Coventry', 360, 6, 6, 'Full scholarship'),
(53, 'University of Chicago', 'USA', 'Chicago', 367, 6, 7, 'Partial scholarship'),
(54, 'Queen\'s University', 'Canada', 'Kingston', 381, 6, 7, 'No scholarship'),
(55, 'University of Western Australia', 'Australia', 'Perth', 396, 6, 6, 'Full scholarship'),
(61, 'University of Adelaide', 'Australia', 'Adelaide', 405, 6, 5, 'Full scholarship'),
(70, 'University of Bristol', 'UK', 'Bristol', 422, 6, 7, 'Full scholarship'),
(73, 'University of New South Wales', 'Australia', 'Sydney', 438, 6, 7, 'Full scholarship'),
(76, 'King\'s College London', 'UK', 'London', 449, 6, 7, 'Full scholarship'),
(80, 'RWTH Aachen University', 'Germany', 'Aachen', 477, 6, 5, 'Partial scholarship'),
(81, 'Auckland University of Technology', 'New Zealand', 'Auckland', 497, 6, 5, 'No scholarship'),
(82, 'University of Glasgow', 'UK', 'Glasgow', 520, 6, 7, 'Full scholarship'),
(89, 'Wale University', 'USA', 'New Haven', 548, 6, 7, 'Partial scholarship'),
(92, 'Free University of Berlin', 'Germany', 'Berlin', 578, 6, 6, 'Partial scholarship'),
(98, 'University of Göttingen', 'Germany', 'Göttingen', 671, 6, 5, 'Partial scholarship'),
(99, 'Massey University', 'New Zealand', 'Palmerston North', 679, 6, 5, 'No scholarship'),
(101, 'Eindhoven University of Technology', 'Australia', 'Blue Mountains', 802, 6, 5, 'Partial Scholarship');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `proficiency_test`
--
ALTER TABLE `proficiency_test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `test_score`
--
ALTER TABLE `test_score`
  ADD PRIMARY KEY (`test_score_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `score_id` (`score_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`university_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `proficiency_test`
--
ALTER TABLE `proficiency_test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `test_score`
--
ALTER TABLE `test_score`
  MODIFY `test_score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `proficiency_test` (`test_id`);

--
-- Constraints for table `proficiency_test`
--
ALTER TABLE `proficiency_test`
  ADD CONSTRAINT `proficiency_test_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `test_score`
--
ALTER TABLE `test_score`
  ADD CONSTRAINT `test_score_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `proficiency_test` (`test_id`),
  ADD CONSTRAINT `test_score_ibfk_2` FOREIGN KEY (`score_id`) REFERENCES `score` (`score_id`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
