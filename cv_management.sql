-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2026 at 07:20 PM
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
-- Database: `cv_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute_definition`
--

CREATE TABLE `attribute_definition` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `supported_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`supported_values`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute_definition`
--

INSERT INTO `attribute_definition` (`id`, `category`, `name`, `description`, `type`, `version`, `supported_values`) VALUES
(2, 'Education', 'Degree', 'Low', 'dropdown', 1, ''),
(3, 'Business', 'MBA', NULL, 'numeric', 1, '[]'),
(4, 'Education', 'ILETS', '7.5', 'numeric', 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `status` varchar(20) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv_like`
--

CREATE TABLE `cv_like` (
  `id` int(11) NOT NULL,
  `cv_id` int(11) NOT NULL,
  `recruiter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_post`
--

CREATE TABLE `discussion_post` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `position_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260904135422', '2026-09-04 15:54:34', 47),
('DoctrineMigrations\\Version20260904145143', '2026-09-04 16:52:02', 115),
('DoctrineMigrations\\Version20260905054158', '2026-09-05 07:42:19', 596),
('DoctrineMigrations\\Version20260905123000', '2026-09-05 08:32:48', 23),
('DoctrineMigrations\\Version20260905190000', NULL, NULL),
('DoctrineMigrations\\Version20260906094841', '2026-09-06 11:48:50', 174),
('DoctrineMigrations\\Version20260906120000', '2026-09-06 09:40:35', 12),
('DoctrineMigrations\\Version20260906130000', '2026-09-06 09:58:15', 11),
('DoctrineMigrations\\Version20260907071111', '2026-09-07 09:13:36', 151),
('DoctrineMigrations\\Version20260907141500', '2026-09-07 10:33:30', 18);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `access_rule_type` varchar(20) NOT NULL,
  `access_operator` varchar(20) DEFAULT NULL,
  `access_value` varchar(255) DEFAULT NULL,
  `project_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`project_tags`)),
  `max_projects` int(11) NOT NULL,
  `access_attribute_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `title`, `short_description`, `version`, `access_rule_type`, `access_operator`, `access_value`, `project_tags`, `max_projects`, `access_attribute_id`) VALUES
(4, 'Banker', 'we need a front desk manager', 1, 'public', NULL, NULL, '[]', 2, NULL),
(6, 'Teacher', 'Must Be fluent in English', 1, 'public', NULL, NULL, '[\"ILETS SCORE 7\"]', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position_attribute`
--

CREATE TABLE `position_attribute` (
  `position_id` int(11) NOT NULL,
  `attribute_definition_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position_attribute`
--

INSERT INTO `position_attribute` (`position_id`, `attribute_definition_id`) VALUES
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `attribute_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attribute_values`)),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `location`, `photo`, `version`, `attribute_values`, `user_id`) VALUES
(1, 'Sharika', 'Jarin', 'ctg', NULL, 4, '{\"2\":\"bba\"}', 2),
(2, 'Intu', 'mah', 'dhaka', NULL, 5, '{\"2\":\"M.SC\"}', 3),
(3, 'Minha', 'Juj', 'Comilla', NULL, 8, '{\"2\":\"zoology\"}', 4),
(4, 'Latif', 'Ali', 'Dhaka', NULL, 9, '{\"2\":\"M.B.A\"}', 1),
(5, 'Imad', 'Hosen', 'Florida', NULL, 5, '{\"2\":\"M.A\"}', 5),
(6, 'Asad', 'Khan', 'Oxygen', NULL, 5, '{\"2\":\"BS\"}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `tech_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tech_tags`)),
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `start_date`, `end_date`, `version`, `tech_tags`, `profile_id`) VALUES
(1, 'BLOOD MANAGEMENT SYSTEM', 'php project', '0001-11-11', '0002-02-22', 1, '[\"[{\\\"value\\\":\\\"php\\\"}]\"]', 2),
(2, 'Art Gllaery', NULL, '0024-03-05', NULL, 1, '[]', 4),
(3, 'Baby Sitter Managment', 'It is to monitor the baby sitter within house', '0026-02-04', NULL, 1, '[\"[{\\\"value\\\":\\\"React\\\"}]\"]', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en',
  `blocked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `locale`, `blocked`) VALUES
