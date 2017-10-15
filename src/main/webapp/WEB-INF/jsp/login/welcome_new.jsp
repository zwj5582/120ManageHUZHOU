<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../utils/tags.jsp" %>
<%@ include file="../fragment/head.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <title>welcome</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <script src="js/bootstrap/datepicker/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.messager.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.easy.ui.1.3.3/themes/default/easyui.css"/>
    <script type="text/javascript" src="js/jquery.easy.ui.1.3.3/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="js/jquery.easydrag.js"></script>
    <script type="text/javascript">
        function tips_pop() {
            var msgPoped = document.getElementById("tips");
            var popH = parseInt(msgPoped.style.height);
            if (popH == 0) {
                msgPoped.style.display = "block";
                show = setInterval("changeH('up')", 2);
            } else {
                hide = setInterval("changeH('down')", 2);
            }
        }

        function changeH(str) {
            var msgPoped = document.getElementById("tips");
            var popH = parseInt(msgPoped.style.height);
            if (str == "up") {
                if (popH <= 150) {
                    msgPoped.style.height = (popH + 4).toString() + "px";
                } else {
                    clearInterval(show);
                }
            }
            if (str == "down") {
                if (popH >= 4) {
                    msgPoped.style.height = (popH - 4).toString() + "px";
                } else {
                    clearInterval(hide);
                    msgPoped.style.display = "none";
                }
            }
        }

        <s:if test="'yes' == yearCheck || 'yes' == insurance || 'yes' == medicine || 'yes' == driverHandover || 'yes' == stretcherHandover || 'yes' == checkMail || 'yes' == deviceHandover || 'yes' == licenseVerification">
        window.onload = function () {
            $("#tips").easydrag();
            $("#tips").show();

            $("#tips").css({
                bottom: 10,
                right: 10
            }).slideDown(5000);
        };
        </s:if>
    </script>
    <style>
        .wecbg {
            width: 100%;
            min-width: 820px;
            height: 100%;
            min-height: 600px;
            background: url(images/welcome_bg.png) bottom center no-repeat;
        }

        .wecbg_01 {
            padding-top: 70px;
            margin-left: 80px;
            font-family: "黑体";
            font-size: 40px;
            color: #8f8f8f;
        }

        .dragDiv .title_span {
            float: left;
            display: block;
        }

        .dragDiv .close_span {
            float: right;
            font-size: 12px;
            display: block;
            margin-right: 10px;
            z-index: 10000;
        }

        .infoUL {
            width: 100%;
            margin: 0px;
            padding: 0px;
            font-size: 13px;
        }
    </style>
</head>

<body>
<div class="wecbg">
    <div class="wecbg_01">欢迎您来到120急救管理系统！</div>
</div>
<%--

<div id="tips" class="dragDiv" style="width:200;height:200;background:#f4f4f4;position:absolute;display:none;overflow:auto">
    <table width="100%" border="0" cellspacing="0" class="table table-bordered" style="padding:5px">
        <tr>
            <td id="tipsTitle">
                <span class="title_span">&nbsp;提示</span>
                <span class="close_span" onclick="tips_pop()">x</span>
            </td>
        </tr>

        <s:if test="yearCheck=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="vehicle!findVehicleYearCheckDateList.action" target="mainFrame"><font color="red">车辆即将需要年检</font></a>
                </td>
            </tr>
        </s:if>

        <s:if test="vehicleRetire=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="vehicle!findVehicleYearRetirementDateList.action" target="mainFrame"><font color="red">车辆即将报废</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="insurance=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="vehicle!findVehicleInsuranceDateList.action" target="mainFrame"><font color="red">车辆保险即将到期</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="medicine=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="medicineStock!findMedicine.action" target="mainFrame"><font color="red">药材即将到期</font> </a>
                </td>
            </tr>
        </s:if>


        <s:if test="licenseVerification=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="vehicleEmployee!driverFileDirectory.action" target="mainFrame"><font color="red">驾驶证验证时间即将到期</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="driverHandover=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="handOver!findDriverHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target="mainFrame"><font color="red">司机交接班有异常</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="stretcherHandover=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="handOver!findStretcherHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target="mainFrame"><font color="red">担架员交接班有异常</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="deviceHandover=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="deviceHandover.action?sc['qingkuang']=exceptionN&sc['qk']=1' target="mainFrame"><font color="red">交接班有异常</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="checkMail=='yes'">
            <tr>
                <td height="20" align="center">
                    <a href="publish1!findReceiveDoc.action" target="mainFrame"><font color="red">您有${mail}</>封邮件未接收</font> </a>
                </td>
            </tr>
        </s:if>

        <s:if test="petrolCardAddMoney=='yes'">
            <tr>
                <td height="20" align="center">
                    <font color="red">油卡已充值，请尽快前往激活</font>
                </td>
            </tr>
        </s:if>
        <tr></tr>
    </table>
</div>
--%></body>
</html>