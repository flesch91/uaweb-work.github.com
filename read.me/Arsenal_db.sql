-- --------------------------------------------------------
-- Host:                         192.168.0.104
-- Server version:               5.1.65-community-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-05-11 00:10:40
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for yupe
DROP DATABASE IF EXISTS `yupe`;
CREATE DATABASE IF NOT EXISTS `yupe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yupe`;


-- Dumping structure for table yupe.yupe_blog_blog
DROP TABLE IF EXISTS `yupe_blog_blog`;
CREATE TABLE IF NOT EXISTS `yupe_blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `icon` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_blog_slug_lang` (`slug`,`lang`),
  KEY `ix_yupe_blog_blog_create_user` (`create_user_id`),
  KEY `ix_yupe_blog_blog_update_user` (`update_user_id`),
  KEY `ix_yupe_blog_blog_status` (`status`),
  KEY `ix_yupe_blog_blog_type` (`type`),
  KEY `ix_yupe_blog_blog_create_date` (`create_date`),
  KEY `ix_yupe_blog_blog_update_date` (`update_date`),
  KEY `ix_yupe_blog_blog_lang` (`lang`),
  KEY `ix_yupe_blog_blog_slug` (`slug`),
  KEY `ix_yupe_blog_blog_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_blog_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_blog_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_blog_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_blog_blog: ~3 rows (approximately)
DELETE FROM `yupe_blog_blog`;
/*!40000 ALTER TABLE `yupe_blog_blog` DISABLE KEYS */;
INSERT INTO `yupe_blog_blog` (`id`, `category_id`, `name`, `description`, `icon`, `slug`, `lang`, `type`, `status`, `create_user_id`, `update_user_id`, `create_date`, `update_date`) VALUES
	(2, NULL, 'Яна Ломага ', '<p>ХотДог з дрібками<br /></p>', 'bbec676ae4b0ff283cea53cc3c45cc37.jpg', 'jana_lomaga', NULL, 1, 1, 1, 1, 1367093760, 1367096935),
	(3, NULL, 'Яна Ломага', '<p>Канапки з дрібкою гумору<br /></p>', '6db4d028a52145c25be3b0cefbc9cf0b.jpg', 'jana', NULL, 1, 1, 1, 1, 1367094734, 1367096962),
	(4, NULL, 'Микола Вересень', '<p>Канапки з дрібкою гумору<br /></p>', 'c846c8242031ab69f9f6e2b70394bdcc.jpg', 'veresen', NULL, 1, 1, 1, 1, 1367094776, 1367096984);
/*!40000 ALTER TABLE `yupe_blog_blog` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_blog_post
DROP TABLE IF EXISTS `yupe_blog_post`;
CREATE TABLE IF NOT EXISTS `yupe_blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `publish_date` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `quote` varchar(250) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_status` int(11) NOT NULL DEFAULT '1',
  `create_user_ip` varchar(20) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1',
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_post_lang_slug` (`slug`,`lang`),
  KEY `ix_yupe_blog_post_blog_id` (`blog_id`),
  KEY `ix_yupe_blog_post_create_user_id` (`create_user_id`),
  KEY `ix_yupe_blog_post_update_user_id` (`update_user_id`),
  KEY `ix_yupe_blog_post_status` (`status`),
  KEY `ix_yupe_blog_post_access_type` (`access_type`),
  KEY `ix_yupe_blog_post_comment_status` (`comment_status`),
  KEY `ix_yupe_blog_post_lang` (`lang`),
  KEY `ix_yupe_blog_post_slug` (`slug`),
  KEY `ix_yupe_blog_post_publish_date` (`publish_date`),
  CONSTRAINT `fk_yupe_blog_post_blog` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_post_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_post_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_blog_post: ~7 rows (approximately)
DELETE FROM `yupe_blog_post`;
/*!40000 ALTER TABLE `yupe_blog_post` DISABLE KEYS */;
INSERT INTO `yupe_blog_post` (`id`, `blog_id`, `create_user_id`, `update_user_id`, `create_date`, `update_date`, `publish_date`, `slug`, `lang`, `title`, `quote`, `content`, `link`, `status`, `comment_status`, `create_user_ip`, `access_type`, `keywords`, `description`) VALUES
	(2, 2, 1, 1, 1367094141, 1367094141, 1367137200, 'gumor', NULL, 'Канапки з дрібкою гумору', '<p>Цитата Канапки з дрібкою гумору<br></p>', '<p>Канапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гуморуКанапки з дрібкою гумору<br></p>', '', 1, 1, '192.168.0.104', 1, '', ''),
	(3, 2, 1, 1, 1367107270, 1367107270, 1367107200, 'newspost', NULL, 'Новий пост', '', '<p>тралялятралялятралялятралялятралялятралялятралялятраляля<br></p>', '', 0, 1, '192.168.0.104', 1, '', ''),
	(4, 2, 1, 1, 1367108628, 1367108628, 1367108580, 'bomba', NULL, 'бомбові бутіки', '', 'бомбові бутікибомбові бутікибомбові бутікибомбові бутікибомбові бутіки<p>бомбові бутікибомбові бутікибомбові бутікибомбові бутіки</p>бомбові бутікибомбові бутікибомбові бутіки', '', 1, 1, '192.168.0.104', 1, '', ''),
	(5, 2, 1, 1, 1367430165, 1367430165, 1367386920, 'pagination1', NULL, 'Перевірка пагінації1', '', '<p>Перевірка пагінації1<br></p>', '', 0, 1, '192.168.0.104', 1, '', ''),
	(6, 2, 1, 1, 1367430185, 1367430185, 1367386920, 'pagination2', NULL, 'Перевірка пагінації2', '', '<p>Перевірка пагінації2<br></p>', '', 0, 1, '192.168.0.104', 1, '', ''),
	(7, 4, 1, 1, 1367441802, 1367441802, 1367484960, 'april', NULL, 'Априль', '', '<p>Микола Апріль<br></p>', '', 0, 1, '192.168.0.104', 1, '', ''),
	(8, 4, 1, 1, 1367441874, 1367441874, 1367485020, 'sdfasdfadf', NULL, 'вапівапівап', '', '<p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><p>sadfa sdfasdf asdf asdf</p><br><p></p>', '', 1, 1, '192.168.0.104', 1, '', '');
