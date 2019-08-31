use tt;

-- 编号  服务类型  概要  客户  状态  服务请求  创建人  创建时间
-- 负责人 分配时间
-- 服务处理  处理人   处理时间
-- 处理结果  满意度
drop table if exists service_module;
create table service_module
(
	id int auto_increment primary key comment'服务id',
	type varchar(255) null comment '服务的类型(从数据字典获取) 目前:咨询',
	general varchar(255) null comment '服务的概要',
    customer_id int null comment '客户id',
	status varchar(255) null comment '服务状态(数据字典) 新创建 已分配 已处理 已归档',
	request text null comment '请求内容',
	create_user_id int not null comment '创建人id 可以是业务经理 也可以是业务主管',
	create_date datetime not null  comment '创建时间',

	functionary_user_id int default null comment '负责人id',
	allocation_date datetime default null comment '分配时间',

	handle_content text  default null comment '服务的处理内容',
	dispose_user_id int  default null comment '处理人id',
	dispose_date datetime  default null comment '处理时间',

	handle_result text  default null comment '服务的处理结果',
	degree varchar(255)  default null comment '客户对服务的满意度(数据字典)'
);
-- ⭐服务创建⭐
-- 插入需求(业务经理,业务主管都可以创建服务)
-- 1.根据客户名称    查询客户id
-- 2.根据负责人姓名  查询负责人id
-- 3.根据处理人姓名  查询处理人id
-- 4.进行添加

-- ⭐服务分配⭐
-- 带条件分页查询(业务主管,查看所有新创建的服务,指定负责人,需要更新service_module表)
-- 每条拥有指定负责人的需求  实质上是  更新service_module表

-- ⭐服务处理⭐
-- 带条件分页查询(业务经理,查看自己所有的业务,点击处理,进行处理业务,需要更新service_module表)
-- 点击详情按钮进入到详情页面进行处理任务  实质上是  更新service_module表

-- ⭐服务反馈⭐
-- 带条件分页查询(业务经理,查看所有已处理的服务,对已处理的服务进行跟踪反馈,需要更新满意度)
-- 点击详情按钮进入到详情页面进行处理任务  实质上是  更新service_module表

-- ⭐服务归档⭐
-- 带条件分页查询(业务主管,查看所有已反馈任务,对已反馈任务,
-- 进行筛选,若服务满意度低于三星,进行再次分配服务)
-- 不成功的先进行归档,再根据服务信息添加转交表(service_transfer)信息,对指定人进行指定任务分配

drop table if exists service_transfer;
create table service_transfer
(
	id int auto_increment
		primary key,
	time datetime null comment '转交时间',
	reason varchar(255) null comment '转交原因',
	service_id int null comment '服务id(外键)',
	old_manager_id int null comment '进行转交服务的客户经理(外键)',
	new_manager_id int null comment '被转交服务的客户经理(外键)'
) comment '服务满意低于三星的要再次分配服务';



-- 添加数据
insert  into `service_module`(`id`,`type`,`general`,`customer_id`,`status`,`request`,`create_user_id`,`create_date`,`functionary_user_id`,`allocation_date`,`handle_content`,`dispose_user_id`,`dispose_date`,`handle_result`,`degree`) values
(1,'咨询','建议收音机价格打个折',3,'新创建','会将情况反映',5,'2019-08-26 13:41:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'咨询','询问收音机价格',3,'新创建','将数据以短信形式发送给客户',5,'2019-08-26 13:52:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'咨询','催促发货速度',3,'新创建','发货能不能快点',5,'2019-08-26 13:53:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'咨询','询问收音机价格',3,'新创建','88888888888888',5,'2019-08-26 14:12:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'咨询','询问收音机价格',3,'新创建','888888',5,'2019-08-26 15:51:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'建议','询问收音机价格',3,'新创建','65365464563',5,'2019-08-26 16:04:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'建议','询问收音机价格',3,'新创建','就会发光的方式',5,'2019-08-26 16:06:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'咨询','询问收音机价格',3,'新创建','脚后跟范德萨',5,'2019-08-26 16:07:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'投诉','询问收音机价格',3,'新创建','空间和广泛的现在',5,'2019-08-26 16:07:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'建议','询问收音机价格',3,'新创建','98765432',5,'2019-08-26 16:07:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'投诉','询问收音机价格',3,'新创建','98765432',5,'2019-08-26 16:07:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'投诉','询问收音机价格',3,'新创建','u摇头否认的是',5,'2019-08-26 16:07:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'建议','询问收音机价格',3,'新创建','开花结果范德萨',5,'2019-08-26 16:07:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'投诉','询问收音机价格',3,'新创建','.看脚后跟范德萨',5,'2019-08-26 16:07:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'咨询','询问收音机价格',3,'新创建','62345678',5,'2019-08-26 16:08:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'投诉','询问收音机价格',3,'新创建','发射点法大师傅',5,'2019-08-26 16:08:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
