package com.linkshare

class Resource {
    Topic topic
    User createdBy
    String description
    static constraints = {
        description(empty:false)
    }
    static mapping = {
        tablePerHierarchy(false)
    }
}
