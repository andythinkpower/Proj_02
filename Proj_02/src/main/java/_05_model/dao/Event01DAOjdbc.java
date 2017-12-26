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
			this.getSession().save(event);
			return event;
		}
		return null;
	}

	@Override
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
	public List<Event01> selectType(String eventtype) {
		String select=" where eventTypeId='"+eventtype+"'";
		Query<Event01> query =this.getSession().createQuery("FROM Event02"+select, Event01.class);
		return query.getResultList();
		
	}
	
}