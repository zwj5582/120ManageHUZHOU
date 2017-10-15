<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/utils/tags.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+request.getServerName() + ":"+request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
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

    <script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/treeUtil.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            var rootMenuId = '${rootMenu.id}';
            var zNodes =[];
            <s:if test="menuJsonStr!=null">
            zNodes = ${menuJsonStr };
            </s:if>

            var tree = new Array();
            zNodes = createTree(zNodes);

            var menu;
            for (var i = 0; i < zNodes.length; ++i){
                if (zNodes[i].id == rootMenuId){
                    menu = zNodes[i];
                }
            }

            var html = "<ul >";
            for (var i = 0; i < menu.children.length; ++i){
                var child = menu.children[i];
                /*if (child.url == null || child.url == ''){
                 var line = "<li  ><a href='#' target= '" + child.target + "'>" + child.name + "</a></li>";
                 html += line;
                 } else {
                 var line = "<li  ><a href=" + child.url +" target= '" + child.target + "'>" + child.name + "</a></li>";
                 html += line;
                 }
                 if (child.children != null && child.children.length > 0){
                 for (var n = 0; n < child.children.length; ++n){
                 var line = "<li  ><a href=" + child.children[n].url +" target= '" + child.children[n].target + "'>" + child.children[n].name + "</a></li>";
                 html += line;
                 }
                 } */
                html += buildTree(child);
            }
            html += "</ul>";

            $("#menu").html(html);
        });

        function buildTree(obj){
            var html = "";
            if (obj.url == null || obj.url == ''){
                var line = "<li  ><a href='#' target= '" + obj.target + "'>" + obj.name + "</a></li>";
                html += line;
            } else {
                var line = "<li  ><a href=" + obj.url + " target= '" + obj.target + "'>" + obj.name + "</a></li>";
                html += line;
            }

            if (obj.children.length > 0){
                html += "<ul>";
                for (var i = 0; i < obj.children.length; ++i){
                    var child = obj.children[i];
                    html += buildTree(child);
                }
                html += "</ul>";
            }
            return html;
        }


        function doToggle(){
            $('.dropdown-toggle').dropdown();
        }
    </script>
</head>


<body style="background:#2e363f;">
<div style="width:220px; height:100%; background:#2e363f; color:#838c97;background:#1f262d; ">
    <div style=" width:100%; height:75px;background:#1f262d; text-align:center; padding-top:22px;"><img src="images/120logo.png" /></div>
    <div id="menu">

    </div>
</div>
</body>
</html>
