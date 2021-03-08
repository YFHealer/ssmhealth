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
           function FamilyDel(id)
           {
               if(confirm('确认删除!'))
               {
                   window.location.href="<%=path %>/deleteFamily.action?id="+id;
               }
           }
           
           function FamilyEdit(id)
           {
				window.location.href="<%=path %>/toEditFamily.action?id="+id;
           }
           
           function FamilyAdd()
           {
                 var url="<%=path %>/admin/family/family_add.jsp";
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
			<form action="<%=path %>/FamilySearch.action" name="formAdd" method="post">
			<div class="content">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6 " class="navtitle">&nbsp;家庭成员查询&nbsp;</td>
				</tr>
				<tr bgcolor="#E7E7E7">
					<th align="center">
						 :&nbsp;<input name="name="id"" type="text" id="name="id"" class="txtCNum">
					</th>
					<th align="center">
						 名称:&nbsp;<input name="name="name"" type="text" id="name="name"" class="txtCNum">
					</th>
					<th align="center">
						 成员关系:&nbsp;<input name="name="guanxi"" type="text" id="name="guanxi"" class="txtCNum">
					</th>
					<th align="center">
						 年龄:&nbsp;<input name="name="age"" type="text" id="name="age"" class="txtCNum">
					</th>
					<th align="center">
						 工作:&nbsp;<input name="name="work"" type="text" id="name="work"" class="txtCNum">
					</th>
					<th align="center">
						 :&nbsp;<input name="name="content"" type="text" id="name="content"" class="txtCNum">
					</th>
				</tr>
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6">
					<input type="submit" value="搜索" size="80px;"/>&nbsp; 
					</td>
				</tr>
			</table>
			</div>
			</form>
			<div class="content">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5 " class="navtitle">&nbsp;家庭成员管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%"></td>
					<td width="10%">名称</td>
					<td width="10%">成员关系</td>
					<td width="10%">年龄</td>
					<td width="10%">工作</td>
					<td width="10%">详情</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.FamilyList}" var="Family">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					
					<td bgcolor="#FFFFFF" align="center">
						${Family.id }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${Family.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${Family.guanxi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${Family.age}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${Family.work}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${Family.content}
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<input type="button" value="删除" onclick="FamilyDel(${Family.id})"/>
							<input type="button" value="修改" onclick="FamilyEdit(${Family.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="FamilyAdd()" />
			    </td>
			    <td>
			    </td>			    
			  </tr>
		    </table>
	</body>
</html>
