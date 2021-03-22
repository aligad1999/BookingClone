
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServlet;
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

    public boolean validateLogin(String email, String Password) {
        try {

            String str_qry = "select * from user where Email = '" + email + "' AND password = '" + Password + "'";
            out.println("Given query is : " + str_qry);
            ResultSet rst = st.executeQuery(str_qry);

            while (rst.next()) {
                JOptionPane.showMessageDialog(null, "rst.next() ");
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
            JOptionPane.showMessageDialog(null, "SQLException " + e);
        }

        return false;

    }

    public int accountCreation(String Password, String Email, String UserName, String PhoneNo) {
        int ID = 0;
        try {
            String ins_qry = "INSERT INTO user(password,Email,UserName,PhoneNo) VALUES ('" + Password + "','" + Email + "','" + UserName + "','" + PhoneNo + "')";
            System.out.println("Given query is : " + ins_qry);
            st.executeUpdate(ins_qry);

            String acct_no_qry = "select MAX(UserID) AS UserID from user";
            System.out.println("Given query is : " + acct_no_qry);
            ResultSet UserID = st.executeQuery(acct_no_qry);
            JOptionPane.showMessageDialog(null, "AccountCreation Done " + UserID);

            if (UserID.next()) {
                ID = UserID.getInt("UserID");
                JOptionPane.showMessageDialog(null, "DB communication UserID is " + ID);
                return ID;
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "SQLException: " + e);
            System.err.println(e);
        }
        return ID;
    }

    public int isAdmin(String email) throws SQLException {

        String str_qry = "select HotelID from user where Email = '" + email + "'";
        ResultSet rst = st.executeQuery(str_qry);

        if (rst.next()) {
            if (rst.getString("HotelID") != null) {
                
                JOptionPane.showMessageDialog(null, "rst.getInt(\"HotelID\") " + rst.getInt("HotelID"));
                return rst.getInt("HotelID");
            }
//            return rst.getBoolean("isAdmin");
        }
        return 0;
    }

    public int getUserID(String email) throws SQLException {

        String str_qry = "select UserID from user where Email = '" + email + "'";
        out.println("Given query is : " + str_qry);
        ResultSet rst = st.executeQuery(str_qry);

        if (rst.next()) {
            return rst.getInt("UserID");
        }
//            return rst.getBoolean("isAdmin");
        return 0;

    }

}
