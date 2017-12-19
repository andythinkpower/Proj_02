package _02_model.Bean;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ACTIVITY")
public class ActivityBean implements Serializable{

	//行程規畫 主表
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer activityID;
	private java.sql.Date actStartDate; 
	private String actRegion;
	private String actTitle;
	private String introduction;
	//預設public
	private boolean privacy=false;
	private Blob actPhoto;
	private Integer clickNumber;
	private String email;
	
	
	//一對多關係
	@OneToMany(
		mappedBy="activityBean",
		cascade= {CascadeType.REMOVE},
		fetch=FetchType.EAGER //不寫會發生lazily 狀況
		)
	private Set<ActivityDetailBean> activityDetails;
	
	public Set<ActivityDetailBean> getActivityDetails() {
		return activityDetails;
	}

	public void setActivityDetails(Set<ActivityDetailBean> activityDetails) {
		this.activityDetails = activityDetails;
	}
	
//	public static void main(String[] args) {
//		try {
//		HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();		
		//新增
//		ActivityBean insert=new ActivityBean();
//		insert.setActRegion("彰化");
//		insert.setActStartDate(new java.sql.Date(0));
//		insert.setActTitle("這是標題");
//		insert.setMemberID(1);
//		session.save(insert);
		
		//修改
//		ActivityBean update =session.get(ActivityBean.class,6);
//		update.setActTitle("修改過的標題");
//		update.setActRegion("綠島");
//		update.setActStartDate(new java.sql.Date(86400000));
		
//		//查詢
//		Query query=session.createQuery("from ActivityBean where memberID=1",ActivityBean.class);
//		List list =query.list();
//		
//		ActivityBean bean=(ActivityBean)list.get(1);
//		Set set=bean.getActivityDetails();
//		System.out.println(set.size());
//		
//		Iterator ite=set.iterator();
//		while(ite.hasNext())
//			System.out.println(ite.next());
		
		
//		for(int i=0;i<list.size();i++) {
//			System.out.println("第"+i+"項 : "+(ActivityBean)list.get(i));
//		}
		
		//刪除
//		ActivityBean delete=session.get(ActivityBean.class,1);
//		session.delete(delete);
		
//		HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//		}finally {
//			HibernateUtil.closeSessionFactory();
//		}
//		
//	}
		
	public Integer getActivityID() {
		return activityID;
	}
	public void setActivityID(Integer activityID) {
		this.activityID = activityID;
	}
	public java.sql.Date getActStartDate() {
		return actStartDate;
	}
	public void setActStartDate(java.sql.Date actStartDate) {
		this.actStartDate = actStartDate;
	}
	public String getActRegion() {
		return actRegion;
	}
	public void setActRegion(String actRegion) {
		this.actRegion = actRegion;
	}
	public String getActTitle() {
		return actTitle;
	}
	public void setActTitle(String actTitle) {
		this.actTitle = actTitle;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public boolean isPrivacy() {
		return privacy;
	}
	public void setPrivacy(boolean privacy) {
		this.privacy = privacy;
	}
	
	public Blob getActPhoto() {
		return actPhoto;
	}

	public void setActPhoto(Blob actPhoto) {
		this.actPhoto = actPhoto;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getClickNumber() {
		return clickNumber;
	}
	public void setClickNumber(Integer clickNumber) {
		this.clickNumber = clickNumber;
	}

	@Override
	public String toString() {
		return "ActivityBean [activityID=" + activityID + ", actStartDate=" + actStartDate + ", actRegion=" + actRegion
				+ ", actTitle=" + actTitle + ", introduction=" + introduction + ", privacy=" + privacy + ", actPhoto="
				+ actPhoto + ", clickNumber=" + clickNumber + ", email=" + email;
	}
	

}
