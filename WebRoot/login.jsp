<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<title>健康综合管理平台</title>

<link href="<%=path %>/css/jquery-ui-1.css" rel="Stylesheet" type="text/css">
<link href="<%=path %>/css/pagination.css" rel="Stylesheet" type="text/css">
<link href="<%=path %>/css/fixedheadertable.css" rel="Stylesheet" type="text/css">
<link href="<%=path %>/css/common_002.css" rel="Stylesheet" type="text/css">
<link href="<%=path %>/css/common.css" rel="Stylesheet" type="text/css">
<link href="<%=path %>/css/html_gen.css" rel="Stylesheet" type="text/css">

<script src="<%=path %>/js/jquery-1.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-ui-1.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery_002.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery_005.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-migrate-1.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery_003.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery_004.js" type="text/javascript"></script>
<script src="<%=path %>/js/common.js" type="text/javascript"></script>
<script src="<%=path %>/js/check.js" type="text/javascript"></script>
<script src="<%=path %>/js/String.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script>
<script src="<%=path %>/js/highcharts.js" type="text/javascript"></script>
<script src="<%=path %>/js/exporting.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery.js" type="text/javascript"></script>

 
 <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
 <script type="text/javascript" src="<%=path %>/js/public.js"></script>
<!--[if IE 6]>
<style type="text/css">

img {
	_azimuth: expression(
		this.pngSet?this.pngSet=true:(this.nodeName == "IMG" && this.src.toLowerCase().indexOf('.png')>-1?
			(this.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + this.src + "', sizingMethod='scale')",
			this.src = "resource/images/transparent.gif",this.pngSet=true):this.pngSet=true)
	);	
}

.ui-widget-overlay {  
	position:absolute; /* position fixed for IE6 */
	top:expression(0+((e=document.documentElement.scrollTop)?e:document.body.scrollTop)+'px');  
	left:expression(0+((e=document.documentElement.scrollLeft)?e:document.body.scrollLeft)+'px');  
}  

.ui-layout-pane-center{
	overflow: hidden; /*fix element height bug for layout for IE6 */
}

</style>
<![endif]--><link href="css/common.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">

   function check1()
 {                                                                                         
     if(document.loginForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.loginForm.userName.focus();
		return false;
	 }
	 if(document.loginForm.userPw.value=="")
	 {
	 	alert("请输入密码");
		document.loginForm.userPw.focus();
		return false;
	 }
	 if(document.loginForm.userType.value=="-1")
	 {
	 	alert("请选择登陆身份");
		document.loginForm.userType.focus();
		return false;
	 }
	 document.getElementById("indicator").style.display="block";
	 loginService.login(document.loginForm.userName.value,document.loginForm.userPw.value,document.loginForm.userType.value,callback);
	 
 }
  
 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 
 function Reg()
  {
          var url="<%=path %>/Reg.jsp";
          var n="";
          var w="580px";
          var h="600px";
          var s="resizable:no;help:no;status:no;scroll:yes";
          openWin(url,n,w,h,s);
  }
  
</script>
<style type="text/css">

.loginBox {
	position:absolute;
	background:none;
	left: 190px;
	top:22px;
}

#loginForm .container{
	height:256px;
}
.container {
	position:relative;
	margin:0 auto;
	top:200px;
	height:240px;
	width:480px;
	-webkit-box-shadow: 3px 3px 3px #7C7C7C;
	box-shadow: 3px 3px 3px #7C7C7C;
}

.container .wrapper {
	position:absolute;
	top:-100px;
	width:100%;
	color:white;
	text-shadow:2px 2px 5px #777;
	font-family:'Microsoft Yahei';
}

.container .wrapper img {
	width: 90px;
	height: 90px;
	display: inline-block;
	border: none;
	float: left;
}

.container .wrapper div.textwrapper {
	display:inline-block;
	min-height:64px;
	text-align:left;
	margin-left:20px;
	float: left;
}

