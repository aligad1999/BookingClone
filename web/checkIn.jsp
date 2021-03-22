<%-- 
    Document   : checkIn
    Created on : Jan 10, 2021, 5:51:24 PM
    Author     : Ma 7m Ou D
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>if guest make reservation</h1><br>
        <form>
            Enter Reservation ID : 
            <input type="number" name="reservationId" value="" />
            <input type="submit" value="ok" /></form>
            <%
                String id = request.getParameter("reservationId");
                if (id != null) {

                    int intID = Integer.valueOf(id);
                    session.setAttribute("resid", id);
                    String adid = request.getSession().getAttribute("UserID").toString();
                    int adminId = Integer.valueOf(adid);
                    String hoid = request.getSession().getAttribute("HotelID").toString();
                    int hotelId = Integer.valueOf(hoid);
                    Connection con = null;
                    Statement stmt = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
                    stmt = con.createStatement();
                    String sql = "SELECT * FROM reservation WHERE ReservationID = " + intID + " AND HotelID =" + hotelId;
                    ResultSet rs = stmt.executeQuery(sql);
                    boolean found = rs.next();
                    if (found) {
                        String from = rs.getString("ReservationFrom");
                        session.setAttribute("from", from);
                        String to = rs.getString("ReservationTo");
                        session.setAttribute("to", to);
                        String roid = rs.getString("RoomNo");
                        session.setAttribute("roomid", roid);
                        int roomid = Integer.valueOf(roid);
                        String cuid = rs.getString("CustomerID");
                        session.setAttribute("css", cuid);
                        int customerid = Integer.valueOf(cuid);
            %>
        <form action="confirm">

            <table border="1">
                <tr>
                    <th>Reservation ID</th> 
                    <th>Customer ID</th> 
                    <th>Reservation From</th> 
                    <th>Reservation To</th> 
                    <th>Room No</th> 
                </tr>
                <tr>
                    <td><%=rs.getString("ReservationID")%></td>
                    <td><%=rs.getString("CustomerID")%></td>
                    <td><%=rs.getString("ReservationFrom")%></td>
                    <td><%=rs.getString("ReservationTo")%></td>
                    <td><%=rs.getString("RoomNo")%></td>
                </tr> 


                <%

                    sql = "SELECT * FROM room WHERE RoomNo = " + roomid;
                    rs = stmt.executeQuery(sql);
                    found = rs.next();
                    if (found) {
                        String pric = rs.getString("RoomPrice");
                        int price = Integer.valueOf(pric);
                        sql = " SELECT DATE(`ReservationTo`),DATE(`ReservationFrom`),DATEDIFF(`ReservationTo`, `ReservationFrom`) AS 'days'FROM reservation WHERE RoomNo= " + roomid;
                        rs = stmt.executeQuery(sql);
                        if (rs.next()) {
                            String day = rs.getString("days");
                            int days = Integer.valueOf(day);
                            price *= days;
                        }
                %>
                <tr>
                    <td>price</td>
                    <td><%=price%>
                </tr>
                <tr>
                    <td></td><td></td>
                    <td><input type="submit" value="confirm"  /></td>
                </tr>
            </table>
        </form>

        <%

                    } else
                        out.print("fff");

                } else
                    out.print(1);

            }
        %>

    </body>
</html>
