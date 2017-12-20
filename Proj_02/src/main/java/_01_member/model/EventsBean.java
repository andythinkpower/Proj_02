package _01_member.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.sql.Select;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Entity
@Table(name="eventtypes")
public class EventsBean {

	@ManyToMany
	@JoinTable(
			name="LIKETYPES",
			joinColumns= {@JoinColumn(name="TYPE")},
			inverseJoinColumns= {@JoinColumn(name="MEMBEREMAIL")})
	private Set<MemberBean> members;	
	public Set<MemberBean> getMembers() {
		return members;
	}
	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}

	
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int typeid;
	@Id
	private String type;
	
	@Override
	public String toString() {
		return "EventBean [typeid=" + typeid + ", type=" + type + "]";
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public static void main(String[] args) {

		ApplicationContext context= new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionfactory = (SessionFactory) context.getBean("sessionFactory");
		
		Session session=sessionfactory.getCurrentSession();
		session.beginTransaction();
		
		EventsBean bean=session.get(EventsBean.class, 1);
		System.out.println(bean);
	
		session.getTransaction().commit();
		((ConfigurableApplicationContext)context).close();
	}
}
