package com.linkshare

class ReadItem {
    Date dateCreated;
    static belongsTo = [user:User,resource:Resource]

    static constraints = {
    }
}
