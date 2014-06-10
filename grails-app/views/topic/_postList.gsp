<div class="post-box">
    <div class="post-title-bar">
        Recent Shares
    </div>
    <g:each in="${recentShare}" var="topic" status="index">
        <div class="post">
        <img src="${createLink(controller: 'user',action: 'profilePictureById')}?id=${topic.createdBy.id}" width="50px" height="50px" style="border-radius: 5px;">
            <div>
                <div class="title">${topic.createdBy.name}
                    <span>@Jeet 10 min</span>
                </div>
                <p>
                    ${topic.description}
                </p>
            </div>
        </div>
    </g:each>
</div>
