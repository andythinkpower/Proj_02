package _05_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _05_model.Event02;
import _05_model.Event02Service;

@Controller
public class GoogleMap {
	@Autowired
	private Event02Service event01Service;
	@RequestMapping(
			path="/mapcontroller.controller",
			method={RequestMethod.GET, RequestMethod.POST})
	public void method(HttpServletResponse response) throws IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Event02 bean = new Event02();
		List<Event02> result = event01Service.select(bean);
	    List<Map<String, String>>  l1 = new LinkedList<Map<String, String>>();
	    String jsonString;
	    Map<String, List<Map<String, String>>> m2 = new HashMap<String, List<Map<String, String>>>();
	    for(Event02 event01:result) {
	    	if ( event01.getLongitude() != null && !event01.getLongitude().isEmpty()&&event01.getLongitude().length()>5) {
				 Map<String, String> m1 = new HashMap<String, String>();       
				 m1.put("EventName",event01.getEventName());   
				 m1.put("Location", event01.getLocation()); 
				 m1.put("Address",event01.getAddress()); 
				 m1.put("Latitude", event01.getLatitude());
				 m1.put("Longitude", event01.getLongitude());
				 m1.put("BriefIntroduction", event01.getBriefIntroduction());
				 m1.put("logoimageFile", event01.getLogoimageFile());
				 m1.put("dtStart", event01.getDtStart().toString());
				 m1.put("EventTypeId", event01.getEventTypeId());
//				 System.out.println(event01.getCityId()+event01.getAddress());
				 if(event01.getDtStart().getMonth()==new Date().getMonth()&&event01.getDtStart().getYear()==new Date().getYear()) {
				 m1.put("type","thismonth" );
				 }else {m1.put("type","othermonth" );}
				 l1.add(m1);
			 }
			 
		}m2.put("data", l1); 
//		String jsonString = JSONValue.toJSONString(l1);   
		 jsonString = JSONValue.toJSONString(m2);  
		 out.println(jsonString);
   //   System.out.println(jsonString);
//		 return jsonString;
	
	
	}
	
	
	
	
}
