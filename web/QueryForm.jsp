<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 1, 2017, 11:38:05 PM
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
        <title>Query Page</title>
    <div class="topnav" id="myTopnav">
        <a href="index.jsp">Home</a>  
        <a href="RegisterForm.jsp">Register</a>        
        <a class="active" href="QueryForm.jsp">Search</a>
        <a href="LoginForm.jsp">Login</a>

    </div>
</head>
<body>
    <h1> Search database </h1>
    <form name="QueryForm" action="Query.jsp">
        <table>
            <tbody>
                <tr>
                    <td>Enter keyword: </td>
                    <td><input type="text" name="column_name" value="" /></td>
                </tr>
                <tr>
                    <td>Select category: </td>
                    <td>
                    <select name="table_name">
                        <option>Actors</option>
                        <option>Directors</option>
                        <option>Genres</option>
                        <option>Movies</option>
                        <option>Producers</option>               
                        <option>Theaters</option>
                    </select>
                    </td>
            </tr>
            </tbody>
        </table>
        <input type="reset" value="Reset" name="reset" />
        <input type="submit" value="Submit" name="submit" />
    </form>
</body>
</html>
