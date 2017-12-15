package _02_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import _02_model.Bean.ActivityBean;
import _02_model.Bean.ActivityDetailBean;
import _02_model.Bean.MemberBean;
import _02_model.service.ActivityDetailService;
import _02_model.service.ActivityService;
import _02_spring.SqlDateEditor;

@Controller
public class Activity_Controller {
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActivityDetailService activityDetailService;

	@InitBinder
	public void init(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(Integer.class,
				new CustomNumberEditor(Integer.class,true));		
		//SqlDateEditor為自己改寫CustomDateEditor可以把字串轉sql.Date格式  
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new SqlDateEditor(new SimpleDateFormat("yyyy-MM-dd"),false));
	}

	@RequestMapping(path= {"/_02_activity/ActivityController.do"},method= {RequestMethod.POST,RequestMethod.GET})
	public String xxx(ActivityBean bean,ActivityDetailBean detailBean,BindingResult bindingResult,Model model,
			@SessionAttribute(name="user_member")MemberBean member,String doWhat,String hour,String min) {
		
		//代表是從schedule.jsp進來
		if("schedule".equals(doWhat)) {		
			//目前行程總覽部分不檢查 把剛輸入的參數存起來(還沒存進資料庫 要等全部都正確 一次一起insert進去)  直接導向細節頁面  
			model.addAttribute("activityBean", bean);
			return "actDetail";
		}//代表從actDetail.jsp進來 
		else if("detail".equals(doWhat)){	
			
			//把剛輸入的多筆beans 存入list中   
			List<ActivityDetailBean> list=new ArrayList();
			String[] kinds=detailBean.getKinds().split(",");
			String[] note=detailBean.getNote().split(",");	
			String[] budgets=detailBean.getBudget().split(",");
			String[] dates=detailBean.getDates().split(",");

			//先把停留時間 的時和分合併起來
			String[] hours=hour.split(",");
			String[] mins=min.split(",");
			String[] time=new String[hour.length()];
			for(int i=0;i<kinds.length;i++) {
				ActivityDetailBean temp=new ActivityDetailBean();
				time[i]=hours[i]+":"+mins[i];
				temp.setTimes(time[i]);	
				temp.setKinds(kinds[i]);
				temp.setNote(note[i]);
				temp.setBudget(budgets[i]);
				temp.setDates(dates[i]);
				list.add(temp);
			}					
			//測試 顯示結果
			for(int j=0;j<list.size();j++) {
				System.out.println(list.get(j));
			}			
			//判斷各項資料有無問題 如果有問題不能進入model部分
			//(尚未填寫)
			
			
			//資料都沒問題一次全部存進資料庫
			bean.setMemberID(member.getMemberID());
			System.out.println("準備新增行程總覽"+bean);
			Integer pk=activityService.Create_Schedule(bean);
			//新增完行程總覽後 得到的主key 塞入細節中
			for(int k=0;k<list.size();k++) {
				list.get(k).setActivityID(pk);
			}
			activityDetailService.insert(list);
			//新增成功後要回會員頁面 要呈現會員已建立的所有行程
			List<ActivityBean> Member_activity=activityService.Schedule(member.getMemberID());
		
			//放入request中 
			model.addAttribute("allSchedule",Member_activity);
			System.out.println("總共有"+Member_activity.size()+"項");
			return "display";		
		}//會員首頁進入 要顯示所有的行程頁面
		else if("showAct".equals(doWhat)) {
			//這邊要顯示該會員所有的行程
			//並且可以點選只訂 編輯或者修改
			
			List<ActivityBean> Member_activity=activityService.Schedule(member.getMemberID());
			//放入request中 
			model.addAttribute("allSchedule",Member_activity);
			
			return "display";
		}
		else if("single".equals(doWhat)) {
			//尚未檢查錯誤
			System.out.println("顯示單人頁面");
			System.out.println(bean);
			ActivityBean soloBean=activityService.solo_select(bean.getActivityID());
			model.addAttribute("soloBean", soloBean);
			Set<ActivityDetailBean> soloDetail=soloBean.getActivityDetails();
			model.addAttribute("soloDetail", soloDetail);
			
			//進入單獨行程頁面
			return "soloPage";
		}else if("delete".equals(doWhat)) {
			System.out.println("行程總覽 連同行程細節一起刪除");
			
			//刪除
			boolean result=activityService.Delete_Schedule(detailBean.getActivityID());
			System.out.println("刪除結果:"+result);
			if(result) {
				//刪除成功 接下來重新select 該member的所有行程
				List<ActivityBean> Member_activity=activityService.Schedule(member.getMemberID());
				model.addAttribute("allSchedule",Member_activity);				
				return "display";
			}else {
				//代表刪除失敗
				return "login.error";
			}
			
			
		}else if("update".equals(doWhat)) {
			System.out.println("進入修改頁面");
			
			return "login.success";
			
		}
		
		
		
		return "actDetail";		
	}
	
	@RequestMapping(method= {RequestMethod.GET},path= {"/_02_activity/test.do"})
	public void delete(HttpServletResponse response,String primary_key,
			@SessionAttribute(name="user_member")MemberBean member) throws IOException {
		//
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//步驟1.先刪除剛所點選的行程
		//boolean result=activityService.Delete_Schedule(Integer.valueOf(primary_key));
		//System.out.println("刪除結果:"+result);
		
		//步驟2.如果沒問題 再對該會員做select所有行程動作顯示回原頁面 
		List<ActivityBean> list=activityService.Schedule(member.getMemberID());
		ActivityBean temp=new ActivityBean();
		
		for(ActivityBean i:list) {
			Map<String,ActivityBean> min_map=new HashMap<String,ActivityBean>();
			min_map.put("activityID",i);
		}
		
		//String json;
		//json=JSONValue.toJSONString(list);
		//System.out.println("顯示 : "+json);
		out.println(list);
		
	}

}
