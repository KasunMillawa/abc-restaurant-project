<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Queries</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4 text-center">Query List</h1>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="query" items="${queries}">
                <tr>
                    <td>${query.queryId}</td>
                    <td>${query.name}</td>
                    <td>${query.email}</td>
                    <td>${query.subject}</td>
                    <td>${query.message}</td>
                    <td>
                        <a href="query?action=reply&id=${query.queryId}" class="btn btn-info btn-sm">Reply</a>
                        <a href="query?action=delete&id=${query.queryId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this query?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
