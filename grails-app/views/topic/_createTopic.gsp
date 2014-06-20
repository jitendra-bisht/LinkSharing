<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">Create New Topic</h5>
    </div>
    <div class="panel-body">
        <div class="row-fluid">
            <div class="span6">
                <g:form controller="topic" action="saveTopic" method="post" class="form-horizontal">
                    <g:if test="${topic}">
                        <g:if test="${topic.hasErrors()}">
                            <div class="alert alert-error">
                                <g:renderErrors bean="${topic}"></g:renderErrors>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="alert alert-success">
                                <g:message code="topic.created.new"></g:message>
                            </div>
                        </g:else>
                    </g:if>
                    <div class="control-group">
                        <label class="control-label" for="topic_name">Topic Name<sup>*</sup></label>
                        <div class="controls">
                            <g:textField id="topic_name" name="topicName" required="required"></g:textField>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="visibility">Topic Visibility<sup>*</sup></label>
                        <div class="controls">
                            <g:radioGroup labels="['Public','Private']" values="['PUBLIC','PRIVATE']" name="visibility" id="visibility">
                                ${it.radio} ${it.label}
                            </g:radioGroup>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="topic_desc">Topic Description<sup>*</sup></label>
                        <div class="controls">
                            <g:textArea id="topic_desc" name="description" rows="10" cols="150" required="required"></g:textArea>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <g:submitButton class="btn btn-primary" name="Create Topic"></g:submitButton>
                        </div>
                    </div>
                </g:form>
            </div>
            <div class="span6">
                <g:if test="${topics}">
                    <g:render template="topicList" model="${topics}"></g:render>
                </g:if>
            </div>
        </div>
    </div>
</div>
