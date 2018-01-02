package _02_controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _00_proj02Bean.Event01;

@Service
public class DataService {
	@Autowired
	private SessionFactory sessionFactory;
    public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
    private SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SimpleDateFormat timestart = new SimpleDateFormat("HH:mm");
	
	@Transactional
	public int loadingData(String count,Elements data,Event01[] event) throws ParseException {
		for(int i=0;i<event.length;i++){
		    Integer eventID= Integer.parseInt(data.get(i).select("ID").text())+99900000;
		    String eventName= data.get(i).select("EventName").text();
		    String showGroupName=data.get(i).select("ShowGroupName").text();
		    String eventTypeId=changeEventtypeID(data.get(i).select("EventTypeId").text()); 
		    Date durationStart=date.parse(data.get(i).select("DurationStart").text()); 
		    Date durationEnd=date.parse(data.get(i).select("DurationEnd").text()); 
		    String isCharge=data.get(i).select("IsCharge").text();
		    String fee=data.get(i).select("Fee").text(); 
		    String shoppingUrl=data.get(i).select("ShoppingUrl").text(); 
		    String contactName=data.get(i).select("ContactName").text(); 
		    String contactTel=data.get(i).select("ContactTel").text(); 
		    String contactFax=data.get(i).select("ContactFax").text();
		    String briefIntroduction=data.get(i).select("BriefIntroduction").text().replaceAll("(\\\\r\\\\n)", "").replaceAll("\r\n", "").replaceAll("&nbsp;", "");
		    String vcontent=data.get(i).select("Vcontent").text().replaceAll("(\\\\r\\\\n)", "").replaceAll("\r\n", "").replaceAll("&nbsp;", "");
		    String eventUrl=data.get(i).select("EventUrl").text(); 
		    String youTubeUrl=data.get(i).select("YouTubeUrl").text(); 
		    String imageFile=data.get(i).select("ImageFile").text(); 
		    String logoImageFile=data.get(i).select("LogoImageFile").text(); 
		    Date insertTime=time.parse(data.get(i).select("InsertTime").text()); 
		    Date dtStart=date.parse(data.get(i).select("DtStart").text()); 
		    Date dtEnd=date.parse(data.get(i).select("DtEnd").text()); 
		    String start=data.get(i).select("TimeStart").text();
		    start=("null".equals(start))?"00:00":start;
		    start=("0930".equals(start))?"09:30":start;
		    Date timeStart=timestart.parse(start); 
		    Integer overTime=null; 
		    String location=data.get(i).select("Location").text(); 
		    String cityId=(data.get(i).select("CityId").text()); 
		    String areaId=(data.get(i).select("AreaId").text());
//		    Integer areaId=changeAreaID(area);
		    String address=data.get(i).select("Address").text(); 
		    String longitude=data.get(i).select("Longitude").text(); 
		    String latitude=data.get(i).select("Latitude").text();
//		    if(longitude.length()<5) {
//		    	System.out.println(eventID+" "+cityId+address);
//		    	
//		    }
		    event[i]=new Event01(eventID,eventName,showGroupName, 
		    		eventTypeId, durationStart, durationEnd, isCharge,
		    		fee, shoppingUrl,contactName,
		    		contactTel,contactFax,briefIntroduction,
		    		vcontent, eventUrl, youTubeUrl, 
		    		 imageFile, logoImageFile, insertTime,dtStart, 
		    		dtEnd, timeStart, overTime, location, 
		    		cityId,  areaId,  address,  longitude,
		    		 latitude);
		    
		    this.getSession().saveOrUpdate(event[i]);
//		    System.out.println(event[i].toString());
		    }
		
		
		return 0;
	}
	
	@Transactional
	public void findpoint(File file) throws IOException {
		InputStreamReader reader = new InputStreamReader(new FileInputStream(file),"UTF-8");
		BufferedReader br = new BufferedReader(reader); 
		String line = "";  
		line = br.readLine();  
		while (line!= null) {  
		  Map<String,String> findpoint=new HashMap();
		  String id; 
		  String lon;
		  String lat;
		  String point;
		  line = br.readLine(); 
		  if(line!=null) {
		  id=line.split(" ")[0];
		  point=line.split("=")[1];
		  if(point.length()>6) {
		  lat=line.split(" ")[1].split("=")[1].split(",")[0];
		  lon=line.split(" ")[1].split("=")[1].split(",")[1];
		  Event01 event01=this.select(Integer.parseInt(id));
		  event01.setLatitude(lat);
		  event01.setLongitude(lon);
		  this.getSession().update(event01);
		 System.out.println(id+" "+lat+" "+lon);
		  }
		  }
		  
		}
		
		br.close();
		reader.close();
	}
	
	@Transactional
	public static String changeEventtypeID(String eventTypeId) {
		
		switch(eventTypeId){
		case "表演萬象":
			eventTypeId="表演";
			break;
		case "展覽廣場":
			eventTypeId="展覽";
			break;	
		case "音樂現場":
			eventTypeId="音樂";
			break;	
		case "講座研習":
			eventTypeId="研習";
			break;	
		case "電影瞭望":
			eventTypeId="影視";
			break;	
		case "城市萬花筒":
			eventTypeId="休閒";
			break;	
		case "親子活動":
			eventTypeId="親子";
			break;	
		case "城外行腳":
			eventTypeId="城外行腳";
			break;	
		}
		return 	eventTypeId;
	}
	@Transactional
	public static Integer changeAreaID(String Area) {
		Integer AreaID=0;
		switch(Area){
		case "中正區":
			AreaID=100;
			break;
		case "大同區":
			AreaID=103;
			break;
		case "中山區":
			AreaID=104;
			break;
		case "松山區":
			AreaID=105;
			break;
		case "大安區":
			AreaID=106;
			break;
		case "萬華區":
			AreaID=108;
			break;
		case "信義區":
			AreaID=110;
			break;
		case "士林區":
			AreaID=111;
			break;
		case "北投區":
			AreaID=112;
			break;
		case "內湖區":
			AreaID=114;
			break;
		case "南港區":
			AreaID=115;
			break;
		case "文山區":
			AreaID=116;
			break;
		}
		return AreaID;
	}
	@Transactional
	public Event01 select(int eventID) {
		return this.getSession().get(Event01.class, eventID);
	}
	@Transactional
	public List<Event01> select() {
		Query<Event01> query = this.getSession().createQuery("FROM Event01", Event01.class);
		return query.getResultList();
	}
	@Transactional
	public Event01 insert(Event01 event) {
		if(event!=null) {
			Event01 select = this.select(event.getEventID());
			if(select==null) {
				this.getSession().saveOrUpdate(event);
				return event;
			}
		}
		return null;
	}
	@Transactional
	public Event01 update(Event01 event) {
		Event01 select = this.select(event.getEventID());
		if(select!=null) {
			this.getSession().save(event);
			return event;
		}
		return null;
	}
	@Transactional
	public boolean delete(int eventID) {
		Event01 select = this.select(eventID);
		if(select!=null) {
			this.getSession().delete(select);
			return true;
		}
		return false;
	}

	

}
