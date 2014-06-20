package com.linkshare

class LoginController {
    static allowedMethods = {
        loginHandler:
        ["POST"]
    }
    LoginService loginService;
    TopicService topicService;
    CommonApiService commonApiService;

    def index() {
        if(session.USER_DETAIL && session.USER_DETAIL instanceof User){
            redirectedToHomepage(session.USER_DETAIL)
        }else{
            List<Topic> recent = topicService.listAllPublicTopics(0,5);
            String data = g.render(template: "/user/recentShareTopicList",model: [recentShare:recent])
            data += g.render(template: "/user/topShareTopicList",model: [recentShare:recent])
            render view: "/index",model: [CONTENT:data]
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
        File file = commonApiService.uploadFile(params.imageFile,grailsApplication.config.path.images)
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