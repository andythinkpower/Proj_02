package _05_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _05_model.Event02;
import _05_model.FavoritesBean;
import _05_model.FavoritesDAO;
@Repository
public class FavoritesDAOjdbc implements FavoritesDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	@Transactional
	public List<FavoritesBean> select(String email) {
		Query<FavoritesBean> query = this.getSession().createQuery("FROM FavoritesBean where email=? order by dtStart ", FavoritesBean.class);
		List<FavoritesBean> list = query.setParameter(0, email).list();
		return list;
	}

	@Override
	public String update(String email, List<FavoritesBean> jsondata) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
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

	@Override
	@Transactional
	public Integer insert(FavoritesBean bean) {
		if(bean==null) {
			return null;
		}else {
			Integer pk=(Integer)getSession().save(bean);
		return pk;
		}
		
	}
	
	/*
	@Override
	@Transactional
	public String update(String email,List<FavoritesBean> jsondata) {
		List<FavoritesBean> select = this.select(email);
		if(select!=null) {
			this.getSession().saveOrUpdate(select);
			return "update calendar success!!";
		}
		return "update calendar fail!!";
	}*/
}

