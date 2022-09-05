-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Set-2022 às 16:44
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_americanair`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `nacionalidade` varchar(30) DEFAULT 'Brasil',
  `id_voo_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `data_nascimento`, `sexo`, `nacionalidade`, `id_voo_cliente`) VALUES
(1, 'Francisco das Xagas', '1999-07-02', 'M', 'Brasileiro', 3),
(2, 'Cláudio Fontes', '1988-03-12', 'M', 'Brasileiro', 1),
(3, 'Eli Phillips', '2000-12-14', 'M', 'Americano', 4),
(4, 'Gregory Willians', '1996-04-22', 'M', 'Inglês', 5),
(5, 'Ana Amari', '1982-07-03', 'F', 'Ârabe', 1),
(6, 'Thales Miller', '2003-11-23', 'M', 'Alemão', 2),
(7, 'Willian Hernandes', '1922-02-23', 'M', 'Mexicano', 3),
(8, 'Stephanny Guerra', '1977-07-12', 'F', 'Brasileiro', 4),
(9, 'Jesse Cook', '2002-12-25', 'F', 'Austrália', 5),
(10, 'James Riverwood', '1999-07-11', 'M', 'Inglaterra', 3),
(11, 'Eliza Yamachiro', '2000-03-21', 'F', 'Japão', 4),
(12, 'Terry Rock', '1933-07-08', 'M', 'EUA', 3),
(13, 'Rita Rock', '1935-10-05', 'F', 'EUA', 5),
(14, 'Arold Winchester', '1966-03-06', 'M', 'Tailândia', 5),
(15, 'Francisca Pereira', '1888-08-08', 'F', 'Brasileiro', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `voo`
--

CREATE TABLE `voo` (
  `id_voo` int(11) NOT NULL,
  `modelo_aviao` varchar(30) NOT NULL,
  `horario_de_embarque` varchar(15) NOT NULL,
  `destino` varchar(30) DEFAULT NULL,
  `data_voo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `voo`
--

INSERT INTO `voo` (`id_voo`, `modelo_aviao`, `horario_de_embarque`, `destino`, `data_voo`) VALUES
(1, 'Boeing 777-200ER', '12:00 am', 'Japão', '2022-11-12'),
(2, 'Airbus A350-1000', '7:00 pm', 'Espanha', '2022-03-22'),
(3, 'Boeing 747-8', '15:30 pm', 'Alemanha', '2022-06-09'),
(4, 'Airbus A380', '9:30 pm', 'Bolívia', '2022-11-15'),
(5, 'Boeing 777-200ER', '1:00 am', 'Quatar', '2022-07-22');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_voo_cliente` (`id_voo_cliente`);

--
-- Índices para tabela `voo`
--
ALTER TABLE `voo`
  ADD PRIMARY KEY (`id_voo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `voo`
--
ALTER TABLE `voo`
  MODIFY `id_voo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_voo_cliente`) REFERENCES `voo` (`id_voo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
