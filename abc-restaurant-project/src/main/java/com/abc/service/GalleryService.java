package com.abc.service;

import com.abc.dao.GalleryDAO;
import com.abc.model.Gallery;

import java.sql.SQLException;
import java.util.List;

public class GalleryService {

    private static volatile GalleryService instance;
    private final GalleryDAO galleryDAO;

    private GalleryService() {
        this.galleryDAO = new GalleryDAO();
    }

    public static GalleryService getInstance() {
        if (instance == null) {
            synchronized (GalleryService.class) {
                if (instance == null) {
                    instance = new GalleryService();
                }
            }
        }
        return instance;
    }

    public Gallery getGalleryById(int galleryId) throws SQLException {
        return galleryDAO.getGalleryById(galleryId);
    }

    public void addGallery(Gallery gallery) {
        galleryDAO.addGallery(gallery);
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        return galleryDAO.getAllGalleries();
    }
    
    public void updateGallery(Gallery gallery) {
        galleryDAO.updateGallery(gallery);
    }

    public void deleteGallery(int galleryId) {
        galleryDAO.deleteGallery(galleryId);
    }
}
