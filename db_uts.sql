/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.0.51b-community-nt-log : Database - db_uts
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_uts` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_uts`;

/*Table structure for table `action_recorder` */

DROP TABLE IF EXISTS `action_recorder`;

CREATE TABLE `action_recorder` (
  `id` int(11) NOT NULL auto_increment,
  `module` varchar(255) collate utf8_unicode_ci NOT NULL,
  `user_id` int(11) default NULL,
  `user_name` varchar(255) collate utf8_unicode_ci default NULL,
  `identifier` varchar(255) collate utf8_unicode_ci NOT NULL,
  `success` char(1) collate utf8_unicode_ci default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `action_recorder` */

insert  into `action_recorder`(`id`,`module`,`user_id`,`user_name`,`identifier`,`success`,`date_added`) values (1,'ar_admin_login',1,'admin','127.0.0.1','1','2014-04-14 13:26:44');

/*Table structure for table `address_book` */

DROP TABLE IF EXISTS `address_book`;

CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) collate utf8_unicode_ci default NULL,
  `entry_company` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_firstname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_lastname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `entry_state` varchar(255) collate utf8_unicode_ci default NULL,
  `entry_country_id` int(11) NOT NULL default '0',
  `entry_zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `address_book` */

/*Table structure for table `address_format` */

DROP TABLE IF EXISTS `address_format`;

CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL auto_increment,
  `address_format` varchar(128) collate utf8_unicode_ci NOT NULL,
  `address_summary` varchar(48) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `address_format` */

insert  into `address_format`(`address_format_id`,`address_format`,`address_summary`) values (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');

/*Table structure for table `administrators` */

DROP TABLE IF EXISTS `administrators`;

CREATE TABLE `administrators` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) character set utf8 collate utf8_bin NOT NULL,
  `user_password` varchar(60) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `administrators` */

insert  into `administrators`(`id`,`user_name`,`user_password`) values (1,'admin','$P$DfEylMeqMSeCMzYAe/zUmo6pcCwOOJ/');

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL auto_increment,
  `banners_title` varchar(64) collate utf8_unicode_ci NOT NULL,
  `banners_url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `banners_image` varchar(64) collate utf8_unicode_ci NOT NULL,
  `banners_group` varchar(10) collate utf8_unicode_ci NOT NULL,
  `banners_html_text` text collate utf8_unicode_ci,
  `expires_impressions` int(7) default '0',
  `expires_date` datetime default NULL,
  `date_scheduled` datetime default NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `banners` */

insert  into `banners`(`banners_id`,`banners_title`,`banners_url`,`banners_image`,`banners_group`,`banners_html_text`,`expires_impressions`,`expires_date`,`date_scheduled`,`date_added`,`date_status_change`,`status`) values (1,'osCommerce','http://www.oscommerce.com','banners/oscommerce.gif','footer','',0,NULL,NULL,'2014-04-14 13:25:43',NULL,1);

/*Table structure for table `banners_history` */

DROP TABLE IF EXISTS `banners_history`;

CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL auto_increment,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL default '0',
  `banners_clicked` int(5) NOT NULL default '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY  (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `banners_history` */

insert  into `banners_history`(`banners_history_id`,`banners_id`,`banners_shown`,`banners_clicked`,`banners_history_date`) values (1,1,27,0,'2014-04-14 14:13:12');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `categories_image` varchar(64) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `sort_order` int(3) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`categories_id`,`categories_image`,`parent_id`,`sort_order`,`date_added`,`last_modified`) values (37,NULL,25,0,'2014-04-14 13:56:45',NULL),(36,NULL,25,0,'2014-04-14 13:56:34',NULL),(32,NULL,24,0,'2014-04-14 13:49:27',NULL),(33,NULL,24,0,'2014-04-14 13:49:32',NULL),(34,NULL,24,0,'2014-04-14 13:49:39',NULL),(35,NULL,25,0,'2014-04-14 13:56:24',NULL),(23,NULL,0,0,'2014-04-14 13:29:20',NULL),(24,NULL,0,0,'2014-04-14 13:29:34',NULL),(25,NULL,0,0,'2014-04-14 13:29:47',NULL),(26,NULL,22,0,'2014-04-14 13:30:26',NULL),(27,NULL,22,0,'2014-04-14 13:30:36',NULL),(28,NULL,22,0,'2014-04-14 13:30:49',NULL),(29,NULL,23,0,'2014-04-14 13:39:25',NULL),(30,NULL,23,0,'2014-04-14 13:39:34',NULL),(31,NULL,23,0,'2014-04-14 13:39:46',NULL),(22,NULL,0,0,'2014-04-14 13:28:59',NULL);

/*Table structure for table `categories_description` */

DROP TABLE IF EXISTS `categories_description`;

CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `categories_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categories_description` */

insert  into `categories_description`(`categories_id`,`language_id`,`categories_name`) values (34,1,'System'),(30,1,'Games'),(29,1,'Accesories'),(32,1,'Accesories'),(31,1,'System'),(33,1,'Games'),(28,1,'System'),(26,1,'Accesories'),(27,1,'Games'),(23,1,'Nintendo Wii U'),(24,1,'Playstation 4'),(25,1,'Playstation Vita'),(22,1,'Nintendo 3DS'),(35,1,'Accesories'),(36,1,'Games'),(37,1,'System'),(34,2,'System'),(30,2,'Games'),(29,2,'Accesories'),(32,2,'Accesories'),(31,2,'System'),(33,2,'Games'),(28,2,'System'),(26,2,'Accesories'),(27,2,'Games'),(23,2,'Nintendo Wii U'),(24,2,'Playstation 4'),(25,2,'Playstation Vita'),(22,2,'Nintendo 3DS'),(35,2,'Accesories'),(36,2,'Games'),(37,2,'System');

/*Table structure for table `configuration` */

DROP TABLE IF EXISTS `configuration`;

CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `configuration_title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_key` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_value` text collate utf8_unicode_ci NOT NULL,
  `configuration_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) collate utf8_unicode_ci default NULL,
  `set_function` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`configuration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `configuration` */

insert  into `configuration`(`configuration_id`,`configuration_title`,`configuration_key`,`configuration_value`,`configuration_description`,`configuration_group_id`,`sort_order`,`last_modified`,`date_added`,`use_function`,`set_function`) values (1,'Store Name','STORE_NAME','Toko Games','The name of my store',1,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(2,'Store Owner','STORE_OWNER','Agung Nugroho','The name of my store owner',1,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','agung_nugroho1727@yahoo.co.id','The e-mail address of my store owner',1,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','\"Agung Nugroho\" <agung_nugroho1727@yahoo.co.id>','The e-mail address used in (sent) e-mails',1,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(5,'Country','STORE_COUNTRY','223','The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>',1,6,NULL,'2014-04-14 13:25:43','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','18','The zone my store is located in',1,7,NULL,'2014-04-14 13:25:43','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'asc\', \'desc\'), '),(8,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(9,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,NULL,'2014-04-14 13:25:43',NULL,NULL),(11,'Use Search-Engine Safe URLs','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',1,12,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(13,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','Allow guests to tell a friend about a product',1,15,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(14,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(15,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,18,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_textarea('),(16,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2014-04-14 13:25:43',NULL,NULL),(18,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(19,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(20,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(21,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(22,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(23,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(24,'Company','ENTRY_COMPANY_MIN_LENGTH','2','Minimum length of company name',2,6,NULL,'2014-04-14 13:25:43',NULL,NULL),(25,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2014-04-14 13:25:43',NULL,NULL),(26,'City','ENTRY_CITY_MIN_LENGTH','3','Minimum length of city',2,8,NULL,'2014-04-14 13:25:43',NULL,NULL),(27,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2014-04-14 13:25:43',NULL,NULL),(28,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2014-04-14 13:25:43',NULL,NULL),(29,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2014-04-14 13:25:43',NULL,NULL),(30,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2014-04-14 13:25:43',NULL,NULL),(31,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2014-04-14 13:25:43',NULL,NULL),(32,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of review text',2,14,NULL,'2014-04-14 13:25:43',NULL,NULL),(33,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2014-04-14 13:25:43',NULL,NULL),(34,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2014-04-14 13:25:43',NULL,NULL),(35,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(36,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(37,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(38,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Maximum number of products on special to display',3,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(39,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Maximum number of new products to display in a category',3,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(40,'Products Expected','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Maximum number of products expected to display',3,6,NULL,'2014-04-14 13:25:43',NULL,NULL),(41,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',3,7,NULL,'2014-04-14 13:25:43',NULL,NULL),(42,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.',3,7,NULL,'2014-04-14 13:25:43',NULL,NULL),(43,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display',3,8,NULL,'2014-04-14 13:25:43',NULL,NULL),(44,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','Maximum number of new reviews to display',3,9,NULL,'2014-04-14 13:25:43',NULL,NULL),(45,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2014-04-14 13:25:43',NULL,NULL),(46,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2014-04-14 13:25:43',NULL,NULL),(47,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2014-04-14 13:25:43',NULL,NULL),(48,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2014-04-14 13:25:43',NULL,NULL),(49,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','Maximum number of new products to display in new products page',3,14,NULL,'2014-04-14 13:25:43',NULL,NULL),(50,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','Maximum number of best sellers to display',3,15,NULL,'2014-04-14 13:25:43',NULL,NULL),(51,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','Maximum number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2014-04-14 13:25:43',NULL,NULL),(52,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2014-04-14 13:25:43',NULL,NULL),(53,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2014-04-14 13:25:43',NULL,NULL),(54,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','Maximum number of product quantities that can be added to the shopping cart (0 for no limit)',3,19,NULL,'2014-04-14 13:25:43',NULL,NULL),(55,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(56,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(57,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(58,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(59,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(60,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2014-04-14 13:25:43',NULL,NULL),(61,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(63,'Gender','ACCOUNT_GENDER','true','Display gender in the customers account',5,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(64,'Date of Birth','ACCOUNT_DOB','true','Display date of birth in the customers account',5,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(65,'Company','ACCOUNT_COMPANY','true','Display company in the customers account',5,3,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(66,'Suburb','ACCOUNT_SUBURB','true','Display suburb in the customers account',5,4,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(67,'State','ACCOUNT_STATE','true','Display state in the customers account',5,5,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(68,'Installed Modules','MODULE_PAYMENT_INSTALLED','cod.php;paypal_express.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(69,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(70,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(71,'Installed Modules','MODULE_ACTION_RECORDER_INSTALLED','ar_admin_login.php;ar_contact_us.php;ar_reset_password.php;ar_tell_a_friend.php','List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(72,'Installed Modules','MODULE_SOCIAL_BOOKMARKS_INSTALLED','sb_email.php;sb_facebook.php;sb_google_plus_share.php;sb_pinterest.php;sb_twitter.php','List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(73,'Enable Cash On Delivery Module','MODULE_PAYMENT_COD_STATUS','True','Do you want to accept Cash On Delevery payments?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(74,'Payment Zone','MODULE_PAYMENT_COD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2014-04-14 13:25:43','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(75,'Sort order of display.','MODULE_PAYMENT_COD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(76,'Set Order Status','MODULE_PAYMENT_COD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2014-04-14 13:25:43','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(77,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(78,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(79,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2014-04-14 13:25:43','tep_get_tax_class_title','tep_cfg_pull_down_tax_classes('),(80,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2014-04-14 13:25:43','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(81,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(82,'Default Currency','DEFAULT_CURRENCY','IDR','Default Currency',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(83,'Default Language','DEFAULT_LANGUAGE','id','Default Language',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(84,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(85,'Display Shipping','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','Do you want to display the order shipping cost?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(86,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','2','Sort order of display.',6,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(87,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(88,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2014-04-14 13:25:43','currencies->format',NULL),(89,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), '),(90,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(91,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','1','Sort order of display.',6,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(92,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(93,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','3','Sort order of display.',6,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(94,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(95,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','4','Sort order of display.',6,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(96,'Minimum Minutes Per E-Mail','MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES','15','Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(97,'Minimum Minutes Per E-Mail','MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES','15','Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(98,'Allowed Minutes','MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES','5','Number of minutes to allow login attempts to occur.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(99,'Allowed Attempts','MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS','3','Number of login attempts to allow within the specified period.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(100,'Allowed Minutes','MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES','5','Number of minutes to allow password resets to occur.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(101,'Allowed Attempts','MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS','1','Number of password reset attempts to allow within the specified period.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(102,'Enable E-Mail Module','MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS','True','Do you want to allow products to be shared through e-mail?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(103,'Sort Order','MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(104,'Enable Google+ Share Module','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_STATUS','True','Do you want to allow products to be shared through Google+?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(105,'Annotation','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ANNOTATION','None','The annotation to display next to the button.',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'Inline\', \'Bubble\', \'Vertical-Bubble\', \'None\'), '),(106,'Width','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_WIDTH','','The maximum width of the button.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(107,'Height','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_HEIGHT','15','Sets the height of the button.',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'15\', \'20\', \'24\', \'60\'), '),(108,'Alignment','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ALIGN','Left','The alignment of the button assets.',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'Left\', \'Right\'), '),(109,'Sort Order','MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(110,'Enable Facebook Module','MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS','True','Do you want to allow products to be shared through Facebook?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(111,'Sort Order','MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER','30','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(112,'Enable Twitter Module','MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS','True','Do you want to allow products to be shared through Twitter?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(113,'Sort Order','MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER','40','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(114,'Enable Pinterest Module','MODULE_SOCIAL_BOOKMARKS_PINTEREST_STATUS','True','Do you want to allow Pinterest Button?',6,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(115,'Layout Position','MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION','None','Horizontal or Vertical or None',6,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'Horizontal\', \'Vertical\', \'None\'), '),(116,'Sort Order','MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(117,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2014-04-14 13:25:43','tep_get_country_name','tep_cfg_pull_down_country_list('),(118,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.',7,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(119,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(120,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(121,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','For 10% enter 10',7,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(122,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(123,'Display Product Manufacturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(124,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(125,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(126,'Display Product Price','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price',8,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(127,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2014-04-14 13:25:43',NULL,NULL),(128,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2014-04-14 13:25:43',NULL,NULL),(129,'Display Buy Now column','PRODUCT_LIST_BUY_NOW','4','Do you want to display the Buy Now column?',8,8,NULL,'2014-04-14 13:25:43',NULL,NULL),(130,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2014-04-14 13:25:43',NULL,NULL),(131,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,10,NULL,'2014-04-14 13:25:43',NULL,NULL),(132,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(133,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(134,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(135,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2014-04-14 13:25:43',NULL,NULL),(136,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2014-04-14 13:25:43',NULL,NULL),(137,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(138,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(139,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2014-04-14 13:25:43',NULL,NULL),(140,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(141,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log',10,5,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(142,'Use Cache','USE_CACHE','false','Use caching features',11,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(143,'Cache Directory','DIR_FS_CACHE','D:/AppServ/www/uts/catalog/includes/work/','The directory where the cached files are saved',11,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(144,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(145,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'LF\', \'CRLF\'),'),(146,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(147,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(148,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(149,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(150,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(151,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2014-04-14 13:25:43',NULL,''),(152,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2014-04-14 13:25:43',NULL,''),(153,'Enable GZip Compression','GZIP_COMPRESSION','false','Enable HTTP GZip compression.',14,1,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(154,'Compression Level','GZIP_LEVEL','5','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,NULL,'2014-04-14 13:25:43',NULL,NULL),(155,'Session Directory','SESSION_WRITE_DIRECTORY','D:/AppServ/www/uts/catalog/includes/work/','If sessions are file based, store them in this directory.',15,1,NULL,'2014-04-14 13:25:43',NULL,NULL),(156,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(157,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(158,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(159,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(160,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(161,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2014-04-14 13:25:43',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(162,'Last Update Check Time','LAST_UPDATE_CHECK_TIME','','Last time a check for new versions of osCommerce was run',6,0,NULL,'2014-04-14 13:25:43',NULL,NULL),(163,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(164,'Seller Account','MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT','agung_nugroho1727@yahoo.co.id','The email address of the seller account if no API credentials has been setup.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(165,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','','The username to use for the PayPal API service',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(166,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','','The password to use for the PayPal API service',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(167,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','','The signature to use for the PayPal API service',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(168,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(169,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(170,'PayPal Account Optional','MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL','False','This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.',6,0,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(171,'PayPal Instant Update','MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE','True','Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.',6,0,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(172,'PayPal Checkout Image','MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE','Static','Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.',6,0,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Static\', \'Dynamic\'), '),(173,'Debug E-Mail Address','MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL','','All parameters of an invalid transaction will be sent to this email address.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(174,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2014-04-14 13:25:44','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(175,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(176,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2014-04-14 13:25:44','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(177,'PayPal Transactions Order Status Level','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID','4','Include PayPal transaction information in this order status level',6,0,NULL,'2014-04-14 13:25:44','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(178,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(179,'Installed Modules','MODULE_HEADER_TAGS_INSTALLED','ht_canonical.php;ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_robot_noindex.php','List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(180,'Enable Category Title Module','MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS','True','Do you want to allow category titles to be added to the page title?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(181,'Sort Order','MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(182,'Enable Manufacturer Title Module','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS','True','Do you want to allow manufacturer titles to be added to the page title?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(183,'Sort Order','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(184,'Enable Product Title Module','MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS','True','Do you want to allow product titles to be added to the page title?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(185,'Sort Order','MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(186,'Enable Canonical Module','MODULE_HEADER_TAGS_CANONICAL_STATUS','True','Do you want to enable the Canonical module?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(187,'Sort Order','MODULE_HEADER_TAGS_CANONICAL_SORT_ORDER','400','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(188,'Enable Robot NoIndex Module','MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS','True','Do you want to enable the Robot NoIndex module?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(189,'Pages','MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES','account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;product_reviews_write.php;shopping_cart.php;ssl_check.php;tell_a_friend.php','The pages to add the meta robot noindex tag to.',6,0,NULL,'2014-04-14 13:25:44','ht_robot_noindex_show_pages','ht_robot_noindex_edit_pages('),(190,'Sort Order','MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(191,'Installed Modules','MODULE_ADMIN_DASHBOARD_INSTALLED','d_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_latest_news.php;d_latest_addons.php;d_partner_news.php;d_version_check.php;d_reviews.php','List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(192,'Enable Administrator Logins Module','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS','True','Do you want to show the latest administrator logins on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(193,'Sort Order','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(194,'Enable Customers Module','MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS','True','Do you want to show the newest customers on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(195,'Sort Order','MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER','400','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(196,'Enable Latest Add-Ons Module','MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_STATUS','True','Do you want to show the latest osCommerce Add-Ons on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(197,'Sort Order','MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_SORT_ORDER','800','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(198,'Enable Latest News Module','MODULE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS','True','Do you want to show the latest osCommerce News on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(199,'Sort Order','MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER','700','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(200,'Enable Orders Module','MODULE_ADMIN_DASHBOARD_ORDERS_STATUS','True','Do you want to show the latest orders on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(201,'Sort Order','MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(202,'Enable Security Checks Module','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS','True','Do you want to run the security checks for this installation?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(203,'Sort Order','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER','600','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(204,'Enable Total Customers Module','MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS','True','Do you want to show the total customers chart on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(205,'Sort Order','MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(206,'Enable Total Revenue Module','MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS','True','Do you want to show the total revenue chart on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(207,'Sort Order','MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(208,'Enable Version Check Module','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS','True','Do you want to show the version check results on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(209,'Sort Order','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER','900','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(210,'Enable Latest Reviews Module','MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS','True','Do you want to show the latest reviews on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(211,'Sort Order','MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(212,'Enable Partner News Module','MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_STATUS','True','Do you want to show the latest osCommerce Partner News on the dashboard?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(213,'Sort Order','MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_SORT_ORDER','820','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(214,'Installed Modules','MODULE_BOXES_INSTALLED','bm_categories.php;bm_manufacturers.php;bm_search.php;bm_whats_new.php;bm_information.php;bm_shopping_cart.php;bm_manufacturer_info.php;bm_order_history.php;bm_best_sellers.php;bm_product_notifications.php;bm_product_social_bookmarks.php;bm_specials.php;bm_reviews.php;bm_languages.php;bm_currencies.php','List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(215,'Enable Best Sellers Module','MODULE_BOXES_BEST_SELLERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(216,'Content Placement','MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(217,'Sort Order','MODULE_BOXES_BEST_SELLERS_SORT_ORDER','5030','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(218,'Enable Categories Module','MODULE_BOXES_CATEGORIES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(219,'Content Placement','MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(220,'Sort Order','MODULE_BOXES_CATEGORIES_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(221,'Enable Currencies Module','MODULE_BOXES_CURRENCIES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(222,'Content Placement','MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(223,'Sort Order','MODULE_BOXES_CURRENCIES_SORT_ORDER','5090','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(224,'Enable Information Module','MODULE_BOXES_INFORMATION_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(225,'Content Placement','MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(226,'Sort Order','MODULE_BOXES_INFORMATION_SORT_ORDER','1050','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(227,'Enable Languages Module','MODULE_BOXES_LANGUAGES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(228,'Content Placement','MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(229,'Sort Order','MODULE_BOXES_LANGUAGES_SORT_ORDER','5080','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(230,'Enable Manufacturer Info Module','MODULE_BOXES_MANUFACTURER_INFO_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(231,'Content Placement','MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(232,'Sort Order','MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER','5010','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(233,'Enable Manufacturers Module','MODULE_BOXES_MANUFACTURERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(234,'Content Placement','MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(235,'Sort Order','MODULE_BOXES_MANUFACTURERS_SORT_ORDER','1020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(236,'Enable Order History Module','MODULE_BOXES_ORDER_HISTORY_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(237,'Content Placement','MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(238,'Sort Order','MODULE_BOXES_ORDER_HISTORY_SORT_ORDER','5020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(239,'Enable Product Notifications Module','MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(240,'Content Placement','MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(241,'Sort Order','MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER','5040','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(242,'Enable Product Social Bookmarks Module','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(243,'Content Placement','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(244,'Sort Order','MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER','5050','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(245,'Enable Reviews Module','MODULE_BOXES_REVIEWS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(246,'Content Placement','MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(247,'Sort Order','MODULE_BOXES_REVIEWS_SORT_ORDER','5070','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(248,'Enable Search Module','MODULE_BOXES_SEARCH_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(249,'Content Placement','MODULE_BOXES_SEARCH_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(250,'Sort Order','MODULE_BOXES_SEARCH_SORT_ORDER','1030','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(251,'Enable Shopping Cart Module','MODULE_BOXES_SHOPPING_CART_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(252,'Content Placement','MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(253,'Sort Order','MODULE_BOXES_SHOPPING_CART_SORT_ORDER','5000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(254,'Enable Specials Module','MODULE_BOXES_SPECIALS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(255,'Content Placement','MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(256,'Sort Order','MODULE_BOXES_SPECIALS_SORT_ORDER','5060','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(257,'Enable What\'s New Module','MODULE_BOXES_WHATS_NEW_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(258,'Content Placement','MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2014-04-14 13:25:44',NULL,'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), '),(259,'Sort Order','MODULE_BOXES_WHATS_NEW_SORT_ORDER','1040','Sort order of display. Lowest is displayed first.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(260,'Installed Template Block Groups','TEMPLATE_BLOCK_GROUPS','boxes;header_tags','This is automatically updated. No need to edit.',6,0,NULL,'2014-04-14 13:25:44',NULL,NULL),(261,'Display Featured Products','FEATURED_PRODUCTS_DISPLAY','true','Set to true or false in order to display featured.',18,1,'2014-04-14 14:14:50','2014-04-14 14:14:50',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(262,'Maximum Display of Featured','MAX_DISPLAY_FEATURED_PRODUCTS','6','This is the maximum amount of items to display on the front page.',18,2,'2014-04-14 14:14:50','2014-04-14 14:14:50',NULL,NULL),(263,'Include Sub Categories When Displaying Featured Products','FEATURED_PRODUCTS_SUB_CATEGORIES','true','Set to true or false in order to display featured including sub categories.',18,3,'2014-04-14 14:14:50','2014-04-14 14:14:50',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(264,'Specials Only When Displaying Featured Products','FEATURED_PRODUCTS_SPECIALS_ONLY','false','Set to true or false in order to display only on special featured products.',18,4,'2014-04-14 14:14:50','2014-04-14 14:14:50',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),');

/*Table structure for table `configuration_group` */

DROP TABLE IF EXISTS `configuration_group`;

CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL auto_increment,
  `configuration_group_title` varchar(64) collate utf8_unicode_ci NOT NULL,
  `configuration_group_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `sort_order` int(5) default NULL,
  `visible` int(1) default '1',
  PRIMARY KEY  (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `configuration_group` */

insert  into `configuration_group`(`configuration_group_id`,`configuration_group_title`,`configuration_group_description`,`sort_order`,`visible`) values (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing    configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(18,'Featured','Featured Products Display',18,1);

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `startdate` char(8) collate utf8_unicode_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `counter` */

insert  into `counter`(`startdate`,`counter`) values ('20140414',27);

/*Table structure for table `counter_history` */

DROP TABLE IF EXISTS `counter_history`;

CREATE TABLE `counter_history` (
  `month` char(8) collate utf8_unicode_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `counter_history` */

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL auto_increment,
  `countries_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `countries_iso_code_2` char(2) collate utf8_unicode_ci NOT NULL,
  `countries_iso_code_3` char(3) collate utf8_unicode_ci NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY  (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`countries_id`,`countries_name`,`countries_iso_code_2`,`countries_iso_code_3`,`address_format_id`) values (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(74,'France, Metropolitan','FX','FXX',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1);

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) collate utf8_unicode_ci NOT NULL,
  `code` char(3) collate utf8_unicode_ci NOT NULL,
  `symbol_left` varchar(12) collate utf8_unicode_ci default NULL,
  `symbol_right` varchar(12) collate utf8_unicode_ci default NULL,
  `decimal_point` char(1) collate utf8_unicode_ci default NULL,
  `thousands_point` char(1) collate utf8_unicode_ci default NULL,
  `decimal_places` char(1) collate utf8_unicode_ci default NULL,
  `value` float(13,8) default NULL,
  `last_updated` datetime default NULL,
  PRIMARY KEY  (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`currencies_id`,`title`,`code`,`symbol_left`,`symbol_right`,`decimal_point`,`thousands_point`,`decimal_places`,`value`,`last_updated`) values (2,'Rupiah','IDR','Rp.',',-',',','.','2',1.00000000,'2014-04-14 13:25:44');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL auto_increment,
  `customers_gender` char(1) collate utf8_unicode_ci default NULL,
  `customers_firstname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_lastname` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_dob` datetime NOT NULL default '0000-00-00 00:00:00',
  `customers_email_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_default_address_id` int(11) default NULL,
  `customers_telephone` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_fax` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_password` varchar(60) collate utf8_unicode_ci NOT NULL,
  `customers_newsletter` char(1) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customers` */

/*Table structure for table `customers_basket` */

DROP TABLE IF EXISTS `customers_basket`;

CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate utf8_unicode_ci NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) default NULL,
  `customers_basket_date_added` char(8) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customers_basket` */

/*Table structure for table `customers_basket_attributes` */

DROP TABLE IF EXISTS `customers_basket_attributes`;

CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate utf8_unicode_ci NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY  (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customers_basket_attributes` */

/*Table structure for table `customers_info` */

DROP TABLE IF EXISTS `customers_info`;

CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime default NULL,
  `customers_info_number_of_logons` int(5) default NULL,
  `customers_info_date_account_created` datetime default NULL,
  `customers_info_date_account_last_modified` datetime default NULL,
  `global_product_notifications` int(1) default '0',
  `password_reset_key` char(40) collate utf8_unicode_ci default NULL,
  `password_reset_date` datetime default NULL,
  PRIMARY KEY  (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customers_info` */

/*Table structure for table `featured` */

DROP TABLE IF EXISTS `featured`;

CREATE TABLE `featured` (
  `featured_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL default '0',
  `featured_date_added` datetime default NULL,
  `featured_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) default '1',
  PRIMARY KEY  (`featured_id`),
  KEY `idx_products_id` (`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `featured` */

/*Table structure for table `geo_zones` */

DROP TABLE IF EXISTS `geo_zones`;

CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `geo_zone_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `geo_zone_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `geo_zones` */

insert  into `geo_zones`(`geo_zone_id`,`geo_zone_name`,`geo_zone_description`,`last_modified`,`date_added`) values (1,'Florida','Florida local sales tax zone',NULL,'2014-04-14 13:25:44');

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `code` char(2) collate utf8_unicode_ci NOT NULL,
  `image` varchar(64) collate utf8_unicode_ci default NULL,
  `directory` varchar(32) collate utf8_unicode_ci default NULL,
  `sort_order` int(3) default NULL,
  PRIMARY KEY  (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`languages_id`,`name`,`code`,`image`,`directory`,`sort_order`) values (1,'English','en','icon.gif','english',1),(2,'Indonesia','id','icon.gif','indonesia',2);

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL auto_increment,
  `manufacturers_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `manufacturers_image` varchar(64) collate utf8_unicode_ci default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `manufacturers` */

insert  into `manufacturers`(`manufacturers_id`,`manufacturers_name`,`manufacturers_image`,`date_added`,`last_modified`) values (1,'Matrox','manufacturer_matrox.gif','2014-04-14 13:25:44',NULL),(2,'Microsoft','manufacturer_microsoft.gif','2014-04-14 13:25:44',NULL),(3,'Warner','manufacturer_warner.gif','2014-04-14 13:25:44',NULL),(4,'Fox','manufacturer_fox.gif','2014-04-14 13:25:44',NULL),(5,'Logitech','manufacturer_logitech.gif','2014-04-14 13:25:44',NULL),(6,'Canon','manufacturer_canon.gif','2014-04-14 13:25:44',NULL),(7,'Sierra','manufacturer_sierra.gif','2014-04-14 13:25:44',NULL),(8,'GT Interactive','manufacturer_gt_interactive.gif','2014-04-14 13:25:44',NULL),(9,'Hewlett Packard','manufacturer_hewlett_packard.gif','2014-04-14 13:25:44',NULL),(10,'Samsung','manufacturer_samsung.png','2014-04-14 13:25:44',NULL);

/*Table structure for table `manufacturers_info` */

DROP TABLE IF EXISTS `manufacturers_info`;

CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `url_clicked` int(5) NOT NULL default '0',
  `date_last_click` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `manufacturers_info` */

insert  into `manufacturers_info`(`manufacturers_id`,`languages_id`,`manufacturers_url`,`url_clicked`,`date_last_click`) values (1,1,'http://www.matrox.com',0,NULL),(2,1,'http://www.microsoft.com',0,NULL),(3,1,'http://www.warner.com',0,NULL),(4,1,'http://www.fox.com',0,NULL),(5,1,'http://www.logitech.com',0,NULL),(6,1,'http://www.canon.com',0,NULL),(7,1,'http://www.sierra.com',0,NULL),(8,1,'http://www.infogrames.com',0,NULL),(9,1,'http://www.hewlettpackard.com',0,NULL),(10,1,'http://www.samsung.com',0,NULL),(1,2,'http://www.matrox.com',0,NULL),(2,2,'http://www.microsoft.com',0,NULL),(3,2,'http://www.warner.com',0,NULL),(4,2,'http://www.fox.com',0,NULL),(5,2,'http://www.logitech.com',0,NULL),(6,2,'http://www.canon.com',0,NULL),(7,2,'http://www.sierra.com',0,NULL),(8,2,'http://www.infogrames.com',0,NULL),(9,2,'http://www.hewlettpackard.com',0,NULL),(10,2,'http://www.samsung.com',0,NULL);

/*Table structure for table `newsletters` */

DROP TABLE IF EXISTS `newsletters`;

CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci NOT NULL,
  `module` varchar(255) collate utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime default NULL,
  `status` int(1) default NULL,
  `locked` int(1) default '0',
  PRIMARY KEY  (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `newsletters` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_company` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_state` varchar(255) collate utf8_unicode_ci default NULL,
  `customers_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_telephone` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_email_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_company` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_state` varchar(255) collate utf8_unicode_ci default NULL,
  `delivery_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_company` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_street_address` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_suburb` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_city` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_postcode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) collate utf8_unicode_ci default NULL,
  `billing_country` varchar(255) collate utf8_unicode_ci NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) collate utf8_unicode_ci NOT NULL,
  `cc_type` varchar(20) collate utf8_unicode_ci default NULL,
  `cc_owner` varchar(255) collate utf8_unicode_ci default NULL,
  `cc_number` varchar(32) collate utf8_unicode_ci default NULL,
  `cc_expires` varchar(4) collate utf8_unicode_ci default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) collate utf8_unicode_ci default NULL,
  `currency_value` decimal(14,6) default NULL,
  PRIMARY KEY  (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders` */

/*Table structure for table `orders_products` */

DROP TABLE IF EXISTS `orders_products`;

CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) collate utf8_unicode_ci default NULL,
  `products_name` varchar(64) collate utf8_unicode_ci NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY  (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_products` */

/*Table structure for table `orders_products_attributes` */

DROP TABLE IF EXISTS `orders_products_attributes`;

CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) collate utf8_unicode_ci NOT NULL,
  `products_options_values` varchar(32) collate utf8_unicode_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_products_attributes` */

/*Table structure for table `orders_products_download` */

DROP TABLE IF EXISTS `orders_products_download`;

CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL default '0',
  `orders_products_id` int(11) NOT NULL default '0',
  `orders_products_filename` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `download_maxdays` int(2) NOT NULL default '0',
  `download_count` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_products_download` */

/*Table structure for table `orders_status` */

DROP TABLE IF EXISTS `orders_status`;

CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `orders_status_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `public_flag` int(11) default '1',
  `downloads_flag` int(11) default '0',
  PRIMARY KEY  (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_status` */

insert  into `orders_status`(`orders_status_id`,`language_id`,`orders_status_name`,`public_flag`,`downloads_flag`) values (1,1,'Pending',1,0),(2,1,'Processing',1,1),(3,1,'Delivered',1,1),(4,1,'PayPal [Transactions]',0,0),(1,2,'Pending',1,0),(2,2,'Processing',1,0),(3,2,'Delivered',1,0),(4,2,'PayPal [Transactions]',1,0);

/*Table structure for table `orders_status_history` */

DROP TABLE IF EXISTS `orders_status_history`;

CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) default '0',
  `comments` text collate utf8_unicode_ci,
  PRIMARY KEY  (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_status_history` */

/*Table structure for table `orders_total` */

DROP TABLE IF EXISTS `orders_total`;

CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) collate utf8_unicode_ci NOT NULL,
  `text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) collate utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders_total` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL auto_increment,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) collate utf8_unicode_ci default NULL,
  `products_image` varchar(64) collate utf8_unicode_ci default NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime default NULL,
  `products_date_available` datetime default NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) default NULL,
  `products_ordered` int(11) NOT NULL default '0',
  PRIMARY KEY  (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`products_id`,`products_quantity`,`products_model`,`products_image`,`products_price`,`products_date_added`,`products_last_modified`,`products_date_available`,`products_weight`,`products_status`,`products_tax_class_id`,`manufacturers_id`,`products_ordered`) values (57,2147483647,'','img1533-1393042240.jpg','450000.0000','2014-04-14 14:00:33','2014-04-14 14:19:41',NULL,'0.00',0,0,0,0),(56,0,'','img1521-1389257922.jpg','465000.0000','2014-04-14 13:59:51','2014-04-14 14:19:41',NULL,'0.00',0,0,0,0),(55,2147483647,'','img1905-1393562355.jpg','380000.0000','2014-04-14 13:59:07','2014-04-14 14:19:36',NULL,'0.00',0,0,0,0),(54,2147483647,'','img994-1370577980.jpg','100000.0000','2014-04-14 13:58:22','2014-04-14 14:19:35',NULL,'0.00',0,0,0,0),(44,2147483647,'','img1514-1387868837.jpg','875000.0000','2014-04-14 13:50:17','2014-04-14 14:19:04',NULL,'0.00',0,0,0,0),(45,2147483647,'','img1513-1387868828.jpg','780000.0000','2014-04-14 13:50:54','2014-04-14 14:19:05',NULL,'0.00',0,0,0,0),(46,2147483647,'','img1508-1387770225.jpg','650000.0000','2014-04-14 13:51:44','2014-04-14 14:19:11',NULL,'0.00',0,0,0,0),(47,2147483647,'','img1509-1387770241.jpg','675000.0000','2014-04-14 13:52:27','2014-04-14 14:19:13',NULL,'0.00',0,0,0,0),(48,2147483647,'','img1536-1395477076.jpg','620000.0000','2014-04-14 13:53:02','2014-04-14 14:30:54',NULL,'0.00',1,0,0,0),(49,2147483647,'','img1510-1387770254.jpg','660000.0000','2014-04-14 13:53:37','2014-04-14 14:19:14',NULL,'0.00',0,0,0,0),(50,2147483647,'','img1511-1387770286.jpg','600000.0000','2014-04-14 13:54:08','2014-04-14 14:19:18',NULL,'0.00',0,0,0,0),(51,0,'','img1532-1392962784.jpg','380000.0000','2014-04-14 13:54:47','2014-04-14 14:19:22',NULL,'0.00',0,0,0,0),(52,2147483647,'','img1512-1387770310.jpg','650000.0000','2014-04-14 13:55:17','2014-04-14 14:19:20',NULL,'0.00',0,0,0,0),(53,2147483647,'','img995-1326771163.jpg','150000.0000','2014-04-14 13:57:36','2014-04-14 14:19:33',NULL,'0.00',0,0,0,0),(30,2147483647,'','img1522-1389257975.jpg','460000.0000','2014-04-14 13:35:04','2014-04-14 14:17:56',NULL,'0.00',0,0,0,0),(31,2147483647,'','img1450-1380690172.jpg','450000.0000','2014-04-14 13:36:05','2014-04-14 14:17:59',NULL,'0.00',0,0,0,0),(32,2147483647,'','img1458-1380691843.jpg','450000.0000','2014-04-14 13:36:48','2014-04-14 14:18:00',NULL,'0.00',0,0,0,0),(33,2147483647,'','img1474-1382171526.jpg','1850000.0000','2014-04-14 13:38:05',NULL,NULL,'0.00',1,0,0,0),(34,2147483647,'','img1278-1357805585.jpg','2800000.0000','2014-04-14 13:38:53','2014-04-14 14:27:07',NULL,'0.00',0,0,0,0),(35,2147483647,'','img1273-1356492956.jpg','150000.0000','2014-04-14 13:41:02','2014-04-14 14:18:31',NULL,'0.00',0,0,0,0),(36,2147483647,'','img1272-1356492929.jpg','125000.0000','2014-04-14 13:41:48','2014-04-14 14:18:35',NULL,'0.00',0,0,0,0),(37,2147483647,'','img1432-1380689570.jpg','970000.0000','2014-04-14 13:43:00','2014-04-14 14:18:40',NULL,'0.00',0,0,0,0),(38,2147483647,'','img1326-1364272265.jpg','540000.0000','2014-04-14 13:44:04','2014-04-14 14:18:44',NULL,'0.00',0,0,0,0),(39,2147483647,'','img1264-1354759678.jpg','540000.0000','2014-04-14 13:44:53','2014-04-14 14:18:42',NULL,'0.00',0,0,0,0),(40,2147483647,'','img1431-1380689518.jpg','600000.0000','2014-04-14 13:45:38','2014-04-14 14:18:48',NULL,'0.00',0,0,0,0),(41,0,'',NULL,'540000.0000','2014-04-14 13:46:25','2014-04-14 14:18:43',NULL,'0.00',0,0,0,0),(42,2147483647,'','img1463-1380869644.jpg','540000.0000','2014-04-14 13:47:16','2014-04-14 14:18:45',NULL,'0.00',0,0,0,0),(43,2147483647,'','img1265-1354960636.jpg','4800000.0000','2014-04-14 13:48:23',NULL,NULL,'0.00',1,0,0,0),(29,2147483647,'','img1366-1371702686.jpg','100000.0000','2014-04-14 13:33:41','2014-04-14 14:18:16',NULL,'0.00',0,0,0,0),(58,2147483647,'','img1523-1389414388.jpg','540000.0000','2014-04-14 14:01:08','2014-04-14 14:19:42',NULL,'0.00',0,0,0,0),(59,2147483647,'','img1534-1393042309.jpg','450000.0000','2014-04-14 14:01:36','2014-04-14 14:19:47',NULL,'0.00',0,0,0,0),(60,2147483647,'','img1535-1394515791.jpg','450000.0000','2014-04-14 14:02:17','2014-04-14 14:19:49',NULL,'0.00',0,0,0,0),(61,2147483647,'','img1529-1392438138.jpg','720000.0000','2014-04-14 14:02:49','2014-04-14 14:19:50',NULL,'0.00',0,0,0,0),(62,2147483647,'','img1530-1392438181.jpg','800000.0000','2014-04-14 14:03:34','2014-04-14 14:19:52',NULL,'0.00',0,0,0,0),(63,2147483647,'','img1044-1331623800.jpg','3600000.0000','2014-04-14 14:04:25',NULL,NULL,'0.00',1,0,0,0),(64,2147483647,'','img1491-1386908690.jpg','3600000.0000','2014-04-14 14:05:12','2014-04-14 14:20:49',NULL,'0.00',0,0,0,0),(65,2147483647,'','img1492-1386908729.jpg','3600000.0000','2014-04-14 14:05:56','2014-04-14 14:20:50',NULL,'0.00',0,0,0,0),(66,2147483647,'','img1468-1381556223.jpg','3600000.0000','2014-04-14 14:06:40','2014-04-14 14:20:17',NULL,'0.00',0,0,0,0),(67,2147483647,'','img1467-1381556040.jpg','3600000.0000','2014-04-14 14:07:23','2014-04-14 14:20:18',NULL,'0.00',0,0,0,0),(68,2147483647,'','img1469-1381556313.jpg','3600000.0000','2014-04-14 14:08:07','2014-04-14 14:20:21',NULL,'0.00',0,0,0,0),(69,2147483647,'','img1524-1390366502.jpeg','2100000.0000','2014-04-14 14:08:53','2014-04-14 14:27:29',NULL,'0.00',0,0,0,0),(70,2147483647,'','img1484-1387869980.jpg','6750000.0000','2014-04-14 14:10:48',NULL,NULL,'0.00',1,0,0,0);

/*Table structure for table `products_attributes` */

DROP TABLE IF EXISTS `products_attributes`;

CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_attributes` */

/*Table structure for table `products_attributes_download` */

DROP TABLE IF EXISTS `products_attributes_download`;

CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `products_attributes_maxdays` int(2) default '0',
  `products_attributes_maxcount` int(2) default '0',
  PRIMARY KEY  (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_attributes_download` */

insert  into `products_attributes_download`(`products_attributes_id`,`products_attributes_filename`,`products_attributes_maxdays`,`products_attributes_maxcount`) values (26,'unreal.zip',7,3);

/*Table structure for table `products_description` */

DROP TABLE IF EXISTS `products_description`;

CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '1',
  `products_name` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  `products_description` text collate utf8_unicode_ci,
  `products_url` varchar(255) collate utf8_unicode_ci default NULL,
  `products_viewed` int(5) default '0',
  PRIMARY KEY  (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_description` */

insert  into `products_description`(`products_id`,`language_id`,`products_name`,`products_description`,`products_url`,`products_viewed`) values (70,2,'Playstation 4','Box Content :\r\n\r\nPS4 500gb HDD\r\nDualshock 4\r\nHDMI Cable\r\nPower Cable\r\nCharger Cable','',0),(29,2,'3DS XL Tough Case','','',0),(30,2,'Bravely Default (English)','','',0),(31,2,'ETRIAN ODYSSEY UNTOLD : THE MILLENIUM GIRL','','',0),(32,2,'Hometown Story','','',0),(33,2,'Nintendo 2DS Blue','FEATURES\r\nCompatibility with all Nintendo 3DS and most Nintendo DS games\r\nAccess to the Nintendo eShop, with digital games, free demos, and special offers\r\nWireless connectivity for multiplayer and co-op play\r\nParental controls that let adults manage the system\'s content\r\nDESCRIPTION \r\n \r\nOffering you additional variety and value in your handheld gaming options, the Nintendo 2DS is a streamlined version of the Nintendo 3DS that will play games available for Nintendo 3DS, as well as Nintendo DS in 2D.\r\n\r\nThe Nintendo 2DS retains many of the same hardware features as the Nintendo 3DS including the same Nintendo 3DS gameplay controls, backwards compatibility with the vast existing library of Nintendo DS games, as well as wireless connectivity features such as access to Nintendo eShop as well as StreetPass and SpotPass functionality. However the console takes on a new distinctive fixed, slate form design, and will play all packaged and download Nintendo 3DS games in 2D.\r\n\r\nThe new console is designed as an entry point into, or a new way to enjoy the Nintendo handheld experience and will be available at launch in two colour combinations, Black & Blue and White & Red, with a Nintendo 2DS Carrying Case (in either Blue or Red) that can be purchased separately.','',0),(68,2,'Paket Hemat PS Vita PlayStation Vita New Slim Model (White) 16gb','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(69,2,'PS Vita TV Value Pack (Reg 3) English','Box content :\r\n1 x ps vita tv\r\n1 x 8gb memory\r\n1 x dualshock 3\r\n1 x HDMI Cable\r\n1 x Power Adapter\r\n1 x Charger Cable\r\nfeatures\r\nCPU: ARM Cortex-A9 core (4core)\r\nWi-Fi: IEEE 802.11b/g/n (n=1×1)\r\n1 GB Internal Memory\r\ndescription\r\nAnother surprise reveal from Sony at the Pre TGS press con was the unvieling of the PS Vita TV, a brand new item in the growing Vita family. While the main idea of this tiny device is the ability to play Vita games on a television, the PS Vita TV is capable of a lot more.\r\n\r\nMeasuring 6cm by 10cm - making this the smallest PlayStation hardware ever, the PS Vita TV has 2 card slots: for Vita games and Vita Memory Cards; it will connect to the DualShock 3 controller with future support for the DualShock 4. While this may already be appealing for those who would enjoy the Vita experience on a bigger screen, the PS Vita extends it\'s functionality by enabling video streaming services and more. PSone Classics and PSP games from a digital library can also be played; Remote Play with a PS4 is a definite possibility in the future as well.','',0),(44,2,'PS4 Camera','','',0),(45,2,'PS4 Dualshock 4','','',0),(46,2,'[PS4] Battlefield 4 (Reg 3) English','','',0),(47,2,'[PS4] FIFA 14 (Reg 3) English','','',0),(48,2,'Infamous Second Son (Reg 3) English','','',1),(49,2,'[PS4] Killzone Shadow Fall (Reg 3) English','','',0),(50,2,'[PS4] Knack (Reg 3) English','','',0),(51,2,'Metal Gear Solid V Ground Zeroes (PS4) Reg 3 English','Ready 18 maret 2014','',0),(52,2,'[PS4] Need for Speed Rivals (Reg 3) English','','',0),(53,2,'PS Vita Car Holder','Holder untuk menaruh PS Vita anda di kaca mobil, cocok bagi anda yang ingin menikmati multimedia PS Vita di mobil anda.','',0),(54,2,'PS Vita Flexible Handgrip','Pegangan tangan untuk PS Vita anda, dijamin akan menambah kenyamanan bermain anda.','',0),(55,2,'PS Vita Power Grip (Nyko)','Get a new hold on PlayStation Vita with Nyko’s Power Grip. The Power Grip provides more play time for all your favorite PS Vita games and provides a better, more familiar and ergonomic grip to ease strain on hands. The grip features a sleek design for easy storage, a matching black finish to compliment the PS Vita, and a lightweight design that makes it ideal for travel. The Power Grip is great for longer, more comfortable gameplay sessions for any PS Vita owner.','',0),(56,2,'Danganronpa Trigger Happy Havoc (Reg 1) English','','',0),(57,2,'Deception IV Blood Ties (Reg 3) English','Ready 25 Mar 2014','',0),(58,2,'Dragon Ball Z Battle of Z PS Vita (Reg 2) English','','',0),(59,2,'Dynasty Warriors 8 Xtreme Legends Complete Edition PS Vita Reg 3','','',0),(60,2,'Final Fantasy X / X-2 HD Remaster (Reg 1) English','Ready Maret 2014','',0),(61,2,'Hatsunemiku Project Diva 2nd (Reg 3) JAPAN','','',0),(62,2,'J Star Victory (Reg 2) JAPAN','Ready Maret 2014','',0),(63,2,'Paket Hemat PS Vita Crystal Black 64gb (WIFI Model)','Isi Paket :\r\n1 x PS Vita WIFI model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 64gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case\r\n1 x Crystal Case ATAU Silicon Case (Plih Salah Satu)','',0),(64,2,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Black) 16gb','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(65,2,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Khaki Black','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(66,2,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Light Blue ','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(67,2,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Lime Green ','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(34,1,'Nintendo 3DS XL Red (Bonus Mario 3D Land Pre Installed)','','',0),(35,1,'WII U Gamepad Crystal Case','','',0),(36,1,'WII U Gamepad Screen Guard (Project Design)','','',0),(37,1,'[WII U] DISNEY INFINITY','Hanya Tersedia untuk pembelian online saja.','',0),(38,1,'Monster Hunter 3 Ultimate WII U','Hanya Tersedia untuk pembelian online saja.','',0),(39,1,'[WII U] New Super Mario Bros. U','','',0),(40,1,'TOM CLANCY\'S SPLINTER CELL : BLACK LIST','Hanya Tersedia untuk pembelian online saja.','',0),(41,1,'[WII U] Zombi U','Hanya Tersedia untuk pembelian online saja.','',0),(42,1,'The Legend of Zelda The Wind Waker HD','Hanya Tersedia untuk pembelian online saja.','',0),(43,1,'Nintendo WII U Deluxe Set (US)','Hanya Tersedia untuk pembelian online saja.\r\n\r\nKelengkapan :\r\n\r\nNintendo Wii U Console 32GB (Black)\r\nWii U GamePad\r\nAC Adapter for each\r\nWii U Sensor Bar\r\nWii U Sensor Bar\r\nGamePad Charging Cradle\r\nStands for GamePad and Console\r\nNintendo Land Video Game','',0),(44,1,'PS4 Camera','','',0),(45,1,'PS4 Dualshock 4','','',0),(46,1,'[PS4] Battlefield 4 (Reg 3) English','','',0),(47,1,'[PS4] FIFA 14 (Reg 3) English','','',0),(48,1,'Infamous Second Son (Reg 3) English','','',0),(49,1,'[PS4] Killzone Shadow Fall (Reg 3) English','','',0),(50,1,'[PS4] Knack (Reg 3) English','','',0),(51,1,'Metal Gear Solid V Ground Zeroes (PS4) Reg 3 English','Ready 18 maret 2014','',0),(52,1,'[PS4] Need for Speed Rivals (Reg 3) English','','',0),(53,1,'PS Vita Car Holder','Holder untuk menaruh PS Vita anda di kaca mobil, cocok bagi anda yang ingin menikmati multimedia PS Vita di mobil anda.','',0),(54,1,'PS Vita Flexible Handgrip','Pegangan tangan untuk PS Vita anda, dijamin akan menambah kenyamanan bermain anda.','',0),(55,1,'PS Vita Power Grip (Nyko)','Get a new hold on PlayStation Vita with Nyko’s Power Grip. The Power Grip provides more play time for all your favorite PS Vita games and provides a better, more familiar and ergonomic grip to ease strain on hands. The grip features a sleek design for easy storage, a matching black finish to compliment the PS Vita, and a lightweight design that makes it ideal for travel. The Power Grip is great for longer, more comfortable gameplay sessions for any PS Vita owner.','',0),(56,1,'Danganronpa Trigger Happy Havoc (Reg 1) English','','',0),(57,1,'Deception IV Blood Ties (Reg 3) English','Ready 25 Mar 2014','',0),(58,1,'Dragon Ball Z Battle of Z PS Vita (Reg 2) English','','',0),(59,1,'Dynasty Warriors 8 Xtreme Legends Complete Edition PS Vita Reg 3','','',0),(60,1,'Final Fantasy X / X-2 HD Remaster (Reg 1) English','Ready Maret 2014','',0),(61,1,'Hatsunemiku Project Diva 2nd (Reg 3) JAPAN','','',0),(62,1,'J Star Victory (Reg 2) JAPAN','Ready Maret 2014','',0),(63,1,'Paket Hemat PS Vita Crystal Black 64gb (WIFI Model)','Isi Paket :\r\n1 x PS Vita WIFI model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 64gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case\r\n1 x Crystal Case ATAU Silicon Case (Plih Salah Satu)','',0),(64,1,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Black) 16gb','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(65,1,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Khaki Black','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(66,1,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Light Blue ','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(67,1,'Paket Hemat PS Vita PlayStation Vita New Slim Model (Lime Green ','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(68,1,'Paket Hemat PS Vita PlayStation Vita New Slim Model (White) 16gb','Isi Paket :\r\n1 x PS Vita New Slim Model\r\n1 x AC Adapter (100-240V)\r\n1 x Kabel Data\r\n1 x Memory Card 16gb\r\n1 x Screen Guard Depan Belakang Full Body\r\n1 x Games BEBAS PILIH (Max Harga 400rb)\r\n1 x Airfoam Case','',0),(69,1,'PS Vita TV Value Pack (Reg 3) English','Box content :\r\n1 x ps vita tv\r\n1 x 8gb memory\r\n1 x dualshock 3\r\n1 x HDMI Cable\r\n1 x Power Adapter\r\n1 x Charger Cable\r\nfeatures\r\nCPU: ARM Cortex-A9 core (4core)\r\nWi-Fi: IEEE 802.11b/g/n (n=1×1)\r\n1 GB Internal Memory\r\ndescription\r\nAnother surprise reveal from Sony at the Pre TGS press con was the unvieling of the PS Vita TV, a brand new item in the growing Vita family. While the main idea of this tiny device is the ability to play Vita games on a television, the PS Vita TV is capable of a lot more.\r\n\r\nMeasuring 6cm by 10cm - making this the smallest PlayStation hardware ever, the PS Vita TV has 2 card slots: for Vita games and Vita Memory Cards; it will connect to the DualShock 3 controller with future support for the DualShock 4. While this may already be appealing for those who would enjoy the Vita experience on a bigger screen, the PS Vita extends it\'s functionality by enabling video streaming services and more. PSone Classics and PSP games from a digital library can also be played; Remote Play with a PS4 is a definite possibility in the future as well.','',0),(70,1,'Playstation 4','Box Content :\r\n\r\nPS4 500gb HDD\r\nDualshock 4\r\nHDMI Cable\r\nPower Cable\r\nCharger Cable','',0),(34,2,'Nintendo 3DS XL Red (Bonus Mario 3D Land Pre Installed)','','',0),(35,2,'WII U Gamepad Crystal Case','','',0),(36,2,'WII U Gamepad Screen Guard (Project Design)','','',0),(37,2,'[WII U] DISNEY INFINITY','Hanya Tersedia untuk pembelian online saja.','',0),(38,2,'Monster Hunter 3 Ultimate WII U','Hanya Tersedia untuk pembelian online saja.','',0),(39,2,'[WII U] New Super Mario Bros. U','','',0),(40,2,'TOM CLANCY\'S SPLINTER CELL : BLACK LIST','Hanya Tersedia untuk pembelian online saja.','',0),(41,2,'[WII U] Zombi U','Hanya Tersedia untuk pembelian online saja.','',0),(42,2,'The Legend of Zelda The Wind Waker HD','Hanya Tersedia untuk pembelian online saja.','',0),(43,2,'Nintendo WII U Deluxe Set (US)','Hanya Tersedia untuk pembelian online saja.\r\n\r\nKelengkapan :\r\n\r\nNintendo Wii U Console 32GB (Black)\r\nWii U GamePad\r\nAC Adapter for each\r\nWii U Sensor Bar\r\nWii U Sensor Bar\r\nGamePad Charging Cradle\r\nStands for GamePad and Console\r\nNintendo Land Video Game','',0),(29,1,'3DS XL Tough Case','','',0),(30,1,'Bravely Default (English)','','',0),(31,1,'ETRIAN ODYSSEY UNTOLD : THE MILLENIUM GIRL','','',0),(32,1,'Hometown Story','','',0),(33,1,'Nintendo 2DS Blue','FEATURES\r\nCompatibility with all Nintendo 3DS and most Nintendo DS games\r\nAccess to the Nintendo eShop, with digital games, free demos, and special offers\r\nWireless connectivity for multiplayer and co-op play\r\nParental controls that let adults manage the system\'s content\r\nDESCRIPTION \r\n \r\nOffering you additional variety and value in your handheld gaming options, the Nintendo 2DS is a streamlined version of the Nintendo 3DS that will play games available for Nintendo 3DS, as well as Nintendo DS in 2D.\r\n\r\nThe Nintendo 2DS retains many of the same hardware features as the Nintendo 3DS including the same Nintendo 3DS gameplay controls, backwards compatibility with the vast existing library of Nintendo DS games, as well as wireless connectivity features such as access to Nintendo eShop as well as StreetPass and SpotPass functionality. However the console takes on a new distinctive fixed, slate form design, and will play all packaged and download Nintendo 3DS games in 2D.\r\n\r\nThe new console is designed as an entry point into, or a new way to enjoy the Nintendo handheld experience and will be available at launch in two colour combinations, Black & Blue and White & Red, with a Nintendo 2DS Carrying Case (in either Blue or Red) that can be purchased separately.','',0);

/*Table structure for table `products_images` */

DROP TABLE IF EXISTS `products_images`;

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `image` varchar(64) collate utf8_unicode_ci default NULL,
  `htmlcontent` text collate utf8_unicode_ci,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_images` */

/*Table structure for table `products_notifications` */

DROP TABLE IF EXISTS `products_notifications`;

CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_notifications` */

/*Table structure for table `products_options` */

DROP TABLE IF EXISTS `products_options`;

CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_name` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`products_options_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_options` */

insert  into `products_options`(`products_options_id`,`language_id`,`products_options_name`) values (1,1,'Color'),(2,1,'Size'),(3,1,'Model'),(4,1,'Memory'),(5,1,'Version'),(1,2,'Color'),(2,2,'Size'),(3,2,'Model'),(4,2,'Memory'),(5,2,'Version');

/*Table structure for table `products_options_values` */

DROP TABLE IF EXISTS `products_options_values`;

CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_values_name` varchar(64) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`products_options_values_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_options_values` */

insert  into `products_options_values`(`products_options_values_id`,`language_id`,`products_options_values_name`) values (1,1,'4 mb'),(2,1,'8 mb'),(3,1,'16 mb'),(4,1,'32 mb'),(5,1,'Value'),(6,1,'Premium'),(7,1,'Deluxe'),(8,1,'PS/2'),(9,1,'USB'),(10,1,'Download: Windows - English'),(13,1,'Box: Windows - English'),(1,2,'4 mb'),(2,2,'8 mb'),(3,2,'16 mb'),(4,2,'32 mb'),(5,2,'Value'),(6,2,'Premium'),(7,2,'Deluxe'),(8,2,'PS/2'),(9,2,'USB'),(10,2,'Download: Windows - English'),(13,2,'Box: Windows - English');

/*Table structure for table `products_options_values_to_products_options` */

DROP TABLE IF EXISTS `products_options_values_to_products_options`;

CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL auto_increment,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_options_values_to_products_options_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_options_values_to_products_options` */

insert  into `products_options_values_to_products_options`(`products_options_values_to_products_options_id`,`products_options_id`,`products_options_values_id`) values (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,5,10),(13,5,13);

/*Table structure for table `products_to_categories` */

DROP TABLE IF EXISTS `products_to_categories`;

CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_id`,`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products_to_categories` */

insert  into `products_to_categories`(`products_id`,`categories_id`) values (29,26),(30,27),(31,27),(32,27),(33,28),(34,28),(35,29),(36,29),(37,30),(38,30),(39,30),(40,30),(41,30),(42,30),(43,31),(44,32),(45,32),(46,33),(47,33),(48,33),(49,33),(50,33),(51,33),(52,33),(53,35),(54,35),(55,35),(56,36),(57,36),(58,36),(59,36),(60,36),(61,36),(62,36),(63,37),(64,37),(65,37),(66,37),(67,37),(68,37),(69,37),(70,34);

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) default NULL,
  `customers_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `reviews_rating` int(1) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  `reviews_status` tinyint(1) NOT NULL default '0',
  `reviews_read` int(5) NOT NULL default '0',
  PRIMARY KEY  (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reviews` */

/*Table structure for table `reviews_description` */

DROP TABLE IF EXISTS `reviews_description`;

CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reviews_description` */

/*Table structure for table `sec_directory_whitelist` */

DROP TABLE IF EXISTS `sec_directory_whitelist`;

CREATE TABLE `sec_directory_whitelist` (
  `id` int(11) NOT NULL auto_increment,
  `directory` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sec_directory_whitelist` */

insert  into `sec_directory_whitelist`(`id`,`directory`) values (1,'admin/backups'),(2,'admin/images/graphs'),(3,'images'),(4,'images/banners'),(5,'images/dvd'),(6,'images/gt_interactive'),(7,'images/hewlett_packard'),(8,'images/matrox'),(9,'images/microsoft'),(10,'images/samsung'),(11,'images/sierra'),(12,'includes/work'),(13,'pub');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `sesskey` varchar(32) collate utf8_unicode_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`sesskey`,`expiry`,`value`) values ('5fa3d204e13b27b9414c9a91a215f7e9',1397462266,'language|s:7:\"english\";languages_id|s:1:\"1\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:5:\"admin\";}'),('23254b8ce03b848b58b86c531f959772',1397462101,'sessiontoken|s:32:\"21854ff353ecd47810c5d23330176fae\";cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:9:\"indonesia\";languages_id|s:1:\"2\";currency|s:3:\"IDR\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:2:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:2:\"48\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');

/*Table structure for table `specials` */

DROP TABLE IF EXISTS `specials`;

CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime default NULL,
  `specials_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `specials` */

insert  into `specials`(`specials_id`,`products_id`,`specials_new_products_price`,`specials_date_added`,`specials_last_modified`,`expires_date`,`date_status_change`,`status`) values (5,70,'6000000.0000','2014-04-14 14:11:19',NULL,NULL,NULL,1);

/*Table structure for table `tax_class` */

DROP TABLE IF EXISTS `tax_class`;

CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `tax_class_title` varchar(32) collate utf8_unicode_ci NOT NULL,
  `tax_class_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tax_class` */

insert  into `tax_class`(`tax_class_id`,`tax_class_title`,`tax_class_description`,`last_modified`,`date_added`) values (1,'Taxable Goods','The following types of products are included non-food, services, etc','2014-04-14 13:25:44','2014-04-14 13:25:44');

/*Table structure for table `tax_rates` */

DROP TABLE IF EXISTS `tax_rates`;

CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL auto_increment,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) default '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_rates_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tax_rates` */

insert  into `tax_rates`(`tax_rates_id`,`tax_zone_id`,`tax_class_id`,`tax_priority`,`tax_rate`,`tax_description`,`last_modified`,`date_added`) values (1,1,1,1,'7.0000','FL TAX 7.0%','2014-04-14 13:25:44','2014-04-14 13:25:44');

/*Table structure for table `whos_online` */

DROP TABLE IF EXISTS `whos_online`;

CREATE TABLE `whos_online` (
  `customer_id` int(11) default NULL,
  `full_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `session_id` varchar(128) collate utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) collate utf8_unicode_ci NOT NULL,
  `time_entry` varchar(14) collate utf8_unicode_ci NOT NULL,
  `time_last_click` varchar(14) collate utf8_unicode_ci NOT NULL,
  `last_page_url` text collate utf8_unicode_ci NOT NULL,
  KEY `idx_whos_online_session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `whos_online` */

insert  into `whos_online`(`customer_id`,`full_name`,`session_id`,`ip_address`,`time_entry`,`time_last_click`,`last_page_url`) values (0,'Guest','23254b8ce03b848b58b86c531f959772','127.0.0.1','1397459592','1397460661','/uts/catalog/product_info.php?products_id=48');

/*Table structure for table `zones` */

DROP TABLE IF EXISTS `zones`;

CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) collate utf8_unicode_ci NOT NULL,
  `zone_name` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `zones` */

insert  into `zones`(`zone_id`,`zone_country_id`,`zone_code`,`zone_name`) values (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubünden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');

/*Table structure for table `zones_to_geo_zones` */

DROP TABLE IF EXISTS `zones_to_geo_zones`;

CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) default NULL,
  `geo_zone_id` int(11) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `zones_to_geo_zones` */

insert  into `zones_to_geo_zones`(`association_id`,`zone_country_id`,`zone_id`,`geo_zone_id`,`last_modified`,`date_added`) values (1,223,18,1,NULL,'2014-04-14 13:25:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
