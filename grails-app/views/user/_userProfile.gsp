<g:if test="${user}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h5 class="panel-title">${user.name} Account</h5>
        </div>
        <div class="panel-body">
            <div class="row-fluid">
                <div class="span5">

                    <img src="${createLink(controller: 'commonApi',action: 'fetchImage')}">
                </div>
                <div class="span7">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Date Of Birth</th>
                                <th>Account Created</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${ls.dateFormat(format: "dd-MMM-yyyy",value: user.dob)}</td>
                                <td>${ls.dateFormat(format: "dd-MMM-yyyy",value: user.dateCreated)}</td>
                            </tr>
                        </tbody>
                    </table>
                    <button id="changePasswordButton" class="btn btn-default btn-xs">Reset Password</button>
                    <br/>
                    <br/>
                    <div id="resetPasswordForm" style="display: none;" class="panel panel-default">
                        <div class="panel-body">
                            <g:if test="${user.hasErrors()}">
                                <div class="alert alert-error">
                                    <g:renderErrors bean="${user}"></g:renderErrors>
                                </div>
                            </g:if>
                            <g:elseif test="${error}">
                                <div class="alert alert-error">
                                    ${error}
                                </div>
                            </g:elseif>
                            <g:elseif test="${success}">
                                <div class="alert alert-success">
                                    ${success}
                                </div>
                            </g:elseif>

                            <g:if test="${user.hasErrors() || error || success}">
                                <script>
                                    $("#resetPasswordForm").css("display","block");
                                </script>
                            </g:if>
                            <g:form controller="user" action="update" method="post" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="oldPass">Old Password<sup>*</sup></label>
                                    <div class="controls">
                                        <g:hiddenField name="id" value="${user.id}"></g:hiddenField>
                                        <g:passwordField required="true" name="oldPassword" id="oldPass"></g:passwordField>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="newPass">New Password<sup>*</sup></label>
                                    <div class="controls">
                                        <g:passwordField required="true" name="newPassword" id="newPass"></g:passwordField>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="cnfmPass">Confirm Password<sup>*</sup></label>
                                    <div class="controls">
                                        <g:passwordField required="true" id="cnfmPass" name="confirmPassword"></g:passwordField>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <g:submitButton name="Change" required="true" value="Change Password" class="btn btn-primary"></g:submitButton>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:if>
<script>
    $("#changePasswordButton").click(function(){
        $("#resetPasswordForm").toggle();
    });
</script>