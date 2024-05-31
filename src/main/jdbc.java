/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
//Libraries = mysql-connector-j-8.4.0.jar
package main;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;

/**
 *
 * @author turik
 */
public class jdbc {
  
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Dompetku";
    private static final String USER = "root1";
    private static final String PASS = "root1234";
    
    public static Connection connect;
    //private static Statement statement;
    //private static ResultSet resultData;
    
    public static void connection(){
        
        try{
            Class.forName(JDBC_DRIVER);
            connect = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("koneksi berhasil");
            
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
