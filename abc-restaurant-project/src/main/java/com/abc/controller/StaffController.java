package com.abc.controller;

import com.abc.service.StaffService;
import com.abc.model.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/staff")
public class StaffController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffService staffService;

    @Override
    public void init() throws ServletException {
        staffService = new StaffService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "login";

        switch (action) {
            case "register":
                showRegisterForm(request, response);
                break;
            case "login":
                showLoginForm(response);
                break;
            case "list":
                listStaff(request, response);
                break;
            case "delete":
                deleteStaff(request, response);
                break;
            default:
                showLoginForm(response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "login";

        switch (action) {
            case "register":
                registerStaff(request, response);
                break;
            case "login":
                loginStaff(request, response);
                break;
            default:
                loginStaff(request, response);
                break;
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/registerStaff.jsp").forward(request, response);
    }

    private void registerStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Staff staff = new Staff();
        staff.setName(request.getParameter("name"));
        staff.setEmail(request.getParameter("email"));
        staff.setPhoneNumber(request.getParameter("phoneNumber"));
        staff.setPassword(request.getParameter("password"));
        staff.setRole(request.getParameter("role"));

        staffService.registerStaff(staff);
        response.sendRedirect("staff?action=login");
    }

    private void showLoginForm(HttpServletResponse response) throws IOException {
        response.sendRedirect("loginStaff.jsp"); // Redirect to the publicly accessible JSP
    }

    private void loginStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff staff = staffService.loginStaff(email, password);
        if (staff != null) {
            request.getSession().setAttribute("staff", staff);
            response.sendRedirect("staffDashboard.jsp"); // Redirect to staff dashboard after successful login
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("loginStaff.jsp").forward(request, response);
        }
    }

    private void listStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Staff> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("WEB-INF/view/listStaff.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve staff list.");
        }
    }

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int staffId = Integer.parseInt(request.getParameter("id"));
        staffService.deleteStaff(staffId);
        response.sendRedirect("staff?action=list");
    }
}
