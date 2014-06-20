<ls:isRole user="${session.USER_DETAIL}" role="USER">
    <li>
        <g:if test="${session.USER_DETAIL}">
            <a href="${createLink(controller: "user",action: "userAccount")}">
                %{--<img src="${createLink(controller: 'user',action: 'fetchProfilePicture')}" width="40" height="40">--}%
                ${session.USER_DETAIL.name}
            </a>
        </g:if>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Topic<b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="${createLink(controller: 'topic',action: 'createTopic')}">Create New Topic</a></li>
            <li><a href="${createLink(controller: 'topic',action: 'myTopics')}">My Topics</a></li>
            <li><a href="${createLink(controller: 'topic',action: 'listAllTopics')}">All Topics</a></li>
            <li><a href="${createLink(controller: 'topic',action: 'listSubscribedTopics')}">Subscribed Topics</a></li>
            <li class="divider"></li>
            <li><a href="#">Delete Topic</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Resource<b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="${createLink(controller: 'resource',action: 'index')}">Submit Resource</a></li>
            <li><a href="${createLink(controller: 'resource',action: 'myResources')}">My Resources</a></li>
            <li><a href="#">Delete Resource</a></li>
        </ul>
    </li>
</ls:isRole>