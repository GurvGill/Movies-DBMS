<%-- 
    Document   : AddReview
    Created on : Dec 16, 2017, 1:11:24 PM
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
        
        <%
            User user = new User(request.getParameter("email"));
            String movie_id = request.getParameter("movie_id");
            String title = null, year = null, trailer_url = null, rating = null, genre = null, length = null;
            
            try{
                moviesdatabase db = new moviesdatabase();
                Connection con = db.getConnection();
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("select * from movies where id = '" + movie_id + "'");    
                    while (rs.next()) {
                        title = rs.getString("title");
                        year = rs.getString("year");
                        trailer_url= rs.getString("trailer_url");
                        rating = rs.getString("rating");
                        genre = rs.getString("genre");
                        length = rs.getString("length");
                    }
                    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review</title>
   <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
        <a href="QueryForm.jsp?email=<%=user.email%>">Search</a>
        <a href="LogOut.jsp">Log out</a>
    </div>
    </head>
    <center>
    <body>
        <h1>Review <%=title%></h1>
        <form name="write" action="Write.jsp">
        <table border="1">
        <tbody>
            <tr>
                <td>Title: </td>
                <td><%=title%></td>
            </tr>
            <tr>
                <td>Year of Release: </td>
                <td><%=year%></td>
            </tr>
            <tr>
                <td>Trailer URL: </td>
                <td><a href=<%=trailer_url%>><%=trailer_url%></a></td>
            </tr>
            <tr>
                <td>Rating: </td>
                <td><%=rating%></td>
            </tr>
            <tr>
                <td>Genre: </td>
                <td><%=genre%></td>
            </tr>
            <tr>
                <td> Length: </td>
                <td><%=length%></td>
            </tr>
            <tr>
                <td> Review: </td>
                <td>
                    <input type="text" name="review" value=""/> <br>
                    <input type="hidden" name="email" value="<%=user.email%>"/>
                    <input type="hidden" name="movie_id" value="<%=movie_id%>"/>
                    <input type="submit" value="Submit" name="submit" />
            </tr>
        </tbody>
    </table>
    </form>
    <%
        }catch(SQLException e)
            {
                e.printStackTrace();
            }
    %>
    </body>
    </center>
</html>
