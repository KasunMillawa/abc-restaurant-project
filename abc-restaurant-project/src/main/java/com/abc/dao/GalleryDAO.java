package com.abc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.abc.model.Gallery;

public class GalleryDAO {

    private static final String SELECT_GALLERY_BY_ID_QUERY = "SELECT * FROM Gallery WHERE gallery_id = ?";
    private static final String INSERT_GALLERY_QUERY = "INSERT INTO Gallery (image) VALUES (?)";
    private static final String UPDATE_GALLERY_QUERY = "UPDATE Gallery SET image = ? WHERE gallery_id = ?";
    private static final String DELETE_GALLERY_QUERY = "DELETE FROM Gallery WHERE gallery_id = ?";
    private static final String SELECT_ALL_GALLERIES_QUERY = "SELECT * FROM Gallery";

    public Gallery getGalleryById(int galleryId) {
        Gallery gallery = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_GALLERY_BY_ID_QUERY)) {
            statement.setInt(1, galleryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String image = resultSet.getString("image");
                    gallery = new Gallery(galleryId, image);
                }
            }
        } catch (SQLException e) {
            handleSQLException(e, "Error retrieving gallery by ID");
        }
        return gallery;
    }

    public void addGallery(Gallery gallery) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_GALLERY_QUERY)) {
            statement.setString(1, gallery.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, "Error adding gallery");
        }
    }

    public void updateGallery(Gallery gallery) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_GALLERY_QUERY)) {
            statement.setString(1, gallery.getImage());
            statement.setInt(2, gallery.getGalleryId());
            statement.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, "Error updating gallery");
        }
    }

    public void deleteGallery(int galleryId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_GALLERY_QUERY)) {
            statement.setInt(1, galleryId);
            statement.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e, "Error deleting gallery");
        }
    }

    public List<Gallery> getAllGalleries() {
        List<Gallery> galleries = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_GALLERIES_QUERY)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("gallery_id");
                String image = resultSet.getString("image");
                galleries.add(new Gallery(id, image));
            }
        } catch (SQLException e) {
            handleSQLException(e, "Error retrieving all galleries");
        }
        return galleries;
    }

    private void handleSQLException(SQLException e, String message) {
        System.err.println(message);
        e.printStackTrace();
    }
}
