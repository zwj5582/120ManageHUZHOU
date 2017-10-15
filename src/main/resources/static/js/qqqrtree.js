/*--------------------------------------------------|

| dTree 2.05 | www.destroydrop.com/javascript/tree/ |

|---------------------------------------------------|

| Copyright (c) 2002-2003 Geir Landr?              |

|                                                   |

| This script can be used freely as long as all     |

| copyright messages are intact.                    |

|                                                   |

| Updated: 17.04.2003                               |

|--------------------------------------------------*/



// Node object



function Node(id, pid, name ,display_order, state,url, title, target, icon, iconOpen, open) {

	this.id = id;

	this.pid = pid;

	this.name = name;

	this.url = url;

	this.title = title;

	this.target = target;

	this.icon = icon;

	this.iconOpen = iconOpen;

	this._io = open || false;

	this._is = false;

	this._ls = false;

	this._hc = false;

	this._ai = 0;

	this._p;

	this.display_order = display_order;

	this.state =state;
};



// Tree object

function dTree(objName,htmlContainer) {

	this.config = {

		target					: null,

		folderLinks			: true,
		
		custom_flag			: false,

		useSelection		: true,

		useCookies			: true,

		useLines				: true,

		useIcons				: true,

		useStatusText		: false,

		closeSameLevel	: false,

		inOrder					: false

	}

	this.icon = {

		root				: 'js/img/leaf.gif',

		folder			: 'js/img/n.gif',  

		folderOpen	: 'js/img/n.gif',

		node				: 'js/img/n.gif',

		empty				: 'js/img/empty.gif',

		line				: 'js/img/line.gif',

		join				: 'js/img/join.gif',

		joinBottom	: 'js/img/joinbottom.gif',

		plus				: 'js/img/plus.gif',

		plusBottom	: 'js/img/plusbottom.gif',

		minus				: 'js/img/minus.gif',

		minusBottom	: 'js/img/minusbottom.gif',

		nlPlus			: 'js/img/nolines_plus.gif',

		nlMinus			: 'js/img/nolines_minus.gif'

	};

	this.obj = objName;

	this.aNodes = []; 
	
	this.container=htmlContainer||'dtree';

	this.aIndent = [];

	this.root = new Node(-1);

	this.selectedNode = null;

	this.selectedFound = false;

	this.completed = false;

};



// Adds a new node to the node array

dTree.prototype.add = function(id, pid, name,display_order,state, url, title, target, icon, iconOpen, open) {

	this.aNodes[this.aNodes.length] = new Node(id, pid, name,display_order,state, url, title, target, icon, iconOpen, open);

};



// Open/close all nodes

dTree.prototype.openAll = function() {

	this.oAll(true);

};

dTree.prototype.closeAll = function() {

	this.oAll(false);

};



// Outputs the tree to the page

dTree.prototype.toString = function() {

	var str = '<div class="dtree">\n';

	if (document.getElementById) {

		if (this.config.useCookies) this.selectedNode = this.getSelected();
		str += this.addNode(this.root);	

	} else str += 'Browser not supported.';

	str += '</div>';

	if (!this.selectedFound) this.selectedNode = null;

	this.completed = true;

	return str;

};



// Creates the tree structure

dTree.prototype.addNode = function(pNode) {

	var str = '';

	var n=0;

	if (this.config.inOrder) n = pNode._ai;
//alert(this.aNodes.length);
	for (n; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == pNode.id) {

			var cn = this.aNodes[n];

			cn._p = pNode;

			cn._ai = n;

			this.setCS(cn);

			if (!cn.target && this.config.target) cn.target = this.config.target;

			if (cn._hc && !cn._io && this.config.useCookies) cn._io = this.isOpen(cn.id);

			if (!this.config.folderLinks && cn._hc) cn.url = null;

			if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {

					cn._is = true;

					this.selectedNode = n;

					this.selectedFound = true;

			}

			str += this.node(cn, n);

			if (cn._ls) break;

		}

	}

	return str;

};




dTree.prototype.changeValue = function(id,sValue){

	var cn ;
	var spanid = "span"+ id;
	for(n=0;n<this.aNodes.length;n++){
		if(this.aNodes[n].id == id){
			cn = this.aNodes[n];
		}
	}
	cn.name=sValue
	document.getElementById(spanid).innerHTML=sValue;
	var a = {
			id:cn.id,
			value:cn.name
	}
	emrTemplateAction.updateTitle(a);

};

