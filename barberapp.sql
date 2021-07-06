-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 13/03/2021 às 16:36
-- Versão do servidor: 8.0.21
-- Versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `barberapp`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `social_link` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `latitude`, `longitude`, `phone`, `social_link`, `image`) VALUES
(1, 'Espaço Homem', 'Rua A, n. 10. B. Teste. Cidade - CD', '-2.9043633091504724', '-41.76888156616043', NULL, 'https://instagram.com/', ''),
(2, 'Barbearia Brasil', 'Rua B, n. 11. B. Teste. Cidade - CD', '-2.9096351038075587', '-41.75356078864123', NULL, 'https://instagram.com/', ''),
(3, 'La Maison Barbearia', 'Rua B, n. 15. B. Teste. Cidade - CD', '-2.9053919539309203', '-41.77042651850738', NULL, 'https://instagram.com/', ''),
(4, 'Le Figaro', 'Rua A, n. 01. B. Teste. Cidade - CD', '-2.905219434465409', '-41.76699333599692', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `image`, `company_id`, `user_id`) VALUES
(1, 'Fulano', 'de Tal', 'https://i.imgur.com/hUw8Bc4.jpeg', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees_services`
--

CREATE TABLE `employees_services` (
  `employee_id` int NOT NULL,
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `employees_services`
--

INSERT INTO `employees_services` (`employee_id`, `service_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `schedules`
--

CREATE TABLE `schedules` (
  `id` int NOT NULL,
  `scheduling_date` datetime DEFAULT NULL,
  `scheduling_hour` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hour_start` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hour_end` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `schedules`
--

INSERT INTO `schedules` (`id`, `scheduling_date`, `scheduling_hour`, `hour_start`, `hour_end`, `user_id`, `employee_id`, `service_id`) VALUES
(1, '2020-12-11 00:00:00', NULL, '7', '8', 3, NULL, 1),
(2, '2020-12-11 00:00:00', NULL, '19', '20', 3, NULL, 1),
(3, '2020-12-14 00:00:00', NULL, '12', '17', 3, NULL, 1),
(4, '2020-12-27 00:00:00', NULL, '17', '18', 3, NULL, 1),
(5, '2020-12-31 00:00:00', NULL, '16', '18', 3, NULL, 2),
(6, '2021-01-05 00:00:00', NULL, '10', '12', 3, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `cost`, `company_id`) VALUES
(1, 'Corte de cabelo', 'Cortamos seu cabelo em até 30min', 25, 1),
(2, 'Barba', '', 15, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `image` longblob NOT NULL,
  `activated` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `image`, `activated`) VALUES
(1, 'Empresa ', 'empresa', '$2y$10$6mBTaqY1bRZG/sN3abnbl.B7McoKQ8JDG9B0maGOq5uGamngZG8bC', '', 1),
(2, 'Funcionário', 'funcionario', '$2y$10$NY0Py3K4sLxbtR7gAOPm9ueb5Zj5Y2A4VWC.Xthgsq9/d2Th9gZD6', '', 1),
(3, 'Cliente', 'cliente', '$2y$10$n2Etn44XaKzQKIs6HZtiUedV3kldxaRiSW.BzOntQksfDL0S96syi', '', 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employees_companies1_idx` (`company_id`),
  ADD KEY `fk_employees_users1_idx` (`user_id`);

--
-- Índices de tabela `employees_services`
--
ALTER TABLE `employees_services`
  ADD PRIMARY KEY (`employee_id`,`service_id`),
  ADD KEY `fk_employees_has_services_services1_idx` (`service_id`),
  ADD KEY `fk_employees_has_services_employees1_idx` (`employee_id`);

--
-- Índices de tabela `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedules_users_idx` (`user_id`),
  ADD KEY `fk_schedules_employees1_idx` (`employee_id`),
  ADD KEY `fk_schedules_services1_idx` (`service_id`);

--
-- Índices de tabela `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_services_companies1_idx` (`company_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `fk_employees_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `employees_services`
--
ALTER TABLE `employees_services`
  ADD CONSTRAINT `fk_employees_has_services_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_employees_has_services_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Restrições para tabelas `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_schedules_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `fk_schedules_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
