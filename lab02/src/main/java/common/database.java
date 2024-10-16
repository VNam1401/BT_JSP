/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package common;

import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nguyenvannam
 */
public class database {

    private static String DB_URL = "jdbc:mysql://localhost:3306/QLTS";
    private static String USER_NAME = "sa";
    private static String PASSWORD = "sa";

    public static Connection GetConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            System.out.println("connect successfully!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Loi");
            e.printStackTrace();
        }
        return DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
    }
}
