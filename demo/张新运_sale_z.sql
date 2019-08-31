use tt;
create table sale_opportunity
(
	id int auto_increment		primary key,
	source varchar(255) null comment '机会来源',
	success varchar(255) null comment '成功几率',
	general text null comment '机会概要',
	contact_phone varchar(255) null comment '客户联系人电话',
	description text null comment '机会描述',
	create_date datetime null comment '销售机会创建时间',
	allot_date datetime null comment '分配时间',
	status varchar(255)default '待分配' null comment '销售机会的状态,分配后在机会管理显示已指派,开发计划中显示开发中,记录为开发中',
	delete_status int(11) unsigned zerofill default 0 null comment '是否已经被删除  0：未删除  1：已删除'	,
	customer_id int null comment '客户id(外键)',
	contact_id int null comment '客户联系人(外键)',
	creater int null comment '销售机会创建人(外键)',
	manager_id int null comment '被分配给的客户经理(外键)',
	index(contact_id),
	index(creater),
	index(customer_id),
	index(manager_id)
) comment '销售机会表';

create table sale_plane
(
	id int auto_increment comment 'id' 		primary key,
	time datetime null comment '计划日期',
	detail varchar(255) null comment '计划内容',
	create_time datetime null comment '创建时间',
	linkman_id int not null comment '联系人ID(外键)',
	manager_id int null comment '创建计划的客户经理(外键),每个经理只能看到自己的计划',
	index (linkman_id)
) comment '开发计划';


create table sale_execute_plane
(
	id int auto_increment comment 'id' 		primary key,
	create_time datetime null comment '创建时间',
	time datetime null comment '计划日期',
	detail varchar(255) null comment '计划内容',
	feedback varchar(255) null comment '客户反馈,执行效果',
	linkman_id int not null comment '联系人ID',
	manager_id int null comment '执行计划的客户经理(外键)',
	index (linkman_id)
) comment '开发计划执行效果记录,不关联,计划可以删除,但是执行过的记录不能删除';

#销售机会表
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584201','略','2019-8-1',null,default,default,
                                    (select id from customer where name='王五'),
                                    (select id from linkman where customer_id=(select id from customer where name='王五'))
                                       ,1,null);
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584205','略','2019-8-5',null,default,default,
                                    (select id from customer where name='李四'),
                                    (select id from linkman where customer_id=(select id from customer where name='李四'))
                                       ,5,null);
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584206','略','2019-8-6',null,default,default,
                                    (select id from customer where name='张三'),
                                    (select id from linkman where customer_id=(select id from customer where name='张三'))
                                       ,6,null);
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584207','略','2019-8-7',null,default,default,
                                    (select id from customer where name='jack'),
                                    (select id from linkman where customer_id=(select id from customer where name='jack'))
                                       ,7,null);
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584208','略','2019-8-8',null,default,default,
                                    (select id from customer where name='tom'),
                                    (select id from linkman where customer_id=(select id from customer where name='tom'))
                                       ,8,null);
insert into sale_opportunity values(default,'别人介绍','50','优质很棒','13852584209','略','2019-8-9',null,default,default,
                                    (select id from customer where name='rose'),
                                    (select id from linkman where customer_id=(select id from customer where name='rose'))
                                       ,9,null);


#开发计划
insert sale_plane values (default,'2019-8-2','忽悠忽悠在忽悠','2019-8-2',1,1);
insert sale_plane values (default,'2019-8-6','搞不了太聪明','2019-8-6',2,5);
insert sale_plane values (default,'2019-8-7','呵长得不好看','2019-8-7',3,6);
insert sale_plane values (default,'2019-8-8','你看你背后','2019-8-8',4,7);
insert sale_plane values (default,'2019-8-9','呵长得不好看','2019-8-9',5,8);
insert sale_plane values (default,'2019-8-10','你看你背后','2019-8-10',6,9);
insert sale_plane values (default,'2019-8-11','你看你背后','2019-8-11',7,10);

#开发计划执行记录
insert sale_execute_plane values (default,'2019-8-3','2019-8-3','忽悠忽悠在忽悠','good',1,1);
insert sale_execute_plane values (default,'2019-8-7','2019-8-7','搞不了太聪明','good',2,5);
insert sale_execute_plane values (default,'2019-8-8','2019-8-8','呵长得不好看','no_good',3,6);
insert sale_execute_plane values (default,'2019-8-9','2019-8-9','你看你背后','vert_good',4,7);
insert sale_execute_plane values (default,'2019-8-10','2019-8-10','呵长得不好看','good',5,8);
insert sale_execute_plane values (default,'2019-8-11','2019-8-11','你看你背后','no_good',6,9);
insert sale_execute_plane values (default,'2019-8-12','2019-8-12','你看你背后','vert_good',7,10);


#likemen
insert into linkman(id,name,mobile_phone,customer_id) values(default,'王五儿子','13852584201',(select id from customer
where name='王五'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'李四儿子','13852584205',(select id from customer
where name='李四'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'张三儿子','13852584206',(select id from customer
where name='张三'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'jack儿子','13852584207',(select id from customer
where name='jack'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'tom儿子','13852584208',(select id from customer
where name='tom'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'rose儿子','13852584209',(select id from customer
where name='rose'));
insert into linkman(id,name,mobile_phone,customer_id) values(default,'peter儿子','13852584210',(select id from customer
where name='peter'));
