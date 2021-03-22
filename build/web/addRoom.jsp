<%-- 
    Document   : addRoom
    Created on : Jan 14, 2021, 1:54:42 PM
    Author     : Ma 7m Ou D
--%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="upload" method="post" enctype="multipart/form-data">
            Enter Beds No. : 
            <input type="number" name="bedno" value="" /><br>
            price per night :
            <input type="number" name="price" value="" /><br>
             Room description :
             <input type="text" name="information" value="" /><br>
             Room pic: <br>
             <input type="file" name="photo" size="50"/><br><br>
        <input type="submit" value="ADD" />
        </form>

        <a href="home.jsp">home</a>
    </body>
</html>
