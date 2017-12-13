package _02_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.ActivityDAO;
import _02_model.Bean.ActivityBean;

@Repository
public class ActivityDAOspring implements ActivityDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	//利用primary key 取得單筆資料
	@Override
	public ActivityBean select(Integer activityID) {
		return getSession().get(ActivityBean.class, activityID);
	}

	@Override
	public List<ActivityBean> selectAll(Integer memberID) {
		List<ActivityBean> beans = null;
		Session session = getSession();
		if (memberID != 0) {
			// 代表查詢單一會員所有行程
			Query<ActivityBean> query = session.createQuery("from ActivityBean where memberID=?", ActivityBean.class);
			query.setParameter(0, memberID);
			beans = query.list();
			return beans;
		} else {
			// 代表查詢所有行程
			Query<ActivityBean> query = session.createQuery("from ActivityBean order by clickNumber desc",
					ActivityBean.class);
			beans = query.list();
			return beans;
		}
	}

	@Override
	public Integer insert(ActivityBean bean) {
		System.out.println("進入Insert方法");

		if (bean.getMemberID() != null) {
			ActivityBean insert = new ActivityBean();
			insert.setActStartDate(bean.getActStartDate());
			insert.setActRegion(bean.getActRegion());
			insert.setActTitle(bean.getActTitle());
			insert.setIntroduction(bean.getIntroduction());
			insert.setMemberID(bean.getMemberID());
			Session session = getSession();
			Integer pk=(Integer)session.save(insert);
			System.out.println("主key為:"+pk);
			return pk;
		} else {
			return null;
		}
	}

	@Override
	public boolean update(Integer activityID, ActivityBean change) {
		
		Session session = getSession();
		try {			
			ActivityBean update  = session.get(ActivityBean.class, activityID);
			//成功從資料庫取得ID 並修改資料
			System.out.println("現在在DAOspring"+update);
			if (update != null) {
				update.setActPhoto(change.getActPhoto());
				update.setActRegion(change.getActRegion());
				update.setActStartDate(change.getActStartDate());
				update.setActTitle(change.getActTitle());
				update.setIntroduction(change.getIntroduction());
				update.setPrivacy(change.isPrivacy());
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
