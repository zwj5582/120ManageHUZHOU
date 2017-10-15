<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link rel="icon" href="images/home/favicon.ico" TYPE="images/home/favicon.ico"/>
    <link rel="shortcut icon" href="images/home/favicon.ico">
    <script type="text/javascript" src="js/website.js"></script>
    <s:include value="/home/popWindow.jsp"/>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <title>120急救管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/styleai.css">
    <style type="text/css">
        <!--

        .con {
            margin: 0 auto;
            overflow: hidden;
            width: 760px;
        }

        ol {
            list-style-type: disc;
        }

        .red {
            color: #f00;
        }

        .pop {
            overflow: hidden;
            width: 280px;
            height: 230px;
            line-height: 20px;
            text-align: center;
            display: none;
        }

        .pop_a {
            display: block;
        }

        a.a1 {
            color: #fff;
        }

        a.a2 {
            color: #000;
        }

        -->
    </style>

    <style>
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;

        }

        li {
            list-style-type: none;
        }
    </style>
</head>

<body>
<s:form action="forum!publishComment">
    <s:hidden name="topicId"></s:hidden>
    <s:hidden name="forumCommentList.pageNumber"></s:hidden>
    <table width="599" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td width="599" height="96" align="center">
                <table width="558" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="176" align="center" valign="top"><s:if test="%{topic.content==null || topic.content==''}"> <img src="images/luntantubg.jpg" width="176" height="147" class="imgant"/> </s:if>
                            <s:else> <img id="picture" src="../${topic.content}" width="176" height="147" class="imgant"/> </s:else>
                        </td>
                        <td width="362" align="center" style=" line-height:18px;">
                            <table width="344" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="245" height="30" align="left"><a href="#" class="xiang"><strong>
                                        <s:property value="topic.name"/>
                                    </strong></a></td>
                                </tr>
                                <tr>
                                    <td height="25" align="left" style=" line-height:25px;"><strong>
                                        <s:property value="topic.contentText"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style=" line-height:18px; padding:10px 3px 3px 3px;"></td>
                    </tr>
                </table>
                <br/>

                <table width="79%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/lun_17.png">
                    <tr>
                        <td><img src="images/lun_15.png" width="599" height="14"/></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" background="images/lun_17.png">

                            <table width="90%" border="0" cellpadding="0" cellspacing="0">

                                <tr>
                                    <td height="21" colspan="2"><s:textarea name="comment" id="comment" style="width:540px; height:66px; border:#FFFFFF 0px;overflow:auto;" onKeyDown="checkMaxInput(this)" onKeyUp="checkMaxInput(this)"></s:textarea></td>
                                </tr>

                            </table>

                        </td>

                    </tr>
                    <tr>
                        <td background="images/lun_23.png" height="38">
                            <table width="95%" border="0">
                                <tr>
                                    <td width="88%" align="left" id="remLen" style="color:#000000; padding-left:25px;">还剩下140字</td>
                                    <td width="12%" align="right"><a href="javascript:toPublish(document.forms[0].comment.value);" onfocus="this.blur()"><img src="images/weibo01.png" width="82" height="27" border="0" onmouseover="this.src='images/weibo02.png'" onmouseout="this.src='images/weibo01.png'"/></a></td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>
                <table width="93%" border="0" align="top" cellpadding="0" cellspacing="0">

                    <tr>
                        <td height="15" align="center"><img src="images/lun_27.png" width="599" height="15" border="0"/></td>
                    </tr>
                    <s:iterator value="forumCommentList.list">
                        <tr>
                            <td align="center" background="images/lun_30.png">
                                <table width="539" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;word-break:break-all;word-wrap:break-word;">
                                    <tr>

                                        <td height="48" align="left" valign="top" style="word-break:break-all;">
                                            <div id="wrap">	<span style="font-weight:bold; font-size:13px; color:#155d8d;">
               		<s:property value="account.username"/></span>：<s:property value="content"/></div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="539" height="16" align="right" valign="bottom" style="color:#ababab"><s:date name="publishTime" format="yyyy-MM-dd HH:mm"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="13" align="center" background="images/lun_30.png"><img src="images/weibo_12.jpg" width="544" height="6" border="0"/></td>
                        </tr>


                    </s:iterator>
                </table>


                <table width="100%" height="42" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px" background="images/lun_30.png">
                    <tr>
                        <td width="44%"><a id="open_e"></a></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td height="21">共有 ${forumCommentList.fullListSize} 条记录，当前第 ${forumCommentList.pageNumber}/${forumCommentList.totalPages} 页</td>
                        <td width="56%" align="left">
                            <table width="313" border="0" align="left" cellpadding="0" cellspacing="0" style="font-size:12px">
                                <tr>
                                    <td width="42"><img src="images/first.gif" width="37" height="15" onClick="setPage(1)"/></td>
                                    <td width="47"><img src="images/back.gif" width="43" height="15" onClick="setPage(${forumCommentList.pageNumber-1})"/></td>
                                    <td width="50"><img src="images/next.gif" width="43" height="15" onClick="setPage(${forumCommentList.pageNumber+1})"/></td>
                                    <td width="40"><img src="images/last.gif" width="37" height="15" onClick="setPage(${forumCommentList.totalPages})"/></td>
                                    <td width="97">转到第
                                        <input name="inputPageNumber" type="text" size="4" style="height:19px; width:35px; border:1px solid #999999;"/>页
                                    </td>
                                    <td width="37"><img src="images/go.gif" width="37" height="15" onClick="setPage(document.forms[0].inputPageNumber.value)"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>


        <tr>
            <td><img src="images/lun_34.png" width="599" height="13"></td>
        </tr>

    </table>