dTree.prototype.editNode = function(id){

	for(n=0;n<this.aNodes.length;n++){
		if(this.aNodes[n].id == id){
			cn = this.aNodes[n];
		}
	}
	var inputStr='<input onblur="javascript:'+this.obj+'.changeValue(\''+id+'\',this.value)" value="' +cn.name + '"/>'
	var cn ;
	var spanid = "span"+ id;
	document.getElementById(spanid).innerHTML=inputStr;

};

dTree.prototype.deleteNode = function(id){
	
	 var r=confirm("确定要删除吗？")
	  if (r==true)
	   {
		  if(this.config.custom_flag){
			  this.deleteNode4(id);  
		  }
		  else{
			  this.deleteNode2(id);  
		  }
	   }
}
dTree.prototype.deleteNode2=function(id){
	//this.deleteNode3(id);	

	var template_id = this.aNodes[0].id + '';
	var a = {
			id:id,
			tempId:template_id,
			type:'delete'
	}
	medicalService.dwrUpdateEmr(a,function(data){
		if(data.flag == 0){
			top[1][1].location.reload();
			top[1][0].location.reload();
		}else{			
			loc=top[1][0].location+"";
			str = loc.split("?");
			str1 = str[1].split("\&");
			str2 = str1[0].split("=");
			loc1 = str[0]+"?templateId="+data.tempId+"&"+str1[1];
			top[1][1].location.href='about:blank';
			top[1][0].location.href=loc1;			
			top[0].location.reload();
		}
		
	});
}
dTree.prototype.deleteNode4=function(id){
	var nos=this.aNodes;
	medicalService.deleteTitle(id,accType,accId,function(){		
		/*if(top[1].length>0){
			loc=top[1][0].location+"";
			str = loc.split("=");
			str1 = str[1].split("&");
			ttId=str1[0];
			if(str[1].indexOf('#')>0){
				ttId=ttId.substring(0,ttId.length-1);
			}
			if(ttId==id){
				top.location.reload();
			}else{
				var cn ;
				for(n=0;n<nos.length;n++){
					if(nos[n].id == ttId){
						cn = nos[n];
						break;
					}
				}
				if(cn.pid == id){
					top.location.reload();
				}else{
					top[0].location.reload();
				}
			}
		}else{*/
			top.location.reload();
		/*}*/
	});
	
}


dTree.prototype.removeDIV = function(obj){
	$(obj.parentNode).remove();
}
dTree.prototype.removeDIV1 = function(id){
	$(id).remove();
}

dTree.prototype.appendNode = function(id){	
	//alert(dre);
	
	count=0;
	for(n=0;n<this.aNodes.length;n++){			
		if(this.aNodes[n].id == id){			
			cn=this.aNodes[n];
		}
		if(this.aNodes[n].pid == id){
			count++;
		}
	}
	var inputStr='<div id="promptDiv1" style="height:60px;background:#DDDDDD;">在此输入：<input id="append2"  /></br><a  href="#" onclick="javascript:'+this.obj+'.saveNode(\''+id+'\',\'#append2\')">确认</a> &nbsp;<a href="#" onclick="javascript:'+this.obj+'.removeDIV(this)">取消</a></div>'
	if($("#promptDiv").html()!='' && $("#promptDiv").html() != null){
		alert("请先输入或取消上次要添加的内容");
		return;
	}
	if(cn.pid==0){
		$("#promptDiv").append(inputStr);	
	}else{
		if(accType == 'admin'){
			showDialog(id,count);			
		}else{
			$("#promptDiv").append(inputStr);
		}		
	}	
	$("#append2").focus();	
};

dTree.prototype.saveNode = function(id,inputId){
	count=0;
	for(n=0;n<this.aNodes.length;n++){			
		if(this.aNodes[n].id == id){			
			cn=this.aNodes[n];
		}
		if(this.aNodes[n].pid == id){
			count++;
		}
	}
	value=$(inputId).val();
	var retFlag = 0;
	if(value == ''){	
		alert("请输入内容");
		$(inputId).focus();	
		return;
	}
	url = '';
	if(cn.pid != 0){
		type='template';
	}else{
		type='template_type';
	}
	var a = {
			parentId:id,
			value:value,
			display_order:count+1,
			type:type,
			accType:accType
	}
	returnId='';
	DWREngine.setAsync(false);
	emrTemplateAction.saveTitle(a,function(data){
			returnId = data;
			DWREngine.setAsync(true);
		}			
	);
	if(cn.pid != 0){
		DWREngine.setAsync(false);
		medicalService.saveEmrDepartment(returnId,branchId);
		medicalService.copyEmrTemplateRef(returnId);
		emrTemplateAction.saveTemplate(returnId);
		url = 'emrTemplate!right1.action?templateId='+returnId;
		DWREngine.setAsync(true);
	}	
	this.add(returnId,id,value,count+1,'',url);
	top[0].location.reload();
	$("#promptDiv").remove();
	$("#promptDiv1").remove();
}


