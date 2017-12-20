package _02_model.Bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ACTIVITYDETAIL")
public class ActivityDetailBean implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer actDetail;
	private String note;
	private String times;
	private String budget="0";
	private String kinds;
	private String dates;
	private String longitude;
	private String latitude;
	private Integer activityID;
	
	@ManyToOne()
	@JoinColumn(
			name="activityID",
			referencedColumnName="activityID",
			insertable=false,
			updatable=false
	)
	private ActivityBean activityBean;
	
	public ActivityBean getActivityBean() {
		return activityBean;
	}

	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}

//	public static void main(String[] args) {
//		try {
//		HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		
		//新增
//		ActivityDetailBean insert=new ActivityDetailBean();
//		insert.setDates("8");
//		insert.setKinds("戶外");
//		insert.setBudget("87000");
//		insert.setNote("高美濕地");
//		insert.setTimes("停留2小時");
//		insert.setActivityID(3);
//		session.save(insert);
		
		//修改
//		ActivityDetailBean update =session.get(ActivityDetailBean.class,7);
//		update.setActivityID(6);
//		update.setNote("都會公園");
				
//		//查詢
//		Query query=session.createQuery("from ActivityDetailBean",ActivityDetailBean.class);
//		List list =query.list();
//		
//		for(int i=0;i<list.size();i++) {
//			System.out.println("第"+(i+1)+"項 : "+list.get(i));
//		}
		
		//刪除
//		ActivityDetailBean delete=session.get(ActivityDetailBean.class,7);
//		session.delete(delete);
//		
//			
//		
//		
//		
//		HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//		}finally {
//			HibernateUtil.closeSessionFactory();
//		}
//		
//	}
	
	public Integer getActDetail() {
		return actDetail;
	}
	public void setActDetail(Integer actDetail) {
		this.actDetail = actDetail;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public Integer getActivityID() {
		return activityID;
	}
	public void setActivityID(Integer activityID) {
		this.activityID = activityID;
	}	
	
	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	@Override
	public String toString() {
		return "ActivityDetailBean [actDetail=" + actDetail + ", note=" + note + ", times=" + times + ", budget="
				+ budget + ", kinds=" + kinds + ", dates=" + dates + ", longitude=" + longitude + ", latitude="
				+ latitude + ", activityID=" + activityID  + "]";
	}
	
	

}
