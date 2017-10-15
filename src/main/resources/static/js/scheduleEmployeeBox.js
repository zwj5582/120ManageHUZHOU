function viewbox(type,id){
//	$.post('schedule'+type+'.action!', {numid:id}, function callbackFun(data){
//		$("#viewbox_name").html(data.passWordBox.name);
//		$("#viewbox_account").html(data.passWordBox.account);
//		$("#viewbox_password").html(data.passWordBox.password);
//		$("#viewbox_remark").html(data.passWordBox.remark);
//		new Dialog({
//        resizable: true,
//        draggable: true,
//        resizable: false,
//        width: 300,
//        heigh: 400,
//        lightbox: true,
//        button: {
//			    'close': ['鍏抽棴', function(){
//                this.close();
//            }]
//		}
//		}).title('鏄剧ず瀵嗙爜閰嶇疆').html($('#viewdialog').html()).show();
//	}, 'json');
	var dg = new J.ui.dialog({title: '医生人员选择',cover:true,resize:false,height:600,width:600, page:'mibao.jsp'});
	dg.ShowDialog();
}