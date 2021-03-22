/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ma 7m Ou D
 */
@WebServlet(name = "addhotel", urlPatterns = {"/addhotel"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class addhotel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             if (request.getParameter("hotelname") != null) {
               out.print("ff");
                Part part = request.getPart("photo");
     
            Connection con = null;  
            PreparedStatement pstmt = null;
            Statement stmt = null;
            
            Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root","");
               pstmt = con.prepareStatement("insert into hotel(AdminID ,HotelName ,contact ,HotelStars ,HotelImage ,HotelLocation ,HotelCountry  ) values(?,?,?,?,?,?,?)");
              pstmt.setInt(1, Integer.valueOf(request.getSession().getAttribute("AdminSignup").toString()));
                pstmt.setString(2, request.getParameter("hotelname"));
                pstmt.setString(3,request.getParameter("contact") );
                pstmt.setInt(4,Integer.valueOf(request.getParameter("stars")));
                pstmt.setString(7, request.getParameter("country"));
                pstmt.setString(6,request.getSession().getAttribute("lat").toString()+","+request.getSession().getAttribute("long").toString() );
InputStream is = part.getInputStream();
                pstmt.setBlob(5, is);
                int count = pstmt.executeUpdate();
                
                        String sql = "select MAX(HotelID) AS HotelID from hotel";
                        stmt=con.createStatement();
            ResultSet RS = stmt.executeQuery(sql);
            if(RS.next()){
               int h= RS.getInt("hotelid");
                sql = "UPDATE user  SET HotelID ='" + h + "' WHERE UserID=" +Integer.valueOf(request.getSession().getAttribute("AdminSignup").toString()) ;
                stmt.executeUpdate(sql);
            }
                if (count > 0) {
                    out.println("insert successfully");
                } else {
                    out.println("not successfully");
                }
           
                
                response.sendRedirect("index.html");

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addhotel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addhotel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
