package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Reservation;

public class ReservationDAO {

    private static final String INSERT_RESERVATION = "INSERT INTO Reservation (name, email, phone, date, time, people, message, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_RESERVATIONS = "SELECT * FROM Reservation";
    private static final String UPDATE_RESERVATION_STATUS = "UPDATE Reservation SET status = ? WHERE reservation_id = ?";
    private static final String DELETE_RESERVATION = "DELETE FROM Reservation WHERE reservation_id = ?";

    public void addReservation(Reservation reservation) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_RESERVATION)) {

            statement.setString(1, reservation.getName());
            statement.setString(2, reservation.getEmail());
            statement.setString(3, reservation.getPhone());
            statement.setString(4, reservation.getDate());
            statement.setString(5, reservation.getTime());
            statement.setInt(6, reservation.getPeople());
            statement.setString(7, reservation.getMessage());
            statement.setString(8, reservation.getStatus());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_RESERVATIONS)) {

            while (resultSet.next()) {
                reservations.add(new Reservation(
                        resultSet.getInt("reservation_id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("date"),
                        resultSet.getString("time"),
                        resultSet.getInt("people"),
                        resultSet.getString("message"),
                        resultSet.getString("status")));
            }
        }
        return reservations;
    }

    public void updateReservationStatus(int reservationId, String status) throws SQLException {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_RESERVATION_STATUS)) {

            statement.setString(1, status);
            statement.setInt(2, reservationId);
            statement.executeUpdate();
        }
    }

    public void deleteReservation(int reservationId) throws SQLException {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_RESERVATION)) {

            statement.setInt(1, reservationId);
            statement.executeUpdate();
        }
    }
}
