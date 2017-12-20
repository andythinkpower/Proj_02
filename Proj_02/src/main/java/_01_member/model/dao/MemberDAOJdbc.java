package _01_member.model.dao;

import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import _01_member.model.EventsBean;
import _01_member.model.MemberBean;
import _01_member.model.MemberDAO;
import _01_member.model.RegionsBean;

@Repository
public class MemberDAOJdbc implements MemberDAO {

	@Autowired
	SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
//select
	public MemberBean select(String memberemail) {
		return this.getSession().get(MemberBean.class, memberemail);
	}
//insert
	public MemberBean insert(MemberBean bean) {
		if(bean!=null) {
			MemberBean select =this.select(bean.getMemberemail());
			if(select==null) {
				this.getSession().save(bean);
			}					
		}
		return null;
	}
//update
	public MemberBean update(MemberBean bean) {
		MemberBean beanexist= getSession().get(MemberBean.class, bean.getMemberemail());
		beanexist.setMembernickname(bean.getMembernickname());
		beanexist.setMembergender(bean.getMembergender());
		beanexist.setMemberbdate(bean.getMemberbdate());
		beanexist.setMemberepaper(bean.getMemberepaper());
		this.getSession().update(beanexist);		
		return null;
	}
//show events
	public Set<EventsBean> showevents(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());
		Set<EventsBean> events=beanforlikes.getEvents();
		return events;
	}
//show regions	
	public Set<RegionsBean> showregions(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());
		Set<RegionsBean> regions=beanforlikes.getRegions();
		return regions;
	}
//insert events
	public Set<EventsBean> insertevents(Set<EventsBean> eventsbean){
		return null;
	}
//insert regions	
	public Set<RegionsBean> insertregions(Set<RegionsBean> regionsbean){
		return null;
	}
//delete events	
	public Set<EventsBean> deleteevents(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());

		return null;
	}
//delete regions	
	public Set<RegionsBean> deleteregions(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());
		return null;
	}
	
//test
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		MemberDAOJdbc dao = (MemberDAOJdbc) context.getBean("memberDAOJdbc");
		MemberBean bean =new MemberBean();
		bean.setMemberemail("aaa@gmail.com");
//		bean.setMemberpassword("nnn");
//		dao.insert(bean);
		Set<EventsBean> eventslike=dao.showevents(bean);
		System.out.println(bean);
		System.out.println(eventslike);

		session.getTransaction().commit();
		((ConfigurableApplicationContext) context).close();
	}

}
