package _02_model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.ActivityDAO;
import _02_model.Bean.ActivityBean;

@Service
public class ActivityService {
	@Autowired
	private ActivityDAO activityDAO;
	@Transactional(readOnly=true)
	public ActivityBean solo_select(Integer activityID) {
		return activityDAO.select(activityID);
	}
	@Transactional(readOnly=true)
	public List<ActivityBean> Schedule(String member_email) {
		List<ActivityBean> beans=null;
		//如果memberID為null 
		if (member_email.isEmpty()||member_email.trim().length()==0) {
			return null;   
		} else {
			beans = activityDAO.selectAll(member_email);
		}
		
		return beans;
	}
	@Transactional
	public Integer Create_Schedule(ActivityBean bean) {
		return activityDAO.insert(bean);	

	}
	@Transactional
	public boolean Change_Schedule(ActivityBean change) {
		return activityDAO.update(change);		 
	}
	@Transactional
	public boolean Delete_Schedule(Integer ActivityID) {
		return activityDAO.delete(ActivityID);
	}

}
