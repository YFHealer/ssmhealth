<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0039)http://usdizhi.com/adminMember/top.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.body {
	float: left;
	width: 100%;
	font-family: 微软雅黑;
	background-color: #FBFBFB;
	color: #333;
	height: 50px;
	line-height: 50px;
}

.logo {
	width: 180px;
	height: 50px;
	font-size: 24px;
	background-color: #367FA9;
	color: #FFF;
	text-align: center;
	float: left;
	text-decoration: none;
}

.wel {
	font-size: 20px;
	margin-left: 20px;
	margin-right: 10px;
}

.other {
	color:#87CEEB;
	font-size: 30px;
	font-family: STXingkai;
}

</style>

</head>
<body>
	<div class="body">
		<a href="#" onclick="logout()" class="logo">健康数据管理</a><span class="wel"></span> 
		
		<span align="center" class="other">欢迎来到个人健康管理平台<span id="timeShow"></span> </span>
	
	 <a target="_parent" href="login.jsp"
			style="margin-left: 20px; color: #333; font-size: 14px;
                text-indent: 0em;">  
     </a>
         <tr>
				<td align="right">
					系统当前时间：
					<font color="red"><%
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
					java.util.Date currentTime = new java.util.Date();//得到当前系统时间
					String strdate = formatter.format(currentTime); //将日期时间格式化
					%>
					<%= strdate%></font>
					<br>
				</td>
			</tr>       
	</div>
	
</body>
</html>