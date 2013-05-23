//= require jquery
//= require jquery_ujs
//= require_tree .

Pusher.log = function(message) {
      if (window.console && window.console.log) window.console.log(message);
    };

    var pusher = new Pusher('9856db9c55d87645c0c2');
    var channel = pusher.subscribe('banter');

    $(document).ready(function() {
    	
    	channel.bind('new_message', function(data) {

      		$(".messages-" + data.room_id).append(data.message_html);

    	});

    	channel.bind("logged_in", function (data) {
    		$("#log").append("<li>" + data.name + " logged in</li>");
    	});

    	channel.bind("logged_out", function (data) {
    		$("#log").append("<li>" + data.name + " logged out</li>");
    	});

    });


    
