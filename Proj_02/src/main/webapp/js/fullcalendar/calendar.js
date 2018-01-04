$(function() {
	var allevent=[];
	var email;
	$.get('checkMemSession.controller',{},function(data){
		email=data;
		if(email!='null'){
			$("#header").load("../commons/header_login.jsp"); 
		  
	var duration;
	$.getJSON('getFavorites.controller', {'email':email }, function (data) {
		$.each(data, function (i, event01) {
			duration=moment(event01.dtStart).format('YYYY-MM-DD')+'~'+moment(event01.durationEnd).format('YYYY-MM-DD');
			//console.log(duration)
			var eventallow={
			 		id: 'available'+event01.eventID,
			 	    start: moment(event01.dtStart).format('YYYY-MM-DD HH:mm:ss'),
			 	    end: moment(event01.durationEnd+86400000).format('YYYY-MM-DD HH:mm:ss'),
			 	    allDay:false,
			 	    rendering: 'background'
			 	};
			console.log(eventallow)
			if(event01.targetDate!=0){
			var event= {
		 		id:event01.eventID,
		 		title: event01.eventName,
			    start: moment(event01.targetDate).format('YYYY-MM-DD HH:mm:ss'),
			    constraint: 'available'+event01.eventID,
			 	url:'../_04_EventPage/eventSelf.jsp?eventID='+event01.eventID,
			    allDay:true,
			 	stick: true,
			 	duration:duration
			};allevent.push(event);
		 	}else{
			$('#external-events-listing').append('<div class="fc-event" duration='+duration+' title='+duration+' value='+event01.eventID+ 
			'>'+event01.eventName+'</div>')
			}
			//console.log(event)
		allevent.push(eventallow)
		});
		//console.log(allevent)
		var isEventOverDiv = function(x, y) {
			var external_events = $( '#external-events' );
            var offset = external_events.offset();
            offset.right = external_events.width() + offset.left;
            offset.bottom = external_events.height() + offset.top;
            // Compare
            if (x >= offset.left
                && y >= offset.top
                && x <= offset.right
                && y <= offset .bottom) { return true; }
            return false;

        }
		
	/* initialize the external events
	-----------------------------------------------------------------*/

	$('#external-events .fc-event').each(function() {
		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			id:$(this).attr('value'),
			title: $.trim($(this).text()), // use the element's text as the event title
			constraint: 'available'+($(this).attr('value')),
			url:"../_04_EventPage/eventSelf.jsp?eventID="+$(this).attr('value'),
			stick: true, // maintain when user navigates (see docs on the renderEvent method)
		});
		
		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
	});
	/* initialize the calendar
	-----------------------------------------------------------------*/
	$('#calendar').fullCalendar({
		events:allevent,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: moment(),
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function() {
			$(this).remove();	
		},
		/*eventDrop: function(event, delta, revertFunc) {
            //alert(event.title + " was dropped on " + event.start.format());
            if (!confirm("Are you sure about this change?")) {
                revertFunc();
            }
        },
        */
        eventDragStop: function( event, jsEvent, ui, view ) {
            if(isEventOverDiv(jsEvent.clientX, jsEvent.clientY)) {
                $('#calendar').fullCalendar('removeEvents', event.id);
                var el = $( '<div class="fc-event" title='+event.duration+' value='+event.id+'>' ).appendTo('#external-events-listing').text( event.title );
                console.log(el)
                el.draggable({
                  zIndex: 999,
                  revert: true, 
                  revertDuration: 0 
                });
                el.data('event', { 
                	title: event.title, 
                	id :event.id, 
                	stick: true ,url:"../_04_EventPage/eventSelf.jsp?eventID="+event.id,
                	duration:event.duration
                });
            }
        },
        /*eventClick: function(event, element) { 
             
            alert(event.id+event.title);
            $('#calendar').fullCalendar('updateEvent', event); 
        },*/
    	navLinks: true, // can click day/week names to navigate views
		eventLimit: true // allow "more" link when too many events
		});
	});
	//儲存行事曆
	var data0=[];
	var data1=[];
	$('#GGG').click(function(){
		var getallevent=$('#calendar').fullCalendar('clientEvents');
		$.each(getallevent, function (i, event01) {
			event01.id=(event01.id).toString();
			if((event01.id).length<9){
				var id=event01.id
				var date=moment(event01.start).format('YYYY-MM-DD HH:mm:ss')
				console.log(event01.id+this)
				data0=('eventid='+id+' '+'targetdate='+date+' email='+email);
				data1.push(data0);
			}
		});
		getallevent=data1.join();
		$.post('savecalendar.controller',{'getallevent':getallevent,'email':email},function(){
			alert("更新行事曆成功");	
		});
		
	});
	//清空行事曆
	$('#YYY').click(function(){
		var getallevent=$('#calendar').fullCalendar('clientEvents');
		$.each(getallevent, function (i, event01) {
			event01.id=(event01.id).toString()
			if((event01.id).length< 9){
				$('#calendar').fullCalendar('removeEvents', event01.id);
				var el = $( '<div class="fc-event" title='+event01.duration+' value='+event01.id+'>').appendTo('#external-events-listing').text(event01.title);
				el.draggable({
                  zIndex: 999,
                  revert: true, 
                  revertDuration: 0 
                });
                el.data('event', { 
                	title: event01.title,
                	id :event01.id,
                	stick:true,
                	url:"../_04_EventPage/eventSelf.jsp?eventID="+event01.id,
                	duration:duration
                });
			}
		});
	});
	} else{
			$("#header").load("../commons/header.jsp"); 
			alert('請先登入會員')
		}
		
	});
	$("#footer").load("../commons/footer.jsp"); 

});



