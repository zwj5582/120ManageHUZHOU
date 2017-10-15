/*******************************************************************************
 * 
 * 
 ******************************************************************************/  
(function($){
	$.fn.multiSelect=function(opt){
		var needfinilize=false;
		var _sindex =0;
		var defaults={
			           id:"select"+Math.round(Math.random()*10000000),
					   dataSource:null,
		               onSelect:null,
		               onClose:function(obj,divId) {
							$("#"+divId).val($(obj).attr('name'));
					   },
					   onOpen:null,
					   url:null,
					   Single:false,
					   objType:null,
					   readonly:false,
					   valueEleName:null,
					   wordWrap:false,
					   type:0,
					   relateDiv:null,
					   required:false,
					   needMin:false,
					   quantity:0,
					   style:{width:140,height:140,borderColor:"#CCC"}
		             };
				 opt = $.extend(defaults, opt);  
				 var timer=null;
			     var oldtxt='';
			    
				 	 var init=function(obj){
				 		_sindex=0;
				 	 	var btnID=opt.id+"Btn";
				 	 	
						 if(opt.readonly){
							 obj.attr("readonly",true);
							 }
							 try{
							 opt.dataSource.hide();
							 }catch(e){}
					  if(opt.type==0){
							if(!obj.hasClass("multinput")){								
								var width=obj.width()+6;
								obj.attr("class","multinput");
								obj.width(width-22);
								if(opt.needMin){
		                            obj.wrap('<div class="multinputDiv" style="width:'+width+'px;min-height:30px;"></div>');
									obj.parent(".multinputDiv").append('<div  id="'+btnID+'" class="active" style="min-height:30px;"></div> ');
									obj.parent(".multinputDiv").css({"background":" url('images/inputbg.gif') repeat-x","min--height":'30px',"border":"1px solid #b8def5"});
								}else{
									obj.height(obj.height()-2);								
		                            obj.wrap('<div class="multinputDiv" style="width:'+width+'px;height:30px;"></div>');
									obj.parent(".multinputDiv").append('<div  id="'+btnID+'" class="active" style="height:30px;"></div> ');
									obj.parent(".multinputDiv").css({"background":" url('images/inputbg.gif') repeat-x","max-height":'30px',"border":"1px solid #b8def5"});
								}
							}
					  }else{
						  if(!obj.hasClass("multinput")){
							   var width=obj.width()+20;
							   var height=obj.height()+6;
							//   obj.attr("class","multinput");
							   		obj.width(width-22);
							  obj.wrap('<div class="multinputDiv" style="width:'+width+'px;overflow:visible;"></div>');
							  obj.parent(".multinputDiv").append('<div  id="'+btnID+'"  class="block" style="width:16px;height:'+height+'px;"></div>');
							  obj.css({"border":"1px solid #b8def5"});
						    }
					}
						 if(opt.required){
								obj.parent(".multinputDiv").parent().append('<div class="required" style="height:30px;margin-left:6px;">*</div>');
						 } 
						  if(opt.valueEleName!=null){
						  obj.after('<input type="hidden" name="'+opt.valueEleName+'"  /> ');
						  }
						  
						  obj.keyup(function(event){
							  //40：下， 38：上， 13：回车
							  var id=opt.id;
							  if(opt.Single){
								  keyselect(obj);
							  }
							  //alert(event.keyCode);
							 
							  if((event.keyCode<48 || event.keyCode>57 && event.keyCode<65 || event.keyCode>90 ) && event.keyCode!=8 && event.keyCode!=32){
								  return ;
							  }
							  
							  $("#"+id).remove();
							 
							  needfinilize=false;
							  	if(timer!=null){
							  		obj.removeClass("loading");
							  		clearTimeout(timer);
							  	}
								  var txt=$(this).val().toLowerCase();
								  		if(oldtxt!=txt){
								  			 		$(this).removeClass("loading");
								  			$(this).addClass("loading");
								  		bindevent($(this),txt);	
					                     }
								  		 oldtxt=txt;
								  	if(txt == '' && opt.Single){
								  		$("#"+opt.relateDiv).val('');
								  	}
								  	
								  });
						  $("#"+btnID).click(function(){
							  needfinilize=true;
						  });
						  return btnID;
					  };
				 
				   var bindevent = function (o,ctxt) {	
					   if(!opt.Single){
						   //alert($("#"+opt.relateDiv).html());
						   var _name_div = $("#"+opt.relateDiv);
						   _ids1 = _name_div.find(":hidden").val();
						   _ids1 = ","+_ids1+",";
					   }
					  _sindex =0;
					  var id=opt.id;
					 // var obj=$(o);
					  var obj=o;
					  var name=obj.attr("name");
					  var width=obj.width()-2;
					  var height=obj.height();
					  if(width<80){ width=140;}
					  if(height<80){  height=180;  }
					  if ($("#" + id).length > 0)  return;  
					  var html='<div class="multiSelect" id="' + id + '"  ></div>';	
					  var left = obj.offset().left;
                      var top = obj.offset().top + obj.height() ; 
				    $("body").append(html);
				      var multiSelect=$("#" + id);		
				      multiSelect.width(width + 24);
				     
					  multiSelect.css({ top: top, left: left-3 });
					  var winWid=$(window).width();
					  var winHei=$(window).height();
					  
					  
					  if(opt.type>0){
						  multiSelect.css({ top: top, left: left+multiSelect.width() });
                        if(winWid<left){
							   multiSelect.css({ left: winWid-multiSelect.height() -5 });
						  }
					  }  
					 // alert(top+"::"+winHei+"::"+multiSelect.height());
					  //if(winHei<top){ 
							   multiSelect.css({ top: top-multiSelect.height() -5 });
					 // }
					  if(opt.type!=0){
					  multiSelect.width(200);
					  }
				 //  alert( multiSelect.css("top"));
				     html="<div class='items'>";
				       if(opt.dataSource instanceof  Array){
				    	   	var data=opt.dataSource;
				    	    var x = 0;
				    	    if(ctxt != null && ctxt != '' ){
								if(opt.objType == 'object'){
									$.each(data,function(i,v){
										//alert(i+":"+v.name+":"+x);
										if(x==20 && opt.Single){
											return false;
										}
										if(v.pinyin.indexOf(ctxt)>-1){
											html+=bulidHtml(v.name,v.id);
											x++;	
										}
									}); 
								}else{
									$.each(data,function(i,v){
										//alert(i+":"+v.name+":"+x);
										if(x==10){
											return false;
										}
										if(v.pinyin.indexOf(ctxt)>-1){
											html+=bulidHtml(v.name,v.id);
											
											x++;	
										}
									});
								}
									
							}else{
								if(opt.objType == 'object'){
									$.each(data,function(i,v){
										//alert(v.id+":"+v.name+":"+x);
										if(x==20 && opt.Single){
											return false;
										}
										html+=bulidHtml(v.name,v.id);
										
										x++;	
									}); 
								}else{
									$.each(data,function(i,v){
										//alert(i+":"+v.name+":"+x);
										if(x==10){
											return false;
										}
										html+=bulidHtml(v.name,v.id);
										x++;	
									});
								}
							}
							
					  }else if(typeof(opt.dataSource) == "object" 
						  && Object.prototype.toString.call(opt.dataSource).toLowerCase() == "[object object]" && !opt.dataSource.length){
						    var data=opt.dataSource;
						    var x = 0;
									$.each(data,function(i,v){										
											if(ctxt != null && ctxt != '' ){
												if(opt.objType == 'object'){
													if(x==20 && opt.Single){
														return false;
													}
													if(v.name.indexOf(ctxt)>-1){
														html+=bulidHtml(v.name,i);
														x++;
													}	
													
												}else{
													if(v.indexOf(ctxt)>-1){
														html+=bulidHtml(v,i);
													}
												}
											}else{
												if(opt.objType == 'object'){
													if(x==20 && opt.Single){
														return false;
													}
													x++;
													html+=bulidHtml(v.name,i);
												}else{
													html+=bulidHtml(v,i);
												}
												
											}
									});
										
										 
					 }else{
						 if(opt.objType == 'object'){
								 $.ajax({
										 url:opt.url+"&&saaad="+Math.random(),
										 data:{
											 pinyin:ctxt
										 },
										 async:false,
										 success:function(returnValue){
											 var _data = JSON.parse(returnValue);
												$.each(JSON.parse(returnValue),function(i,v){
													
													html+=bulidHtml(v.name,v.id);											
													shareList[v.id] = v.share;	 
													
												}); 
												
											}
								 
							 });
						 }
							
					  }
						multiSelect.append(html+'</div>');	
						$("#" + id + " .item").parent().find("div").eq(0).addClass("light");
						if(!opt.Single){
							var htm='<div class="toolbar"><div id="all1"><input type="checkbox" id="all" />全选</div> <input type="button" value="确定" id="ok" /> </div>';
							multiSelect.append(htm);	 
							}

						
					
						
				var finalize = function () {					
					//	obj.width(width);
                  $("#" + id + " .item").die('click');  
			 	  $("#" + id + " #all").die('click'); 
				  $("#"+id+" #ok").die('click');
				  obj.parent().children("input").die('click');
                  multiSelect.remove();
                 }
				
				   if(opt.Single){
					   $("#" + id + " .item").live('click', function () {
						   opt.onClose($(this),opt.relateDiv);	
                              $(o).val($(this).text());
							  if(opt.onSelect!=null){
								  opt.onSelect($(this));
							  }
						 if(opt.valueEleName!=null){
					      $(o).next().val($(this).attr("value"));
					      }
                             finalize();
                 
                  });
				   }
				  
				  
				  if(!opt.Single){
				  $("#" + id + " #all").live("click",function(){
					  if($(this).attr("checked")){
						  $("#" + id).find("input:checkbox").attr("checked",true);
					  }else{
						  $("#" + id).find("input:checkbox").attr("checked",false);
					  }
					  	
					  });
			  	 
				   
				  $("#"+id+" #ok").live("click",function(){
					var  sel=$("#" + id+" .item").find("input:checked");
					opt.onClose(sel,opt.relateDiv);
					
						   finalize(); 
					  });
				  }
				  
					$(document).click(function(event) {
						
				    	if(!($(event.target).parents().andSelf().is('#'+opt.id))&&!($(event.target).parents().andSelf().is('#'+opt.id+"Btn"))){ 
				            finalize();				            
						}
				   });	  
					$(".item").mouseover(function(){
						_sindex= $(this).parent().children().index($(this));
						setLite($(this).parent(),_sindex);
					});	
			   };
			   
			   var bulidHtml = function(v,i){
				   
					var _html="";
					if(opt.Single){ 
						_html+='<div  class="item" value="'+v+'" name="'+i+'"><span >'+v+'</span></div>'; 
					}else{
						var _id1 = ","+i+",";
						if(_ids1.indexOf(_id1)<0){
							_html+='<div class="item"><input type="checkbox" name="'+i+'" value="'+v+'"  /><span>'+v+'</span></div>';
						}else{
							_html+='<div class="item"><input type="checkbox" name="'+i+'" value="'+v+'" checked="true" /><span>'+v+'</span></div>';
						}
						
					}
					return _html;			
				};	  
			   
			   
				
			   var keyselect = function (o) {					
					var id=opt.id;
					 var _itemdiv= $("#" + id + " .item").parent();
					 
					  if(event.keyCode == 40 || event.keyCode == 38){
						  //alert($(obj).parent().parent().parent().html());
						  //alert($("#" + id + " .item").parent().html());
						  //document.documentElement.style.overflow='hidden';
						  if(event.keyCode == 40){
							  if(_sindex == (_itemdiv.find("div").length-1)){
								  return false;
							  }
							  _sindex++;
						  }
						  if(event.keyCode == 38 ){
							  if(_sindex ==0){
								  return false;
							  }
							  _sindex--;
						  }
						 
						  setLite(_itemdiv,_sindex);
						  return false;
					  }
					  if(event.keyCode == 13){
						  var _selectDiv = _itemdiv.find("div").eq(_sindex);
						  if(_selectDiv.html() == null){
							  return;
						  }
						  opt.onClose(_selectDiv,opt.relateDiv);	
                          $(o).val(_selectDiv.text());
						  if(opt.onSelect!=null){
							  opt.onSelect(_selectDiv);
						  }
						 if(opt.valueEleName!=null){
					      $(o).next().val(_selectDiv.attr("value"));
					      }
						 $("#" + id + " .item").die('click');  
					 	  $("#" + id + " #all").die('click'); 
						  $("#"+id+" #ok").die('click');
						 $(o).parent().find("input").die('click');
						  $("#" + id ).remove();
					  }
                };	   
		function setLite(_itemdiv1,_sindex1){
			_itemdiv1.find("div").removeClass("light");
			_itemdiv1.find("div").eq(_sindex1).addClass("light");
		}		   
		this.each(function () {			
             if ($(this).is(":text")||$(this).is("textarea")||$(this).is("div")) {            	 
				var btnID= init($(this));
				var _this=$(this);
				$("#"+btnID).keydown(function(event){
					  //40：下， 38：上， 13：回车
					if(opt.Single){
							return keyselect(_this);
					}
					
					  });
				
						
				  
				  $("#"+btnID).live("click",function(){
				      bindevent(_this); 
					  });
              }
         });		 
		};
	})(jQuery);
