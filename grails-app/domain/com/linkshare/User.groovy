package com.linkshare

import extra.Gender
import org.grails.databinding.BindingFormat

class User {
    String firstName
    String lastName
    String email;
    String userName;
    String password;
    String profilePicture;
    String country;
    Gender gender
    @BindingFormat('MM/dd/yyyy')
    Date dob;
    Date dateCreated;
    Date lastUpdated;
    String confirmPassword;

    static transients=['name','confirmPassword']
    static hasMany = [userSubTopic:UserSubscribedTopic,topic:Topic,readItem:ReadItem, role:Role]

    static constraints = {
        email(empty: false,email: true,unique: true)
        userName(empty: false,unique: true,matches: '[a-zA-Z0-9]+')
        password(empty: false,minSize: 8)
        gender(empty:false)
        dob(nullable: true)
        profilePicture(nullable: true)
        country(empty:false)
        confirmPassword(nullable: true,empty: false,validator: {
            val,obj->
                if(!(val?.equals(obj?.password))){
                    return false;
                }
        })
    }
    public String getName(){
        return firstName+" "+lastName;
    }
    public String getConfirmPassword(){
        return confirmPassword;
    }
    public void setConfirmPassword(String pass){
        confirmPassword = pass;
    }
}
