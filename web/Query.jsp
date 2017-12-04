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
        <a href="RegisterForm.jsp">Register</a>        
        <a class="active" href="QueryForm.jsp">Search</a>
        <a href="LoginForm.jsp">Login</a>
    </div>

</head>
<body>
    <%
        moviesdatabase db = new moviesdatabase();
        Connection con = db.getConnection();
        Statement statement = con.createStatement();
        String column_name = request.getParameter("column_name");
        String table_name = request.getParameter("table_name");
        ResultSet rs = statement.executeQuery("select " + column_name + " from " + table_name);
        if (column_name.equals("*")) {
            while (rs.next()) {
                out.println(rs.getString("title") + " " + rs.getString("year") + " " + rs.getString("trailer_url") + " " + rs.getString("rating") + " " + rs.getString("genre") + " " + rs.getString("length"));
    %>
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
            out.println(rs.getString(column_name));
    %>
    <br>
    <%
            }
        }
        con.close();
    %>
</body>
</html>
