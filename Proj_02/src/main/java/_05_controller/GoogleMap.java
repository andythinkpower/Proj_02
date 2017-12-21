package _05_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.json.JSONString;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import _05_model.Event02;
import _05_model.Event02Service;
import _05_model.FavoritesBean;
import _05_model.FavoritesService;
import _05_model.Savecalendar;


@Controller
public class GoogleMap {
	@Autowired
	private Event02Service event01Service;
	

	@RequestMapping(
			path="/_05_web/mapcontroller.controller",
			method={RequestMethod.GET, RequestMethod.POST})
	public void method(HttpServletResponse response) throws IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String jsonString;
		List<Event02> result = event01Service.select();
	    List<Map<String, String>>  l1 = new LinkedList<Map<String, String>>();
	    Map<String, List<Map<String, String>>> m2 = new HashMap<String, List<Map<String, String>>>();
	    for(Event02 event01:result) {
	    	if ( event01.getLongitude() != null && !event01.getLongitude().isEmpty()&&event01.getLongitude().length()>5) {
				 Map<String, String> m1 = new HashMap<String, String>();       
				 m1.put("EventID", event01.getEventID().toString());
				 m1.put("EventName",event01.getEventName());   
				 m1.put("Location", event01.getLocation()); 
				 m1.put("Address",event01.getAddress()); 
				 m1.put("Latitude", event01.getLatitude());
				 m1.put("Longitude", event01.getLongitude());
				 m1.put("BriefIntroduction", event01.getBriefIntroduction());
				 m1.put("logoimageFile", event01.getLogoimageFile());
				 m1.put("dtStart", event01.getDtStart().toString().split(" ")[0]);
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
//      System.out.println(jsonString);
//		 return jsonString;
	
	
	}
	
	@RequestMapping(
			path="/_05_web/display.controller",
			method={RequestMethod.GET, RequestMethod.POST})
	public void linkevent(HttpServletResponse response,String eventid) throws IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String jsonString;
		Event02 event01 = event01Service.select(Integer.parseInt(eventid));
		Map<String, String> m1 = new HashMap<String, String>();       
		m1.put("EventID", event01.getEventID().toString());
		m1.put("EventName",event01.getEventName());   
		m1.put("showGroupName",event01.getShowGroupName());
		m1.put("eventTypeId",event01.getEventTypeId());
		m1.put("durationStart",event01.getDurationStart().toString());
		m1.put("durationEnd",event01.getDurationEnd().toString());
		m1.put("isCharge",event01.getIsCharge());
		m1.put("fee",event01.getFee());
		m1.put("shoppingUrl",event01.getShoppingUrl());
		m1.put("contactName",event01.getContactName());
		m1.put("contactTel",event01.getContactTel());
		m1.put("contactFax",event01.getContactFax());
		m1.put("BriefIntroduction", event01.getBriefIntroduction());
		m1.put("vcontent",event01.getVcontent());
		m1.put("eventUrl",event01.getEventUrl());
		m1.put("youTubeUrl",event01.getYouTubeUrl());
		m1.put("imageFile",event01.getimageFile());
		m1.put("logoimageFile", event01.getLogoimageFile());
		m1.put("insertTime", event01.getInsertTime().toString().split("\\.")[0]);
		m1.put("dtStart", event01.getDtStart().toString().split(" ")[0]);
		m1.put("dtEnd", event01.getDtEnd().toString().split(" ")[0]);
		m1.put("timeStart", event01.getTimeStart().toString().split("\\.")[0]);
		m1.put("Location", event01.getLocation()); 
		m1.put("cityId",event01.getCityId());
		m1.put("areaId",event01.getAreaId());
		m1.put("Address",event01.getAddress()); 
		m1.put("Latitude", event01.getLatitude());
		m1.put("Longitude", event01.getLongitude());
		jsonString = JSONValue.toJSONString(m1); 
		out.println(jsonString);
//		jsonString  =  objectMapper.writeValueAsString(result);
//		System.out.println(jsonString);
	
	
	
	}
	
	
	@RequestMapping(
			path="/_05_web/findEventtype.controller",
			method={RequestMethod.GET, RequestMethod.POST})
	public void findEvent(String selectType,HttpServletResponse response) throws IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String jsonString;
		List<Event02> result = event01Service.selectType(selectType);
		List<Map<String, String>>  l1 = new LinkedList<Map<String, String>>();
	    Map<String, List<Map<String, String>>> m2 = new HashMap<String, List<Map<String, String>>>();
	    for(Event02 event01:result) {
	    	Map<String, String> m1 = new HashMap<String, String>();       
			m1.put("EventID", event01.getEventID().toString());
			m1.put("EventName",event01.getEventName());   
			m1.put("showGroupName",event01.getShowGroupName());
			m1.put("eventTypeId",event01.getEventTypeId());
			m1.put("durationStart",event01.getDurationStart().toString().split(" ")[0]);
			m1.put("durationEnd",event01.getDurationEnd().toString().split(" ")[0]);
			m1.put("isCharge",event01.getIsCharge());
			m1.put("fee",event01.getFee());
			m1.put("shoppingUrl",event01.getShoppingUrl());
			m1.put("contactName",event01.getContactName());
			m1.put("contactTel",event01.getContactTel());
			m1.put("contactFax",event01.getContactFax());
			m1.put("BriefIntroduction", event01.getBriefIntroduction());
			m1.put("vcontent",event01.getVcontent());
			m1.put("eventUrl",event01.getEventUrl());
			m1.put("youTubeUrl",event01.getYouTubeUrl());
			m1.put("imageFile",event01.getimageFile());
			m1.put("logoimageFile", event01.getLogoimageFile());
			m1.put("insertTime", event01.getInsertTime().toString().split("\\.")[0]);
			m1.put("dtStart", event01.getDtStart().toString().split(" ")[0]);
			m1.put("dtEnd", event01.getDtEnd().toString().split(" ")[0]);
			m1.put("timeStart", event01.getTimeStart().toString().split("\\.")[0]);
			m1.put("Location", event01.getLocation()); 
			m1.put("cityId",event01.getCityId());
			m1.put("areaId",event01.getAreaId());
			m1.put("Address",event01.getAddress()); 
			m1.put("Latitude", event01.getLatitude());
			m1.put("Longitude", event01.getLongitude());
			l1.add(m1);
		 }m2.put("data", l1); 
		 jsonString = JSONValue.toJSONString(m2);  
		 
		 out.println(jsonString);
	} 
	
	

	
	
	
	
}
