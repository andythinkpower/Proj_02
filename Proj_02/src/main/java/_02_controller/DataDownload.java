package _02_controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _02_model.service.ActivityDetailService;

@Controller
public class DataDownload {
	
	@Autowired
	private ActivityDetailService activityDetailService;
	
	@RequestMapping(method= {RequestMethod.GET,RequestMethod.POST},path= {"/download.do"})
	@ResponseBody
	public String xxx( String list) throws IOException, ParseException {
		System.out.println("ggg");
		System.out.println(list);
		
		return "bang";
	}
	
}
