<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
</title>
    <script language="JavaScript">
        window.self.focus();
    </script>
</head>
<frameset rows="50,*,30" frameborder="0" border="0" framespacing="0" id="Frames">
   <frame src="<%=path %>/admin/top.jsp" name="topFrame" width="100%" scrolling="No" noresize="noresize" id="topFrame">
     <frameset cols="200,10,*" frameborder="no" border="0" framespacing="0" id="myFrame">
        <frame src="<%=path %>/admin/menu.jsp" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame">       
       <frame name="leftframe" scrolling="no"> 
        <frame src="<%=path %>/admin/index/sysPro.jsp" name="mainFrame" scrolling="auto" noresize="noresize" id="mainFrame">
     </frameset>
      <frame name="bottom" noresize="" scrolling="no" src="<%=path %>/admin/bottom.html" class="Noprint"> 
    </frameset>
</frameset>
</html>
  
</html>
