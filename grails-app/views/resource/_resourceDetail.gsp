<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">Detail</h5>
    </div>
    <div class="panel-body">
        <div class="row-fluid">
            <div class="span7">
                <ul class="media-list">
                    <li class="media">
                        <a class="pull-left" href="#">
                            <img src="${createLink(controller: 'commonApi',action: 'fetchImage')}/${resource.createdBy.id}" width="100px" height="100px" style="border-radius: 5px;">
                        </a>
                        <div class="media-body">
                            <h5 class="media-heading">
                                ${resource.createdBy.name}
                                <div style="float: right;margin-right: 30px;">
                                    Topic: ${resource.topic.topicName}<br/>
                                    <span>${ls.dateFormat(format: 'HH:mm dd MMM yyyy',value: resource.dateCreated)}</span>
                                </div>
                            </h5>
                            <p style="margin-top: 23px;">
                                ${resource.description}
                            </p>
                            <p>
                                <span style="float: right;margin-right: 5%;">
                                    <g:if test="${resource instanceof com.linkshare.LinkResource}">
                                        <a href="${resource.url}" target="_blank">
                                            View Full Site
                                        </a>
                                    </g:if>
                                    <g:elseif test="${resource instanceof com.linkshare.DocumentResource}">
                                        <a href="#">
                                            Download
                                        </a>
                                    </g:elseif>
                                </span>
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="span5">
            </div>
        </div>
    </div>
</div>
