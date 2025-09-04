<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        .button-container {
            text-align: center;
           background-color: #000000;
        }
        button{
            width: 17%;
            padding: 10px;
            margin:10px;
            background: #007BFF;
            color: #fff;
            border: 0;
            border-radius: 5px;
            }

        .table-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Book Management System</h1>
        <div class="button-container">
           	<a href="add.jsp"><button >Add Book</button></a><br>
           	<form action="search.jsp" method="post">
           	<input type="text" name="bk">
           	<input type="submit" name="submitbtn" value="By Author">
           	<input type="submit" name="submitbtn" value="By Name">
           	<input type="submit" name="submitbtn" value="By ID">
            </form>
        </div>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            <%

                try {
                    String qry = "SELECT * FROM books";
                   	ResultSet rs=st.executeQuery(qry);
                    while (rs.next()) {
                        int bookId = rs.getInt("book_id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        int price = rs.getInt("price");
                        out.println("<tr><td>" + bookId + "</td><td>" + title + "</td><td>" + author + "</td><td> " + price + "</td>");
                        out.println("<td>");
                        out.println(" <a href='edit.jsp?book_id=" + bookId + "'>Update</a>");
                        out.println(" <a href='delete.jsp?book_id=" + bookId + "'>Delete</a>");
                        out.println("</td></tr>");
                    }
                    con.close(); 
                } catch (Exception e) {
                    out.println("Error searching for books: " + e.getMessage());
                }
             %>
               
            </table>
        </div>
    </div>
</body>
</html>
