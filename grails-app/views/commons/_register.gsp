<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 2/6/14
  Time: 10:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
    <div class="login-title">
        Register
    </div>
    <g:if test="${user}">
        <g:if test="${user.hasErrors()}">
            <div class="alert alert-error">
                <g:renderErrors bean="${user}"></g:renderErrors>
            </div>
        </g:if>
        <g:else>
            <div class="alert alert-success">
                   <g:message code="user.created.new"></g:message>
            </div>
        </g:else>
    </g:if>
    <g:uploadForm controller="login" action="registerUser" method="post" class="form-horizontal">
        <div class="control-group">
            <label class="control-label"  for="firstname">First Name<sup>*</sup></label>
            <div class="controls">
                <g:textField id="firstname" name="firstName" value="${user?.firstName}" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="lname">Last Name<sup>*</sup></label>
            <div class="controls">
                <g:textField id="lname" name="lastName" value="${user?.lastName}" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="email">Email<sup>*</sup></label>
            <div class="controls">
                <input id="email" name="email" type="email" value="${user?.email}" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="username">Username<sup>*</sup></label>
            <div class="controls">
                <g:textField id="username" name="userName" value="${user?.userName}" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="password">Password<sup>*</sup></label>
            <div class="controls">
                <g:passwordField id="password" name="password" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="confirmPassword">Confirm Password<sup>*</sup></label>
            <div class="controls">
                <g:passwordField id="confirmPassword" name="confirmPassword" required="true"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="dob">Date of Birth<sup>*</sup></label>
            <div class="controls">
                <input type="text" id="datepicker" name="dob" value="<ls:dateFormat format='MM/dd/yyyy' value='${user?.dob}'/>" required="true">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="gender">Gender<sup>*</sup></label>
            <div class="controls">
                <g:radioGroup labels="['Male','Female']" value="${user?.gender}" values="['MALE','FEMALE']" name="gender" required="true">
                    ${it.radio}${it.label}
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </g:radioGroup>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="country">Select your country<sup>*</sup></label>
            <div class="controls">
                <g:countrySelect name="country" id="country" value="${user?.country}"></g:countrySelect>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"  for="photo">Profile Pic</label>
            <div class="controls">
                <input id="photo" type="file" name="imageFile">
            </div>
        </div>
        <div class="control-group" style="margin-top: 10px;">
            <div class="controls">
                <g:submitButton class="btn btn-success" name="submit" value="Register"/>
            </div>
        </div>
    </g:uploadForm>