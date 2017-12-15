package _02_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.ActivityDetailDAO;
import _02_model.Bean.ActivityDetailBean;

@Repository
public class ActivityDetailDAOspring implements ActivityDetailDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	//利用行程ID 取得此行程全部細節
	@Override
	public List<ActivityDetailBean> select(Integer activityID) {
		  Query<ActivityDetailBean> query=
				  getSession().createQuery("from ActivityDetailBean where activityID=?",ActivityDetailBean.class);
		  query.setParameter(0,activityID);
		  return query.list();
	}

	@Override
	public boolean insert(List<ActivityDetailBean> beans) {
		
		
		if (!beans.isEmpty()||beans.size()!=0) {
			System.out.println("DAO端");
			Session session = getSession();
			int count=0;
			for(int i=0;i<beans.size();i++) {
				
				int x=(int)session.save(beans.get(i));
				count+=x;
				if(count!=0) {
				System.out.println("新增成功 第"+count+"筆");
				}
			}
			
			return true;
		} else {
			return false;
		}
	}

}
