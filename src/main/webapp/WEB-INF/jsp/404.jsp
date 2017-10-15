<%@ page import="java.io.StringWriter" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: zwj55
  Date: 2017/10/5
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="fragment/head.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:choose>
        <c:when test="${exception != null}">
            <div >
                <h2>
                    ERROR:&nbsp;${code}&nbsp;&nbsp;&nbsp;
                </h2>
                <h4>
                    by url:&nbsp;&nbsp; ${url}
                </h4>
            </div>
            <div>
                    <%
                        Exception exception=(Exception)request.getAttribute("exception");
                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter(sw);
                        exception.printStackTrace(pw);
                    %>
                <div style="width: 100%; height: 36px; line-height: 36px; font-size: 14px; font-weight: 600;color: #FFFFFF; background-color: #CCC;">
                    异常类：<sp style="color:red;">

                    <%=exception.getClass().getName() %>

                </sp>
                </div>
                <div>
                    <pre><% out.println(sw); %></pre>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                $(function () {
                    window.location.href = "<%=path%>/main/content";
                });
            </script>
        </c:otherwise>
    </c:choose>
</body>
</html>
