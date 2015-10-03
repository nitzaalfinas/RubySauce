-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: xrubysauce_dev
-- ------------------------------------------------------
-- Server version	5.6.26

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
  `article_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `author_id` bigint(20) DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerp` text COLLATE utf8_unicode_ci,
  `feat_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_status` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_visibility` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_vcount` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `dis_body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dis_approve` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_storage_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `med_author_id` bigint(20) DEFAULT NULL,
  `gallery` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'avatar-no.png',
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_article_categories`
--

DROP TABLE IF EXISTS `v_article_categories`;
/*!50001 DROP VIEW IF EXISTS `v_article_categories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_article_categories` AS SELECT 
 1 AS `id`,
 1 AS `article_id`,
 1 AS `title`,
 1 AS `body`,
 1 AS `author_id`,
 1 AS `full_name`,
 1 AS `nick_name`,
 1 AS `permalink`,
 1 AS `excerp`,
 1 AS `feat_img`,
 1 AS `comment_status`,
 1 AS `publish_status`,
 1 AS `publish_visibility`,
 1 AS `article_vcount`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `category_id`,
 1 AS `cat_name`,
 1 AS `cat_slug`,
 1 AS `cat_count`,
 1 AS `article_all`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_articles`
--

DROP TABLE IF EXISTS `v_articles`;
/*!50001 DROP VIEW IF EXISTS `v_articles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_articles` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `body`,
 1 AS `author_id`,
 1 AS `full_name`,
 1 AS `nick_name`,
 1 AS `permalink`,
 1 AS `excerp`,
 1 AS `feat_img`,
 1 AS `comment_status`,
 1 AS `publish_status`,
 1 AS `publish_visibility`,
 1 AS `article_type`,
 1 AS `article_vcount`,
 1 AS `article_all`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_discusses`
--

DROP TABLE IF EXISTS `v_discusses`;
/*!50001 DROP VIEW IF EXISTS `v_discusses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_discusses` AS SELECT 
 1 AS `id`,
 1 AS `article_id`,
 1 AS `title`,
 1 AS `permalink`,
 1 AS `excerp`,
 1 AS `feat_img`,
 1 AS `comment_status`,
 1 AS `user_id`,
 1 AS `email`,
 1 AS `full_name`,
 1 AS `nick_name`,
 1 AS `level`,
 1 AS `dis_body`,
 1 AS `dis_approve`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pages`
--

DROP TABLE IF EXISTS `v_pages`;
/*!50001 DROP VIEW IF EXISTS `v_pages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_pages` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `body`,
 1 AS `author_id`,
 1 AS `full_name`,
 1 AS `nick_name`,
 1 AS `permalink`,
 1 AS `excerp`,
 1 AS `feat_img`,
 1 AS `comment_status`,
 1 AS `publish_status`,
 1 AS `publish_visibility`,
 1 AS `article_type`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_article_categories`
--

/*!50001 DROP VIEW IF EXISTS `v_article_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_article_categories` AS select `article_categories`.`id` AS `id`,`article_categories`.`article_id` AS `article_id`,`articles`.`title` AS `title`,`articles`.`body` AS `body`,`articles`.`author_id` AS `author_id`,(select `users`.`full_name` from `users` where (`users`.`id` = `articles`.`author_id`)) AS `full_name`,(select `users`.`nick_name` from `users` where (`users`.`id` = `articles`.`author_id`)) AS `nick_name`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`articles`.`publish_status` AS `publish_status`,`articles`.`publish_visibility` AS `publish_visibility`,`articles`.`article_vcount` AS `article_vcount`,`articles`.`created_at` AS `created_at`,`articles`.`updated_at` AS `updated_at`,`article_categories`.`category_id` AS `category_id`,`categories`.`cat_name` AS `cat_name`,`categories`.`cat_slug` AS `cat_slug`,`categories`.`cat_count` AS `cat_count`,concat(`articles`.`title`,' ',`articles`.`body`,' ',`articles`.`permalink`,' ',`articles`.`excerp`,' ',`categories`.`cat_name`) AS `article_all` from ((`article_categories` left join `categories` on((`article_categories`.`category_id` = `categories`.`id`))) left join `articles` on((`article_categories`.`article_id` = `articles`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_articles`
--

/*!50001 DROP VIEW IF EXISTS `v_articles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_articles` AS select `articles`.`id` AS `id`,`articles`.`title` AS `title`,`articles`.`body` AS `body`,`articles`.`author_id` AS `author_id`,`users`.`full_name` AS `full_name`,`users`.`nick_name` AS `nick_name`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`articles`.`publish_status` AS `publish_status`,`articles`.`publish_visibility` AS `publish_visibility`,`articles`.`article_type` AS `article_type`,`articles`.`article_vcount` AS `article_vcount`,concat(`articles`.`title`,' ',`articles`.`body`,' ',`articles`.`permalink`,' ',`articles`.`excerp`) AS `article_all`,`articles`.`created_at` AS `created_at`,`articles`.`updated_at` AS `updated_at` from (`articles` left join `users` on((`articles`.`author_id` = `users`.`id`))) where (`articles`.`article_type` = 'Article') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_discusses`
--

/*!50001 DROP VIEW IF EXISTS `v_discusses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_discusses` AS select `discusses`.`id` AS `id`,`discusses`.`article_id` AS `article_id`,`articles`.`title` AS `title`,`articles`.`permalink` AS `permalink`,`articles`.`excerp` AS `excerp`,`articles`.`feat_img` AS `feat_img`,`articles`.`comment_status` AS `comment_status`,`discusses`.`user_id` AS `user_id`,`users`.`email` AS `email`,`users`.`full_name` AS `full_name`,`users`.`nick_name` AS `nick_name`,`users`.`level` AS `level`,`discusses`.`dis_body` AS `dis_body`,`discusses`.`dis_approve` AS `dis_approve`,`discusses`.`created_at` AS `created_at`,`discusses`.`updated_at` AS `updated_at` from ((`discusses` left join `users` on((`discusses`.`user_id` = `users`.`id`))) left join `articles` on((`discusses`.`article_id` = `articles`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pages`
--

/*!50001 DROP VIEW IF EXISTS `v_pages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_dev`@`localhost` SQL SECURITY DEFINER */
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

-- Dump completed on 2015-10-03  9:22:26
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

INSERT INTO schema_migrations (version) VALUES ('20150611043852');

INSERT INTO schema_migrations (version) VALUES ('20150611044525');

INSERT INTO schema_migrations (version) VALUES ('20150614015305');

INSERT INTO schema_migrations (version) VALUES ('20150614015307');

INSERT INTO schema_migrations (version) VALUES ('20150614015407');

