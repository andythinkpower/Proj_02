package _00_proj02Controller;

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

import _00_proj02Bean.Event01;
import _00_proj02Bean.FavoritesBean;
import _05_model.FavoritesService;

@Controller
public class Favorites {

	@Autowired
	private FavoritesService favoritesService;
	
	@RequestMapping(
			path="/_00_proj02Controller/checkFavorites.controller",
			method={RequestMethod.POST,RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public String checkFavorites(String eventid,String email) throws ParseException {
		Integer eventID=Integer.parseInt(eventid);
		FavoritesBean result = favoritesService.selectFavorite(email, eventID);
		System.out.println(result);
		if(result!=null) {
			System.out.println("have collection!!");
			return "have collection!!";
		}else  {
			System.out.println("NOt collection!!");
			return "Not collection!!";
			
		}
		
	}
	@RequestMapping(
			path="/_05_web/getallFavorites.controller",
			method={RequestMethod.GET},
			produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<FavoritesBean> getallFavorites(String email) {
		List<FavoritesBean> result = favoritesService.select(email);
		return result;
	}
	
	
	
	
}
