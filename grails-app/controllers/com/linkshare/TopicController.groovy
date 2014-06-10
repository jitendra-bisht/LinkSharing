package com.linkshare

import extra.TopicPriority
import extra.Visibility
import grails.converters.JSON

class TopicController {
    static allowedMethods = {
        saveTopic: ["POST"]
    }

    // TOPIC CURD
    def createTopic(){
        String form = g.render(template: 'createTopic')
        common(form)
    }
    def myTopics(){
        String topics = g.render(template: "topicList",model:[topics:Topic.findAllByCreatedBy(session.USER_DETAIL)])
        common(topics)
    }
    def saveTopic(Topic topic){
        if(topic){
            topic.createdBy=session.USER_DETAIL
        }
        if(topic?.validate()){
            topic.save(flush: true);
            User user = User.get(session.USER_DETAIL?.id)
            UserSubscribedTopic.findOrSaveWhere(
            user: user,
            topic:topic,
            priority:TopicPriority.HIGH);
        }
        render (view: 'create',model: [topic:topic])
    }

    def listAllTopics(){
        String topics = g.render(template: "topicList",model:[topics:Topic.findAllByVisibility(Visibility.PUBLIC)])
        common(topics)
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
        User user = User.get(session.USER_DETAIL?.id);
        String topics = g.render(template: "topicList",model:[topics:user.userSubTopic.topic])
        common(topics)
    }

    def subscribeTopic(Integer id){
        User user = User.get(session.USER_DETAIL?.id);
        Topic topic = Topic.get(id);
        UserSubscribedTopic.findOrSaveWhere(
                user:user,
                topic: topic,
                priority: TopicPriority.MID
        )
        if(params.js){
            render([data:'Success'] as JSON)
        }else{
            redirect(url:  request.getHeader("referer")+"?sub=true");
        }
    }

    def unsubscribeTopic(Integer id){
        User user = User.get(session.USER_DETAIL?.id);
        Topic topic = Topic.get(id);
        UserSubscribedTopic.findWhere(
                user:user,
                topic: topic,
                priority: TopicPriority.MID
        ).delete(flush: true)

        if(params.js){
            render([data:'Success'] as JSON)
        }else{
            redirect(url:  request.getHeader("referer")+"?unsub=true");
        }
    }
    // Common Methods

    private common(def data){
        if(params.js)
            render ([data: data] as JSON)
        else
            render view:"/user/index",model: [CONTENT:data]
    }

}
