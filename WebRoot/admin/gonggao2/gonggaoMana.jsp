<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>
<link href="<%=path%>/css/WdatePicker.css" rel="stylesheet"
	type="text/css">
	<link href="<%=path%>/css/UserStyle.css" rel="stylesheet"
		type="text/css">
		<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
		<script src="<%=path%>/js/shyjs.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />	
        <script language="javascript">
           function gonggaoAdd()
           {
              var url="<%=path %>/admin/gonggao2/gonggaoAdd.jsp";
              window.location.href=url;
           }
           function gonggaoDetail(gonggaoId)
           {
                 var url="<%=path %>/gonggaoDetail2.action?gonggaoId="+gonggaoId;
                 var n="";
                 var w="580px";
                 var h="600px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
       </script>
	</head>
	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<div class="content">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5 " class="navtitle">&nbsp;血压信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<th width="25%">血压类型</th>
					<th width="20%">发布时间</th>
					<th width="20%">其他信息</th>
					<th width="20%">病因及治疗</th>
					<th width="20%">操作</th>
		        </tr>	
				<s:iterator value="#request.gonggaoList" id="gonggao">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 <s:property value="#gonggao.gonggaoTitle"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#gonggao.gonggaoData"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#gonggao.gonggaoOne1 == 'xueya'">血压信息</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a href="#" onclick="gonggaoDetail(<s:property value="#gonggao.gonggaoId"/>)" class="pn-loperator">点击查看</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<c:if test="${sessionScope.userType!=1}">
					<a class="pn-loperator" href="<%=path %>/gonggaoToUpdate2.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>">修改</a>&nbsp;
						<a class="pn-loperator" href="<%=path %>/gonggaoDel2.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>">删除</a>
					</c:if>
					</td>
				</tr>
				</s:iterator>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			    <c:if test="${sessionScope.userType!=1}">
			      <input type="button" value="添加血压信息" style="width: 100px;" onclick="gonggaoAdd()" />
			      </c:if>
			    </td>
			  </tr>
		    </table>
		    </div>
	</body>


