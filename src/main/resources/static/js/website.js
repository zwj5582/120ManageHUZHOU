var xmlHttp;    

function fetchUserDatils(id) {
	url="details!userDetail.action?userId="+id;
	window.location.href=url;
}
function fetchUnitDatils(id) {
	url="details!unitDetail.action?orgId="+id;
	window.location.href=url;
}
function fetchProjectDatils(id) {
	url="donateProject!projectDetails.action?projectId="+id;
	window.location.href=url;
}

function toDonateProject(){
	url="donateProject.action";
	window.location.href=url;
}
 


function overDue(end){
	var nowTime=getNowTime();
	var endTime= getDateTime(end);
	if(endTime.getTime()<nowTime.getTime()){
		return true;
	}else{
		return false;
	}
}

function getNowTime(){
	var today=new Date();
	var year1=today.getFullYear()
	var month1=today.getMonth()+1;
	var day1= today.getDate();	
	var hour1 = today.getHours();
	var minute1 = today.getMinutes();
	var second1 = today.getSeconds();
	
	return new Date(year1,month1-1,day1,hour1,minute1)
}

function getDateTime(date){
	temp=date.split(" ");
	temp1=temp[0].split("-");
	var year2=temp1[0];
	var month2=temp1[1];
	var day2=temp1[2];
	temp2=temp[1].split(":");
	var hour2=temp2[0];
	var minute2=temp2[1];	
	//var second2=temp2[2];	
	return new Date(year2,month2-1,day2,hour2,minute2);
}

function cacelProject(id,endDate){

		document.getElementById("myDonate_joinProjectId").value=id;
		document.getElementById("open_e").click();

}

function submitCancel(){
	var res=document.getElementById("myDonate_reason").value;
	if(res==''){
		alert("������ԭ��");
	}else{
		document.forms[0].action="myDonate!cancelJoin.action";
		document.forms[0].submit();
		
	}
}

function addEvent(obj,evtType,func,cap){
    cap=cap||false;
 if(obj.addEventListener){
     obj.addEventListener(evtType,func,cap);
  return true;
 }else if(obj.attachEvent){
        if(cap){
         obj.setCapture();
         return true;
     }else{
      return obj.attachEvent("on" + evtType,func);
  }
 }else{
  return false;
    }
}
function getPageScroll(){
    var xScroll,yScroll;
 if (self.pageXOffset) {
  xScroll = self.pageXOffset;
 } else if (document.documentElement && document.documentElement.scrollLeft){
  xScroll = document.documentElement.scrollLeft;
 } else if (document.body) {
  xScroll = document.body.scrollLeft;
 }
 if (self.pageYOffset) {
  yScroll = self.pageYOffset;
 } else if (document.documentElement && document.documentElement.scrollTop){
  yScroll = document.documentElement.scrollTop;
 } else if (document.body) {
  yScroll = document.body.scrollTop;
 }
 arrayPageScroll = new Array(xScroll,yScroll);
 return arrayPageScroll;
}
function GetPageSize(){
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = document.body.scrollWidth;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight){
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else {
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) {
        windowWidth = self.innerWidth;
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) {
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    if(yScroll < windowHeight){
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    if(xScroll < windowWidth){
        pageWidth = windowWidth;
    } else {
        pageWidth = xScroll;
    }
    arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight)
    return arrayPageSize;
}

var AdMoveConfig=new Object();
AdMoveConfig.IsInitialized=false;
AdMoveConfig.ScrollX=0;
AdMoveConfig.ScrollY=0;
AdMoveConfig.MoveWidth=0;
AdMoveConfig.MoveHeight=0;
AdMoveConfig.Resize=function(){
    var winsize=GetPageSize();
    AdMoveConfig.MoveWidth=winsize[2];
    AdMoveConfig.MoveHeight=winsize[3];
    AdMoveConfig.Scroll();
}
AdMoveConfig.Scroll=function(){
    var winscroll=getPageScroll();
    AdMoveConfig.ScrollX=winscroll[0];
    AdMoveConfig.ScrollY=winscroll[1];
}
addEvent(window,"resize",AdMoveConfig.Resize);
addEvent(window,"scroll",AdMoveConfig.Scroll);
function AdMove(id){
    if(!AdMoveConfig.IsInitialized){
        AdMoveConfig.Resize();
        AdMoveConfig.IsInitialized=true;
    }
    var obj=document.getElementById(id);
    obj.style.position="absolute";
    var W=AdMoveConfig.MoveWidth-obj.offsetWidth;
    var H=AdMoveConfig.MoveHeight-obj.offsetHeight;
    var x = W*Math.random(),y = H*Math.random();
    var rad=(Math.random()+1)*Math.PI/6;
    var kx=Math.sin(rad),ky=Math.cos(rad);
    var dirx = (Math.random()<0.5?1:-1), diry = (Math.random()<0.5?1:-1);
    var step = 1;
    var interval;
    this.SetLocation=function(vx,vy){x=vx;y=vy;}
    this.SetDirection=function(vx,vy){dirx=vx;diry=vy;}
    obj.CustomMethod=function(){
        obj.style.left = (x + AdMoveConfig.ScrollX) + "px";
        obj.style.top = (y + AdMoveConfig.ScrollY) + "px";
        rad=(Math.random()+1)*Math.PI/6;
        W=AdMoveConfig.MoveWidth-obj.offsetWidth;
        H=AdMoveConfig.MoveHeight-obj.offsetHeight;
        x = x + step*kx*dirx;
        if (x < 0){dirx = 1;x = 0;kx=Math.sin(rad);ky=Math.cos(rad);}
        if (x > W){dirx = -1;x = W;kx=Math.sin(rad);ky=Math.cos(rad);}
        y = y + step*ky*diry;
        if (y < 0){diry = 1;y = 0;kx=Math.sin(rad);ky=Math.cos(rad);}
        if (y > H){diry = -1;y = H;kx=Math.sin(rad);ky=Math.cos(rad);}
    }
    this.Run=function(){
        var delay = 10;
        interval=setInterval(obj.CustomMethod,delay);
        obj.onmouseover=function(){clearInterval(interval);}
        obj.onmouseout=function(){interval=setInterval(obj.CustomMethod, delay);}
    }
}

