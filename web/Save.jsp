<%-- 
    Document   : Save
    Created on : Dec 17, 2017, 12:08:26 PM
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
            String movie_Id = request.getParameter("movie_id");
            String title = null, year = null, trailer_url = null, rating = null, genre = null, length = null;
           
            moviesdatabase db = new moviesdatabase();
            Connection con = db.getConnection();
            Statement statement1 = con.createStatement();
            ResultSet rs1 = statement1.executeQuery("select * from movies where id = '" + movie_Id + "'");    
                while (rs1.next()) {
                    title = rs1.getString("title");
                    year = rs1.getString("year");
                    trailer_url= rs1.getString("trailer_url");
                    rating = rs1.getString("rating");
                    genre = rs1.getString("genre");
                    length = rs1.getString("length");
                }
                
            PreparedStatement save = con.prepareStatement("INSERT INTO Accounts_Save_Movies (Accounts_id, Movies_id)" 
                    + " VALUES(?,?)");
            save.setString(1,""+user.id);
            save.setString(2,movie_Id);
            save.executeUpdate();
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie DBMS</title>
   <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
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
        <h1>Saved Movies</h1>
        <%
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from Movies, Accounts_Save_Movies where Movies.id = Accounts_Save_Movies.Movies_id");

            while (rs.next()) {
                String movie_id = ""+rs.getInt("id");
                Statement s = con.createStatement();
                ResultSet r = s.executeQuery("select * from Accounts, Reviews, Movies, MovieReviews, Accounts_has_Reviews where Accounts.id = Accounts_has_Reviews.Accounts_id and Accounts_has_Reviews.Review_id = Reviews.Review_id and Reviews.Review_id = MovieReviews.Review_id and Movies.id = MovieReviews.Movies_id and MovieReviews.Movies_id = '" + movie_id + "'order by Reviews.Review_id desc limit 3");
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
                        <tr>
                            <td> Most recent reviews: </td>
                            <td> </td>
                        </tr>
                            <%
                                while(r.next())
                                {
                                    %>
                                    <tr>
                                        <td><%out.println("Reviewer: "+ r.getString("first_name") + " " + r.getString("last_name"));%></td>
                                        <td><%out.println("Review: " + r.getString("Review"));%> </td>
                                    </tr>
                                    <%
                                }
                            %>
                        <tr>
                            <td>Save or Review: </td>
                            <td> 
                            <button/> <a class = "button" href="AddReview.jsp?movie_id=<%=rs.getInt("id")%>&email=<%=user.email%>"/>Add Review</a></button> </td>
                        </tr>
                    </tbody>
                </table>
                        <br>
                <%
                }%> 
    </body>
    </center>
</html>
