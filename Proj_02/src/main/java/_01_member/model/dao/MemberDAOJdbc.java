package _01_member.model.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public Set<EventsBean> insertevents(MemberBean bean, String [] type){
		
		for(int i=0; i<type.length;i++) {	
			MemberBean beanforlikes= this.select(bean.getMemberemail());
			Set<EventsBean> events=beanforlikes.getEvents();
			EventsBean test = new EventsBean();
			test.setType(type[i]);
			events.add(test);
		}
		
		return null;
	}
//insert regions	
	public Set<RegionsBean> insertregions(MemberBean bean, String [] region){
		
		for(int i=0; i<region.length;i++) {	
			MemberBean beanforlikes= this.select(bean.getMemberemail());
			Set<RegionsBean> events=beanforlikes.getRegions();
			RegionsBean test = new RegionsBean();
			test.setRegion(region[i]);
			events.add(test);
		}
		
		return null;
	}
//delete events	
	public Set<EventsBean> deletetypes(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());
		Set<EventsBean> events=beanforlikes.getEvents();
		for(EventsBean u: events) {
			u.getMembers().remove(beanforlikes);
		}
		return null;
	}
//delete regions	
	public Set<RegionsBean> deleteregions(MemberBean bean){
		MemberBean beanforlikes= this.select(bean.getMemberemail());
		Set<RegionsBean> regions=beanforlikes.getRegions();
		for(RegionsBean u: regions) {
			u.getMembers().remove(beanforlikes);
		}
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
		bean.setMemberemail("ccc@gmail.com");
//		bean.setMemberpassword("nnn");
//		dao.insert(bean);
		Set<EventsBean> eventslike=dao.showevents(bean);
		System.out.println(bean);
		System.out.println(eventslike);
		
		session.getTransaction().commit();
		((ConfigurableApplicationContext) context).close();
	}

}
