package _02_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_proj02Bean.Event02;
import _00_proj02Bean.FavoritesBean;
import _01_member.model.MemberBean;
import _05_model.Event02Service;
import _05_model.FavoritesService;

@Controller
public class TempController {
	
	@Autowired
	private FavoritesService favoritesService;
	@Autowired
	private Event02Service event02Service;
	
	
	@RequestMapping(path= {"/_04_EventPage/insert.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public void insert(String eventName,String eventID,String durationEnd,String dtStart,String timeStart,String doWhat,
			@SessionAttribute(name="member")MemberBean member,HttpServletResponse rs) throws IOException {
		rs.setHeader("Access-Control-Allow-Origin", "*");
		rs.setHeader("content-type", "text/html;charset=UTF-8");
		rs.setCharacterEncoding("UTF-8");
		PrintWriter out = rs.getWriter();
//		Event02 event = event02Service.select(Integer.parseInt(eventID));
//		event.setCollectionCount(event.getCollectionCount()+1);
//		event02Service.update(event);
		FavoritesBean bean=new FavoritesBean();
		bean.setEventID(Integer.valueOf(eventID));
		bean.setEventName(eventName);
		bean.setEmail(member.getMemberemail());
		SimpleDateFormat sdate=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdate2=new SimpleDateFormat("HH-mm-ss");
		try {
			java.util.Date date1=sdate.parse(dtStart);
			bean.setDtStart(date1);
			bean.setTargetDate(date1);
			date1=sdate.parse(durationEnd);
			bean.setDurationEnd(date1);
			date1=sdate2.parse(timeStart);
			bean.setTimeStart(date1);			
		} catch (ParseException e) {
			System.out.println("轉換錯誤");
			e.printStackTrace();
		}
		System.out.println("bean"+bean);
		//資料如果沒問題 新增進資料庫
		Integer pk=favoritesService.Create_fav(bean);
		System.out.println("新增主key為:"+pk);
		
		out.println(pk);
	
	}
	
	@RequestMapping(path= {"/_04_EventPage/delete.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public String insert(String eventID,@SessionAttribute(name="member")MemberBean member,
			HttpServletResponse rs) throws IOException {
		System.out.println("要刪除的主KEY :"+eventID);
		
		
		return "login.error";	
	}
	

	
	
	
}
