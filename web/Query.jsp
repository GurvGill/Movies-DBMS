<%-- 
    Document   : results
    Created on : Nov 2, 2017, 12:13:54 AM
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
        <title>Results Page</title>
    <div class="topnav" id="myTopnav">
        <a href="index.jsp">Home</a>       
        <a class="active" href="QueryForm.jsp">Search</a>
        <a href="LogOut.jsp">Log out</a>
    </div>

</head>
<body>
    <%
        moviesdatabase db = new moviesdatabase();
        Connection con = db.getConnection();
        Statement statement = con.createStatement();
        String column_name = request.getParameter("column_name");
        String table_name = request.getParameter("table_name");
        if (column_name.contains("all")) {
            column_name = "*";
            ResultSet rs = statement.executeQuery("select " + column_name + " from " + table_name);
            if (column_name.equals("*") && table_name.equals("Movies")) {
                while (rs.next()) {
    %>
    <table border="1">
        <tbody>
            <tr>
                <td>Title: </td>
                <td><%out.println(rs.getString("title")); %></td>
            </tr>
            <tr>
                <td>Year of Release: </td>
                <td><%out.println(rs.getString("year")); %></td>
            </tr>
            <tr>
                <td>Trailer URL: </td>
                <td><a href=<%out.println(rs.getString("trailer_url")); %>><%out.println(rs.getString("trailer_url")); %></a></td>
            </tr>
            <tr>
                <td>Rating: </td>
                <td><%out.println(rs.getString("rating")); %></td>
            </tr>
            <tr>
                <td>Genre: </td>
                <td><%out.println(rs.getString("genre")); %></td>
            </tr>
            <tr>
                <td> Length: </td>
                <td><%out.println(rs.getString("length")); %></td>
            </tr>
        </tbody>
    </table>
    <br>           
    <%
        }
    } else if (column_name.equals("*") && (table_name.equals("Directors") || table_name.equals("Actors") || table_name.equals("Producers"))) {
        while (rs.next()) {
    %>
    <table border="1">
        <tbody>
            <tr>
                <td>ID: </td>
                <td><%out.println(rs.getString("id")); %></td>
            </tr>
            <tr>
                <td>First Name: </td>
                <td><%out.println(rs.getString("first name")); %></td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><%out.println(rs.getString("last name")); %></td>
            </tr>
        </tbody>
    </table>
    <br>           
    <%
        }
    } else if (column_name.equals("*") && table_name.equals("Genres")) {
        while (rs.next()) {
    %>
    <table border="1">
        <tbody>
            <tr>
                <td>ID: </td>
                <td><%out.println(rs.getString("id")); %></td>
            </tr>
            <tr>
                <td>Genre Type: </td>
                <td><%out.println(rs.getString("name")); %></td>
            </tr>
        </tbody>
    </table>
    <br>           
    <%
        }
    } else if (column_name.contains(", ")) {
        String[] column_names = column_name.split(", ");
        while (rs.next()) {
            for (int i = 0; i < column_names.length; i++) {
                out.println(rs.getString(column_names[i]));
            }
    %>
    <br>
    <%
        }
    } else {
        while (rs.next()) {
            out.println("INSIDE THE LAST ELSE");
            out.println(rs.getString(column_name));
    %>
    <br>
    <%
            }
        }
    } else {

//        WORKS FOR DIRECTOR, ACTORS AND PRODUCERS searchers DB with the FIRST name and returns a result if found 
        ResultSet rs = statement.executeQuery("select * from " + table_name + " where first_name = '" + column_name + "'");
        while (rs.next()) {
    %>  
    <table border="1">
        <tbody>
            <tr>
                <td>id: </td>
                <td><%out.println(rs.getString("id")); %></td>
            </tr>
            <tr>
                <td>Year of Release: </td>
                <td><%out.println(rs.getString("first_name")); %></td>
            </tr>

            <tr>
                <td>Rating: </td>
                <td><%out.println(rs.getString("last_name")); %></td>
            </tr>

        </tbody>
    </table>
    <br>           
    <%
            }
        }
        con.close();
    %>
</body>
</html>
