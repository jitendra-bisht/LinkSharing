package com.linkshare

class CommonApiController {
    def fetchImage(Integer id){
        log.error(id);
        User user = null;
        if(id)
            user = User.read(id);
        else if(session.USER_DETAIL?.id){
            user = User.read(session.USER_DETAIL?.id);
        }

        if(user){
            render(file: new File(user.profilePicture),contentType: 'image/jpeg');
        }
    }
    def fetchImageInto(Integer id,int width,int height){

    }
}
