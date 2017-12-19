package _02_controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.Bean.ActivityBean;
import _02_model.Bean.ActivityDetailBean;
import _02_model.Bean.MemberBean;
import _02_model.service.ActivityDetailService;
import _02_model.service.ActivityService;
import _02_spring.SqlDateEditor;

@Controller
@SessionAttributes(names= {"soloDetail"})
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
	public String xxx(@SessionAttribute(name="user_member")MemberBean member,ActivityBean bean,ActivityDetailBean detailBean,
			BindingResult bindingResult,Model model,String doWhat,HttpServletRequest request) {
		
		//代表是從schedule.jsp進來
		if("schedule".equals(doWhat)) {		
			//目前行程總覽部分不檢查 把剛輸入的參數存起來(還沒存進資料庫 要等全部都正確 一次一起insert進去)  直接導向細節頁面  
			model.addAttribute("activityBean", bean);
			return "actDetail";
		}//代表從actDetail.jsp進來 
		else if("detail".equals(doWhat)){	
			
			//呼叫自己寫的方法 把多的細節拆開
			List<ActivityDetailBean> list=Activity_Controller.Detail_split(detailBean,false);
			
			
//			
//			//判斷各項資料有無問題 如果有問題不能進入model部分
//			//(尚未填寫)
//			
//			
			//資料都沒問題一次全部存進資料庫
			bean.setEmail(member.getEmail());
			System.out.println("準備新增行程總覽"+bean);
			Integer pk=activityService.Create_Schedule(bean);
			//新增完行程總覽後 得到的主key 塞入細節中
			for(int k=0;k<list.size();k++) {
				list.get(k).setActivityID(pk);
			}
			activityDetailService.insert(list);
			//新增成功後要回會員頁面 要呈現會員已建立的所有行程
			List<ActivityBean> Member_activity=activityService.Schedule(member.getEmail());
		
			//放入request中 
			model.addAttribute("allSchedule",Member_activity);
			System.out.println("總共有"+Member_activity.size()+"項");
			return "display";		
		}//會員首頁進入 要顯示所有的行程頁面
		else if("showAct".equals(doWhat)) {
			//這邊要顯示該會員所有的行程
			//並且可以點選只訂 編輯或刪除
			System.out.println("現在進入showAct動作");
			List<ActivityBean> Member_activity=activityService.Schedule(member.getEmail());
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
			//用session儲存 方便之後使用
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
				List<ActivityBean> Member_activity=activityService.Schedule(member.getEmail());
				model.addAttribute("allSchedule",Member_activity);				
				return "display";
			}else {
				//代表刪除失敗
				return "login.error";
			}
			
			
		}else if("update".equals(doWhat)) {
			System.out.println("進入修改 儲存資料");
			System.out.println(detailBean);
			HttpSession session=request.getSession();
			Set<ActivityDetailBean> set=(Set<ActivityDetailBean>)session.getAttribute("soloDetail");
			
			ActivityDetailBean[] array=set.toArray(new ActivityDetailBean[set.size()]);

			//要把消失的主key 和外部鍵塞回資料中
			List<ActivityDetailBean> list=Activity_Controller.Detail_split(detailBean,true);
			for(int i=0;i<list.size();i++) {
				list.get(i).setActivityID(array[i].getActivityID());
				list.get(i).setActDetail(array[i].getActDetail());			
			}
			System.out.println("修改結果");
			for(ActivityDetailBean i:list) {
				System.out.println(i);
			}
			

			
			
			activityService.Change_Schedule(bean);
			activityDetailService.Allupdate(list);

			return "display";
			
		}
		
		
		
		return "actDetail";		
	}
	
//	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST},path= {"/_02_activity/test.do"})
//	public String update(@SessionAttribute(name="user_member")MemberBean member,
//			HttpServletRequest request) throws IOException {
//		System.out.println("這邊專門處理更新問題");
//		HttpSession session=request.getSession();
//		
//		if(session!=null) {
//			System.out.println("有SESSION");
//			MemberBean hhh=(MemberBean)session.getAttribute("user_member");
//			System.out.println(hhh);
//			ActivityDetailBean test=(ActivityDetailBean)session.getAttribute("soloDetail");
//			if(test!=null) {
//				System.out.println("hahaha");
//			}else {
//				System.out.println("no search");
//			}
//			
//		}else {
//			System.out.println("無 session");
//		}
//		
//		return "actDetail";		
//	}
	
	
	public static List<ActivityDetailBean> Detail_split(ActivityDetailBean detailBean,boolean haveID) {
		List<ActivityDetailBean> list=new ArrayList<ActivityDetailBean>();
		String[] pk=null;
		if(haveID) {
			
		}
		String[] kinds=detailBean.getKinds().split(",");
		String[] note=detailBean.getNote().split(",");	
		String[] budgets=detailBean.getBudget().split(",");
		String[] dates=detailBean.getDates().split(",");
		String[] times=detailBean.getTimes().split(",");

		for(int i=0;i<kinds.length;i++) {
			ActivityDetailBean temp=new ActivityDetailBean();	
		/*	if(haveID) {
				temp.setActivityID(Integer.valueOf(pk[i]));
			}*/
			temp.setTimes(times[i]);	
			temp.setKinds(kinds[i]);
			temp.setNote(note[i]);
			temp.setBudget(budgets[i]);
			temp.setDates(dates[i]);
			list.add(temp);
		}						
		return list;
		
	}
	

}
