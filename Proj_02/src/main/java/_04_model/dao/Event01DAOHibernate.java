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
	public List<Event01> selectMusic() {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 where EventTypeID = '音樂' order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		return query.getResultList();
	}
	
	@Override
	public List<Event01> selectMany() {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 where EventTypeID in ( '?' , '?' ) order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setParameter(1, "表演");
		query.setParameter(2, "音樂");
		return query.getResultList();
	}

//	@Override
//	public Event01 select(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}