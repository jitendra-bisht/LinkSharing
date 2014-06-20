<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 2/6/14
  Time: 10:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<g:form controller="login" action="loginHandler" method="post" class="form-inline">
    <g:if test="${errorMessage == true}">
        <span class="alert alert-error" style="padding: 5px; margin-right: 5px;">
            Username/Password wrong.
        </span>
    </g:if>
    <input type="text" class="input-small" name="username" placeholder="Email/Username" required="true">
    <input type="password" class="input-small" name="password" placeholder="Password" required="true">
    <br/>
    <div class="pull-right">
        <label class="checkbox">
            <input type="checkbox"> Remember me
        </label>
        <button type="submit" class="btn btn-primary">Sign in</button>
    </div>
</g:form>
