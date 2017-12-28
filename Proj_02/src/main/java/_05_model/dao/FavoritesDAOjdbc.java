package _05_model.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _00_proj02Bean.Event01;
import _00_proj02Bean.FavoritesBean;
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
		Query<FavoritesBean> query = this.getSession().createQuery("FROM FavoritesBean where email=:email order by dtStart ", FavoritesBean.class);
		query.setParameter("email", email);
		return query.getResultList();
	}
	@Override
	public String update(String email, List<FavoritesBean> jsondata) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	@Transactional
	public boolean delete(String email,Integer eventID) {
		FavoritesBean result;
		try {
			Query<FavoritesBean> favorites = this.getSession().createQuery("FROM FavoritesBean where email=:email and eventid=:eventid ", FavoritesBean.class);
			 favorites.setParameter("email", email);
			 favorites.setParameter("eventid", eventID);
			 result = favorites.getSingleResult();
			 this.getSession().delete(result);
		} catch (NoResultException e) {
			return false;
		}
		return true;
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
	
	@Override
	@Transactional
	public FavoritesBean selectFavorites(String email,Integer eventID) {
		FavoritesBean result;
		try {
			Query<FavoritesBean> favorites = this.getSession().createQuery("FROM FavoritesBean where email=:email and eventid=:eventid order by dtStart ", FavoritesBean.class);
			 favorites.setParameter("email", email);
			 favorites.setParameter("eventid", eventID);
			 result = favorites.getSingleResult();
		} catch (NoResultException e) {
//			System.out.println("NO RESULT");
			return null;
			
		}
		return result;
	}
	
	@Override
	@Transactional
	public String updateCalendar(String email,Integer eventID, Date targetDate) {
		 FavoritesBean favorite = this.selectFavorites(email, eventID);
		 if(favorite!=null) {
			 favorite.setTargetDate(targetDate);
			this.getSession().update(favorite);
			return "update calendar success!!";
		}
		return "update calendar fail!!";
	}
}

