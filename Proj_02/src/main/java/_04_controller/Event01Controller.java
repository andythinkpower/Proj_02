package _04_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _04_model.Event01;
import _04_model.Event01Service;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes("eventTypes")
public class Event01Controller {

	@Autowired
	private Event01Service event01Service;

	@RequestMapping(path = { "/_04_EventPage/Event01.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> select() {
		return event01Service.select();
	} // select END

	@RequestMapping(path = { "/_04_EventPage/newTypes.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> selectChange(String newTypes) {
		if (newTypes == "") {
			return event01Service.select();
		} else {
			return event01Service.selectChange(newTypes);
		}
	} // selectChange END

	@RequestMapping(path = { "/_04_EventPage/oneEvent.controller","/_02_favorite/oneEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> eventSelf(String eventID) {
		return event01Service.eventSelf(eventID);
	}

//	@RequestMapping(path = { "/_04_EventPage/selectCount.controller" }, produces = { "application/json;charset=UTF-8" })
//	@ResponseBody
//	public List<Event01> selectCount(String newTypes) {
//		return event01Service.selectCount(newTypes);
//	}
	
} // class END
