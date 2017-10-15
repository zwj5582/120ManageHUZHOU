<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jsp/utils/tags.jsp" %>
<%@ include file="/jsp/fragment/head.jsp" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <!--IE浏览器解析模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>美诺泰科120急救信息系统</title>

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
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!--3，加载bootstrap的核心js库-->
    <script src="js/bootstrap/bootstrap.min.js"></script>
</head>

<frameset rows="*" cols="220,*" frameborder="no" border="0" framespacing="0">
    <frame src="main!left.action" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame"/>
    <frameset rows="40,*" cols="*" framespacing="0" frameborder="no" border="0">
        <frame src="main!top.action" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame"/>
        <frame src="main!content.action" name="mainFrame" id="mainFrame" title="mainFrame"/>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>