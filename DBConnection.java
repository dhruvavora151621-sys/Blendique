/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blendique;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/blendique",
                    "root",
                    ""
            );

            System.out.println("Database connected successfully!");

        } catch (Exception e) {
            System.out.println("Database connection failed!");
            System.out.println(e.getMessage());
        }

        return con;
    }
}
