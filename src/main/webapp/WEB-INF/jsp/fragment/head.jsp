<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

<script src="js/bootstrap/datepicker/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/bootstrap/datepicker/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap/datepicker/locales/bootstrap-datetimepicker.fr.js"></script>
<script src="js/bootstrap/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/meliora-utils.js" type="text/javascript"></script>
<link id="theme_style" rel="stylesheet" type="text/css" href="css/style-${clientTheme}.css" />
<script type="text/javascript">
	var msgLength = 100;
	var message = "${message}";
	var flag = false;
	if (!flag){
		if (message.length > 0) {
			flag = true;
			var msgContent = '';
			for (var i = 0; i < message.length; ++i){
				msgContent += message[i];
				if ((i+1) % msgLength == 0){
					msgContent += "\n";
				}
			}
			alert(msgContent);
		}
	}
	
	/*var error = "${exception.message}";
	if (!flag){
		if (error.length > 0) {
			flag = true;
			var errContent = '';
			for (var i = 0; i < error.length; ++i){
				errContent += error[i];
				if ((i+1) % msgLength == 0){	
					errContent += "\n";
				}
			}
			alert(errContent);
		}
	}*/
	
	function changeTheme(theme){
		if(theme){
			document.getElementById("theme_style").href="css/style-"+theme+".css";
		}
	}
	$.doSubText=true;
	$.dataList_bottom_offset=30;
	$(function(){
		initDataListHeight();
		if($.doSubText){
			subText();
		}
		
	});
	 
	function subText(){
		var table=$(".substrtab");
		if(table){
			var ths=table.find("th[class^='sub_']");
			if(ths&&ths.length>0){
				var lengths=[];
				$.each(ths,function(i,v){
					v=$(v);
					var length=getSubLength(v.attr("class"));
					if(length){
						lengths[i]=length;	
					}
				});
				if(lengths&&lengths.length>0){
					var trs=table.children("tr");
					$.each(trs,function(i,tr){
						var tds=$(tr).children("td");
						$.each(tds,function(j,td){
							if(lengths[j]){
								subTdText($(td),lengths[j]);
							}
						});
					});
				}
			}else{
				var tds=table.find("[class^='sub_']");
				doSub(tds);
			}
		}
	}
	
	function doSub(tds,length){
		$.each(tds,function(i,v){
			subTdText($(v),length);
		});
	}
	
	function subTdText(td, length){
		if(!length){
			 length=getSubLength(td.attr("class"));
		}
		if(length){
			var text=td.text();
			if(text){
			  if(text.length>length){
				  td.text(text.substring(0,length)+"...");
			  }
			}
		}
	}
	
	function getSubLength(cls){
		if(cls){
			return cls.substring(4,cls.length)||null;
		}
		return null;
	}
	
	function initDataListHeight(){
		var list=$("#listContent");
		if(list.length>0){
			var clientHeight=$(window).height();
 			var oldHeight=list.height();
			var newHeight=$(window).height()-list.offset().top-$.dataList_bottom_offset;
			if(oldHeight>newHeight){
				var hg=parseFloat(newHeight/clientHeight)*100;
				list.css({height:hg+'%'});
			}
		}
	}

</script>
<style >
		body,html{
			overflow: auto;
		}
	
	</style>