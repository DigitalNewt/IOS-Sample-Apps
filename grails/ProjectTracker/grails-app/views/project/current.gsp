<%--
  Created by IntelliJ IDEA.
  User: Brent Baker
  Date: 11/11/12
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Current Projects</title>
</head>
<body>
    <table border="1">
        <g:each in="${allProjects}" status="i" var="thisProject">
            <tr>
                <td>${thisProject.name}</td>
                <td>${thisProject.description}</td>
                <td>${thisProject.dueDate}</td>
            </tr>
        </g:each>
    </table>
</body>
</html>