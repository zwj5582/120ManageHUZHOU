<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>管理系统</title>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.messager.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.easy.ui.1.3.3/themes/default/easyui.css"/>
    <script type="text/javascript" src="js/jquery.easy.ui.1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function tips_pop() {
            var MsgPop = document.getElementById("winpop");
            var popH = parseInt(MsgPop.style.height);
            if (popH == 0) {
                MsgPop.style.display = "block";
                show = setInterval("changeH('up')", 2);
            }
            else {
                hide = setInterval("changeH('down')", 2);
            }
        }
        function changeH(str) {
            var MsgPop = document.getElementById("winpop");
            var popH = parseInt(MsgPop.style.height);
            if (str == "up") {
                if (popH <= 150) {
                    MsgPop.style.height = (popH + 4).toString() + "px";
                }
                else {
                    clearInterval(show);
                }
            }
            if (str == "down") {
                if (popH >= 4) {
                    MsgPop.style.height = (popH - 4).toString() + "px";
                }
                else {
                    clearInterval(hide);
                    MsgPop.style.display = "none";
                }
            }
        }
        function readVersion(id) {
            $('#m').dialog('close');
            $.post("versionManage!read.action", {id: id}, function (data) {
                window.parent.window.document.getElementById("topFrame").contentWindow.removeNewImg();
            }, "json");

        }
        function message() {
            $.ajax({
                url: 'versionManage!getVersionMessage.action',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var t = "<table border='0' width='600' style='margin:20px;'>";
                    $.each(data, function (i, n) {
                        t += "<tr><td><font color='red'><strong>版本号：</strong></font>" + n.number + "</td></tr>";
                        t += "<tr><td><font color='red'><strong>更新日期：</strong></font>" + n.date + "</td></tr>";
                        t += "<tr><td colspan='2'><font color='red'><strong>更新内容：</strong></font></td></tr>"
                        t += "<tr><td colspan='2'> " + n.remarks + "</td></tr>";
                        t += "<tr><td colspan='2'><hr/></td></tr>";
                        t += "<tr><td colspan='2' align='center'> <input type='button' onclick='readVersion(" + n.id + ")' value='已阅' /> </td></tr>";
                    });

                    t += "</table>";
                    $("#m").append(t);
                    $('#m').dialog({
                        title: '版本信息',
                        width: '700',
                        height: '500',
                        modal: true
                    });
                }
            });
        }
    </script>

    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background: #e5f4fe;
        }

        -->
    </style>

    <style>
        .navPoint {
            COLOR: white;
            CURSOR: hand;
            FONT-FAMILY: Webdings;
            FONT-SIZE: 9pt
        }
    </style>
    <style type="text/css">
        #winpop {
            width: 200px;
            position: absolute;
            right: 0;
            bottom: 0;
            border: 1px solid #999999;
            margin: 0;
            padding: 1px;
            overflow: hidden;
            display: none;
            background: #FFFFFF
        }

        #winpop .title {
            width: 100%;
            height: 20px;
            line-height: 20px;
            background: #8ca5cf;
            text-align: center;
            font-size: 12px;
        }

        #winpop .con {
            width: 100%;
            padding-top: 10px;
            line-height: 22px;
            vertical-align: center;
            font-weight: bold;
            font-size: 12px;
            color: #FF0000;
            text-decoration: underline;
            text-align: center
        }

        #silu {
            font-size: 13px;
            color: #999999;
            position: absolute;
            right: 0;
            text-align: right;
            text-decoration: underline;
            line-height: 22px;
        }

        .close {
            position: absolute;
            right: 4px;
            top: -1px;
            color: #FFFFFF;
            cursor: pointer
        }
    </style>
</head>
<body style="overflow:hidden">
<div id="m"></div>
<%
    String yearCheck = (String) request.getAttribute("yearCheck");
    String insurance = (String) request.getAttribute("insurance");
    String medicine = (String) request.getAttribute("medicine");
    String driverHandover = (String) request.getAttribute("driverHandover");
    String stretcherHandover = (String) request.getAttribute("stretcherHandover");
    String checkMail = (String) request.getAttribute("checkMail");
    Integer mail = (Integer) request.getAttribute("mail");
    String deviceHandover = (String) request.getAttribute("deviceHandover");
    String petrolCardAddMoney = (String) request.getAttribute("petrolCardAddMoney");
    String licenseVerification = (String) request.getAttribute("licenseVerification");
%>

