<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="config.jsp" %>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
    String searchTerm = request.getParameter("bk");
    String submitBtn = request.getParameter("submitbtn");

    if ("By Author".equals(submitBtn)) {
        // Perform the search by author
        String searchQuery = "SELECT * FROM books WHERE author LIKE ?";
        PreparedStatement preparedStatement = con.prepareStatement(searchQuery);
        preparedStatement.setString(1, "%" + searchTerm + "%");
        ResultSet rs = preparedStatement.executeQuery();
        
        // Display search results here, e.g., in a table
        out.println("<h2>Search Results by Author:</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>Title</th><th>Author</th><th>Price</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getString("author") + "</td>");
            out.println("<td>" + rs.getInt("price") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        con.close();
    } else if ("By Name".equals(submitBtn)) {
        // Perform the search by name (title)
        String searchQuery = "SELECT * FROM books WHERE title LIKE ?";
        PreparedStatement preparedStatement = con.prepareStatement(searchQuery);
        preparedStatement.setString(1, "%" + searchTerm + "%");
        ResultSet rs = preparedStatement.executeQuery();
        
        // Display search results here, e.g., in a table
        out.println("<h2>Search Results by Name:</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>Title</th><th>Author</th><th>Price</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getString("author") + "</td>");
            out.println("<td>" + rs.getInt("price") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        con.close();
    } else if ("By ID".equals(submitBtn)) {
        try {
            int bookID = Integer.parseInt(searchTerm);
            // Perform the search by book ID
            String searchQuery = "SELECT * FROM books WHERE book_id = ?";
            PreparedStatement preparedStatement = con.prepareStatement(searchQuery);
            preparedStatement.setInt(1, bookID);
            ResultSet rs = preparedStatement.executeQuery();
            
            // Display search results here, e.g., in a table
            out.println("<h2>Search Results by ID:</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>Title</th><th>Author</th><th>Price</th></tr>");
            if (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("title") + "</td>");
                out.println("<td>" + rs.getString("author") + "</td>");
                out.println("<td>" + rs.getInt("price") + "</td>");
                out.println("</tr>");
            } else {
                out.println("Book not found.");
            }
            out.println("</table>");
            con.close();
        } catch (NumberFormatException e) {
            out.println("Invalid book ID.");
        }
    }
}
%>