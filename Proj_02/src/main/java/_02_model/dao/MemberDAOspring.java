package _02_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.MemberDAO;
import _02_model.Bean.MemberBean;

@Repository
public class MemberDAOspring implements MemberDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public MemberBean select(String email) {
		// 因為OpenSessionInViewFilter 會幫我們 啟動 送出交易 退回交易
		MemberBean bean = null;
		Session session = getSession();
		// 因為主key是流水號 無法用
		Query query = session.createQuery("from MemberBean where email=?", MemberBean.class);
		query.setParameter(0, email);
		if (query.list().size() == 0) {
			return null;
		} else {
			bean = (MemberBean) query.list().get(0);
			return bean;
		}
	}

	@Override
	public boolean update(String psd, String phone) {
		return false;
	}

}
