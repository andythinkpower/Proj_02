package _02_model;

import java.util.Date;
import java.util.List;

import _02_model.Bean.ActivityBean;

public interface ActivityDAO {

	// 顯示單一行程  讀取它的主key顯示單筆行程和其多個細節    (代表之後要和ActivityDetailBean 做一對多關係)
	public ActivityBean select(Integer activityID);
	
	// 顯示該會員所有行程規劃  如果memberID設為0 代表要查詢所有人 用來顯示熱門
	public List<ActivityBean> selectAll(Integer memberID);

	
	// 新增行程規劃 回傳新增的 primary key
	public Integer insert(ActivityBean bean);

//	// 修改行程
	public boolean update(Integer targetID,ActivityBean pdateBean);
	
	
//	// 刪除行程  !!刪除指令可能要再研究一下
	public boolean delete(Integer ActivityID);

}
