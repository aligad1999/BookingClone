<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/hotelreservationsystem?SSL=false";
        String user = "root";
        String password = "root";
        List<String> list = new ArrayList<String>();
        con = DriverManager.getConnection(url, user, password);
        st = con.createStatement();
        rs = st.executeQuery("select HotelImage from hotel where HotelID = 2");
        if (rs.next()) {
            image = rs.getBlob("HotelImage");
            imgData = image.getBytes(1, (int) image.length());
            list.add(org.apache.commons.codec.binary.Base64.encodeBase64String(imgData));
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id");
            return;
        }
        request.setAttribute("pictureList", list);

    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            st.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>

    <body>
        <table>
            <c:forEach items="${pictureList}" var="picture">
                <tr>
                    <td><img src="data:image/jpg;base64,${picture}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>

</html>