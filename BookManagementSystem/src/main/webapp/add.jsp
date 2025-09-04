<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
</head>
<body>
    <h1>Add a Book</h1>
    <form action="add.jsp" method="post">
        <label>Title: </label>
        <input type="text" name="title" required><br>
        <label>Author:</label>
        <input type="text" name="author" required><br>
        <label>Price:</label>
        <input type="text" name="price" required><br>
        <input type="submit" value="Add Book">
    </form>

    <%
    if(request.getMethod().equalsIgnoreCase("post"))
    {
    	String title = request.getParameter("title");
    	String author = request.getParameter("author");
    	int price = Integer.parseInt(request.getParameter("price"));

    if (title != null && author != null && price != -1) {
        try {
            	
            	String insertQuery = "INSERT INTO books (title,author,price) VALUES (?, ?, ?)";
            	PreparedStatement preparedStatement = con.prepareStatement(insertQuery);
             	preparedStatement.setString(1, title);
            	preparedStatement.setString(2, author);
            	preparedStatement.setInt(3, price);
            	preparedStatement.executeUpdate();
            	con.close();

            // For simplicity, we'll just print a success message here.
            out.println("Book added successfully!");
            //send.redirect("index.jsp");
        } catch (Exception e) {
            out.println("Error adding the book: " + e.getMessage());
        }
    }
   }
    %>
</body>
</html>