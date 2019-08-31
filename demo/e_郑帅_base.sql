use tt;
create table dictionary_type
(
    id   int auto_increment
        primary key,
    name varchar(255) not null comment '类别名称',
    constraint name_weiyixing
        unique (name) comment '唯一性约束'
) comment '数据字典类型';



INSERT INTO `dictionary_type` VALUES ('83', '客户信用度');
INSERT INTO `dictionary_type` VALUES ('111', '客户关怀方式');
INSERT INTO `dictionary_type` VALUES ('82', '客户成熟度');
INSERT INTO `dictionary_type` VALUES ('76', '客户来源');
INSERT INTO `dictionary_type` VALUES ('80', '客户状态');
INSERT INTO `dictionary_type` VALUES ('81', '客户等级');
INSERT INTO `dictionary_type` VALUES ('75', '客户类别');
INSERT INTO `dictionary_type` VALUES ('79', '服务满意度');
INSERT INTO `dictionary_type` VALUES ('78', '服务状态');
INSERT INTO `dictionary_type` VALUES ('77', '服务类型');
INSERT INTO `dictionary_type` VALUES ('85', '服务紧急程度');
INSERT INTO `dictionary_type` VALUES ('88', '测试更新');
INSERT INTO `dictionary_type` VALUES ('87', '销售机会来源');
INSERT INTO `dictionary_type` VALUES ('84', '销售机会状态');


create table dictionary_item
(
    id      int auto_increment
        primary key,
    name    varchar(255)                    null comment '字典名称',
    status  int unsigned zerofill default 0 null comment '字典状态 0：只可读   1：可以进行curd',
    type_id int                             null comment '字典类型id(外键)'
) comment '数据字典详情';

#todo 指定给郑帅   可能需要增加一个库存相关表

