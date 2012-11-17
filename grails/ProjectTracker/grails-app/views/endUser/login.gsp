<%@ page import="projecttracker.EndUser" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="ProjectTracker Login" />
    <title><g:message code="ProjectTracker Login" args="[entityName]" /></title>
</head>
<body>
<a href="#create-endUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="logout"><g:message code="Logout" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-endUser" class="content scaffold-create" role="main">
    <h1><g:message code="ProjectTracker Login" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${endUserInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${endUserInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="authenticate" >
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'userName', 'error')} ">
                <label for="userName">
                    <g:message code="endUser.userName.label" default="User Name" />

                </label>
                <g:textField name="userName" value="${endUserInstance?.userName}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: endUserInstance, field: 'password', 'error')} ">
                <label for="password">
                    <g:message code="endUser.password.label" default="Password" />

                </label>
                <g:field type="password" name="password" value="${endUserInstance?.password}"/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="login" class="save" value="Login" />
        </fieldset>
    </g:form>
</div>
</body>
</html>