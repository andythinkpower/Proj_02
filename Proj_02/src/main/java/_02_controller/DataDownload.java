package _02_controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.abola.crawler.CrawlerPack;

import _00_proj02Bean.Event01;

@Controller
public class DataDownload {
	
	private DataService dataService;
	
	@RequestMapping(method= {RequestMethod.GET},path= {"/download.do"},produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String xxx(String url,String kind) throws IOException, ParseException {
		System.out.println("url:"+url);
		System.out.println("kind:"+kind);
		
		
		if("data".equals(kind)) {
			Elements data = CrawlerPack.start().getFromJson(url).select("results");
			String count = CrawlerPack.start().getFromJson(url).select("result").select("count").text();
			Event01[] event=new  Event01[Integer.parseInt(count)];
			dataService.loadingData(count, data, event);
			List<Event01> result = dataService.select();
	        for(Event01 event02:result) {
	        	if(event02.getLatitude().length()<5) {
	        		System.out.println(event02.getEventID()+" "+event02.getLatitude()+" "+event02.getLongitude());
	        	}
	        }
		}else if("find".equals(kind)) {
			File file = new File(url);
	        dataService.findpoint(file);
		}
		
//		
        System.out.println("fin");
        
		return "haha";
		
	}
	
}
