package com.linkshare
class LinkResource extends Resource{
    String url;
    static constraints = {
        url(empty:false,url: true)
    }
}
