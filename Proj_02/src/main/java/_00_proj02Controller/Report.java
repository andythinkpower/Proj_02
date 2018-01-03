package _00_proj02Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import _00_proj02Bean.Event01;
import _01_member.model.MemberBean;
import _05_model.Event02Service;

@Controller
public class Report {

//	@Autowired
//	private ReportService reportService;
	@Autowired
	private Event02Service event02Service;
	
	//單一會員收藏單一活動
	@RequestMapping(path= {"/_04_EventPage/aaaa.controller"},method= {RequestMethod.POST,RequestMethod.GET})
	public void insert(String eventName,String eventID,
			@SessionAttribute(name="member")MemberBean member,HttpServletResponse rs) throws IOException {
		System.out.println("傳送進來的eventID:"+eventID);
		
		
		rs.setHeader("Access-Control-Allow-Origin", "*");
		rs.setHeader("content-type", "text/html;charset=UTF-8");
		rs.setCharacterEncoding("UTF-8");
		PrintWriter out = rs.getWriter();
		Event01 event = event02Service.select(Integer.parseInt(eventID));
		event.setIsBlock(Integer.valueOf((event.getIsBlock()+1)));
		event02Service.update(event);
		System.out.println(event);
		out.println(eventID);
	}
}
	
	
	
	
	
	
	

