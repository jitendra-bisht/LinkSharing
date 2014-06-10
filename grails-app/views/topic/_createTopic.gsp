<g:form controller="topic" action="saveTopic" method="post">
    <g:if test="${topic}">
        <g:if test="${topic.hasErrors()}">
            <div class="login-error">
                <g:renderErrors bean="${topic}"></g:renderErrors>
            </div>
        </g:if>
        <g:else>
            <div class="message" role="status">
                <g:message code="topic.created.new"></g:message>
            </div>
        </g:else>
    </g:if>
    <div class="login-box-row">
        <label for="topic_name">Topic Name</label>
        <g:textField id="topic_name" name="topicName" required="required"></g:textField>
    </div>
    <div class="login-box-row">
        <label for="visibility">Topic Visibility</label>
        <g:radioGroup labels="['Public','Private']" values="['PUBLIC','PRIVATE']" name="visibility" id="visibility">
            ${it.radio} ${it.label}
        </g:radioGroup>
    </div>
    <div class="login-box-row">
        <label for="topic_desc">Topic Description</label>
        <g:textArea id="topic_desc" name="description" rows="10" cols="30" required="required"></g:textArea>
    </div>
    <div class="login-box-row">
        <g:submitButton name="Create Topic"></g:submitButton>
    </div>
</g:form>