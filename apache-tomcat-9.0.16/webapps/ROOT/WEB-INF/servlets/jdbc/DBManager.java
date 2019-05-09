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

    public DBManager() throws SQLException, NamingException {
        connect();
    }

    private void connect() throws SQLException, NamingException{

        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/First_dates");
        connection = ds.getConnection();

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
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
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

    public List<User> getRecommendations(int userId) throws SQLException{
      String query = "SELECT * FROM Preferences WHERE id = ?";
      Preferences preferences = new Preferences();
      List<User> recommendations = new ArrayList<User>();
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
  	    ResultSet rs = st.executeQuery();
        if(rs.next()==false){
          return recommendations;
        }

        preferences.setMinAge(rs.getInt("minAge"));
        preferences.setMaxAge(rs.getInt("maxAge"));
        preferences.setSexPref(rs.getString("sexPref"));
      }
      query = "SELECT id, username, name, gender, birthdate, photo FROM Users WHERE (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) >= ? and (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) <= ? and gender = ? ORDER BY RAND() LIMIT 20";


      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,preferences.getMinAge());
        st.setInt(2,preferences.getMaxAge());
        st.setString(3,preferences.getSexPref());
        ResultSet rs = st.executeQuery();
        while(rs.next()){
          User recommendation = new User();
          recommendation.setId(rs.getInt("id"));
          recommendation.setUsername(rs.getString("username"));
          recommendation.setName(rs.getString("name"));
          recommendation.setGender(rs.getString("gender"));
          recommendation.setBirthdate(rs.getDate("birthdate"));

          recommendations.add(recommendation);
        }

        return recommendations;
      }
      //return null;
    }

    public List<DateMatch> getDateList(int userId)throws SQLException {
      String query = "SELECT * FROM Dates WHERE (dateOneId or dateTwoId) = ? AND status NOT LIKE 'Rechazado'";

      List<DateMatch> dates = new ArrayList<DateMatch>();
      try(PreparedStatement st = connection.prepareStatement(query)){
  	    st.setInt(1,userId);
  	    ResultSet rs = st.executeQuery();

  	    while(rs.next()){
          DateMatch dateMatch = new DateMatch();
          dateMatch.setId(rs.getInt("id"));
          dateMatch.setDateOneId(rs.getInt("dateOneId"));
          dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
          dateMatch.setStatus(rs.getString("status"));
          dateMatch.setDateRequest(rs.getDate("dateRequest"));
          dateMatch.setDateResponse(rs.getDate("dateResponse"));
          dateMatch.setHourRequest(rs.getString("hourRequest"));
          dateMatch.setHourResponse(rs.getString("hourResponse"));

          dates.add(dateMatch);
	      }
        return dates;
	    }
      //return null;
    }
    //Returns dates the user and a certain profile had
    public List<DateMatch> getProfileDateList(int userId,int profileId) throws SQLException{
      String query = "SELECT * FROM Dates WHERE (dateOneId or dateTwoId) = ? AND (dateOneId or dateTwoId) =? AND status NOT LIKE 'Rechazado'";
      List<DateMatch> dates = new ArrayList<DateMatch>();
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
        st.setInt(2,profileId);
  	    ResultSet rs = st.executeQuery();
        while(rs.next()){
          DateMatch dateMatch = new DateMatch();
          dateMatch.setId(rs.getInt("id"));
          dateMatch.setDateOneId(rs.getInt("dateOneId"));
          dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
          dateMatch.setStatus(rs.getString("status"));
          dateMatch.setDateRequest(rs.getDate("dateRequest"));
          dateMatch.setDateResponse(rs.getDate("dateResponse"));
          dateMatch.setHourRequest(rs.getString("hourRequest"));
          dateMatch.setHourResponse(rs.getString("hourResponse"));
          dates.add(dateMatch);
	      }
        return dates;

      }


    }

    public InputStream getImage(int id)throws SQLException{
        String query = "SELECT photo FROM Users WHERE id = ?";

        try(PreparedStatement st = connection.prepareStatement(query)){
    	    st.setInt(1,id);
    	    ResultSet rs = st.executeQuery();

  	      rs.next();
          InputStream in = rs.getBinaryStream("photo");
          return in;
  	    }
        //return null;
    }

    public String getUserName(int id)throws SQLException{
      String query = "SELECT name FROM Users WHERE id = ?";

      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,id);
        ResultSet rs = st.executeQuery();

        rs.next();
        String userName = rs.getString("name");
        return userName;
      }
    }

    public Boolean addLike(int userId, int dateId) throws SQLException{
      String query = "SELECT * FROM Dates WHERE ((dateOneId = ? and dateTwoId = ?) or (dateOneId = ? and dateTwoId = ?))";
      Boolean created;
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
        st.setInt(2,dateId);
        st.setInt(3,dateId);
        st.setInt(4,userId);
        ResultSet rs = st.executeQuery();
        if(rs.next() == false){
          created = false;
        }else{
          created = true;
          if(rs.getString("status") == "Rechazado"){
            return true;
          }
        }
      }
      if(created){
        query = "UPDATE Dates SET status = 'Aceptado' WHERE ((dateOneId = ? and dateTwoId = ?) or (dateOneId = ? and dateTwoId = ?))";
        try(PreparedStatement st = connection.prepareStatement(query)){
          st.setInt(1,userId);
          st.setInt(2,dateId);
          st.setInt(3,dateId);
          st.setInt(4,userId);
          int rows = st.executeUpdate();

        }
      }else{
        query = "INSERT INTO Dates (dateOneId, dateTwoId, status) VALUES(?,?,?)";
        try(PreparedStatement st = connection.prepareStatement(query)){
          st.setInt(1,userId);
          st.setInt(2,dateId);
          st.setString(3,"Pendiente");
          int rows = st.executeUpdate();

        }
      }
      return true;
    }

    public Boolean addDislike(int userId, int dateId) throws SQLException{
      String query = "SELECT * FROM Dates WHERE ((dateOneId = ? and dateTwoId = ?) or (dateOneId = ? and dateTwoId = ?))";
      Boolean created;
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
        st.setInt(2,dateId);
        st.setInt(3,dateId);
        st.setInt(4,userId);
        ResultSet rs = st.executeQuery();
        if(rs.next() == false){
          created = false;
        }else{
          created = true;
          if(rs.getString("status") == "Rechazado"){
            return true;
          }
        }
      }
      if(created){
        query = "UPDATE Dates SET status = 'Rechazado' WHERE ((dateOneId = ? and dateTwoId = ?) or (dateOneId = ? and dateTwoId = ?))";
        try(PreparedStatement st = connection.prepareStatement(query)){
          st.setInt(1,userId);
          st.setInt(2,dateId);
          st.setInt(3,dateId);
          st.setInt(4,userId);
          int rows = st.executeUpdate();

        }
      }else{
        query = "INSERT INTO Dates (dateOneId, dateTwoId, status) VALUES(?,?,?)";
        try(PreparedStatement st = connection.prepareStatement(query)){
          st.setInt(1,userId);
          st.setInt(2,dateId);
          st.setString(3,"Rechazado");
          int rows = st.executeUpdate();

        }
      }
      return true;
    }
}
