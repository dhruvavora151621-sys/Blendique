/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blendique;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ExceptionHandling {
    public static void main(String[] args) {
        try {
            Connection con = DBConnection.getConnection();
            // Intentionally using an incorrect table name
            String sql = "SELECT * FROM wrong_table";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeQuery();
            System.out.println("Query executed successfully!");
            con.close();
        } 
        catch (SQLException e) {
            System.out.println("Database error handled successfully!");
            System.out.println("Error: " + e.getMessage());
        }
    }
}
