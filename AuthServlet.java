package com.blendique;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String identity = request.getParameter("identity");
        String password = request.getParameter("password");

        if (identity == null || password == null ||
                identity.trim().isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.html?error=empty");
            return;
        }

        identity = identity.trim();

        if ("signup".equals(action)) {
            signup(request, response, identity, password);
        } else {
            login(request, response, identity, password);
        }
    }

    // LOGIN
    private void login(HttpServletRequest request,
            HttpServletResponse response,
            String identity, String password)
            throws IOException {

        String sql = "SELECT * FROM users WHERE email=? OR phone=?";

        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                response.sendRedirect("login.html?error=db");
                return;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, identity);
            ps.setString(2, identity);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String dbPassword = rs.getString("password");

                if (password.equals(dbPassword)) {

                    HttpSession oldSession = request.getSession(false);

                    if (oldSession != null) {
                        oldSession.invalidate();
                    }

                    HttpSession session = request.getSession(true);

                    session.setAttribute("userId",
                            rs.getInt("user_id"));

                    session.setAttribute("userName",
                            rs.getString("full_name"));

                   response.sendRedirect(
    request.getContextPath() + "/HomePage/home.html"
);

                } else {
                    response.sendRedirect("login.html?error=invalid");
                }

            } else {
                response.sendRedirect("login.html?error=invalid");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.html?error=db");
        }
    }

    // SIGNUP
    private void signup(HttpServletRequest request,
            HttpServletResponse response,
            String identity, String password)
            throws IOException {

        String name = request.getParameter("fullName");

        if (name == null || name.trim().isEmpty()) {
            response.sendRedirect("login.html?error=name");
            return;
        }

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

        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                response.sendRedirect("login.html?error=db");
                return;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name.trim());
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("login.html?registered=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.html?error=exists");
        }
    }
}
