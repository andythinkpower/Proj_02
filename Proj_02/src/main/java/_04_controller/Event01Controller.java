package _04_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_proj02Bean.Event01;
import _04_model.Event01Service;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes("eventTypes")
public class Event01Controller {

	@Autowired
	private Event01Service event01Service;



	@RequestMapping(path = { "/_04_EventPage/searchEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody

	public List<Event01> eventSearch(String newDate , String newAreas , String newTypes , String newOrder , String pageNumber) {
		//把字串轉成整數
		Integer Pagination=Integer.valueOf(pageNumber);	
		return event01Service.eventSearch(newDate , newAreas , newTypes , newOrder , Pagination);
	}
	
	@RequestMapping(path = { "/_04_EventPage/searchCount.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Long eventCount(String newDate , String newAreas , String newTypes) {
		return event01Service.eventCount(newDate , newAreas , newTypes);

	}



	@RequestMapping(path = { "/_04_EventPage/oneEvent.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<Event01> eventSelf(String eventID) {
		return event01Service.eventSelf(eventID);
	}
	
	@RequestMapping(path = { "/_04_EventPage/addShareCount.controller" }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public void shareCount(String eventID) {
		event01Service.addShareCount(eventID);
	}
	
} // class END
