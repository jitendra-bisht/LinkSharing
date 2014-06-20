package com.linkshare

import grails.converters.JSON

class ResourceController {
    LoginService loginService;
    TopicResourceService topicResourceService;

    def index(Integer id){
        String data = "";
        Map model = topicResourceService.getTopicOrTopicList(id,session.USER_DETAIL);
        log.error(model);
        if(model){
            List<Resource> list = topicResourceService.latestNResourceByMe(session.USER_DETAIL,4);
            if(list){
                model.put("TITLE","My Resources");
                model.put("resourceList",list);
            }
            data = g.render(template: "resourceForm",model: model)
        }else{
            data = g.render(template: "/commons/notSubscribed")
        }
        if(params.js)
            render ([data: data] as JSON)
        else
            render view:"/home",model: [CONTENT:data]
    }
    def saveResource(){
        Resource resource = topicResourceService.saveNewResource(session.USER_DETAIL,params);
        request.lsresource = resource
        forward(action: "index")
    }

    def resourceInbox(){
        List<Resource> resourceInbox = topicResourceService.myInbox(session.USER_DETAIL,0,0);
        List<Integer> readItems = topicResourceService.readItems(session.USER_DETAIL);
        Map model = [resourceList:resourceInbox,readItems:readItems,TITLE:"Inbox"];
        String data = g.render(template: "resourceList",model: model)
        render view: "/home",model: [CONTENT:data];
    }

    def myResources(){
        List<Resource> list = topicResourceService.latestNResourceByMe(session.USER_DETAIL,8);

        String data = g.render(template: "resourceList",model: [resourceList:list,TITLE:"My Resources"])
        render view:"/home",model: [CONTENT:data]
    }

    def detail(Integer id){
        Resource resource = Resource.read(id);
        User user = User.load(session.USER_DETAIL?.id);
        ReadItem readItem = ReadItem.findOrSaveWhere(
                resource: resource,
                user: user
        )

        String data = g.render(template: 'resourceDetail',model: [resource:resource]);
        render view: '/home',model: [CONTENT:data]
    }

    def markUnread(Integer id){
        Resource resource = Resource.load(id);
        User user = User.load(session.USER_DETAIL?.id);
        ReadItem readItem = ReadItem.findWhere(
                resource: resource,
                user: user
        )

        readItem?.delete(flush: true);
        redirect(controller: 'user',action: 'index')
    }
}