/*!40000 ALTER TABLE `yupe_blog_post` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_blog_post_to_tag
DROP TABLE IF EXISTS `yupe_blog_post_to_tag`;
CREATE TABLE IF NOT EXISTS `yupe_blog_post_to_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `ix_yupe_blog_post_to_tag_post_id` (`post_id`),
  KEY `ix_yupe_blog_post_to_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_yupe_blog_post_to_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `yupe_blog_post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_post_to_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `yupe_blog_tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_blog_post_to_tag: ~0 rows (approximately)
DELETE FROM `yupe_blog_post_to_tag`;
/*!40000 ALTER TABLE `yupe_blog_post_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_post_to_tag` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_blog_tag
DROP TABLE IF EXISTS `yupe_blog_tag`;
CREATE TABLE IF NOT EXISTS `yupe_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_tag_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_blog_tag: ~0 rows (approximately)
DELETE FROM `yupe_blog_tag`;
/*!40000 ALTER TABLE `yupe_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_tag` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_blog_user_to_blog
DROP TABLE IF EXISTS `yupe_blog_user_to_blog`;
CREATE TABLE IF NOT EXISTS `yupe_blog_user_to_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_user_to_blog_blog_user_to_blog_u_b` (`user_id`,`blog_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_user_id` (`user_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_id` (`blog_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_status` (`status`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_role` (`role`),
  CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_blog_user_to_blog: ~3 rows (approximately)
DELETE FROM `yupe_blog_user_to_blog`;
/*!40000 ALTER TABLE `yupe_blog_user_to_blog` DISABLE KEYS */;
INSERT INTO `yupe_blog_user_to_blog` (`id`, `user_id`, `blog_id`, `create_date`, `update_date`, `role`, `status`, `note`) VALUES
	(2, 1, 2, 1367093760, 1367093760, 1, 1, ''),
	(3, 1, 3, 1367094734, 1367094734, 1, 1, ''),
	(4, 1, 4, 1367094776, 1367094776, 1, 1, '');
/*!40000 ALTER TABLE `yupe_blog_user_to_blog` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_catalog_good
DROP TABLE IF EXISTS `yupe_catalog_good`;
CREATE TABLE IF NOT EXISTS `yupe_catalog_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `article` varchar(100) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `alias` varchar(150) NOT NULL,
  `data` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_catalog_good_alias` (`alias`),
  KEY `ix_yupe_catalog_good_status` (`status`),
  KEY `ix_yupe_catalog_good_category` (`category_id`),
  KEY `ix_yupe_catalog_good_user` (`user_id`),
  KEY `ix_yupe_catalog_good_change_user` (`change_user_id`),
  KEY `ix_yupe_catalog_good_article` (`article`),
  KEY `ix_yupe_catalog_good_price` (`price`),
  CONSTRAINT `fk_yupe_catalog_good_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_catalog_good_change_user` FOREIGN KEY (`change_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_catalog_good_user` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_catalog_good: ~0 rows (approximately)
DELETE FROM `yupe_catalog_good`;
/*!40000 ALTER TABLE `yupe_catalog_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_catalog_good` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_category_category
DROP TABLE IF EXISTS `yupe_category_category`;
CREATE TABLE IF NOT EXISTS `yupe_category_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `alias` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_category_category_alias_lang` (`alias`,`lang`),
  KEY `ix_yupe_category_category_parent_id` (`parent_id`),
  KEY `ix_yupe_category_category_status` (`status`),
  CONSTRAINT `fk_yupe_category_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_category_category: ~11 rows (approximately)
DELETE FROM `yupe_category_category`;
/*!40000 ALTER TABLE `yupe_category_category` DISABLE KEYS */;
INSERT INTO `yupe_category_category` (`id`, `parent_id`, `alias`, `lang`, `name`, `image`, `short_description`, `description`, `status`) VALUES
	(1, NULL, 'slider_header', 'uk', 'Слайдер музичний вечір', NULL, '', '<p>Слайдер музичний вечір<br></p>', 1),
	(2, 1, 'slide1', 'uk', 'Музичний вечір 1', '122edd34dd8e28963800c6a92ed9c244.jpg', '', '<p><h1>Музичні вечори</h1>\r\n                                    <p>"Арсенал" - один із небагатьох у Львові ресторанів, який має справді професійне звукове обладнання. Вечори в <br> закладі мають особливе музичне оформлення, адже тут виступають професійні львівські музиканти - віртуози. <br> Шість вечорів на тиждень тут звучить класична музика, джаз, етно-рок, рок-н-ролл, ірландська музика.</p><br></p>', 1),
	(3, NULL, 'content_block_uk', 'uk', 'Блоки контенту', NULL, '', '<p>Блоки контенту <b>Ресторан</b> і <b>Музей зброї</b><br></p>', 1),
	(4, 3, 'restaurant_menu', 'uk', 'Ресторан', NULL, '<br><ul class="restaurant_menu_links">\r\n            </ul>', '<p>Різноманітність європейської, італійської та української кухні задовільнить смак</p><p> найвибагливішого гурмана.<br></p>', 1),
	(6, 3, 'weapons', 'uk', 'Музей зброї', NULL, '', '<p>Музей-ресторан "Арсенал" розвинув експозиційну тематику музею: <br> автентично відреставрований зал у стилі середньовіччя прикрашають більше 100 реплік <br> історичної зброї , яка була в ужитку на історичних територіях України часів ІХ-ХVІ ст.<br></p>', 1),
	(7, 3, 'tasting', 'uk', 'Дегустації', NULL, '<a href="#">\r\n                    <img alt="Member card icon" src="im/ico_member_card.png">\r\n                    Правила отримання членської картки\r\n                </a>\r\n                <br>\r\n                <a href="#">\r\n                    <img style="" alt="Distance club card icon" src="im/ico_distance_club.png">\r\n                    Правила дегустаційного клубу\r\n                </a>', '<p>До Вашої диспозиції послуги професійного сомельє. Що п\'ятниці в "Арсеналі" відбуваються <br> дегустаційні вечори різноманітних напоїв відомих світових виробників. . Заклад пропонує <br> широку винну карту та великий вибір солодового віскі.<br></p>', 1),
	(8, 3, 'live_music', 'uk', 'Музичний вечір', NULL, '', '<p>"Арсенал" - один із небагатьох у Львові ресторанів, який має справді професійне звукове <br> обладнання. Вечори в закладі мають особливе музичне оформлення, адже шість вечорів на <br> тиждень тут виступають професійні львівські музиканти - віртуози.<br></p>', 1),
	(9, 3, 'event_news', 'uk', 'Новини', NULL, '', '<p>Музей-ресторан "Арсенал" активно підтримує різноманітні історико-культурні, <br> науково-просвітницькі та мистецькі заходи. Важливо, що середньовічне обрамлення <br> "Арсеналу" - це не лише антураж для туристів, а й справжня культурна складова закладу.<br></p>', 1),
	(10, NULL, 'content_block_en', 'en', 'ContentBlock', NULL, '', '<p>Content Block<br></p>', 1),
	(11, NULL, 'slider_header', 'en', 'Slider Header', NULL, '', '<p>Header Slider<br></p>', 1),
	(14, 10, 'restaurant_menu', 'en', 'Restaurant', NULL, '<br><ul class="restaurant_menu_links">\r\n            </ul>', '<p></p><span>In restRiznomanitnist European, Italian and Ukrainian cuisine will satisfy the taste<br><br>hurmana.orani most demanding cook a healthy meal of good quality and fresh ingredients.</span><p><br></p>', 1);
