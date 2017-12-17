<%-- 
    Document   : LoggedInUser
    Created on : Nov 16, 2017, 9:39:56 PM
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
        <title><%=user.first_name%>'s Profile</title>

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
        <form name="SettingsForm" action="SettingsForm.jsp">
        <table border="0">
            <tbody>
                <tr>
                    <td>Email:</td>
                    <td> <%=user.email%> </td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td><%=user.first_name%></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><%=user.last_name%></td>
                </tr>
            </tbody>
        </table>
        <a href="SettingsForm.jsp?email=<%=user.email%>">Edit Settings</a>
        <a href="ConfirmDelete.jsp?email=<%=user.email%>">Delete my Account</a>
        </form>
    </body>
    </center>
</html>
