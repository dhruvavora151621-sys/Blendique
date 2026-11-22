/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blendique;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {

    private String type;
    private int productId;
    private String name;
    private String description;
    private BigDecimal price;
    private int quantity;
    private String imageUrl;

    public CartItem(String type, int productId, String name,
                    String description, BigDecimal price,
                    int quantity, String imageUrl) {

        this.type = type;
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }

    public String getType() { return type; }
    public int getProductId() { return productId; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public BigDecimal getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getImageUrl() { return imageUrl; }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isBeverage() {
        return type.equalsIgnoreCase("beverage");
    }

    public String getKey() {
        return type + "-" + productId;
    }

    public static String escape(String s) {
        if (s == null) return "";

        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}
