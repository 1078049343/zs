import cn.yulezhisi.common.util.Log;
import cn.yulezhisi.entity.User;
import cn.yulezhisi.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

/**
 * @author yulezhisi
 **/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
@WebAppConfiguration
public class UserServiceTest{
    @Autowired
    ApplicationContext applicationContext;
    
    @Autowired
    private UserService testTarget;
    
    @Test
    public void fun() {
        PageInfo<User> all = testTarget.queryListByPage(null, 1, 4);
        Log.logger.info(all.getList().size() + "");
    }
}







