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
import _02_model.service.ActivityService;

@Controller
@SessionAttributes(names= {"allSchedule"})
public class TempController {
	
	@Autowired
	private ActivityService activityService;
	
	
	
	@RequestMapping(method= {RequestMethod.GET},path= {"/_02_activity/qq.do"})
	public String test(Model model,String primary_key) {
		
		
		
		
		
		
		
		
//		
		List<ActivityBean> list=activityService.Schedule(2);
		System.out.println(list);
		
		
		
		model.addAttribute("allSchedule", list);
		
		return "display";
		
	}
}
