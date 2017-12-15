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

import _05_model.Event01DAO;
import _05_model.Event02;


@Repository
public class Event01DAOjdbc implements Event01DAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	private static final String SELECT_ALL = "select * from event01 order by datediff ( day , getdate() , DurationEnd )";
	private static final String SELECT_BY_MUSIC = "select * from event01 where EventTypeID = '音樂'";

	@Override
	@Transactional
	public List<Event02> select() {
		Query<Event02> query =this.getSession().createQuery("FROM Event02", Event02.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public Event02 select(int eventID) {
		return this.getSession().get(Event02.class, eventID);
	}

	@Override
	public Event02 insert(Event02 event) {
		if(event!=null) {
			Event02 select = this.select(event.getEventID());
			if(select==null) {
				this.getSession().saveOrUpdate(event);
				return event;
			}
		}
		return null;
	}

	@Override
	public Event02 update(Event02 event) {
		Event02 select = this.select(event.getEventID());
		if(select!=null) {
			this.getSession().save(event);
			return event;
		}
		return null;
	}

	@Override
	public boolean delete(int eventID) {
		Event02 select = this.select(eventID);
		if(select!=null) {
			this.getSession().delete(select);
			return true;
		}
		return false;
	}
	
}