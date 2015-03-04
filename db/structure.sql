-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: minang_dunia
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article_categories`
--

DROP TABLE IF EXISTS `article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `author_id` int(11) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `excerp` text,
  `feat_img` varchar(155) DEFAULT NULL,
  `comment_status` varchar(3) NOT NULL DEFAULT 'yes' COMMENT 'yes or no',
  `publish_status` varchar(20) NOT NULL DEFAULT 'Publish' COMMENT 'pilihan: draft, publish',
  `publish_visibility` varchar(10) NOT NULL DEFAULT 'Public' COMMENT 'pilihan: public, private',
  `article_type` varchar(10) DEFAULT 'Article' COMMENT 'article or page',
  `article_vcount` int(11) NOT NULL COMMENT 'Article view count',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) DEFAULT NULL,
  `cat_description` varchar(255) DEFAULT NULL,
  `cat_slug` varchar(255) DEFAULT NULL,
  `cat_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discusses`
--

DROP TABLE IF EXISTS `discusses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `dis_body` varchar(255) DEFAULT NULL,
  `dis_approve` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_storage_name` varchar(100) DEFAULT NULL,
  `med_url` varchar(500) DEFAULT NULL,
  `med_title` varchar(255) DEFAULT NULL,
  `med_caption` varchar(255) DEFAULT NULL,
  `med_alt` varchar(255) DEFAULT NULL,
  `med_description` varchar(255) DEFAULT NULL,
  `med_author_id` int(11) DEFAULT NULL,
  `gallery` varchar(3) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) DEFAULT NULL,
  `site_description` varchar(255) DEFAULT NULL,
  `site_domain` varchar(255) DEFAULT NULL,
  `site_menu` text,
  `site_menu_draft` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_exts`
--

DROP TABLE IF EXISTS `user_exts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_short` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `full_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_article_categories`
--

DROP TABLE IF EXISTS `v_article_categories`;
/*!50001 DROP VIEW IF EXISTS `v_article_categories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_article_categories` (
  `id` tinyint NOT NULL,
  `article_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `body` tinyint NOT NULL,
  `author_id` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `nick_name` tinyint NOT NULL,
  `permalink` tinyint NOT NULL,
  `excerp` tinyint NOT NULL,
  `feat_img` tinyint NOT NULL,
  `comment_status` tinyint NOT NULL,
  `publish_status` tinyint NOT NULL,
  `publish_visibility` tinyint NOT NULL,
  `article_vcount` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL,
  `category_id` tinyint NOT NULL,
  `cat_name` tinyint NOT NULL,
  `cat_slug` tinyint NOT NULL,
  `cat_count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_articles`
--

