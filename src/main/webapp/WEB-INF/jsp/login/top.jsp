<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jsp/utils/tags.jsp" %>
<%@ include file="/jsp/fragment/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <!--IE浏览器解析模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>内容部分</title>

    <!-- 1，加载Bootstrap层叠样式表 -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--2, jQuery库,同时加载该库必须在加载bootstrap.min.js之前 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!--3，加载bootstrap的核心js库-->
    <script src="js/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div style="width:100%; height:40px; background:#1f262d; color:#FFF; line-height:40px; text-align:center; font-size:12px;">
    <div style=" width:146px; float:left; border-left:1px solid #2e363f;">${rootMenu.name}</div>
    <div style=" width:146px;float:left; border-left:1px solid #2e363f;">admin管理员</div>
</div>
</body>
</html>
