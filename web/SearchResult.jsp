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
        String url = "jdbc:mysql://localhost:3306/hotelreservationsystem?zeroDateTimeBehavior=convertToNull";
        String user = "root";
        String password = "";
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
        
        <a href="SearchPage.jsp"><button class="btn btn-secondary" style="display: block; float: right; margin-bottom: 15px">Back to Search</button></a>

        <% while (rs.next()) {%>
        
        <div class="card w-100" style="margin-bottom: 20px; border-style: solid;  border-width: 10px 10px;">
            <div class="card-header"><a href='HotelInfo.jsp?id=<%=rs.getInt("HotelID")%>'><img src="getImage?id=<%=rs.getInt("HotelID")%>" width="250" height="150"></a></div>
            <div class="card-body">
                <h5 class="card-title"><%=rs.getString("HotelName")%></h5>
                <p class="card-text">Expected Price : <%=rs.getInt("Expected Price")%></p>
                <p class="card-text">Rating : <%=rs.getInt("Rating")%></p>
                <p class="card-text">Hotel Stars : <%=rs.getInt("HotelStars")%></p>
                <p class="card-text">Hotel City : <%=rs.getString("HotelCity")%></p>
                <form action="AvailableRooms" method="POST">
                    <p class="card-text">Expected Price : <%=rs.getInt("Expected Price")%></p>
                    <input type="hidden" name="HotelID" class="card-title" value="<%=rs.getInt("HotelID")%>">
                    <input type="submit" class="btn btn-success" value="I'll Reserve">
                </form>
            </div>
        </div>

        <%
            int meals = rs.getInt("IncludeMeal");
            if (meals == 0) {
                mealsIncluded = "No";
            } else {
                mealsIncluded = "Yes";
            }
        %>

    <%}%>

</body>
</html>
