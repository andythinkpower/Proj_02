package _02_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.FavoritesDAO;
import _02_model.Bean.FavoritesBean;

@Repository
public class FavoritesDAOSpring implements FavoritesDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<FavoritesBean> select(String email) {
		Session session=getSession();
		Query<FavoritesBean> query=session.createQuery("from FavoritesBean where email=?",FavoritesBean.class);
		List<FavoritesBean> list=query.setParameter(0, email).list();		
		return list;
	}

	@Override
	public boolean delete(Integer pk) {
		if (pk != null) {
			Session session = getSession();
			FavoritesBean delete = session.get(FavoritesBean.class, pk);
			session.delete(delete);
			return true;
		} else {
			return false;
		}
	}

}
