package _05_model;

import java.util.Date;

public class Savecalendar {
	private Date targetDate; 
	@Override
	public String toString() {
		return "Savecalendar [targetDate=" + targetDate + ", email=" + email + ", eventID=" + eventID + "]";
	}
	private String email;
	private Integer eventID;
	public Date getTargetDate() {
		return targetDate;
	}
	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}
	
}
