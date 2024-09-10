package com.abc.controller;

import com.abc.dao.*;
import com.abc.model.*;
import com.abc.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private CustomerDAO customerDAO;
    private StaffDAO staffDAO;
    private ReservationDAO reservationDAO;
    private QueryDAO queryDAO;
    private ServiceDAO serviceDAO;
    private OfferDAO offerDAO;
    private GalleryDAO galleryDAO;
    private AdminService adminService;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        customerDAO = new CustomerDAO();
        staffDAO = new StaffDAO();
        reservationDAO = new ReservationDAO();
        queryDAO = new QueryDAO();
        serviceDAO = new ServiceDAO();
        offerDAO = new OfferDAO();
        galleryDAO = new GalleryDAO();
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) action = "dashboard";

        switch (action) {
            case "listProducts":
                showList(request, response, productDAO.getAllProducts(), "products", "WEB-INF/view/listProducts.jsp");
                break;
            case "listCustomers":
                showList(request, response, customerDAO.getAllCustomers(), "customers", "WEB-INF/view/listCustomers.jsp");
                break;
            case "listStaff":
                showList(request, response, staffDAO.getAllStaff(), "staffList", "WEB-INF/view/listStaff.jsp");
                break;
            case "listReservations":
                showList(request, response, reservationDAO.getAllReservations(), "reservations", "WEB-INF/view/listReservations.jsp");
                break;
            case "listQueries":
                showList(request, response, queryDAO.getAllQueries(), "queries", "WEB-INF/view/listQueries.jsp");
                break;
            
            case "listServices":
                showList(request, response, serviceDAO.getAllServices(), "services", "WEB-INF/view/listServices.jsp");
                break;
            case "listOffers":
                showList(request, response, offerDAO.getAllOffers(), "offers", "WEB-INF/view/listOffers.jsp");
                break;
            case "listGalleries":
                showList(request, response, galleryDAO.getAllGalleries(), "galleries", "WEB-INF/view/listGalleries.jsp");
                break;
            case "login":
                loginAdmin(request, response);
                break;
            case "logout":
                logoutAdmin(request, response);
                break;
            default:
                response.sendRedirect("adminDashboard.jsp");
                break;
        }
    }

    private <T> void showList(HttpServletRequest request, HttpServletResponse response, List<T> items, String attributeName, String view) throws ServletException, IOException {
        request.setAttribute(attributeName, items);
        request.getRequestDispatcher(view).forward(request, response);
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminService.loginAdmin(username, password);

        if (admin != null) {
            request.getSession().setAttribute("admin", admin);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }

    private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("adminLogin.jsp");
    }
}
