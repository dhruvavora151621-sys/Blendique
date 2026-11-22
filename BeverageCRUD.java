package com.blendique;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BeverageCRUD {

    // =========================
    // CREATE - Add Beverage
    // =========================
    public static void addBeverage(String name, String description,
                                   String size, double price) {

        String checkSql = "SELECT * FROM beverages "
                        + "WHERE name = ? AND description = ? "
                        + "AND size = ? AND price = ?";

        String insertSql = "INSERT INTO beverages "
                         + "(name, description, size, price) "
                         + "VALUES (?, ?, ?, ?)";

        try {
            Connection con = DBConnection.getConnection();
            // Check if beverage already exists
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setString(1, name);
            checkPs.setString(2, description);
            checkPs.setString(3, size);
            checkPs.setDouble(4, price);
            ResultSet rs = checkPs.executeQuery();
            if (rs.next()) {
                System.out.println("Beverage already exists!");
            } 
            else {
                // Add new beverage
                PreparedStatement ps = con.prepareStatement(insertSql);
                ps.setString(1, name);
                ps.setString(2, description);
                ps.setString(3, size);
                ps.setDouble(4, price);
                int rows = ps.executeUpdate();
                if (rows > 0) {
                    System.out.println("Beverage added successfully!");
                }
                ps.close();
            }
            rs.close();
            checkPs.close();
            con.close();
        } 
        catch (SQLException e) {
            System.out.println("Error while adding beverage: "
                    + e.getMessage());
        }
    }
    // =========================
    // READ - Display Beverages
    // =========================
    public static void showBeverages() {
        String sql = "SELECT * FROM beverages";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            System.out.println("\n========== BEVERAGE LIST ==========");
            while (rs.next()) {
                System.out.println(
                    "ID: " + rs.getInt("beverage_id")
                    + " | Name: " + rs.getString("name")
                    + " | Description: " + rs.getString("description")
                    + " | Size: " + rs.getString("size")
                    + " | Price: ₹" + rs.getDouble("price")
                );
            }
            System.out.println("===================================");
            rs.close();
            ps.close();
            con.close();
        } 
        catch (SQLException e) {
            System.out.println("Error while displaying beverages: "
                    + e.getMessage());
        }
    }

    // =========================
    // UPDATE - Update Beverage
    // =========================
    public static void updateBeverage(int id, String name,
                                      String description,
                                      String size, double price) {

        String sql = "UPDATE beverages "
                   + "SET name = ?, description = ?, size = ?, price = ? "
                   + "WHERE beverage_id = ?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, size);
            ps.setDouble(4, price);
            ps.setInt(5, id);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Beverage updated successfully!");
            } else {
                System.out.println("Beverage not found!");
            }
            ps.close();
            con.close();
        } 
        catch (SQLException e) {
            System.out.println("Error while updating beverage: "
                    + e.getMessage());
        }
    }
    // =========================
    // DELETE - Delete Beverage
    // =========================
    public static void deleteBeverage(int id) {
        String sql = "DELETE FROM beverages WHERE beverage_id = ?";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Beverage deleted successfully!");
            } else {
                System.out.println("Beverage not found!");
            }
            ps.close();
            con.close();
        }
        catch (SQLException e) {
            System.out.println("Error while deleting beverage: "
                    + e.getMessage());
        }
    }
}
