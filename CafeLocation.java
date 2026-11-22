package com.blendique.model;
public class CafeLocation {

    private int id;
    private String cafeName;
    private String area;
    private String address;
    private String openingHours;
    private String phone;
    private String mapUrl;

    public CafeLocation(int id, String cafeName, String area,
            String address, String openingHours,
            String phone, String mapUrl) {

        this.id = id;
        this.cafeName = cafeName;
        this.area = area;
        this.address = address;
        this.openingHours = openingHours;
        this.phone = phone;
        this.mapUrl = mapUrl;
        }

    public int getId() {
        return id;
    }

    public String getCafeName() {
        return cafeName;
    }

    public String getArea() {
        return area;
    }

    public String getAddress() {
        return address;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public String getPhone() {
        return phone;
    }

    public String getMapUrl() {
        return mapUrl;
    }
}