</s:form>
</body>
</html>
<script>
    document.getElementById("comment").value = '';
    function setPage(pageNumber) {
        if (!isNaN(pageNumber)) {
            document.forms[0]["forumCommentList.pageNumber"].value = pageNumber;
            document.forms[0].action = "forum!topicDetail.action";
            document.forms[0].submit();
        }
        else {
            alert("请输入数字");
        }
    }


    maxLen = 140;	//定义用户可以输入的最多字数
    function checkMaxInput(obj) {
        if (obj.value.length > maxLen) {	//如果输入的字数超过了限制
            obj.value = obj.value.substring(0, maxLen);	//就去掉多余的字
            document.getElementById("remLen").innerText = '您输入的内容超出了字数限制'
        }
        else {
            document.getElementById("remLen").innerText = '还剩下' + (maxLen - obj.value.length) + '字';//计算并显示剩余字数
        }
    }

    var picture = '${topic.content}';
    if (picture != null && picture != '') {
        document.getElementById("picture").src = '../${topic.content }?random=' + Math.random();
    }


    function toPublish(comment) {

        if (comment == '') {
            alert("内容不能为空，请输入内容，谢谢合作！");
        } else {
            var random = Math.random();
            $.ajax({
                url: "forum!checkLogin.action?random=" + random,
                success: function (data) {
                    data = data.replace(/^\s+|\s+$/g, "");
                    if (data == "false") {
                        document.getElementById("open_e").click();
                    } else {
                        document.forms[0].submit();
                    }
                }
            });
        }

    }

    function urlencode(text) {
        text = encodeURIComponent(encodeURIComponent(text));
        av = text.split('%25');
        for (i = 0; i < av.length; i++) {
            text = text.replace('%25', '%');
        }
        return text;
    }

    function login() {
        var userName = $("#userName").val();
        var password = $("#password").val();
        var captcha = $("#captcha").val();
        if (userName == '') {
            alert("用户名不能为空");
            return;
        } else if (password == '') {
            alert("密码不能为空");
            return;
        } else if (captcha == '') {
            alert("验证码不能为空");
            return;
        }
        var random = Math.random();
        $.ajax({
            url: "forum!login.action?random=" + random,
            data: {username: urlencode(userName), password: password, captcha: captcha},
            success: function (data) {
                data = data.replace(/^\s+|\s+$/g, "");
                $("#popTitle").text(data);
                if (data == "登陆成功") {
                    document.getElementById("close_e").click();
                    alert(data);
                }
            }
        });
    }
</script>


