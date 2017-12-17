<%-- 
    Document   : Settings
    Created on : Dec 15, 2017, 8:32:23 PM
    Author     : gurvir
--%>

<%@page import="moviesapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type = "text/css" rel ="stylesheet" href="CSS/index1.css" > 

<html>
    <head>
        <%
            User user = new User(request.getParameter("email"));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.first_name%>'s Settings</title>     

         <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a class="active" href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
        <a href="QueryForm.jsp?email=<%=user.email%>">Search</a>
        <a href="LogOut.jsp">Log out</a>   
    </div>
    </head>
    <center>
     <body>
        <h1> Welcome, <%=user.first_name + " " + user.last_name %> </h1>
    <form name="SettingsForm" action="Settings.jsp">
        <table border="0">
            <tbody>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="column_name" value="<%=user.email%>"</td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="column_name" value="<%=user.first_name%>"</td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="column_name" value="<%=user.last_name%>"</td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="column_name" value="<%=user.password%>"</td>
                </tr>
            </tbody>
        </table>
        <input type="reset" value="Reset" name="reset" />
        <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
    </center>
</html>
