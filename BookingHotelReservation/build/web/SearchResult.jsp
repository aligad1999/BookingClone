<%-- 
    Document   : SearchResult
    Created on : Jan 11, 2021, 1:28:37 PM
    Author     : fsam5
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <style>
            td{
                text-align: center;
            }
        </style>
    </head>





    <%
        ResultSet rs = null;
        Connection con = null;
        Statement st = null;
      
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hotelreservationsystem?SSL=false";
        String user = "root";
        String password = "root";
        String hotels;
        con = DriverManager.getConnection(url, user, password);
        st = con.createStatement();
        String mealsIncluded = "";
        String cityName = request.getSession().getAttribute("sessionSearchHotelResult").toString();
        hotels = "SELECT * FROM hotel WHERE HotelCity =  '" + cityName + "' ;";
        //System.out.println(name);
        rs = st.executeQuery(hotels);
        

        
    %>
    <body>
        <table border="1" class='center'>
            
            <tr>
                <th>Image</th> 
                <th>Hotel Name</th> 
                <th>Price</th> 
                <th>Available Rooms</th> 
                <th>Rating</th>
                <th>Stars</th>
                <th>Include Meals?</th>
                <th>City</th>
            </tr>
            <% while (rs.next()) {%>
            
            <tr>
                <td><a href='HotelInfo.jsp?id=<%=rs.getInt("HotelID")%>'><img src="getImage?id=<%=rs.getInt("HotelID")%>" width="250" height="150"></a></td>
                <td><%=rs.getString("HotelName")%></td>
                <td><%=rs.getInt("Expected Price")%></td>
                <td><%=rs.getInt("AvailableRoom")%></td>
                <td><%=rs.getInt("Rating")%></td>
                <td><%=rs.getInt("HotelStars")%></td>

                <%
                    int meals = rs.getInt("IncludeMeal");
                    if (meals == 0) {
                        mealsIncluded = "No";
                    } else {
                        mealsIncluded = "Yes";
                    }
                %>
                <td><%= mealsIncluded%></td>
                <td><%=rs.getString("HotelCity")%></td>
            </tr>

            <%}%>
        </table>

    </body>
</html>
