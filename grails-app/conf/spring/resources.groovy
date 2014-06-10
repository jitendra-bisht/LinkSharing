import com.linkshare.LoginService
import tst.BeanDemo

// Place your Spring DSL code here
beans = {
    beanDemo(BeanDemo,ref('loginService')){
    }
}