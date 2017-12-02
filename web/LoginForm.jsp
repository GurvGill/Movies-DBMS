<%-- 
    Document   : Login
    Created on : Nov 15, 2017, 8:17:02 PM
    Author     : gurvir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type = "text/css" rel ="stylesheet" href="CSS/index.css" > 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
         <div class="topnav" id="myTopnav">
        <a class="active" href="index.jsp">Home</a>
        <!--        <a href="#news">News</a>
                <a href="#contact">Contact</a>
                <a href="#about">About</a>-->

        <a href="RegisterForm.jsp">Register</a>        
        <a href="QueryForm.jsp">Query</a>
        <a href="LoginForm.jsp">Login</a>

    </div>
    </head>
    <body>
        <h1>Log into your account</h1>
        <form name="LoginForm" action="LoggingIn.jsp">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                </tbody>
            </table><input type="submit" value="Log In" name="login" />
        </form>
    </body>
</html>
