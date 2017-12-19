package _02_controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.Bean.FavoritesBean;
import _02_model.Bean.MemberBean;
import _02_model.service.FavoritesService;
import _05_model.Event02;
import _05_model.Event02Service;

@Controller
@SessionAttributes(names= {"event_list"})
public class FavoritesController {
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private Event02Service event02Service;

	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST},path= {"/_02_activity/fav.do"})
	public String favorite(@SessionAttribute(name="user_member")MemberBean member,String doWhat,
			Model model) throws IOException {
		
		List<FavoritesBean> list=favoritesService.selectFav(member.getEmail());
		List<Event02> event_list=new ArrayList<Event02> ();
		for(int i=0;i<list.size();i++) {			
			event_list.add(event02Service.select(list.get(i).getEventID()));
		}
		
		System.out.println("測試把剛的資料顯示出來");
		for(Event02 o:event_list) {
			System.out.println(o);
		}
		model.addAttribute("event_list", event_list);
		
		return "fav_display";
	}
}
