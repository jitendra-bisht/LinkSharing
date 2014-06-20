<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">${TITLE}</h5>
    </div>
    <g:if test="${resourceList}">
        <div class="table-responsive">
            <table class="table">
                <tr>
                    <th>S. No</th>
                    <th>Topic</th>
                    <th>Description</th>
                    <th>Uploaded Date</th>
                    <th></th>
                </tr>
                <g:each in="${resourceList}" var="res" status="index">
                    <g:if test="${readItems && readItems.contains(res.id)}">
                        <tr class='active'>
                    </g:if>
                    <g:else>
                        <tr class="well">
                    </g:else>
                        <td><a href="${createLink(controller: 'resource',action: 'detail')}/${res.id}">${index+1}</a></td>
                        <td><a href="${createLink(controller: 'resource',action: 'detail')}/${res.id}">${res.topic.topicName}</a></td>
                        <td>
                            <a href="${createLink(controller: 'resource',action: 'detail')}/${res.id}">
                                %{--${res.description}--}%
                                ${res.description?.substring(0,(res.description?.size()<30?res.description?.size():30))}
                            </a>
                        </td>
                        <td><a href="${createLink(controller: 'resource',action: 'detail')}/${res.id}">${ls.dateFormat(format: "dd-MMM-yyyy",value: res.dateCreated)}</a></td>
                        <td>
                            <g:if test="${readItems && readItems.contains(res.id)}">
                                <a href="${createLink(controller: 'resource',action: 'markUnread')}/${res.id}">
                                    <span class="icon-remove-circle" data-toggle="tooltip" title="Mark as Unread"></span>
                                </a>
                            </g:if>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </g:if>
</div>
