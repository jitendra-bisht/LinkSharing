<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">Recent Shares</h5>
    </div>
    <div class="panel-body">
        <div class="row-fluid">
            <div class="span12">
                <ul class="media-list">
                    <g:each in="${recentShare}" var="topic" status="index">
                        <li class="media">
                            <a class="pull-left" href="#">
                                <img src="${createLink(controller: 'commonApi',action: 'fetchImage')}/${topic.createdBy.id}" width="100px" height="100px" style="border-radius: 5px;">
                            </a>
                            <div class="media-body">
                                <h5 class="media-heading">
                                    ${topic.createdBy.name}
                                    <span>(${ls.dateAsStringOneWord(date: topic.dateCreated)})</span>
                                </h5>
                                <p>
                                    ${topic.description?.substring(0,(topic.description?.size()<200?topic.description?.size():200))}
                                </p>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
</div>
                %{--<g:each in="${recentShare}" var="topic" status="index">--}%
                    %{--<div class="post">--}%
                        %{--<img src="${createLink(controller: 'user',action: 'profilePictureById')}?id=${topic.createdBy.id}" width="50px" height="50px" style="border-radius: 5px;">--}%
                        %{--<div>--}%
                            %{--<div class="title">${topic.createdBy.name}--}%
                                %{--<span>@Jeet 10 min</span>--}%
                            %{--</div>--}%
                            %{--<p>--}%
                                %{--${topic.description}--}%
                            %{--</p>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</g:each>--}%
