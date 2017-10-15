function beginDate(){
WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end1\')||\'2020-10-01\'}'});

}		 
function endDate(){	
WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin1\')}',maxDate:'2020-10-01'});

}


function beginNoDate(){
	WdatePicker({isShowClear:false,isShowToday:false,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end1\')||\'2020-10-01\'}'});

	}


function endNoDate(){	
	WdatePicker({isShowClear:false,isShowToday:false,readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin1\')}',maxDate:'2020-10-01'});

	}

function begmmNoDate(){
	WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end1\')||\'2020-10-01\'}'});

	}


function endmmDate(){	
	WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin1\')}',maxDate:'2020-10-01'});

	}



function begOmNoDate(){
	WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'end1\',{M:-1,d:0});}',maxDate:'#F{$dp.$D(\'end1\',{M:0,d:0});}'});

	}


function endOmDate(){	
	WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'begin1\',{M:0,d:0});}',maxDate:'#F{$dp.$D(\'begin1\',{M:1,d:0});}'});

	}




