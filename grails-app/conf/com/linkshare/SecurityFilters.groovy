package com.linkshare

class SecurityFilters {

    def filters = {
        loginCheck(controller:'login|group|commonApi', invert: true) {
            before = {
                if(!session.USER_DETAIL || !(session.USER_DETAIL instanceof User)){
                    redirect(controller: "login",action: "index")
                    return false;
                }
            }
        }

        validAdmin(controller: 'admin',action:'*'){
            before = {
                if(!session.USER_DETAIL || !(session.USER_DETAIL instanceof User)){
                    redirect(controller: "login",action: "index")
                    return false;
                }else if(!session.USER_DETAIL.role.collect{it.roleName}.contains("ADMIN")){
                        render("Not Authorised User");
                        return false;
                }
            }

        }
    }
}
