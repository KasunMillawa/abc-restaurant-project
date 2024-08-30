package com.abc.controller;

import com.abc.service.CustomerService;
import com.abc.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private transient CustomerService customerService;

    @Override
    public void init() throws ServletException {
        this.customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "login";
        }

        switch (action) {
            case "list":
                displayCustomerList(request, response);
                break;
            case "delete":
                removeCustomer(request, response);
                break;
            case "register":
                showRegistrationPage(request, response);
                break;
            case "login":
                showLoginPage(request, response);
                break;
            case "logout":
                performLogout(request, response);
                break;
            default:
                showLoginPage(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "login";
        }

        switch (action) {
            case "register":
                processCustomerRegistration(request, response);
                break;
            case "login":
                processCustomerLogin(request, response);
                break;
            default:
                processCustomerLogin(request, response);
                break;
        }
    }

    private void displayCustomerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("customers", customerService.getAllCustomers());
            request.getRequestDispatcher("WEB-INF/view/listCustomers.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving customer list", e);
        }
    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(customerId);
        response.sendRedirect("customer?action=list");
    }

    private void showRegistrationPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/registerCustomer.jsp").forward(request, response);
    }

    private void processCustomerRegistration(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String pwd = request.getParameter("password");

        Customer newCustomer = new Customer(name, email, phone, pwd); // Using the constructor to create the object

        customerService.registerCustomer(newCustomer);
        response.sendRedirect("customer?action=login");
    }

    private void showLoginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/loginCustomer.jsp").forward(request, response);
    }

    private void processCustomerLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer authenticatedCustomer = customerService.loginCustomer(email, password);
        if (authenticatedCustomer != null) {
            request.getSession().setAttribute("customer", authenticatedCustomer);
            response.sendRedirect("index");
        } else {
            request.setAttribute("error", "Invalid email or password");
            showLoginPage(request, response);
        }
    }

    private void performLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("index");
    }
}
