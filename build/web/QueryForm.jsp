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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Page</title>
    </head>
    <body>
        <h1> Query database </h1>
        <form name="QueryForm" action="Query.jsp">
            <table>
                <tbody>
                    <tr>
                        <td>Column Name: </td>
                        <td><input type="text" name="column_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Table Name: </td>
                        <td><input type="text" name="table_name" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Reset" name="reset" />
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
