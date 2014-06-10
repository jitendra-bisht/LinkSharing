package com.linkshare

import tst.BeanDemo
import tst.BeanDemo2

class LoginController {
    static allowedMethods = {
        loginHandler:
        ["POST"]
    }
    LoginService loginService;

    def index() {
        if(session.USER_DETAIL && session.USER_DETAIL instanceof User){
            redirectedToHomepage(session.USER_DETAIL)
        }else{
            render view: "/index"
        }
    }

    def loginHandler() {
        User user = loginService.requestLogin(params.username as String, params.password as String);
        if (user) {
            session.USER_DETAIL = user
            redirectedToHomepage(user);
        } else {
            render view: "/index", model: [errorMessage: true]
        }
    }
    private redirectedToHomepage(user){
        if (user?.role.collect { it.roleName }.contains("ADMIN")) {
            log.info("ADMIN user")
            redirect(controller: "admin", action: "stats")
        } else {
            log.info("Normal User")
            redirect(controller: "user")
        }
    }

    def registerUser(User user) {
        File file = loginService.saveFile(params.imageFile,grailsApplication.config.path.images)
        user.profilePicture = file.getAbsolutePath()

        if(user.hasErrors()){
            log.error("Error in validation")
            file.delete();
        }else{
            loginService.registerNewUser(user)
        }
        render view: "/index", model: [user: user]
    }

    def logout(){
        if(session.USER_DETAIL){
            session.USER_DETAIL = null;
        }
        redirect(controller: "login",action: "index")
    }
}