package _02_controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import _01_member.model.MemberBean;
import _05_model.Event02Service;
import _05_model.FavoritesService;

@Controller
public class TempController {
	
	
	@RequestMapping(path= {"/temp/qq.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public String insert(String eventName,String eventID,String durationEnd,String dtStart,String timeStart,String doWhat,
			HttpServletRequest re,HttpServletResponse rs) throws IOException {
		System.out.println("進入COntroller");
		
		HttpSession session=re.getSession();
		MemberBean m=(MemberBean)session.getAttribute("member");
		if(m==null) {
			System.out.println("會員尚未登入");
		}else {
			System.out.println("已登入");
		}
		
		return "login.success";
	}

	
}
