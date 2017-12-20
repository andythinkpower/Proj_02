package _02_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_member.model.MemberBean;
import _02_model.Bean.FavoritesBean;
import _02_model.service.FavoritesService;
import _04_model.Event01;
import _04_model.Event01Service;

@Controller
@SessionAttributes(names= {"event_list"})
public class FavoritesController {
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private Event01Service event01Service;

	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST},path= {"/_02_activity/fav.do"})
	public String favorite(@SessionAttribute(name="member")MemberBean member,String doWhat,
			Model model) throws IOException {
		
		List<FavoritesBean> list=favoritesService.selectFav(member.getMemberemail());
		List<Event01> event_list=new ArrayList<Event01> ();
		for(int i=0;i<list.size();i++) {			
			event_list.add(event01Service.select(list.get(i).getEventID()));
		}
		
		System.out.println("測試把剛的資料顯示出來");
		for(Event01 o:event_list) {
			System.out.println(o);
		}
		model.addAttribute("event_list", event_list);		
		return "fav_display";
	}
	
	@RequestMapping(path = { "/_04_EventPage/oneEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> eventSelf(String eventID) {
		return event01Service.eventSelf(eventID);
	}
	
}
