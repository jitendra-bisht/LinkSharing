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
<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">Submit Resource</h5>
    </div>
    <div class="panel-body">
        <div class="row-fluid">
            <div class="span6">
                <g:uploadForm controller="resource" action="saveResource" method="post" class="form-horizontal">
                    <g:if test="${lsresource}">
                        <g:if test="${lsresource.hasErrors()}">
                            <div class="alert alert-error">
                                <g:renderErrors bean="${lsresource}"></g:renderErrors>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="alert alert-success">
                                <g:message code="resource.uploaded.new"></g:message>
                            </div>
                        </g:else>
                    </g:if>
                    <div class="control-group">
                        <label class="control-label" for="topic_name">Topic</label>
                        <div class="controls">
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
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="rtype">Resource Type</label>
                        <div class="controls">
                            <g:radioGroup labels="['Document','URL Link']" values="['document','link']" name="type" id="rtype" required="true">
                                ${it.radio} ${it.label}
                            </g:radioGroup>
                        </div>
                    </div>
                    <div class="control-group">
                        <div id="url_link_div">
                            <label class="control-label" for="link">URL Link</label>
                            <div class="controls">
                                <g:textField id="link" name="url"></g:textField>
                            </div>
                        </div>
                        <div id="doc_div">
                            <label class="control-label" for="doc">Document</label>
                            <div class="controls">
                                <input type="file" name="doc" id="doc">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="topic_desc">Topic Description</label>
                        <div class="controls">
                            <g:textArea id="topic_desc" name="description" rows="10" cols="30" required="required"></g:textArea>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <g:submitButton class="btn btn-primary" name="Submit Resource"></g:submitButton>
                        </div>
                    </div>
                </g:uploadForm>
            </div>
            <div class="span6">
                <g:render template="resourceList"></g:render>
            </div>
        </div>
    </div>
</div>
