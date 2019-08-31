package cn.yulezhisi.service.impl;

import cn.yulezhisi.common.object.BaseServiceImpl;
import cn.yulezhisi.dao.UserMapper;
import cn.yulezhisi.entity.User;
import cn.yulezhisi.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author yulezhisi
 **/

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
    
    @Resource
    private UserMapper userMapper;
    
}
