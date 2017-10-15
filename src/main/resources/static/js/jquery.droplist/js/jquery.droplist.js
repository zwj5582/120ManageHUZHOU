(function($) {
	$.fn.dropList = function(options) {
		//var $this = null;
		var opts = $.extend({},$.fn.dropList.defaults, options);
		var init=function($this){
			$this.addClass("droplist");
			$this.children("a").addClass("drop-link");
			$this.children("div").addClass("listcontent");
			if(opts.direction&&opts.direction=='right'){
				var left=$this.outerWidth()-$this.children("div").outerWidth();
			 	$this.children("div").css({left:left});
			}
			$this.hover(function(){
				if(opts.onShow){
					opts.onShow($this);	
				}
				if(opts.toggleActiveClass){
					$this.children("a").addClass(opts.toggleActiveClass);
				}
				$this.children("div").show();
		   	  },function(){
		   		  if(opts.onClose){
					opts.onClose($this);	
				  }
		   		if(opts.toggleActiveClass){
					$this.children("a").removeClass(opts.toggleActiveClass);
				}
		   		  $this.children("a").removeClass(opts.toggleActiveClass);
		   		  $this.children("div").hide();
		   	  });
			buildEvent($this);
		};
		var buildEvent=function($this){
			if(opts.itemElClass){
				var items=$this.find("."+opts.itemElClass);
				if(items){
					if(opts.onItemMouseOver){
						items.build("mouseover",opts.onItemMouseOver);
					 }
					if(opts.onItemMouseOut){
						items.build("mouseout",opts.onItemMouseOut);
					 }
					if(opts.onItemClick){
						items.build("click",opts.onItemClick);
					 }
				}
			}
			
		};
		return this.each(function() {
			//$this = $(this);
			init($(this));
		});
	};
	$.fn.dropList.defaults = {
		itemElClass:'item',
		direction:'left',
		toggleActiveClass:null,
		onItemMouseOver:null,
		onItemMouseOut:null,
		onItemClick:null,
		onShow : null,
		onClose : null
	};
})(jQuery)