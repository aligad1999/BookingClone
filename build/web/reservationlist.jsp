<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%           Date date = new Date();
            String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);%>
        <form>
            <label for="start">Start date:</label>
            <input type="date" id="start" name="trip-start"  min="2018-01-01" max="<%out.print(modifiedDate);%>"/>
            <label for="end">end date:</label>
            <input type="date" id="end" name="trip-end" min="<%out.print(modifiedDate);%>" max="2022-12-31" />
            <input type="submit" value="search" />
        </form>
        <%
            String HotelID = request.getSession().getAttribute("HotelID").toString();
            JOptionPane.showMessageDialog(null, "Done is  = " + HotelID);
            int hotelId = Integer.valueOf(HotelID);
            Connection con = null;
            Statement Stmt = null;
            Statement stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
            Stmt = con.createStatement();
            String start = request.getParameter("trip-start");
            String end = request.getParameter("trip-end");
            if (start != null && end != null) {
                String sql = "SELECT * FROM reservation WHERE DATEDIFF(`ReservationFrom`, '" + start + " ') >= 0 AND DATEDIFF(`ReservationTo`, '" + end + " ') <= 0 AND HotelID = " + hotelId;
                ResultSet RS = Stmt.executeQuery(sql);%>
        <table border="1">
            <tr>
                <th>Reservation ID</th> 
                <th>Customer ID</th> 
                <th>Reservation From</th> 
                <th>Reservation To</th> 
                <th>Room No</th> 
            </tr>
            <%
                while (RS.next()) {
            %>
            <tr>
                <td><%=RS.getString("ReservationID")%></td>
                <td><%=RS.getString("CustomerID")%></td>
                <td><%=RS.getString("ReservationFrom")%></td>
                <td><%=RS.getString("ReservationTo")%></td>
                <td><%=RS.getString("RoomNo")%></td>
            </tr><%
                }
            } else {
                String sql = "SELECT * FROM reservation WHERE DATEDIFF(`ReservationTo`, CURDATE()) >= 0 AND HotelID = " + hotelId;
                ResultSet RS = Stmt.executeQuery(sql);

            %>
            <table border="1">
                <tr>
                    <th>Reservation ID</th> 
                    <th>Customer ID</th> 
                    <th>Reservation From</th> 
                    <th>Reservation To</th> 
                    <th>Room No</th> 
                </tr>
                <%                
                    while (RS.next()) {
                %>
                <tr>
                    <td><%=RS.getString("ReservationID")%></td>
                    <td><%=RS.getString("CustomerID")%></td>
                    <td><%=RS.getString("ReservationFrom")%></td>
                    <td><%=RS.getString("ReservationTo")%></td>
                    <td><%=RS.getString("RoomNo")%></td>
                </tr>
                <%}
                    }%>

            </table>
            <br><br>
            <a href="cancel.jsp">cancel reservation</a><br>
            <a href="home.jsp">back</a>
    </body>
</html>
