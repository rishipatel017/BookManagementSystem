<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Replace the following with your actual database connection details.
			String dbUrl = "jdbc:mysql://localhost:3306/book_management_system";
		String dbUser = "root";
		String dbPassword = "";

		try {
		    Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	    	// Replace "users" with your actual user table name and adjust the query as needed.
   			String selectQuery = "SELECT * FROM users WHERE username=? AND password=?";
    		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
    		preparedStatement.setString(1, username);
    		preparedStatement.setString(2, password);
    		ResultSet resultSet = preparedStatement.executeQuery();

    		if (resultSet.next()) {
        		// Login successful
        		session.setAttribute("loggedInUser", username);
        		response.sendRedirect("index.jsp"); // Redirect to index.jsp after successful login
    		}
    		else {
       			// Login failed
        		out.println("Login failed. Invalid username or password.");
        		response.sendRedirect("login.html"); // Redirect back to login.jsp
    		}
    		conn.close();
		} catch (Exception e) {
    	out.println("Error: " + e.getMessage());
	}
%>
</body>
</html>