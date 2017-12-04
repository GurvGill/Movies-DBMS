package moviesapp;

import java.sql.*;

public class moviesdatabase {
    public Connection getConnection() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
<<<<<<< HEAD
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies","root","password");
=======
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","password");
>>>>>>> 9b53cff6cca1ccd55d05acfb0c6b8c1dec19240e
            return con;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }  
}
