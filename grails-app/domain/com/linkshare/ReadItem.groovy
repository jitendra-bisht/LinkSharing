package com.linkshare

class ReadItem {
    LinkResource linkResource
    DocumentResource documentResource
    Date dateCreated;
    static belongsTo = [user:User]

    static constraints = {
    }
}
