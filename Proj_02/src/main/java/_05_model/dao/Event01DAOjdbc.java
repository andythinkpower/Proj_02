package _05_model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _00_proj02Bean.Event01;
import _05_model.Event01DAO;


@Repository
public class Event01DAOjdbc implements Event01DAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	@Transactional
	public List<Event01> select() {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where Cityid='臺北市' and datediff( day , getdate() , DurationEnd ) >= 0", Event01.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public Event01 select(int eventID) {
		return this.getSession().get(Event01.class, eventID);
	}

	@Override
	@Transactional
	public Event01 insert(Event01 event) {
		if(event!=null) {
			Event01 select = this.select(event.getEventID());
			if(select==null) {
				this.getSession().saveOrUpdate(event);
				return event;
			}
		}
		return null;
	}

	@Override
	@Transactional
	public Event01 update(Event01 event) {
		Event01 select = this.select(event.getEventID());
		if(select!=null) {
			this.getSession().merge(event);
			return event;
		}
		return null;
	}

	@Override
	@Transactional
	public boolean delete(int eventID) {
		Event01 select = this.select(eventID);
		if(select!=null) {
			this.getSession().delete(select);
			return true;
		}
		return false;
	}

	
	@Override
	@Transactional
	public List<Event01> selectthisweek() {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where len(imagefile)>5 and datediff( day , getdate() , DurationEnd ) >= 0 order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Event01> selectthisweek(String types) {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where len(imagefile)>5 and EventTypeID = :types and datediff( day , getdate() , DurationEnd ) >= 0 order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setParameter("types", types);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	
	
	
	
	
	
	@Override
	@Transactional
	public List<Event01> selectcollectionCount() {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where datediff( day , getdate() , DurationEnd ) >= 0 order by collectionCount desc", Event01.class);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Event01> selectcollectionCount(String types) {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where EventTypeID = :types and datediff( day , getdate() , DurationEnd ) >= 0 order by collectionCount desc", Event01.class);
		query.setParameter("types", types);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	
	
	@Override
	@Transactional
	public List<Event01> selectInsertTime() {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where  datediff( day , getdate() , DurationEnd ) >= 0 order by InsertTime desc", Event01.class);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Event01> selectInsertTime(String types) {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where  EventTypeID = :types and datediff( day , getdate() , DurationEnd ) >= 0 order by InsertTime desc", Event01.class);
		query.setParameter("types", types);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	
	@Override
	@Transactional
	public List<Event01> selectshareCount() {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where  datediff( day , getdate() , DurationEnd ) >= 0 order by shareCount desc", Event01.class);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Event01> selectshareCount(String types) {
		Query<Event01> query =this.getSession().createQuery("FROM Event01 where EventTypeID = :types and datediff( day , getdate() , DurationEnd ) >= 0 order by shareCount desc", Event01.class);
		query.setParameter("types", types);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	
	
	
	
	
	
	
	
	
	
}