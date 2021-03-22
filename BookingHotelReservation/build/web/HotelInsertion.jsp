<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/hotelreservationsystem?sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false";
            FileInputStream fis = null;
            //out.print("First Name :"+fname+"myloc="+myloc);
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "root");
                File image = new File("C:\\CodeRepository\\JavaWebRepository\\hotelReservationSystem\\hotelImages\\The Three Corners Rihana Resort El Gouna.jpg");
                pstmt = conn.prepareStatement("insert into hotel(HotelName, AvailableRoom, Rating, HotelStars, IncludeMeal, HotelCountry, HotelLocation, HotelImage) " 
                        + "values(?,?,?,?,?,?,?,?);");
                
                pstmt.setString(1, "The Three Corners Rihana Resort El Gouna");
                pstmt.setInt(2, 2);
                pstmt.setInt(3, 3);
                pstmt.setInt(4, 3);
                pstmt.setInt(5, 0);
                pstmt.setString(6, "Egypt");
                pstmt.setString(7, "27.401664817323354, 33.651616052387006");
                
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(8, (InputStream) fis, (int) (image.length()));
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    out.println("insert successfully");
                } else {
                    out.println("not successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>