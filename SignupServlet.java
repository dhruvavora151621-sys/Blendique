package com.blendique;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("fullName");
        String identity = request.getParameter("identity");
        String password = request.getParameter("password");

        if (name == null || identity == null || password == null ||
            name.trim().isEmpty() ||
            identity.trim().isEmpty() ||
            password.isEmpty()) {

            response.sendRedirect("login.html?error=empty");
            return;
        }

        name = name.trim();
        identity = identity.trim();

        String email = null;
        String phone = null;

        if (identity.contains("@")) {
            email = identity;
        } else {
            phone = identity;
        }

        String sql = "INSERT INTO users "
                + "(full_name, email, phone, password) "
                + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                response.sendRedirect("login.html?error=db");
                return;
            }

            try (PreparedStatement ps =
                    con.prepareStatement(sql)) {

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, password);

                ps.executeUpdate();
            }

            response.sendRedirect(
    request.getContextPath() + "/HomePage/home.html"
);
        } catch (java.sql.SQLIntegrityConstraintViolationException e) {

            response.sendRedirect("login.html?error=exists");

        } catch (Exception e) {

            e.printStackTrace();
            response.sendRedirect("login.html?error=db");
        }
    }
}


