<%-- 
    Document   : cancel
    Created on : Jan 15, 2021, 5:32:39 PM
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
        <form>
            Enter reservation Id :
            <input type="number" name="id" value="" />
            <input type="submit" value="ok" />
            <%
                if(request.getParameter("id")!=null){
                Connection con = null;
            Statement stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
            stmt = con.createStatement();
           String sql = "SELECT * FROM reservation WHERE ReservationID = "+Integer.valueOf(request.getParameter("id"))  + " AND HotelID =" + request.getSession().getAttribute("HotelID").toString();
                    ResultSet rs = stmt.executeQuery(sql);
                    if(rs.next()){
                        int userid=rs.getInt("CustomerID");
             sql = "DELETE reservation WHERE ReservationID=" + Integer.valueOf(request.getParameter("id")) +"AND HotelID="+request.getSession().getAttribute("HotelID").toString();
            int c=stmt.executeUpdate(sql);
            if(c>0){
                 sql = "SELECT * FROM user WHERE UserID = " + userid + " AND HotelID =" + request.getSession().getAttribute("HotelID").toString();
                     rs = stmt.executeQuery(sql);
                     if(rs.next()){
                         String mail=rs.getString("Email");
                         SendEmail.sendNotifyofCancel(mail);
                            //call send email fan...your reservation is canceled
                     }
                out.print("deleted");
            }else
                out.print("Error 404");
    }}%>
        </form>
    </body>
</html>
