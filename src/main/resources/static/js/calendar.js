/* MarcGrabanski.com */
var popUpCal = {
	showMonth: new Date().getMonth(), // 0-11
	showYear: new Date().getFullYear(), // 4-digit year
	showDay: new Date().getDay(),
	selectedDay: [],
	calendarId: 'calendarDiv',
	popUpShowing: false,
	bodyClick: null,
	callback: function(){},
	minYear: 2000,
	maxYear: 2030,

	init: function () {
		var oCal = document.createElement('div');
		oCal.setAttribute('id',popUpCal.calendarId);
		document.body.appendChild(oCal);
	},

	hideCalendar: function () {
		if ( popUpCal.popUpShowing ) {
			popUpCal.popUpShowing = false;
			return;
		}
		var y = document.getElementById(popUpCal.calendarId);
		y.style.display = 'none';
		document.body.onclick = popUpCal.bodyClick;
	},

	showCalendar: function (inputObj, func) {
		if ( typeof(func) == 'function' )
			this.callback = func;
		var y = document.getElementById(popUpCal.calendarId);
		setPos(inputObj, y);
		y.style.display = 'block';
		setSelected(inputObj.value);
		popUpCal.drawCalendar(inputObj);
		popUpCal.setupLinks(inputObj);
		popUpCal.popUpShowing = true;
		popUpCal.bodyClick = document.body.onclick;
		document.body.onclick = popUpCal.hideCalendar;
		setTimeout('popUpCal.popUpShowing=false;', 500);
	},
	
	drawCalendar: function (inputObj) {
		var html = '';
		html = '<table cellpadding="0" cellspacing="0" id="linksTable"><tr>';
		html += '<td><a id="prevMonth">&lt;&lt;上一月</a></td>';
		html += '<td align="center"><a id="closeCalender">关闭</a></td>';
		html += '<td><a id="nextMonth">下一月&gt;&gt;</a></td>';
		html += '</tr></table>';
		html += '<table id="calendarTable" cellpadding="0" cellspacing="0"><tr>';
		html += '<th colspan="3" class="calendarHeader"><select id="calendar_newYear">';
		for (var year = this.minYear; year <= this.maxYear; year++) {
			html += '<option value="' + year + '"' +
				(year == popUpCal.showYear ? ' selected="selected"' : '') +
				'>' + year + '</option>';
		}
		html += '<th class="calendarHeader">&nbsp;</th>';
		html += '<th colspan="3" class="calendarHeader"><select id="calendar_newMonth">';
		for (var month = 0; month < 12; month++) {
			html += '<option value="' + month + '"' +
				(month == popUpCal.showMonth ? ' selected="selected"' : '') +
				'>' + getMonthName(month) + '</option>';
		}
		html += '</select></th>';
		html += '</select></th>';
		html += '</tr><tr class="weekDaysTitleRow">';
		var weekDays = new Array('日','一','二','三','四','五','六');
		for (var j=0; j<weekDays.length; j++) {
			html += '<td>'+weekDays[j]+'</td>';
		}
		var daysInMonth = getDaysInMonth(popUpCal.showYear, popUpCal.showMonth);
		var startDay = getFirstDayofMonth(popUpCal.showYear, popUpCal.showMonth);
		var numRows = 0;
		var printDate = 1;
		if (startDay != 7) {
			numRows = Math.ceil(((startDay+1)+(daysInMonth))/7); // calculate the number of rows to generate
		}

		// calculate number of days before calendar starts
		if (startDay != 7) {
			var noPrintDays = startDay + 1;
		} else {
			var noPrintDays = 0; // if sunday print right away
		}
		var today = new Date().getDate();
		var thisMonth = new Date().getMonth();
		var thisYear = new Date().getFullYear();
		for (var e=0; e<numRows; e++) {
			html += '<tr class="weekDaysRow">';
			for (var f=0; f<7; f++) {
				if ( (printDate == popUpCal.selectedDay[1])
					 && (popUpCal.showYear == popUpCal.selectedDay[2])
					 && (popUpCal.showMonth == popUpCal.selectedDay[0])
					 && (noPrintDays == 0)) {
					html += '<td id="selectedday" class="weekDaysCell">';
				} else if ( (printDate == today)
					 && (popUpCal.showYear == thisYear)
					 && (popUpCal.showMonth == thisMonth)
					 && (noPrintDays == 0)) {
					html += '<td id="today" class="weekDaysCell">';
				} else {
					html += '<td class="weekDaysCell">';
				}
				if (noPrintDays == 0) {
					if (printDate <= daysInMonth) {
						html += '<a>'+printDate+'</a>';
					}
					printDate++;
				}
				html += '</td>';
				if(noPrintDays > 0) noPrintDays--;
			}
			html += '</tr>';
		}
		html += '</table><!--[if lte IE 6.5]><iframe src="javascript:false;" id="calendar_cover"></iframe><![endif]-->';

		var calendarDiv = document.getElementById(popUpCal.calendarId);
		calendarDiv.innerHTML = html;

		document.getElementById('closeCalender').onclick = function () {
			popUpCal.hideCalendar();
		}
		document.getElementById('calendar_newMonth').onchange = function () {
			popUpCal.showMonth = this.value;
			popUpCal.drawCalendar(inputObj);
			popUpCal.setupLinks(inputObj);
		}
		document.getElementById('calendar_newYear').onchange = function () {
			popUpCal.showYear = this.value;
			popUpCal.drawCalendar(inputObj);
			popUpCal.setupLinks(inputObj);
		}
		document.getElementById('prevMonth').onclick = function () {
			popUpCal.showMonth--;
			if (popUpCal.showMonth < 0) {
				popUpCal.showMonth = 11;
				popUpCal.showYear--;
			}
			if(popUpCal.showYear < popUpCal.minYear){
				popUpCal.showYear = popUpCal.minYear;
			}
			popUpCal.drawCalendar(inputObj);
			popUpCal.setupLinks(inputObj);
		}
		document.getElementById('nextMonth').onclick = function () {
			popUpCal.showMonth++;
			if (popUpCal.showMonth > 11) {
				popUpCal.showMonth = 0;
				popUpCal.showYear++;
			}
			if(popUpCal.showYear > popUpCal.maxYear){
				popUpCal.showYear = popUpCal.maxYear;
			}
			popUpCal.drawCalendar(inputObj);
			popUpCal.setupLinks(inputObj);
		}
		calendarDiv.onclick = function (event) {
			var evt = window.event ? window.event : event;
			if ( evt.stopPropagation ) {
				evt.stopPropagation();
			} else {
				evt.cancelBubble = true;
			}
		}
	},

	setupLinks: function (inputObj) {
		var y = document.getElementById('calendarTable');
		var x = y.getElementsByTagName('a');
		var _this = this;
		for (var i=0; i<x.length; i++) {
			x[i].onmouseover = function () {
				this.parentNode.className = 'weekDaysCellOver';
			}
			x[i].onmouseout = function () {
				this.parentNode.className = 'weekDaysCell';
			}
			x[i].onclick = function () {
				document.getElementById(popUpCal.calendarId).style.display = 'none';
				popUpCal.showDay = this.innerHTML;
				inputObj.value = formatDate(popUpCal.showDay, popUpCal.showMonth, popUpCal.showYear);
				_this.callback();
			}
		}
	}

}
if ( typeof window.addEventListener != "undefined" ) {
	window.addEventListener( "load", popUpCal.init, false );
} else if ( typeof window.attachEvent != "undefined" ) {
	window.attachEvent( "onload", popUpCal.init );
} else {
	if ( window.onload != null ) {
		var oldOnload = window.onload;
		window.onload = function ( e ) {
			oldOnload( e );
			popUpCal.init();
		};
	} else {
		window.onload = popUpCal.init;
	}
}

