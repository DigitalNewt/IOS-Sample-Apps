
<%@ page import="projecttracker.EndUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endUser.label', default: 'EndUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-endUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-endUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list endUser">
			
				<g:if test="${endUserInstance?.fullName}">
				<li class="fieldcontain">
					<span id="fullName-label" class="property-label"><g:message code="endUser.fullName.label" default="Full Name" /></span>
					
						<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${endUserInstance}" field="fullName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserInstance?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="endUser.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${endUserInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="endUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${endUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserInstance?.projects}">
				<li class="fieldcontain">
					<span id="projects-label" class="property-label"><g:message code="endUser.projects.label" default="Projects" /></span>
					
						<g:each in="${endUserInstance.projects}" var="p">
						<span class="property-value" aria-labelledby="projects-label"><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${endUserInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="endUser.tasks.label" default="Tasks" /></span>
					
						<g:each in="${endUserInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${endUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${endUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
