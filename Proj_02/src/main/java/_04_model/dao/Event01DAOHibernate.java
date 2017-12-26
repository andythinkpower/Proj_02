package _04_model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_proj02Bean.Event01;
import _04_model.Event01DAO;

@Repository
public class Event01DAOHibernate implements Event01DAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Event01> eventSearch(String newDate, String newAreas, String newTypes, Integer pageNumber) {
		Query<Event01> query = this.getSession().createQuery("FROM Event01 " + newDate
				+ " AreaID like :areas and EventTypeID like :types and datediff( day , getdate() , DurationEnd ) >= 0 and CityID = '臺北市'order by datediff ( day , getdate() , DurationEnd )",
				Event01.class);
		query.setParameter("areas", "%[" + newAreas + "]%");
		query.setParameter("types", "%[" + newTypes + "]%");
		// 從第幾筆資料開始找
		query.setFirstResult((pageNumber - 1) * 10);
		// 一次最多搜尋10筆
		query.setMaxResults(10);

		return query.getResultList();
	}

	@Override
	public Long eventCount(String newDate, String newAreas, String newTypes) {
		Query query = this.getSession().createQuery("select count(*) FROM Event01 " + newDate
				+ " AreaID like :areas and EventTypeID like :types and datediff( day , getdate() , DurationEnd ) >= 0 and CityID = '臺北市'",
				Long.class);
		query.setParameter("areas", "%[" + newAreas + "]%");
		query.setParameter("types", "%[" + newTypes + "]%");
		Long count = (Long) query.uniqueResult();
		return count;
	}

	@Override

	public List<Event01> eventSelf(String eventID) {

		Query<Event01> query = this.getSession().createQuery(
				"FROM Event01 where EventID=?0 order by datediff ( day , getdate() , DurationEnd )", Event01.class);
		query.setParameter("0", eventID);

		return query.getResultList();
	}

}