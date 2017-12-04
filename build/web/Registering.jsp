<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Signup
    Created on : Nov 8, 2017, 2:44:45 PM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page import="moviesapp.Accounts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Page</title>
    </head>
    <body>
        <%
            int result = 0;
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Date date = new Date();
            Timestamp time = new Timestamp(date.getTime());
            Accounts accounts = new Accounts();
            
            if(accounts.UniqueEmail(email) == 0)
            {  
                result = accounts.setAccount(email, first_name, last_name, password, time);
                
                if(result != 0)
                {
                    %>
                    <script>
                        alert("Registration was successful.");
                    </script>
                    <jsp:include page="LoggedInUser.jsp"/>
                   <%      
                }else if(result == 0){
                    %>
                    <script>
                        alert("Unable to register.");
                    </script>
                    <jsp:include page="RegisterForm.jsp"/>
                    <%
                } 
            }else{
                %>
                <script>
                    alert("Email is already taken. Please re-enter information.");
                </script>
                <jsp:include page="RegisterForm.jsp"/>
                <%
            }          
        %>
    </body>
</html>