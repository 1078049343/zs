<%--

  @author yulezhisi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>

    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon"/>
    <script src="<c:url value="/js/jquery-1.9.1.min.js"/>"></script>

    <script src="<c:url value="/layui/layui.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/layui/css/layui.css"/>">

    <script src="<c:url value="/js/my/commons.js"/>"></script>

    <style>
        .container {
            width: 1200px;
            margin: 20px auto;
        }
    </style>

</head>
<body>

<%--头部--%>
<div class="layui-layout layui-layout-admin layui-row" id="header">
    <div class="layui-header layui-row">
        <div class="layui-logo"> activiti</div>

        <div class="layui-col-md6 layui-col-lg-offset4">
            <%--导航条--%>
            <ul class="layui-nav layui-layout-body" lay-filter="" id="ul_nav">
                <li class="layui-nav-item layui-this"><a href="<c:url value="/index.jsp"/>">首页</a></li>
                <li class="layui-nav-item"><a href="<c:url value="/tableTemplate.jsp"/>" target="right">选项卡模板</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:">哈哈哈哈</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="">哈哈哈哈</a></dd>
                        <dd><a href="">哈哈哈哈</a></dd>
                        <dd><a href="">哈哈哈哈</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a
                        href="<c:url value="/doc.html?showMenuApi=1&showDes=1&cache=1&cacheApi=1"/>" target="_blank">接口文档</a>
                </li>
            </ul>
        </div>

        <%--个人资料--%>
        <ul class="layui-nav layui-layout-right" style="position: relative;right: 100px;">
            <c:if test="${not empty sessionScope.user}">
                <li class="layui-nav-item">
                    <a href="javascript:"> <img src="<c:url value="/images/favicon.ico"/>" class="layui-nav-img" alt="">
                            ${sessionScope.user.realName}(${sessionScope.user.role.name})
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<c:url value="/"/>">基本资料</a>
                        </dd>
                        <dd>
                            <a href="">安全设置</a>
                        </dd>
                        <dd>
                            <a data-url="https://www.baidu.com" data-id="3" data-title="销售机会"
                               class="site-actTab-active" href="javascript:" data-type="tabAdd">销售机会</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="<c:url value="/user/logout.do"/>">退了</a>
                </li>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <li class="layui-nav-item">
                    <button class="layui-btn layui-btn-checked" onclick="login()">登录</button>
                    <button class="layui-btn layui-btn-primary" onclick="register()">注册</button>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<%--主体--%>
<div class="container">
    <div class="layui-layout  layui-layout-admin">
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <script>
                    var user = '${sessionScope.user}';
                </script>

                <ul class="layui-nav layui-nav-tree" lay-filter="test" id="left_nav_ul">

                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:">activiti</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:" class="menu_three">部署</a>
                                <ol class="layui-nav-child" style="display: none;">
                                    <li>
                                        <a data-url="<c:url value="/flow/deploy.jsp"/>" data-id="3" data-title="部署"
                                           class="site-actTab-active" href="javascript:" data-type="tabAdd">&nbsp;&nbsp;部署</a>
                                    </li>

                                    <li>
                                        <a data-url="<c:url value="/flow/right.jsp"/>" data-id="5" data-title="右边"
                                           class="site-actTab-active" href="javascript:" data-type="tabAdd">&nbsp;&nbsp;右边</a>
                                    </li>

                                </ol>
                            </dd>

                        </dl>
                    </li>

                </ul>

            </div>
        </div>

        <div class="layui-body" style="z-index: 0;overflow: hidden">
            <!-- 内容主体区域 -->
            <div class="layui-tab layui-tab-card" lay-filter="actTab" lay-allowclose="true" id="tab_div">
                <ul class="layui-tab-title" id="ul_tab">
                    <li class="layui-this" lay-id="0">欢迎页</li>
                    <a id="close_tab" href="javascript:" class="layui-btn layui-btn-danger layui-layout-right"
                       style="margin-right:
                    140px;">关闭所有标签页</a>
                </ul>

                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src="<c:url value="/welcome.jsp"/>" scrolling="no" width="100%" height="100%"
                                frameborder="0"></iframe>
                    </div>
                </div>
            </div>
        </div>

        <script>

        </script>

    </div>
</div>

</body>
</html>
