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
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!--3，加载bootstrap的核心js库-->
    <script src="js/bootstrap/bootstrap.min.js"></script>
</head>
<body>

<!-- 当前位置 -->
<div id="current_position" style="background: ">
    <img src="images/home.png"/>&nbsp;&nbsp;当前位置：&nbsp;人事科&nbsp;>&nbsp;<span>员工管理</span>
</div>

<!-- 搜索框 -->
<div id="search_box" align="center">
    <form class="form-inline">
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
            <tr>
                <td width="21%" align="center">
                    <div class="form-group form-group-sm">
                        <label for="exampleInputName2">姓名：</label> <input type="text"
                                                                          class="form-control width_input " placeholder="某某某">
                    </div>
                </td>
                <td width="21%" align="center">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>工作分站：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                莘庄分站 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">莘庄分</a>
                                </li>
                                <li><a href="#">站虹桥分站</a>
                                </li>
                                <li><a href="#">瑞桥分站</a>
                                </li>
                                <li><a href="#">站虹桥分站</a>
                                </li>
                            </ul>
                        </div>
                </td>
                <td width="21%" align="right">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>编制状态：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                在编<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">在编</a>
                                </li>
                                <li><a href="#">非编</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
                <td width="21%" align="right">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>年龄段：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                20岁-30岁<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">20岁-30岁</a>
                                </li>
                                <li><a href="#">30岁-40岁</a>
                                </li>
                                <li><a href="#">40岁-50岁</a>
                                </li>
                                <li><a href="#">50岁-60岁</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
                <td rowspan="2" align="center">
                    <button class="btn btn-success">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索
                    </button>
                </td>
            </tr>

            <tr>
                <td align="center">
                    <div class="form-group form-group-sm">
                        <label for="exampleInputName2">职务：</label> <input type="text"
                                                                          class="form-control width_input" id="exampleInputName2"
                                                                          placeholder="主任">
                    </div>
                </td>
                <td align="center">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>所属部门：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                人事科<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">人事科</a>
                                </li>
                                <li><a href="#">后勤总务</a>
                                </li>
                                <li><a href="#">车管科</a>
                                </li>
                                <li><a href="#">通讯调度科</a>
                                </li>
                                <li><a href="#">财务科</a>
                                </li>
                                <li><a href="#">办公室</a>
                                </li>
                                <li><a href="#">普通转运科</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
                <td align="right">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>学历：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                大专<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">大专</a>
                                </li>
                                <li><a href="#">本科</a>
                                </li>
                                <li><a href="#">硕士</a>
                                </li>
                                <li><a href="#">博士</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
                <td align="right">
                    <div class="form-group form-group-sm">
                        <div class="dropdown">
                            <label>在职状态：</label>
                            <button type="button"
                                    class="btn btn-default dropdown-toggle  btn-sm width_input"
                                    id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                在职<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">在职</a>
                                </li>
                                <li><a href="#">不在职</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>


<!-- 表格 -->
<div id="content_form">
    <div class="title">
        <table width="98%" border="0" cellspacing="0" cellpadding="1">
            <tr>
                <td width="10"></td>
                <td width="18"><img src="images/Title_list.png"/>
                </td>
                <td align="left">人员列表</td>
            </tr>
        </table>
    </div>
    <div>
        <div class="content_choice">
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_add.png">&nbsp;&nbsp;添加
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_edit.png">&nbsp;&nbsp;编辑
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_details.png">&nbsp;&nbsp;详情
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_wage.png">&nbsp;&nbsp;工资管理
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_quit.png">&nbsp;&nbsp;离职
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_vacation.png">&nbsp;&nbsp;休假
            </button>
            <button type="button" class="btn btn-default btn-sm">
                <img src="<%=basePath%>images/img_retired.png">&nbsp;&nbsp;退休
            </button>
        </div>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="1"
           class="table table-bordered table-hover tab substrtab">
        <tr class="warning">
            <td width="3%" height="24">&nbsp;</td>
            <td width="3%">&nbsp;</td>
            <td width="7%">姓名</td>
            <td width="11%">帐号</td>
            <td width="7%">工号</td>
            <td width="7%">考勤号</td>
            <td width="7%" align="center">性别</td>
            <td width="7%">所属部门</td>
            <td width="7%">工作分站&nbsp;</td>
            <td width="7%">职务</td>
            <td width="7%">岗位</td>
            <td width="7%">编制状态</td>
            <td width="7%">学历</td>
            <td width="11%">分配角色</td>
        </tr>
        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>1</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/man.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>
        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>2</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/man.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>

        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>3</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/man.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>

        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>4</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/woman.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>

        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>5</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/man.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>

        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>6</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/woman.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>
        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>7</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/woman.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>
        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>8</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/man.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>
        <tr>
            <td align="center"><input name="" type="checkbox" value=""/>
            </td>
            <td>9</td>
            <td>平建国</td>
            <td>pingjianguo</td>
            <td>310001</td>
            <td>310001</td>
            <td align="center"><img src="<%=basePath%>images/woman.png">
            </td>
            <td>通讯调度科</td>
            <td>庙行</td>
            <td>科长</td>
            <td>通讯调度科</td>
            <td>在编</td>
            <td>本科</td>
            <td>分配角色</td>
        </tr>
    </table>
</div>

</body>
</html>