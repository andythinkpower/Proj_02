package _02_model.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.ActivityDAO;
import _02_model.Bean.ActivityBean;
import _02_model.Bean.ActivityDetailBean;

@Repository
public class ActivityDAOspring implements ActivityDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 利用primary key 取得單筆資料
	@Override
	public ActivityBean select(Integer activityID) {
		return getSession().get(ActivityBean.class, activityID);
	}

	@Override
	public List<ActivityBean> selectAll(String member_email) {
		List<ActivityBean> beans = null;
		Session session = getSession();
		if (!member_email.isEmpty() || member_email.trim().length() != 0) {
			// 代表查詢單一會員所有行程
			Query<ActivityBean> query = session.createQuery("from ActivityBean where email=?", ActivityBean.class);
			query.setParameter(0, member_email);
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

		if (!bean.getEmail().isEmpty() || bean.getEmail().trim().length() != 0) {
			ActivityBean insert = new ActivityBean();
			insert.setActStartDate(bean.getActStartDate());
			insert.setActRegion(bean.getActRegion());
			insert.setActTitle(bean.getActTitle());
			insert.setIntroduction(bean.getIntroduction());
			insert.setPhotoPath(bean.getPhotoPath());
			insert.setEmail(bean.getEmail());
			Session session = getSession();
			Integer pk = (Integer) session.save(insert);
			return pk;
		} else {
			return null;
		}
	}

	@Override
	public boolean update(ActivityBean updateBean) {

		Session session = getSession();
		ActivityBean update = session.get(ActivityBean.class, updateBean.getActivityID());

		// 成功從資料庫取得ID 並修改資料
		System.out.println("現在在DAOspring" + update);
		if (update != null) {
			update.setPhotoPath(updateBean.getPhotoPath());
			update.setActRegion(updateBean.getActRegion());
			update.setActStartDate(updateBean.getActStartDate());
			update.setActTitle(updateBean.getActTitle());
			update.setIntroduction(updateBean.getIntroduction());
			update.setPrivacy(updateBean.isPrivacy());
			update.setClickNumber(updateBean.getClickNumber());
			return true;
		}

		return false;
	}

	// 行程總覽 連同細節一起刪除
	@Override
	public boolean delete(Integer ActivityID) {
		if (ActivityID != null) {
			Session session = getSession();
			ActivityBean delete = session.get(ActivityBean.class, ActivityID);
			session.delete(delete);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<ActivityBean> order(String email) {
		System.out.println("aaa");
		Session session = getSession();
		Query<ActivityBean> query = session.createQuery("from ActivityBean where email=? order by clickNumber desc",
				ActivityBean.class);
		query.setParameter(0, email);
		List<ActivityBean> list = query.list();
		for (ActivityBean i : list)
			System.out.println(i);
		System.out.println("結束" + list.size());
		return list;
	}

}
