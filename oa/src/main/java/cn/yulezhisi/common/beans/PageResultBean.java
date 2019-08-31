package cn.yulezhisi.common.beans;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Collection;

/**
 * 分页数据响应bean
 * 传入集合数据构造 和 接受异常信息的构造
 *
 * @author yulezhisi
 **/
@Data
public class PageResultBean <T>{
    
    public static final int NO_LOGIN = -1;
    
    public static final int SUCCESS = 0;
    
    public static final int FAIL = 1;
    
    public static final int NO_PERMISSION = 2;
    
    private static final long serialVersionUID = 1L;
    
    @ApiModelProperty("单页的记录集合,使用limit查询的数据")
    private Collection<T> data;
    
    @ApiModelProperty("默认 0 为响应成功 , 未登录 -1 , 未知错误 1 , 权限不足 2")
    private int code = SUCCESS;
    
    @ApiModelProperty("传递字符串信息 默认success")
    private String msg = "success";
    
    @ApiModelProperty("设置总记录数用于分页")
    private Long count;
    
    public PageResultBean() {
        super();
    }
    
    /**
     * 接受分页数据
     */
    public PageResultBean(Long count,Collection<T> data) {
        super();
        this.count = count;
        this.data = data;
    }
    
    /**
     * 接受抛出的异常 由aop 处理
     */
    public PageResultBean(Throwable e) {
        super();
        this.msg = e.toString();
        this.code = FAIL;
    }
    
}














