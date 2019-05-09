package beans;

import java.util.Date;

public class User {
	private int id;
	private String username;
	private String name;
	private String gender;
	private String description;
	private Date birthdate;
	private int age;
	private String photo;
  private String role;
  private Preferences preferences;
  private String password;
	private Boolean isLoggedIn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

  public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

  public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

  public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

  public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

  public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

  public Preferences getPreferences() {
		return preferences;
	}

	public void setPreferences(Preferences preferences) {
		this.preferences = preferences;
	}

  public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean isLoggedIn() {
		return isLoggedIn;
	}

	public void setLoggedIn(Boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}

	public int getAge(){
		return this.age
	}

	public void serAge(int age){
		this.age = age;
	}
}
