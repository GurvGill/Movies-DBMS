<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : LoggedInUser
    Created on : Nov 15, 2017, 8:22:06 PM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page import="moviesapp.Accounts"%>
<%@page import="moviesapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Accounts accounts = new Accounts();
            User user = new User();
            user = accounts.FindUser(email, password);
            if(user != null)
            {    
                %>
                <script>
                    alert("Log in was successful.");
                </script>
                <jsp:include page="LoggedInUser.jsp"/>
               <%      
            }else{
                %>
                <script>
                    alert("Incorrect email or password. Try again.");
                </script>
                <jsp:include page="LoginForm.jsp"/>
                <%
            }          
        %>
    </body>
</html>
