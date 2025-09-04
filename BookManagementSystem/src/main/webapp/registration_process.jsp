<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
// Database connection parameters
String url = "jdbc:mysql://localhost:3306/users";
String user = "root";
String password1 = "";

Connection con=null;
// Get user input from the form
String username = request.getParameter("username");
String password = request.getParameter("password");
String retypePassword = request.getParameter("retypePassword");

// Check if passwords match
if (password.equals(retypePassword)) {
    try {
        // Create a database connection
        con = DriverManager.getConnection(url, user, password);

        // Create a SQL statement for inserting the user into the database
        String insertSQL = "INSERT INTO users (username, password) VALUES (?, ?)";
        PreparedStatement preparedStatement = con.prepareStatement(insertSQL);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);

        // Execute the SQL statement to insert the user
        preparedStatement.executeUpdate();

        // Close the database connection
        con.close();

        // Redirect to login.html on successful registration
        response.sendRedirect("login.html");
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle any database errors here
    }
} else {
    // Redirect back to registration.html if passwords don't match
    response.sendRedirect("register.html");
}
%>
</body>
</html>