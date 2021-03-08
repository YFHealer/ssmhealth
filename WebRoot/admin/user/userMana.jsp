<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.dao.TUserDAO"%>
<%@ page isELIgnored="false"%>
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
           function userDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/userDel.action?id="+id;
               }
           }
            function userToEdit(id)
           {
                 var url="<%=path%>/userToEdit.action?id="+id;
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           function userAdd()
           {
                 var url="<%=path%>/admin/user/userReg.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
        //  function Search()
        //   {
         //        var url="<%=path%>/Search.action?id="+id;
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
			//	 window.location.href=url;
          // }
           function Search()
		    {
		        if(document.form1.key.value=="")
		        {
		            alert("请输入查询条件，例如：用户编号,姓名等");
		            return false;
		        }
		       
		        document.form1.submit();
		    }
       </script>
</head>

<body leftmargin="2" topmargin="2" background='<%=path%>/img/allbg.gif'>
   <form action="<%=path %>/SearchMana.action" name="form1" method="post">
                 请输入查询条件：<input type="text" name="key"> 
        <!-- <input type="submit"  class="btn btn-success"  onclick="userAdd()" value="查询用户"> -->
        <input type="button"  value="查询" onclick="Search()" />
				
  </form> 
    
		
	<div class="content">
		<table width="98%" border="0" cellpadding="2" cellspacing="1"
			align="center" style="margin-top:8px">
			<tr>
				<td height="14" colspan="12 " class="navtitle">&nbsp;用户档案信息管理&nbsp;</td>
			</tr>
			<tr align="center" height="22">
				<th width="5%">用户编号</th>
				<th width="5%">姓名</th>
				<th width="5%">性别</th>
				<th width="5%">年龄</th>
				<th width="10%">电话</th>
				<th width="10%">地址</th>
				<th width="10%">血糖（mmHg）</th>
				<th width="10%">血压（mmol/L）</th>
				<th width="10%">添加时间</th>
				<th width="10%">用户名</th>
				<th width="10%">密码</th>
				<th width="10%">操作</th>
			</tr>
			<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">${user.xuehao}</td>
					<td bgcolor="#FFFFFF" align="center">${user.name1}</td>
					<td bgcolor="#FFFFFF" align="center">${user.sex}</td>
					<td bgcolor="#FFFFFF" align="center">${user.age}</td>
					
					<td bgcolor="#FFFFFF" align="center">${user.nianji}</td>
					<td bgcolor="#FFFFFF" align="center">${user.xibie}</td>
					<td bgcolor="#FFFFFF" align="center">${user.zhunkaozheng}</td>
					<td bgcolor="#FFFFFF" align="center">${user.shenfenzheng}</td>

					<td bgcolor="#FFFFFF" align="center">${user.ruxueshijian}</td>
					<td bgcolor="#FFFFFF" align="center">${user.loginname}</td>
					<td bgcolor="#FFFFFF" align="center">${user.loginpw}</td>
					<td bgcolor="#FFFFFF" align="center">
					<input type="button" value="修改" onclick="userToEdit(${user.id})" />&nbsp; 
				    <input type="button" value="删除" onclick="userDel(${user.id})" /></td>
						
				</tr>
			</c:forEach>
		</table>
	</div>
	<table width='98%' border='0' style="margin-top:8px;margin-left: 5px;">
		<tr>
			<td><input type="button" value="添加" style="width: 80px;"
				onclick="userAdd()" /></td>
		</tr>
		
	</table>
	
</body>
</html>
