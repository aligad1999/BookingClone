<%-- 
    Document   : HotelInfo
    Created on : Jan 12, 2021, 3:01:12 PM
    Author     : fsam5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Info</title>
    </head>
    <%

        int id = Integer.parseInt(request.getParameter("id"));

    %>
    <body>
        <h1>Hello World!</h1>
        <div>
            <iframe src="getLocation?id=<%= id %>"></iframe>
        </div>
        
        
        
    </body>
</html>