DROP TABLE IF EXISTS `v_articles`;
/*!50001 DROP VIEW IF EXISTS `v_articles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_articles` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `body` tinyint NOT NULL,
  `author_id` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `nick_name` tinyint NOT NULL,
  `permalink` tinyint NOT NULL,
  `excerp` tinyint NOT NULL,
  `feat_img` tinyint NOT NULL,
  `comment_status` tinyint NOT NULL,
  `publish_status` tinyint NOT NULL,
  `publish_visibility` tinyint NOT NULL,
  `article_type` tinyint NOT NULL,
  `article_vcount` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_discusses`
--

DROP TABLE IF EXISTS `v_discusses`;
/*!50001 DROP VIEW IF EXISTS `v_discusses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_discusses` (
  `id` tinyint NOT NULL,
  `article_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `permalink` tinyint NOT NULL,
  `excerp` tinyint NOT NULL,
  `feat_img` tinyint NOT NULL,
  `comment_status` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `nick_name` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `dis_body` tinyint NOT NULL,
  `dis_approve` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pages`
--

DROP TABLE IF EXISTS `v_pages`;
/*!50001 DROP VIEW IF EXISTS `v_pages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pages` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `body` tinyint NOT NULL,
  `author_id` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `nick_name` tinyint NOT NULL,
  `permalink` tinyint NOT NULL,
  `excerp` tinyint NOT NULL,
  `feat_img` tinyint NOT NULL,
  `comment_status` tinyint NOT NULL,
  `publish_status` tinyint NOT NULL,
  `publish_visibility` tinyint NOT NULL,
  `article_type` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_article_categories`
--

/*!50001 DROP TABLE IF EXISTS `v_article_categories`*/;
/*!50001 DROP VIEW IF EXISTS `v_article_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_article_categories` AS select `article_categories`.`id` AS `id`,`article_categories`.`article_id` AS `article_id`,`articles`.`title` AS `title`,`articles`.`body` AS `body`,`articles`.`author_id` AS `author_id`,(select `users`.`full_name` from `users` where (`users`.`id` = `articles`.`author_id`)) AS `full_name`,(select `users`.`nick_name` from `users` where (`users`.`id` = `articles`.`author_id`)) AS `nick_name`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`articles`.`publish_status` AS `publish_status`,`articles`.`publish_visibility` AS `publish_visibility`,`articles`.`article_vcount` AS `article_vcount`,`articles`.`created_at` AS `created_at`,`articles`.`updated_at` AS `updated_at`,`article_categories`.`category_id` AS `category_id`,`categories`.`cat_name` AS `cat_name`,`categories`.`cat_slug` AS `cat_slug`,`categories`.`cat_count` AS `cat_count` from ((`article_categories` left join `categories` on((`article_categories`.`category_id` = `categories`.`id`))) left join `articles` on((`article_categories`.`article_id` = `articles`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_articles`
--

/*!50001 DROP TABLE IF EXISTS `v_articles`*/;
/*!50001 DROP VIEW IF EXISTS `v_articles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_articles` AS select `articles`.`id` AS `id`,`articles`.`title` AS `title`,`articles`.`body` AS `body`,`articles`.`author_id` AS `author_id`,`users`.`full_name` AS `full_name`,`users`.`nick_name` AS `nick_name`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`articles`.`publish_status` AS `publish_status`,`articles`.`publish_visibility` AS `publish_visibility`,`articles`.`article_type` AS `article_type`,`articles`.`article_vcount` AS `article_vcount`,`articles`.`created_at` AS `created_at`,`articles`.`updated_at` AS `updated_at` from (`articles` left join `users` on((`articles`.`author_id` = `users`.`id`))) where (`articles`.`article_type` = 'Article') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_discusses`
--

/*!50001 DROP TABLE IF EXISTS `v_discusses`*/;
/*!50001 DROP VIEW IF EXISTS `v_discusses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_discusses` AS select `discusses`.`id` AS `id`,`discusses`.`article_id` AS `article_id`,`articles`.`title` AS `title`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`discusses`.`user_id` AS `user_id`,`users`.`email` AS `email`,`users`.`full_name` AS `full_name`,`users`.`nick_name` AS `nick_name`,`users`.`level` AS `level`,`discusses`.`dis_body` AS `dis_body`,`discusses`.`dis_approve` AS `dis_approve`,`discusses`.`created_at` AS `created_at`,`discusses`.`updated_at` AS `updated_at` from ((`discusses` left join `users` on((`discusses`.`user_id` = `users`.`id`))) left join `articles` on((`discusses`.`article_id` = `articles`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pages`
--

/*!50001 DROP TABLE IF EXISTS `v_pages`*/;
/*!50001 DROP VIEW IF EXISTS `v_pages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pages` AS select `articles`.`id` AS `id`,`articles`.`title` AS `title`,`articles`.`body` AS `body`,`articles`.`author_id` AS `author_id`,`users`.`full_name` AS `full_name`,`users`.`nick_name` AS `nick_name`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`articles`.`publish_status` AS `publish_status`,`articles`.`publish_visibility` AS `publish_visibility`,`articles`.`article_type` AS `article_type`,`articles`.`created_at` AS `created_at`,`articles`.`updated_at` AS `updated_at` from (`articles` left join `users` on((`articles`.`author_id` = `users`.`id`))) where (`articles`.`article_type` = 'Page') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-20  8:37:27
INSERT INTO schema_migrations (version) VALUES ('20141230104903');

INSERT INTO schema_migrations (version) VALUES ('20141230120303');

INSERT INTO schema_migrations (version) VALUES ('20141231002723');

INSERT INTO schema_migrations (version) VALUES ('20141231002724');

INSERT INTO schema_migrations (version) VALUES ('20150101171600');

INSERT INTO schema_migrations (version) VALUES ('20150101171601');

INSERT INTO schema_migrations (version) VALUES ('20150101171602');

INSERT INTO schema_migrations (version) VALUES ('20150101171603');

INSERT INTO schema_migrations (version) VALUES ('20150101171604');

INSERT INTO schema_migrations (version) VALUES ('20150117020829');

INSERT INTO schema_migrations (version) VALUES ('20150117020830');

INSERT INTO schema_migrations (version) VALUES ('20150120013430');

INSERT INTO schema_migrations (version) VALUES ('20150120013704');

