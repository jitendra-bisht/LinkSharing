package com.linkshare
class LinkResource extends Resource{
    String url;
    static belongsTo = [topic:Topic,readItem:ReadItem]
    static constraints = {
        url(empty:false,url: true)
        readItem(nullable: true)
    }
}
