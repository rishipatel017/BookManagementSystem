<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="config.jsp" %>
<%
    int bid = Integer.parseInt(request.getParameter("book_id"));
    try {
        String deleteQuery = "DELETE FROM books WHERE book_id = ?";
        PreparedStatement deleteStatement = con.prepareStatement(deleteQuery);
        deleteStatement.setInt(1, bid);
        int deletedRows = deleteStatement.executeUpdate();
        con.close();

        if (deletedRows > 0) {
            out.println("Book with ID " + bid + " has been deleted successfully!");
        } else {
            out.println("Book with ID " + bid + " not found.");
        }
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.println("Error deleting the book: " + e.getMessage());
    }
%>