/*!40000 ALTER TABLE `yupe_category_category` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_comment_comment
DROP TABLE IF EXISTS `yupe_comment_comment`;
CREATE TABLE IF NOT EXISTS `yupe_comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_comment_comment_status` (`status`),
  KEY `ix_yupe_comment_comment_model_model_id` (`model`,`model_id`),
  KEY `ix_yupe_comment_comment_model` (`model`),
  KEY `ix_yupe_comment_comment_model_id` (`model_id`),
  KEY `ix_yupe_comment_comment_user_id` (`user_id`),
  KEY `ix_yupe_comment_comment_parent_id` (`parent_id`),
  CONSTRAINT `fk_yupe_comment_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_comment_comment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_comment_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_comment_comment: ~36 rows (approximately)
DELETE FROM `yupe_comment_comment`;
/*!40000 ALTER TABLE `yupe_comment_comment` DISABLE KEYS */;
INSERT INTO `yupe_comment_comment` (`id`, `parent_id`, `user_id`, `model`, `model_id`, `url`, `creation_date`, `name`, `email`, `text`, `status`, `ip`) VALUES
	(1, NULL, 1, 'Post', 1, '', '2013-04-25 01:06:30', 'ruslan', 'ruslanbanah@gmail.com', 'класний блог', 1, '192.168.0.104'),
	(2, 1, 1, 'Post', 1, '', '2013-04-25 01:10:12', 'ruslan', 'ruslanbanah@gmail.com', 'угу', 1, '192.168.0.104'),
	(3, NULL, 1, 'Post', 1, '', '2013-04-25 01:10:25', 'ruslan', 'ruslanbanah@gmail.com', 'комент', 1, '192.168.0.104'),
	(4, NULL, 1, 'News', 1, '', '2013-05-02 00:55:48', 'ruslan', 'ruslanbanah@gmail.com', 'hjkhlkjhlkjh', 1, '192.168.0.104'),
	(5, NULL, 1, 'News', 13, '', '2013-05-02 01:03:22', 'ruslan', 'ruslanbanah@gmail.com', 'dsfgsdfgsdgf', 1, '192.168.0.104'),
	(6, NULL, 1, 'News', 13, '', '2013-05-02 01:04:17', 'ruslan', 'ruslanbanah@gmail.com', 'проба', 1, '192.168.0.104'),
	(7, NULL, 1, 'News', 13, '', '2013-05-02 01:05:04', 'ruslan', 'ruslanbanah@gmail.com', 'проба', 1, '192.168.0.104'),
	(8, NULL, 1, 'News', 13, '', '2013-05-02 01:06:47', 'ruslan', 'ruslanbanah@gmail.com', 'тест', 1, '192.168.0.104'),
	(9, NULL, 1, 'News', 13, '', '2013-05-02 01:07:55', 'ruslan', 'ruslanbanah@gmail.com', '123456', 1, '192.168.0.104'),
	(10, NULL, 1, 'News', 13, '', '2013-05-02 01:09:20', 'ruslan', 'ruslanbanah@gmail.com', '123456', 1, '192.168.0.104'),
	(11, NULL, 1, 'News', 13, '', '2013-05-02 01:09:36', 'ruslan', 'ruslanbanah@gmail.com', 'авпівапівапіва', 1, '192.168.0.104'),
	(12, NULL, 1, 'News', 13, '', '2013-05-02 01:10:10', 'ruslan', 'ruslanbanah@gmail.com', 'віпвапівап', 1, '192.168.0.104'),
	(13, NULL, 1, 'News', 13, '', '2013-05-02 01:13:37', 'ruslan', 'ruslanbanah@gmail.com', 'ааааааааааааааааааааааааа', 1, '192.168.0.104'),
	(14, NULL, 1, 'News', 13, '', '2013-05-02 01:14:14', 'ruslan', 'ruslanbanah@gmail.com', 'ббббббббббб', 1, '192.168.0.104'),
	(15, NULL, 1, 'News', 13, '', '2013-05-02 01:14:53', 'ruslan', 'ruslanbanah@gmail.com', 'ббббббббббб', 1, '192.168.0.104'),
	(16, NULL, 1, 'News', 13, '', '2013-05-02 01:14:58', 'ruslan', 'ruslanbanah@gmail.com', 'ббббббббббб', 1, '192.168.0.104'),
	(17, NULL, 1, 'News', 13, '', '2013-05-02 01:15:07', 'ruslan', 'ruslanbanah@gmail.com', 'івфафівафівафіва', 1, '192.168.0.104'),
	(18, NULL, 1, 'News', 13, '', '2013-05-02 01:15:17', 'ruslan', 'ruslanbanah@gmail.com', 'фівафівафівмсчячмсячмсясч', 1, '192.168.0.104'),
	(19, NULL, 1, 'News', 1, '', '2013-05-02 01:15:30', 'ruslan', 'ruslanbanah@gmail.com', 'проба', 1, '192.168.0.104'),
	(20, NULL, 1, 'News', 1, '', '2013-05-02 01:15:42', 'ruslan', 'ruslanbanah@gmail.com', 'тест', 1, '192.168.0.104'),
	(21, NULL, 1, 'News', 6, '', '2013-05-02 01:17:08', 'ruslan', 'ruslanbanah@gmail.com', 'привіт', 1, '192.168.0.104'),
	(22, NULL, 1, 'News', 6, '', '2013-05-02 01:17:35', 'ruslan', 'ruslanbanah@gmail.com', 'привіт', 1, '192.168.0.104'),
	(23, NULL, 1, 'News', 6, '', '2013-05-02 01:18:08', 'ruslan', 'ruslanbanah@gmail.com', 'ррррррр', 1, '192.168.0.104'),
	(24, NULL, 1, 'News', 1, '', '2013-05-02 01:21:37', 'ruslan', 'ruslanbanah@gmail.com', 'hgkjhgkjhgkjhg', 1, '192.168.0.104'),
	(25, NULL, 1, 'News', 1, '', '2013-05-02 01:21:52', 'ruslan', 'ruslanbanah@gmail.com', 'hgkjhgkjhgkjhg', 1, '192.168.0.104'),
	(26, NULL, 1, 'News', 1, '', '2013-05-02 01:23:06', 'ruslan', 'ruslanbanah@gmail.com', 'ghkjgkjhgkjh', 1, '192.168.0.104'),
	(27, NULL, 1, 'News', 1, '', '2013-05-02 01:24:03', 'ruslan', 'ruslanbanah@gmail.com', '67098790870987', 1, '192.168.0.104'),
	(28, NULL, 1, 'News', 6, '', '2013-05-02 01:25:44', 'ruslan', 'ruslanbanah@gmail.com', 'yyyhgjhgkjhgkjh', 1, '192.168.0.104'),
	(29, NULL, 1, 'News', 6, '', '2013-05-02 01:26:56', 'ruslan', 'ruslanbanah@gmail.com', 'ghjkgkjhgkjhgkjhgj', 1, '192.168.0.104'),
	(30, NULL, 1, 'News', 1, '', '2013-05-02 01:28:14', 'ruslan', 'ruslanbanah@gmail.com', 'jhlkjhlkjhlkjhlkjh', 1, '192.168.0.104'),
	(31, NULL, 1, 'News', 7, '', '2013-05-02 01:29:19', 'ruslan', 'ruslanbanah@gmail.com', 'ghj,f', 1, '192.168.0.104'),
	(32, NULL, 1, 'News', 7, '', '2013-05-02 01:29:47', 'ruslan', 'ruslanbanah@gmail.com', 'iup oi j;lk; lkj; lkj ;lkj ;lkj ;lkj ;lkj ;lkj', 1, '192.168.0.104'),
	(33, NULL, 1, 'News', 7, '', '2013-05-02 01:32:37', 'ruslan', 'ruslanbanah@gmail.com', 'hjgkjhgkhg', 1, '192.168.0.104'),
	(34, NULL, 1, 'News', 4, '', '2013-05-02 01:32:55', 'ruslan', 'ruslanbanah@gmail.com', 'проба коментувати', 1, '192.168.0.104'),
	(35, NULL, 1, 'News', 3, '', '2013-05-02 01:33:09', 'ruslan', 'ruslanbanah@gmail.com', 'мечі бомбові', 1, '192.168.0.104'),
	(36, NULL, 1, 'News', 1, '', '2013-05-02 01:48:55', 'ruslan', 'ruslanbanah@gmail.com', 'dfasdfasdfasdf', 1, '192.168.0.104');
