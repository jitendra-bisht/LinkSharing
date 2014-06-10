<script>
    $(document).ready(function(){
        $("#url_link_div").css("display","none");
        $("#doc_div").css("display","none");
        $('input:radio[name="type"]').change(
            function(){
                if ($(this).is(':checked') && $(this).val() == 'link') {
                    $("#url_link_div").css("display","block");
                    $("#doc_div").css("display","none");
                }else if ($(this).is(':checked') && $(this).val() == 'document') {
                    $("#doc_div").css("display","block")
                    $("#url_link_div").css("display","none");
                }
            });
    })
</script>
<g:uploadForm controller="LSResource" action="saveResource" method="post">
    <g:if test="${lsresource}">
        <g:if test="${lsresource.hasErrors()}">
            <div class="login-error">
                <g:renderErrors bean="${lsresource}"></g:renderErrors>
            </div>
        </g:if>
        <g:else>
            <div class="message" role="status">
                <g:message code="resource.uploaded.new"></g:message>
            </div>
        </g:else>
    </g:if>
    <div class="login-box-row">
        <label for="topic_name">Topic</label>
        <g:if test="${topic}">
            <g:textField id="topic_name" name="topicName" readonly="true"
                         value="${topic.topicName}" required="required"></g:textField>
            <g:hiddenField name="id" value="${topic.id}"></g:hiddenField>
        </g:if>
        <g:elseif test="${topicList}">
            <select name="id">
                <g:each in="${topicList}" var="topic">
                    <option value="${topic.id}">${topic.topicName}</option>
                </g:each>
            </select>
        </g:elseif>
    </div>
    <div class="login-box-row">
        <label for="rtype">Resource Type</label>
        <g:radioGroup labels="['Document','URL Link']" values="['document','link']" name="type" id="rtype" required="true">
            ${it.radio} ${it.label}
        </g:radioGroup>
    </div>
    <div class="login-box-row">
        <div id="url_link_div">
            <label for="link">URL Link</label>
            <g:textField id="link" name="url"></g:textField>
        </div>
        <div id="doc_div">
            <label for="doc">Document</label>
            <input type="file" name="doc" id="doc">
        </div>
    </div>
    <div class="login-box-row">
        <label for="topic_desc">Topic Description</label>
        <g:textArea id="topic_desc" name="description" rows="10" cols="30" required="required"></g:textArea>
    </div>
    <div class="login-box-row">
        <g:submitButton name="Submit Resource"></g:submitButton>
    </div>
</g:uploadForm>