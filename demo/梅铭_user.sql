use tt;
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


create table role
(
	id int auto_increment comment '角色id'		primary key,
	name varchar(255) not null comment '角色名称',
	description varchar(255) null comment '角色描述'
) comment '角色信息';

INSERT INTO `role` VALUES ('1', '客户经理', '负责管理客户');
INSERT INTO `role` VALUES ('2', '销售主管', '负责管理客户经理');
INSERT INTO `role` VALUES ('3', '高管', '负责整个销售部门');
INSERT INTO `role` VALUES ('4', '管理员', '负责系统的维护等');
INSERT INTO `role` VALUES ('5', '开发者', '所有页面,所有功能');





insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('normal','55f1a4e0142bd04dc4c456812ee34b1e','赵','normal','normal','',curdate(),curdate(),1);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('manager','bb2ec153e560c6cb94a35b370eb7a07b','钱','manager','manager','',curdate(),curdate(),2);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('boss','e67a1ef6138e34afe916d5fa2f115079','孙','boss','boss','',curdate(),curdate(),3);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('admin','3ef7164d1f6167cb9f2658c07d3c2f0a','李','admin','admin','',curdate(),curdate(),4);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('root','88aec6f4d07b756329e42eb50c4688dd','may','root','root','',curdate(),curdate(),5);


# 供使唤的客户经理
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('xiaoming','123','小明','55555','xiaoming','',curdate(),curdate(),1);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('xiaohong','123','小红','55555','xiaohong','',curdate(),curdate(),1);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('xiaohuang','123','小黄','55555','xiaohuang','',curdate(),curdate(),1);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('xiaoli','123','小里','55555','xiaoli','',curdate(),curdate(),1);
insert into user (account, password, real_name, salt, email, phone_number, create_time, last_login_time, role_id)
values ('xiaobai','123','小白','55555','xiaobai','',curdate(),curdate(),1);



drop table if exists permission;
create table permission
(
	id int auto_increment comment '权限id'
		primary key,
	type int not null comment '概要类型：0为菜单 1为功能',
	title varchar(255) not null comment '权限标题',
	description varchar(255) null comment '权限描述',
	url varchar(255) not null comment '权限对应可使用的url',
	code varchar(255) not null comment '权限编码(唯一)',
	status int(11) unsigned zerofill default 0 not null comment '权限状态：0 为正常 1为禁用',
	constraint code		unique (code),
	pid int null comment '上级id(外键)'
) comment '权限信息';

insert into permission (id, type, title, description, url, code, status, pid) values (1,0,'客户关系管理系统','顶级菜单','','1',0,null);