/*!40000 ALTER TABLE `yupe_comment_comment` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_contentblock_content_block
DROP TABLE IF EXISTS `yupe_contentblock_content_block`;
CREATE TABLE IF NOT EXISTS `yupe_contentblock_content_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_contentblock_content_block_code` (`code`),
  KEY `ix_yupe_contentblock_content_block_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_contentblock_content_block: ~0 rows (approximately)
DELETE FROM `yupe_contentblock_content_block`;
/*!40000 ALTER TABLE `yupe_contentblock_content_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_contentblock_content_block` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_dictionary_dictionary_data
DROP TABLE IF EXISTS `yupe_dictionary_dictionary_data`;
CREATE TABLE IF NOT EXISTS `yupe_dictionary_dictionary_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_dictionary_dictionary_data_code_unique` (`code`),
  KEY `ix_yupe_dictionary_dictionary_data_group_id` (`group_id`),
  KEY `ix_yupe_dictionary_dictionary_data_create_user_id` (`create_user_id`),
  KEY `ix_yupe_dictionary_dictionary_data_update_user_id` (`update_user_id`),
  KEY `ix_yupe_dictionary_dictionary_data_status` (`status`),
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_data_group_id` FOREIGN KEY (`group_id`) REFERENCES `yupe_dictionary_dictionary_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_dictionary_dictionary_data: ~0 rows (approximately)
DELETE FROM `yupe_dictionary_dictionary_data`;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_data` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_dictionary_dictionary_group
DROP TABLE IF EXISTS `yupe_dictionary_dictionary_group`;
CREATE TABLE IF NOT EXISTS `yupe_dictionary_dictionary_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_dictionary_dictionary_group_code` (`code`),
  KEY `ix_yupe_dictionary_dictionary_group_create_user_id` (`create_user_id`),
  KEY `ix_yupe_dictionary_dictionary_group_update_user_id` (`update_user_id`),
  CONSTRAINT `fk_yupe_dictionary_dictionary_group_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_dictionary_dictionary_group_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_dictionary_dictionary_group: ~0 rows (approximately)
DELETE FROM `yupe_dictionary_dictionary_group`;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_group` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_feedback_feedback
DROP TABLE IF EXISTS `yupe_feedback_feedback`;
CREATE TABLE IF NOT EXISTS `yupe_feedback_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `answer_user` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `theme` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_date` datetime DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_feedback_feedback_category` (`category_id`),
  KEY `ix_yupe_feedback_feedback_type` (`type`),
  KEY `ix_yupe_feedback_feedback_status` (`status`),
  KEY `ix_yupe_feedback_feedback_isfaq` (`is_faq`),
  KEY `ix_yupe_feedback_feedback_answer_user` (`answer_user`),
  CONSTRAINT `fk_yupe_feedback_feedback_answer_user` FOREIGN KEY (`answer_user`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_feedback_feedback_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_feedback_feedback: ~0 rows (approximately)
DELETE FROM `yupe_feedback_feedback`;
/*!40000 ALTER TABLE `yupe_feedback_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_feedback_feedback` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_gallery_gallery
DROP TABLE IF EXISTS `yupe_gallery_gallery`;
CREATE TABLE IF NOT EXISTS `yupe_gallery_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_yupe_gallery_gallery_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_gallery_gallery: ~1 rows (approximately)
DELETE FROM `yupe_gallery_gallery`;
/*!40000 ALTER TABLE `yupe_gallery_gallery` DISABLE KEYS */;
INSERT INTO `yupe_gallery_gallery` (`id`, `name`, `description`, `status`) VALUES
	(1, 'Галерея фото', '<p>галерея<br></p>', 1);
/*!40000 ALTER TABLE `yupe_gallery_gallery` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_gallery_image_to_gallery
DROP TABLE IF EXISTS `yupe_gallery_image_to_gallery`;
CREATE TABLE IF NOT EXISTS `yupe_gallery_image_to_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_gallery_image_to_gallery_gallery_to_image` (`image_id`,`gallery_id`),
  KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_image` (`image_id`),
  KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_gallery` (`gallery_id`),
  CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `yupe_gallery_gallery` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_image` FOREIGN KEY (`image_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_gallery_image_to_gallery: ~0 rows (approximately)
DELETE FROM `yupe_gallery_image_to_gallery`;
/*!40000 ALTER TABLE `yupe_gallery_image_to_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_gallery_image_to_gallery` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_image_image
DROP TABLE IF EXISTS `yupe_image_image`;
CREATE TABLE IF NOT EXISTS `yupe_image_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `file` varchar(250) NOT NULL,
  `creation_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alt` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_yupe_image_image_status` (`status`),
  KEY `ix_yupe_image_image_user` (`user_id`),
  KEY `ix_yupe_image_image_type` (`type`),
  KEY `ix_yupe_image_image_category_id` (`category_id`),
  KEY `fk_yupe_image_image_parent_id` (`parent_id`),
  CONSTRAINT `fk_yupe_image_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_image_image_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_image_image_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_image_image: ~1 rows (approximately)
DELETE FROM `yupe_image_image`;
/*!40000 ALTER TABLE `yupe_image_image` DISABLE KEYS */;
INSERT INTO `yupe_image_image` (`id`, `category_id`, `parent_id`, `name`, `description`, `file`, `creation_date`, `user_id`, `alt`, `type`, `status`) VALUES
	(1, NULL, NULL, 'ліжко', '', '0bc108e792c9ec6d56d8e4abc132db92.jpg', '2013-04-25 00:59:16', 1, 'ligko', 0, 1);
