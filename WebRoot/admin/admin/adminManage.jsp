<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>
<link href="<%=path%>/css/WdatePicker.css" rel="stylesheet"
	type="text/css">
	<link href="<%=path%>/css/UserStyle.css" rel="stylesheet"
		type="text/css">
		<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
		<script src="<%=path%>/js/shyjs.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />
<script language="javascript">
           function adminDel(userId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/adminDel.action?userId="+userId;
               }
           }
           //修改
           function userToEdit(userId)
           {
                 var url="<%=path%>/userToEdit.action?userId="+userId;
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           //添加
           function adminAdd()
           {
                 var url="<%=path%>/admin/admin/adminAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
</head>

<body leftmargin="2" topmargin="2"
	background='<%=path%>/images/allbg.gif'>
	<div class="content">
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			<tr bgcolor="#E7E7E7">
				<td height="14" colspan="5 " class="navtitle">&nbsp;管理员信息维护&nbsp;</td>
			</tr>
			<tr align="center" bgcolor="#FAFAF1" height="22">
				<th width="20%">ID</th>
				<th width="20%">用户名</th>
				<th width="20%">密码</th>
				<th width="20%">权限</th>
				<th width="20%">操作</th>
			</tr>
			<s:iterator value="#request.adminList" id="admin">
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center"><s:property
							value="#admin.userId" />
					</td>
					<td bgcolor="#FFFFFF" align="center"><s:property
							value="#admin.userName" />
					</td>
					<td bgcolor="#FFFFFF" align="center"><s:property
							value="#admin.userPw" />
					</td>
					<td bgcolor="#FFFFFF" align="center"><s:if
							test="#admin.userType==0">
							<font color="red">管理员</font>
						</s:if> <s:if test="#admin.userType==1">
							<font color="red">用户</font>
						</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<a href="<%=path %>/adminToUpdate1.action?userId=(<s:property value="#admin.userId"/>)"
						class="pn-loperator">修改</a>
					<a href="#" onclick="adminDel(<s:property value="#admin.userId"/>)"
						class="pn-loperator">删除</a>	
					</td>
<!--  	<a class="pn-loperator" href="<%=path %>/gonggaoToUpdate1.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>">修改</a>&nbsp;
	<a class="pn-loperator" href="<%=path %>/gonggaoDel1.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>">删除</a>-->
				</tr>
			</s:iterator>
		</table>
	</div>
	<table width='98%' border='0' style="margin-top:8px;margin-left: 5px;">
		<tr>
			<td><input type="button" value="添加" style="width: 80px;"
				onclick="adminAdd()" />
			</td>
		</tr>
	</table>
</body>
</html>
