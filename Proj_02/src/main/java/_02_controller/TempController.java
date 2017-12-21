package _02_controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

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

import _01_member.model.MemberBean;
import _05_model.FavoritesBean;
import _05_model.FavoritesService;

@Controller
public class TempController {
	
	@Autowired
	private FavoritesService favoritesService;
	
	
	
	@RequestMapping(path= {"/_04_EventPage/insert.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public String insert(String eventName,String eventID,String durationEnd,String dtStart,
			@SessionAttribute(name="member")MemberBean member) {

		
		FavoritesBean bean=new FavoritesBean();
		bean.setEventID(Integer.valueOf(eventID));
		bean.setEventName(eventName);
		bean.setEmail(member.getMemberemail());
		SimpleDateFormat sdate=new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date date1=sdate.parse(dtStart);
			bean.setDtStart(date1);
			date1=sdate.parse(durationEnd);
			bean.setDurationEnd(date1);
			
		} catch (ParseException e) {
			System.out.println("轉換錯誤");
			e.printStackTrace();
		}
		System.out.println("bean"+bean);
		//資料如果沒問題 新增進資料庫
		
		Integer pk=favoritesService.Create_fav(bean);
		System.out.println("新增主key為:"+pk);
		
		
		
		return "login.error";
		
	}
	
	
	
}