(1, 'ali@gmail.com', '[\"ROLE_RECRUITER\"]', '$2y$13$PuFuafse5FnGOArW6W.2T.buDFSV173itZ2aF8VC0FxrAF.dX.qFC', 'en', 0),
(2, 'suhi@email.com', '[\"ROLE_CANDIDATE\"]', '$2y$13$PBDVl8A5Zn6bIZVy19nHR.DRZnpy378KUisPw.9h8dQAt2QK4b3FK', 'en', 0),
(3, 'candidate@test.com', '[\"ROLE_CANDIDATE\"]', '$2y$13$jMApUI4lfX59xVxp8Cp0iuLdR3U0y9RPFsmUMubCqwEtRbB9BtnAq', 'en', 0),
(4, 'recruiter@test.com', '[\"ROLE_USER\",\"ROLE_RECRUITER\"]', '$2y$13$RuteXJCrd1k1t9x5JNyl.OGdVrU8GcIaowULjkL7t6LdixTzM3vqO', 'en', 0),
(5, 'Imad@gmail.com', '[\"ROLE_CANDIDATE\",\"ROLE_USER\",\"ROLE_ADMIN\"]', '$2y$13$h5yMOjYpeERGFRXHmQCpH.QjPimHzcoC8AWRoe6JwF6ZgssDfyr22', 'en', 0),
(6, 'khan@gmail.com', '[\"ROLE_CANDIDATE\"]', '$2y$13$cmxeOtv2Hv9OpsJeMSpWa.5Fcyb/5Zo5vxd1dzZLMD2OKZQ.epJp2', 'en', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_definition`
--
ALTER TABLE `attribute_definition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6C5628BD5E237E06` (`name`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B66FFE92CCFA12B8` (`profile_id`),
  ADD KEY `IDX_B66FFE92DD842E46` (`position_id`);

--
-- Indexes for table `cv_like`
--
ALTER TABLE `cv_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CVLIKE_CV_RECRUITER` (`cv_id`,`recruiter_id`),
  ADD KEY `IDX_CD2DA06FCFE419E2` (`cv_id`),
  ADD KEY `IDX_CD2DA06F156BE243` (`recruiter_id`);

--
-- Indexes for table `discussion_post`
--
ALTER TABLE `discussion_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7FE4C0BBDD842E46` (`position_id`),
  ADD KEY `IDX_7FE4C0BBF675F31B` (`author_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_462CE4F56AAAB6B8` (`access_attribute_id`);

--
-- Indexes for table `position_attribute`
--
ALTER TABLE `position_attribute`
  ADD PRIMARY KEY (`position_id`,`attribute_definition_id`),
  ADD KEY `IDX_AF5BEE86DD842E46` (`position_id`),
  ADD KEY `IDX_AF5BEE867492F274` (`attribute_definition_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8157AA0FA76ED395` (`user_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2FB3D0EECCFA12B8` (`profile_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute_definition`
--
ALTER TABLE `attribute_definition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cv_like`
--
ALTER TABLE `cv_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discussion_post`
--
ALTER TABLE `discussion_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `FK_B66FFE92CCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`),
  ADD CONSTRAINT `FK_B66FFE92DD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Constraints for table `cv_like`
--
ALTER TABLE `cv_like`
  ADD CONSTRAINT `FK_CD2DA06F156BE243` FOREIGN KEY (`recruiter_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CD2DA06FCFE419E2` FOREIGN KEY (`cv_id`) REFERENCES `cv` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussion_post`
--
ALTER TABLE `discussion_post`
  ADD CONSTRAINT `FK_7FE4C0BBDD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `FK_7FE4C0BBF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `FK_462CE4F56AAAB6B8` FOREIGN KEY (`access_attribute_id`) REFERENCES `attribute_definition` (`id`);

--
-- Constraints for table `position_attribute`
--
ALTER TABLE `position_attribute`
  ADD CONSTRAINT `FK_AF5BEE867492F274` FOREIGN KEY (`attribute_definition_id`) REFERENCES `attribute_definition` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AF5BEE86DD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK_8157AA0FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_2FB3D0EECCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
