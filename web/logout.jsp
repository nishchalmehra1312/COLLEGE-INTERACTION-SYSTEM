<%-- 
    Document   : logot
    Created on : 13 Feb, 2022, 9:12:13 PM
    Author     : nishc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
