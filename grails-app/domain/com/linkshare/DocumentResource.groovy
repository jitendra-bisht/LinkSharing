package com.linkshare
class DocumentResource extends Resource{
    String path
    static belongsTo = [topic:Topic,readItem:ReadItem]
    static constraints = {
        path(empty:false)
        readItem(nullable: true);
    }
}
