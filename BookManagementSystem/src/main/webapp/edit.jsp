<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<%
    String eauthor = null;
    String etitle = null;
    int eprice = 0;
    int bid = Integer.parseInt(request.getParameter("book_id"));
    try {
        String qry = "SELECT * FROM books where book_id = ?";
        PreparedStatement preparedStatement = con.prepareStatement(qry);
        preparedStatement.setInt(1, bid);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            etitle = rs.getString("title");
            eauthor = rs.getString("author");
            eprice = rs.getInt("price");
        }
    } catch (Exception e) {
        out.println("Error searching for books: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
</head>
<body>
    <h1>Edit a Book</h1>
    <form action="edit.jsp" method="post">
        <input type="hidden" name="book_id" value="<%=bid%>">
        <label>Title: </label>
        <input type="text" name="etitle" value="<%=etitle%>" required><br>
        <label>Author:</label>
        <input type="text" name="eauthor" value="<%=eauthor%>" required><br>
        <label>Price:</label>
        <input type="text" name="eprice" value="<%=eprice%>" required><br>
        <input type="submit" value="Update Book">
    </form>

    <%
    if (request.getMethod().equalsIgnoreCase("post")) {
        int ebid = Integer.parseInt(request.getParameter("book_id"));
        String title = request.getParameter("etitle");
        String author = request.getParameter("eauthor");
        int price = Integer.parseInt(request.getParameter("eprice"));

        if (title != null && author != null) {
            try {
                String updateQuery = "UPDATE books SET title=?, author=?, price=? WHERE book_id=?";
                PreparedStatement updateStatement = con.prepareStatement(updateQuery);
                updateStatement.setString(1, title);
                updateStatement.setString(2, author);
                updateStatement.setInt(3, price);
                updateStatement.setInt(4, ebid);
                updateStatement.executeUpdate();
                con.close();

                // For simplicity, we'll just print a success message here.
                out.println("Book updated successfully!");
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                out.println("Error updating the book: " + e.getMessage());
            }
        }
    }
    %>
</body>
</html>
