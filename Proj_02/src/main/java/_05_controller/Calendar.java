package _05_controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _05_model.Event02;
import _05_model.FavoritesBean;
import _05_model.FavoritesService;

@Controller
public class Calendar {

	@Autowired
	private FavoritesService favoritesService;
	
	@RequestMapping(
			path="/_05_web/savecalendar.controller",
			method={RequestMethod.POST},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public String savecalendar(String getallevent,String email,HttpServletResponse response) throws ParseException {
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Integer eventID;
		Date targetDate;
		if(getallevent.length()!=0) {
		String event[]=getallevent.split(",");
		for(int i=0 ;i<event.length;i++) {
		eventID=Integer.parseInt(event[i].split("=")[1].split(" ")[0]);
        targetDate=time.parse(event[i].split("=")[2].split(" email")[0]);
		favoritesService.updateCalendar(email, eventID, targetDate);
		}
		return "更新行事曆成功";
		}else if(getallevent.length()==0) {
			List<FavoritesBean> result = favoritesService.select(email);
			 for(FavoritesBean favoritesBean:result) {
				 eventID=favoritesBean.getEventID();
				 targetDate=new Date(0);
				 favoritesService.updateCalendar(email, eventID, targetDate);
			 }
		return "清空行事曆成功";
		}
		return "更新行事曆成功";
}
	
	
	@RequestMapping(
			path="/_05_web/getFavorites.controller",
			method={RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<FavoritesBean> getFavorites(String email) {
		List<FavoritesBean> result = favoritesService.select(email);
		return result;
	}
	
	
	
	
}
