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
    }

    User requestLogin(String username,String password){
        User user = User.findByUserNameOrEmail(username,username);
        if(user && user.getPassword() == password){
            return user;
        }else{
            return null;
        }
    }

    File saveFile(CommonsMultipartFile rawFile,String filesPath){
        StringBuilder filePath = new StringBuilder(filesPath)
                .append(File.separator)
                .append(UUID.randomUUID().toString().replaceAll("-", "").substring(1,10))
                .append(rawFile?.originalFilename);
        log.error(rawFile.getStorageDescription());
        File file = new File(filePath.toString());
        file.bytes = rawFile.bytes;
        return file;
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
