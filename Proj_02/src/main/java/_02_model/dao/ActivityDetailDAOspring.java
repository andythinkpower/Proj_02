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

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 利用行程ID 取得此行程全部細節
	@Override
	public List<ActivityDetailBean> select(Integer activityID) {
		Query<ActivityDetailBean> query = getSession().createQuery("from ActivityDetailBean where activityID=? order by dates",
				ActivityDetailBean.class);
		query.setParameter(0, activityID);
		return query.list();
	}

	@Override
	public boolean insert(List<ActivityDetailBean> beans) {

		if (!beans.isEmpty() || beans.size() != 0) {
			System.out.println("DAO端");
			Session session = getSession();
			int count = 0;
			for (int i = 0; i < beans.size(); i++) {
				int x = (int) session.save(beans.get(i));
				count = x;
			}
			if (count != 0) {
				System.out.println("新增成功 第" + count + "筆");
				return true;
			} else {
				return false;
			}			
					
		} else {
			return false;
		}
	}

	@Override
	public boolean update(List<ActivityDetailBean> beans) {
		
			Session session = getSession();
			try {
				// 使用迴圈把list裡面的資料一筆一筆取出並覆蓋上去
				for (int i = 0; i < beans.size(); i++) {
					// 從資料庫取出資料 !!初版 只能修改同樣數量 刪除 新增資料會有問題			
					ActivityDetailBean temp=session.get(ActivityDetailBean.class, beans.get(i).getActDetail());				
					temp.setBudget(beans.get(i).getBudget());
					temp.setDates(beans.get(i).getDates());
					temp.setKinds(beans.get(i).getKinds());
					temp.setLatitude(beans.get(i).getLatitude());
					temp.setLongitude(beans.get(i).getLongitude());
					temp.setNote(beans.get(i).getNote());
					temp.setTimes(beans.get(i).getTimes());
				}
				return true;
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
			
		
	}

}
