package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Query;

public class QueryDAO {

    private static final String INSERT_QUERY_SQL = "INSERT INTO Query (name, email, subject, message) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_QUERY_SQL = "SELECT * FROM Query";
    private static final String DELETE_QUERY_SQL = "DELETE FROM Query WHERE query_id = ?";

    public void addQuery(Query query) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_QUERY_SQL)) {
            statement.setString(1, query.getName());
            statement.setString(2, query.getEmail());
            statement.setString(3, query.getSubject());
            statement.setString(4, query.getMessage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Query> getAllQueries() {
        List<Query> queries = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_QUERY_SQL)) {
            while (resultSet.next()) {
                queries.add(new Query(
                    resultSet.getInt("query_id"),
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("subject"),
                    resultSet.getString("message")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return queries;
    }

    public void deleteQuery(int queryId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_QUERY_SQL)) {
            statement.setInt(1, queryId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