<div id="winpop">
    <div class="title">提示<span class="close" onclick="tips_pop()">×</span></div>
    <div class="con">
        <%
            if ("yes".equals(yearCheck)) {
        %>
        <a href="vehicle!findVehicleYearCheckDateList.action" target='I2'><font color='red'>车辆即将需要年检</font></a></br>
        <%
            }
            if ("yes".equals(insurance)) {
        %>
        <a href='vehicle!findVehicleInsuranceDateList.action' target='I2'><font color='red'>车辆保险即将到期</font></a></br>
        <%
            }
            if ("yes".equals(licenseVerification)) {
        %>
        <a href='vehicleEmployee!driverFileDirectory.action' target='I2'><font color='red'>驾驶证验证时间即将到期</font></a></br>
        <%
            }
            if ("yes".equals(medicine)) {
        %>
        <a href='medicineStock!findMedicine.action' target='I2'><font color='red'>药材即将到期</font></a></br>
        <%
            }
            if ("yes".equals(driverHandover)) {
        %>
        <a href="handOver!findDriverHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target='I2'><font color='red'>司机交接班有异常</font></a></br>
        <%
            }
            if ("yes".equals(stretcherHandover)) {
        %>
        <a href="handOver!findStretcherHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target='I2'><font color='red'>担架员交接班有异常</font></a></br>
        <%
            }
            if ("yes".equals(deviceHandover)) {
        %>
        <a href="deviceHandover.action?sc['qingkuang']=exceptionN&sc['qk']=1" target='I2'><font color='red'>医生交接班有异常</font></a></br>
        <%
            }
            if ("yes".equals(checkMail)) {
        %>
        <a href='publish1!findReceiveDoc.action' target='I2'><font color='red'>您有<%=mail %>
        </>封邮件未接收</font></a></br>
        <%
            }
            if ("yes".equals(petrolCardAddMoney)) {
        %>
        <font color='red'>油卡已充值，请尽快前往激活</font>
        <%
            }

        %>
    </div>
</div>
<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">

    <tr>
        <td height="100%" width="192" id=frmTitle noWrap align="center" valign="top" style="border-top:1px solid #59befc; border-right:1px solid #59befc; background:#ffffff;">
            <iframe name="I1" height="100%" width="192" src="<s:url action="main" method="left"/>" frameborder="0" scrolling="yes">
                浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
            </iframe>
        </td>
        <!--<td width="9" valign="middle"  bgcolor="#1262ba" onclick=switchSysBar()><SPAN class=navPoint
    id=switchPoint title=关闭/打开左栏><img src="../images/main_41.gif" name="img1" width=9 height=52 id=img1></SPAN></td>-->
        <td width="5"></td>
        <td align="center" valign="top">
            <!--<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
              <tr>
                <td height="8" style=" line-height:8px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
                  <tr>
                    <td width="14"><img src="../images/main_24.gif"></td>
                    <td background="../images/main_26.gif" style="line-height:8px;">&nbsp;</td>
                    <td width="7"><img src="../images/main_28.gif"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
                  <tr>
                    <td><iframe name="I2" id="I2" height="100%" width="100%" src="tab/welcom.html" border="0" frameborder="0" scrolling="auto"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
                    <td width="3" style="width:3px; background:#1262ba;">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="12" style="line-height:12px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
                  <tr>
                    <td width="14" height="12"><img src="../images/main_46.gif" width="14" height="12"></td>
                    <td background="../images/main_48.gif" style="line-height:12px;">&nbsp;</td>
                    <td width="7"><img src="../images/main_50.gif"></td>
                  </tr>
                </table></td>
              </tr>
            </table>-->


            <table border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;width:100%;height:100%">
                <tr>
                    <td style="border:1px solid #59befc; background:#fff;">
                        <iframe name="I2" id="I2" height="100%" width="100%" src="<s:url action="main" method="right"/>" frameborder="0" scrolling="auto"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
                    </td>

                </tr>
            </table>
        </td>
    </tr>
</table>
<%
    if ("yes" == yearCheck || "yes" == insurance || "yes" == medicine || "yes" == driverHandover || "yes" == stretcherHandover || "yes" == checkMail || "yes" == deviceHandover || "yes" == licenseVerification) {
%>
<script type="text/javascript">
    window.onload = function () {
        document.getElementById('winpop').style.height = '0px';
        setTimeout("tips_pop()", 800);
    }
</script>
<%
    }
%>
</body>
</html>