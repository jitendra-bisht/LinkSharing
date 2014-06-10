/**
 * Created by intelligrape on 8/6/14.
 */
function getParam(url,param){
    var value
    var arr = url.split("?");
    if(arr[1]!=null){
        var param_arr=arr[1].split("&");
        if(param_arr!=null){
            for(var i=0;i<param_arr.length;i++){
                if(param_arr[i].indexOf(param)>-1){
                    var valueArr = param_arr[i].split("=")
                    if(valueArr!=null && valueArr[1]!=null){
                        value = valueArr[1];
                    }
                }
            }
        }
    }
    return value;
}