INSERT INTO `dictionary_item` VALUES ('38', '投诉', '0', '77');
INSERT INTO `dictionary_item` VALUES ('39', '咨询', '0', '77');
INSERT INTO `dictionary_item` VALUES ('40', '售后', '0', '77');
INSERT INTO `dictionary_item` VALUES ('41', '售前', '0', '77');
INSERT INTO `dictionary_item` VALUES ('42', '售中', '0', '77');
INSERT INTO `dictionary_item` VALUES ('43', '未处理', '0', '78');
INSERT INTO `dictionary_item` VALUES ('44', '处理中', '0', '78');
INSERT INTO `dictionary_item` VALUES ('45', '已处理', '0', '78');
INSERT INTO `dictionary_item` VALUES ('46', '已归档', '0', '78');
INSERT INTO `dictionary_item` VALUES ('47', '☆', '0', '79');
INSERT INTO `dictionary_item` VALUES ('48', '☆☆', '0', '79');
INSERT INTO `dictionary_item` VALUES ('49', '☆☆☆', '0', '79');
INSERT INTO `dictionary_item` VALUES ('50', '☆☆☆☆', '0', '79');
INSERT INTO `dictionary_item` VALUES ('51', '☆☆☆☆☆', '0', '79');
INSERT INTO `dictionary_item` VALUES ('58', '注册会员', '0', '76');
INSERT INTO `dictionary_item` VALUES ('59', '朋友介绍', '0', '76');
INSERT INTO `dictionary_item` VALUES ('60', '手工录入', '0', '76');
INSERT INTO `dictionary_item` VALUES ('61', '客户介绍', '0', '76');
INSERT INTO `dictionary_item` VALUES ('62', '电子商务', '0', '76');
INSERT INTO `dictionary_item` VALUES ('63', '合作伙伴', '0', '76');
INSERT INTO `dictionary_item` VALUES ('64', '广告', '0', '76');
INSERT INTO `dictionary_item` VALUES ('65', '职员引介', '0', '76');
INSERT INTO `dictionary_item` VALUES ('66', '市场活动', '0', '76');
INSERT INTO `dictionary_item` VALUES ('67', '口头传达', '0', '76');
INSERT INTO `dictionary_item` VALUES ('68', '其他', '0', '76');
INSERT INTO `dictionary_item` VALUES ('69', '普通客户', '0', '75');
INSERT INTO `dictionary_item` VALUES ('70', 'VIP客户', '0', '75');
INSERT INTO `dictionary_item` VALUES ('71', '老客户', '0', '75');
INSERT INTO `dictionary_item` VALUES ('72', '代理商', '0', '75');
INSERT INTO `dictionary_item` VALUES ('73', '供货商', '0', '75');
INSERT INTO `dictionary_item` VALUES ('74', '合作伙伴', '0', '75');
INSERT INTO `dictionary_item` VALUES ('75', '其他', '0', '75');
INSERT INTO `dictionary_item` VALUES ('76', '成交客户', '0', '80');
INSERT INTO `dictionary_item` VALUES ('77', '潜在客户', '0', '80');
INSERT INTO `dictionary_item` VALUES ('78', '意向客户', '0', '80');
INSERT INTO `dictionary_item` VALUES ('79', '失败客户', '0', '80');
INSERT INTO `dictionary_item` VALUES ('80', '已流失客户', '0', '80');
INSERT INTO `dictionary_item` VALUES ('81', '☆', '0', '81');
INSERT INTO `dictionary_item` VALUES ('82', '☆☆', '0', '81');
INSERT INTO `dictionary_item` VALUES ('83', '☆☆☆', '0', '81');
INSERT INTO `dictionary_item` VALUES ('84', '☆☆☆☆', '0', '81');
INSERT INTO `dictionary_item` VALUES ('85', '☆☆☆☆☆', '0', '81');
INSERT INTO `dictionary_item` VALUES ('86', 'A+：明确成交意向', '0', '82');
INSERT INTO `dictionary_item` VALUES ('87', 'A-：有初步成交意向', '0', '82');
INSERT INTO `dictionary_item` VALUES ('88', 'B+：关键人有成交意向', '0', '82');
INSERT INTO `dictionary_item` VALUES ('89', 'B-：关键人成交意向不确定', '0', '82');
INSERT INTO `dictionary_item` VALUES ('90', 'C+：初步联系，有意向', '0', '82');
INSERT INTO `dictionary_item` VALUES ('91', 'C-：初步联系，意向不确定', '0', '82');
INSERT INTO `dictionary_item` VALUES ('92', 'D：新建客户', '0', '82');
INSERT INTO `dictionary_item` VALUES ('93', 'E：明显拒绝', '0', '82');
INSERT INTO `dictionary_item` VALUES ('94', 'F：无效客户', '0', '82');
INSERT INTO `dictionary_item` VALUES ('95', '☆', '0', '83');
INSERT INTO `dictionary_item` VALUES ('96', '☆☆', '0', '83');
INSERT INTO `dictionary_item` VALUES ('97', '☆☆☆', '0', '83');
INSERT INTO `dictionary_item` VALUES ('98', '☆☆☆☆', '0', '83');
INSERT INTO `dictionary_item` VALUES ('99', '☆☆☆☆☆', '0', '83');
INSERT INTO `dictionary_item` VALUES ('100', '初期沟通', '0', '84');
INSERT INTO `dictionary_item` VALUES ('101', '立项评估', '0', '84');
INSERT INTO `dictionary_item` VALUES ('102', '解决方案', '0', '84');
INSERT INTO `dictionary_item` VALUES ('103', '非常紧急', '0', '85');
INSERT INTO `dictionary_item` VALUES ('104', '紧急', '0', '85');
INSERT INTO `dictionary_item` VALUES ('105', '一般', '0', '85');
INSERT INTO `dictionary_item` VALUES ('109', '客户主动询价', '0', '87');
INSERT INTO `dictionary_item` VALUES ('110', '网上搜索结果', '0', '87');
INSERT INTO `dictionary_item` VALUES ('111', '拓展市场业务', '0', '87');
INSERT INTO `dictionary_item` VALUES ('113', '22', '0', '88');
INSERT INTO `dictionary_item` VALUES ('115', '广告宣传', '0', '87');
INSERT INTO `dictionary_item` VALUES ('116', '已报价', '0', '84');
INSERT INTO `dictionary_item` VALUES ('119', '发送短信祝福', '0', '111');
INSERT INTO `dictionary_item` VALUES ('120', '发送邮件祝福', '0', '111');
INSERT INTO `dictionary_item` VALUES ('121', '电话祝福', '0', '111');
INSERT INTO `dictionary_item` VALUES ('122', '短信+邮件祝福', '0', '111');
INSERT INTO `dictionary_item` VALUES ('123', '短信+邮件+电话祝福', '0', '111');
INSERT INTO `dictionary_item` VALUES ('124', '上门拜访', '0', '111');
INSERT INTO `dictionary_item` VALUES ('125', '其他方式', '0', '111');
INSERT INTO `dictionary_item` VALUES ('133', '不知道从哪来的', '1', '76');
INSERT INTO `dictionary_item` VALUES ('134', '捡到的', '1', '76');
INSERT INTO `dictionary_item` VALUES ('135', '商务谈判', '0', '84');
INSERT INTO `dictionary_item` VALUES ('136', '合同/订单签订', '0', '84');
INSERT INTO `dictionary_item` VALUES ('137', '客户介绍', '0', '87');
INSERT INTO `dictionary_item` VALUES ('138', '展会', '0', '87');
INSERT INTO `dictionary_item` VALUES ('139', '招标公告', '0', '87');
INSERT INTO `dictionary_item` VALUES ('140', '123', '1', '80');


create table product
(
    id        int auto_increment comment '序号'
        primary key,
    name      varchar(255) null comment '产品名称',
    version   varchar(255) null comment '型号',
    batch     varchar(50)  null comment '等级/批次',
    unit      varchar(255) null comment '单位',
    price     double       null comment '单价',
    repertory int          null comment '库存',
    location  varchar(255) null comment '仓库地址',
    remarks   varchar(255) null comment '备注'
) comment '产品信息, 库存';

insert product values (null,'幸福牌电视机7','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌收音机','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌洗衣机','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机1','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机2','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机3','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机4','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机5','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');
insert product values (null,'幸福牌电视机6','818 FFT','2388 EA03','台',7500,100,'北京-西直门库','代生产');



create table  stocks
(
  id int primary key  auto_increment,
  name varchar(50) not null,
  warehouse varchar(50) not null ,
  goods_allocation varchar(50),
  repertory int(10) not null,
  remark varchar(20)
) comment '库存表';

  insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'2 海龙笔记本电脑-i60-2688 9966 ','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
insert stocks values (null,'幸福牌电视机-818 FFT-2388 EA03','北京-西直门库','EC-D2',90,'');
