<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="js/bootstrap/datepicker/jquery-1.11.3.min.js"></script>
    <title>用户登录</title>
    <style>
        * {
            margin:0;
            padding:0;
        }

        .logo {
            text-align:center;
            margin-top:30px;
            margin-bottom:30px;
        }

        .ba01 {
            width:100%;
            height:413px;
            background:#ebebeb;
        }

        .ba02 {
            width:100%;
            height:383px;
            background:url(images/login_banner.png) center no-repeat;
            padding-top:30px;
        }

        .ba03 {
            width:298px;
            height:308px;
            background:#fff;
            filter:alpha(opacity =     82);
            -moz-opacity:0.82;
            opacity:0.82;
            margin-left:60%;
            -moz-border-radius:10px;
            -webkit-border-radius:10px;
            border-radius:10px;
            border:#d2d2d2 1px solid;
            padding:26px;
        }

        .title {
            font-family:"宋体";
            font-size:20px;
            color:#333;
            font-weight:bold;
        }

        #submitDiv {
            background:url('images/login_denglv.png');
            background-repeat:no-repeat;
            background-position:center center;
            width:280px;
            height:40px;
            display:block;
            border:none;
        }

        #submitDiv:hover {
            background:url('images/login_denglvon.png' ');
            }
    </style>

    <script type="text/javascript">
        if (top != this) {
            top.location.href = "login.jsp";
        }
        window.onload = function() {
            if (!window.applicationCache) {
                document.getElementById("tip").style.display = "block";
            }
        };

        function submiting() {
            document.getElementById("form").submit();
        }

        /*$(function(){
         var username = $("#username").val();
         var password = $("#password").val();
         var captcha = $("#captcha").val();
         alert(username + "    " + password + "   " +  captcha);
         });*/
    </script>
</head>
<body>
<div id="tip" style="position:static;top:60px;display:none;left:0px;margin:0px;margin-top:60px;padding:0px;width:100%;height:30px; text-align:center;">
    <div style="color:red;font-size:14px;text-align:center;">您的浏览器版本过低，可能会影响到系统界面的美观和部分功能的正常使用，建议更换其他浏览器或升级此浏览器！</div>
</div>

<div class="logo">
    <img src="images/login_logo.png"/>
</div>
<div class="ba01">
    <div class="ba02">
        <div class="ba03">
            <div class="title">欢迎您登录</div>
            <div style="width:298px;margin:0 auto;padding-top:20px;">
                <form id="form" class="form-signin" method="post" action="login">
                    <div style="height:40px;">
                        <img style="height:40px;vertical-align:bottom;" src="images/yonghu.png">
                        <input type="text" id="username" name="username" value="${username}" maxlength="32" class="inputtext" style="width:250px;height:40px;line-height:40px;font-size:14px;padding-left:4px;" onblur="if(this.value != null) $('#warningMsg').hide();"/>
                    </div>
                    <div style="height:40px;margin-top:20px;">
                        <img style="height:40px;vertical-align:bottom;" src="images/mima.png">
                        <input type="password" id="password" name="password" maxlength="32" class="inputtext" style="width:250px;height:40px;line-height:40px;font-size:18px;color:#999;padding-left:4px;" onblur="if(this.value != null) $('#warningMsg').hide();"/>
                    </div>
                    <div style="margin-top:20px;">
                        <div style="height:40px;margin-top:20px;">
                            <img style="height:40px;vertical-align:bottom;" src="images/yanzheng.png">
                            <input id="captcha" name="captcha" value="" maxlength="4" class="inputtext" style="width:150px;height:40px;line-height:40px;font-size:14px;color:#999;padding-left:4px;" onblur="if(this.value != null) $('#warningMsg').hide();"/>
                            <img src="login/captcha" align="middle" style="width:60px;height:30px;"/>
                        </div>

                        <c:if test="${message != null && message != ''}">
                        <div id="warningMsg" style="height:40;margin-top:20;">
                            <img style="height:40px;vertical-align:bottom;" src="images/warning.png">
                            <span style="vertical-align:middle;width:150px;height:40px;line-height:40px;color:#999;padding-left:4px;">
										<font style="color:red;height:40px;">${message}</font>
									</span>
                        </div>
                        </c:if>

                        <c:if test="${message != null && message != ''}">
                        <div style="margin-top:10px;">
                            </c:if>
                            <c:if test="${message == null || message == ''}">
                            <div style="margin-top:20px;">
                                </c:if>
                                <button type="submit" id="submitdiv" onclick="submiting();"></button>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div style="width:100%;height:30px;text-align:center;margin-top:50px;font-size:12px;color:#565656;">
    <%--		Copyright©2015 杭州美诺泰科科技有限公司--%>&nbsp;
</div>
</body>
</html>
