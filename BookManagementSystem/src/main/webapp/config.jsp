<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    // Database connection parameters
   	String url = "jdbc:mysql://localhost:3306/book_management_system";
    String username = "root";
    String password = "";
    Statement st=null;
    
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
        con= DriverManager.getConnection(url, username, password); // Establish the database connection
        st=con.createStatement();
    } 
    catch (Exception e) {
        e.printStackTrace();
    }
    
    // Store the database connection in the application scope
    application.setAttribute("ConfigCon", con);
    application.setAttribute("ConfigSt", st);
%>
</body>
</html>