package com.linkshare

import extra.Visibility

class Topic {
    String topicName;
    String description
    Date dateCreated;
    Visibility visibility;

    static hasMany = [userSubTopic:UserSubscribedTopic,resource:Resource]
    static belongsTo = [createdBy:User]

    static constraints = {
        topicName(unique: true,empty: false)
        description(empty: false)
    }
    static mapping = {
        description type: "text"
        resource sort: "dateCreated",order: "desc"
    }
}
