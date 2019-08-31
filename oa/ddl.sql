drop database if exists oa;

create database oa;

use oa;

create table user
(
	id int auto_increment comment '用户id'
		primary key,
	account varchar(255) not null comment '用户账号(唯一)',
	password varchar(255) not null comment '密码',
	real_name varchar(255) not null comment '真实姓名',
	salt varchar(255) not null comment 'MD5盐值',
	email varchar(255) null comment '用户邮箱(唯一)',
	phone_number varchar(255) null comment '用户手机号',
	create_time datetime null comment '用户创建时间',
	last_login_time datetime null comment '上一次登陆时间',
	status int default 0 null comment '账号锁定状态 0 为未锁定 1为1锁定',
	constraint account		unique (account),
	constraint email		unique (email),
	role_id int null comment '角色id(外键)'
) comment '用户信息';