package _06_blog.model.dao;

import java.util.Date;
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
import _01_member.model.dao.MemberDAOJdbc;
import _06_blog.model.BlogBean;
import _06_blog.model.BlogDAO;
import antlr.ParserSharedInputState;

@Repository
public class BlogDAOJdbc implements BlogDAO {

	@Autowired
	SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

//select one 	
	@Override
	public BlogBean select(BlogBean bean) {		
		return this.getSession().get(BlogBean.class, bean.getMemberemail());
	}

//add view num
	@Override
	public void addviewnum(BlogBean bean) {
		int id=bean.getArticleid();
		BlogBean beanexist=this.getSession().get(BlogBean.class, id);
		String nums=beanexist.getViewnum();
		int x=Integer.parseInt(nums);
		x=x+1;
		nums=String.valueOf(x);
		getSession().get(BlogBean.class, id).setViewnum(nums);
	}
//add like num	
	@Override
	public void addlikenum(BlogBean bean) {
		int id=bean.getArticleid();
		BlogBean beanexist=this.getSession().get(BlogBean.class, id);
		String nums=beanexist.getLikenum();
		int x=Integer.parseInt(nums);
		x=x+1;
		nums=String.valueOf(x);
		getSession().get(BlogBean.class, id).setLikenum(nums);
	}	

//insert
	@Override
	public Boolean insert(BlogBean bean) {
		bean.setPosttime(new Date());
		this.getSession().save(bean);		
		return null;
	}
//delete	
	@Override
	public void delete(int id) {
		BlogBean newbean=new BlogBean();
		newbean.setArticleid(id);
		this.getSession().delete(newbean);
	}
	
	//test
		public static void main(String[] args) {
			ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

			Session session = sessionFactory.getCurrentSession();
			session.beginTransaction();

			BlogDAOJdbc dao = (BlogDAOJdbc) context.getBean("blogDAOJdbc");
			BlogBean bean =new BlogBean();
			
//			bean.setArticlename("好的");
//			bean.setArticletype("旅遊");
//			bean.setArticlecontent("YES");
//			bean.setPosttime(new Date());
//			bean.setPravicy("0");
//			bean.setMemberemail("aaa@gmail.com");
//			
//			dao.insert(bean);
			
			bean.setArticleid(7);
			dao.addlikenum(bean);
			dao.addviewnum(bean);
			
//			dao.delete(2);
			
			session.getTransaction().commit();
			((ConfigurableApplicationContext) context).close();
		}

}
