package com.linkshare

import extra.TopicPriority
import extra.Visibility
import grails.converters.JSON

class TopicController {
    TopicService topicService;

    static allowedMethods = {
        saveTopic: ["POST"]
    }

    // TOPIC CURD
    def createTopic(){
        commonRender('createTopic',[topics:topicService.latestNTopicsCreatedByMe(session.USER_DETAIL,3)])
    }
    def myTopics(){
        commonRender("topicList",[topics:topicService.listMyTopics(params.int("offset")?:0,params.int("max")?:5,session.USER_DETAIL)])
    }
    def saveTopic(Topic topic){
        topicService.saveNewTopic(topic,session.USER_DETAIL);
        commonRender('createTopic',[topic:topic,topics:topicService.latestNTopicsCreatedByMe(session.USER_DETAIL,4)]);
    }

    def listAllTopics(){
        commonRender('topicList',[topics:topicService.listAllPublicTopics(params.int("offset")?:0,params.int("max")?:5)])
    }
    def deleteTopic(Integer id){
        Topic.get(id)?.delete(flush: true);
        if(params.js){
            render([data:'Success'] as JSON)
        }else{
            redirect(url:  request.getHeader("referer"));
        }
    }


    // Subscription related Actions

    def listSubscribedTopics(){
        int min = params.int("offset")?:0;
        int max = (params.int("max")?:8) + min;
        List<Topic> list = topicService.listSubscribedTopics(session.USER_DETAIL)
        commonRender("topicList",[topics:list.subList(min,max<list.size()?max:list.size()),totalCount:list.size()]);
    }

    def subscribeTopic(Integer id){
        topicService.subscribeTopic(session.USER_DETAIL,id);
        if(params.js){
            render([data:'Success'] as JSON)
        }else{
            redirect(url:  request.getHeader("referer")+"?sub=true");
        }
    }

    def unsubscribeTopic(Integer id){
        topicService.unsubscribeTopic(session.USER_DETAIL,id);
        if(params.js){
            render([data:'Success'] as JSON)
        }else{
            redirect(url:  request.getHeader("referer")+"?unsub=true");
        }
    }
    // Common Methods

    private def commonRender(String template,Map model){
        String data = g.render(template: template,
                model: model);
        if(params.js)
            render ([data: data] as JSON)
        else{
            render view:"/home",model: [CONTENT:data]
        }
    }
    def list(){
        [topics:Topic.list(),count:Topic.count()]
    }
}
