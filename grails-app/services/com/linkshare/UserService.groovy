package com.linkshare

import grails.transaction.Transactional
import org.springframework.context.i18n.LocaleContextHolder

@Transactional
class UserService {
    def messageSource;

    Map changePassword(Map params){
       String error,success;
       User user = User.read(params.id);
       if(params.newPassword == params.confirmPassword){
           if(user){
               if(user.password == params.oldPassword){
                   user.password = params.newPassword;
                   user.confirmPassword = params.confirmPassword;
                   if(user.validate()){
                       user.save(flush: true);
                       success = messageSource.getMessage('success.password.reset',null,LocaleContextHolder.locale);
                   }
               }else{
                   error = messageSource.getMessage('error.password.matching',["New Password","Old Password"].toArray(),LocaleContextHolder.locale);
               }
           }
       }else{
           error = messageSource.getMessage('error.password.matching',["New Password","Confirm Password"].toArray(),LocaleContextHolder.locale);
       }
       return [user:user,error:error,success:success];
    }
}
