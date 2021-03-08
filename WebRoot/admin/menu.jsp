<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
<style>
body {
	font-family: 微软雅黑;
	background-color: #F4F4F4;
	padding: 0px;
	margin: 0px;
}

a {
	cursor: pointer;
	color: #FF6600;
	text-decoration: none;
}

a:hover {
	color: #333;
	text-decoration: underline;
}

.line {
	width: 220px;
	float: left;
	height: 2px;
	background-image: url('../images/line.jpg');
	background-repeat: repeat-x;
}

.part {
	width: 220px;
	float: left;
}

.part .title {
	width: 220px;
	height: 44px;
	line-height: 44px;
	font-size: 15px;
	text-indent: 38px;
	background-image: url('../images/part.jpg');
	cursor: pointer;
}

.part .title span {
	width: 220px;
	height: 44px;
	float: left;
}

.part .title0 span {
	background: url('../images/hico0.png') 15px center no-repeat;
}

.part .title1 span {
	background: url('../images/hico1.png') 15px center no-repeat;
}

.part .title2 span {
	background: url('../images/hico2.png') 15px center no-repeat;
}

.part .title3 span {
	background: url('../images/hico3.png') 15px center no-repeat;
}

.part .title4 span {
	background: url('../images/hico4.png') 15px center no-repeat;
}

.part .title5 span {
	background: url('../images/hico5.png') 15px center no-repeat;
}

.part .title6 span {
	background: url('../images/hico4.png') 15px center no-repeat;
}

.part .title7 span {
	background: url(../images/hico4.png) 15px center no-repeat;
}

.part .title.index {
	background-image: url(../images/partIndex.jpg);
}

.part .title.hover {
	background-image: url(../images/partHover.jpg);
}

.part .hang {
	width: 220px;
	height: 32px;
	line-height: 32px;
	font-size: 13px;
	text-indent: 46px;
	background-image: url(../images/hang.jpg);
}

.part .hang a {
	color: #777777;
}

.part .hang a:hover {
	color: #FF6600;
}

.part .hang a.hover {
	color: #FF6600;
}
</style>
<script>
	$(document).ready(function() {
		$(".content").hide();
		$(".title").click(function() {
			if ($(this).attr("rel") == "0") {
				$(this).parent(".part").find(".content").show();
				$(this).attr("rel", "1");
				$(this).addClass("hover");
			} else {
				$(this).parent(".part").find(".content").hide();
				$(this).attr("rel", "0");
				$(this).removeClass("hover");
			}
		});
		$("a").click(function() {
			$("a.hover").removeClass("hover");
			$(this).addClass("hover");
		});
	});
	
	
	function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path%>/login.jsp";
		    }
		}
</script>
</head>
<body>
	<c:if test="${sessionScope.userType==0}">
		
		<div class="line"></div>
		<div class="part">
			<div class="title title1" rel="0">
				<span>管理员模块</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/adminManage.action" target="mainFrame">基本信息管理</a>
				</div>
				<div class="hang">
					<a href="<%=path%>/admin/admin/adminAdd.jsp" target="mainFrame">添加账户</a>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title2" rel="0">
				<span>用户模块</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/userMana.action" target="mainFrame">档案信息管理</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/chengjiMana.action?stuId=${sessionScope.user.id}" target="mainFrame">健康数据管理</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/data_zhutu1.action" target="mainFrame">血压区域分析</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/data_zhutu_xuetang1.action" target="mainFrame">血糖区域分析</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/listJiangli.action" target="mainFrame">病史管理</a>
				</div>
				
				<!--  <div class="hang">
					<a href="<%=path %>/listJiangli1.action?stuId=${sessionScope.user.id}" target="mainFrame">过往病史</a>
				</div>-->
			</div>
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title3" rel="0">
				<span>疾病管理</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/gonggaoMana2.action" target="mainFrame">糖尿病管理</a>
				</div>
				<div class="hang">
					<a href="<%=path%>/admin/gonggao1/gonggaoAdd.jsp"
					target="mainFrame">糖尿病录入</a>
				</div>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/gonggaoMana4.action" target="mainFrame">血压管理</a>
				</div>
				<div class="hang">
					<a href="<%=path%>/admin/gonggao2/gonggaoAdd.jsp"
						target="mainFrame">数据录入</a>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title5" rel="0">
				<span>健康小常识</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/gonggaoMana.action" target="mainFrame">健康知识管理</a>
				</div>
				<div class="hang">
					<a href="<%=path%>/admin/gonggao/gonggaoAdd.jsp"
						target="mainFrame">健康信息录入</a>
				</div>
			</div>
		</div>
		<div class="part">
			<div class="title title0 index">
				<span><a href="<%=path%>/admin/index/userinfo.jsp" target="mainFrame">修改密码</a>
				</span>
			</div>
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title6" rel="0">
				<a href="#" onclick="logout()"><span>安全退出</span>
				</a>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.userType==1}">
		<div class="part">
			<div class="title title3" rel="0">
				<span>健康数据管理</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path %>/chengjiMana1.action?stuId=${sessionScope.user.id}" target="mainFrame">数据记录</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/data_zhutu.action?stuId=${sessionScope.user.id}" target="mainFrame">血压个人分析</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/data_zhutu_xuetang.action?stuId=${sessionScope.user.id}" target="mainFrame">血糖个人分析</a>
				</div>				
			<!--  	<div class="hang">
					<a href="<%=path %>/data_zhutu1.action" target="mainFrame">血压区域分析</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/data_zhutu_xuetang1.action" target="mainFrame">血糖区域分析</a>
				</div>-->
			</div>
		</div>
		<div class="line"></div>
		
		<div class="part">
			<div class="title title3" rel="0">
				<span>健康档案</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path %>/admin/user/userinfo.jsp" target="mainFrame">档案信息</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/listJiangli1.action?stuId=${sessionScope.user.id}" target="mainFrame">病史信息</a>
				</div>
				<div class="hang">
					<a href="<%=path %>/admin/jiangli/jiangli_add.jsp" target="mainFrame">添加病史</a>
				</div>
			</div>
		</div>
				<div class="line"></div>
		<div class="part">
			<div class="title title3" rel="0">
				<span>常见疾病信息</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/gonggaoMana3.action" target="mainFrame">糖尿病</a>
				</div>
				<div class="hang">
					<a href="<%=path%>/gonggaoMana5.action" target="mainFrame">血压</a>
				</div>
			</div>
			
				
			
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title5" rel="0">
				<span>健康信息</span>
			</div>
			<div class="content" style="display: none;">
				<div class="hang">
					<a href="<%=path%>/gonggaoMana1.action" target="mainFrame">健康小常识</a>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="part">
			<div class="title title6" rel="0">
				<a href="<%=path%>/login.jsp" onclick="logout()"><span>安全退出</span>
				</a>
			</div>
		</div>
	</c:if>
	<div class="line"></div>
</body>
</html>