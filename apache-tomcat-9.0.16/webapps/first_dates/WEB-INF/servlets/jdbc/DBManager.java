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
        String query = "SELECT * FROM 19_comweb_21d.Users INNER JOIN 19_comweb_21d.UserAuth ON 19_comweb_21d.Users.id=19_comweb_21d.UserAuth.id WHERE username = '" + username + "'";
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
        Boolean registered = false;
        String query = "INSERT INTO 19_comweb_21d.Users (username, name, gender, birthdate, role) VALUES ('"+user.getUsername()+"', '"+user.getName()+"', "+user.getGender()+", '"+user.getBirthdate()+"', 1)";
        Statement stmt = connection.createStatement();
        int rowsAffected = stmt.executeUpdate(query);

        String query2 = "INSERT INTO 19_comweb_21d.UserAuth (id, password) VALUES (LAST_INSERT_ID(), '"+user.getPassword()+"');";
        Statement stmt2 = connection.createStatement();
        rowsAffected = stmt2.executeUpdate(query2);

        if(rowsAffected != 0){
          registered = true;
        }

        close();

        return registered;
    }
    /*
    public int getStock(int bookId) throws SQLException {
    	String query = "SELECT cantidad FROM Existencias WHERE libro =?";
    	int cantidad = 0;
    	try(PreparedStatement st = connection.prepareStatement(query)){
  	    st.setInt(1,bookId);
  	    ResultSet rs = st.executeQuery();
  	    while(rs.next()){
	        cantidad = rs.getInt("cantidad");
	      }
	    }
      return cantidad;
    }
    */
    public User getRecommendations(int userId) throws SQLException{
      String query = "SELECT * FROM Preferences WHERE id = ?";

      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
  	    ResultSet rs = st.executeQuery();
        rs.next();
        Preferences preferences = new Preferences();
        preferences.setMinAge(rs.getInt("minAge"));
        preferences.setMaxAge(rs.getInt("maxAge"));
        preferences.sexPref(rs.getInt("sexPref"));
      }
      String query = "SELECT id, username, name, gender, birthdate, photo,(DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'2012-2-29')+1), '%Y')) AS age FROM Users WHERE age > ? and age < ? and gender = ? ORDER BY RAND() LIMIT 20";

      List<User> recommendations = new ArrayList<User>();
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,preferences.getMinAge());
        st.setInt(2,preferences.getMaxAge());
        st.setInt(3,preferences.getSexPref());
        while(rs.next()){
          User recommendation = new User();
          recommendation.setId(rs.getInt("id"));
          recommendation.setUsername(rs.getString("username"));
          recommendation.setName(rs.getString("name"));
          recommendation.setGender(rs.getInt("gender"));
          recommendation.setBirthdate(rs.getInt("birthdate"));

          recommendations.add(recommendation);
        }
        return recommendations;
      }
      return null;
    }

    public List<DateMatch> getDateList(int userId)throws SQLException {
      String query = "SELECT * FROM Dates WHERE (dateOneId or dateTwoId) = ?";
      List<DateMatch> dates = new ArrayList<DateMatch>();
      try(PreparedStatement st = connection.prepareStatement(query)){
  	    st.setInt(1,userId);
  	    ResultSet rs = st.executeQuery();


  	    while(rs.next()){
          DateMatch dateMatch = new Date();
          dateMatch.setId(rs.getInt("id"));
          dateMatch.setDateOneId(rs.getInt("dateOneId"));
          dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
          dateMatch.setStatus(rs.getString("status"));
          dateMatch.setDateRequest(rs.getArray("dateRequest"));
          dateMatch.setDateResponse(rs.getArray("dateResponse"));
          dateMatch.setHourRequest(rs.getArray("hourRequest"));
          dateMatch.setHourResponse(rs.getArray("hourResponse"));

          dates.add(dateMatch);
	      }
        return dates;
	    }
      return null;
    }

    public InputStream getImage(int id){
        String query = "SELECT photo FROM Users WHERE id = ?";

        try(PreparedStatement st = connection.prepareStatement(query)){
    	    st.setInt(1,userId);
    	    ResultSet rs = st.executeQuery();
          InputStream in = new InputStream();

  	      rs.next();
          in = rs.getBinaryStream("photo");
          return in;
  	    }
        return null;
    }
}

