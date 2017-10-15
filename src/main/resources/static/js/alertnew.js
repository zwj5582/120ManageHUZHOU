window.alert=function(txt) 
    {       
     var shield = top.window.document.createElement("DIV"); 
     shield.id = "shield"; 
     shield.style.position = "absolute"; 
     shield.style.left = "0px"; 
     shield.style.top = "0px"; 
     shield.style.width = "100%"; 
     shield.style.height =top.window.document.body.scrollHeight+"px"; 
     //shield.style.background = "#333"; 
     shield.style.textAlign = "center"; 
     shield.style.zIndex = "10000"; 
     shield.style.filter = "alpha(opacity=0)"; 
     var alertFram = top.window.document.createElement("DIV"); 
     //alertFram.className="dragAble"; 
     alertFram.id="alertFram"; 
     alertFram.style.position = "absolute"; 
     alertFram.style.left = "50%"; 
     alertFram.style.top = "50%"; 
     alertFram.style.marginLeft = "-225px"; 
     alertFram.style.marginTop = "-75px"; 
     alertFram.style.width = "300px"; 
     alertFram.style.height = "auto"; 
     //alertFram.style.background = "white"; 
     alertFram.style.textAlign = "center"; 
     alertFram.style.lineHeight = "150px"; 
     alertFram.style.zIndex = "10001"; 
     strHtml = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
     strHtml += " <li style=\"background:#568f3c;text-align:left;padding-left:15px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #619c46;\">°®ÐÄEÍøÌáÊ¾</li>\n";
     strHtml += " <li style=\"background:#f9ffdd;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #619c46;border-right:1px solid #619c46;\">"+txt+"</li>\n";
     strHtml += " <li style=\"background:#e9f1c4;text-align:center;font-weight:bold;height:29px;line-height:29px;border-bottom:1px solid #619c46; border-left:1px solid #619c46; border-right:1px solid #619c46;\"><a href=\"#\" onclick=\"doOk()\" onFocus=\"this.blur()\"><img src=\"images/home/qren00.jpg\" width=\"74\" height=\"24\" border=\"0\" onMouseOver=\"this.src='images/home/qren01.jpg'\" onMouseOut=\"this.src='images/home/qren00.jpg'\" style=\"padding-top:3px;\" /></a></li>\n";
     strHtml += "</ul>\n";
     alertFram.innerHTML = strHtml; 
     top.window.document.body.appendChild(alertFram); 
     top.window.document.body.appendChild(shield);  
     var c = 0; 
     top.window.doAlpha = function(){ 
         if (c++>20){self.window.clearInterval(ad);return 0;} 
         shield.style.filter = "alpha(opacity="+c+");"; 
        
     } 
     var ad=self.window.setInterval("parent.doAlpha()",5); 
     top.window.doOk=function(){ 
              alertFram.style.display ="none"; 
              shield.style.display ="none";         
     } 
     alertFram.focus(); 
     top.window.document.body.onselectstart = function(){return false;}; 
     
     
    } 
    var ie= top.window.document.all; 
var nn6= top.window.document.getElementById&&!top.window.document.all; 
var isdrag=false; 
var y,x; 
var oDragObj; 

function moveMouse(e) { 
if (isdrag) { 
oDragObj.style.top  =  (nn6 ? nTY + top.window.e.clientY - y : nTY + top.window.event.clientY - y)+"px"; 
oDragObj.style.left  =  (nn6 ? nTX + top.window.e.clientX - x : nTX + top.window.event.clientX - x)+"px"; 
return false; 
} 
} 

function initDrag(e) { 
var oDragHandle = nn6 ? top.window.e.target :top.window.event.srcElement; 
var topElement = "HTML"; 
while (oDragHandle.tagName != topElement && oDragHandle.className != "dragAble") { 
oDragHandle = nn6 ? oDragHandle.parentNode : oDragHandle.parentElement; 
} 
if (oDragHandle.className=="dragAble") { 
isdrag = true; 
oDragObj = oDragHandle; 
nTY = parseInt(oDragObj.style.top+0); 
y = nn6 ? top.window.e.clientY : top.window.event.clientY; 
nTX = parseInt(oDragObj.style.left+0); 
x = nn6 ? top.window.e.clientX : top.window.event.clientX; 
top.window.document.onmousemove=moveMouse; 
return false; 
} 
} 
top.window.document.onmousedown=initDrag; 
top.window.document.onmouseup=new Function("isdrag=false"); 