insert into permission (id, type, title, description, url, code, status, pid) values (2,0,'营销管理','二级菜单','','100',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (3,0,'销售机会管理','三级菜单','/view/sale/opportunity.jsp','101',0,2);
insert into permission (id, type, title, description, url, code, status, pid) values (4,0,'客户开发计划','三级菜单','/view/sale/plane.jsp','102',0,2);

insert into permission (id, type, title, description, url, code, status, pid) values (5,0,'客户管理','二级菜单','','200',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (6,0,'客户信息管理','三级菜单','/view/customer/customerInfo.jsp','201',0,5);
insert into permission (id, type, title, description, url, code, status, pid) values (7,0,'客户流失管理','三级菜单','/view/customer/customerLoss.jsp','202',0,5);

insert into permission (id, type, title, description, url, code, status, pid) values (8,0,'服务管理','二级菜单','','300',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (9,0,'服务创建','三级级菜单','/view/serviceModule/serviceCreation.jsp','301',0,8);
insert into permission (id, type, title, description, url, code, status, pid) values (10,0,'服务分配','三级级菜单','/view/serviceModule/serviceAllocation.jsp','302',0,8);
insert into permission (id, type, title, description, url, code, status, pid) values (11,0,'服务处理','三级级菜单','/view/serviceModule/serviceDispose.jsp','303',0,8);
insert into permission (id, type, title, description, url, code, status, pid) values (12,0,'服务反馈','三级级菜单','/view/serviceModule/serviceFeedback.jsp','304',0,8);
insert into permission (id, type, title, description, url, code, status, pid) values (13,0,'服务归档','三级级菜单','/view/serviceModule/serviceFile.jsp','305',0,8);


insert into permission (id, type, title, description, url, code, status, pid) values (14,0,'统计报表','二级菜单','','400',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (15,0,'客户贡献分析','三级菜单','/view/count/contributionAnalysis.jsp','401',0,14);
insert into permission (id, type, title, description, url, code, status, pid) values (16,0,'客户构成分析','三级菜单','/view/count/componentAnalysis.jsp','402',0,14);
insert into permission (id, type, title, description, url, code, status, pid) values (17,0,'客户服务分析','三级菜单','/view/count/serviceAnalysis.jsp','403',0,14);
insert into permission (id, type, title, description, url, code, status, pid) values (18,0,'客户流失分析','三级菜单','/view/count/lossAnalysis.jsp','404',0,14);

insert into permission (id, type, title, description, url, code, status, pid) values (19,0,'基础数据','二级菜单','','500',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (20,0,'数据字典管理','三级菜单','/view/base/dictionary.jsp','501',0,19);
insert into permission (id, type, title, description, url, code, status, pid) values (21,0,'查询产品信息','三级菜单','/view/base/product.jsp','502',0,19);
insert into permission (id, type, title, description, url, code, status, pid) values (22,0,'查询库存','三级菜单','/view/base/repertory.jsp','503',0,19);
insert into permission (id, type, title, description, url, code, status, pid) values (23,0,'客户流失管理','三级菜单','/view/customer/customerLossApplyFor.jsp','203',0,5);
insert into permission (id, type, title, description, url, code, status, pid) values (24,0,'账户管理','二级菜单','','600',0,1);
insert into permission (id, type, title, description, url, code, status, pid) values (25,0,'账户列表','三级菜单','/view/user/user_list.jsp','601',0,24);




create table role_permission
(
	id int auto_increment comment 'id'		primary key,
	role_id int null comment '角色id(外键)',
	permission_id int null comment '权限id(外键)'
) comment '权限与角色关联信息';

# 主菜单权限
insert into role_permission (id, role_id, permission_id) values (null,1,1);
insert into role_permission (id, role_id, permission_id) values (null,2,1);
insert into role_permission (id, role_id, permission_id) values (null,3,1);
insert into role_permission (id, role_id, permission_id) values (null,4,1);

# 销售主管
insert into role_permission (id, role_id, permission_id) values (null,2,2);
insert into role_permission (id, role_id, permission_id) values (null,2,3);
insert into role_permission (id, role_id, permission_id) values (null,2,4);
insert into role_permission (id, role_id, permission_id) values (null,2,5);
insert into role_permission (id, role_id, permission_id) values (null,2,6);
insert into role_permission (id, role_id, permission_id) values (null,2,23);
insert into role_permission (id, role_id, permission_id) values (null,2,10);
insert into role_permission (id, role_id, permission_id) values (null,2,13);
insert into role_permission (id, role_id, permission_id) values (null,2,13);
insert into role_permission (id, role_id, permission_id) values (null,2,14);
insert into role_permission (id, role_id, permission_id) values (null,2,15);
insert into role_permission (id, role_id, permission_id) values (null,2,16);
insert into role_permission (id, role_id, permission_id) values (null,2,17);
insert into role_permission (id, role_id, permission_id) values (null,2,18);

# 客户经理
insert into role_permission (id, role_id, permission_id) values (null,1,2);
insert into role_permission (id, role_id, permission_id) values (null,1,3);
insert into role_permission (id, role_id, permission_id) values (null,1,4);
insert into role_permission (id, role_id, permission_id) values (null,1,5);
insert into role_permission (id, role_id, permission_id) values (null,1,6);
insert into role_permission (id, role_id, permission_id) values (null,1,7);
insert into role_permission (id, role_id, permission_id) values (null,1,8);
insert into role_permission (id, role_id, permission_id) values (null,1,9);
insert into role_permission (id, role_id, permission_id) values (null,1,10);
insert into role_permission (id, role_id, permission_id) values (null,1,11);
insert into role_permission (id, role_id, permission_id) values (null,1,12);
insert into role_permission (id, role_id, permission_id) values (null,1,13);
insert into role_permission (id, role_id, permission_id) values (null,1,19);
insert into role_permission (id, role_id, permission_id) values (null,1,21);
insert into role_permission (id, role_id, permission_id) values (null,1,22);

# 高管
insert into role_permission (id, role_id, permission_id) values (null,3,14);
insert into role_permission (id, role_id, permission_id) values (null,3,15);
insert into role_permission (id, role_id, permission_id) values (null,3,16);
insert into role_permission (id, role_id, permission_id) values (null,3,17);
insert into role_permission (id, role_id, permission_id) values (null,3,18);

# 管理员
insert into role_permission (id, role_id, permission_id) values (null,4,19);
insert into role_permission (id, role_id, permission_id) values (null,4,20);
insert into role_permission (id, role_id, permission_id) values (null,4,21);
insert into role_permission (id, role_id, permission_id) values (null,4,22);
insert into role_permission (id, role_id, permission_id) values (null,4,24);
insert into role_permission (id, role_id, permission_id) values (null,4,25);


# 开发人员
insert into role_permission (id, role_id, permission_id) values (null,5,1);
insert into role_permission (id, role_id, permission_id) values (null,5,2);
insert into role_permission (id, role_id, permission_id) values (null,5,3);
insert into role_permission (id, role_id, permission_id) values (null,5,4);
insert into role_permission (id, role_id, permission_id) values (null,5,5);
insert into role_permission (id, role_id, permission_id) values (null,5,6);
insert into role_permission (id, role_id, permission_id) values (null,5,7);
insert into role_permission (id, role_id, permission_id) values (null,5,8);
insert into role_permission (id, role_id, permission_id) values (null,5,9);
insert into role_permission (id, role_id, permission_id) values (null,5,10);
insert into role_permission (id, role_id, permission_id) values (null,5,11);
insert into role_permission (id, role_id, permission_id) values (null,5,12);
insert into role_permission (id, role_id, permission_id) values (null,5,13);
insert into role_permission (id, role_id, permission_id) values (null,5,14);
insert into role_permission (id, role_id, permission_id) values (null,5,15);
insert into role_permission (id, role_id, permission_id) values (null,5,16);
insert into role_permission (id, role_id, permission_id) values (null,5,17);
insert into role_permission (id, role_id, permission_id) values (null,5,18);
insert into role_permission (id, role_id, permission_id) values (null,5,19);
insert into role_permission (id, role_id, permission_id) values (null,5,20);
insert into role_permission (id, role_id, permission_id) values (null,5,21);
insert into role_permission (id, role_id, permission_id) values (null,5,22);
insert into role_permission (id, role_id, permission_id) values (null,5,24);
insert into role_permission (id, role_id, permission_id) values (null,5,25);

#
# -- ----------------------------
# INSERT INTO `role_permission` VALUES (null, '3', '13');
# INSERT INTO `role_permission` VALUES (null, '3', '30');
# INSERT INTO `role_permission` VALUES (null, '3', '27');
# INSERT INTO `role_permission` VALUES (null, '3', '28');
# INSERT INTO `role_permission` VALUES (null, '3', '29');
# INSERT INTO `role_permission` VALUES (null, '3', '72');
# INSERT INTO `role_permission` VALUES (null, '3', '112');
# INSERT INTO `role_permission` VALUES (null, '3', '14');
# INSERT INTO `role_permission` VALUES (null, '3', '42');
# INSERT INTO `role_permission` VALUES (null, '3', '53');
# INSERT INTO `role_permission` VALUES (null, '3', '127');
# INSERT INTO `role_permission` VALUES (null, '3', '59');
# INSERT INTO `role_permission` VALUES (null, '3', '60');
# INSERT INTO `role_permission` VALUES (null, '3', '62');
# INSERT INTO `role_permission` VALUES (null, '3', '84');
# INSERT INTO `role_permission` VALUES (null, '3', '73');
# INSERT INTO `role_permission` VALUES (null, '3', '82');
# INSERT INTO `role_permission` VALUES (null, '3', '83');
# INSERT INTO `role_permission` VALUES (null, '3', '54');
# INSERT INTO `role_permission` VALUES (null, '3', '80');
# INSERT INTO `role_permission` VALUES (null, '3', '37');
# INSERT INTO `role_permission` VALUES (null, '3', '107');
# INSERT INTO `role_permission` VALUES (null, '3', '15');
# INSERT INTO `role_permission` VALUES (null, '3', '125');
# INSERT INTO `role_permission` VALUES (null, '3', '92');
# INSERT INTO `role_permission` VALUES (null, '3', '41');
# INSERT INTO `role_permission` VALUES (null, '3', '43');
# INSERT INTO `role_permission` VALUES (null, '3', '95');
# INSERT INTO `role_permission` VALUES (null, '3', '121');
# INSERT INTO `role_permission` VALUES (null, '3', '66');
# INSERT INTO `role_permission` VALUES (null, '3', '67');
# INSERT INTO `role_permission` VALUES (null, '3', '114');
# INSERT INTO `role_permission` VALUES (null, '3', '115');
# INSERT INTO `role_permission` VALUES (null, '3', '68');
# INSERT INTO `role_permission` VALUES (null, '3', '116');
# INSERT INTO `role_permission` VALUES (null, '3', '69');
# INSERT INTO `role_permission` VALUES (null, '3', '70');
# INSERT INTO `role_permission` VALUES (null, '3', '79');
# INSERT INTO `role_permission` VALUES (null, '3', '96');
# INSERT INTO `role_permission` VALUES (null, '3', '71');
# INSERT INTO `role_permission` VALUES (null, '3', '94');
# INSERT INTO `role_permission` VALUES (null, '3', '38');
# INSERT INTO `role_permission` VALUES (null, '3', '117');
# INSERT INTO `role_permission` VALUES (null, '3', '88');
# INSERT INTO `role_permission` VALUES (null, '3', '23');
# INSERT INTO `role_permission` VALUES (null, '3', '31');
# INSERT INTO `role_permission` VALUES (null, '3', '25');
# INSERT INTO `role_permission` VALUES (null, '3', '33');
# INSERT INTO `role_permission` VALUES (null, '3', '35');
# INSERT INTO `role_permission` VALUES (null, '4', '13');
# INSERT INTO `role_permission` VALUES (null, '4', '30');
# INSERT INTO `role_permission` VALUES (null, '4', '27');
# INSERT INTO `role_permission` VALUES (null, '4', '28');
# INSERT INTO `role_permission` VALUES (null, '4', '29');
# INSERT INTO `role_permission` VALUES (null, '4', '24');
# INSERT INTO `role_permission` VALUES (null, '4', '26');
# INSERT INTO `role_permission` VALUES (null, '4', '34');
# INSERT INTO `role_permission` VALUES (null, '4', '36');
# INSERT INTO `role_permission` VALUES (null, '4', '72');
# INSERT INTO `role_permission` VALUES (null, '4', '1');
# INSERT INTO `role_permission` VALUES (null, '4', '97');
# INSERT INTO `role_permission` VALUES (null, '4', '98');
# INSERT INTO `role_permission` VALUES (null, '4', '99');
# INSERT INTO `role_permission` VALUES (null, '4', '100');
# INSERT INTO `role_permission` VALUES (null, '4', '2');
# INSERT INTO `role_permission` VALUES (null, '4', '16');
# INSERT INTO `role_permission` VALUES (null, '4', '17');
# INSERT INTO `role_permission` VALUES (null, '4', '3');
# INSERT INTO `role_permission` VALUES (null, '4', '18');
# INSERT INTO `role_permission` VALUES (null, '4', '19');
# INSERT INTO `role_permission` VALUES (null, '4', '20');
# INSERT INTO `role_permission` VALUES (null, '4', '21');
# INSERT INTO `role_permission` VALUES (null, '4', '22');
# INSERT INTO `role_permission` VALUES (null, '4', '4');
# INSERT INTO `role_permission` VALUES (null, '4', '101');
# INSERT INTO `role_permission` VALUES (null, '4', '102');
# INSERT INTO `role_permission` VALUES (null, '4', '103');
# INSERT INTO `role_permission` VALUES (null, '4', '104');
# INSERT INTO `role_permission` VALUES (null, '4', '105');
# INSERT INTO `role_permission` VALUES (null, '4', '112');
# INSERT INTO `role_permission` VALUES (null, '4', '14');
# INSERT INTO `role_permission` VALUES (null, '4', '42');
# INSERT INTO `role_permission` VALUES (null, '4', '53');
# INSERT INTO `role_permission` VALUES (null, '4', '55');
# INSERT INTO `role_permission` VALUES (null, '4', '56');
# INSERT INTO `role_permission` VALUES (null, '4', '57');
# INSERT INTO `role_permission` VALUES (null, '4', '127');
# INSERT INTO `role_permission` VALUES (null, '4', '59');
# INSERT INTO `role_permission` VALUES (null, '4', '60');
# INSERT INTO `role_permission` VALUES (null, '4', '61');
# INSERT INTO `role_permission` VALUES (null, '4', '62');
# INSERT INTO `role_permission` VALUES (null, '4', '84');
# INSERT INTO `role_permission` VALUES (null, '4', '76');
# INSERT INTO `role_permission` VALUES (null, '4', '77');
# INSERT INTO `role_permission` VALUES (null, '4', '73');
# INSERT INTO `role_permission` VALUES (null, '4', '78');
# INSERT INTO `role_permission` VALUES (null, '4', '82');
# INSERT INTO `role_permission` VALUES (null, '4', '83');
# INSERT INTO `role_permission` VALUES (null, '4', '54');
# INSERT INTO `role_permission` VALUES (null, '4', '80');
# INSERT INTO `role_permission` VALUES (null, '4', '81');
# INSERT INTO `role_permission` VALUES (null, '4', '37');
# INSERT INTO `role_permission` VALUES (null, '4', '107');
# INSERT INTO `role_permission` VALUES (null, '4', '108');
# INSERT INTO `role_permission` VALUES (null, '4', '109');
# INSERT INTO `role_permission` VALUES (null, '4', '15');
# INSERT INTO `role_permission` VALUES (null, '4', '58');
# INSERT INTO `role_permission` VALUES (null, '4', '124');
# INSERT INTO `role_permission` VALUES (null, '4', '123');
# INSERT INTO `role_permission` VALUES (null, '4', '125');
# INSERT INTO `role_permission` VALUES (null, '4', '92');
# INSERT INTO `role_permission` VALUES (null, '4', '41');
# INSERT INTO `role_permission` VALUES (null, '4', '43');
# INSERT INTO `role_permission` VALUES (null, '4', '44');
# INSERT INTO `role_permission` VALUES (null, '4', '49');
# INSERT INTO `role_permission` VALUES (null, '4', '50');
# INSERT INTO `role_permission` VALUES (null, '4', '51');
# INSERT INTO `role_permission` VALUES (null, '4', '52');
# INSERT INTO `role_permission` VALUES (null, '4', '75');
# INSERT INTO `role_permission` VALUES (null, '4', '93');
# INSERT INTO `role_permission` VALUES (null, '4', '120');
# INSERT INTO `role_permission` VALUES (null, '4', '95');
# INSERT INTO `role_permission` VALUES (null, '4', '121');
# INSERT INTO `role_permission` VALUES (null, '4', '66');
# INSERT INTO `role_permission` VALUES (null, '4', '67');
# INSERT INTO `role_permission` VALUES (null, '4', '114');
# INSERT INTO `role_permission` VALUES (null, '4', '115');
# INSERT INTO `role_permission` VALUES (null, '4', '68');
# INSERT INTO `role_permission` VALUES (null, '4', '116');
# INSERT INTO `role_permission` VALUES (null, '4', '69');
# INSERT INTO `role_permission` VALUES (null, '4', '70');
# INSERT INTO `role_permission` VALUES (null, '4', '79');
# INSERT INTO `role_permission` VALUES (null, '4', '96');
# INSERT INTO `role_permission` VALUES (null, '4', '71');
# INSERT INTO `role_permission` VALUES (null, '4', '94');
# INSERT INTO `role_permission` VALUES (null, '4', '38');
# INSERT INTO `role_permission` VALUES (null, '4', '117');
# INSERT INTO `role_permission` VALUES (null, '4', '118');
# INSERT INTO `role_permission` VALUES (null, '4', '119');
# INSERT INTO `role_permission` VALUES (null, '4', '88');
# INSERT INTO `role_permission` VALUES (null, '4', '23');
# INSERT INTO `role_permission` VALUES (null, '4', '31');
# INSERT INTO `role_permission` VALUES (null, '4', '25');
# INSERT INTO `role_permission` VALUES (null, '4', '33');
# INSERT INTO `role_permission` VALUES (null, '4', '35');
# INSERT INTO `role_permission` VALUES (null, '1', '13');
# INSERT INTO `role_permission` VALUES (null, '1', '30');
# INSERT INTO `role_permission` VALUES (null, '1', '27');
# INSERT INTO `role_permission` VALUES (null, '1', '28');
# INSERT INTO `role_permission` VALUES (null, '1', '29');
# INSERT INTO `role_permission` VALUES (null, '1', '14');
# INSERT INTO `role_permission` VALUES (null, '1', '42');
# INSERT INTO `role_permission` VALUES (null, '1', '53');
# INSERT INTO `role_permission` VALUES (null, '1', '55');
# INSERT INTO `role_permission` VALUES (null, '1', '56');
# INSERT INTO `role_permission` VALUES (null, '1', '57');
# INSERT INTO `role_permission` VALUES (null, '1', '127');
# INSERT INTO `role_permission` VALUES (null, '1', '59');
# INSERT INTO `role_permission` VALUES (null, '1', '60');
# INSERT INTO `role_permission` VALUES (null, '1', '61');
# INSERT INTO `role_permission` VALUES (null, '1', '62');
# INSERT INTO `role_permission` VALUES (null, '1', '84');
# INSERT INTO `role_permission` VALUES (null, '1', '76');
# INSERT INTO `role_permission` VALUES (null, '1', '77');
# INSERT INTO `role_permission` VALUES (null, '1', '73');
# INSERT INTO `role_permission` VALUES (null, '1', '78');
# INSERT INTO `role_permission` VALUES (null, '1', '82');
# INSERT INTO `role_permission` VALUES (null, '1', '83');
# INSERT INTO `role_permission` VALUES (null, '1', '81');
# INSERT INTO `role_permission` VALUES (null, '1', '80');
# INSERT INTO `role_permission` VALUES (null, '1', '54');
# INSERT INTO `role_permission` VALUES (null, '1', '37');
# INSERT INTO `role_permission` VALUES (null, '1', '107');
# INSERT INTO `role_permission` VALUES (null, '1', '108');
# INSERT INTO `role_permission` VALUES (null, '1', '109');
# INSERT INTO `role_permission` VALUES (null, '1', '15');
# INSERT INTO `role_permission` VALUES (null, '1', '58');
# INSERT INTO `role_permission` VALUES (null, '1', '124');
# INSERT INTO `role_permission` VALUES (null, '1', '123');
# INSERT INTO `role_permission` VALUES (null, '1', '125');
# INSERT INTO `role_permission` VALUES (null, '1', '92');
# INSERT INTO `role_permission` VALUES (null, '1', '41');
# INSERT INTO `role_permission` VALUES (null, '1', '43');
# INSERT INTO `role_permission` VALUES (null, '1', '44');
# INSERT INTO `role_permission` VALUES (null, '1', '49');
# INSERT INTO `role_permission` VALUES (null, '1', '50');
# INSERT INTO `role_permission` VALUES (null, '1', '51');
# INSERT INTO `role_permission` VALUES (null, '1', '52');
# INSERT INTO `role_permission` VALUES (null, '1', '75');
# INSERT INTO `role_permission` VALUES (null, '1', '93');
# INSERT INTO `role_permission` VALUES (null, '1', '120');
# INSERT INTO `role_permission` VALUES (null, '1', '38');
# INSERT INTO `role_permission` VALUES (null, '1', '117');
# INSERT INTO `role_permission` VALUES (null, '1', '118');
# INSERT INTO `role_permission` VALUES (null, '1', '119');
# INSERT INTO `role_permission` VALUES (null, '1', '69');
# INSERT INTO `role_permission` VALUES (null, '1', '70');
# INSERT INTO `role_permission` VALUES (null, '1', '79');
# INSERT INTO `role_permission` VALUES (null, '1', '96');
# INSERT INTO `role_permission` VALUES (null, '1', '71');
# INSERT INTO `role_permission` VALUES (null, '1', '94');
# INSERT INTO `role_permission` VALUES (null, '1', '66');
# INSERT INTO `role_permission` VALUES (null, '1', '67');
# INSERT INTO `role_permission` VALUES (null, '1', '114');
# INSERT INTO `role_permission` VALUES (null, '1', '115');
# INSERT INTO `role_permission` VALUES (null, '1', '68');
# INSERT INTO `role_permission` VALUES (null, '1', '116');
# INSERT INTO `role_permission` VALUES (null, '1', '88');
# INSERT INTO `role_permission` VALUES (null, '1', '23');
# INSERT INTO `role_permission` VALUES (null, '1', '31');
# INSERT INTO `role_permission` VALUES (null, '1', '25');
# INSERT INTO `role_permission` VALUES (null, '1', '33');
# INSERT INTO `role_permission` VALUES (null, '1', '35');
# INSERT INTO `role_permission` VALUES (null, '2', '13');
# INSERT INTO `role_permission` VALUES (null, '2', '30');
# INSERT INTO `role_permission` VALUES (null, '2', '27');
# INSERT INTO `role_permission` VALUES (null, '2', '28');
# INSERT INTO `role_permission` VALUES (null, '2', '29');
# INSERT INTO `role_permission` VALUES (null, '2', '14');
# INSERT INTO `role_permission` VALUES (null, '2', '42');
# INSERT INTO `role_permission` VALUES (null, '2', '53');
# INSERT INTO `role_permission` VALUES (null, '2', '127');
# INSERT INTO `role_permission` VALUES (null, '2', '59');
# INSERT INTO `role_permission` VALUES (null, '2', '62');
# INSERT INTO `role_permission` VALUES (null, '2', '84');
# INSERT INTO `role_permission` VALUES (null, '2', '82');
# INSERT INTO `role_permission` VALUES (null, '2', '83');
# INSERT INTO `role_permission` VALUES (null, '2', '80');
# INSERT INTO `role_permission` VALUES (null, '2', '54');
# INSERT INTO `role_permission` VALUES (null, '2', '15');
# INSERT INTO `role_permission` VALUES (null, '2', '125');
# INSERT INTO `role_permission` VALUES (null, '2', '92');
# INSERT INTO `role_permission` VALUES (null, '2', '41');
# INSERT INTO `role_permission` VALUES (null, '2', '43');
# INSERT INTO `role_permission` VALUES (null, '2', '95');
# INSERT INTO `role_permission` VALUES (null, '2', '121');
# INSERT INTO `role_permission` VALUES (null, '2', '38');
# INSERT INTO `role_permission` VALUES (null, '2', '117');
# INSERT INTO `role_permission` VALUES (null, '2', '69');
# INSERT INTO `role_permission` VALUES (null, '2', '70');
# INSERT INTO `role_permission` VALUES (null, '2', '79');
# INSERT INTO `role_permission` VALUES (null, '2', '96');
# INSERT INTO `role_permission` VALUES (null, '2', '71');
# INSERT INTO `role_permission` VALUES (null, '2', '94');
# INSERT INTO `role_permission` VALUES (null, '2', '66');
# INSERT INTO `role_permission` VALUES (null, '2', '67');
# INSERT INTO `role_permission` VALUES (null, '2', '114');
# INSERT INTO `role_permission` VALUES (null, '2', '115');
# INSERT INTO `role_permission` VALUES (null, '2', '68');
# INSERT INTO `role_permission` VALUES (null, '2', '116');
# INSERT INTO `role_permission` VALUES (null, '2', '88');
# INSERT INTO `role_permission` VALUES (null, '2', '23');
# INSERT INTO `role_permission` VALUES (null, '2', '31');
# INSERT INTO `role_permission` VALUES (null, '2', '25');
# INSERT INTO `role_permission` VALUES (null, '2', '33');
# INSERT INTO `role_permission` VALUES (null, '2', '35');
#
#


/*
日志暂不处理

create table log
(
	id int auto_increment 		primary key,
	operation varchar(255) null comment '操作',
	operation_content varchar(255) null comment '操作详细内容',
	operation_time datetime null,
	user_id int not null comment '用户编号(外键)'
) comment '记录用户操作';

create table logging_event
(
	timestmp bigint not null,
	formatted_message text not null,
	logger_name varchar(254) null,
	level_string varchar(254) null,
	thread_name varchar(254) null,
	reference_flag smallint(6) null,
	arg0 varchar(254) null,
	arg1 varchar(254) null,
	arg2 varchar(254) null,
	arg3 varchar(254) null,
	caller_filename varchar(254) null,
	caller_class varchar(254) null,
	caller_method varchar(254) null,
	caller_line char(4) null,
	event_id bigint auto_increment
		primary key
);

create table logging_event_exception
(
	event_id bigint not null,
	i smallint(6) not null,
	trace_line varchar(254) not null,
	primary key (event_id, i),
	constraint logging_event_exception_ibfk_1
		foreign key (event_id) references logging_event (event_id)
);

create table logging_event_property
(
	event_id bigint not null,
	mapped_key varchar(254) not null,
	mapped_value text null,
	primary key (event_id, mapped_key),
	constraint logging_event_property_ibfk_1
		foreign key (event_id) references logging_event (event_id)
);



*/
