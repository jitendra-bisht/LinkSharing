package com.linkshare
class DocumentResource extends Resource{
    String path
    static constraints = {
        path(empty:false)
    }
}
