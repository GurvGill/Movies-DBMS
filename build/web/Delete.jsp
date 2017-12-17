<%-- 
    Document   : Delete
    Created on : Dec 16, 2017, 10:08:38 AM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page import="moviesapp.Accounts"%>
<%@page import="moviesapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type = "text/css" rel ="stylesheet" href="CSS/index1.css" > 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies DBMS</title>
        <%
            User user = User.getUser(request.getParameter("email"));
        %>
    
    <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
        <a href="QueryForm.jsp?email=<%=user.email%>">Search</a>
        <a href="LogOut.jsp">Log out</a>
    </div>
</head>
<center>
<body>
    <h1>Account deleted.</h1>
        <%
        moviesdatabase db = new moviesdatabase();
        Connection con = db.getConnection();
        Statement statement = con.createStatement();
        statement.executeUpdate("Delete from Accounts where email = '" + user.email + "'");
        %>
        <p> Your account has successfully been deleted. Thank you</p>
    </body>
</center>
</html>
