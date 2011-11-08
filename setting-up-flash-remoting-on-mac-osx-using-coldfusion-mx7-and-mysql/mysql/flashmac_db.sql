# CocoaMySQL dump
# Version 0.6.5
# http://cocoamysql.sourceforge.net
#
# Host: localhost (MySQL 4.1.13-max)
# Database: flashmac
# Generation Time: 2007-05-01 17:10:45 +0100
# ************************************************************

# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(35) NOT NULL default '',
  `password` varchar(35) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`,`username`,`password`) VALUES ('1','newtriks','flashmac');


