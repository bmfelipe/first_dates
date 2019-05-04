package jdbc;

import beans.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
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
        DataSource ds = (DataSource) envCtx.lookup("jdbc/First_dates");
        connection = ds.getConnection();
      } catch(SQLException|NamingException e) {
        e.printStackTrace();
      }
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
        String dbPassword = null;
        String query = "SELECT * FROM 19_comweb_21d.Users INNER JOIN 19_comweb_21d.UserAuth ON 19_comweb_21d.Users.id=19_comweb_21d.UserAuth.id WHERE username = ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        while (rs.next())
        {
            dbPassword = rs.getString("password");
            break;
        }

        close();

        return dbPassword;
    }

    public Boolean registerUser(User user) throws SQLException {
        Boolean registered = false;
        String query = "INSERT INTO 19_comweb_21d.Users (username, name, gender, birthdate, role) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getName());
        stmt.setString(3, user.getGender());
        stmt.setString(4, user.getBirthdate());
        stmt.setString(5, "Usuario");
        int rowsAffected = stmt.executeUpdate();

        String query2 = "INSERT INTO 19_comweb_21d.UserAuth (id, password) VALUES (LAST_INSERT_ID(), ?);";
        PreparedStatement stmt2 = connection.prepareStatement(query2);
        stmt2.setString(1, user.getPassword());
        rowsAffected = stmt2.executeUpdate();

        if(rowsAffected != 0){
          registered = true;
        }

        close();

        return registered;
    }
}
