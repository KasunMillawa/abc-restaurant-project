package com.abc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.abc.model.Service;
import com.abc.service.ServiceService;

@WebServlet("/service")
@MultipartConfig
public class ServiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServiceService serviceService;

    @Override
    public void init() throws ServletException {
        serviceService = ServiceService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                listServices(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addService(request, response);
        } else if ("edit".equals(action)) {
            updateService(request, response);
        }
    }

    private void listServices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("services", serviceService.getAllServices());
        request.getRequestDispatcher("WEB-INF/view/listServices.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addService.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int serviceId = Integer.parseInt(request.getParameter("id"));
        Service service = serviceService.getServiceById(serviceId);
        request.setAttribute("service", service);
        request.getRequestDispatcher("WEB-INF/view/editService.jsp").forward(request, response);
    }

    private void addService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        String imagePath = handleFileUpload(request);

        Service service = new Service();
        service.setServiceName(serviceName);
        service.setDescription(description);
        service.setImage(imagePath);

        serviceService.addService(service);
        response.sendRedirect("service?action=list");
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int serviceId = Integer.parseInt(request.getParameter("id"));
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        String imagePath = handleFileUpload(request);

        Service service = new Service(serviceId, serviceName, imagePath, description);
        serviceService.updateService(service);
        response.sendRedirect("service?action=list");
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int serviceId = Integer.parseInt(request.getParameter("id"));
        serviceService.deleteService(serviceId);
        response.sendRedirect("service?action=list");
    }

    private String handleFileUpload(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);
        return "uploads" + File.separator + fileName;
    }
}
