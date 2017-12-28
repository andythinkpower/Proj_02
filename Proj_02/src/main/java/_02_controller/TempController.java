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

import _00_proj02Bean.Event01;
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
	
	
	
	
	@RequestMapping(path= {"/_04_EventPage/delete.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public String insert(String eventID,@SessionAttribute(name="member")MemberBean member,
			HttpServletResponse rs) throws IOException {
		System.out.println("要刪除的主KEY :"+eventID);
		
		
		return "login.error";	
	}
	

	
	
	
}
