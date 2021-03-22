<%-- 
    Document   : hotelupdate
    Created on : Jan 14, 2021, 10:18:12 PM
    Author     : Ma 7m Ou D
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement Stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
            Stmt = con.createStatement();
            String sql = "SELECT * FROM hotel WHERE HotelID =" + request.getSession().getAttribute("HotelID").toString();
            ResultSet RS = Stmt.executeQuery(sql);
            if (RS.next()) {
        %>
        <form action="hotelupdate" >
            <input type="text" name="contact" value="<%=RS.getString("contact")%>" />
            <input type="text" name="information" value="<%=RS.getString("branchinformation")%>" />
            <input type="number" name="HotelStars" value="<%=RS.getInt("HotelStars")%>" />
            <input type="submit" value="update" />
        </form>

        <%
            }
        %>
        <a href="home.jsp">Home</a>

    </body>
</html>
