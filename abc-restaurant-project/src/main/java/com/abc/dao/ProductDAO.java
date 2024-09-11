package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Product;

public class ProductDAO {

    private static final String INSERT_QUERY = "INSERT INTO Product (name, price, description, image_path, category) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_QUERY = "UPDATE Product SET name = ?, price = ?, description = ?, image_path = ?, category = ? WHERE product_id = ?";
    private static final String DELETE_QUERY = "DELETE FROM Product WHERE product_id = ?";
    private static final String SELECT_ALL_QUERY = "SELECT * FROM Product";

    public void addProduct(Product product) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
            setProductStatement(statement, product);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            setProductStatement(statement, product);
            statement.setInt(6, product.getProductId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
            statement.setInt(1, productId);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("No product found with ID: " + productId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_QUERY)) {
            while (resultSet.next()) {
                products.add(extractProductFromResultSet(resultSet));
            }
        }
        return products;
    }

    private void setProductStatement(PreparedStatement statement, Product product) throws SQLException {
        statement.setString(1, product.getName());
        statement.setString(2, product.getPrice());
        statement.setString(3, product.getDescription());
        statement.setString(4, product.getImagePath());
        statement.setString(5, product.getCategory());
    }

    private Product extractProductFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("product_id");
        String name = resultSet.getString("name");
        String price = resultSet.getString("price");
        String desc = resultSet.getString("description");
        String imagePath = resultSet.getString("image_path");
        String category = resultSet.getString("category");
        return new Product(id, name, desc, price, imagePath, category);
    }
}
