package com.linkshare

class Resource {
    Topic topic;
    User createdBy;
    String description;
    Date dateCreated;
    static belongsTo = [topic:Topic]
    static hasMany = [readItems:ReadItem]
    static constraints = {
        description(empty:false)
        readItems nullable: true
    }
    static mapping = {
        tablePerHierarchy(false)
        description type: "text"
    }
}
