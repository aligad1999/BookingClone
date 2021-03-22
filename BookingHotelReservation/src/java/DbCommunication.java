
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class DbCommunication extends HttpServlet {

    Statement st;
    ResultSet rs;

    public DbCommunication() throws ClassNotFoundException {
        st = DbConnection.createConnection();
    }

    ResultSet getHotelsInCountry(String countryName) throws SQLException {
        String query;
        query = "SELECT * FROM hotel WHERE HotelCountry = '" + countryName + "' ;";
        //System.out.println(name);

        rs = st.executeQuery(query);

        //JOptionPane.showMessageDialog(null, "Done Adding Bank account your current balance = " + currentBalance);
        return rs;
    }

    ResultSet getHotelFromID(int id) throws SQLException {
        String hotels;
        hotels = "SELECT * FROM hotel WHERE HotelCountry = " + id + " ;";
        //System.out.println(name);
        rs = st.executeQuery(hotels);

        //JOptionPane.showMessageDialog(null, "Done Adding Bank account your current balance = " + currentBalance);
        return rs;

    }

}
