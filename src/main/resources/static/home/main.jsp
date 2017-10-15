<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
    String sysPath = System.getProperty("user.dir");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>120急救管理系统</title>
    <s:include value="/jsp/fragment/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="home/css/ven.css"/>
    <script src="home/js/jquery-1.4a2.min.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/javascript">
        function huiyi() {
            document.getElementById("huiyi").style.display = "block";
            document.getElementById("caigou").style.display = "none";
            document.getElementById('tdhuiyi').style.background = 'url(home/images/picp1_23.png)';
            document.getElementById('tdcaigou').style.background = 'url(home/images/picp1_22.png)';
            document.getElementById('tdhuiyi').className = '';
            document.getElementById('tdcaigou').className = 'font12w';
        }
        function caigou() {
            document.getElementById("huiyi").style.display = "none";
            document.getElementById("caigou").style.display = "block";
            document.getElementById('tdhuiyi').style.background = 'url(home/images/picp_23.png)';
            document.getElementById('tdcaigou').style.background = 'url(home/images/picp_22.png)';
            document.getElementById('tdhuiyi').className = 'font12w';
            document.getElementById('tdcaigou').className = '';
        }

        function reportForms(m) {
            url = 'task!reportForm.action?month=' + m;
            window.showModalDialog(url, '--', 'dialogHeight:700px;dialogWidth:1200px;dialogleft:10px;dialogtop:10px;help:no;status:no;scroll:yes;location=no');
        }

        function mailBoxOfLeader() {
            alert(1111);
        }
    </script>
    <script type="text/javascript">
        //jsjs的日期格式化函数
        Date.prototype.format = function (format) {
            var o =
                {
                    "M+": this.getMonth() + 1, //month
                    "d+": this.getDate(),    //day
                    "h+": this.getHours(),   //hour
                    "m+": this.getMinutes(), //minute
                    "s+": this.getSeconds(), //second
                    "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
                    "S": this.getMilliseconds() //millisecond
                }
            if (/(y+)/.test(format))
                format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(format))
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            return format;
        }
        //比较日期相差天数
        function getDateDiff(date1, date2) {
            var arr1 = date1.split('-');
            var arr2 = date2.split('-');
            var d1 = new Date(arr1[0], arr1[1], arr1[2]);
            var d2 = new Date(arr2[0], arr2[1], arr2[2]);
            return (d1.getTime() - d2.getTime()) / (1000 * 3600 * 24);
        }

        function $(_id) {
            return document.getElementById(_id);
        }
        var new_date = new Date();// 系统日期-注意这里是用户的系统日期，非服务器系统日期
        new_date = new_date.format("yyyy-MM-dd");		//格式化系统日期

        function add_new(content_name, date_name, count) {//content_name组内容名称 ，date_name//日期字符串。、count 取多少条
            //
            for (var i = 1; i < count; i++) {		 //多少个类型
                if (typeof($(content_name + i)) != "undefined" && $(date_name + i) != null) {		//	判断是否存在内容
                    var _date = $(date_name + i).innerHTML;
                    var content = $(content_name + i).innerHTML;
                    if (getDateDiff(new_date, _date) < 3) { // 前三天内容添加new
                        content = content + " <img src='home/images/new2.gif' align='absmiddle'>";
                        $(content_name + i).innerHTML = content;
                    }
                }
            }
        }
        function init() {
            add_new("c0_", "d0_", 6);
            add_new("c1_", "d1_", 6);
            add_new("c2_", "d2_", 6);
            add_new("c3_", "d3_", 6);
            add_new("c4_", "d4_", 8);
            add_new("c5_", "d5_", 7);
        }
    </script>

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

        .cont {
            width: 5px;
            white-space: nowrap;
            word-break: keep-all;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        . tong {
            line-height: 28px;
            height: 27px
        }
    </style>

</head>

<body onLoad="init()">
<s:hidden value="month"></s:hidden>
<table width="805" border="0" align="center" cellpadding="0" cellspacing="0" background="home/images/picbg_14.png">
    <tr>
        <td height="8"></td>
    </tr>
    <tr>
        <td width="656" height="925" valign="top">
            <table width="599" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="599"><img src="home/images/pic_14.png" alt="" width="599" height="31" border="0" usemap="#MapMap"/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png" height="10"><img src="home/images/pic_16.png" width="599" height="10" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png">
                        <table width="581" border="0" align="center" cellspacing="0">
                            <tr>
                                <td width="275" align="right">
                                    <table width="261" border="0" cellspacing="0">
                                        <tr>
                                            <td width="259" align="left">
                                                <iframe id="iFrame3" name="iFrame3" frameborder="no" width="250" scrolling="n" height="100%" onload="this.height=iFrame3.document.body.scrollHeight" src="publish!pic.action"></iframe>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="302">
                                    <table width="288" border="0" align="left" cellspacing="0">
                                        <s:iterator value="map['ZongheXinxi']" status="vs">
                                            <s:if test="#vs.count<6">
                                                <tr>
                                                    <td width="9" height="30" align="left" style="border-bottom:1px  dotted #CCC;"><img src="home/images/picxinwen.jpg" width="8" height="8" alt=""/></td>
                                                    <td width="202" align="left" style="border-bottom:1px  dotted #CCC;" id="c0_${vs.count}"><a href="publish!generalInfoView.action?id=${id}" class="contentbiaoti">${name}</a></td>
                                                    <td width="71" align="right" style="border-bottom:1px  dotted #CCC;" id="d0_${vs.count}"><s:date name="createTime" format="yyyy-MM-dd"/></td>
                                                </tr>
                                            </s:if>
                                        </s:iterator>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png"><img src="home/images/pic_23.png" width="599" height="10" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png"><img src="home/images/pic_24.png" alt="" width="599" height="36" border="0" usemap="#Map2Map"/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png" valign="top">
                        <table width="92%" border="0" align="center" cellspacing="0">
                            <s:iterator value="map['XinwenDongtai']" status="vs">
                                <s:if test="#vs.count<6">
                                    <tr>
                                        <td valign="top"><img src="home/images/picgong.jpg" width="6" height="13" alt=""/></td>
                                        <td width="82%" height="25" align="left" style="padding-left:5px;" id="c1_${vs.count}" valign="baseline"><a href="publish!generalInfoView.action?id=${id}">${name}</a></td>
                                        <td width="18%" align="right" id="d1_${vs.count}"><s:date name="createTime" format="yyyy-MM-dd"/></td>
                                    </tr>
                                </s:if>
                            </s:iterator>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png"><img src="home/images/pic_23.png" width="599" height="10" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png"><img src="home/images/pic_29.png" alt="" width="599" height="36" border="0" usemap="#Map3Map"/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png" valign="top">
                        <table width="92%" border="0" align="center" cellspacing="0">
                            <s:iterator value="map['YewuZhidao']" status="vs">
                                <s:if test="#vs.count<6">
                                    <tr>
                                        <td valign="top"><img src="home/images/picgong.jpg" width="6" height="13" alt=""/></td>
                                        <td width="82%" height="25" align="left" style="padding-left:5px;" id="c2_${vs.count}" valign="baseline"><a href="publish!generalInfoView.action?id=${id}">${name}</a></td>
                                        <td width="18%" align="right" id="d2_${vs.count}"><s:date name="createTime" format="yyyy-MM-dd"/></td>
                                    </tr>
                                </s:if>
                            </s:iterator>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td background="home/images/pic_36.png"><img src="home/images/pic_23.png" width="599" height="10" alt=""/></td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_38.jpg" width="599" height="95" alt=""/></td>
                </tr>
                <tr>
                    <td height="195">
                        <table width="97%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="193" valign="top">
                                    <table width="45%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td><img src="home/images/picz_45.png" alt="" width="599" height="43" border="0" usemap="#Map7"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="95%" border="0" align="center" cellspacing="0">
                                                    <s:iterator value="map['120JianBao']" status="vs">
                                                        <s:if test="#vs.count<6">
                                                            <tr>
                                                                <td valign="top"><img src="home/images/picjian.jpg" width="6" height="13" alt=""/></td>
                                                                <td width="82%" height="25" align="left" style="padding-left:5px;" id="c3_${vs.count}" valign="baseline"><a href="publish!view.action?id=${id}">${name}</a></td>
                                                                <td width="18%" align="right" id="d3_${vs.count}"><s:date name="createTime" format="yyyy-MM-dd"/></td>
                                                            </tr>
                                                        </s:if>
                                                    </s:iterator>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td width="254" valign="top">
            <table width="206" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="206"><img src="home/images/pic_15.png" width="206" height="41" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png"><img src="home/images/pic_18.png" width="206" height="11" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png">
                        <marquee id="today_news" onMouseOver="today_news.stop()" onMouseOut="today_news.start()" scrollamount="1" scrolldelay="40" direction="up" width="190" height="120">
                            <table width="185" border="0" align="center" cellpadding="0" cellspacing="0" class="seamless" id="obj">
                                <s:iterator value="map['TongzhiGonggao']" status="vs">
                                    <s:if test="#vs.count<16">
                                        <tr>
                                            <td width="26"></td>
                                            <td width="159" class="tong" height="28" style="word-break:break-all;"><img src="home/images/gonggao1.jpg" width="9" height="9" alt=""/> <span id="c4_${vs.count}" valign="baseline"> <a href="publish!view.action?id=${id}">${name}</a></span></td>
                                            <td id="d4_${vs.count}" style="display:none "><s:date name="createTime" format="yyyy-MM-dd"/></td>
                                        </tr>
                                    </s:if>
                                </s:iterator>
                            </table>
                        </marquee>
                    </td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png"><img src="home/images/pic_21.png" width="206" height="10" alt=""/></td>
                </tr>
                <tr>
                    <td><img src="home/images/picl_44.png" alt="" width="206" height="53" border="0" usemap="#Map5Map"/></td>
                </tr>

                <tr>
                    <td><img src="home/images/pic_48.png" alt="" width="206" height="51" border="0" usemap="#Map6Map"/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png">
                        <table width="206" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="103" height="39" align="center" background="home/images/picp_22.png" class="font12w" id="tdcaigou" onMouseOver="caigou();return false;"></td>
                                <td id="tdhuiyi" width="103" height="39" onmouseover="huiyi();return false;" align="center" background="home/images/picp_23.png"></td>
                            </tr>
                        </table>
                        <table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="6" colspan="2" align="center"></td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="caigou" style="display: ">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <s:iterator value="map['department']" status="vs">
                                                <s:if test="%{CDepartmentType.id == 'branch'}">
                                                    <tr>
                                                        <td width="50%" height="25" align="center"><a href="publish!depratmentDoc.action?publishDirectory.id=106&departmentBySendDepartmentId.id=<s:property value="id"/>" class="fenzhan"><s:property value="name"/> </a></td>
                                                    </tr>
                                                </s:if>
                                            </s:iterator>
                                        </table>
                                    </div>
                                    <div id="huiyi" style="display:none ">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <s:iterator value="map['department']" status="vs">
                                                <s:if test="%{CDepartmentType.id == 'section'}">
                                                    <tr>
                                                        <td width="50%" height="25" align="center"><a href="publish!depratmentDoc.action?publishDirectory.id=106&departmentBySendDepartmentId.id=<s:property value="id"/>" class="fenzhan"><s:property value="name"/> </a></td>
                                                    </tr>
                                                </s:if>
                                            </s:iterator>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_32.png" width="206" height="15" alt=""/></td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_26.png" width="206" height="46" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png">
                        <table width="185" border="0" align="center" cellpadding="0" cellspacing="0" class="seamless">
                            <s:iterator value="map['jijiuchangshi']" status="vs">
                                <s:if test="#vs.count<6">
                                    <tr>
                                        <td width="15"></td>

                                        <td width="154" class="tong" height="28" style="word-break:break-all;"><img src="home/images/gonggao1.jpg" width="9" height="9" alt=""/> <a href="publish!view.action?id=${id}" id="c5_${vs.count}">${name}</a></td>
                                        <td width="16" id="d5_${vs.count}" style="display:none "><s:date name="createTime" format="yyyy-MM-dd"/>
                                        </td>
                                    </tr>
                                </s:if>
                            </s:iterator>
                            <tr>
                                <td></td>
                                <td align="right"><a href="publish!publicListPaged.action?publishDirectory.id=108"> 更多>></a></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_32.png" width="206" height="15" alt=""/></td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_34.png" width="206" height="56" alt=""/></td>
                </tr>
                <tr>
                    <td background="home/images/pic_31.png">
                        <table width="84%" border="0" align="center" cellspacing="0">
                            <tr>
                                <td width="23%" height="25" align="center"><a href="javascript:reportForms(1)" class="yuefen">1月</a></td>
                                <td width="24%" align="center"><a href="javascript:reportForms(2)" class="yuefen">2月</a></td>
                                <td width="25%" align="center"><a href="javascript:reportForms(3)" class="yuefen">3月</a></td>
                                <td width="28%" align="center"><a href="javascript:reportForms(4)" class="yuefen">4月</a></td>
                            </tr>
                            <tr>
                                <td height="25" align="center"><a href="javascript:reportForms(5)" class="yuefen">5月</a></td>
                                <td align="center"><a href="javascript:reportForms(6)" class="yuefen">6月</a></td>
                                <td align="center"><a href="javascript:reportForms(7)" class="yuefen">7月</a></td>
                                <td align="center"><a href="javascript:reportForms(8)" class="yuefen">8月</a></td>
                            </tr>
                            <tr>
                                <td height="25" align="center"><a href="javascript:reportForms(9)" class="yuefen">9月</a></td>
                                <td align="center"><a href="javascript:reportForms(10)" class="yuefen">10月</a></td>
                                <td align="center"><a href="javascript:reportForms(11)" class="yuefen">11月</a></td>
                                <td align="center"><a href="javascript:reportForms(12)" class="yuefen">12月</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="home/images/pic_39.png" width="206" height="9" alt=""/></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<map name="MapMap">
    <area shape="rect" coords="534,7,578,24" href="publish!publicListPaged.action?publishDirectory.id=103">
</map>
<map name="Map2Map">
    <area shape="rect" coords="534,12,575,27" href="publish!publicListPaged.action?publishDirectory.id=104">
</map>
<map name="Map3Map">
    <area shape="rect" coords="533,9,575,26" href="publish!publicListPaged.action?publishDirectory.id=105">
</map>
<map name="Map5Map">
    <area shape="rect" coords="22,10,196,46" href="publish!sendMail.action?mailType=leader">
</map>
<map name="Map6Map">
    <area shape="rect" coords="26,6,194,40" href="publish!sendMail.action?mailType=employee">
</map>
<map name="Map">
    <area shape="rect" coords="534,7,578,24" href="#">
</map>
<map name="Map2">
    <area shape="rect" coords="534,12,575,27" href="#">
</map>
<map name="Map3">
    <area shape="rect" coords="533,10,575,27" href="#">
</map>
<map name="Map4">
    <area shape="rect" coords="291,11,340,32" href="#">
</map>

<map name="Map5">
    <area shape="rect" coords="22,10,196,46" href="#">
</map>
<map name="Map6">
    <area shape="rect" coords="26,6,194,40" href="#">
</map>
<map name="Map7" id="Map7">
    <area shape="rect" coords="532,9,585,37" href="publish!publicListPaged.action?publishDirectory.id=101"/>
</map>

</body>
</html>
