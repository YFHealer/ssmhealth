<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>
<link href="<%=path%>/css/WdatePicker.css" rel="stylesheet"
	type="text/css">
	<link href="<%=path%>/css/UserStyle.css" rel="stylesheet"
		type="text/css">
		<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
		<script src="<%=path%>/js/shyjs.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />		
        <script language="javascript">
           function chengjiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/chengjiDel.action?id="+id;
               }
           }
           
           function chengjiEdit(id)
           {
				window.location.href="<%=path %>/chengjiToEdit.action?id="+id;
           }
           
           function chengjiAdd()
           {
                 var url="<%=path %>/admin/chengji/chengjiAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<div class="content">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5 " class="navtitle">&nbsp;健康数据信息&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">ID</td>
					<td width="10%">疾病类型</td>
					<td width="10%">数值</td>
					<td width="10%">用户名</td>
					<!--   <td width="10%">操作</td> -->
		        </tr>	
				<c:forEach items="${requestScope.chengjiList}" var="chengji">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${chengji.id}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${chengji.kecheng eq 'xueya'}">血压</c:if>
						<c:if test="${chengji.kecheng eq 'xuetang'}">血糖</c:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chengji.chengji}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${chengji.stuName}
					</td>
					<!-- <td bgcolor="#FFFFFF" align="center">
					    <c:if test="${sessionScope.userType==1}">
							<input type="button" value="删除" onclick="chengjiDel(${chengji.id})"/>
							<input type="button" value="修改" onclick="chengjiEdit(${chengji.id})"/>
						</c:if>
					</td>-->
				</tr>
				</c:forEach>
			</table>
			</div>
	</body>
</html>
