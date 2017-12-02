package moviesapp;

import java.sql.*;

public class moviesdatabase {
    public Connection getConnection() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","password");
            return con;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }  
}
