package com.blendique.servlet;

import com.blendique.model.CafeLocation;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/about-us")
public class AboutUsServlet extends HttpServlet {

    private static final String URL =
        "jdbc:mysql://localhost:3306/blendique";

    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<CafeLocation> cafes = new ArrayList<>();

        String sql = "SELECT * FROM cafe_locations WHERE is_active = TRUE";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection(
                    URL, USER, PASSWORD);
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    CafeLocation cafe = new CafeLocation(
                        rs.getInt("id"),
                        rs.getString("cafe_name"),
                        rs.getString("area"),
                        rs.getString("address"),
                        rs.getString("opening_hours"),
                        rs.getString("phone"),
                        rs.getString("map_url")
                    );

                    cafes.add(cafe);
                }
            }

            request.setAttribute("cafes", cafes);

        } catch (Exception e) {
            throw new ServletException(
                "Unable to load cafe locations", e);
        }

        request.getRequestDispatcher(
            "/about-us/about.jsp"
        ).forward(request, response);
    }
}

