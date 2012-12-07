/*
 * jQuery UI 2 horizontal level roll over menu
 * 
 * Copyright (c) 2011 Pieter Pareit
 *
 * http://www.scriptbreaker.com
 *
 */
(function($){
    $.fn.extend({

    //pass the options variable to the function
    twolevel: function(options) {

		var defaults = {
				resetTimer: 1000
			};

			// Extend our default options with those provided.
			var opts = $.extend(defaults, options);
			//Assign current element to variable, in this case is UL element
	 		var $this = $(this);

	 		$this.find("li.active").find("ul").slideDown('fast').show();
	 		var curMenu = $this.find("li.active");
	 	    var closetimer = null;
	 		
	 	    //avoid jumping to the top of the page when the href is an #
	 	    $this.find(">li").each(function(index) {
	 	        if($(this).find("ul").size() != 0){
	 	            if($(this).find("a:first-child").attr('href') == "#"){
	 	                $(this).click(function(){return false;});
	 	            }
	 	        }
	 	    });

	 	    function resetMenu(){  	 	        
	 	    	$this.find("li.active").removeClass("active");  
	 	    	$this.find("ul:visible").slideUp('fast');
	 	        curMenu.find("ul").slideDown('slow').show();
	 	        curMenu.addClass("active");
	 	    }

	 	    function activateTimer(){  
	 	        closetimer = window.setTimeout(resetMenu, opts.resetTimer);
	 	    }

	 	    function cancelTimer(){  
		 	    if(closetimer){  
			 	    window.clearTimeout(closetimer);
					closetimer = null;
				}
			}

	 	   $this.find(">li").hover(function() { //When trigger is hovered...
	 			cancelTimer();
				//Do nothing when the list is open
	 	        if(!$(this).find("ul").is(':visible')){
	 	        	$this.find("li.active").find("ul").hide();
	 	        	$this.find("li.active").removeClass("active");       
	 	            $(this).addClass("active");
	 	           	$(this).parent().find("ul:visible").slideUp('fast');
	 	            $(this).find("ul").slideDown('fast').show(); //Drop down the subnav on hover  
	 	        }
	 	    }, function(){
	 	    		//do not reset the original active menu
			 	    if(($(this).not(curMenu)).length == 1){
		 	    		activateTimer();
			 	    }
	 	        }
 	        );
		}
    });
})(jQuery);