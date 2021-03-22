<%-- 
    Document   : addhotel
    Created on : Jan 15, 2021, 2:48:52 PM
    Author     : Ma 7m Ou D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
      <script type="text/javascript">
         function showLocation(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            session.setAttribute("lat", latitude);
            session.setAttribute("long", longitude);
            alert("Latitude : " + latitude + " Longitude: " + longitude);
            
         }
         function errorHandler(err) {
            if(err.code == 1) {
               alert("Error: Access is denied!");
            } else if( err.code == 2) {
               alert("Error: Position is unavailable!");
            }
         }
         function getLocation(){
            if(navigator.geolocation){
               var options = {timeout:60000};               // timeout at 60000 milliseconds (60 seconds)

               navigator.geolocation.getCurrentPosition
               (showLocation, errorHandler, options);
            } else{
               alert("Sorry, browser does not support geolocation!");
            }
         }
      </script>
   
    </head>
    <body>
         <form action="addhotel" method="post" enctype="multipart/form-data">
            Enter hotel name : 
            <input type="text" name="hotelname" value="" /><br>
             Enter hotel country : 
            <input type="text" name="country" value="" /><br>
            contact :
            <input type="text" name="contact" value="" /><br>
             hotel stars:
             <input type="number" name="stars" value="" /><br>
            
             hotel pic: <br>
             <input type="file" name="photo" size="50"/><br>
              hotel location <br>
             
        <input type="submit" value="ADD" />
         </form>
    </body>
</html>
