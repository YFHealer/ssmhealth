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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
            function StringBuffer()
            { 
			   this._strs = new Array; 
			} 
			StringBuffer.prototype.append = function (str) 
			{ 
			   this._strs.push(str); //添加
			} 
			StringBuffer.prototype.pop = function (str) 
			{ 
			   this._strs.pop(str); //删除最后一个
			} 
			StringBuffer.prototype.toString = function()
		    { 
			   return this._strs.join(","); 
			}
            
            function queding()
            {
                 var sb = new StringBuffer(); 
                 
                 var object=document.getElementsByName("user_id");//返回的obeject是数组
				 for(i=0;i<object.length;i++)
				 {
				      if(object[i].checked==true)
					  {
					      sb.append(object[i].value); 
					  }
				 }
				 window.returnValue = sb.toString();
		         window.close();
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<div class="content">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<th width="10%">用户编号</th>
					<th width="10%">姓名</th>
					<th width="10%">性别</th>
					<th width="10%">年龄</th>
					<th width="10%">电话</th>
				<th width="10%">地址</th>
				<th width="10%">血糖（mmHg）</th>
				<th width="10%">血压（mmol/L）</th>
					<th width="10%">加入时间</th>
					<th width="10%">用户名</th>
					<th width="10%">密码</th>
					<th width="10%">操作</th>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${user.xuehao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.name1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.sex}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.age}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.nianji}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.xibie}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.zhunkaozheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.shenfenzheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.ruxueshijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.loginname}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.loginpw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="user_id" value="${user.id}"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
				  <tr>
				    <td>
				      <input type="button" value="确定" style="width: 80px;" onclick="queding()" />
				    </td>
				  </tr>
			</table>
			</div>
	</body>
</html>
