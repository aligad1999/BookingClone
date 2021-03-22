<%-- 
    Document   : hotelReviews
    Created on : Jan 14, 2021, 1:41:36 PM
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
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root","");
               Stmt = con.createStatement();
               String sql = "SELECT * FROM comments WHERE HotelID = " + request.getSession().getAttribute("HotelID").toString();
            ResultSet RS = Stmt.executeQuery(sql);%>
            <table border="1">
            <tr>
                <th>Customer ID</th> 
                <th>Date</th> 
                <th>Stars No.</th> 
                <th>Comment</th> 
                
            </tr>
        <%
                while (RS.next()) {
           
            %>
            <tr>
                <td><%=RS.getString("CustomerID")%></td>
                <td><%=RS.getString("Date")%></td>
                <td><%=RS.getString("StarsNo")%></td>
                <td><%=RS.getString("Comment")%></td>
                
            </tr>
            
            <%
 }
        
        %>
        </table>
        <a href="home.jsp">home</a>
    </body>
</html>
