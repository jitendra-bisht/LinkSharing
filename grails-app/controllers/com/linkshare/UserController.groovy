package com.linkshare

class UserController {
    UserService userService;

    def index() {
        forward(controller: 'resource',action: 'resourceInbox');
    }

    def userAccount(){
        User user = User.read(session.USER_DETAIL?.id);
        renderResponse([user:user]);
    }
    def update(){
        Map status = userService.changePassword(params);
        renderResponse(status);
    }
    private renderResponse(Map map){
        String data = g.render(template: 'userProfile',model: map)
        render view: "/home",model: [CONTENT:data]
    }
}
