<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.model.DataModel"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<jsp:directive.page import="org.jfree.chart.ChartFactory"/>
<jsp:directive.page import="org.jfree.chart.title.TextTitle"/>
<jsp:directive.page import="java.awt.Font"/>
<jsp:directive.page import="java.io.OutputStream"/>
<jsp:directive.page import="org.jfree.chart.ChartUtilities"/>
<jsp:directive.page import="java.io.FileOutputStream"/>
<jsp:directive.page import="org.jfree.data.category.DefaultCategoryDataset"/>
<jsp:directive.page import="org.jfree.chart.plot.PlotOrientation"/>
<jsp:directive.page import="org.jfree.chart.plot.CategoryPlot"/>
<jsp:directive.page import="org.jfree.chart.axis.CategoryAxis"/>
<jsp:directive.page import="org.jfree.chart.axis.NumberAxis"/>
<jsp:directive.page import="org.jfree.chart.JFreeChart"/>

<%
	String path = request.getContextPath();
    List dataList=(List)request.getAttribute("dataList");
	String zhutuname = (String)request.getAttribute("zhutuname");
    DefaultCategoryDataset categoryDataset=new DefaultCategoryDataset();
    for(int i=0;i<dataList.size();i++)
    {
        DataModel data=(DataModel)dataList.get(i);
        categoryDataset.setValue(data.getCount(),"",data.getNeirong()+"("+data.getCount()+")" );
    }
	
	
	JFreeChart freeChart=ChartFactory.createBarChart(zhutuname, "", "", categoryDataset, PlotOrientation.VERTICAL, false, false, false);
       

    TextTitle title=freeChart.getTitle();
	title.setFont(new Font("宋体", Font.BOLD, 20));
	
	CategoryPlot plot=(CategoryPlot)freeChart.getPlot();
	CategoryAxis categoryAxis=plot.getDomainAxis();//横轴
	categoryAxis.setLabelFont(new Font("宋体", Font.BOLD, 11));
    categoryAxis.setTickLabelFont(new Font("宋体" , Font.BOLD , 11));
	
	NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();
	numberAxis.setLabelFont(new Font("宋体", Font.BOLD, 20));//纵轴
       
	
	
	String tu_mingzi=String.valueOf(new Date().getTime())+".jpg";
    String url = request.getSession().getServletContext().getRealPath("tutu")+"\\"+tu_mingzi;
	
	OutputStream os=new FileOutputStream(url);
	ChartUtilities.writeChartAsJPEG(os, freeChart, 900, 700);
	os.close();
	
	String url11="/healthdatamana/tutu/"+tu_mingzi;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
      <img src="<%=url11 %>" width="1050" height="580" border="0" />
  </body>
</html>
