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
	public List<ActivityBean> Schedule(Integer memberID) {
		List<ActivityBean> beans=null;
		//如果memberID為null 代表要查詢所有的行程 反之則為查詢個人行程
		if (memberID == null) {
			beans = activityDAO.selectAll(0);
		} else {
			beans = activityDAO.selectAll(memberID);
		}
		
		return beans;
	}
	@Transactional
	public Integer Create_Schedule(ActivityBean bean) {
		return activityDAO.insert(bean);	

	}
	@Transactional
	public boolean Change_Schedule(Integer activityID, ActivityBean change) {
		return activityDAO.update(activityID, change);		 
	}
	@Transactional
	public boolean Delete_Schedule(Integer ActivityID) {
		return activityDAO.delete(ActivityID);
	}

}
