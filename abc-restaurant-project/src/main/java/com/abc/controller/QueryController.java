package com.abc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Query;
import com.abc.service.QueryService;

@WebServlet("/query")
public class QueryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QueryService queryService;

    @Override
    public void init() throws ServletException {
        queryService = QueryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action != null ? action : "list") {
            case "add":
                showAddForm(request, response);
                break;
            case "delete":
                deleteQuery(request, response);
                break;
            case "list":
            default:
                listQueries(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addQuery(request, response);
        }
    }

    private void listQueries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("queries", queryService.getAllQueries());
        request.getRequestDispatcher("WEB-INF/view/listQueries.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/addQuery.jsp").forward(request, response);
    }

    private void addQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Query query = new Query();
        query.setName(request.getParameter("name"));
        query.setEmail(request.getParameter("email"));
        query.setSubject(request.getParameter("subject"));
        query.setMessage(request.getParameter("message"));

        try {
            queryService.addQuery(query);
            response.sendRedirect("index?success=true&message=Your query has been successfully submitted!");
        } catch (Exception e) {
            response.sendRedirect("index?error=true&message=There was an error submitting your query. Please try again later.");
        }
    }

    private void deleteQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("id"));
        queryService.deleteQuery(queryId);
        response.sendRedirect("query?action=list");
    }
}
