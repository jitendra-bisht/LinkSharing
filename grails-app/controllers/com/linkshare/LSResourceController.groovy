package com.linkshare

import extra.Resource
import grails.converters.JSON

class LSResourceController {
    LoginService loginService;
    def index(Integer id){
        Topic topic;
        User user = User.get(session.USER_DETAIL.id);
        List<Topic> topicList;
        if(id){
            topic = Topic.get(id);
        }else{
            topicList = user.userSubTopic.topic
        }
        String data = g.render(template: "resourceForm",model: [topic:topic,topicList:topicList])
        if(params.js)
            render ([data: data] as JSON)
        else
            render view:"/user/index",model: [CONTENT:data]
    }
    def saveResource(){
        User user = User.get(session.USER_DETAIL.id);
        Topic topic = Topic.get(params.id);
        Resource resource = null
        if(topic){
            if(params.type){
                if(params.type == "link"){
                    resource = new LinkResource(
                            topic: topic,
                            createdBy: user,
                            url: params.url,
                            description:params.description
                    )
                    if(resource.validate()){
                        resource.save(flush: true);
                    }

                }else if(params.type == "document"){
                    File file = loginService.saveFile(params.doc,
                            grailsApplication.config.path.document);
                    resource = new DocumentResource(
                            topic: topic,
                            createdBy: user,
                            path: file.getAbsolutePath(),
                            description:params.description
                    )
                    if(resource.validate()){
                        resource.save(flush: true);
                    }else{
                        file.delete();
                    }
                }
            }
        }
        request.lsresource = resource
        forward(action: "index")
    }

    def resourceInbox(){
        User user = User.get(session.USER_DETAIL.id);
        List<Resource> resourceList = user.userSubTopic.topic.linkResource
        resourceList.addAll(user.userSubTopic.topic.documentResource)
        String data = g.render(template: "resourceList",model: [lsresource:resourceList])
        if(params.js)
            render ([data: data] as JSON)
        else
            render view:"/user/index",model: [CONTENT:data]
    }
}
