<%-- 
    Document   : Login
    Created on : Nov 15, 2017, 8:17:02 PM
    Author     : gurvir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Log into your account</h1>
        <form name="LoginForm" action="LoggedInUser.jsp">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
