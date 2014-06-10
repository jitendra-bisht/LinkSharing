package com.linkshare

import extra.Visibility

class Topic {
    String topicName;
    String description
    Date dateCreated;
    Visibility visibility;

    static hasMany = [userSubTopic:UserSubscribedTopic,linkResource:LinkResource,documentResource:DocumentResource]
    static belongsTo = [createdBy:User]

    static constraints = {
        topicName(unique: true,empty: false)
        description(empty: false,maxSize: 1024)
    }
}
