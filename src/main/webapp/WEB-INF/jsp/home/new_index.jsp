<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>湖州医疗急救中心</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #ffffff;
}

.a1:link {
	color: #003399;
	text-decoration: none;
}

.a1:visited {
	color: #FF0000
}

.a1:hover {
	color: #CC0000;
	text-decoration: underline;
}

.imgh {
	border: 2px solid #ddd;
	background: #fff;
}
</style>
	<script type="text/javascript" src="js/superfish-master/dist/js/jquery.js"></script>
	<script type="text/javascript" src="js/superfish-master/dist/js/hoverIntent.js"></script>
	<script type="text/javascript" src="js/superfish-master/dist/js/superfish.js"></script>
	<link href="js/superfish-master/dist/css/superfish.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function printSchedule() {
		window.showModalDialog("../schedule!printScheduleAccount.action", "--",
						"dialogHeight:700px;dialogWidth:1200px;dialogleft:10px;dialogtop:10px;help:no;status:no;scroll:yes;location=no");
	}

	function telBook() {
		window.showModalDialog("../telBook!frontTellbook.action", "--",
						"dialogHeight:700px;dialogWidth:1200px;dialogleft:10px;dialogtop:10px;help:no;status:no;scroll:yes;location=no");
	}
	
	function initialDate(){
		var dateStr = "今天是：";
		var day = "";
		var month = "";
		var ampm = "";
		var ampmhour = "";
		var myweekday = "";
		var year = "";
		mydate = new Date();
		myweekday = mydate.getDay();
		mymonth = mydate.getMonth() + 1;
		myday = mydate.getDate();
		myyear = mydate.getYear();
		year = (myyear > 200) ? myyear : 1900 + myyear;
		if (myweekday == 0){
			weekday = " 星期日 ";
		} else if (myweekday == 1){
			weekday = " 星期一 ";
		} else if (myweekday == 2){
			weekday = " 星期二 ";
		} else if (myweekday == 3){
			weekday = " 星期三 ";
		} else if (myweekday == 4){
			weekday = " 星期四 ";
		} else if (myweekday == 5){
			weekday = " 星期五 ";
		} else if (myweekday == 6){
			weekday = " 星期六 ";
		}
		dateStr = dateStr + year + "年" + mymonth + "月" + myday + "日 " + weekday;
		document.getElementById("date").innerHTML = dateStr;
	};
</script>
	<script>

        (function($){ //create closure so we can safely use $ as alias for jQuery

            $(document).ready(function(){

                // initialise plugin
                var example = $('#example').superfish({
                    //add options here if required
                });

                // buttons to demonstrate Superfish's public methods
                $('.destroy').on('click', function(){
                    example.superfish('destroy');
                });

                $('.init').on('click', function(){
                    example.superfish();
                });

                $('.open').on('click', function(){
                    example.children('li:first').superfish('show');
                });

                $('.close').on('click', function(){
                    example.children('li:first').superfish('hide');
                });
            });

        })(jQuery);


        function goMain() {
            window.location.href="login";
        }

        function goPage() {
            $("#iFrame1").attr("src","../publish!publicMain.action");
        }


	</script>