/*!40000 ALTER TABLE `yupe_image_image` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_login
DROP TABLE IF EXISTS `yupe_login`;
CREATE TABLE IF NOT EXISTS `yupe_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `identity_id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yupe_social_identity_uniq` (`identity_id`),
  KEY `yupe_social_user_id` (`user_id`),
  KEY `yupe_social_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_login: ~0 rows (approximately)
DELETE FROM `yupe_login`;
/*!40000 ALTER TABLE `yupe_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_login` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_mail_mail_event
DROP TABLE IF EXISTS `yupe_mail_mail_event`;
CREATE TABLE IF NOT EXISTS `yupe_mail_mail_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_mail_mail_event_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_mail_mail_event: ~0 rows (approximately)
DELETE FROM `yupe_mail_mail_event`;
/*!40000 ALTER TABLE `yupe_mail_mail_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_mail_mail_event` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_mail_mail_template
DROP TABLE IF EXISTS `yupe_mail_mail_template`;
CREATE TABLE IF NOT EXISTS `yupe_mail_mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `theme` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_mail_mail_template_code` (`code`),
  KEY `ix_yupe_mail_mail_template_status` (`status`),
  KEY `ix_yupe_mail_mail_template_event_id` (`event_id`),
  CONSTRAINT `fk_yupe_mail_mail_template_event_id` FOREIGN KEY (`event_id`) REFERENCES `yupe_mail_mail_event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_mail_mail_template: ~0 rows (approximately)
DELETE FROM `yupe_mail_mail_template`;
/*!40000 ALTER TABLE `yupe_mail_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_mail_mail_template` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_menu_menu
DROP TABLE IF EXISTS `yupe_menu_menu`;
CREATE TABLE IF NOT EXISTS `yupe_menu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_menu_menu_code` (`code`),
  KEY `ix_yupe_menu_menu_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_menu_menu: ~2 rows (approximately)
DELETE FROM `yupe_menu_menu`;
/*!40000 ALTER TABLE `yupe_menu_menu` DISABLE KEYS */;
INSERT INTO `yupe_menu_menu` (`id`, `name`, `code`, `description`, `status`) VALUES
	(1, 'Верхнее меню', 'top_uk', 'Основное меню сайта, расположенное сверху в блоке mainmenu.', 1),
	(2, 'English menu', 'top_en', 'English menu', 1);
/*!40000 ALTER TABLE `yupe_menu_menu` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_menu_menu_item
DROP TABLE IF EXISTS `yupe_menu_menu_item`;
CREATE TABLE IF NOT EXISTS `yupe_menu_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `regular_link` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `href` varchar(150) NOT NULL,
  `class` varchar(150) NOT NULL,
  `title_attr` varchar(150) NOT NULL,
  `before_link` varchar(150) NOT NULL,
  `after_link` varchar(150) NOT NULL,
  `target` varchar(150) NOT NULL,
  `rel` varchar(150) NOT NULL,
  `condition_name` varchar(150) DEFAULT '0',
  `condition_denial` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_yupe_menu_menu_item_menu_id` (`menu_id`),
  KEY `ix_yupe_menu_menu_item_sort` (`sort`),
  KEY `ix_yupe_menu_menu_item_status` (`status`),
  CONSTRAINT `fk_yupe_menu_menu_item_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `yupe_menu_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_menu_menu_item: ~16 rows (approximately)
DELETE FROM `yupe_menu_menu_item`;
/*!40000 ALTER TABLE `yupe_menu_menu_item` DISABLE KEYS */;
INSERT INTO `yupe_menu_menu_item` (`id`, `parent_id`, `menu_id`, `regular_link`, `title`, `href`, `class`, `title_attr`, `before_link`, `after_link`, `target`, `rel`, `condition_name`, `condition_denial`, `sort`, `status`) VALUES
	(1, 0, 1, 0, 'Про нас', '#', '', 'Главная страница сайта', '', '', '', '', '', 0, 1, 1),
	(2, 0, 1, 0, 'Ресторан', '#', '', 'Блоги', '', '', '', '', '', 0, 2, 1),
	(4, 0, 1, 0, 'Музей зброї', '#', '', 'Пользователи', '', '', '', '', '', 0, 3, 1),
	(6, 0, 1, 0, 'Дегустації', '#', '', 'Контакты', '', '', '', '', '', 0, 6, 1),
	(7, 0, 1, 0, 'Блоги', '#', '', '', '', '', '', '', '', 0, 9, 1),
	(10, 0, 1, 0, 'Контакти', '#', '', '', '', '', '', '', '', 0, 10, 1),
	(12, 0, 1, 0, 'Музика', '#', '', 'FAQ', '', '', '', '', '', 0, 7, 1),
	(13, 0, 1, 0, 'Новини', '#', '', 'Контакты', '', '', '', '', '', 0, 7, 1),
	(14, 0, 2, 0, 'Restaurant', '#', '', '', '', '', '', '', '', 0, 14, 1),
	(15, 0, 2, 0, 'About', '#', '', '', '', '', '', '', '', 0, 15, 1),
	(16, 0, 2, 0, 'Museum of Weapons', '#', '', '', '', '', '', '', '', 0, 16, 1),
	(17, 0, 2, 0, 'Tastings', '#', '', '', '', '', '', '', '', 0, 17, 1),
	(18, 0, 2, 0, 'Music', '#', '', '', '', '', '', '', '', 0, 18, 1),
	(19, 0, 2, 0, 'News', '#', '', '', '', '', '', '', '', 0, 19, 1),
	(20, 0, 2, 0, 'Blogs', '#', '', '', '', '', '', '', '', 0, 20, 1),
	(21, 0, 2, 0, 'Contacts', '#', '', '', '', '', '', '', '', 0, 21, 1);
