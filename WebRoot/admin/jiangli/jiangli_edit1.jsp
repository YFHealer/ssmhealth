<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
           function check()
           {
              return true;
           }
            function stuAll()
			{
				var strUrl = "<%=path %>/stuAll.action";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    document.getElementById("stuId").value=ret;
			}
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/editJiangli1.action" name="formAdd" method="post">
				     <div class="content">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4 " class="navtitle">&nbsp;病史信息修改&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       病史名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="name" name="name" size="32" value="${requestScope.Jiangli.name}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         病史详情：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="content" name="content" size="32" value="${requestScope.Jiangli.content}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         用户编号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="stuId" name="stuId" size="32" value="${requestScope.Jiangli.stuId}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="shijian" name="shijian" size="32" value="${requestScope.Jiangli.shijian}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="修改" onclick="return check()"/>&nbsp; 
						       <input type="hidden" name="id" value="${Jiangli.id}"/>
						       <input type="hidden" name="stuId" value="${Jiangli.stuId}"/>
						       <input type="reset" value="取消"/>&nbsp;
						    </td>
						</tr>
					 </table>
					 <div class="content">
			</form>
   </body>
</html>
