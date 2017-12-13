package _04_controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import _04_model.Event01;
import _04_model.Event01Service;
import _04_model.spring.PrimitiveNumberEditor;

@Controller
@RequestMapping("/EventPage/Event01.controller")
@SessionAttributes(names = { "select" })
public class Event01Controller {

	@Autowired
	private Event01Service event01Service;

	@InitBinder
	public void initialize(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));

		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(java.lang.Integer.class, true));
	}

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String searchEvent, String eventType, String manyType, Event01 bean, Model model) {
		if ("尋找活動".equals(searchEvent)) {
			List<Event01> result = event01Service.select(bean);
			model.addAttribute("select", result);
			return "eventType.select";
		}
		if ("表演".equals(eventType) || "展覽".equals(eventType) || "音樂".equals(eventType)) {
			List<Event01> resultType = event01Service.selectMusic(bean);
			model.addAttribute("select", resultType);
			return "eventType.select";
		}
		if ("表演".equals(manyType) || "展覽".equals(manyType) || "音樂".equals(manyType)) {
			List<Event01> resultManyType = event01Service.selectMany(manyType);
			model.addAttribute("select", resultManyType);
			return "eventType.select";
		}
		return "eventType.select";
	}
	
//	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
//	public String method2(String oneEvent, Event01 beanSelf, Model model) {
//		event01Service.select(beanSelf);
//		return "event.self";
//	}
}
