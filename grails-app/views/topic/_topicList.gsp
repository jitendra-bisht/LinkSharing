<style>
    .topicListOwner,.topicListSubscribe,.topicListPublic{
        list-style: none;
        margin: 0px;
    }
    .delete,.unsub,.sub,.invite,.resource{

    }
    .optionList{

    }
    li a{
        text-decoration: none;
    }
</style>
<script>
    $(document).ready(function(){
        refereshDOM();
        $(".resource").click(function(){
            var url = $(this).attr('href');
            $.ajax({
                url: url,
                success: function(responseText){
                    $("#data").html(responseText.data);
                }
            })
            return false;
        });
        $(".delete").click(function(){
           var url = $(this).attr('href');
            $.ajax({
                url: url,
                success: function(){
                    $("#deleteStatus").css("display","block")
                    $("#deleteStatus").html("Topic has been deleted.");
                    $("#"+getParam(url,'id')).remove();
                }
            })
            return false;
        });
        $(".unsub").click(function(){
            var url = $(this).attr('href');
            $.ajax({
                url: url,
                success: function(){
                    $("#deleteStatus").css("display","block")
                    $("#deleteStatus").html("Topic has been Unsubscribed.");
                    var id = getParam(url,'id');
                    $("#"+id+" td:last-child").html('<ul class="topicListSubscribe">'
                            +"<li><a class='sub' href=\"${createLink(controller: 'topic',action: 'subscribeTopic')}?id="+id+"&js=true\">Subscribe Topic</a></li>"
                            +'</ul>');
                    refereshDOM();
                }
            })
            return false;
        });
        $(".sub").click(function(){
            var url = $(this).attr('href');
            $.ajax({
                url: url,
                success: function(){
                    $("#deleteStatus").css("display","block")
                    $("#deleteStatus").html("Topic has been subscribed.");
                    var id = getParam(url,'id');
                    $("#"+id+" td:last-child").html('<ul class="topicListSubscribe">'
                            +"<li><a class='unsub' href=\"${createLink(controller: 'topic',action: 'unsubscribeTopic')}?id="+id+"&js=true\">Unsubscribed</a></li>"
                            +"<li><a class='resource' href=\"${createLink(controller: 'LSResource',action: 'index')}?id="+id+"&js=true\">Submit Resource</a></li>"
                            +'</ul>');
                    refereshDOM();
                }
            })
            return false;
        });
    });
    function refereshDOM(){
        $(".optionList a").each(function(){
            var href = $(this).attr('href');
            if(href.indexOf("js=true")==-1){
                href=href + "&js=true";
            }
            $(this).attr('href',href)
        });
    }
</script>
<g:if test="${params.sub || params.unsub}">
    <div id="deleteStatus" class="message" role="status">
        <g:if test="${params.sub=='true'}">
            Topic subscribed.
        </g:if>
        <g:if test="${params.unsub=='true'}">
            Topic unsubscribed.
        </g:if>
    </div>
</g:if>
<div id="deleteStatus" class="message" role="status" style="display: none;">
</div>
<table width="100%" style="font-size: 12px;">
        <tr>
            <th>S. No</th>
            <th>Topic Name</th>
            <th>Topic Description</th>
            <th>Topic Visibility</th>
            <th>Created Date</th>
            <th>Options</th>
        </tr>
        <g:each in="${topics}" var="topic" status="index">
            <tr id="${topic.id}">
                <td>${index+1}</td>
                <td>${topic.topicName}</td>
                <td>${topic.description?.substring(0,(topic.description?.size()<30?topic.description?.size():30))}</td>
                <td>${topic.visibility}</td>
                <td>${g.formatDate(format: 'dd-MM-yyyy',date: topic.dateCreated)}</td>
                <td class="optionList">
                    <g:if test="${session.USER_DETAIL?.id == topic.createdBy?.id}">
                        <ul class="topicListOwner">
                           <li><a class="delete" href="${createLink(controller: 'topic',action: 'deleteTopic')}?id=${topic.id}">Delete Topic</a></li>
                           <li><a class="invite" href="">Invite People</a></li>
                           <li><a class="resource" href="${createLink(controller: 'LSResource',action: 'index')}?id=${topic.id}">Submit Resource</a></li>
                        </ul>
                    </g:if>
                    <g:elseif test="${topic?.userSubTopic?.collect{it.user.id}?.contains(session.USER_DETAIL?.id)}">
                        <ul class="topicListSubscribe">
                            <li><a class="unsub" href="${createLink(controller: 'topic',action: 'unsubscribeTopic')}?id=${topic.id}">Unsubscribed</a></li>
                            <li><a class="resource" href="${createLink(controller: 'LSResource',action: 'index')}?id=${topic.id}">Submit Resource</a></li>
                        </ul>
                    </g:elseif>
                    <g:else>
                        <ul class="topicListPublic">
                            <li><a class="sub" href="${createLink(controller: 'topic',action: 'subscribeTopic')}?id=${topic.id}">Subscribe Topic</a></li>
                        </ul>
                    </g:else>
                </td>
            </tr>
        </g:each>
</table>