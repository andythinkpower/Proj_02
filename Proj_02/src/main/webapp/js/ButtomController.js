/*<input onclick="musicControl();" type=button value="音樂 顯示/隱藏">
    <input onclick="exhibitionControl();" type=button value="展覽 顯示/隱藏">
    <input onclick="performanceControl();" type=button value="表演 顯示/隱藏">
	<input onclick="studyControl();" type=button value="研習 顯示/隱藏">
	<input onclick="movieControl();" type=button value="影視 顯示/隱藏">
	<input onclick="LeisureControl();" type=button value="休閒 顯示/隱藏">
	<input onclick="familyControl();" type=button value="親子 顯示/隱藏">
*/ 
function musicControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="音樂"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function exhibitionControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="展覽"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function performanceControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="表演"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function studyControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="研習"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function movieControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="影視"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function LeisureControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="休閒"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }
function familyControl() {
	for (var i = 0; i < markers.length; i++) {
    		 if(markers[i].type=="親子"){
    		 if(markers[i].getVisible()){
    		 markers[i].setVisible(false);
    		 
    		 }else{markers[i].setVisible(true);}
    		}
     		}
    }