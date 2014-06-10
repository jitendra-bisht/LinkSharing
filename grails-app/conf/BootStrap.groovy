import com.linkshare.LoginService

class BootStrap {
    LoginService loginService;

    def init = { servletContext ->
        loginService.createAdminUser();
//        properties.put("images.path","/home/intelligrape/BootCamp/images")
        servletContext.setAttribute("images.path","/home/intelligrape/BootCamp/images")
        servletContext.setAttribute("document.path","/home/intelligrape/BootCamp/docs")
    }
    def destroy = {
    }
}