dTree.prototype.appendNode2 = function(id){
	showDialog(this.aNodes[0].id,id);
	//if($("#promptDiv").html()!=''){
		//alert("请先输入或取消上次要添加的内容");
		//return;
	//}
	//var selectStr = '<div id="promptDiv2" style="height:40px;background:#DDDDDD;">请输入类型：<select id="append3" onchange="javascript:'+this.obj+'.appendNode3(\''+id+'\',this.value)"><option value ="">--选择类型--</option><option value ="text">文本</option>  <option value ="input">输入框</option> <option value="single">单选</option> <option value="multiple">多选</option><option value="date">时间控件</option><option value="pop">弹窗</option></select></br> &nbsp;<a href="#" onclick="javascript:'+this.obj+'.removeDIV(this)">取消</a></div>';
	//divid = "#divid"+id;
	//$(divid).click();
	//$("#promptDiv").append(selectStr);	
	//$("#append3").focus();	
};



dTree.prototype.verifyTemplate = function(id){
	if(confirm("是否要审核？")){
		medicalService.verifyTemplate(id,function(){
			alert("审核成功");
		});
		for(n=0;n<this.aNodes.length;n++){
			if(this.aNodes[n].id == id){			
				cn = this.aNodes[n];
			}
		}
		cn.state='available';
	}
	
	
	this.draw();
}

dTree.prototype.submitUpdate = function(id){
	if(confirm("是否要提交？")){
		medicalService.submitUpdate(id,function(){
			alert("提交成功");
		});
		for(n=0;n<this.aNodes.length;n++){
			if(this.aNodes[n].id == id){			
				cn = this.aNodes[n];
			}
		}
		cn.state='available';
	}
	
	
	this.draw();
}


dTree.prototype.changePosition = function(id,upOrDown){

	var spanid = "span"+ id;
	var cn ;	
	var index1;
	var index2;
	for(n=0;n<this.aNodes.length;n++){
		if(this.aNodes[n].id == id){			
			cn = this.aNodes[n];
			index1=n;
		}
	}
	var parentId;
	if(this.config.target == 'frame'){
		parentId=0;
	}else{
		parentId=cn.pid;
	}
	
	var thisId = cn.id;
	var upNode = null ;
	var thisOrder = cn.display_order;
	for(n=0;n<this.aNodes.length;n++){
		if(upOrDown == "up"){
			if(this.aNodes[n].pid == parentId && this.aNodes[n].display_order==thisOrder-1){
				upNode=this.aNodes[n];	
				index2=n;
			}
		}else{
			if(this.aNodes[n].pid == parentId && this.aNodes[n].display_order==parseInt(thisOrder)+1){				
				upNode=this.aNodes[n];
				index2=n;
			}
		}
	}
	if(upNode != null){
		//change dispaly_order
		temp_order = cn.display_order;
		cn.display_order = upNode.display_order;
		upNode.display_order = temp_order;
		this.aNodes[index1]=upNode;
		this.aNodes[index2]=cn;
		this.draw();		
		
		var a = {
				id:cn.id,
				pid:upNode.id,
				tempId:this.aNodes[0].id,
				type:'changePosition'
		}
		DWREngine.setAsync(true);
		medicalService.dwrUpdateEmr(a,function(data){
			if(data.flag == 0){
				top[1][1].location.reload();
				top[1][0].location.reload();
			}else{			
				loc=top[1][0].location+"";
				str = loc.split("?");
				str1 = str[1].split("\&");
				str2 = str1[0].split("=");
				loc1 = str[0]+"?templateId="+data.tempId+"&"+str1[1];
				top[1][1].location.href='about:blank';
				top[1][0].location.href=loc1;			
				top[0].location.reload();
			}
		});
		DWREngine.setAsync(false);
		
	}
};

