<%-- 
    Document   : index.jsp
    Created on : Nov 8, 2017, 2:28:32 PM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<link type = "text/css" rel ="stylesheet" href="CSS/index.css" > 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie DBMS</title>

        <%-- nav bar in index page --%>
    <div class="topnav" id="myTopnav">
        <a class="active" href="index.jsp">Home</a>
        <a href="RegisterForm.jsp">Register</a>        
        <a href="QueryForm.jsp">Query</a>
        <a href="LoginForm.jsp">Login</a>

    </div>
</head>

<body>

    <h1 class = "header">Welcome to our Movie Database Application</h1>


</body>


</html>
