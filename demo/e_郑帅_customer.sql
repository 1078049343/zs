use tt;
create table customer
(
    id                  int auto_increment comment '客户编号'
        primary key,
    name                varchar(255)  null comment '客户名称（唯一性）',
    type                varchar(255)  null comment '客户类别（数据字典）',
    level               varchar(255)  null comment '客户等级（数据字典）',
    status              varchar(255)  null comment '客户状态（数据字典）',
    credit              varchar(255)  null comment '客户信用度（数据字典）',
    area                varchar(255)  null comment '客户所在地区',
    company_address     varchar(255)  null comment '公司详细地址',
    company_phone       varchar(255)  null comment '公司电话',
    post_code           varchar(255)  null comment '邮政编码',
    fax_address         varchar(255)  null comment '传真地址',
    company_website     varchar(255)  null comment '公司网站',
    license_number      varchar(255)  null comment '营业执照注册号',
    corporation         varchar(255)  null comment '法人',
    annual_sale         double        null comment '年营业额',
    deposit_bank        varchar(255)  null comment '开户银行',
    bank_account        varchar(255)  null comment '银行账号',
    land_tax_number     varchar(255)  null comment '地税登记号',
    national_tax_number varchar(255)  null comment '国税登记号',
    source              varchar(255)  null comment '客户来源（数据字典）',
    description         varchar(255)  null comment '客户描述',
    maturity            varchar(255)  null comment '客户成熟度,满意度（数据字典）',
    document            varchar(255)  null comment '相关文档保存地址',
    delete_status       int default 0 not null comment '删除状态 0为未删除 1为已删除',
    manager_id          int           null comment '客户所属的客户经理（外键）',
    product_id          int           null comment '客户主要意向产品（外键）',
    creater             varchar(255)  not null comment '创建人（经理）',
    create_time         datetime      not null comment '创建时间',
    constraint unique (name)
) comment '客户详细信息';

-- ----------------------------

INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (1, '阿里巴巴', '老客户', '81', '76', '95', '杭州', '中国北京海淀区上地十街10号百度大厦', '0755-7367087', '525100', '525100', 'www.baidu.com', '1234-522465-5243232', '阿里巴巴', 1000000, '1000000', '1000000', '5678-522465-5243232', '9012-522465-5243232', '不知道从哪来的', '客户描述', 'B+：关键人有成交意向', null, 0, 6, 1, '2', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (2, '终极咸鱼', '普通客户', '82', '77', '95', '123123', '驱蚊器二奥术大师多阿达', '1233', '撒旦撒旦', '1231231', '123123', '12312321', '123123', 3123123, '13', '12312312', '3213123213', '213123', '客户介绍', '萨达萨达速度2', 'C-：初步联系，意向不确定', null, 0, 9, null, '19', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (3, '测试添加2', '老客户', '83', '78', '96', '广东', '广东省广州市', '1234567', '123456', '123456', 'www.baidu.com', '1324654987431432', 'aaa', 10000000000000000, '农业银行', '12345678912345679841231456', '13216546949846', '13216546546465796', '手工录入', '这是一个测试客户', 'C+：初步联系，有意向', null, 0, 6, 6, '14', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (4, '测试用户1', '', '82', '79', '97', '97', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'A+：明确成交意向', null, 0, 10, null, '9', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (5, '小米', '供货商', '85', '76', '98', '', '', '13414852973', '', '', '', '', '', null, '', '', '', '', '朋友介绍', '', 'C-：初步联系，意向不确定', null, 0, 7, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (6, '客户1', '', '81', '77', '99', '99', '', '13414852973', '', '', '', '', '', null, '', '', '', '', '', '', 'C+：初步联系，有意向', null, 0, 6, null, '10', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (7, '客户2', '', '81', '76', '99', '', '95', '', '', '', '', '', '', null, '', '', '', '', '', '', 'A+：明确成交意向', null, 1, 6, null, '7', '2018-08-03 20:33:58');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (8, 'aa', '老客户', '83', '77', '95', '', '98', '', '', '', '', '', '', null, '', '', '', '', '', '', 'B+：关键人有成交意向', '', 0, 8, null, '6', '2018-07-31 14:44:21');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (9, 'vvv', '', '84', '78', '99', '96', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'B+：关键人有成交意向', null, 0, 6, null, '1', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (10, '暗室逢灯', '', '82', '79', '95', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C-：初步联系，意向不确定', null, 0, 6, null, '8', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (11, '测试客户1', '供货商', '85', '80', '97', '', '', '', '', '', '', '', '', null, '', '', '', '', '注册会员', '', 'A+：明确成交意向', null, 0, 7, 4, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (12, '测试客户2', '', '82', '78', '96', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C-：初步联系，意向不确定', null, 0, 7, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (13, '测试客户3', '', '84', '76', '96', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C+：初步联系，有意向', null, 0, 6, null, '7', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (14, 'aaa', '', '82', '77', '97', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C+：初步联系，有意向', null, 0, 10, null, '7', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (15, 'bbb', '', '82', '78', '98', '97', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'B+：关键人有成交意向', null, 0, 6, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (16, 'asa', '', '82', '79', '96', '99', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C-：初步联系，意向不确定', null, 0, 6, null, '10', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (17, 'ccc', '', '84', '76', '97', '95', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C+：初步联系，有意向', null, 0, 6, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (18, 'dddd', '', '82', '77', '98', '95', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'A+：明确成交意向', null, 0, 8, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (19, 'eee', '', '82', '78', '99', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C-：初步联系，意向不确定', null, 0, 6, null, '6', '2018-07-31 09:16:31');
INSERT INTO .customer (id, name, type, level, status, credit, area, company_address, company_phone, post_code, fax_address, company_website, license_number, corporation, annual_sale, deposit_bank, bank_account, land_tax_number, national_tax_number, source, description, maturity, document, delete_status, manager_id, product_id, creater, create_time) VALUES (20, '111', '', '82', '79', '96', '', '', '', '', '', '', '', '', null, '', '', '', '', '', '', 'C+：初步联系，有意向', null, 0, 6, null, '8', '2018-07-31 09:16:31');
create table linkman
(
    id           int auto_increment comment '联系人编号' primary key,
    name         varchar(255) not null comment '联系人名称',
    position     varchar(255) null comment '联系人职位',
    office_phone varchar(255) null comment '办公电话',
    mobile_phone varchar(255) null comment '手机电话',
    sex          varchar(255) null comment '性别',
    remark       varchar(255) null comment '备注',
    customer_id  int          null comment '所属客户'
) comment '联系人信息';


create table contact_record
(
    id          int auto_increment
        primary key,
    time        datetime     not null,
    address     varchar(255) null comment '地点',
    general     varchar(255) null comment '概要',
    remark      varchar(255) null comment '备注',
    content     varchar(255) null comment '详细信息',
    customer_id int          null comment '客户编号(外键)'
) comment '交往记录';


create table orders
(
    id          int auto_increment primary key,
    date        datetime      null comment '日期',
    address     varchar(255)  null comment '送货地址',
    price       double(10, 2) null comment '总金额',
    status      int           null comment '状态',
    customer_id int           null comment '客户(外键)'
) comment '订单信息';
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:26', '佛山', '110815.83', '1', '1');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:27', '佛山', '134504.68', '1', '5');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:27', '佛山', '147411.40', '1', '1');
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:28', '佛山', '174145.77', '1', '6');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:28', '佛山', '160897.80', '1', '1');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:29', '佛山', '133761.75', '1', '7');
INSERT INTO `orders` VALUES (null, '2017-07-14 10:29:29', '佛山', '111904.11', '1', '3');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:30', '佛山', '174552.99', '1', '1');
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:30', '佛山', '100896.98', '1', '3');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:31', '佛山', '101719.37', '1', '3');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:32', '佛山', '87948.97', '1', '3');
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:32', '佛山', '127072.47', '1', '1');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:33', '佛山', '129024.73', '1', '3');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:33', '佛山', '123557.42', '1', '3');
INSERT INTO `orders` VALUES (null, '2017-07-14 10:29:34', '佛山', '155294.98', '1', '1');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:34', '佛山', '104992.46', '1', '3');
INSERT INTO `orders` VALUES (null, '2015-07-14 10:29:35', '佛山', '55030.93', '1', '3');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:35', '佛山', '151422.55', '1', '3');
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:35', '佛山', '161166.02', '1', '1');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:36', '佛山', '93064.12', '1', '8');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:37', '佛山', '183358.01', '1', '3');
INSERT INTO `orders` VALUES (null, '2017-07-14 10:29:37', '佛山', '144680.65', '1', '3');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:38', '佛山', '76244.18', '1', '3');
INSERT INTO `orders` VALUES (null, '2015-07-14 10:29:38', '佛山', '111681.13', '1', '1');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:39', '佛山', '100716.67', '1', '3');
INSERT INTO `orders` VALUES (null, '2014-07-14 10:29:39', '佛山', '58653.15', '1', '9');
INSERT INTO `orders` VALUES (null, '2019-07-14 10:29:40', '佛山', '82596.36', '1', '3');
INSERT INTO `orders` VALUES (null, '2016-07-14 10:29:40', '佛山', '122928.94', '1', '1');
INSERT INTO `orders` VALUES (null, '2017-07-14 10:29:41', '佛山', '87608.23', '1', '3');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:41', '佛山', '156376.13', '1', '13');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:50', '佛山', '91848.13', '1', '3');
INSERT INTO `orders` VALUES (null, '2015-07-14 10:29:51', '佛山', '61301.49', '1', '13');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:51', '佛山', '165994.21', '1', '1');
INSERT INTO `orders` VALUES (null, '2018-07-14 10:29:52', '佛山', '111483.86', '1', '15');
INSERT INTO `orders` VALUES ('100', '2016-07-14 10:29:52', '佛山', '147318.99', '1', '3');


create table order_item
(
    id         int auto_increment primary key,
    num        int          null comment '数量',
    unit       varchar(255) null comment '单位',
    unit_price double       null comment '单价',
    price      double       null comment '金额',
    product_id int          null comment '产品(外键)',
    orders_id  int          null comment '订单(外键)'
) comment '订单详情';



create table customer_loss
(
    id              int auto_increment comment '客户流失管理id' primary key,
    measure         varchar(255)             null comment '暂缓措施',
    last_order_time datetime                 null comment '上次下单时间',
    measure_append  varchar(255)             null comment '追加暂缓措施',
    loss_date       datetime                 null comment '确认流失时间',
    reason          varchar(255)             null comment '流失原因',
    status          varchar(255) default '0' null comment '流失状态 0 确认流失 1 预警  2 暂缓流失',
    customer_id     int                      null comment '流失用户的id(外键)'
);


INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2018-07-14 00:00:00', null, null, '流失原因', '1', '1');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2015-07-14 00:00:00', null, null, '流失原因', '2', '2');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2012-07-14 00:00:00', null, null, '流失原因', '1', '3');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2013-07-14 00:00:00', null, '2013-07-14 00:00:00', '公司被收购', '0', '4');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2014-07-14 00:00:00', null, null, '流失原因', '1', '5');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2015-07-14 00:00:00', null, null, '流失原因', '2', '6');
INSERT INTO `customer_loss` VALUES (null, '暂缓流失策略', '2013-07-14 00:00:00', null, '2016-07-14 00:00:00', '没有采购需求', '0', '7');
