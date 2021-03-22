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
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ma 7m Ou D
 */
@WebServlet(urlPatterns = {"/room"})
public class room extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("bedno") != null) {
                int n = Integer.valueOf(request.getParameter("bedno"));
                Connection con = null;
                Statement Stmt = null;
                String i = request.getSession().getAttribute("session_roomid").toString();
                int id = Integer.valueOf(i);
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
                Stmt = con.createStatement();
                String sql = "UPDATE room SET bedsNo ='" + n + "' WHERE RoomNo=" + id+"AND HotelID="+request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                sql = "UPDATE room SET RoomPrice='" + Integer.valueOf(request.getParameter("price")) + "' WHERE RoomNo=" + id+"AND HotelID="+request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                sql = "UPDATE room SET RoomInformation='" + request.getParameter("information") + "' WHERE RoomNo=" + id+"AND HotelID="+request.getSession().getAttribute("HotelID").toString();
                Stmt.executeUpdate(sql);
                response.sendRedirect("updateroom.jsp");

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(room.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(room.class.getName()).log(Level.SEVERE, null, ex);
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
