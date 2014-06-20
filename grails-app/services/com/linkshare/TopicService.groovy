package com.linkshare

import extra.TopicPriority
import extra.Visibility
import grails.transaction.Transactional

@Transactional
class TopicService {
    List<Topic> latestNTopicsCreatedByMe(User user,int max){
        return Topic.findAllByCreatedBy(user,[sort:"dateCreated",order: "desc",max: max])
    }
    List<Topic> listAllPublicTopics(int start,int max){
        List topics = Topic.createCriteria().list(offset: start,max: max){
            eq('visibility',Visibility.PUBLIC)
            order("dateCreated","desc")
        }
        return topics;
    }
    List<Topic> listMyTopics(int start,int max,User user){
        List topics = Topic.createCriteria().list(offset: start,max: max){
            eq("createdBy",user)
            order("dateCreated","desc")
        }
        return topics;
    }

    List<Topic> listSubscribedTopics(User user){
        List<Topic> list = User.read(user.id).userSubTopic.topic;
        return list;
    }

    Topic saveNewTopic(Topic topic,User sessionUser){
        if(topic){
            User user = User.load(sessionUser?.id)
            topic.createdBy=user
            if(topic?.validate()){
                topic.save(flush: true);

                topic.addToUserSubTopic(new UserSubscribedTopic(
                        user:user,topic:topic,priority:  TopicPriority.HIGH)).save(flush: true);
            }
        }
    }

    def subscribeTopic(User sessionUser,Integer id){
        User user = User.load(sessionUser?.id);
        Topic topic = Topic.load(id);
        topic.addToUserSubTopic(new UserSubscribedTopic(
                user:user,
                topic: topic,
                priority: TopicPriority.MID
        )).save(flush: true);
    }

    def unsubscribeTopic(User sessionUser,Integer id){
        User user = User.load(sessionUser?.id);
        Topic topic = Topic.load(id);
        UserSubscribedTopic.findWhere(
                user:user,
                topic: topic,
        ).delete(flush: true);
    }
}
