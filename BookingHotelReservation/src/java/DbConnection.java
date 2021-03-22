import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServlet;
import javax.swing.JOptionPane;

public class DbConnection extends HttpServlet {

    private static Statement st;
    private static Connection con;

    public static Statement createConnection() throws ClassNotFoundException {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem", "root", "root");
            st = con.createStatement();

            if (st.getMoreResults()) {
                JOptionPane.showMessageDialog(null, "Connected to the database!!");

            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "SQLException in Connecting to the database " + e);

        }
        return st;

    }

}