<link rel="stylesheet" type="text/css" href="home/css/ven.css">
<script language="JavaScript" src="home/js/swfobject.js" type="text/javascript"></script>
</head>
<body onload="initialDate();">
	<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td width="1000" height="200" valign="bottom" class="toppicbg">
				<table width="99%" border="0" cellspacing="0">
					<tr>
						<td></td>
						<td align="right" height="157">
							<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="863" height="141">
								<param name="movie" value="home/swf/21.swf">
								<param name="quality" value="high">
								<param name="wmode" value="transparent">
								<embed src="home/swf/21.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="863" height="141" wmode="transparent"></embed>
							</object>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="right">&nbsp;</td>
					</tr>
					<tr>
						<td width="1%">&nbsp;</td>
						<td width="99%" align="left" style="color:#000">
							<div id="date"></div>
						</td>
					</tr>
					<tr>
						<td height="5"></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<ul class="sf-menu" id="example">
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'" onclick="goPage();" >
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!centerSurvey.action" target="iFrame1">中心概况</a>
							</li>
							<li>
								<a href="../publish!centerLeader.action" target="iFrame1">中心领导</a>
							</li>
							<li>
								<a href="../publish!publicMain.action" target="iFrame1">设置科室</a>
							</li>
							<li>
								<a href="../publish!centerHonor.action" target="iFrame1">中心荣誉</a>
							</li>
							<li>
								<a href="../publish!contactInformation.action" target="iFrame1">联系方式</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!publicNotice.action" target="iFrame1">通知公告</a>
							</li>
							<li>
								<a href="../publish!publicListPaged.action?publishDirectory.id=104" target="iFrame1">中心动态</a>
							</li>
							<li>
								<a href="../publish!publicListPaged.action?publishDirectory.id=103" target="iFrame1">各地新闻</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!call120.action" target="iFrame1">如何拨打120</a>
							</li>
							<li>
								<a href="../publish!aidVehicleRule.action" target="iFrame1">急救派车原则</a>
							</li>
							<li>
								<a href="../publish!feeRule.action" target="iFrame1">收费标准</a>
							</li>
							<li>
								<a href="../publish!serviceSupervise.action" target="iFrame1">服务监督</a>
							</li>
							<li>
								<a href="../publish!siteDistribution.action" target="iFrame1">站点分布</a>
							</li>
						</ul>
					</li>


					<li>
						<img src="home/images/pic_09.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_09.png'" onMouseOut="this.src='home/images/pic_09.png'" onclick="goMain();">
					</li>


					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!partyConstruction.action" target="iFrame1">党建工作</a>
							</li>
							<li>
								<a href="../publish!leagueWorld.action" target="iFrame1">团员天地</a>
							</li>
							<li>
								<a href="../publish!unionHouse.action" target="iFrame1">工会之家</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!regulations.action" target="iFrame1">行政法规</a>
							</li>
							<li>
								<a href="../publish!openAffairs.action" target="iFrame1">政务公开</a>
							</li>
							<li>
								<a href="../publish!centerSpecification.action" target="iFrame1">中心规范</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!publicMain.action" target="iFrame1">相关文件</a>
							</li>
							<li>
								<a href="../publish!createDynamic.action" target="iFrame1">创建动态</a>
							</li>
							<li>
								<a href="../publish!civilizedCells.action" target="iFrame1">文明细胞</a>
							</li>
							<li>
								<a href="../publish!youthCivilization.action" target="iFrame1">青年文明号</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!firstAidknowledge.action" target="iFrame1">急救知识</a>
							</li>
							<li>
								<a href="../publish!firstAidtraining.action" target="iFrame1">急救培训</a>
							</li>
							<li>
								<a href="../publish!publicMain.action" target="iFrame1">数据统计</a>
							</li>
						</ul>
					</li>
					<li>
						<img src="home/images/pic_02.png" width="100" height="35" border="0" onMouseOver="this.src='home/images/pic0_02.png'" onMouseOut="this.src='home/images/pic_02.png'">
						<ul>
							<li>
								<a href="../publish!firstToExcellence.action" target="iFrame1">争先创优</a>
							</li>
							<li>
								<a href="../publish!educationPractice.action" target="iFrame1">群众路线教育实践活动</a>
							</li>
							<li>
								<a href="../publish!threeStrictThreeReal.action" target="iFrame1">三严三实</a>
							</li>
							<li>
								<a href="../publish!twoLearnOneToDo.action" target="iFrame1">两学一做</a>
							</li>
						</ul>
					</li>
				</ul>
				<%--<table width="97%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="10%">
							<a href="../publish!publicMain.action" target="iFrame1"><img src="images/pic_02.png" width="89" height="35" border="0" onMouseOver="this.src='images/pic0_02.png'" onMouseOut="this.src='images/pic_02.png'"></a>
						</td>
						<td width="43%">
							<a href="../publish!publicListPaged.action?publishDirectory.id=109" target="iFrame1"><img src="images/pic_03.png" width="91" height="35" border="0" onMouseOver="this.src='images/pic0_03.png'" onMouseOut="this.src='images/pic_03.png'"></a>
						</td>
						<td width="5%">
							<a href="../publish!firstAidReleaseView.action?publishDirectory.id=110" target="iFrame1"><img src="images/pic_04.png" width="93" height="35" border="0" onMouseOver="this.src='images/pic0_04.png'" onMouseOut="this.src='images/pic_04.png'"></a>
						</td>
						<td width="6%">
							<a href="../publish!publicListPaged.action?publishDirectory.id=104" target="iFrame1"> <img src="images/pic_05.png" width="90" height="35" border="0" onMouseOver="this.src='images/pic0_05.png'" onMouseOut="this.src='images/pic_05.png'"></a>
						</td>
						<td width="6%">
							<a href="../publish!publicListPaged.action?publishDirectory.id=111" target="iFrame1"><img src="images/pic_06.png" width="90" height="35" border="0" onMouseOver="this.src='images/pic0_06.png'" onMouseOut="this.src='images/pic_06.png'"></a>
						</td>
						<td width="6%">
							<a href="../login!input.action"><img src="images/pic_09.png" width="91" height="35" border="0" onMouseOver="this.src='images/pic0_09.png'" onMouseOut="this.src='images/pic_09.png'">
						</a>
						</td>
						<td width="6%">
							<a href="dangwu_01new.html" target="iFrame1"><img src="images/pic_08.png" width="92" height="35" border="0" onMouseOver="this.src='images/pic0_08.png'" onMouseOut="this.src='images/pic_08.png'"></a>
						</td>
						<td width="6%">
							<a href="zhengwu_01new.html" target="iFrame1"><img src="images/pic_07.png" width="91" height="35" border="0" onMouseOver="this.src='images/pic0_07.png'" onMouseOut="this.src='images/pic_07.png'"></a>
						</td>
						<td width="6%">
							<a href="../publish!labourBodyWindowFront.action" target="iFrame1"><img src="images/pic_10.png" width="91" height="35" border="0" onMouseOver="this.src='images/pic0_10.png'" onMouseOut="this.src='images/pic_10.png'"></a>
						</td>
						<td width="6%">
							<a href="wenming_01new.html" target="iFrame1"><img src="images/pic_11.png" width="92" height="35" border="0" onMouseOver="this.src='images/pic0_11.png'" onMouseOut="this.src='images/pic_11.png'"></a>
						</td>
						<td width="6%">
							<a href="../forum!forumFront.action" target="iFrame1"><img src="images/pic_112.png" width="90" height="35" border="0" onMouseOver="this.src='images/pic0_112.png'" onMouseOut="this.src='images/pic_112.png'"></a>
						</td>
					</tr>
				</table>--%>
			</td>
		</tr>
		<tr>
			<td background="home/images/pic_newbg.png">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="20%" valign="top" background="home/images/picbg_13.png">
							<table width="22%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="8" background="home/images/picbg_13.png"></td>
								</tr>
								<tr>
									<td><img src="home/images/picti_13.png" width="195" height="34" alt="" />
									</td>
								</tr>
								<tr>
									<td background="home/images/picti_17.png" align="center">
										<%--<iframe id="iFrame2" name="iFrame2" frameborder=no width="160" scrolling="no" height=100% onload="this.height=iFrame2.document.body.scrollHeight" src="../publish!publicLeft.action"></iframe>--%>
									</td>
								</tr>
								<tr>
									<td><img src="home/images/picti_22.png" width="195" height="6" alt="" />
									</td>
								</tr>
								<tr>
									<td><img src="home/images/picti0_23.png" alt="" width="195" height="39" border="0" />
									</td>
								</tr>
								<tr>
									<td width="6%">
										<a href="../publish!publicListPaged.action?publishDirectory.id=122" target="iFrame1"><img src="home/images/pickong_25.jpg" width="195" height="53" border="0" onMouseOver="this.src='home/images/pickong0_25.jpg'" onMouseOut="this.src='home/images/pickong_25.jpg'">
									</a>
									</td>
								</tr>
								<tr>
									<td width="6%"><a href="#">
									<img src="home/images/picti_27.jpg" width="195" height="55" border="0" onMouseOver="this.src='home/images/picti0_27.jpg'" onMouseOut="this.src='home/images/picti_27.jpg'">
									</a>
									</td>
								</tr>
								<tr>
									<td><a href="javascript:printSchedule()"><img src="home/images/picti_28.png" width="195" height="54" border="0" onMouseOver="this.src='home/images/picti0_28.png'" onMouseOut="this.src='home/images/picti_28.png'">
									</a>
									</td>
								</tr>
								<tr>
									<td><a href="javascript:telBook()"><img src="home/images/picti_29.png" width="195" height="52" border="0" onMouseOver="this.src='home/images/picti0_29.png'" onMouseOut="this.src='home/images/picti_29.png'">
									</a>
									</td>
								</tr>
								<tr>
									<td><a href="../publish!publicListPaged.action?publishDirectory.id=112" target="iFrame1"><img src="home/images/picti_32.png" width="195" height="53" border="0" onMouseOver="this.src='home/images/picti0_32.png'" onMouseOut="this.src='home/images/picti_32.png'">
									</a>
									</td>
								</tr>
								<tr>
									<td><a href="../publish!publicListPaged.action?publishDirectory.id=113" target="iFrame1"><img src="home/images/picti_36.png" width="195" height="52" border="0" onMouseOver="this.src='home/images/picti0_36.png'" onMouseOut="this.src='home/images/picti_36.png'">
									</a>
									</td>
								</tr>
								<tr>
									<td><img src="home/images/picti_38.png" alt="" width="195" height="11" border="0" />
									</td>
								</tr>
								<tr>
									<td class="yqnj"><img src="home/images/picz_33.png" width="195" height="26" alt="" />
									</td>
								</tr>
								<tr>
									<td align="center" class="yqnj"><img src="home/images/picy_33.jpg" alt="" width="173" height="45" border="0" usemap="#Map" />
									</td>
								</tr>
								<tr>
									<td height="30" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
						<td width="80%" valign="top" bgcolor="#FFFFFF">
							<table width="805" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="805" valign="top" bgcolor="#FFFFFF">
										<%--<iframe id="iFrame1" name="iFrame1" frameborder=no width="100%" scrolling="no" height="100%" onload="this.height=iFrame1.document.body.scrollHeight" src="publicMain"></iframe>--%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td background="home/images/pic_54.png" height="121px"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="middle"><table width="58%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td width="15%" align="center">网站简介</td>
									<td width="1%" align="center">|</td>
									<td width="16%" align="center">网站地图</td>
									<td width="1%" align="center">|</td>
									<td width="16%" align="center">使用帮助</td>
									<td width="1%" align="center">|</td>
									<td width="16%" align="center">网站声明</td>
									<td width="0%" align="center">|</td>
									<td width="16%" align="center">意见反馈</td>
									<td width="1%" align="center">|</td>
									<td width="17%" align="center">联系我们</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="26" align="center"><div class="fdsh">Copyright 2011 嘉定区医疗急救中心 版权所有</div>
							<div class="fdnj">Copyright 2011 南京市医疗急救中心 版权所有</div>
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>

	<map name="Map4">
		<area shape="rect" coords="291,11,340,32" href="#">
	</map>

	<map name="Map">
		<area shape="rect" coords="5,3,169,43" href="http://www.jiading.gov.cn/" target="_blank">
	</map>
</body>
</html>

