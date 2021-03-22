<%-- 
    Document   : SearchResult
    Created on : Jan 11, 2021, 12:54:28 PM
    Author     : fsam5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search A Hotel</title>
        <style>
               input[type=number]{
                    width: 50px;
                } 
        </style>
    </head>
    <body>
        <h1>Search For a Hotel</h1>
        <form action="Search" method="POST">
            Destination City: <input type="text" name="cityName" required><br><br>
            Check In Date: <input type="date" name="checkIn"><br><br>
            Check Out Date: <input type="date" name="checkOut"><br><br>
            Number Of Adults: <input type="number" name="numAdults" min='0'><br><br>
            Number Of Children: <input type="number" name="numChildren" min='0'><br><br> 
            Number Of Rooms: <input type="number" name="numRooms" min='0'><br><br> 

            <input type="submit" value="Submit">
        </form>
    </body>
</html>
