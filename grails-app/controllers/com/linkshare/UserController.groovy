package com.linkshare

import extra.Visibility
import grails.converters.JSON

class UserController {
    def index() {
        List<Topic> recent = Topic.findAllByVisibility(Visibility.PUBLIC,[sort: "dateCreated",order:"desc"]);
        String data = g.render(template: "/topic/postList",model: [recentShare:recent])
        render view: "index",model: [CONTENT:data];
    }

    def resourceInbox(){
        StringBuffer sb = new StringBuffer();
        100.times {
            sb.append("Inb ox");
        }
        render ([data: sb.toString()] as JSON)
    }

    def profilePicture(){
        render(file: new File(session.USER_DETAIL?.profilePicture),contentType: 'image/jpeg')
    }
    def profilePictureById(Integer id){
        User user = User.get(id);
        render(file: new File(user?.profilePicture),contentType: 'image/jpeg')
    }
}
