package _00_proj02Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import _00_proj02Bean.Event01;
import _00_proj02Bean.FavoritesBean;
import _01_member.model.MemberBean;
import _05_model.Event02Service;
import _05_model.FavoritesService;

@Controller
public class Favorites {

	@Autowired
	private FavoritesService favoritesService;
	@Autowired
	private Event02Service event02Service;
	
	//單一會員收藏單一活動
	@RequestMapping(path= {"/_04_EventPage/insert.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public void insert(String eventName,String eventID,String durationEnd,String dtStart,String timeStart,String doWhat,
			@SessionAttribute(name="member")MemberBean member,HttpServletResponse rs) throws IOException {
		rs.setHeader("Access-Control-Allow-Origin", "*");
		rs.setHeader("content-type", "text/html;charset=UTF-8");
		rs.setCharacterEncoding("UTF-8");
		PrintWriter out = rs.getWriter();
		Event01 event = event02Service.select(Integer.parseInt(eventID));
		event.setCollectionCount(Integer.valueOf((event.getCollectionCount()+1)));
		event02Service.update(event);
		System.out.println(event);
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
	
	
	
	
	//單一會員檢查是否已收藏單一活動
	@RequestMapping(
			path="/_04_EventPage/checkFavorites.controller",
			method={RequestMethod.POST,RequestMethod.GET}
			)
	public void checkFavorites(String eventid,String email,HttpServletResponse response) throws ParseException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer eventID=Integer.parseInt(eventid);
		FavoritesBean result = favoritesService.selectFavorite(email, eventID);
		if(result!=null) {
			out.print("collectioned");
		}else  {
			out.print("collection");
			
		}
		
	}
	//單一會員取消單一收藏 
	@RequestMapping(
			path="/_04_EventPage/disFavorite.controller",
			method={RequestMethod.POST,RequestMethod.GET}
			)
	public void disFavorite(String eventid,String email,HttpServletResponse response) throws ParseException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer eventID=Integer.parseInt(eventid);
		boolean result = favoritesService.deleteFav(email, eventID);
		if(result==true) {
			Event01 event = event02Service.select(eventID);
			event.setCollectionCount(Integer.valueOf((event.getCollectionCount()-1)));
			event02Service.update(event);
			out.print("disFavorite success");
		}else  {
			out.print("disFavorite filed");
			
		}
		
	}
	//單一會員全部收藏
	@RequestMapping(
			path="/_02_favorite/getallFavorites.controller",
			method={RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<FavoritesBean> getallFavorites(String email) {
		List<FavoritesBean> result = favoritesService.select(email);
		return result;
	}
	
	@RequestMapping(
			path="/_02_favorite/getallFavoritesevent.controller",
			method={RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Event01 getallFavoritesevent(String eventid) {
		int eventID = Integer.parseInt(eventid);
		Event01 result = event02Service.select(eventID);
		return result;
	}
	
	
	@RequestMapping(
			path="/_02_favorite/getallFavoritesevent02.controller",
			method={RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<Event01> getallFavoritesevent02(String email) {
		List<FavoritesBean> result = favoritesService.select(email);
		List<Event01> allevent=new LinkedList<Event01>();
		for(FavoritesBean bean:result) {
			Event01 event01 = event02Service.select(bean.getEventID());
			allevent.add(event01);
		}
		return allevent;
	}
	
	
	
	
	
	
	
	
	
	
	
}
