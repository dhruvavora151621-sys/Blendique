package com.blendique;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveCustomization")
public class CustomizationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            customization c = new customization();

            c.setRoastCode(request.getParameter("roast"));
            c.setSizeCode(request.getParameter("size"));
            c.setTemperatureCode(request.getParameter("temperature"));
            c.setIceCode(request.getParameter("ice"));
            c.setMilkCode(request.getParameter("milk"));
            c.setShotsCode(request.getParameter("shots"));
            c.setAddonCode(request.getParameter("addon"));

            int id = CustomizationDAO.saveCustomization(c);

            out.print("{\"success\":true,"
                    + "\"message\":\"Customization saved successfully!\","
                    + "\"customizationId\":" + id + ","
                    + "\"totalPrice\":" + c.getTotalPrice()
                    + "}");

        } catch (Exception e) {

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

            String message = e.getMessage();

            if (message == null) {
                message = "Unable to save customization.";
            }

            message = message.replace("\\", "\\\\")
                             .replace("\"", "\\\"")
                             .replace("\n", " ");

            out.print("{\"success\":false,"
                    + "\"message\":\"" + message + "\"}");
        }

        out.flush();
    }
}

