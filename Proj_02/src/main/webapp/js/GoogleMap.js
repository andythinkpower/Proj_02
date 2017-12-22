var markers=[]
//上方開啟隱藏圖標鍵 
function CenterControl(controlDiv, map) {

     // Set CSS for the control border.
     var controlUI = document.createElement('div');
     controlUI.style.backgroundColor = '#fff';
     controlUI.style.border = '2px solid #fff';
     controlUI.style.borderRadius = '3px';
     controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
     controlUI.style.cursor = 'pointer';
     controlUI.style.marginBottom = '22px';
     controlUI.style.textAlign = 'center';
     controlUI.title = 'Click to visible the marker';
     controlDiv.appendChild(controlUI);

     // Set CSS for the control interior.
     var controlText = document.createElement('div');
     controlText.style.color = 'rgb(25,25,25)';
     controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
     controlText.style.fontSize = '16px';
     controlText.style.lineHeight = '38px';
     controlText.style.paddingLeft = '5px';
     controlText.style.paddingRight = '5px';
     controlText.innerHTML = '圖標顯示隱藏';
     controlUI.appendChild(controlText);

     var visible=true;
     controlUI.addEventListener('click', function() {
    	if(visible){
    		$("#musicControl").bootstrapToggle('off')
    		$("#exhibitionControl").bootstrapToggle('off')
    		$("#performanceControl").bootstrapToggle('off')
    		$("#studyControl").bootstrapToggle('off')
    		$("#movieControl").bootstrapToggle('off')
    		$("#LeisureControl").bootstrapToggle('off')
    		$("#familyControl").bootstrapToggle('off')
    		visible =!visible;
    	}else{
    		
    		$("#musicControl").bootstrapToggle('on')
    		$("#exhibitionControl").bootstrapToggle('on')
    		$("#performanceControl").bootstrapToggle('on')
    		$("#studyControl").bootstrapToggle('on')
    		$("#movieControl").bootstrapToggle('on')
    		$("#LeisureControl").bootstrapToggle('on')
    		$("#familyControl").bootstrapToggle('on')
    		visible =!visible;
    	}
   });

   }
//初始化地圖
 function initMap() {
	 var map = new google.maps.Map(document.getElementById('map'), {
     zoom: 14,
     center: {lat: 25.041778, lng: 121.543653}
   		});
	 var infoWindow=new google.maps.InfoWindow;
	 var centerControlDiv = document.createElement('div');
     var centerControl = new CenterControl(centerControlDiv, map);
	 centerControlDiv.index = 1;
     map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);

//從後端抓資料載入圖標
$.getJSON('mapcontroller.controller', {  }, function (data) {
	 $.each(data.data, function (i, event01) {
         var eventid=event01.EventID;
		 var eventname=event01.EventName;
		 var address=event01.Address;
         var briefIntroduction=event01.BriefIntroduction;
         var image=event01.imageFile;
		 var dtStart=event01.dtStart;
         var eventtype=event01.EventTypeId;
		 var type=event01.type;
		 var point = new google.maps.LatLng(
	    		 parseFloat(event01.Latitude),
	    		 parseFloat(event01.Longitude));
		var img=(image.length>5)?'<img src='+image+' width=50%><br>':'';
        var link="../_04_EventPage/eventSelf.jsp?eventID="+eventid;
        var contentString = '<div><a href='+link+'><strong>'+eventname+
        					'</strong></a><br>'+img+'<text>日期:'+dtStart+'</text><br>'+
        					'<text>地址:'+address+'</text><br>'+
        					'<text>"簡介:'+briefIntroduction+'</text><br></div>'
        var iconBase = '/Proj_02/img/';
		
        var block=(type=='thismonth')?'':'_block';
        var icons = {
                          
                         音樂: {
               icon: iconBase + 'music'+block+'.png',
            
          },
                          展覽: {
               icon: iconBase + 'exhibit'+block+'.png',
              
          },
                          表演: {
                icon: iconBase + 'show'+block+'.png',
                
          },
                         研習 : {
                icon: iconBase + 'study'+block+'.png',
                  
          },
                         影視 : {
                icon: iconBase + 'video'+block+'.png',
                
          },
                         休閒: {
           	   icon: iconBase + 'leisure'+block+'.png',
            
          },
                          親子: {
               icon: iconBase + 'family'+block+'.png',
              
            }
        };
        
		var marker = new google.maps.Marker({
	            			id:eventid,
							type:eventtype,
    	  					position:point, 
	            			map: map,
	            			icon: icons[eventtype].icon,
	            			visible: true
      					});
         marker.addListener("click", function() {
            infoWindow.setContent(contentString);
            infoWindow.open(map, marker);
           
            });
        /* marker.addListener("mouseout", function() {
             
             infoWindow.close();
             });
         */markers.push(marker);
      
      });
 });

}
 