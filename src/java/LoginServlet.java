
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            HttpSession session = request.getSession(true);

            DbCommunication db_comm = new DbCommunication();
            boolean isLogin = db_comm.validateLogin(email, password);

            int UserID = db_comm.getUserID(email);
                    
            if (isLogin==true) {
                    
                JOptionPane.showMessageDialog(null, "isLogin if condition " + isLogin);

                int isAdmin = db_comm.isAdmin(email);

                if (isAdmin != 0) { //admin
                    JOptionPane.showMessageDialog(null, "IS admin " + isAdmin);
                    session.setAttribute("UserID", UserID);
                    session.setAttribute("HotelID", isAdmin);

                    String redirectURL = "home.jsp";
                    response.sendRedirect(redirectURL);
                    
                } 
                else {    //user       
                                        
                    JOptionPane.showMessageDialog(null, "Not Admin " + isAdmin);
                    session.setAttribute("UserID", UserID);
                    session.setAttribute("HotelID", isAdmin);

                    String redirectURL = "SearchPage.jsp";
                    response.sendRedirect(redirectURL);
                }

            } 
            else {
                String redirectURL = "login.jsp";
                response.sendRedirect(redirectURL);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
