package _01_member.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Entity
@Table(name="regions")
public class RegionsBean {
	
	@ManyToMany
	@JoinTable(
			name="LIKEREGIONS",
			joinColumns= {@JoinColumn(name="REGION")},
			inverseJoinColumns= {@JoinColumn(name="MEMBEREMAIL")})
	private Set<MemberBean> members;	
	public Set<MemberBean> getMembers() {
		return members;
	}
	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}

	@Id
	private String region;
	private int regioncode;
	
	@Override
	public String toString() {
		return "RegionsBean [region=" + region + ", regioncode=" + regioncode + "]";
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getRegioncode() {
		return regioncode;
	}
	public void setRegioncode(int regioncode) {
		this.regioncode = regioncode;
	}

	public static void main(String[] args) {

		ApplicationContext context= new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionfactory = (SessionFactory) context.getBean("sessionFactory");
		
		Session session=sessionfactory.getCurrentSession();
		session.beginTransaction();
		
		RegionsBean bean=session.get(RegionsBean.class, "中正");
		System.out.println(bean);
		
		session.getTransaction().commit();
		((ConfigurableApplicationContext)context).close();
	}
	
}
