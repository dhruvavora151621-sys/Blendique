package com.blendique;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;

public class CustomizationDAO {

    // Fetch the price of an option from MySQL
    private static BigDecimal getOptionPrice(
            Connection con, String category, String code)
            throws SQLException {

        String sql = "SELECT price FROM customizer_options "
                   + "WHERE category = ? AND option_code = ? "
                   + "AND is_active = 1";

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, category);
            ps.setString(2, code);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getBigDecimal("price");
                } else {
                    throw new SQLException(
                        "Invalid " + category + " option: " + code
                    );
                }
            }
        }
    }

    // Save custom coffee customization
    public static int saveCustomization(customization c)
            throws SQLException {

        Connection con = DBConnection.getConnection();

        if (con == null) {
            throw new SQLException("Could not connect to database.");
        }

        try (Connection connection = con) {

            // Validate required selections
            if (c.getRoastCode() == null ||
                c.getSizeCode() == null ||
                c.getTemperatureCode() == null ||
                c.getMilkCode() == null ||
                c.getShotsCode() == null) {

                throw new SQLException("Please select all required options.");
            }

            // Calculate prices using database values
            BigDecimal total = BigDecimal.ZERO;

            total = total.add(
                getOptionPrice(connection, "roast", c.getRoastCode())
            );

            total = total.add(
                getOptionPrice(connection, "size", c.getSizeCode())
            );

            total = total.add(
                getOptionPrice(connection, "temperature",
                               c.getTemperatureCode())
            );

            total = total.add(
                getOptionPrice(connection, "milk", c.getMilkCode())
            );

            total = total.add(
                getOptionPrice(connection, "shots", c.getShotsCode())
            );

            // Ice is required only for iced coffee
            if ("iced".equalsIgnoreCase(c.getTemperatureCode())) {

                if (c.getIceCode() == null ||
                    c.getIceCode().trim().isEmpty()) {

                    throw new SQLException(
                        "Please select an ice level for iced coffee."
                    );
                }

                getOptionPrice(connection, "ice", c.getIceCode());

            } else {
                c.setIceCode(null);
            }

            // Add-on is optional
            if (c.getAddonCode() != null &&
                !c.getAddonCode().trim().isEmpty()) {

                total = total.add(
                    getOptionPrice(connection, "addon", c.getAddonCode())
                );

            } else {
                c.setAddonCode(null);
            }

            c.setTotalPrice(total.doubleValue());

            // Insert into custom_drink_customizations
            String sql = "INSERT INTO custom_drink_customizations "
                       + "(roast_code, size_code, temperature_code, "
                       + "ice_code, milk_code, shots_code, addon_code, "
                       + "total_price) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(
                    sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

                ps.setString(1, c.getRoastCode());
                ps.setString(2, c.getSizeCode());
                ps.setString(3, c.getTemperatureCode());
                ps.setString(4, c.getIceCode());
                ps.setString(5, c.getMilkCode());
                ps.setString(6, c.getShotsCode());
                ps.setString(7, c.getAddonCode());
                ps.setBigDecimal(8, total);

                int rows = ps.executeUpdate();

                if (rows == 0) {
                    throw new SQLException(
                        "Could not save your coffee customization."
                    );
                }

                try (ResultSet keys = ps.getGeneratedKeys()) {

                    if (keys.next()) {
                        return keys.getInt(1);
                    } else {
                        throw new SQLException(
                            "Customization saved but ID was not returned."
                        );
                    }
                }
            }
        }
    }
}
