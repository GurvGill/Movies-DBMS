<%-- 
    Document   : Signup
    Created on : Nov 8, 2017, 2:44:45 PM
    Author     : gurvir
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="moviesapp.moviesdatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Page</title>
    </head>
    <body>
        <h1> </h1>
        <%!
            public class Accounts{
                
                PreparedStatement insertAccounts = null;
                public Accounts()
                {
                    try{
                     moviesdatabase db = new moviesdatabase();
                     Connection con = db.getConnection();
                     Statement statement = con.createStatement();
                     insertAccounts = con.prepareStatement("INSERT INTO Accounts (email, first_name, last_name, password, time)" + " VALUES (?, ?, ?, ?, ?)");
                    }catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }  
                
                public int setAccount(String email, String first, String last, String password, Timestamp time)
                {
                    int result = 0;
                    try{
                        insertAccounts.setString(1,email);
                        insertAccounts.setString(2,first);
                        insertAccounts.setString(3,last);
                        insertAccounts.setString(4, password);
                        insertAccounts.setTimestamp(5, time);
                        result = insertAccounts.executeUpdate();
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                    return result;
                }   
                
            }
            
            public int UniqueEmail(String email)
            {
                int result = 0;
                try{
                    moviesdatabase db = new moviesdatabase();
                    Connection con = db.getConnection();
                    Statement statement = con.createStatement();
                    ResultSet rs = statement.executeQuery("select email from Accounts where email = '" + email + "'");
                    if(rs.next())
                    {
                        result = 1;
                    }
                }catch(SQLException e){
                    e.printStackTrace();
                }
                return result;
            }
        %>
        <%
            int result = 0;
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Date date = new Date();
            Timestamp time = new Timestamp(date.getTime());
            if(UniqueEmail(email) == 0)
            {  
                Accounts accounts = new Accounts();
                result = accounts.setAccount(email, first_name, last_name, password, time);
                
                if(result != 0)
                {
                    %>
                    <script>
                        alert("Registration was successful.");
                    </script>
                    <jsp:include page="LoggedInUser.jsp"/>
                   <%      
                }else if(result == 0){
                    %>
                    <script>
                        alert("Unable to register.");
                    </script>
                    <jsp:include page="RegisterForm.jsp"/>
                    <%
                } 
            }else{
                %>
                <script>
                    alert("Email is already taken. Please re-enter information.");
                </script>
                <jsp:include page="RegisterForm.jsp"/>
                <%
            }          
        %>
    </body>
</html>