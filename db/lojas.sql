-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.11 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para lojas
CREATE DATABASE IF NOT EXISTS `lojas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `lojas`;


-- Copiando estrutura para tabela lojas.budget
CREATE TABLE IF NOT EXISTS `budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `deadline` varchar(45) DEFAULT NULL,
  `form_payment` varchar(45) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `customers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_budget_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_budget_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.budget: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.budget_items
CREATE TABLE IF NOT EXISTS `budget_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unitary_value` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `budget_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_budget_items_budget1_idx` (`budget_id`),
  CONSTRAINT `fk_budget_items_budget1` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.budget_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `budget_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget_items` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `states_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cid_name` varchar(155) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cities_states_idx` (`states_id`),
  CONSTRAINT `fk_cities_states` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.cities: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `kind` char(1) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `bird` timestamp NULL DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(45) DEFAULT NULL,
  `zip_code` char(9) DEFAULT NULL,
  `cities_id` int(11) NOT NULL,
  `states_id` int(11) NOT NULL,
  `cpf` char(14) DEFAULT NULL,
  `identity` varchar(45) DEFAULT NULL,
  `issuing` char(6) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `state_registration` varchar(20) DEFAULT NULL,
  `residential_phone` char(14) DEFAULT NULL,
  `cell` char(14) DEFAULT NULL,
  `phone_trade` char(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customers_states1_idx` (`states_id`),
  KEY `fk_customers_cities1_idx` (`cities_id`),
  CONSTRAINT `fk_customers_cities1` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_states1` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.customers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.entry_products
CREATE TABLE IF NOT EXISTS `entry_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providers_id` int(11) NOT NULL,
  `create_at` date DEFAULT NULL,
  `document` varchar(45) DEFAULT NULL,
  `released` char(1) DEFAULT 'S',
  `total_price` decimal(15,2) DEFAULT NULL,
  `shipping_price` decimal(15,2) DEFAULT NULL,
  `price_notes` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entry_products_providers1_idx` (`providers_id`),
  CONSTRAINT `fk_entry_products_providers1` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.entry_products: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entry_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_products` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requests_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unitary_value` decimal(15,2) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_requests1_idx` (`requests_id`),
  KEY `fk_items_products1_idx` (`products_id`),
  CONSTRAINT `fk_items_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_requests1` FOREIGN KEY (`requests_id`) REFERENCES `requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_attempts_users1_idx` (`user_id`),
  CONSTRAINT `fk_login_attempts_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.login_attempts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `subcategories_id` int(11) NOT NULL,
  `providers_id` int(11) NOT NULL,
  `source_code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cost_price` decimal(15,2) DEFAULT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `bar_ code` char(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories1_idx` (`categories_id`),
  KEY `fk_products_subcategories1_idx` (`subcategories_id`),
  KEY `fk_products_providers1_idx` (`providers_id`),
  CONSTRAINT `fk_products_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_providers1` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_subcategories1` FOREIGN KEY (`subcategories_id`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.products: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.providers
CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `fantasy` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(45) DEFAULT NULL,
  `zip_code` char(9) DEFAULT NULL,
  `cities_id` int(11) NOT NULL,
  `states_id` int(11) NOT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `state_registration` varchar(20) DEFAULT NULL,
  `phone` char(14) DEFAULT NULL,
  `phone1` char(14) DEFAULT NULL,
  `phone2` char(14) DEFAULT NULL,
  `phone3` char(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `mobile_contact` char(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customers_states1_idx` (`states_id`),
  KEY `fk_customers_cities1_idx` (`cities_id`),
  CONSTRAINT `fk_customers_cities10` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_states10` FOREIGN KEY (`states_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.providers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.recoveries
CREATE TABLE IF NOT EXISTS `recoveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_recoveries_users1_idx` (`user_id`),
  CONSTRAINT `fk_recoveries_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.recoveries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recoveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoveries` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.requests
CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `form_payament` varchar(45) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `customers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requests_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_requests_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.requests: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role`) VALUES
	(1, 'administrator'),
	(2, 'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uf` char(2) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.states: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subcategories_categories1_idx` (`categories_id`),
  CONSTRAINT `fk_subcategories_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.subcategories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;


-- Copiando estrutura para tabela lojas.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `salt` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles1_idx` (`role_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela lojas.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
