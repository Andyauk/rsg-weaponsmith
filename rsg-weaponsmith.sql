DROP TABLE IF EXISTS `weaponsmith_stock`;
CREATE TABLE IF NOT EXISTS `weaponsmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weaponsmith` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
