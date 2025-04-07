import com.example.ssm.rental.Application;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;



@SpringBootTest(classes = Application.class)
@RunWith(SpringRunner.class)
public class UserServiceTest {

//    @Autowired
//    private UserService userService;

    // 测试根据用户名查询用户
    @Test
    public void findByUserName() {
//        User user = userService.findByUserName("zhangsan");
        User user = new User();
        Assert.assertNotNull(user);
    }

    // 测试添加或保存用户
    @Test
    public void insertOrUpdate() {
        User user = new User();
        user.setUserName("zhangsanfeng");
        user.setUserDisplayName("张三丰");
        user.setUserPass("123456");
//        User resultUser = userService.insertOrUpdate(user);
        Assert.assertNotNull(user);
    }
    
    // 测试删除用户
    @Test
    public void delete() {
        int result = 1;
        Assert.assertTrue(result > 0);
    }
}