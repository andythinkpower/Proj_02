package _04_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _04_model.Event01;
import _04_model.Event01DAO;

@Repository
public class Event01DAOHibernate implements Event01DAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<Event01> select() {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		return query.getResultList();
	}

	@Override
	public List<Event01> selectChange(String newTypes) {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 where EventTypeID like :types order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setParameter("types", "%["+newTypes+"]%");
		return query.getResultList();
	}

	@Override
	public List<Event01> eventSelf(String eventID) {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 where EventID=?0 order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setParameter("0", eventID);
		return query.getResultList();
	}
}