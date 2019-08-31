package cn.yulezhisi.common.beans;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 接受异常的构造 和 单个bean的响应对象
 *
 * @author yulezhisi
 **/

@Data
public class ResultBean <T> implements Serializable{
    
    @ApiModelProperty(value = "未登录 -1")
    public static final int NO_LOGIN = -1;
    
    @ApiModelProperty(value = "成功为 0")
    public static final int SUCCESS = 0;
    
    @ApiModelProperty(value = "未知错误 1")
    public static final int FAIL = 1;
    
    @ApiModelProperty(value = "权限不足 2")
    public static final int NO_PERMISSION = 2;
    
    private static final long serialVersionUID = 1L;
    
    private String msg = "success";
    
    @ApiModelProperty("默认 0 为响应成功")
    private int code = SUCCESS;
    
    @ApiModelProperty(value = "查询的数据")
    private T data;
    
    public ResultBean() {
        super();
    }
    
    /**
     * 接受查询的响应数据 推荐使用bean
     */
    public ResultBean(T data) {
        super();
        this.data = data;
    }
    
    /**
     * 接受抛出的异常 由aop 处理
     */
    public ResultBean(Throwable e) {
        super();
        this.msg = e.toString();
        this.code = FAIL;
    }
}

















