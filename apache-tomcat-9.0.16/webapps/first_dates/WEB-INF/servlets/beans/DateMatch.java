package beans;

import java.util.Date;

public class DateMatch{

  private int id;
  private int dateOneId;
  private int dateTwoId;
  private String status;
  private Date[] dateRequest;
  private Date[] dateResponse;
  private String[] hourRequest;
  private String[] hourResponse;





	/**
	* Returns value of id
	* @return
	*/
	public int getId() {
		return id;
	}

	/**
	* Sets new value of id
	* @param
	*/
	public void setId(int id) {
		this.id = id;
	}

	/**
	* Returns value of dateOneId
	* @return
	*/
	public int getDateOneId() {
		return dateOneId;
	}

	/**
	* Sets new value of dateOneId
	* @param
	*/
	public void setDateOneId(int dateOneId) {
		this.dateOneId = dateOneId;
	}

	/**
	* Returns value of dateTwoId
	* @return
	*/
	public int getDateTwoId() {
		return dateTwoId;
	}

	/**
	* Sets new value of dateTwoId
	* @param
	*/
	public void setDateTwoId(int dateTwoId) {
		this.dateTwoId = dateTwoId;
	}

	/**
	* Returns value of status
	* @return
	*/
	public String getStatus() {
		return status;
	}

	/**
	* Sets new value of status
	* @param
	*/
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	* Returns value of e
	* @return
	*/
	public Date[] getDateRequest() {
		return dateRequest;
	}

	/**
	* Sets new value of e
	* @param
	*/
	public void setDateRequest(Date[] dateRequest) {
		this.dateRequest = dateRequest;
	}

	/**
	* Returns value of e
	* @return
	*/
	public Date[] getDateResponse() {
		return dateResponse;
	}

	/**
	* Sets new value of e
	* @param
	*/
	public void setDateResponse(Date[] dateResponse) {
		this.dateResponse = dateResponse;
	}

	/**
	* Returns value of g
	* @return
	*/
	public String[] getHourRequest() {
		return hourRequest;
	}

	/**
	* Sets new value of g
	* @param
	*/
	public void setHourRequest(String[] hourRequest) {
		this.hourRequest = hourRequest;
	}

	/**
	* Returns value of g
	* @return
	*/
	public String[] getHourResponse() {
		return hourResponse;
	}

	/**
	* Sets new value of g
	* @param
	*/
	public void setHourResponse(String[] hourResponse) {
		this.hourResponse = hourResponse;
	}
}
