package _02_model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.ActivityDetailDAO;
import _02_model.Bean.ActivityDetailBean;

@Service
public class ActivityDetailService {
	
	@Autowired
	private ActivityDetailDAO activityDetailDAO;
	@Transactional
	public boolean insert(List<ActivityDetailBean> bean) {
		//在這邊可能要新增筆資料 必須要全部資料都成功才commit 只要有一個失敗就rollback
		if (bean != null) {
			return activityDetailDAO.insert(bean);
			
		} else {
			return false;
		}
				
	}
	@Transactional(readOnly=true)
	public List<ActivityDetailBean> showALL(Integer activityID){
		return activityDetailDAO.select(activityID);
		
		
	}
	
	

}
