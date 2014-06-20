import com.linkshare.LoginService

class BootStrap {
    LoginService loginService;

    def init = { servletContext ->
        loginService.createAdminUser();
    }
    def destroy = {
    }
}