dTree.prototype.node = function(node, nodeId) {
	var parentNode;	
	for(n=0;n<this.aNodes.length;n++){
		if(this.aNodes[n].id==node.pid){
			parentNode = this.aNodes[n];			
		}
	}	
	
	var spanid = "span"+ node.id;
	var divid = "div"+ node.id;
	var str = '<div class="dTreeNode" id="'  + divid+'">' + this.indent(node, nodeId);

	if (this.config.useIcons) {

		if (!node.icon) node.icon = (this.root.id == node.pid) ? this.icon.root : ((node._hc) ? this.icon.folder : this.icon.node);

		if (!node.iconOpen) node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;

		if (this.root.id == node.pid) {

			node.icon = this.icon.root;

			node.iconOpen = this.icon.root;

		}

		str += '<img id="i' + this.obj + nodeId + '" src="' + ((node._io) ? node.iconOpen : node.icon) + '" alt="" />';

	}

	if (node.url) {

		str += '<a id="s' + this.obj + nodeId + '" class="' + ((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node') + '" href="' + node.url + '"';

		if (node.title) str += ' title="' + node.title + '"';

		if (node.target) str += ' target="' + node.target + '"';

		if (this.config.useStatusText) str += ' onmouseover="window.status=\'' + node.name + '\';return true;" onmouseout="window.status=\'\';return true;" ';

		if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))

			str += ' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"';

		str += '>';

	}

	else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id)

		str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">';


	str +='<span id="'+spanid +'"  >'+ node.name+'</span>';

	if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) str += '</a>';

if(this.config.custom_flag){
		if(node.id != 0 ){	
			if(node.pid != 0){
					if(parentNode.pid == 0){
						//通用模版的unicode编码 &#36890;&#29992;&#27169;&#29256;
						//if(node.name != "&#36890;&#29992;&#27169;&#29256;"){	
						if(node.state != 'mandatory'){
							str += '<a href="javascript: ' + this.obj + '.appendNode(' + node.id + ');" class="node" style="color:green;">   &nbsp;&nbsp;添加'+'</a>';
							if(accType == 'admin'){
								str += '<a href="javascript: ' + this.obj + '.deleteNode(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;删除'+'</a>';
							}
						}
					}else{
						if(node.state != 'mandatory'){
							
							if(accType == 'admin'){
								str += '<a href="javascript: ' + this.obj + '.deleteNode(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;删除'+'</a>';
								str += '<a href="javascript: updateBranch(' + node.id +',\''+node.name+ '\');" class="node" style="color:green;">&nbsp;&nbsp;修改分站'+'</a>';
								if(node.state == 'new'){
									str += '<a href="javascript: ' + this.obj + '.verifyTemplate(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;审核'+'</a>';
							
								}else if(node.state == 'save'){
									str += '<a href="javascript: ' + this.obj + '.submitUpdate(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;提交'+'</a>';
							
								}
							}else{
								if(node.state == 'new'){
									str += '<a href="javascript: ' + this.obj + '.deleteNode(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;删除'+'</a>';
								}
							}
						}
						
				}			
					
			}else{				
				str += '<a href="javascript: ' + this.obj + '.appendNode(' + node.id + ');" class="node" style="color:green;">   &nbsp;&nbsp;添加'+'</a>';
				
			}
		}

}else{	
	if(node.pid != this.root.id){
		//alert(node.state);		
		if(accType == 'admin'){
			if(node.state != 'mandatory'){		
				str += '<a href="javascript: ' + this.obj + '.deleteNode(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;删除'+'</a>';
				
			}
			str += '<a href="javascript: ' + this.obj + '.changePosition(' + node.id + ',\'up\');" class="node" style="color:green;">&nbsp;&nbsp;上移 '+'</a>';
			str += '<a href="javascript: ' + this.obj + '.changePosition(' + node.id + ',\'down\');" class="node" style="color:green;">&nbsp;&nbsp;下移 '+'</a>';
			str += '<a href="javascript: ' + this.obj + '.appendNode2(' + node.id + ');" class="node" style="color:green;">   &nbsp;&nbsp;添加'+'</a>';
	
		}else{
			if(flag == 'new'){
				if(node.state != 'mandatory'){		
					str += '<a href="javascript: ' + this.obj + '.deleteNode(' + node.id + ');" class="node" style="color:green;">&nbsp;&nbsp;删除'+'</a>';
					
				}
				str += '<a href="javascript: ' + this.obj + '.changePosition(' + node.id + ',\'up\');" class="node" style="color:green;">&nbsp;&nbsp;上移 '+'</a>';
				str += '<a href="javascript: ' + this.obj + '.changePosition(' + node.id + ',\'down\');" class="node" style="color:green;">&nbsp;&nbsp;下移 '+'</a>';
				str += '<a href="javascript: ' + this.obj + '.appendNode2(' + node.id + ');" class="node" style="color:green;">   &nbsp;&nbsp;添加'+'</a>';
			}			
		}
	}
}
	str += '</div>';
