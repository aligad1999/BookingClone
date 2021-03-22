<%--
    Document   : checkOut
    Created on : Jan 12, 2021, 10:12:50 PM
    Author     : Ma 7m Ou D
--%>




<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>

        customer ID :
        <input type="text" name="userId" value="" placeholder="Enter Id" />

        <input type="submit" value="ok" /></form>
         <%
            String id = request.getParameter("userId");  
            if(id!=null){
            int intID = Integer.valueOf(id);
             Connection con = null;
            Statement stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
            stmt = con.createStatement();
            String sql = "SELECT * FROM room WHERE  CustomerID= " + intID +"AND HotelID= "+ request.getSession().getAttribute("HotelID").toString();
            ResultSet rs = stmt.executeQuery(sql);
               boolean found=rs.next();
    
                   if(found){
                       int roomNo=rs.getInt("RoomNo");
                       sql = "UPDATE room SET ReservedFrom=NULL WHERE roomNo=" + roomNo;
                        stmt.executeUpdate(sql); 
                        sql = "UPDATE room SET ReservedTo=NULL WHERE roomNo=" + roomNo;
                        stmt.executeUpdate(sql); 
                        sql = "UPDATE room SET RoomAvailable='"+1+"' WHERE roomNo=" + roomNo;
                        stmt.executeUpdate(sql); 
                        sql = "UPDATE room SET CustomerID=NULL WHERE roomNo=" + roomNo;
                        stmt.executeUpdate(sql); 
                        out.print("Checked out Successfully");
                        %><br>
                       
                <%   }else
               out.print("fff");
            }
            %>
             <a href="home.jsp">back</a>
    </body>
</html>