/* Functions Dealing with Dates */

function setSelected(str) {
	str = str || '';
	if (str == '') {
		popUpCal.showMonth = new Date().getMonth();
		popUpCal.showYear = new Date().getFullYear();
		popUpCal.showDay = new Date().getDay();
		popUpCal.selectedDay = [-1, 0, 0];
	} else {
		var arr = str.split('-');
		for (var i = 0; i < arr.length; i++) {
			arr[i] = parseInt(arr[i], 10);
		}
		popUpCal.showMonth = popUpCal.selectedDay[0] = (arr[1] <= 12 && arr[1] > 0) ? arr[1] - 1 : new Date().getMonth();
		popUpCal.showDay = popUpCal.selectedDay[1] = (arr[2] && arr[2] <= 31 && arr[2] > 0) ? arr[2] : 0;
		popUpCal.showYear = popUpCal.selectedDay[2] = (arr[0] && arr[0] <= popUpCal.maxYear && arr[0] >= popUpCal.minYear) ? arr[0] : new Date().getFullYear();
	}
}

function formatDate(Day, Month, Year) {
	Month++; // adjust javascript month
	if (Month <10) Month = '0' + Month; // add a zero if less than 10
	if (Day < 10) Day = '0' + Day; // add a zero if less than 10
	var dateString = Math.max(popUpCal.minYear, Math.min(popUpCal.maxYear, Year)) + '-' + Month + '-' + Day;
	return dateString;
}

function getMonthName(month) {
	var monthNames = new Array('一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月');
	return monthNames[month];
}

function getDayName(day) {
	var dayNames = new Array('一','二','三','四','五','六','日')
	return dayNames[day];
}

function getDaysInMonth(year, month) {
	return 32 - new Date(year, month, 32).getDate();
}

function getFirstDayofMonth(year, month) {
	var day;
	day = new Date(year, month, 0).getDay();
	return day;
}

function getElementsByClass(searchClass,node,tag) {
	var classElements = new Array();
	if ( node == null ) node = document;
	if ( tag == null ) tag = '*';
	var els = node.getElementsByTagName(tag);
	var elsLen = els.length;
	var pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)");
	for (i = 0, j = 0; i < elsLen; i++) {
		if ( pattern.test(els[i].className) ) {
			classElements[j] = els[i];
			j++;
		}
	}
	return classElements;
}

function setPos(targetObj,moveObj) {
	var coors = findPos(targetObj);
	moveObj.style.position = 'absolute';
	moveObj.style.top = coors[1]+20 + 'px';
	moveObj.style.left = coors[0] + 'px';
}

function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}