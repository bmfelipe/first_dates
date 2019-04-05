package jdbc;

import beans.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.DriverManager;

public class DBManager implements AutoCloseable {

    private Connection connection;

    public DBManager() throws SQLException {
        connect();
    }

    private void connect() throws SQLException{
      try {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/FirstDates");
        connection = ds.getConnection();
      } catch(SQLException|NamingException e) {
        e.printStackTrace();
      }
      /*try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/first_dates", "root", "Lopez_10");
      } catch(ClassNotFoundException e) {
        e.printStackTrace();
      }*/
    }

    /**
     * Close the connection to the database if it is still open.
     *
     */
    public void close() throws SQLException {
        if (connection != null) {
            connection.close();
        }
        connection = null;
    }

    public String searchUserPassword(String username) throws SQLException {
        // TODO: program this method
        String dbPassword = null;
        String query = "SELECT * FROM first_dates.Users INNER JOIN first_dates.UserAuth ON first_dates.Users.id=first_dates.UserAuth.id WHERE username = '" + username + "'";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next())
        {
            dbPassword = rs.getString("password");
            break;
        }

        close();

        return dbPassword;
    }

    public Boolean registerUser(User user) throws SQLException {
        // TODO: program this method
        Boolean registered = false;
        /*String query = "SELECT * FROM first_dates.Users INNER JOIN first_dates.UserAuth ON first_dates.Users.id=first_dates.UserAuth.id WHERE username = '" + username + "'";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next())
        {
            dbPassword = rs.getString("password");
            break;
        }*/

        close();

        return registered;
    }
}
