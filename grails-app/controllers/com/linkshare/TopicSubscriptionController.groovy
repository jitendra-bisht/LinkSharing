package com.linkshare

import extra.TopicPriority
import grails.converters.JSON

class TopicSubscriptionController {

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
            redirect(url:  request.getHeader("referer"));
        }
    }

    private def common(def data){
        if(params.js)
            render ([data: data] as JSON)
        else
            render view:"/user/index",model: [CONTENT:data]
    }
}
