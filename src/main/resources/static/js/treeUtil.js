 
function createTree(obj){
	var	treescam = new Array();
	for(var i = 0; i < obj.length; i++){
		//if(obj[i].pId == null || obj[i].pId == 0 || obj[i].pId == ''){
			if(obj[i].menu == null || obj[i].menu.id == 0 || obj[i].menu.id == ''){
			var root={
					id:obj[i].id,
					pId:null,
					sort:obj[i].sort,
					name:obj[i].name,
					icon:obj[i].icon,
					url:obj[i].url,
					icon:obj[i].icon||'home.png',
					target:'mainFrame',
					children:[]
			};
			root.children = getChildren(root.id, obj);
			treescam.push(root);
		}
	}
   return treescam.sort(sortNode);
}

function getChildren(pid, obj){
	var children = [];
	for(var i = 0; i < obj.length; i++){
		if(obj[i].menu&&obj[i].menu.id == pid){
			var target = 'mainFrame';
			var child = {
					id:obj[i].id,
					pId:null,
					sort:obj[i].sort,
					name:obj[i].name,
					url:obj[i].url,
					icon:obj[i].icon,
					target:target,
					children:[]
			};
			child.children = getChildren(child.id, obj);
			children.push(child);
		}
	}
	return children.sort(sortNode);
}

function sortNode(a,b){
	 return a.sort - b.sort; 
}