//alert(str);
	if (node._hc) {

		str += '<div id="d' + this.obj + nodeId + '" class="clip" style="display:' + ((this.root.id == node.pid || node._io) ? 'block' : 'none') + ';">';

		str += this.addNode(node);

		str += '</div>';

	}

	this.aIndent.pop();

	return str;

};



// Adds the empty and line icons

dTree.prototype.indent = function(node, nodeId) {

	var str = '';

	if (this.root.id != node.pid) {

		for (var n=0; n<this.aIndent.length; n++)

			str += '<img src="' + ( (this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty ) + '" alt="" />';

		(node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);

		if (node._hc) {

			str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');"><img id="j' + this.obj + nodeId + '" src="';

			if (!this.config.useLines) str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;

			else str += ( (node._io) ? ((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) : ((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus ) );

			str += '" alt="" /></a>';

		} else str += '<img src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '" alt="" />';

	}

	return str;

};



// Checks if a node has any children and if it is the last sibling

dTree.prototype.setCS = function(node) {

	var lastId;

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id) node._hc = true;

		if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id;

	}

	if (lastId==node.id) node._ls = true;

};



// Returns the selected node

dTree.prototype.getSelected = function() {

	var sn = this.getCookie('cs' + this.obj);

	return (sn) ? sn : null;

};



// Highlights the selected node

dTree.prototype.s = function(id) {

	if (!this.config.useSelection) return;

	var cn = this.aNodes[id];

	if (cn._hc && !this.config.folderLinks) return;

	if (this.selectedNode != id) {

		if (this.selectedNode || this.selectedNode==0) {

			eOld = document.getElementById("s" + this.obj + this.selectedNode);

			eOld.className = "node";

		}

		eNew = document.getElementById("s" + this.obj + id);

		eNew.className = "nodeSel";

		this.selectedNode = id;

		if (this.config.useCookies) this.setCookie('cs' + this.obj, cn.id);

	}

};



// Toggle Open or close

dTree.prototype.o = function(id) {

	var cn = this.aNodes[id];

	this.nodeStatus(!cn._io, id, cn._ls);

	cn._io = !cn._io;

	if (this.config.closeSameLevel) this.closeLevel(cn);

	if (this.config.useCookies) this.updateCookie();

};



// Open or close all nodes

dTree.prototype.oAll = function(status) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {

			this.nodeStatus(status, n, this.aNodes[n]._ls)

			this.aNodes[n]._io = status;

		}

	}

	if (this.config.useCookies) this.updateCookie();

};



// Opens the tree to a specific node

dTree.prototype.openTo = function(nId, bSelect, bFirst) {

	if (!bFirst) {

		for (var n=0; n<this.aNodes.length; n++) {

			if (this.aNodes[n].id == nId) {

				nId=n;

				break;

			}

		}

	}

	var cn=this.aNodes[nId];

	if (cn.pid==this.root.id || !cn._p) return;

	cn._io = true;

	cn._is = bSelect;

	if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);

	if (this.completed && bSelect) this.s(cn._ai);

	else if (bSelect) this._sn=cn._ai;

	this.openTo(cn._p._ai, false, true);

};



// Closes all nodes on the same level as certain node

dTree.prototype.closeLevel = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {

			this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);

		}

	}

}



// Closes all children of a node

dTree.prototype.closeAllChildren = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {

			if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);		

		}

	}

}



// Change the status of a node(open or closed)

