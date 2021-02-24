-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/02/2021 às 01:33
-- Versão do servidor: 10.4.17-MariaDB
-- Versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rastreiodb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcao`
--
-- Criação: 24/02/2021 às 00:12
--

CREATE TABLE `funcao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `funcao`:
--

--
-- Despejando dados para a tabela `funcao`
--

INSERT INTO `funcao` (`id`, `nome`) VALUES
(1, 'Motorista');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--
-- Criação: 24/02/2021 às 00:12
-- Última atualização: 24/02/2021 às 00:21
--

CREATE TABLE `funcionario` (
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `funcao_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `funcionario`:
--   `funcao_id`
--       `funcao` -> `id`
--

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`data_cadastro`, `funcao_id`, `id`, `nome`) VALUES
('2021-02-23 21:20:12', 1, 3, 'Tracy Mailes'),
('2021-02-23 21:20:35', 1, 4, 'Rudyard Cottom'),
('2021-02-23 21:21:27', 1, 5, 'Annaliese Ogborne');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rastreamento`
--
-- Criação: 24/02/2021 às 00:12
-- Última atualização: 24/02/2021 às 00:27
--

CREATE TABLE `rastreamento` (
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `funcionario_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `velocidade` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `rastreamento`:
--   `funcionario_id`
--       `funcionario` -> `id`
--   `veiculo_id`
--       `veiculo` -> `id`
--

--
-- Despejando dados para a tabela `rastreamento`
--

INSERT INTO `rastreamento` (`data`, `funcionario_id`, `id`, `latitude`, `longitude`, `veiculo_id`, `velocidade`) VALUES
('2021-02-23 21:25:22', 3, 4, -26.9176, -49.3558, 4, 102),
('2021-02-23 21:26:10', 4, 5, -7.33286, 111.908, 4, 114),
('2021-02-23 21:27:37', 5, 6, 36.795, -119.754, 4, 95);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--
-- Criação: 24/02/2021 às 00:12
-- Última atualização: 24/02/2021 às 00:24
--

CREATE TABLE `veiculo` (
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `placa` varchar(100) NOT NULL,
  `vel_maxima` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONAMENTOS PARA TABELAS `veiculo`:
--

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`data_cadastro`, `id`, `nome`, `placa`, `vel_maxima`) VALUES
('2021-02-23 21:22:28', 4, 'Caminhão', 'ABC1001', 94);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rastreamento`
--
ALTER TABLE `rastreamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `rastreamento`
--
ALTER TABLE `rastreamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
