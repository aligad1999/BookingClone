<%-- 
    Document   : updateroom
    Created on : Jan 14, 2021, 8:03:12 PM
    Author     : Ma 7m Ou D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form >
            <input type="text" name="roomid" value="<%out.print(request.getParameter("roomid")==null?"":request.getParameter("roomid"));%>" />
            <input type="submit" value="ok" />
        </form>
        <%
        String room=request.getParameter("roomid");
        int count=0;
        if(room!=null){
            count++;
            int id=Integer.valueOf(room);
            session.setAttribute("session_roomid", id);
            Connection con = null;  
            Statement Stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root","");
               Stmt = con.createStatement();
               String sql = "SELECT * FROM room WHERE RoomNo =" + id+"AND HotelID="+request.getSession().getAttribute("HotelID").toString();
            ResultSet RS = Stmt.executeQuery(sql);
            while(RS.next()){
            %>
            <form action="room">
                <input type="number" name="bedno" value="<%=RS.getString("bedsNo")%>" />
                <input type="number" name="price" value="<%=RS.getString("RoomPrice")%>" />
                <input type="text"  name="information" value="<%=RS.getString("RoomInformation")%>" />
                
                <input type="submit" value="update" />
            </form>
            
                <%
 }
}
        %>
        <a href="home.jsp">home</a>
    </body>
</html>
