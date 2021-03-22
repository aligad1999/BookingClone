/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author ALI FCI
 */
@WebServlet("/SignupServlet")

public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            DbCommunication db_comm = new DbCommunication();
            int AdminID;
            int UserID;
            HttpSession session = request.getSession(true);

            SendEmail sendEmail = new SendEmail();
            String Password = sendEmail.generatePassword(8);
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            SendEmail.sendPasswordEmail(email, Password);

            String user = request.getParameter("user");

            if (user == null) { //admin = true
                
                AdminID = db_comm.accountCreation(Password, email, username, phone);
                JOptionPane.showMessageDialog(null, "if: AdminID = " + AdminID);

                session.setAttribute("AdminSignup", AdminID);
                String redirectURL = "HotelInsertion.jsp";
                response.sendRedirect(redirectURL);
            } 
            else {//admin = false user
                UserID = db_comm.accountCreation(Password, email, username, phone);
                JOptionPane.showMessageDialog(null, "else: UserID = " + UserID);

                session.setAttribute("AccCreationalMsg", UserID);
                String redirectURL = "LoginPage.jsp";
                response.sendRedirect(redirectURL);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
