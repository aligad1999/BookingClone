<%-- 
    Document   : search
    Created on : Jan 13, 2021, 11:30:01 PM
    Author     : Ma 7m Ou D
--%>

<%@page import="java.sql.*"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><form>
       enter client ID :
       <input type="text" name="client" value="" />
       <input type="submit" value="search" />
        </form>
       <%
           String cus=request.getParameter("client");
           if(cus!=null){
               int clientID=Integer.valueOf(cus);
       String done = request.getSession().getAttribute("session_hotelid").toString();
            int hotelId=  Integer.valueOf(done);
            Connection con = null;  
            Statement Stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root","");
               Stmt = con.createStatement();
       String sql = "SELECT * FROM reservation WHERE HotelID =" + hotelId;
            ResultSet RS = Stmt.executeQuery(sql);
       while(RS.next()){
           int n=Integer.valueOf(RS.getString("CustomerID"));
           if(n==clientID){      
               sql = "SELECT * FROM user WHERE UserID = " + clientID;
             RS = Stmt.executeQuery(sql);
            %>
            <table border="1">
            <tr>
                <th>Name</th> 
                <th>Email</th>
               <th>Phone No</th> 
            </tr><%
            while(RS.next()){%>
            <tr>
                <td><%=RS.getString("UserName")%></td>
                <td><%=RS.getString("Email")%></td>
                <td><%=RS.getString("PhoneNo")%></td>         
            </tr></table><%
           }}
       }
           }%>
           <a href="home.jsp">home</a>
    </body>
</html>
