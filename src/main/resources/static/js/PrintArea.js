var hkey_root="HKEY_CURRENT_USER" ; 
var hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"; 
var hkey_key; 

function printme()
{
     document.body.innerHTML=document.getElementById('div1').innerHTML;
     window.print();
}
//����ֽ�ŷ��� 
function SetupLandscape() 
{ 
     try{ 
   var wsShell= new ActiveXObject("WScript.Shell"); 
   //��ӡҳ���Menubar����ɼ����˲������ư������ϵ�Alt+F+UҲ���� ����ҳ�����öԻ��� 
   wsShell.sendKeys('%fu'); 
   //�˲������ư������ϵ�Alt+AҲ���� ���ú����ӡ 
   wsShell.sendKeys('%a'); 
   //�˲������ư������ϵĻس� ҳ�����öԻ����Ĭ�Ͻ����� ȷ���� ����ֱ��ȷ�� 
   wsShell.sendKeys('{ENTER}'); 
     } 
     catch(e){} 
} 

//����Ĭ�ϵ�ҳüҳ��Ϊ�ռ�ҳ�߾�
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