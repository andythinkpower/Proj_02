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

	@RequestMapping(path = { "/_04_EventPage/searchEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> eventSearch(String newDate , String newAreas , String newTypes) {
		return event01Service.eventSearch(newDate , newAreas , newTypes);
	}

	@RequestMapping(path = { "/_04_EventPage/oneEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> eventSelf(String eventID) {
		return event01Service.eventSelf(eventID);
	}
	
} // class END
