/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blendique;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/cart/cart.jsp?error=1"
            );
            return;
        }

        ArrayList<CartItem> cart =
            (ArrayList<CartItem>) session.getAttribute("blendiqueCart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/cart/cart.jsp?error=1"
            );
            return;
        }

        BigDecimal subtotal = BigDecimal.ZERO;

        for (CartItem item : cart) {
            subtotal = subtotal.add(
                item.getPrice().multiply(
                    BigDecimal.valueOf(item.getQuantity())
                )
            );
        }

        BigDecimal packaging = new BigDecimal("15.00");

        BigDecimal tax = subtotal.add(packaging)
            .multiply(new BigDecimal("0.05"))
            .setScale(2, RoundingMode.HALF_UP);

        BigDecimal discount =
            subtotal.compareTo(new BigDecimal("300.00")) >= 0
            ? new BigDecimal("50.00")
            : BigDecimal.ZERO;

        BigDecimal total = subtotal
            .add(packaging)
            .add(tax)
            .subtract(discount);

        // Temporary user ID until Login module is connected
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            userId = 1;
        }

        Connection con = null;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // 1. Insert order
            String orderSQL =
                "INSERT INTO orders (user_id, total_amount, status) " +
                "VALUES (?, ?, 'Pending')";

            int orderId;

            try (PreparedStatement ps =
                    con.prepareStatement(
                        orderSQL,
                        Statement.RETURN_GENERATED_KEYS
                    )) {

                ps.setInt(1, userId);
                ps.setBigDecimal(2, total);

                ps.executeUpdate();

                try (ResultSet rs = ps.getGeneratedKeys()) {

                    if (!rs.next()) {
                        throw new SQLException("Order ID not generated");
                    }

                    orderId = rs.getInt(1);
                }
            }

            // 2. Insert individual cart products
            String itemSQL =
                "INSERT INTO order_items " +
                "(order_id, beverage_id, food_id, quantity, price) " +
                "VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement ps =
                    con.prepareStatement(itemSQL)) {

                for (CartItem item : cart) {

                    ps.setInt(1, orderId);

                    if (item.isBeverage()) {
                        ps.setInt(2, item.getProductId());
                        ps.setNull(3, Types.INTEGER);
                    } else {
                        ps.setNull(2, Types.INTEGER);
                        ps.setInt(3, item.getProductId());
                    }

                    ps.setInt(4, item.getQuantity());
                    ps.setBigDecimal(5, item.getPrice());

                    ps.addBatch();
                }

                ps.executeBatch();
            }

            // 3. Save everything permanently
            con.commit();

            // 4. Clear cart after successful order
            cart.clear();

            session.setAttribute("blendiqueCart", cart);

            response.sendRedirect(
                request.getContextPath()
                + "/cart/cart.jsp?orderId=" + orderId
            );

        } catch (Exception e) {

            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ignored) {}
            }

            getServletContext().log("Checkout failed", e);

            response.sendRedirect(
                request.getContextPath() + "/cart/cart.jsp?error=1"
            );

        } finally {

            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException ignored) {}
            }
        }
    }
}

