<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 


<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/adminEdit1.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>管理员信息修改</span></td>
					    </tr>
					    
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						           用户名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="userName" size="50" value="${admin.userName}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="userPw" size="50" value="${admin.userPw}"/>
						    </td>
						</tr>
					<!--	<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						        权限：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <select name="userType" id="userType">
						        	<option value="0">管理员</option>
						        	<option value="1">用户</option>
						        </select>
						    </td>
						</tr>
						-->
						<!--  <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          权限：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="userType" size="50" value="${admin.userType}"/>
						    </td>
						</tr>
						-->
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    	<input type="hidden" name="userId" value="${admin.userId}"/>
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						       <input type="button" value="取消" onclick="closeOpen()"/>
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