/*!40000 ALTER TABLE `yupe_menu_menu_item` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_migrations
DROP TABLE IF EXISTS `yupe_migrations`;
CREATE TABLE IF NOT EXISTS `yupe_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_migrations_module` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_migrations: ~21 rows (approximately)
DELETE FROM `yupe_migrations`;
/*!40000 ALTER TABLE `yupe_migrations` DISABLE KEYS */;
INSERT INTO `yupe_migrations` (`id`, `module`, `version`, `apply_time`) VALUES
	(1, 'user', 'm000000_000000_user_base', 1366840579),
	(2, 'yupe', 'm000000_000000_yupe_base', 1366840581),
	(3, 'category', 'm000000_000000_category_base', 1366840583),
	(4, 'image', 'm000000_000000_image_base', 1366840586),
	(5, 'comment', 'm000000_000000_comment_base', 1366840589),
	(6, 'news', 'm000000_000000_news_base', 1366840592),
	(7, 'page', 'm000000_000000_page_base', 1366840595),
	(8, 'page', 'm130115_155600_columns_rename', 1366840596),
	(9, 'yeeki', 'm000000_000000_yeeki_base', 1366840600),
	(10, 'menu', 'm000000_000000_menu_base', 1366840603),
	(11, 'menu', 'm121220_001126_menu_test_data', 1366840603),
	(12, 'queue', 'm000000_000000_queue_base', 1366840604),
	(13, 'gallery', 'm000000_000000_gallery_base', 1366840607),
	(14, 'contentblock', 'm000000_000000_contentblock_base', 1366840608),
	(15, 'catalog', 'm000000_000000_good_base', 1366840612),
	(16, 'dictionary', 'm000000_000000_dictionary_base', 1366840616),
	(17, 'blog', 'm000000_000000_blog_base', 1366840628),
	(18, 'feedback', 'm000000_000000_feedback_base', 1366840632),
	(19, 'mail', 'm000000_000000_mail_base', 1366840634),
	(20, 'social', 'm000000_000000_social_base', 0),
	(21, 'social', 'm000000_000000_social_base', 0);
