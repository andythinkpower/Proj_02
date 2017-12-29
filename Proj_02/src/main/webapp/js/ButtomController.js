/*<input onclick="musicControl();" type=button value="音樂 顯示/隱藏">
    <input onclick="exhibitionControl();" type=button value="展覽 顯示/隱藏">
    <input onclick="performanceControl();" type=button value="表演 顯示/隱藏">
	<input onclick="studyControl();" type=button value="研習 顯示/隱藏">
	<input onclick="movieControl();" type=button value="影視 顯示/隱藏">
	<input onclick="LeisureControl();" type=button value="休閒 顯示/隱藏">
	<input onclick="familyControl();" type=button value="親子 顯示/隱藏">
*/ 
$(function() {
	var thismon=false;
	$('#thismonControl').bootstrapToggle({
	      on: '全部',
	      off: '本月'
	});
	$('#thismonControl').change(function() {
		if($("#thismonControl").prop("checked")){
				thismon=false;
				for (var i = 0; i < markers.length; i++) {
		   		 markers[i].setVisible(markers[i].getVisible() || thismon);
				}	 
			
		}else{	thismon=true;
				for (var i = 0; i < markers.length; i++) {
						if(markers[i].now=='thismonth'){
							markers[i].setVisible(markers[i].getVisible() && thismon);
   			 		}else{markers[i].setVisible(false);}
		}
		}
	})
	$('#musicControl').bootstrapToggle({
      on: '音樂',
      off: '音樂'
    });
    $('#musicControl').change(function() {
    	if(thismon){
    	for (var i = 0; i < markers.length; i++) {
   		 	if(markers[i].type=="音樂"){
	   			if($("#musicControl").prop("checked")){
	   				if(markers[i].now=='thismonth'){
	   					markers[i].setVisible(true);
			 		}
	   			}else{markers[i].setVisible(false);}
   		 	}
    	}
    	}else{
    		for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="音樂"){
    	   			if($("#musicControl").prop("checked")){
       				 markers[i].setVisible(true);
       			 }else{markers[i].setVisible(false);}
       		 	}
        	}
    	}
    })
    $('#exhibitionControl').bootstrapToggle({
      on: '展覽',
      off: '展覽'
    });
    $('#exhibitionControl').change(function() {
    	if(thismon){
        	for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="展覽"){
    	   			if($("#exhibitionControl").prop("checked")){
    	   				if(markers[i].now=='thismonth'){
    	   					markers[i].setVisible(true);
    			 		}
    	   			}else{markers[i].setVisible(false);}
       		 	}
        	}
        	}else{
        		for (var i = 0; i < markers.length; i++) {
           		 	if(markers[i].type=="展覽"){
        	   			if($("#exhibitionControl").prop("checked")){
           				 markers[i].setVisible(true);
           			 }else{markers[i].setVisible(false);}
           		 	}
            	}
        	}
    	
    	
    })
    $('#performanceControl').bootstrapToggle({
      on: '表演',
      off: '表演'
    });
    $('#performanceControl').change(function() {
    	
    	if(thismon){
        	for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="表演"){
    	   			if($("#performanceControl").prop("checked")){
    	   				if(markers[i].now=='thismonth'){
    	   					markers[i].setVisible(true);
    			 		}
    	   			}else{markers[i].setVisible(false);}
       		 	}
        	}
        	}else{
        		for (var i = 0; i < markers.length; i++) {
           		 	if(markers[i].type=="表演"){
        	   			if($("#performanceControl").prop("checked")){
           				 markers[i].setVisible(true);
           			 }else{markers[i].setVisible(false);}
           		 	}
            	}
        	}
    	
 
    
    
    
    
    
    })
    $('#studyControl').bootstrapToggle({
      on: '研習',
      off: '研習'
    });
    $('#studyControl').change(function() {
    	if(thismon){
        	for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="研習"){
    	   			if($("#studyControl").prop("checked")){
    	   				if(markers[i].now=='thismonth'){
    	   					markers[i].setVisible(true);
    			 		}
    	   			}else{markers[i].setVisible(false);}
       		 	}
        	}
        	}else{
        		for (var i = 0; i < markers.length; i++) {
           		 	if(markers[i].type=="研習"){
        	   			if($("#studyControl").prop("checked")){
           				 markers[i].setVisible(true);
           			 }else{markers[i].setVisible(false);}
           		 	}
            	}
        	}
    	
    })
    $('#movieControl').bootstrapToggle({
      on: '影視',
      off: '影視'
    });
    $('#movieControl').change(function() {
    	if(thismon){
        	for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="影視"){
    	   			if($("#movieControl").prop("checked")){
    	   				if(markers[i].now=='thismonth'){
    	   					markers[i].setVisible(true);
    			 		}
    	   			}else{markers[i].setVisible(false);}
       		 	}
        	}
        	}else{
        		for (var i = 0; i < markers.length; i++) {
           		 	if(markers[i].type=="影視"){
        	   			if($("#movieControl").prop("checked")){
           				 markers[i].setVisible(true);
           			 }else{markers[i].setVisible(false);}
           		 	}
            	}
        	}

    })
    $('#LeisureControl').bootstrapToggle({
      on: '休閒',
      off: '休閒'
    });
    $('#LeisureControl').change(function() {
    	if(thismon){
        	for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="休閒"){
    	   			if($("#LeisureControl").prop("checked")){
    	   				if(markers[i].now=='thismonth'){
    	   					markers[i].setVisible(true);
    			 		}
    	   			}else{markers[i].setVisible(false);}
       		 	}
        	}
        	}else{
        		for (var i = 0; i < markers.length; i++) {
           		 	if(markers[i].type=="休閒"){
        	   			if($("#LeisureControl").prop("checked")){
           				 markers[i].setVisible(true);
           			 }else{markers[i].setVisible(false);}
           		 	}
            	}
        	}
    	
    	
    	
    
    })
    
$('#familyControl').bootstrapToggle({
    on: '親子',
    off: '親子'
  });
$('#familyControl').change(function() {
	if(thismon){
    	for (var i = 0; i < markers.length; i++) {
   		 	if(markers[i].type=="親子"){
	   			if($("#familyControl").prop("checked")){
	   				if(markers[i].now=='thismonth'){
	   					markers[i].setVisible(true);
			 		}
	   			}else{markers[i].setVisible(false);}
   		 	}
    	}
    	}else{
    		for (var i = 0; i < markers.length; i++) {
       		 	if(markers[i].type=="親子"){
    	   			if($("#familyControl").prop("checked")){
       				 markers[i].setVisible(true);
       			 }else{markers[i].setVisible(false);}
       		 	}
        	}
    	}
})
})