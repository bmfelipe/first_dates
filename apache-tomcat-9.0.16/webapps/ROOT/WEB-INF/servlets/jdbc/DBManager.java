package jdbc;

import beans.User;
import beans.DateMatch;
import beans.Preferences;
import beans.Availability;
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

    public User searchUserById(int userId) throws SQLException{
      User user = new User();
      String query = "SELECT *, (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) AS age FROM Users WHERE id =?";
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setInt(1,userId);
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
        user.setAge(Integer.parseInt(rs.getString("age")));
        break;
      }

      return user;
    }

    public User searchUser(String username) throws SQLException {
      User user = new User();
      String query = "SELECT *, (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) AS age FROM 19_comweb_21d.Users INNER JOIN 19_comweb_21d.UserAuth ON 19_comweb_21d.Users.id=19_comweb_21d.UserAuth.id WHERE username = ?";
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
        user.setAge(Integer.parseInt(rs.getString("age")));
        break;
      }

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

      query = "SELECT dateOneId, dateTwoId FROM Dates WHERE dateOneId = ? OR ((dateOneId = ? OR dateTwoId = ?)  and status != 'Pendiente')";
      List<Integer> ids = new ArrayList<Integer>();

      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,userId);
        st.setInt(2,userId);
        st.setInt(3,userId);
        ResultSet rs = st.executeQuery();

        while(rs.next()){
          int id;
          if(rs.getInt("dateOneId") == userId){
            id = rs.getInt("dateTwoId");
          }else{
            id = rs.getInt("dateOneId");
          }
          ids.add(id);

        }
      }

      String numberElements;
      if(ids.size() > 0){
        numberElements = "AND id NOT IN (";
      }else{
        numberElements = "";
      }
      for(int i = 0; i< ids.size();i++){
        if(i == (ids.size()-1)){
          numberElements += "?)";
        }else{
          numberElements += "?, ";
        }

      }
      query = "SELECT id, username, name, gender, birthdate, photo FROM Users WHERE (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) >= ? and (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) <= ? and gender = ? AND role NOT LIKE 'Admin' "+numberElements+" ORDER BY RAND() LIMIT 20";

      int numId = 4;
      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,preferences.getMinAge());
        st.setInt(2,preferences.getMaxAge());
        st.setString(3,preferences.getSexPref());
        for(int uId :ids){
          st.setInt(numId,uId);
          numId++;

        }
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
      String query = "SELECT * FROM Dates WHERE (dateOneId = ? or dateTwoId = ?) AND status NOT IN ('Rechazado','Pendiente','Finalizado')";

      List<DateMatch> dates = new ArrayList<DateMatch>();
      try(PreparedStatement st = connection.prepareStatement(query)){
       st.setInt(1,userId);
       st.setInt(2,userId);
       ResultSet rs = st.executeQuery();

       while(rs.next()){
        DateMatch dateMatch = new DateMatch();
        dateMatch.setId(rs.getInt("id"));
        dateMatch.setDateOneId(rs.getInt("dateOneId"));
        dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
        dateMatch.setStatus(rs.getString("status"));
        dateMatch.setDateRequest(rs.getDate("dateRequest"));
        dateMatch.setDateResponse(rs.getDate("dateResponse"));
        dateMatch.setDateSetBy(rs.getInt("dateSetBy"));

        dates.add(dateMatch);
      }
      return dates;
    }
  }
    //Returns dates the user and a certain profile had
  public List<DateMatch> getProfileDateList(int userId,int profileId) throws SQLException{
    String query = "SELECT * FROM Dates WHERE (dateOneId = ? or dateTwoId = ?) AND (dateOneId =? or dateTwoId =?) AND status NOT LIKE 'Rechazado'";
    List<DateMatch> dates = new ArrayList<DateMatch>();
    try(PreparedStatement st = connection.prepareStatement(query)){
      st.setInt(1,userId);
      st.setInt(2,userId);
      st.setInt(3,profileId);
      st.setInt(4,profileId);
      ResultSet rs = st.executeQuery();
      while(rs.next()){
        DateMatch dateMatch = new DateMatch();
        dateMatch.setId(rs.getInt("id"));
        dateMatch.setDateOneId(rs.getInt("dateOneId"));
        dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
        dateMatch.setStatus(rs.getString("status"));
        dateMatch.setDateRequest(rs.getDate("dateRequest"));
        dateMatch.setDateResponse(rs.getDate("dateResponse"));
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

public Boolean insertAvailability (Availability availability) throws SQLException{
  Boolean inserted = false;
  String query = "INSERT INTO 19_comweb_21d.Availability (date, offeredTables, availableTables) VALUES (?, ?, ?)";
  PreparedStatement stmt = connection.prepareStatement(query);
  stmt.setDate(1, new java.sql.Date(availability.getDate().getTime()));
  stmt.setInt(2, availability.getOfferedTables());
  stmt.setInt(3, availability.getAvailableTables());

  int rowsAffected = stmt.executeUpdate();

  if(rowsAffected != 0){
    inserted = true;
  }

  return inserted;
}

public Availability searchAvailability (Date date) throws SQLException{
  Availability availability = new Availability();
  String query = "SELECT offeredTables, availableTables FROM 19_comweb_21d.Availability WHERE date = ?";
  PreparedStatement stmt = connection.prepareStatement(query);
  stmt.setDate(1, new java.sql.Date(date.getTime()));
  ResultSet rs = stmt.executeQuery();

  if (rs.next())
  {
    availability.setOfferedTables(rs.getInt("offeredTables"));
    availability.setAvailableTables(rs.getInt("availableTables"));
    availability.setDate(date);
  }
  else {
    availability = null;
  }

  return availability;
}

public Boolean updateAvailability (Availability availability) throws SQLException{
  Boolean updated = false;
  System.out.println(availability.getOfferedTables());
  System.out.println(availability.getAvailableTables());
  System.out.println(availability.getDate());
  String query = "UPDATE 19_comweb_21d.Availability SET offeredTables = ?, availableTables = ? WHERE date = ?";
  PreparedStatement stmt = connection.prepareStatement(query);
  stmt.setInt(1, availability.getOfferedTables());
  stmt.setInt(2, availability.getAvailableTables());
  stmt.setDate(3, new java.sql.Date(availability.getDate().getTime()));

  int rowsAffected = stmt.executeUpdate();

  if(rowsAffected != 0){
    updated = true;
  }

  return updated;
}

public Boolean updatePreferences(int id,int minAge,int maxAge,String sexPref){

  Boolean updated = false;
  String query ="SELECT COUNT(1) FROM table_name WHERE id=?";
  PreparedStatement stmt = connection.prepareStatement(query);
  stmt.setInt(1,id);
  ResultSet rs = stmt.executeQuery();
  int count = Integer.parseInt(rs);

  if(count==0){

    String query1 ="UPDATE Preferences SET minAge=?,  maxAge=?, sexPref=? WHERE id=?";
    PreparedStatement stmt1 = connection.prepareStatement(query1);
    stmt1.setInt(1,minAge);
    stmt1.setInt(2,maxAge);
    stmt1.setString(3,sexPref);
    stmt1.setInt(4,id);
    int rowsAffected = stmt1.executeUpdate();
    if(rowsAffected != 0){
      updated = true;
    }
    return updated;


  }else{
    String query2 ="INSERT INTO Preferences (minAge, maxAge, sexPref) VALUES (?, ?, ?)";
    PreparedStatement stmt2 = connection.prepareStatement(query2);
    stmt2.setInt(1,minAge);
    stmt2.setInt(2,maxAge);
    stmt2.setString(3,sexPref);
    updated = true;
    return updated;
  }
}



public User getUserInfo(int id) throws SQLException{
  String query = "SELECT id ,name, username, gender, description, (DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)+1), '%Y')) AS age FROM Users WHERE id = ?";
  User user = new User();

  try(PreparedStatement st = connection.prepareStatement(query)){
    st.setInt(1,id);
    ResultSet rs = st.executeQuery();

    if(rs.next()){
      user.setId(rs.getInt("id"));
      user.setUsername(rs.getString("username"));
      user.setName(rs.getString("name"));
      user.setGender(rs.getString("gender"));
      user.setDescription(rs.getString("description"));
      user.setAge(Integer.parseInt(rs.getString("age")));
    }else{
      return null;
    }

  }
  return user;
}

public DateMatch getDateInfo(int userId, int dateId) throws SQLException{
  String query = "SELECT * FROM Dates WHERE (dateOneId =? or dateTwoId =?) AND (dateOneId =? or dateTwoId  =?) AND status NOT IN ('Rechazado', 'Pending', 'Finalizado')";
  DateMatch date = new DateMatch();

  try(PreparedStatement st = connection.prepareStatement(query)){
    st.setInt(1,userId);
    st.setInt(2,userId);
    st.setInt(3,dateId);
    st.setInt(4,dateId);
    ResultSet rs = st.executeQuery();
    rs.next();


    date.setId(rs.getInt("id"));
    date.setDateOneId(rs.getInt("dateOneId"));
    date.setDateTwoId(rs.getInt("dateTwoId"));
    date.setStatus(rs.getString("status"));
    date.setDateRequest(rs.getDate("dateRequest"));
    date.setDateResponse(rs.getDate("dateResponse"));
    date.setDateSetBy(rs.getInt("dateSetBy"));

  }
  return date;
}

public DateMatch getDateInfoById(int dateId) throws SQLException{
  String query = "SELECT * FROM Dates WHERE id= ?";
  DateMatch date = new DateMatch();

  try(PreparedStatement st = connection.prepareStatement(query)){
    st.setInt(1,dateId);
    ResultSet rs = st.executeQuery();
    rs.next();


    date.setId(rs.getInt("id"));
    date.setDateOneId(rs.getInt("dateOneId"));
    date.setDateTwoId(rs.getInt("dateTwoId"));
    date.setStatus(rs.getString("status"));
    date.setDateRequest(rs.getDate("dateRequest"));
    date.setDateResponse(rs.getDate("dateResponse"));
    date.setDateSetBy(rs.getInt("dateSetBy"));

  }
  return date;
}

public boolean addDateDate(int dateInfoId, List<Date> dates, int userId) throws SQLException{
  DateMatch dateInfo = getDateInfoById(dateInfoId);
  String query;
  Date date = dates.get(0);
  connection.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
  connection.setAutoCommit(false);
  boolean success = false;
  int count = 0;
  if(dateInfo.getDateSetBy() == 0){

    query = "UPDATE Dates SET status = 'Fecha pendiente', dateRequest = ?, dateSetBy = ?  WHERE id = ? ";

    try(PreparedStatement st = connection.prepareStatement(query)){
      st.setDate(1, new java.sql.Date(date.getTime()));
      st.setInt(2,dateInfoId);
      st.setInt(3, userId);
      count = st.executeUpdate();
      if(count > 0)
        success = true;
    }
  }else{
    Availability dateAvailable = searchAvailability(date);

    if(dateAvailable == null){
      return false;
    }
    int tables = dateAvailable.getAvailableTables();
    if(tables == 0){
      query = "UPDATE Dates SET status = 'Aceptado', dateResponse = NULL, dateRequest = NULL, dateSetBy = NULL  WHERE id = ? ";

      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setInt(1,dateInfoId);
        count = st.executeUpdate();
        if(count > 0)
          success = true;
      }
    }else{

      query = "UPDATE Dates SET status = 'Fecha fijada', dateResponse = ?  WHERE id = ? ";

      try(PreparedStatement st = connection.prepareStatement(query)){
        st.setDate(1, new java.sql.Date(date.getTime()));
        st.setInt(2,dateInfoId);
        count = st.executeUpdate();
        if(count > 0){
          tables--;
          dateAvailable.setAvailableTables(tables);
          updateAvailability(dateAvailable);
          success = true;
        }

      }
    }

  }
  if(success){
   connection.commit();
 }else{
   connection.rollback();
 }
 connection.setAutoCommit(true);

 return success;
}

public int getCountPendingDates(Date date) throws SQLException
{
  int pendingDates = 0;
  String query = "SELECT COUNT(*) AS pendingDates FROM 19_comweb_21d.Dates WHERE status = 'Fecha pendiente' and dateRequest = ?";

  try(PreparedStatement st = connection.prepareStatement(query))
  {
    st.setDate(1, new java.sql.Date(date.getTime()));
    ResultSet rs = st.executeQuery();

    while(rs.next())
    {
      pendingDates = rs.getInt("pendingDates");
      break;
    }
    return pendingDates;
  }
}

public List<DateMatch> getConfirmedDateList(Date nowDate) throws SQLException
{
  List<DateMatch> dates = new ArrayList<DateMatch>();
  String query = "SELECT id, dateOneId, dateTwoId, dateRequest FROM 19_comweb_21d.Dates WHERE status = 'Fecha fijada' and dateRequest >= ? ORDER BY dateRequest ASC";

  try(PreparedStatement st = connection.prepareStatement(query))
  {
    st.setDate(1, new java.sql.Date(nowDate.getTime()));
    ResultSet rs = st.executeQuery();

    while(rs.next())
    {
      DateMatch dateMatch = new DateMatch();

      dateMatch.setId(rs.getInt("id"));
      dateMatch.setDateOneId(rs.getInt("dateOneId"));
      dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
      dateMatch.setDateRequest(rs.getDate("dateRequest"));

      dates.add(dateMatch);
    }
    return dates;
  }
}


public DateMatch getDaysUntilDate(int userId) throws SQLException{
  String query = "SELECT *,DATEDIFF(dateResponse,NOW()) AS days FROM Dates WHERE (dateOneId = ? OR dateTwoId = ?) AND status = 'Fecha Fijada' ORDER BY dateResponse ASC LIMIT 1";
  DateMatch dateMatch = new DateMatch();

  try(PreparedStatement st = connection.prepareStatement(query))
  {
    st.setInt(1,userId);
    st.setInt(2,userId);
    ResultSet rs = st.executeQuery();

    if(rs.next()){


      dateMatch.setId(rs.getInt("id"));
      dateMatch.setDateOneId(rs.getInt("dateOneId"));
      dateMatch.setDateTwoId(rs.getInt("dateTwoId"));
      dateMatch.setDateResponse(rs.getDate("dateResponse"));
      dateMatch.setDaysUntilDate(rs.getInt("days"));
    }else{
      return null;
    }

  }
  return dateMatch;

}

}
