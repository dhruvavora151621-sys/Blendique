/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blendique;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    private ArrayList<CartItem> getCart(HttpSession session) {

        ArrayList<CartItem> cart =
            (ArrayList<CartItem>) session.getAttribute("blendiqueCart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("blendiqueCart", cart);
        }

        return cart;
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<CartItem> cart = getCart(session);

        // Temporary demo products from your database
        if (session.getAttribute("demoLoaded") == null
                && cart.isEmpty()) {

            try {
                addProduct(cart, "beverage", 1, 1);
                addProduct(cart, "beverage", 2, 1);
                addProduct(cart, "food", 3, 1);

                session.setAttribute("demoLoaded", true);

            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }

        response.sendRedirect(
            request.getContextPath() + "/cart/cart.jsp"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        ArrayList<CartItem> cart =
            getCart(request.getSession());

        String action = request.getParameter("action");
        String key = request.getParameter("key");

        if ("increase".equals(action)
                || "decrease".equals(action)
                || "remove".equals(action)) {

            CartItem item = findItem(cart, key);

            if (item != null) {

                if ("increase".equals(action)) {
                    item.setQuantity(item.getQuantity() + 1);
                }

                else if ("decrease".equals(action)) {
                    item.setQuantity(item.getQuantity() - 1);

                    if (item.getQuantity() <= 0) {
                        cart.remove(item);
                    }
                }

                else if ("remove".equals(action)) {
                    cart.remove(item);
                }
            }
        }

        else if ("add".equals(action)) {

            try {
                String type = request.getParameter("productType");
                int id = Integer.parseInt(
                    request.getParameter("productId")
                );

                int quantity = Integer.parseInt(
                    request.getParameter("quantity")
                );

                addProduct(cart, type, id, Math.max(1, quantity));

            } catch (Exception e) {
                throw new ServletException(e);
            }
        }

        response.sendRedirect(
            request.getContextPath() + "/cart/cart.jsp"
        );
    }

    private CartItem findItem(ArrayList<CartItem> cart,
                              String key) {

        for (CartItem item : cart) {
            if (item.getKey().equals(key)) {
                return item;
            }
        }

        return null;
    }

    private void addProduct(ArrayList<CartItem> cart,
                            String type,
                            int id,
                            int quantity) throws SQLException {

        boolean beverage = type.equalsIgnoreCase("beverage");

        String sql;

        if (beverage) {
            sql = "SELECT name, description, price FROM beverages WHERE beverage_id=?";
        } else if (type.equalsIgnoreCase("food")) {
            sql = "SELECT name, description, price FROM food_items WHERE food_id=?";
        } else {
            throw new SQLException("Invalid product type");
        }

        // Use your existing DBConnection class
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (!rs.next()) {
                    throw new SQLException("Product not found");
                }

                String key = type.toLowerCase() + "-" + id;

                for (CartItem existing : cart) {
                    if (existing.getKey().equals(key)) {
                        existing.setQuantity(
                            existing.getQuantity() + quantity
                        );
                        return;
                    }
                }

                String image = beverage
                    ? "https://images.unsplash.com/photo-1509042239860-f550ce710b93"
                    : "https://images.unsplash.com/photo-1509440159596-0249088772ff";

                CartItem item = new CartItem(
                    type.toLowerCase(),
                    id,
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getBigDecimal("price"),
                    quantity,
                    image
                );

                cart.add(item);
            }
        }
    }
}

