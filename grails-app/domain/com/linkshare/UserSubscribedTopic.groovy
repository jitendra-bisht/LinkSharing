package com.linkshare

import extra.TopicPriority

class UserSubscribedTopic {
    TopicPriority priority
    Date dateCreated;
    static belongsTo = [user: User, topic: Topic]

    static constraints = {
        priority(blank: false)
    }
    static mapping = {
    }
}
