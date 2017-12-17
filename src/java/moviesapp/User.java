/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moviesapp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author gurvir
 */
public class User {
    public int id;
    public String email;
    public String password;
    public String first_name;
    public String last_name;
    
    public User()
    {
        //does nothing
    }
    public User(String in_email)
    {
        try{
            moviesdatabase db = new moviesdatabase();
            Connection con = db.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from Accounts where email = '" + in_email + "'");
            while(rs.next())
            {
                if(rs.getString("email").equals(in_email))
                {
                    email = rs.getString("email");
                    password = rs.getString("password");
                    first_name = rs.getString("first_name");
                    last_name = rs.getString("last_name");
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public static User getUser(String in_email)
    {
        User user = new User();
        try{
            moviesdatabase db = new moviesdatabase();
            Connection con = db.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from Accounts where email = '" + in_email + "'");
            while(rs.next())
            {
                if(rs.getString("email").equals(in_email))
                {
                    user.id = rs.getInt("id");
                    user.email = rs.getString("email");
                    user.password = rs.getString("password");
                    user.first_name = rs.getString("first_name");
                    user.last_name = rs.getString("last_name");
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return user;
    }
}
