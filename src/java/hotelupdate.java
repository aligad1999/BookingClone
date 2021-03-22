/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;

/**
 *
 * @author Ma 7m Ou D
 */
@WebServlet(urlPatterns = {"/hotelupdate"})
public class hotelupdate extends HttpServlet {

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
           Connection con = null;  
            Statement Stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root","");
               Stmt = con.createStatement();
          String sql = "UPDATE hotel SET HotelStars ='" + Integer.valueOf(request.getParameter("HotelStars")) + "' WHERE HotelID=" + request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                sql = "UPDATE hotel SET contact='" + request.getParameter("contact") + "' WHERE HotelID=" + request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                sql = "UPDATE hotel SET branchinformation='" + request.getParameter("information") + "' WHERE HotelID=" + request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                
                out.print("done !");
                out.print("<a href=\"home.jsp\">home</a>");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(hotelupdate.class.getName()).log(Level.SEVERE, null, ex);
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
