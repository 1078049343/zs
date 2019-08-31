package cn.yulezhisi.service.user.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import cn.yulezhisi.user.dao.UserMapper;
import cn.yulezhisi.user.service.UserService;

/**
 * 
 * 
 * @author yulezhisi
 **/


@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

}
