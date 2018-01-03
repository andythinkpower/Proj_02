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
	private Date DtStart; // 5.活動開始時間
	private Date DurationEnd; // 6.活動結束時間
	private Date TimeStart; //7.場次開始時間
	private Date InsertTime;//8.更新時間
	private String Address;//9地址
	private String ShowGroupName; // 10.演出單位
	private String ImageFile; // 11. 圖片
	private String EventTypeID; // 12.連絡人
	private String VContent; // 13.活動內容
	private Date DurationStart;

	private String AreaID;
	private String CityID;
	private Integer IsBlock;
	// ==============================================================
	
	// ====================getter跟setter=============================
	
	public Integer getIsBlock() {
		return IsBlock;
	}
	public void setIsBlock(Integer isBlock) {
		IsBlock = isBlock;
	}
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
	public Date getDtStart() {
		return DtStart;
	}
	public void setDtStart(Date dtStart) {
		DtStart = dtStart;
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
	public String getEventTypeID() {
		return EventTypeID;
	}
	public void setEventTypeID(String eventTypeID) {
		EventTypeID = eventTypeID;
	}
	public Date getTimeStart() {
		return TimeStart;
	}
	public void setTimeStart(Date timeStart) {
		TimeStart = timeStart;
	}
	public Date getInsertTime() {
		return InsertTime;
	}
	public void setInsertTime(Date insertTime) {
		InsertTime = insertTime;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Date getDurationStart() {
		return DurationStart;
	}
	public void setDurationStart(Date durationStart) {
		DurationStart = durationStart;
	}
	public String getVContent() {
		return VContent;
	}
	public void setVContent(String vContent) {
		VContent = vContent;
	}
	public String getAreaID() {
		return AreaID;
	}
	public void setAreaID(String areaID) {
		AreaID = areaID;
	}
	public String getCityID() {
		return CityID;
	}
	public void setCityID(String cityID) {
		CityID = cityID;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
