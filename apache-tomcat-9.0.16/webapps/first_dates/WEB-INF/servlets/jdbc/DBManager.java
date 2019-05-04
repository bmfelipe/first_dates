package jdbc;

import beans.User;
import beans.DateMatch;
import beans.Preferences;
import java.util.Date;
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
import java.io.InputStream;

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

    public User searchUser(String username) throws SQLException {
        User user = new User();
        String query = "SELECT * FROM 19_comweb_21d.Users INNER JOIN 19_comweb_21d.UserAuth ON 19_comweb_21d.Users.id=19_comweb_21d.UserAuth.id WHERE username = ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        while (rs.next())
        {
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDescription(rs.getString("description"));
            user.setBirthdate(rs.getDate("birthdate"));
            user.setRole(rs.getString("role"));
            user.setPassword(rs.getString("password"));
            break;
        }

        close();

        return user;
    }

    public Boolean registerUser(User user) throws SQLException {
        Boolean registered = false;
        String query = "INSERT INTO 19_comweb_21d.Users (username, name, gender, birthdate, role) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getName());
        stmt.setString(3, user.getGender());
        stmt.setDate(4, new java.sql.Date(user.getBirthdate().getTime()));
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

    // public List<User> getRecommendations(int userId) throws SQLException{
    //   String query = "SELECT * FROM Preferences WHERE id = ?";
    //
    //   try(PreparedStatement st = connection.prepareStatement(query)){
    //     st.setInt(1,userId);
  	//     ResultSet rs = st.executeQuery();
    //     rs.next();
    //     Preferences preferences = new Preferences();
    //     preferences.setMinAge(rs.getInt("minAge"));
    //     preferences.setMaxAge(rs.getInt("maxAge"));
    //     preferences.sexPref(rs.getInt("sexPref"));
    //   }
    //   query = "SELECT id, username, name, gender, birthdate, photo,(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'2012-2-29')+1), '%Y')) AS age FROM Users WHERE age > ? and age < ? and gender = ? ORDER BY RAND() LIMIT 20";
    //
    //   List<User> recommendations = new ArrayList<User>();
    //   try(PreparedStatement st = connection.prepareStatement(query)){
    //     st.setInt(1,preferences.getMinAge());
    //     st.setInt(2,preferences.getMaxAge());
    //     st.setInt(3,preferences.getSexPref());
    //     ResultSet rs = st.executeQuery();
    //     while(rs.next()){
    //       User recommendation = new User();
    //       recommendation.setId(rs.getInt("id"));
    //       recommendation.setUsername(rs.getString("username"));
    //       recommendation.setName(rs.getString("name"));
    //       recommendation.setGender(rs.getInt("gender"));
    //       recommendation.setBirthdate(rs.getInt("birthdate"));
    //
    //       recommendations.add(recommendation);
    //     }
    //     return recommendations;
    //   }
    //   return null;
    // }
    //
    // public List<DateMatch> getDateList(int userId)throws SQLException {
    //   String query = "SELECT * FROM Dates WHERE (dateOneId or dateTwoId) = ?";
    //   List<DateMatch> dates = new ArrayList<DateMatch>();
    //   try(PreparedStatement st = connection.prepareStatement(query)){
  	//     st.setInt(1,userId);
  	//     ResultSet rs = st.executeQuery();
    //
    //
  	//     while(rs.next()){
    //       DateMatch dateMatch = new DateMatch();
    //       dateMatch.setId(rs.getInt("id"));
    //       dateMatch.setDateOneId(rs.getInt("dateOneId"));
    //       dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
    //       dateMatch.setStatus(rs.getString("status"));
    //       dateMatch.setDateRequest(rs.getArray("dateRequest"));
    //       dateMatch.setDateResponse(rs.getArray("dateResponse"));
    //       dateMatch.setHourRequest(rs.getArray("hourRequest"));
    //       dateMatch.setHourResponse(rs.getArray("hourResponse"));
    //
    //       dates.add(dateMatch);
	  //     }
    //     return dates;
	  //   }
    //   return null;
    // }
    //
    // public InputStream getImage(int id){
    //     String query = "SELECT photo FROM Users WHERE id = ?";
    //
    //     try(PreparedStatement st = connection.prepareStatement(query)){
    // 	    st.setInt(1,id);
    // 	    ResultSet rs = st.executeQuery();
    //
  	//       rs.next();
    //       InputStream in = rs.getBinaryStream("photo");
    //       return in;
  	//     }
    //     return null;
    // }
}
