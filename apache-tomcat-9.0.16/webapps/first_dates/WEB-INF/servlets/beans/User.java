package beans;

public class User {
	private String username;
	private String name;
	private int gender;
	private String description;
	private String birthdate;
	private String photo;
  private int role;
  private Preferences preferences;
  private String password;

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

  public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

  public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

  public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

  public int getRole() {
		return role;
	}

	public void setRole(int role) {
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
}
