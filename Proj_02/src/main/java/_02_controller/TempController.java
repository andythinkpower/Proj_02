package _02_controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.Bean.ActivityDetailBean;
import _02_model.Bean.MemberBean;
import _02_model.service.ActivityDetailService;
import _02_model.service.ActivityService;

@Controller
@SessionAttributes(names= {"user_member"})
public class TempController {
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private ActivityDetailService activityDetailService;
	
	
	
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST},path= {"/_02_activity/test.do"})
	public String update(@SessionAttribute(name="user_member")MemberBean member,
			HttpServletRequest request) throws IOException {
		System.out.println("這邊專門處理更新問題");
		HttpSession session=request.getSession();
		
		if(session!=null) {
			System.out.println("有SESSION");
			MemberBean hhh=(MemberBean)session.getAttribute("user_member");
			System.out.println(hhh);
			Set<ActivityDetailBean> test=(Set<ActivityDetailBean>)session.getAttribute("soloDetail");
			if(test!=null) {
				System.out.println("hahaha");
			}else {
				System.out.println("no search");
			}
			
		}else {
			System.out.println("無 session");
		}
		
		return "actDetail";		
	}
	
	
}
