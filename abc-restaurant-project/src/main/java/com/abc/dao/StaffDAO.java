package com.abc.dao;

import com.abc.model.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    private static final String INSERT_STAFF_QUERY = "INSERT INTO Staff (name, email, phone_number, password, role) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_STAFF_BY_CREDENTIALS = "SELECT * FROM Staff WHERE email = ? AND password = ?";
    private static final String SELECT_ALL_STAFF = "SELECT * FROM Staff";
    private static final String DELETE_STAFF_QUERY = "DELETE FROM Staff WHERE staff_id = ?";

    public void registerStaff(Staff staff) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_STAFF_QUERY)) {

            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getPhoneNumber());
            statement.setString(4, staff.getPassword());
            statement.setString(5, staff.getRole());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Staff loginStaff(String email, String password) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_STAFF_BY_CREDENTIALS)) {

            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return buildStaffFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Staff> getAllStaff() throws SQLException {
        List<Staff> staffList = new ArrayList<>();

        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_STAFF);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                staffList.add(buildStaffFromResultSet(resultSet));
            }
        }
        return staffList;
    }

    public void deleteStaff(int staffId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_STAFF_QUERY)) {

            statement.setInt(1, staffId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Staff buildStaffFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("staff_id");
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        String phoneNumber = resultSet.getString("phone_number");
        String password = resultSet.getString("password");
        String role = resultSet.getString("role");
        return new Staff(id, name, email, phoneNumber, password, role);
    }
}
