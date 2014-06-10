package com.bootcamp

class Group {
    String group;
    Integer order;
    String description;
    Date dateCreated;
    Date lastUpdated;

    static hasMany = [address:Address]
    static constraints = {
        dateCreated nullable: true;
        lastUpdated nullable: true;
    }
    static mapping = {
        table "user_group"

        group column: "group_name"
        order column:"group_order"
        description type: "text"

        sort "group"
        version(false)
        autoTimestamp(false)

        address lazy: false;
        address fetch: "join"
    }
}
