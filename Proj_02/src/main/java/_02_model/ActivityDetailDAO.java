package _02_model;

import java.util.List;

import _02_model.Bean.ActivityDetailBean;

public interface ActivityDetailDAO {	

	public List<ActivityDetailBean> select(Integer activityID);		
	
	public boolean insert(List<ActivityDetailBean> beans);

}
