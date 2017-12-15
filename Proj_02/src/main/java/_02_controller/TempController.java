package _02_controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.Bean.ActivityBean;
import _02_model.Bean.MemberBean;
import _02_model.service.ActivityService;

@Controller
@SessionAttributes(names= {"user_member"})
public class TempController {
	
	@Autowired
	private ActivityService activityService;
	
	
	
	@RequestMapping(method= {RequestMethod.GET},path= {"/_02_activity/qq.do"})
	public String test(Model model,String primary_key) {
		
		MemberBean bean=new MemberBean();
		bean.setMemberID(1);
			
		List<ActivityBean> list=activityService.Schedule(bean.getMemberID());
		System.out.println(list);
		
		
		model.addAttribute("user_member",bean);
		
		model.addAttribute("allSchedule", list);
		
		return "display";
		
	}
}
