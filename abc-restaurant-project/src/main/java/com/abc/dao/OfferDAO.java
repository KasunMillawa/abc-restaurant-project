package com.abc.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Offer;

public class OfferDAO {

    private static final String INSERT_OFFER_QUERY = "INSERT INTO Offer (name, description, image) VALUES (?, ?, ?)";
    private static final String UPDATE_OFFER_QUERY = "UPDATE Offer SET name = ?, description = ?, image = ? WHERE offer_id = ?";
    private static final String DELETE_OFFER_QUERY = "DELETE FROM Offer WHERE offer_id = ?";
    private static final String SELECT_ALL_OFFERS_QUERY = "SELECT * FROM Offer";
    private static final String SELECT_OFFER_BY_ID_QUERY = "SELECT * FROM Offer WHERE offer_id = ?";

    public void addOffer(Offer offer) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_OFFER_QUERY)) {
            
            statement.setString(1, offer.getName());
            statement.setString(2, offer.getDescription());
            statement.setString(3, offer.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateOffer(Offer offer) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_OFFER_QUERY)) {
            
            statement.setString(1, offer.getName());
            statement.setString(2, offer.getDescription());
            statement.setString(3, offer.getImage());
            statement.setInt(4, offer.getOfferId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOffer(int offerId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_OFFER_QUERY)) {
            
            statement.setInt(1, offerId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Offer> getAllOffers() {
        List<Offer> offers = new ArrayList<>();
        try (Connection connection = DBConnectionFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_OFFERS_QUERY)) {
            
            while (resultSet.next()) {
                offers.add(mapRowToOffer(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offers;
    }

    public Offer getOfferById(int offerId) {
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_OFFER_BY_ID_QUERY)) {

            statement.setInt(1, offerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapRowToOffer(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Offer mapRowToOffer(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("offer_id");
        String name = resultSet.getString("name");
        String description = resultSet.getString("description");
        String image = resultSet.getString("image");
        return new Offer(id, name, description, image);
    }
}
