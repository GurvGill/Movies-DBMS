<%-- 
    Document   : Write
    Created on : Dec 16, 2017, 11:29:01 PM
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
            User user = User.getUser(request.getParameter("email"));
            try{
                String review = request.getParameter("review");
                String movie_id = request.getParameter("movie_id");
                String title = null, year = null, trailer_url = null, rating = null, genre = null, length = null;
                
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
                PreparedStatement insertReview = con.prepareStatement("INSERT INTO Reviews (Review, Movie_id)" 
                        + " VALUES (?,?)");
                insertReview.setString(1,review);
                insertReview.setString(2,movie_id);
                insertReview.executeUpdate();
                
                String review_id = null;
                Statement statement2 = con.createStatement();
                ResultSet rs2 = statement2.executeQuery("select * from Reviews where review = '" + review + "'"); 
                while (rs2.next()) {
                    review_id = ""+rs2.getInt("Review_id");
                }
                
                
                PreparedStatement insertReviewandAccount = con.prepareStatement("INSERT INTO Accounts_has_Reviews "
                        + "(Accounts_id, Review_id)"
                        + " VALUES (?,?)");
                insertReviewandAccount.setString(1,""+user.id);
                insertReviewandAccount.setString(2,review_id);
                insertReviewandAccount.executeUpdate();

                PreparedStatement insertReviewandMovie = con.prepareStatement("INSERT INTO MovieReviews "
                        + "(Movies_id, Review_id)" 
                        + " VALUES (?,?)");
                insertReviewandMovie.setString(1,movie_id);
                insertReviewandMovie.setString(2,review_id);
                insertReviewandMovie.executeUpdate();
                
              %>
    
    <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
        <a href="QueryForm.jsp?email=<%=user.email%>">Search</a>
        <a href="LogOut.jsp">Log out</a>
    </div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie DBMS</title>
    </head>
    <center>
    <body>
        <h1>Review <%=title%></h1>
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
                <td><%=review%></td>
            </tr>
        </tbody>
    </table>
    </body>
    </center>
    <%
    }catch(SQLException e)
            {
                e.printStackTrace();
            }
    %> 
</html>
