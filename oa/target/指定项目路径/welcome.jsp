<%--

  @author yulezhisi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>

    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon"/>
    <script src="<c:url value="/js/jquery-1.9.1.min.js"/>"></script>
    <script src="<c:url value="/layui/layui.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/layui/css/layui.css"/>">

    <script src="<c:url value="/js/my/commons.js"/>"></script>
    <style>
        .container {
            width: 1200px;
            margin: 100px auto;
        }
    </style>
</head>
<body>

<a href="${pageContext.request.contextPath}/test.do">test</a>

<div class="container">


</div>

</body>
</html>
