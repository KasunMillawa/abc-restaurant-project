package com.abc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.abc.model.Gallery;
import com.abc.service.GalleryService;

@WebServlet("/gallery")
@MultipartConfig
public class GalleryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GalleryService galleryService;

    @Override
    public void init() throws ServletException {
        galleryService = GalleryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action == null ? "list" : action) {
            case "list":
                listGalleries(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteGallery(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addGallery(request, response);
                break;
            case "edit":
                updateGallery(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void listGalleries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("galleries", galleryService.getAllGalleries());
        } catch (SQLException e) {
            throw new ServletException("Unable to retrieve galleries", e);
        }
        request.getRequestDispatcher("WEB-INF/view/listGalleries.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addGallery.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));
        try {
            Gallery gallery = galleryService.getGalleryById(galleryId);
            request.setAttribute("gallery", gallery);
        } catch (SQLException e) {
            throw new ServletException("Unable to retrieve gallery", e);
        }
        request.getRequestDispatcher("WEB-INF/view/editGallery.jsp").forward(request, response);
    }

    private void addGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        filePart.write(uploadPath + File.separator + fileName);
        String imagePath = "uploads" + File.separator + fileName;

        Gallery gallery = new Gallery();
        gallery.setImage(imagePath);

        galleryService.addGallery(gallery);
        response.sendRedirect("gallery?action=list");
    }

    private void updateGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        filePart.write(uploadPath + File.separator + fileName);
        String imagePath = "uploads" + File.separator + fileName;

        Gallery gallery = new Gallery(galleryId, imagePath);
        galleryService.updateGallery(gallery);
        response.sendRedirect("gallery?action=list");
    }

    private void deleteGallery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int galleryId = Integer.parseInt(request.getParameter("id"));
        galleryService.deleteGallery(galleryId);
        response.sendRedirect("gallery?action=list");
    }
}
