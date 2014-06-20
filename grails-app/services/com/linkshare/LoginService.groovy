package com.linkshare

import extra.Gender
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class LoginService {

    def createAdminUser(){
        Role role = Role.findOrSaveWhere(roleName:  "ADMIN")
        User user= User.findOrSaveWhere(
            userName: "admin",
            email: "admin@intelligrape.com",
            gender: Gender.MALE,
            firstName: 'Jitendra',
            lastName: "Bisht",
            password: 'defaultadmin',
            country: 'India'
        );

        if(user.hasErrors()){
            user.setConfirmPassword('defaultadmin');
            user.save(flush: true);
            if(user.hasErrors()){
                log.error("Cannot create admin User because validation error has been occurred.")
                user.getErrors().each {
                    log.error it
                }
            }
        }
        if(!user?.getRole()?.contains(role)){
            user.addToRole(role).save(flush: true);
        }

        role = Role.findOrSaveWhere(roleName:  "USER")
        user= User.findOrSaveWhere(
                userName: "jeetmp",
                email: "jeet.mp3@gmail.com",
                gender: Gender.MALE,
                firstName: 'Jitendra',
                lastName: "Bisht",
                password: 'abcd@1234',
                country: 'India',
                profilePicture: "/home/intelligrape/BootCamp/images/f530bc8bcm.jpg"
        );

        if(user.hasErrors()){
            user.setConfirmPassword('abcd@1234');
            user.save(flush: true);
            if(user.hasErrors()){
                log.error("Cannot create jeetmp3 User because validation error has been occurred.")
                user.getErrors().each {
                    log.error it
                }
            }
        }
        if(!user?.getRole()?.contains(role)){
            user.addToRole(role).save(flush: true);
        }
        user= User.findOrSaveWhere(
                userName: "sonu",
                email: "sonu@gmail.com",
                gender: Gender.MALE,
                firstName: 'Sonu',
                lastName: "Bisht",
                password: 'abcd@1234',
                country: 'India',
                profilePicture: "/home/intelligrape/BootCamp/images/3402528.jpg"
        );

        if(user.hasErrors()){
            user.setConfirmPassword('abcd@1234');
            user.save(flush: true);
            if(user.hasErrors()){
                log.error("Cannot create sonu User because validation error has been occurred.")
                user.getErrors().each {
                    log.error it
                }
            }
        }
        if(!user?.getRole()?.contains(role)){
            user.addToRole(role).save(flush: true);
        }
    }

    User requestLogin(String username,String password){
        User user = User.findByUserNameOrEmail(username,username);
        if(user && user.getPassword() == password){
            return user;
        }else{
            return null;
        }
    }

    def registerNewUser(User user){
        Role role = Role.findOrSaveWhere(roleName: 'USER');
        user.addToRole(role);
        user.save(flush: true);
    }
    def testMethod(){
        println "Method invoke";
        log.error "Method invoke";
    }
}
