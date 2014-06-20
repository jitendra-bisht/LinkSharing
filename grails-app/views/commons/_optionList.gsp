<script language="javascript">
    $(document).ready(function(){
        $(".horizontal-menu li a").click(function(){
            var url = $(this).attr('href');
            $("#data").html("<img src='${resource(dir: 'images',file: 'spinner.gif')}'>");
            $.ajax({
                url: url+"?js=true",
                success: function(responseText){
                    $("#data").html(responseText.data);
                }
            })
            return false;
        });
    });
</script>
<div class="left-column">
    <div class="content">
        <div class="about-me">
            <g:if test="${session.USER_DETAIL}">
                <div>
                    <a href="${createLink(controller: "login",action: "index")}" style="text-decoration: none;">
                        ${session.USER_DETAIL.name}
                    </a>
                </div>
            </g:if>
            <a href="${createLink(controller: "login",action: "index")}" style="text-decoration: none;">
                <img src="${createLink(controller: 'user',action: 'profilePicture')}" width="160" height="160" style="border-radius: 5px;">
            </a>
        </div>
        <ul class="horizontal-menu">
            <li>
                <a href="${createLink(controller: 'topic',action: 'createTopic')}">
                    Create New Topic
                </a>
            </li>
            <li>
                <a href="${createLink(controller: 'topic',action: 'myTopics')}">
                    My Topics
                </a>
            </li>
            <li>
                <a href="${createLink(controller: 'topic',action: 'listSubscribedTopics')}">
                    List Subscribed Topics
                </a>
            </li>
            <li>
                <a href="${createLink(controller: 'topic',action: 'listAllTopics')}">
                    List All Topics
                </a>
            </li>
            <li>
                <a href="${createLink(controller: 'resource',action: 'resourceInbox')}">
                    Resource Inbox
                </a>
            </li>
        </ul>
    </div>
</div>