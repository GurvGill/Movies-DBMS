<%-- 
    Document   : results
    Created on : Nov 2, 2017, 12:13:54 AM
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
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
    <div class="topnav" id="myTopnav">
        <a href="index.jsp?email=<%=user.email%>">Home</a>       
        <a href="LoggedInUser.jsp?email=<%=user.email%>">Profile</a>
        <a class="active" href="QueryForm.jsp?email=<%=user.email%>">Search</a>
        <a href="LogOut.jsp">Log out</a>
    </div>
</head>
<center>
<body>
    <br>
    <h1>Results</h1>
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
            <tr>
                <td>Save or Review: </td>
                <td> 
                <button/> <a class = "button" href="Save.jsp?movie_id=<%=rs.getInt("id")%>&email=<%=user.email%>"/>Save</a></button> 
                <button/> <a class = "button" href="AddReview.jsp?movie_id=<%=rs.getInt("id")%>&email=<%=user.email%>"/>Add Review</a></button> </td>
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
            out.println(rs.getString(column_name));
    %>
    <br>
    <%
            }
        }
    } else if(table_name.equals("Movies")){ 
    ResultSet rs = statement.executeQuery("select * from " + table_name + " where title like '%" + column_name + "%' or year like '%" + column_name + "%' or rating like '%" + column_name + "%'or genre like '%" + column_name + "%'or length like '%" + column_name + "%'");
    while(rs.next()){    
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
    
    }else{
        ResultSet rs = null;
        if(table_name.equals("Theaters") || table_name.equals("Genres"))
        {
            rs = statement.executeQuery("select * from " + table_name + " where name like '%" + column_name + "%'");
        }
        else if(!table_name.equals("Theaters") || !table_name.equals("Genres")){
            rs = statement.executeQuery("select * from " + table_name + " where first_name like '%" + column_name + "%' or last_name like '%" + column_name + "%'");
        }
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
</center>
</html>
