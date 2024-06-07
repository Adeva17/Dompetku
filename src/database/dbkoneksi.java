/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author turik
 */
public class dbkoneksi {
    Connection connect;
    public dbkoneksi(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/dompetku","root","");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
public Connection getConnection(){
        return connect;
    }
}
