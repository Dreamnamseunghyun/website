<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<% response.setStatus(403); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Error</title>
    <style type="text/css">
        * {
            transition: all 0.6s;
        }

        html {
            height: 100%;
        }

        body{
            font-family: 'Lato', sans-serif;
            color: #888;
            margin: 0;
        }

        #main{
            display: table;
            width: 100%;
            height: 100vh;
            text-align: center;
        }

        .fof{
            display: table-cell;
            vertical-align: middle;
        }

        .fof h1{
            font-size: 100px;
            display: inline-block;
            padding-right: 12px;
            animation: type .5s alternate infinite;
        }

        img {
            width: 220px;
            position: absolute;
        }
        @keyframes type{
            from{box-shadow: inset -3px 0px 0px #888;}
            to{box-shadow: inset -3px 0px 0px transparent;}
        }
    </style>
</head>

<body>
<div id="main">
    <div class="fof">
        <img src="<c:url value="/img/logo.png"/>" alt="logo" data-src="<c:url value="/img/logo.png"/>"
             data-src-retina="<c:url value="/img/logo_2x.png"/>">
        <h1>Error 403 Forbidden</h1>
<%--        <pre style="font-size: 15px;">--%>
<%--           Message : <%=request.getAttribute("javax.servlet.error.exception")%>--%>
<%--        </pre>--%>
        <p><spring:message code='fail.common.msg'/></p>
    </div>
</div>


</body>
</html>