</style>
<style id="vakata-stylesheet" type="text/css">#vakata-dragged { display:block; margin:0 0 0 0; padding:4px 4px 4px 24px; position:absolute; top:-2000px; line-height:16px; z-index:10000; } #vakata-contextmenu { display:block; visibility:hidden; left:0; top:-200px; position:absolute; margin:0; padding:0; min-width:180px; background:#ebebeb; border:1px solid silver; z-index:10000; *width:180px; } #vakata-contextmenu ul { min-width:180px; *width:180px; } #vakata-contextmenu ul, #vakata-contextmenu li { margin:0; padding:0; list-style-type:none; display:block; } #vakata-contextmenu li { line-height:20px; min-height:20px; position:relative; padding:0px; } #vakata-contextmenu li a { padding:1px 6px; line-height:17px; display:block; text-decoration:none; margin:1px 1px 0 1px; } #vakata-contextmenu li ins { float:left; width:16px; height:16px; text-decoration:none; margin-right:2px; } #vakata-contextmenu li a:hover, #vakata-contextmenu li.vakata-hover > a { background:gray; color:white; } #vakata-contextmenu li ul { display:none; position:absolute; top:-2px; left:100%; background:#ebebeb; border:1px solid gray; } #vakata-contextmenu .right { right:100%; left:auto; } #vakata-contextmenu .bottom { bottom:-1px; top:auto; } #vakata-contextmenu li.vakata-separator { min-height:0; height:1px; line-height:1px; font-size:1px; overflow:hidden; margin:0 2px; background:silver; /* border-top:1px solid #fefefe; */ padding:0; } </style><style id="jstree-stylesheet" type="text/css">.jstree ul, .jstree li { display:block; margin:0 0 0 0; padding:0 0 0 0; list-style-type:none; } .jstree li { display:block; min-height:18px; line-height:18px; white-space:nowrap; margin-left:18px; min-width:18px; } .jstree-rtl li { margin-left:0; margin-right:18px; } .jstree > ul > li { margin-left:0px; } .jstree-rtl > ul > li { margin-right:0px; } .jstree ins { display:inline-block; text-decoration:none; width:18px; height:18px; margin:0 0 0 0; padding:0; } .jstree a { display:inline-block; line-height:16px; height:16px; color:black; white-space:nowrap; text-decoration:none; padding:1px 2px; margin:0; } .jstree a:focus { outline: none; } .jstree a > ins { height:16px; width:16px; } .jstree a > .jstree-icon { margin-right:3px; } .jstree-rtl a > .jstree-icon { margin-left:3px; margin-right:0; } li.jstree-open > ul { display:block; } li.jstree-closed > ul { display:none; } #vakata-dragged ins { display:block; text-decoration:none; width:16px; height:16px; margin:0 0 0 0; padding:0; position:absolute; top:4px; left:4px;  -moz-border-radius:4px; border-radius:4px; -webkit-border-radius:4px; } #vakata-dragged .jstree-ok { background:green; } #vakata-dragged .jstree-invalid { background:red; } #jstree-marker { padding:0; margin:0; font-size:12px; overflow:hidden; height:12px; width:8px; position:absolute; top:-30px; z-index:10001; background-repeat:no-repeat; display:none; background-color:transparent; text-shadow:1px 1px 1px white; color:black; line-height:10px; } #jstree-marker-line { padding:0; margin:0; line-height:0%; font-size:1px; overflow:hidden; height:1px; width:100px; position:absolute; top:-30px; z-index:10000; background-repeat:no-repeat; display:none; background-color:#456c43;  cursor:pointer; border:1px solid #eeeeee; border-left:0; -moz-box-shadow: 0px 0px 2px #666; -webkit-box-shadow: 0px 0px 2px #666; box-shadow: 0px 0px 2px #666;  -moz-border-radius:1px; border-radius:1px; -webkit-border-radius:1px; }.jstree .jstree-real-checkbox { display:none; } .jstree-themeroller .ui-icon { overflow:visible; } .jstree-themeroller a { padding:0 2px; } .jstree-themeroller .jstree-no-icon { display:none; }.jstree .jstree-wholerow-real { position:relative; z-index:1; } .jstree .jstree-wholerow-real li { cursor:pointer; } .jstree .jstree-wholerow-real a { border-left-color:transparent !important; border-right-color:transparent !important; } .jstree .jstree-wholerow { position:relative; z-index:0; height:0; } .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { width:100%; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li, .jstree .jstree-wholerow a { margin:0 !important; padding:0 !important; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { background:transparent !important; }.jstree .jstree-wholerow ins, .jstree .jstree-wholerow span, .jstree .jstree-wholerow input { display:none !important; }.jstree .jstree-wholerow a, .jstree .jstree-wholerow a:hover { text-indent:-9999px; !important; width:100%; padding:0 !important; border-right-width:0px !important; border-left-width:0px !important; } .jstree .jstree-wholerow-span { position:absolute; left:0; margin:0px; padding:0; height:18px; border-width:0; padding:0; z-index:0; }</style></head>
<body>
<form name="loginForm" id="loginForm" method="POST" action="">
	<div class="container">
		<div class="wrapper">
			
			<div class="textwrapper">
				<div style="font-size:34px;text-shadow:2px 2px 5px #777;">
				&nbsp;&nbsp;&nbsp;&nbsp;健康数据综合管理平台
				</div>
				<!--  -->
				<br>
				<div style="font-size:26px;font-family:arial;text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;Health Data Management System</div>
			</div>
		</div>
		
		<div class="loginBox"><!-- login box-->
	        <div class="loginlabel" style="white-space:nowrap;">
	        	<span style="width:60px;display:inline-block;">用户名:</span>
	        	<input name="userName" class="radius3" tabindex="1" id="userName" style="font-size:18px;width:200px;" type="text">
	        </div>
			<div class="loginlabel" style="white-space:nowrap;margin-top:10px;">
	        	<span style="width:60px;display:inline-block;">密码:</span>
				<input name="userPw" class="radius3" tabindex="2" id="userPw" style="font-size:18px;width:200px;" type="password">
			</div>
			<!-- display:none; -->
			<div class="loginlabel" style="white-space:nowrap;margin-top:10px;">
	        	<span style="width:60px;display:inline-block;">权限:</span>
				<select class="radius3" name="userType" id="userType" style="width:210px;height:25px">
					<option value="-1" selected="selected">请选择登陆身份</option>
					<option value="0">管理员</option>
					<option value="1">用户</option>
				</select>
			</div>

			<!--
			<div style="white-space:nowrap;margin-top:10px;" class="loginlabel">
	        	<span style="width:60px;display:inline-block;">验证码:</span>
				<input name="verifycode" tabindex="2" id="verifycode" style="font-size:18px;width:50px;" type="text">
				<img src="images/verifycode.jpg" onclick="refreshCode(this)" style="cursor: pointer;vertical-align: bottom;">
			</div>
			-->
			
			<div class="lgbtns" style="white-space:nowrap;margin-top:10px;font-size:14px;text-align:center;cursor:pointer;">
				<span id="main_login_button" class="btn btn-sky" onClick="check1()">登录</span>
				<span id="main_login_cancle_button" class="btn btn-boo" onclick="Reg()">注册</span>
				<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
				<div>
					  <p class="error">
			        		</p>
                        <p class="success">
                        	</p>
				</div>
			</div>
	    </div>
	    
	     <span style="position:absolute;bottom:10px;display:block;width:100%;font-family:'Microsoft Yahei'; font-size:14px;text-align:center;color:#fff;">
	        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电气与信息学院&copy;计算机15&nbsp;&nbsp; 联系作者：1540096352@qq.com</label>
	    </span> 
	    
	</div>
</form>
<blockquote>&nbsp;</blockquote>

<div style="display: none;" id="jstree-marker">»</div><div style="display: none;" id="jstree-marker-line"></div><div id="vakata-contextmenu"></div></body></html>