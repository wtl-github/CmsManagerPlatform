/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.62-community : Database - admin_cms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admin_cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `admin_cms`;

/*Table structure for table `sys_permissions` */

DROP TABLE IF EXISTS `sys_permissions`;

CREATE TABLE `sys_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `permissions` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名称',
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '权限描述',
  `available` int(1) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_permissions` */

insert  into `sys_permissions`(`id`,`permissions`,`description`,`available`) values (1,'basic','基础功能',1),(2,'users','用户管理',1),(3,'articles','文章管理',1);

/*Table structure for table `sys_permissions_resources` */

DROP TABLE IF EXISTS `sys_permissions_resources`;

CREATE TABLE `sys_permissions_resources` (
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`permission_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_permissions_resources` */

insert  into `sys_permissions_resources`(`permission_id`,`resource_id`) values (1,1),(2,2),(2,3),(2,4);

/*Table structure for table `sys_resources` */

DROP TABLE IF EXISTS `sys_resources`;

CREATE TABLE `sys_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `resource` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源描述',
  `available` int(1) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_resources` */

insert  into `sys_resources`(`id`,`resource`,`description`,`available`) values (1,'/sys/index','首页',1),(2,'/sys/users/add','用户管理_增加',1),(3,'/sys/users/delete','用户管理_删除',1),(4,'/sys/users/update','用户管理_更新',1);

/*Table structure for table `sys_roles` */

DROP TABLE IF EXISTS `sys_roles`;

CREATE TABLE `sys_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `role` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `available` int(1) DEFAULT NULL COMMENT '生效标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_roles` */

insert  into `sys_roles`(`id`,`role`,`description`,`available`) values (1,'ROLE_ADMIN','系统管理员',1);

/*Table structure for table `sys_roles_permissions` */

DROP TABLE IF EXISTS `sys_roles_permissions`;

CREATE TABLE `sys_roles_permissions` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_roles_permissions` */

insert  into `sys_roles_permissions`(`role_id`,`permission_id`) values (1,1),(1,2),(1,3);

/*Table structure for table `sys_user_roles` */

DROP TABLE IF EXISTS `sys_user_roles`;

CREATE TABLE `sys_user_roles` (
  `user_id` int(11) NOT NULL COMMENT '用户表id',
  `role_id` int(11) NOT NULL COMMENT '角色表id',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_user_roles` */

insert  into `sys_user_roles`(`user_id`,`role_id`) values (1,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `enabled` int(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`enabled`) values (1,'admin','admin',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
