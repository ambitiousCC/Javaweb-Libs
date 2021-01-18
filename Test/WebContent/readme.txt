## 项目说明

## 数据库
注：本实验使用mysql5.7版本完成，请配合NAVICAT使用

1. 数据库建库建表语句
```sql
CREATE DATABASE dbbook DEFAULT CHARACTER SET utf8;
USE dbbook;
```

2. 实验三用到的book表
创建
```sql
CREATE TABLE IF NOT EXISTS `book`(
`id` int(11) AUTO_INCREMENT COMMENT "ID",
`name` varchar(50) DEFAULT NULL COMMENT "姓名",
`price` float DEFAULT NULL COMMENT "价格",
`bookCount` int(11) DEFAULT NULL COMMENT "数量",
`author` varchar(45) DEFAULT NULL COMMENT "作者",
PRIMARY KEY(`id`)
);
```
插入
```
INSERT INTO `book` VALUES(DEFAULT,"Java",34.4,7,"张三");
```
3. 实验三中登陆用到的user表
创建
```sql
CREATE TABLE IF NOT EXISTS `user`(
`id` int(10) AUTO_INCREMENT,
`username` varchar(50) COMMENT '用户名',
`password` varchar(50) COMMENT '密码',
PRIMARY KEY(`id`)
);
```
4. 实验五用到的book_info表

create table book_info(
id int(11) primary key auto_increment comment "编号",
name varchar(50) comment "姓名",
price float comment "价格",
author varchar(50) comment "作者",
press varchar(50) comment "出版社",
storageCount int(11) comment "数量"
);

CREATE TABLE IF NOT EXISTS `book_details`(
`id` int(11) AUTO_INCREMENT COMMENT "ID",
`name` varchar(50) DEFAULT NULL COMMENT "姓名",
`price` float DEFAULT NULL COMMENT "价格",
`book_count` int(11) DEFAULT NULL COMMENT "数量",
`author` varchar(45) DEFAULT NULL COMMENT "作者",
`press` varchar(45) DEFAULT NULL COMMENT "出版社",
`pages` int(5) DEFAULT NULL COMMENT "页数",
PRIMARY KEY(`id`)
);

INSERT INTO book_details(name,price,author,press,pages) values('Java Web应用开发与实践(第2版)',44.5,'梁胜彬、乔保军、李小丽、王金科、渠慎明、史蕊、王龙葛','清华大学出版社',402);
mysql乱码解决
set character_set_server=utf8;
set character_set_database=utf8;
show variables like '%char%';
或者修改my.inf配置文件
[mysqld]
character-set-server=utf8 
[client]
default-character-set=utf8 
[mysql]
default-character-set=utf8
关闭MySQL服务：net stop mysql
重启MySQL服务：net start mysql