/*!40000 ALTER TABLE `yupe_migrations` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_news_news
DROP TABLE IF EXISTS `yupe_news_news`;
CREATE TABLE IF NOT EXISTS `yupe_news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `alias` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_news_news_alias_lang` (`alias`,`lang`),
  KEY `ix_yupe_news_news_status` (`status`),
  KEY `ix_yupe_news_news_user_id` (`user_id`),
  KEY `ix_yupe_news_news_category_id` (`category_id`),
  KEY `ix_yupe_news_news_date` (`date`),
  CONSTRAINT `fk_yupe_news_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_news_news_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_news_news: ~34 rows (approximately)
DELETE FROM `yupe_news_news`;
/*!40000 ALTER TABLE `yupe_news_news` DISABLE KEYS */;
INSERT INTO `yupe_news_news` (`id`, `category_id`, `lang`, `creation_date`, `change_date`, `date`, `title`, `alias`, `short_text`, `full_text`, `image`, `link`, `user_id`, `status`, `is_protected`, `keywords`, `description`) VALUES
	(1, 4, 'uk', '2013-04-27 19:41:47', '2013-04-27 19:41:47', '2013-04-27', 'Гарячі страви', 'food', '', '<p>У ресторані готують лише&nbsp; здорову їжу з якісних та свіжих продуктів.<br></p>', 'fa053f76468a9a198ceb6a5d1d5ec259.jpg', '', 1, 1, 0, '', ''),
	(2, 6, 'uk', '2013-04-27 19:55:50', '2013-04-27 20:01:18', '2013-04-27', 'мечі, шаблі, кинжали', 'mechi', '', '<p>&nbsp;<br></p>', 'dce4a78ca63cc32920732ee34696dfdc.jpg', '', 1, 1, 0, '', ''),
	(3, 6, 'uk', '2013-04-27 19:58:14', '2013-04-27 20:00:45', '2013-04-27', 'Щити та шоломи', 'shilds', '', '<p>&nbsp;<br></p>', '0a630ab1ea24b0a088deb3e13807400f.jpg', '', 1, 1, 0, '', ''),
	(4, 6, 'uk', '2013-04-27 19:59:08', '2013-04-27 20:02:42', '2013-04-27', 'Булави та сокири', 'bulavy', '', '<p>&nbsp;<br></p>', '04b4bffd48e35f0c7e97d585c5b16465.jpg', '', 1, 1, 0, '', ''),
	(5, 6, 'uk', '2013-04-27 20:02:21', '2013-04-27 20:02:21', '2013-04-27', 'Алебарди та списи', 'arbalets', '', '<p>&nbsp; <br></p>', '64d5ae33938dc9a23286709fe1cf46fa.jpg', '', 1, 1, 0, '', ''),
	(6, 4, 'uk', '2013-04-27 20:10:38', '2013-04-27 20:13:53', '2013-04-27', 'Hot food', 'strawa1', '', '<p>У ресторані готують лише&nbsp; здорову їжу з якісних та свіжих продуктів.<br></p>', '7ae1768a0be0026298550ad37e93a7c2.jpg', '', 1, 1, 0, '', ''),
	(7, 4, 'uk', '2013-04-27 20:11:15', '2013-04-27 20:11:15', '2013-04-27', 'Гарячі страви', 'strawa2', '', '<p>У ресторані готують лише&nbsp; здорову їжу з якісних та свіжих продуктів.<br></p>', '75f074969dd6aed4bbdf69885a0897eb.jpg', '', 1, 1, 0, '', ''),
	(8, 4, 'uk', '2013-04-27 20:11:45', '2013-04-27 20:11:45', '2013-04-27', 'Гарячі страви', 'strawa3', '', '<p>У ресторані готують лише&nbsp; здорову їжу з якісних та свіжих продуктів.<br></p>', '9a2c69a9455c4e9493e3e081eefa20f4.jpg', '', 1, 1, 0, '', ''),
	(9, 7, 'uk', '2013-04-27 20:30:23', '2013-04-27 20:30:23', '2013-04-27', 'Дегустація "Червоні вина Європи"', 'tasting', '', '<p>&nbsp;<br></p>', 'b601386283790c11f6b65a790ef11b60.jpg', '', 1, 1, 0, '', ''),
	(10, 8, 'uk', '2013-04-27 20:43:57', '2013-04-27 20:43:57', '2013-04-27', 'Вишукана музика від  "Complimenti"', 'Complimenti', '', '<p><p></p><div><span>Вишукана музика від </span><p></p><p></p><p><span> "Complimenti"</span></p></div><br></p>', 'c9c505e74f34abda41a0f9bb4453f8c6.jpg', '', 1, 1, 0, '', ''),
	(11, 9, 'uk', '2013-04-27 21:10:48', '2013-04-27 21:10:48', '2013-04-27', 'Розчинна кава: шкода чи користь.', 'coffe', '', '<p>&nbsp;<br></p>', '6198c4ab952c40f21b4bdc79c835b164.jpg', '', 1, 1, 0, '', ''),
	(12, 9, 'uk', '2013-04-27 22:05:09', '2013-04-27 22:05:09', '2013-05-05', 'Великдень', 'paska', '', '<p>Великдень<br></p>', 'b81463b312c12e86a8f03ade2ac73557.jpg', '', 1, 1, 0, '', ''),
	(13, 4, 'uk', '2013-04-28 19:25:18', '2013-04-28 19:25:18', '2013-04-28', 'новина яка має показатись на 2 сторінці', 'page2', '', '<p>новина на другій сторінці<br></p>', 'e3ff208eafc2c98ecd13a4860db3e5c1.jpg', '', 1, 1, 0, '', ''),
	(14, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust2', '', '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(15, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust3', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(17, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust4', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(18, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust5', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(20, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust6', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(21, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust7', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(22, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust8', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(24, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust9', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(25, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust10', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(26, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust11', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(27, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust12', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(28, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust13', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(29, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust14', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(31, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust15', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(32, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust16', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(33, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust17', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(34, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust18', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(35, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust19', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(36, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust20', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(37, 7, 'uk', '2013-04-28 19:45:55', '2013-04-28 19:45:55', '2013-04-28', 'дегустація 2', 'degust21', NULL, '<p>dugusy<br></p>', 'f1dc72067edba2d3b8688b9a78c1face.jpg', '', 1, 1, 0, '', ''),
	(38, 14, 'en', '2013-04-27 19:41:47', '2013-05-09 02:10:40', '2013-04-27', 'Hot food', 'food', '', '<p><span>The restaurant serves only healthy food with quality and fresh ingredients.</span><br></p>', 'fa053f76468a9a198ceb6a5d1d5ec259.jpg', '', 1, 1, 0, '', '');
/*!40000 ALTER TABLE `yupe_news_news` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_page_page
DROP TABLE IF EXISTS `yupe_page_page`;
CREATE TABLE IF NOT EXISTS `yupe_page_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  `title_short` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `body` text NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_page_page_slug_lang` (`slug`,`lang`),
  KEY `ix_yupe_page_page_status` (`status`),
  KEY `ix_yupe_page_page_is_protected` (`is_protected`),
  KEY `ix_yupe_page_page_user_id` (`user_id`),
  KEY `ix_yupe_page_page_change_user_id` (`change_user_id`),
  KEY `ix_yupe_page_page_menu_order` (`order`),
  KEY `ix_yupe_page_page_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_page_page_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_page_page_change_user_id` FOREIGN KEY (`change_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_yupe_page_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_page_page: ~5 rows (approximately)
DELETE FROM `yupe_page_page`;
/*!40000 ALTER TABLE `yupe_page_page` DISABLE KEYS */;
INSERT INTO `yupe_page_page` (`id`, `category_id`, `lang`, `parent_id`, `creation_date`, `change_date`, `user_id`, `change_user_id`, `title_short`, `title`, `slug`, `body`, `keywords`, `description`, `status`, `is_protected`, `order`) VALUES
	(1, 4, 'uk', NULL, '2013-04-28 20:01:37', '2013-04-28 20:18:52', 1, 1, 'menu_link menu_01', 'МЕНЮ', 'menu1', '<ol><li>Смачна страва 1</li><li>Смачна страва 2<br></li><li>Смачна страва 3<br></li><li>Смачна страва 4<br></li><li>Смачна страва 5<br></li><li>Смачна страва 6<br></li><li>Смачна страва 7<br></li></ol>', '', '', 1, 0, 0),
	(2, 4, 'uk', NULL, '2013-04-28 20:32:14', '2013-04-28 20:32:14', 1, 1, 'menu_link menu_02', 'Основне меню', 'osnovne-menyu', '<p>menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02menu_link menu_02<br></p>', '', '', 1, 0, 0),
	(3, 4, 'uk', NULL, '2013-04-28 20:32:47', '2013-04-28 20:33:49', 1, 1, 'menu_link menu_03', 'Українське меню', 'ukranske-menyu', '<p>Українське меню<br></p>', '', '', 1, 0, 0),
	(4, 4, 'uk', NULL, '2013-04-28 20:33:30', '2013-04-28 20:33:30', 1, 1, 'menu_link menu_04', 'Карта напоїв', 'karta-napov', '<p>menu_link menu_02<br></p>', '', '', 1, 0, 0),
	(5, 7, 'uk', NULL, '2013-05-01 20:03:42', '2013-05-01 20:08:23', 1, 1, 'pravila', 'Правила отримання членської картки', 'pravila-otrimannya-chlensko-kartki-', 'Правила отримання членської картки', '', '', 1, 0, 0);
/*!40000 ALTER TABLE `yupe_page_page` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_queue_queue
DROP TABLE IF EXISTS `yupe_queue_queue`;
CREATE TABLE IF NOT EXISTS `yupe_queue_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `task` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_queue_queue_worker` (`worker`),
  UNIQUE KEY `ux_yupe_queue_queue_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_queue_queue: ~0 rows (approximately)
DELETE FROM `yupe_queue_queue`;
/*!40000 ALTER TABLE `yupe_queue_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_queue_queue` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_user_recovery_password
DROP TABLE IF EXISTS `yupe_user_recovery_password`;
CREATE TABLE IF NOT EXISTS `yupe_user_recovery_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `code` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_user_recovery_password_code` (`code`),
  KEY `ix_yupe_user_recovery_password_user_id` (`user_id`),
  CONSTRAINT `fk_yupe_user_recovery_password_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_user_recovery_password: ~0 rows (approximately)
DELETE FROM `yupe_user_recovery_password`;
/*!40000 ALTER TABLE `yupe_user_recovery_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_user_recovery_password` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_user_user
DROP TABLE IF EXISTS `yupe_user_user`;
CREATE TABLE IF NOT EXISTS `yupe_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `nick_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `site` varchar(250) NOT NULL DEFAULT '',
  `about` varchar(250) NOT NULL DEFAULT '',
  `location` varchar(250) NOT NULL DEFAULT '',
  `online_status` varchar(250) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `salt` char(32) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `access_level` int(11) NOT NULL DEFAULT '0',
  `last_visit` datetime DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `registration_ip` varchar(50) NOT NULL,
  `activation_ip` varchar(50) NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `use_gravatar` tinyint(1) NOT NULL DEFAULT '1',
  `activate_key` char(32) NOT NULL,
  `email_confirm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_user_user_nick_name` (`nick_name`),
  UNIQUE KEY `ux_yupe_user_user_email` (`email`),
  KEY `ix_yupe_user_user_status` (`status`),
  KEY `ix_yupe_user_user_email_confirm` (`email_confirm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_user_user: ~1 rows (approximately)
DELETE FROM `yupe_user_user`;
/*!40000 ALTER TABLE `yupe_user_user` DISABLE KEYS */;
INSERT INTO `yupe_user_user` (`id`, `creation_date`, `change_date`, `first_name`, `middle_name`, `last_name`, `nick_name`, `email`, `gender`, `birth_date`, `site`, `about`, `location`, `online_status`, `password`, `salt`, `status`, `access_level`, `last_visit`, `registration_date`, `registration_ip`, `activation_ip`, `avatar`, `use_gravatar`, `activate_key`, `email_confirm`) VALUES
	(1, '2013-04-25 00:57:49', '2013-04-25 00:57:49', '', '', '', 'ruslan', 'ruslanbanah@gmail.com', 0, NULL, '', '', '', '', 'f8c4a3c05260174b6b72cb165287e9a4', '69c11cae3712dda84275706a4faa1761', 1, 1, '2013-05-10 01:04:54', '2013-04-25 00:57:49', '192.168.0.104', '192.168.0.104', NULL, 1, '44c27c3652afd6c3ee0085b1fd136cb7', 1);
/*!40000 ALTER TABLE `yupe_user_user` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_wiki_wiki_link
DROP TABLE IF EXISTS `yupe_wiki_wiki_link`;
CREATE TABLE IF NOT EXISTS `yupe_wiki_wiki_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_from_id` int(11) NOT NULL,
  `page_to_id` int(11) DEFAULT NULL,
  `wiki_uid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_wiki_wiki_link_code_unique` (`page_from_id`),
  KEY `ix_yupe_wiki_wiki_link_status` (`page_to_id`),
  KEY `ix_yupe_wiki_wiki_link_uid` (`wiki_uid`),
  CONSTRAINT `fk_yupe_wiki_wiki_link_page_from_fk` FOREIGN KEY (`page_from_id`) REFERENCES `yupe_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_wiki_wiki_link_page_to_fk` FOREIGN KEY (`page_to_id`) REFERENCES `yupe_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_wiki_wiki_link: ~0 rows (approximately)
DELETE FROM `yupe_wiki_wiki_link`;
/*!40000 ALTER TABLE `yupe_wiki_wiki_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_wiki_wiki_link` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_wiki_wiki_page
DROP TABLE IF EXISTS `yupe_wiki_wiki_page`;
CREATE TABLE IF NOT EXISTS `yupe_wiki_wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_redirect` tinyint(1) DEFAULT '0',
  `page_uid` varchar(250) DEFAULT NULL,
  `namespace` varchar(250) DEFAULT NULL,
  `content` text,
  `revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_wiki_wiki_page_revision_id` (`revision_id`),
  KEY `ix_yupe_wiki_wiki_page_user_id` (`user_id`),
  KEY `ix_yupe_wiki_wiki_page_namespace` (`namespace`),
  KEY `ix_yupe_wiki_wiki_page_created_at` (`created_at`),
  KEY `ix_yupe_wiki_wiki_page_updated_at` (`updated_at`),
  CONSTRAINT `fk_yupe_wiki_wiki_page_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `yupe_wiki_wiki_page_revision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_wiki_wiki_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_wiki_wiki_page: ~0 rows (approximately)
DELETE FROM `yupe_wiki_wiki_page`;
/*!40000 ALTER TABLE `yupe_wiki_wiki_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_wiki_wiki_page` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_wiki_wiki_page_revision
DROP TABLE IF EXISTS `yupe_wiki_wiki_page_revision`;
CREATE TABLE IF NOT EXISTS `yupe_wiki_wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `is_minor` tinyint(1) DEFAULT NULL,
  `content` text,
  `user_id` varchar(250) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_wiki_wiki_page_revision_pageid` (`page_id`),
  CONSTRAINT `fk_yupe_wiki_wiki_page_revision_page` FOREIGN KEY (`page_id`) REFERENCES `yupe_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_wiki_wiki_page_revision: ~0 rows (approximately)
DELETE FROM `yupe_wiki_wiki_page_revision`;
/*!40000 ALTER TABLE `yupe_wiki_wiki_page_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_wiki_wiki_page_revision` ENABLE KEYS */;


-- Dumping structure for table yupe.yupe_yupe_settings
DROP TABLE IF EXISTS `yupe_yupe_settings`;
CREATE TABLE IF NOT EXISTS `yupe_yupe_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(100) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_value` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_yupe_settings_module_id_param_name` (`module_id`,`param_name`),
  KEY `ix_yupe_yupe_settings_module_id` (`module_id`),
  KEY `ix_yupe_yupe_settings_param_name` (`param_name`),
  KEY `fk_yupe_yupe_settings_user_id` (`user_id`),
  CONSTRAINT `fk_yupe_yupe_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table yupe.yupe_yupe_settings: ~16 rows (approximately)
DELETE FROM `yupe_yupe_settings`;
/*!40000 ALTER TABLE `yupe_yupe_settings` DISABLE KEYS */;
INSERT INTO `yupe_yupe_settings` (`id`, `module_id`, `param_name`, `param_value`, `creation_date`, `change_date`, `user_id`, `type`) VALUES
	(1, 'yupe', 'siteDescription', 'Юпи! - самый быстрый способ создать сайт на Yii', '2013-04-25 00:58:01', '2013-04-25 00:58:01', 1, 1),
	(2, 'yupe', 'siteName', 'Юпи!', '2013-04-25 00:58:01', '2013-04-25 00:58:01', 1, 1),
	(3, 'yupe', 'siteKeyWords', 'Юпи!, yupe, yii, cms, цмс', '2013-04-25 00:58:01', '2013-04-25 00:58:01', 1, 1),
	(4, 'yupe', 'email', 'ruslanbanah@gmail.com', '2013-04-25 00:58:01', '2013-04-25 00:58:01', 1, 1),
	(5, 'yupe', 'theme', 'arsenal', '2013-04-25 00:58:01', '2013-04-28 21:11:42', 1, 1),
	(6, 'yupe', 'backendTheme', '', '2013-04-25 00:58:01', '2013-04-25 00:58:01', 1, 1),
	(7, 'yupe', 'coreCacheTime', '3600', '2013-04-27 01:28:33', '2013-04-27 01:28:33', 1, 1),
	(8, 'yupe', 'backendLayout', 'column2', '2013-04-27 01:28:33', '2013-04-27 17:45:06', 1, 1),
	(9, 'yupe', 'editorsDir', 'application.modules.yupe.widgets.editors', '2013-04-27 01:28:33', '2013-04-27 01:28:33', 1, 1),
	(10, 'yupe', 'uploadPath', 'uploads', '2013-04-27 01:28:33', '2013-04-27 01:28:33', 1, 1),
	(11, 'yupe', 'editor', 'application.modules.yupe.widgets.editors.imperaviRedactor.ImperaviRedactorWidget', '2013-04-27 01:28:33', '2013-04-27 01:28:33', 1, 1),
	(12, 'yupe', 'availableLanguages', 'uk,en', '2013-04-27 01:28:33', '2013-04-27 01:28:59', 1, 1),
	(13, 'yupe', 'defaultLanguage', 'uk', '2013-04-27 01:28:33', '2013-04-27 01:29:14', 1, 1),
	(14, 'yupe', 'defaultBackendLanguage', 'uk', '2013-04-27 01:28:33', '2013-04-27 01:29:14', 1, 1),
	(15, 'yupe', 'updateChannel', 'release', '2013-04-27 01:28:33', '2013-04-27 01:28:33', 1, 1),
	(16, 'news', 'pageSize', '50', '2013-05-09 01:55:59', '2013-05-09 01:55:59', 1, 2);
/*!40000 ALTER TABLE `yupe_yupe_settings` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
