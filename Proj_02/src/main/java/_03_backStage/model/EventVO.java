package _03_backStage.model;

import java.util.Date;

public class EventVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L; // 沒寫不會怎樣,寫了更好

	public EventVO() {
	} // 不帶參數的建構子

	// ====================private實例變數=============================
	
	private Integer EventID; // 1.活動編號
	private String EventName; // 2.活動名稱
	private String Fee; // 3.票價
	private String IsCharge; // 4.是否免費
//	private Integer ProductListingBook_Quantity; // 5.
	private Date DurationStart; // 5.活動開始時間
	private Date DurationEnd; // 6.活動結束時間
	private String ShowGroupName; // 7.演出單位
	private String ImageFile; // 8. 圖片
	private String ContactName; // 9.連絡人
	private String BriefIntroduction; // 10.簡介

	// ==============================================================
	
	// ====================getter跟setter=============================
	
	public Integer getEventID() {
		return EventID;
	}
	public void setEventID(Integer eventID) {
		EventID = eventID;
	}
	public String getEventName() {
		return EventName;
	}
	public void setEventName(String eventName) {
		EventName = eventName;
	}
	public String getFee() {
		return Fee;
	}
	public void setFee(String fee) {
		Fee = fee;
	}
	public String getIsCharge() {
		return IsCharge;
	}
	public void setIsCharge(String isCharge) {
		IsCharge = isCharge;
	}
	public Date getDurationStart() {
		return DurationStart;
	}
	public void setDurationStart(Date durationStart) {
		DurationStart = durationStart;
	}
	public Date getDurationEnd() {
		return DurationEnd;
	}
	public void setDurationEnd(Date durationEnd) {
		DurationEnd = durationEnd;
	}
	public String getShowGroupName() {
		return ShowGroupName;
	}
	public void setShowGroupName(String showGroupName) {
		ShowGroupName = showGroupName;
	}
	public String getImageFile() {
		return ImageFile;
	}
	public void setImageFile(String imageFile) {
		ImageFile = imageFile;
	}
	public String getContactName() {
		return ContactName;
	}
	public void setContactName(String contactName) {
		ContactName = contactName;
	}
	public String getBriefIntroduction() {
		return BriefIntroduction;
	}
	public void setBriefIntroduction(String briefIntroduction) {
		BriefIntroduction = briefIntroduction;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
