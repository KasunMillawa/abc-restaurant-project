package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.abc.model.Reservation;
import com.abc.service.ReservationService;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService reservationService;

    @Override
    public void init() throws ServletException {
        reservationService = ReservationService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action == null ? "list" : action) {
            case "list":
                listReservations(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "accept":
                updateReservationStatus(request, response, "Accepted");
                break;
            case "reject":
                updateReservationStatus(request, response, "Rejected");
                break;
            case "delete":
                deleteReservation(request, response);
                break;
            default:
                listReservations(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addReservation(request, response);
        }
    }

    private void listReservations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("reservations", reservationService.getAllReservations());
            request.getRequestDispatcher("WEB-INF/view/listReservations.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error listing reservations", e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addReservation.jsp").forward(request, response);
    }

    private void addReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Reservation reservation = buildReservationFromRequest(request);
            reservationService.addReservation(reservation);
            response.sendRedirect("index?success=true&message=Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!");
        } catch (Exception e) {
            response.sendRedirect("index?error=true&message=There was an error submitting your reservation. Please try again later.");
        }
    }

    private Reservation buildReservationFromRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int people = Integer.parseInt(request.getParameter("people"));
        String message = request.getParameter("message");

        return new Reservation(name, email, phone, date, time, people, message, "Pending");
    }

    private void updateReservationStatus(HttpServletRequest request, HttpServletResponse response, String status) throws IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        try {
            reservationService.updateReservationStatus(reservationId, status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("reservation?action=list");
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        try {
            reservationService.deleteReservation(reservationId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("reservation?action=list");
    }
}
