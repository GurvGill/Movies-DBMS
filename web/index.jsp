<%-- 
    Document   : index.jsp
    Created on : Nov 8, 2017, 2:28:32 PM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page import="moviesapp.Accounts"%>
<%@page import="moviesapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<link type= "text/css" rel ="stylesheet" href="CSS/index1.css" > 
<html>
    <head>
        <%
            User user = User.getUser(request.getParameter("email"));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie DBMS</title>
        
        <%-- nav bar in index page --%>
    <div class="topnav" id="myTopnav">
        <% if(user.email != null){
            %>
            <a class="active" href="index.jsp?email=<%=user.email%>">Home</a>
            <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
            <a href="QueryForm.jsp?email=<%=user.email%>">Search</a>
            <a href="LogOut.jsp">Log out</a>  
            <%
        }else if(user.email == null){
        %>
            <a class="active" href="index.jsp">Home</a>
            <a href="RegisterForm.jsp">Register</a>
            <a href="LoginForm.jsp">Login</a>
        <%}%>
        

    </div>
</head>
<center>
<body>
    <br>
    <br>
    <h1 class = "header">Welcome to our Movie Database Application</h1>
    <br>
    <p> Many individuals, after a long day at work or on days off, enjoy staying indoors and watching movies.</p>
    <p> This is the time individuals do not want to spend lots or energy or effort; however, a search engine is not the best way to search for movies. </p>
    <p> Browsing movies star actor’s name through a search engine doesn’t display all details about a movie, but instead lists all details about the actor including his daily life. </p>
        The solution to this problem is a database application that consists only of details of movies.
    <br>
    <h2> Top 10 Popular Movies </h2>
    <%
        moviesdatabase db = new moviesdatabase();
        Connection con = db.getConnection();
        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("select * from Movies order by rating desc limit 10");
            
        while (rs.next()) {    
        if(user.email == null)
        {
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
                <td>Save or Review: </td>
                <td> To view reviews and save or review Register for an account or log in to your account
                    <br>
                <button/> <a class = "button" href="RegisterForm.jsp"/>Register</a></button> 
                <button/> <a class = "button" href="LoginForm.jsp"/>Log in</a></button> 
            </tr>
        </tbody>
    </table>
            <br>
    <%}
    if(user.email != null){
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
                <button/> <a class = "button" href="Save.jsp?movie_id=<%=rs.getInt("id")%>&email=<%=user.email%>"/>Save</a></button> 
                <button/> <a class = "button" href="AddReview.jsp?movie_id=<%=rs.getInt("id")%>&email=<%=user.email%>"/>Add Review</a></button> </td>
            </tr>
        </tbody>
    </table>
            <br>
    <%}
    }%> 
</body>
</center>
</html>
