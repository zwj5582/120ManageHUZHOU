
(function ($)
{
	$.fn.dropMenu = function (options)
	{
		var $this = null;
		var menuHTML = '';
		var min = false;
		var opts = $.extend({},$.fn.dropMenu.defaults, options);
		var activeMenu=null;
		var init = function (menus,build)
		{
			menuHTML = '';
			if(!menus){
				menus=opts.menu;
			}
			menuHTML += '<ul  class="menu-full rm" >';
			for(var i = 0; i <menus .length; i++)
			{
				var dropiconClass = "dropicon";
				var menu = menus[i];
				var url="javascript:void(0)";
				if(menu.url){
					url=menu.url+opts.ext;
				}
				if(!menu.children || menu.children.length == 0)
				{
					dropiconClass = "";
				}
				var icon=menu.icon;
				if(!icon){
					icon='home';
				}
				menuHTML += '<li>';
				menuHTML += '<a title="'+menu.name+'"  href="'+url+'" class="li-a" target="'+menu.target+'" ><span><nobr><img class="m-icon" src="'+opts.iconBase+icon+'.png" ><span class="text">' + menu.name + '</span></nobr></span><i class="' + dropiconClass + '"></i></a>';
				createChildren(menu.children, 1);
				menuHTML += '</li>';
			}
			menuHTML += '</ul>';
 			$this.html(menuHTML);
 			if(!build){
 				buildEvent(build);
 			}
		};

		var createChildren = function (menu, level)
		{
			if(menu && menu.length > 0)
			{
				menuHTML += '<ul class="padding-left' + level + '">';
				for(var i = 0; i < menu.length; i++)
				{
					var dropiconClass = "dropicon";
					var url="javascript:void(0)";
					if(menu[i].url){
						url=menu[i].url+opts.ext;
					}
					if(!menu[i].children || menu[i].children.length == 0)
					{
						dropiconClass = "";
					}
					menuHTML += '<li>';
					menuHTML += '<a href="'+url+'" title="'+menu[i].name+'"   class="li-a"  target="'+menu[i].target+'"  ><span><nobr >' + menu[i].name + '</nobr ></span><i class="' + dropiconClass + '"></i></a>';
					var clevel = level + 1;
					createChildren(menu[i].children, clevel);
					menuHTML += '</li>';
				}
				menuHTML += '</ul>';
			}
		};

		var buildEvent = function (build)
		{
			$(".rm .li-a").click(click1);
			if(!build&&opts.shrinkBtn)
			{  
			 var shrinkBtn =opts.shrinkBtn;
			   if( opts.shrinkBtn instanceof Object==false ){
				 shrinkBtn=$("#" + opts.shrinkBtn) || $("." + opts.shrinkBtn) || $(opts.shrinkBtn);
			   }
			  if(shrinkBtn)
				{
					shrinkBtn.click(shtoggle);
				}
			}
		};

		var shtoggle = function ()
		{
			if(opts.onShrink){
				opts.onShrink(min);
			}
			if(!min)
			{
				_min();
			}
			else
			{
				max();
			}
			//$this.children("ul").toggleClass("menu-min");
		};
		
		var _min=function(){
			min = true;
			$this.find("li > ul").hide();
			$(".rm  .li-a").unbind("click");
			$(".rm  li").mouseenter(mousein).mouseleave(mouseout);
			 $this.children("ul").addClass("menu-min");
		};
		
		var max=function(){
			 min = false;
			 $(".rm   li").unbind("mouseenter").unbind("mouseleave");
			 $(".rm  .li-a").click(click1);
			 $this.children("ul").removeClass("menu-min");
		};
		
		
		var click1=function(){
			doLigh($(this));
		var childUL=$(this).parent().children("ul");
		 var iel=$(this).children("i");
		 if(childUL){
			 if(!childUL.is(":visible")){
			 childUL.show();
			 iel.addClass("dropicon-on");  
			 }else{
				click2(childUL,iel) ;
			}
		 }
	   
};
var click2=function (childUL,iel){
			 if(childUL){
			   childUL.parent().find("ul").hide();
			  childUL.parent().find("i").removeClass("dropicon-on");
		 }
};


var doLigh=function(_this){
	if(_this.attr("href")!='javascript:void(0)'){
	  if(activeMenu){
		activeMenu.removeClass("lighbg");
	  }
	  activeMenu=_this;
	  activeMenu.addClass("lighbg");
	}
}

var mousein=function(e){
	var _this=$(this);
   var cul=_this.children("ul");
   if(cul&&cul.length>0){
	   cul.show();
	   cul.addClass("hover-on");
	   var position=_this.position();
	   var left=position.left+_this.outerWidth()-1;
	   var top=position.top;
	   cul.css({top:top,left:left});
	   _this.addClass('li-hover');
 	}
	  e.stopPropagation();
};

var mouseout=function(e){
	var _this=$(this);
	var cul=_this.children("ul");
   if(cul&&cul.length>0){
 	   cul.removeClass("hover-on");
	   cul.css({display:'none'});
	  _this.removeClass('li-hover');
 	}
};

var flash=function(menu){
	if(menu){
		clear();
		init(menu,true);
		min = true;
		shtoggle();
	}
};

var clear=function(){
	$this.find(".li-a").unbind("click");
	$this.find("li").unbind("mouseenter").unbind("mouseleave");
	$this.children(".rm").remove();
};

		this.each(function ()
		{
			$this = $(this);
			init();
		});
		return {flash:flash};
	};
	$.fn.dropMenu.defaults = {
		width: 240,
		menu: [],
		ext:'',
		iconBase:'images/',
		shrinkBtn: null,
		onShrink:null
	};
})(jQuery);