package com.bootcamp

class Address {
    String city;
    static belongsTo = [group:Group]
    static constraints = {
    }
}
