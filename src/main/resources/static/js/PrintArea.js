var hkey_root="HKEY_CURRENT_USER" ; 
var hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
var hkey_key; 

function printme()
{
     document.body.innerHTML=document.getElementById('div1').innerHTML;
     window.print();
}
//设置纸张方向 
function SetupLandscape() 
{ 
     try{ 
   var wsShell= new ActiveXObject("WScript.Shell"); 
   //打印页面的Menubar必须可见，此操作类似按键盘上的Alt+F+U也就是 调出页面设置对话框 
   wsShell.sendKeys('%fu'); 
   //此操作类似按键盘上的Alt+A也就是 设置横向打印 
   wsShell.sendKeys('%a'); 
   //此操作类似按键盘上的回车 页面设置对话框的默认焦点在 确定上 所以直接确定 
   wsShell.sendKeys('{ENTER}'); 
     } 
     catch(e){} 
} 

//设置默认的页眉页脚为空及页边距
function SetupPage() 
{ 
     try{ 
   var RegWsh = new ActiveXObject("WScript.Shell"); 
   hkey_key="header" 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"") 
   hkey_key="footer" 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"") 
   hkey_key="margin_bottom"; 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"0.24");  
   hkey_key="margin_left"; 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"0.24"); 
   hkey_key="margin_right"; 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"0.24"); 
   hkey_key="margin_top"; 
   RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"0.24"); 
     } 
     catch(e){} 
} 
function DoPrint(){
setTimeout("SetupLandscape()",1000); 
setTimeout("SetupPage()",2000); 
setTimeout("printme()",3000); 
	}