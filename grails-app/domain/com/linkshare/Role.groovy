package com.linkshare

class Role {
    String roleName;

    static constraints = {
        roleName(empty: false,inList: ['ADMIN','USER'])
    }
}
