<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../utils/tags.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>120急救信息系统</title>
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/treeUtil.js"></script>
    <script type="text/javascript" src="js/util.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <link href="css/mainpage.css" rel="stylesheet" />
    <link href=" js/jquery.dropmenu/css/jquery.dropmenu.css" rel="stylesheet" />
    <script type="text/javascript" src=" js/jquery.dropmenu/js/jquery.dropmenu.js"></script>
    <link href="js/jquery.droplist/css/jquery.droplist.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.droplist/js/jquery.droplist.js"></script>
    <link id="theme_style" rel="stylesheet" type="text/css" href="css/style-${clientTheme}.css" />
    <script type="text/javascript">

        var info='${employeeInfos}';
        var allmenu=null;
        var height = 768;
        var width = 1024;
        var iconBase='images/';
        var dropMenu=null;
        var menuIndex=0;
        var interval=null;
        $(function() {
            initPage();
            initTheme();
            if(info){
                info=JSON.parse(info);
                allmenu=createTree(info.menus);
            }

            dropMenu=$("#menu").dropMenu({menu:allmenu,width:240,shrinkBtn:'min-toggle-btn',onShrink:onShrink});
            createRootDropMenu();
            drop();

            $(window).resize(function(){
                var nheight=$(document).height();
                var nwidth=$(document).width();
                if(nheight>height||nwidth>width){
                    height=nheight;
                    width=nwidth;
                    initPage();
                }
            });

            var tipNum=$(".todo-content ul li").length;
            if(tipNum>0){
                interval= setInterval(toggleTip, 500);
                $("#tip-num").text(tipNum);
                $(".tip-item").click(function(){
                    tipNum--;
                    $("#tip-num").text(tipNum);
                    $(this).parent().remove();
                    if(tipNum==0){
                        clearInterval(interval);
                        $("#tip-img").css({"backgroundImage":"url(images/tixing.png)"});
                        $("#tip-num").text("");
                    }
                });
            }
        });

        function initPage(){
            var body=$("body");
            height=$(document).height();
            width=$(document).width();
            body.css({"width":width,height:height,"min-height":height,"min-width":width});
            var cr= $(".content-root");
            cr.height(cr.parent().height());
        }

        function onShrink(min){
            if(!min){
                $("#menu").parent().width(28);
                $("#mroot").removeClass("scroll-y");
            }else{
                $("#menu").parent().width(240);
                $("#mroot").addClass("scroll-y");
            }
        }

        function drop(){
            $(".m-drop").dropList({toggleActiveClass:'hover-drop-link'});
            $("#themes").dropList({toggleActiveClass:'active'});
            $("#task").dropList({toggleActiveClass:'active',direction:'right'});
        }

        var template=[];
        template.push('<div class="item" index="{index}">');
        template.push('<div class="max-icon"><img src="images/{icon}.png" alt="" width="65" height="65" /></div>');
        template.push('<div class="m-title">{name}</div>');
        template.push('</div>');
        template=template.join(" ");

        function createRootDropMenu(){
            var html='';
            for(var i=0;i<allmenu.length;i++){
                allmenu[i].index=i;
                html+=template.render(allmenu[i]);
            }
            $("#m-drop-item").html(html);
            $("#m-drop-item").find(".item").click(function(){
                menuIndex=$(this).attr("index");
                $("#rootmenu_title").text($(this).children(".m-title").text());
                dropMenu.flash(allmenu[menuIndex].children);
            });
        }

        var defaultTheme='${clientTheme}'||'blue';
        function changeTheme(ths){
            var _this=$(ths);
            var newTheme=_this.attr("theme");
            if(defaultTheme!=newTheme){
                $.post("main!changeTheme.action",{clientTheme:newTheme},function(data){
                    $("#theme_style").attr("href","css/style-"+newTheme+".css");
                    var activeHTML=_this.html();
                    var active=_this.parent().parent().children("a")
                    var oldHTML=active.html();
                    active.html(activeHTML);
                    _this.html(oldHTML);
                    _this.attr("theme",defaultTheme);
                    active.attr("theme",newTheme);
                    defaultTheme=newTheme;
                    setThemeToCookie(defaultTheme);
                    document.getElementById("mainFrame").contentWindow.changeTheme(defaultTheme);
                },"json");
            }
        }

        var themes=[];
        themes['blue']={borderColor:'#0DA2DE',text:'蓝色'};
        themes['red']={borderColor:'#990000',text:'红色'};
        themes['green']={borderColor:'#005021',text:'绿色'};
        themes['violet']={borderColor:'#cc66ff',text:'紫色'};

        function initTheme(){
            $("#themes").children("a").attr("theme",defaultTheme);
            $("#themes").children("a").html('<i class="i-block" style="border-color:'+themes[defaultTheme].borderColor+';"></i>'+themes[defaultTheme].text);
        }

        var cookieName='appliation-theme'+'${sessionScope.username}';
        function setThemeToCookie(theme){
            $.cookie(cookieName, theme, { expires: 365*60*60*24, path: '/' });
        }

        var count=0;
        function toggleTip(){
            count++;
            if(count%2==0){
                $("#tip-img").css({"backgroundImage":"url(images/tixingon.png)"});
            }else{
                $("#tip-img").css({"backgroundImage":"url(images/tixing.png)"});
            }
        }


        /*function goToChat() {
            $("#mainFrame").attr("src","chat.action");
        }*/

    </script>
