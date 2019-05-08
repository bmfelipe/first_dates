package beans;

import java.util.Date;

public class Availability {
	private int id;
	private Date date;
	private int offeredTables;
	private int availableTables;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

  public int getOfferedTables() {
		return offeredTables;
	}

	public void setOfferedTables(int offeredTables) {
		this.offeredTables = offeredTables;
	}

  public int getAvailableTables() {
		return availableTables;
	}

	public void setAvailableTables(int availableTables) {
		this.availableTables = availableTables;
	}

}
