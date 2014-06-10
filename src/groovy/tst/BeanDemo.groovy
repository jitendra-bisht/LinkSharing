package tst

import com.linkshare.LoginService
import org.springframework.stereotype.Service

/**
 * Created by intelligrape on 10/6/14.
 */
class BeanDemo {
    LoginService loginService;
    BeanDemo(LoginService loginService){
        this.loginService = loginService;
    }
    def runMethod(){
        loginService.testMethod();
    }
}
