<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
        
        
		<script language="javascript">
		    
		    function check1()
		    {
		        if(document.form1.xuehao.value=="")
		        {
		            alert("请输入用户编号");
		            return false;
		        }
		        if(document.form1.name1.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		        if(document.form1.loginname.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form1.loginpw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        document.form1.submit();
		    }
		    
		    var i=0;
		    function teaSelect()
		    {
		        if(i==0)
		        {
		           document.getElementById("indicator").style.display="block";
		           loginService.teaSelect(callback);
		           i=1;
		        }
		        
		    }
		   
		    function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    DWRUtil.addOptions("tea_id",data,"id","name");
			}
        </script>
	</head>
	<body>
			<form action="<%=path %>/userEdit.action" name="form1" method="post">
				<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
					<tr bgcolor="#E7E7E7">
						<td height="14" colspan="2 " class="navtitle">&nbsp;档案信息修改&nbsp;</td>
					</tr>
					
								<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">用户编号：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="xuehao"  value="${user.xuehao }"/><font
					color="red">*</font></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">姓名：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="name1"  value="${user.name1 }"/><font
					color="red">*</font></td>
			</tr>

			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">血压：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="shenfenzheng"   value="${user.shenfenzheng }"/><font
					color="red">*</font></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">血糖：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="zhunkaozheng"   value="${user.zhunkaozheng }"/><font
					color="red">*</font></td>
			</tr>	
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">地址：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="xibie"  value="${user.xibie }"/><font
					color="red">*</font></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">电话：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="nianji"  value="${user.nianji }"/><font
					color="red">*</font></td>
			</tr>								
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">性别：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="radio" name="sex"
					value="男" checked="checked" />男 &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="sex" value="女" />女</td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">年龄：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="text" name="age"  value="${user.age}"/></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">加入时间：</td>
				<td bgcolor="#FFFFFF">&nbsp;
				 <input name="ruxueshijian"
					class="Wdate" readonly="readonly" type="text"
					onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" />
					</td>
			</tr>
			<tr>
				<td width="20%" height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">用户名：</td>
				<td width="80%" bgcolor="#FFFFFF">&nbsp; <input type="text"
					name="loginname" id="loginname"   value="${user.loginname }"/><font color="red">*</font></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9"
					style="font-size: 11px;">密 码：</td>
				<td bgcolor="#FFFFFF">&nbsp; <input type="password"
					name="loginpw" size="21.5"   value="${user.loginpw }"/><font color="red">*</font></td>
			</tr>
			<tr>
				<td height="30" align="right" bgcolor="#F9F9F9">
					&nbsp;
				</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" name="id" value="${user.id }"/>
					<input type="button" value="确定修改" onclick="check1();"/>
				</td>
			</tr>
				</table>
			</form>
	</body>
</html>
