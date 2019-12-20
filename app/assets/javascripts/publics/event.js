$(function () {
	$(document).ready(function(){
		var userEvents = $('#user-events').data('event-id');
	    var calendar = $('#calendar').fullCalendar({
	        events: userEvents,
	        eventLimit: true,
	        selectable: true,
	        selectHelper: true,
	        ignoreTimezone: false,
	        // select: select,
	        eventClick: function(event) {
	        	alert('ゲーム名:' + '\n' + event.title + '\n内容:'+ '\n' + event.description + '\n開始時間:' + '\n' + event.start.format('YYYY年MM月DD日 HH:mm') + '\n終了時間:' + '\n' + event.end.format('YYYY年MM月DD日 HH:mm'));
	        },
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'month,agendaDay'
		    },
	    });
	});
});