# 实验

> 由于之前并没有系统的学习SSM框架的知识，只是搜索各种配置文件，折腾了很多时间，最终能够建立这样一个小demo，能够让我更加深入理解SSM的框架是如何建立交互的。

## 说明
本项目基于eclipse开发，基于SSM框架，实现了简单的用户注册登陆的功能

## 使用方法

导入项目请严格按照这里流程

1. 新建动态项目
2. 将本文件中的src中的Java源码拷贝
3. 将Webcontent中的源码拷贝
4. 检查WEB-INF下lib文件夹是否导入成功
5. 设置项目的JRE版本与本机一致
6. 设置jdk版本一致
7. 检查项目编码设置，UTF-8
8. 检查jdbc配置文件，设置本地数据库的用户名密码
9. 导入数据库，建立以下表：

+++info
```sql
/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : dbbook

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 22/12/2020 23:24:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'cuiqin', 'cuiqin233');
INSERT INTO `user` VALUES (2, 'root', 'root');

SET FOREIGN_KEY_CHECKS = 1;

```
+++

## 项目细节

1. 使用了最新版本的bootstrap实现了登陆注册的布局

2. 严格按照实验报告要求：在前端form封装user对象传递到后端处理，再返回处理的结果

3. 实现了mybatis整合，但是具体原理还没有深入学习