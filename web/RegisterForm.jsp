<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : login
    Created on : Nov 8, 2017, 1:37:50 PM
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
        <title>Register Page</title>
         <div class="topnav" id="myTopnav">
        <a class="active" href="index.jsp">Home</a>
        <!--        <a href="#news">News</a>
                <a href="#contact">Contact</a>
                <a href="#about">About</a>-->

        <a href="RegisterForm.jsp">Register</a>        
        <a href="QueryForm.jsp">Query</a>
        <a href="LoginForm.jsp">Login</a>

    </div>
        <script>
            function check()
            {
                var password = document.forms["RegisterForm"]["password"].value;
                var c_password = document.forms["RegisterForm"]["c_password"].value;
                var email = document.forms["RegisterForm"]["email"].value;
                if(password != c_password)
                {
                    alert("Passwords do not match.");
                    return false;
                }
            }
        </script>    
    </head>
    <body>
        <h1>Register for an account</h1>
        <form name="RegisterForm" action="Registering.jsp" onsubmit="return check()" method="POST">           
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email Address: </td>
                        <td><input type="email" name="email" value="" required="true"/></td>
                    </tr>
                    <tr>
                        <td>First Name: </td>
                        <td><input type="text" name="first_name" value="" required="true"/></td>
                    </tr>
                    <tr>
                        <td>Last Name: </td>
                        <td><input type="text" name="last_name" value="" required="true"/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" value="" required="true" minlength="6"/></td>
                    </tr>
                    <tr>
                        <td>Confirm Password: </td>
                        <td><input type="password" name="c_password" value="" required="true" minlength="6"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Reset" name="reset" />
            <input type="submit" value="Register" name="register" />
        </form>
    </body>
</html>