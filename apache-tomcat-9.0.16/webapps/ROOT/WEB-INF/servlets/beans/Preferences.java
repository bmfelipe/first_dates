package beans;

public class Preferences {
	private int minAge;
	private int maxAge;
  private int sexPref;

  public int getMinAge() {
		return minAge;
	}

	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}

  public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}

  public int getSexPref() {
		return sexPref;
	}

	public void setSexPref(int sexPref) {
		this.sexPref = sexPref;
	}
}
