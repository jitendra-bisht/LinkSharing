package com.linkshare

import java.text.SimpleDateFormat

class LinkshareTagLib {
    //static encodeAsForTags = [tagName: 'raw']
    static namespace = "ls"

    def dateFormat={attrs->
        if(attrs.format && attrs.value){
            SimpleDateFormat sdf = new SimpleDateFormat(attrs.format);
            out << sdf?.format(attrs.value)
        }
    }

    def isRole={attrs,body->
        User user = attrs.user;
        if(user && attrs.role){
            if(user.role.collect{it.roleName}.contains(attrs.role)){
                out << body();
            }
        }
    }
}
