package cn.yulezhisi.user.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;


/**
 * 
 * 
 * @author yulezhisi
 **/


@ApiModel(value="cn.yulezhisi.user.entity.User")
@Data
@Table(name = "`user`")
public class User implements Serializable {
    /**
     * 用户id
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    @ApiModelProperty(value="用户id")
    private Integer id;

    /**
     * 用户账号(唯一)
     */
    @Column(name = "account")
    @ApiModelProperty(value="用户账号(唯一)")
    private String account;

    /**
     * 密码
     */
    @Column(name = "`password`")
    @ApiModelProperty(value="密码")
    private String password;

    /**
     * 真实姓名
     */
    @Column(name = "real_name")
    @ApiModelProperty(value="真实姓名")
    private String realName;

    /**
     * MD5盐值
     */
    @Column(name = "salt")
    @ApiModelProperty(value="MD5盐值")
    private String salt;

    /**
     * 用户邮箱(唯一)
     */
    @Column(name = "email")
    @ApiModelProperty(value="用户邮箱(唯一)")
    private String email;

    /**
     * 用户手机号
     */
    @Column(name = "phone_number")
    @ApiModelProperty(value="用户手机号")
    private String phoneNumber;

    /**
     * 用户创建时间
     */
    @Column(name = "create_time")
    @ApiModelProperty(value="用户创建时间")
    private Date createTime;

    /**
     * 上一次登陆时间
     */
    @Column(name = "last_login_time")
    @ApiModelProperty(value="上一次登陆时间")
    private Date lastLoginTime;

    /**
     * 账号锁定状态 0 为未锁定 1为1锁定
     */
    @Column(name = "`status`")
    @ApiModelProperty(value="账号锁定状态 0 为未锁定 1为1锁定")
    private Integer status;

    /**
     * 角色id(外键)
     */
    @Column(name = "role_id")
    @ApiModelProperty(value="角色id(外键)")
    private Integer roleId;

    private static final long serialVersionUID = 1L;
}