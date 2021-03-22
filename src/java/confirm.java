/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ma 7m Ou D
 */
@WebServlet(urlPatterns = {"/confirm"})
public class confirm extends HttpServlet {

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
            Connection con = null;
            Statement stmt = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "");
            stmt = con.createStatement();
            
            String sql = "UPDATE reservation SET confirm='" + 1 + "' WHERE ReservationID=" + request.getSession().getAttribute("resid").toString();
            stmt.executeUpdate(sql);
            
            sql = "UPDATE room SET ReservedFrom='" + request.getSession().getAttribute("from").toString() + "' WHERE roomNo=" + request.getSession().getAttribute("roomid").toString();
            stmt.executeUpdate(sql);
            
            sql = "UPDATE room SET ReservedTo='" + request.getSession().getAttribute("to").toString() + "' WHERE roomNo=" + request.getSession().getAttribute("roomid").toString();
            stmt.executeUpdate(sql);
            
            sql = "UPDATE room SET RoomAvailable='" + 0 + "' WHERE roomNo=" + request.getSession().getAttribute("roomid").toString();
            stmt.executeUpdate(sql);
            
            sql = "UPDATE room SET CustomerID='" + request.getSession().getAttribute("css").toString() + "' WHERE roomNo=" + request.getSession().getAttribute("roomid").toString();
            stmt.executeUpdate(sql);
            out.print("Checked In Successfully");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(confirm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(confirm.class.getName()).log(Level.SEVERE, null, ex);
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
