package com.linkshare

import grails.transaction.Transactional

@Transactional
class TopicResourceService {
    CommonApiService commonAPI;
    def grailsApplication;

    Map getTopicOrTopicList(Integer id,User sessionUser) {
        Map map = new HashMap();
        Topic topic;
        User user = User.load(sessionUser?.id);
        List<Topic> topicList;
        if(id){
            topic = Topic.load(id);
            map.put("topic",topic);
        }else{
            topicList = user.userSubTopic.topic
            if(topicList)
                map.put("topicList",topicList);
        }
        return map;
    }

    List<Resource> latestNResourceByMe(User sessionUser,int max){
        List<Resource> resource = new ArrayList<Resource>();
        resource.addAll(Resource.findAllByCreatedBy(sessionUser,[sort: "dateCreated",order: "desc",max: max]))
        return resource;
    }

    List<Resource> myInbox(User sessionUser,int start,int max){
        List<Resource> resourceList = new ArrayList<Resource>();
        User user = User.createCriteria().get(){
            eq("id",sessionUser?.id);
        }
        resourceList.addAll(user.userSubTopic*.topic.resource.flatten())
        return resourceList;
    }

    List<Integer> readItems(User sessionUser){
        User user = User.read(sessionUser?.id);
        List<Resource> list = ReadItem.createCriteria().list (){
            projections{
                property("resource");
            }
            eq("user",user)
        }
        return list.collect{it.id};
    }
    Resource saveNewResource(User sessionUser,Map params){
        User user = User.load(sessionUser?.id);
        Topic topic = Topic.load(params.id);
        if(topic){
            if(params.type){
                if(params.type == "link"){
                    Resource resource = new LinkResource(
                            topic: topic,
                            createdBy: user,
                            url: params.url,
                            description:params.description
                    )
                    if(resource.validate()){
                        resource.save(flush: true);
                        saveReadItem(resource,user);
                        return resource;
                    }

                }else if(params.type == "document"){
                    File file = commonAPI.uploadFile(params.doc,
                            grailsApplication.config.path.document);
                    DocumentResource resource = new DocumentResource(
                            topic: topic,
                            createdBy: user,
                            path: file.getAbsolutePath(),
                            description:params.description
                    )
                    if(resource.validate()){
                        resource.save(flush: true);
                        saveReadItem(resource,user);
                        return resource;
                    }else{
                        file.delete();
                    }
                }
            }
        }
        return null;
    }

    def saveReadItem(Resource resource,User user){
        ReadItem.findOrSaveWhere(
                resource: resource,
                user: user
        );
    }
}