</head>

<body>
<table id="rootTab" cellspacing="0" border="0">
    <tr>
        <td colspan="2" style="height:50px;">
            <div id="header">
                <div id="logo">
                    <img alt="120急救管理系统" src="images/120logo.png" align="middle">
                </div>

                <div id="min-toggle-btn"></div>

                <div class="m-drop">
                    <a class="drop-link" href="javascript:void(0);">
                        <span id="rootmenu_title">人事科</span>
                        <span class="caret"></span>
                    </a>
                    <div id="m-drop-item" class="m-child"></div>
                </div>

                <a id="home" href=""></a>

                <div style="float:left;line-height:50px;margin-left:20px">
                    <marquee id="bulletin" loop="-1" style="color:white!important;width:600px;overflow:hidden; white-space:normal; height:50px; line-height:50px;" scrollamount=3 onmouseover="this.stop()" onmouseout="this.start()">
                        <%--<s:if test="bulletin==null||bulletin.value==null||bulletin.value==\"\"">没有公告</s:if>
                        <s:else><s:property value="bulletin.value"/></s:else>--%>
                    </marquee>
                </div>
                <div style="float:right; margin-right:20px;">
                    <%--<div id="chat" class="right-chat">
                        <a class="drop-link" href="javascript:void(0);" onclick="goToChat();">
                            <div  id="chat-img" style="display: block; width:100px; height:21px; overflow: hidden; text-align: center;line-height: 21px; margin-top: 16px; margin-left: 14px; "  onMouseOver="this.style.backgroundImage='images/tixingon.png'" onMouseOut="this.style.backgroundImage='images/tixing.png'">
                                您有<span id="chat-num" style="font-weight:600; color:red; ">0</span>个消息
                            </div>
                        </a>
                    </div>--%>

                    <div id="task" class="right-drop">
                        <a class="drop-link" href="javascript:void(0);">
                            <div  id="tip-img" style="display: block; width:23px; height:21px; overflow: hidden; text-align: center;line-height: 21px; margin-top: 16px; margin-left: 14px; "  onMouseOver="this.style.backgroundImage='images/tixingon.png'" onMouseOut="this.style.backgroundImage='images/tixing.png'">
                                <span id="tip-num" style="font-weight:600; color:red; ">0</span>
                            </div>
                        </a>
                        <div class="todo-content">
                            <ul>
                                <%--<s:if test="yearCheck=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="vehicle!findVehicleYearCheckDateList.action" target="mainFrame"><font color="red">车辆即将需要年检</font></a>
                                    </li>
                                </s:if>
                                <s:if test="vehicleRetire=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="vehicle!findVehicleYearRetirementDateList.action" target="mainFrame"><font color="red">车辆即将报废</font> </a>
                                    </li>
                                </s:if>
                                <s:if test="insurance=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="vehicle!findVehicleInsuranceDateList.action" target="mainFrame"><font color="red">车辆保险即将到期</font> </a>
                                    </li>
                                </s:if>
                                <s:if test="medicine=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="medicineStock!findMedicine.action" target="mainFrame"><font color="red">药材即将到期</font> </a>
                                    </li>
                                </s:if>

                                <s:if test="'yes' == flagMap['regularContractExpired']">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="employee!findEmployeecontract.action?pmap['mainPage']=yes" target='mainFrame'>
                                            <font color='red'>
                                                在编人员
                                                <s:iterator value="objMap['regularContract']" status="emp">
                                                    ${name}
                                                    <s:if test="!#emp.last">,</s:if>
                                                </s:iterator>
                                                合同将要到期
                                            </font>
                                        </a>
                                    </li>
                                </s:if>
                                <s:if test="'yes' == flagMap['nonRegularContractExpired']">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="employee!findEmployeecontracts.action?pmap['mainPage']=yes" target='mainFrame'>
                                            <font color='red'>
                                                非编人员
                                                <s:iterator value="objMap['nonRegularContract']" status="emp">
                                                    ${name}
                                                    <s:if test="!#emp.last">,</s:if>
                                                </s:iterator>
                                                合同将要到期
                                            </font>
                                        </a>
                                    </li>
                                </s:if>--%>

                                <%--
                                <s:if test="licenseVerification=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a href="vehicleEmployee!driverFileDirectory.action" target="mainFrame"><font color="red">驾驶证验证时间即将到期</font> </a>
                                    </li>
                                </s:if>

                                <s:if test="driverHandover=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a href="handOver!findDriverHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target="mainFrame"><font color="red">司机交接班有异常</font> </a>
                                    </li>
                                </s:if>

                                <s:if test="stretcherHandover=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a href="handOver!findStretcherHandoverlist.action?sc['qingkuang']=exceptionN&sc['qk']=1" target="mainFrame"><font color="red">担架员交接班有异常</font> </a>
                                    </li>
                                </s:if>
                                --%>
                                <%--<s:if test="deviceHandover=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="deviceHandover.action?sc['qingkuang']=exceptionN&sc['qk']=1" target="mainFrame"><font color="red">交接班有异常</font> </a>
                                    </li>
                                </s:if>

                                <s:if test="checkMail=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <a class="tip-item" href="publish1!findReceiveDoc.action" target="mainFrame"><font color="red">您有${mail}</>封邮件未接收</font> </a>
                                    </li>
                                </s:if>

                                <s:if test="petrolCardAddMoney=='yes'">
                                    <li style="height:20px;margin-left:10px;padding:0px 0px 10px 0px">
                                        <font color="red">油卡已充值，请尽快前往激活</font>
                                    </li>
                                </s:if>--%>
                            </ul>
                        </div>
                    </div>
                    <div id="themes" class="right-drop">
                        <a class="drop-link" theme="blue" href="javascript:void(0);">
                            <i class="i-block" style="border-color: #0DA2DE;"></i>蓝色</a>
                        <div style="display: none; background: #F4F4F4;">
                            <a theme="red" onclick="javascript:changeTheme(this);" href="javascript:void(0);"><i class="i-block" style=" border-color:#FF0000 "></i>红色</a> <a theme="violet" onclick="javascript:changeTheme(this);" href="javascript:void(0);"><i class="i-block" style=" border-color:#cc66ff"></i>紫色</a> <a theme="green" onclick="javascript:changeTheme(this);" href="javascript:void(0);"><i class="i-block" style=" border-color:#005021"></i>绿色</a>
                        </div>
                    </div>

                    <div style="color: #ffffff;float: left;height: 48px;line-height: 50px;text-align: center; width: 60px;">
                        <a href="logout">退出</a>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td class="lefttd" valign="top" align="left" width="30">
            <div id="mroot" class="content-root scroll-y" style="width:240px;">
                <div id="menu"></div>
            </div>
        </td>
        <td valign="top" align="left">
            <div id="content-root" class="content-root">
                <%--<iframe id="mainFrame" name="mainFrame" scrolling="auto" allowtransparency="true" src="jsp/login/welcome_new.jsp" frameborder="0" height="100%" width="100%" marginheight="0" marginwidth="0" style=" overflow:auto;"></iframe>--%>
                <iframe id="mainFrame" name="mainFrame" scrolling="auto" allowtransparency="true" src="main/content" frameborder="0" height="100%" width="100%" marginheight="0" marginwidth="0" style=" overflow:auto;"></iframe>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