dTree.prototype.nodeStatus = function(status, id, bottom) {

	eDiv	= document.getElementById('d' + this.obj + id);

	eJoin	= document.getElementById('j' + this.obj + id);

	if (this.config.useIcons) {

		eIcon	= document.getElementById('i' + this.obj + id);

		eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon;

	}

	eJoin.src = (this.config.useLines)?

	((status)?((bottom)?this.icon.minusBottom:this.icon.minus):((bottom)?this.icon.plusBottom:this.icon.plus)):

	((status)?this.icon.nlMinus:this.icon.nlPlus);

	eDiv.style.display = (status) ? 'block': 'none';

};





// [Cookie] Clears a cookie

dTree.prototype.clearCookie = function() {

	var now = new Date();

	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);

	this.setCookie('co'+this.obj, 'cookieValue', yesterday);

	this.setCookie('cs'+this.obj, 'cookieValue', yesterday);

};



// [Cookie] Sets value in a cookie

dTree.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {

	document.cookie =

		escape(cookieName) + '=' + escape(cookieValue)

		+ (expires ? '; expires=' + expires.toGMTString() : '')

		+ (path ? '; path=' + path : '')

		+ (domain ? '; domain=' + domain : '')

		+ (secure ? '; secure' : '');

};



// [Cookie] Gets a value from a cookie

dTree.prototype.getCookie = function(cookieName) {

	var cookieValue = '';

	var posName = document.cookie.indexOf(escape(cookieName) + '=');

	if (posName != -1) {

		var posValue = posName + (escape(cookieName) + '=').length;

		var endPos = document.cookie.indexOf(';', posValue);

		if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));

		else cookieValue = unescape(document.cookie.substring(posValue));

	}

	return (cookieValue);

};



// [Cookie] Returns ids of open nodes as a string

dTree.prototype.updateCookie = function() {

	var str = '';

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {

			if (str) str += '.';

			str += this.aNodes[n].id;

		}

	}

	this.setCookie('co' + this.obj, str);

};



// [Cookie] Checks if a node id is in a cookie

dTree.prototype.isOpen = function(id) {

	var aOpen = this.getCookie('co' + this.obj).split('.');

	for (var n=0; n<aOpen.length; n++)

		if (aOpen[n] == id) return true;

	return false;

};



// If Push and pop is not implemented by the browser

if (!Array.prototype.push) {

	Array.prototype.push = function array_push() {

		for(var i=0;i<arguments.length;i++)

			this[this.length]=arguments[i];

		return this.length;

	}

};

if (!Array.prototype.pop) {

	Array.prototype.pop = function array_pop() {

		lastElement = this[this.length-1];

		this.length = Math.max(this.length-1,0);

		return lastElement;

	}

};
//show the tree
dTree.prototype.draw = function(){	
	// renew the two array to save original data.

	this.aIndent=new Array();
	// dump original data to aNode array.
	for(var i=0 ; i<this.aNodes.length ; i++){		
		var oneNode=this.aNodes[i];
		this.aNodes[i]=new Node(oneNode.id,oneNode.pid,oneNode.name,oneNode.display_order,oneNode.state,oneNode.url,oneNode.title,oneNode.target,oneNode.icon,oneNode.iconOpen,oneNode.open);	
	}	
	this.rewriteHTML();
}

// outputs the tree to the page , callled by show()
dTree.prototype.rewriteHTML = function() {
	var str = '';	
	var container;
	container=document.getElementById(this.container);	
	if(!container){		
		alert('dTree can\'t find your specified container to show your tree.\n\n Please check your code!');
		return;
	}
	if (this.config.useCookies) this.selectedNode = this.getSelected();
	str += this.addNode(this.root);
	if (!this.selectedFound) this.selectedNode = null;
	this.completed = true;	
	container.innerHTML=str;
};

// Checks if a node has children
dTree.prototype.hasChildren=function(id){
    for(var i=0 ; i<this.aNodes.length ; i++){		
		var oneNode=this.aNodes[i];
		if(oneNode.pid==id)
		    return true;
	}
	return false;
}

//define a remove method for Array
Array.prototype.remove=function(dx) {
   if(isNaN(dx)||dx>this.length){
	   return false;
    }

for(var i=0,n=0;i<this.length;i++){
if(this[i]!=this[dx]){
this[n++]=this[i];
}
}
this.length-=1;
}

//remove a node
dTree.prototype.remove=function(id){
    if(!this.hasChildren(id)){
        for(var i=0 ; i<this.aNodes.length ; i++){
            if(this.aNodes[i].id==id){
                this.aNodes.remove(i);
            }
        }
    }
}
