<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0053)http://usdizhi.com/adminUser/DaiLi/YeWuListEmail.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>
<link href="<%=path%>/css/WdatePicker.css" rel="stylesheet"
	type="text/css">
<link href="<%=path%>/css/UserStyle.css" rel="stylesheet"
	type="text/css">
<script src="<%=path%>/js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="<%=path%>/js/shyjs.js" type="text/javascript"></script>
<script>
        $(document).ready(function () {

            $(".btnSelect").click(function () {
                var param = "a=1";
                if ($(".selectStartCreatime").val() != "") {
                    param += "&selectStartCreatime=" + $(".selectStartCreatime").val() + "";
                }
                if ($(".selectEndCreatime").val() != "") {
                    param += "&selectEndCreatime=" + $(".selectEndCreatime").val() + "";
                }
                if ($(".txtCNum").val() != "") {
                    param += "&txtCNum=" + $(".txtCNum").val() + "";
                }
                if ($(".dropIsUsing").val() != "") {
                    param += "&dropIsUsing=" + $(".dropIsUsing").val() + "";
                }
                if (getParam("page") != "") {
                    param += "&page=" + getParam("page") + "";
                }
                var url = "YeWuListEmail.aspx?" + param;
                window.location.href = url;
            });

            $(".btnPiLiang").click(function () {
                var str = "";
                $(".check").each(function () {
                    if ($(this).attr("checked")) {
                        str += $(this).attr("rel") + ",";
                    }
                });
                if (str == "") {
                    alert("请选择要处理的行！");
                    return false;
                } else {
                    window.location.href = "YundanChuliPiLiang.aspx?ids=" + str;
                }
            });

            $(".btnAll").click(function () {
                var param = "a=1";

                if (getParam("page") != "") {
                    param += "&page=" + getParam("page") + "";
                }
                var url = "YeWuListEmail.aspx?" + param;
                window.location.href = url;
            });


            $(".checkAll").click(function () {
                if ($(this).attr("checked")) {
                    $(".check").attr("checked", true);
                } else {
                    $(".check").attr("checked", false);
                }
            }, function () { });
        });
    </script>
</head>
<body>
	<form name="form1" method="post" action="YeWuListEmail.htm" id="form1">
		<div class="path">
			<span class="text">当前位置：业务管理 &gt; 信件业务列表</span>
		</div>
		<div class="right">
			<div class="part">
				<div class="title">信件业务列表</div>
				<div class="select">
					<select name="dropIsUsing" id="dropIsUsing" class="dropIsUsing">
						<option value="">=业务状态=</option>
						<option value="0">待审核</option>
						<option value="2">待扣款</option>
						<option value="1">成功业务</option>
						<option value="-1">失效业务</option>

					</select> 业务编号：<input name="txtCNum" type="text" id="txtCNum"
						class="txtCNum"> 提交时间：<input name="selectStartCreatime"
						type="text" id="selectStartCreatime" class="selectStartCreatime"
						onfocus="WdatePicker({startDate:&#39;%y-%M-%d&#39;,dateFmt:&#39;yyyy-MM-dd&#39;})"
						style="width:80px;">-<input name="selectEndCreatime"
						type="text" id="selectEndCreatime" class="selectEndCreatime"
						onfocus="WdatePicker({startDate:&#39;%y-%M-%d&#39;,dateFmt:&#39;yyyy-MM-dd&#39;})"
						style="width:80px;"> <span class="btnSelect">搜索</span><span
						class="btnAll">全部</span>
				</div>
				<div class="content">
					<table>
						<tbody>
							<tr>
								<th style="width: 40px;">序号</th>
								<th>业务编号</th>
								<th>所属线路</th>
								<th>业务类型</th>
								<th>提交时间</th>
								<th>业务状态</th>
								<th>总费用（元）</th>
								<th>积分抵消</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>1</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=5">411280001</a>
								</td>
								<td>C渠道</td>
								<td>合箱转运</td>
								<td>2014-11-28 15:35:46</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=5">待审核</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=5">取消</a>
								</td>
							</tr>
							<tr>
								<td rowspan="2">2</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=4">411270004</a>
								</td>
								<td>A渠道</td>
								<td>原箱转运</td>
								<td>2014-11-27 14:17:45</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/DaiLi/MoneyRuAdd.aspx">待付款</a>
								</td>
								<td class="money">52.00</td>
								<td class="money">0.00</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=4">详情</a>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="text-align: left;text-indent: 1em;">费用详情：基本资费_A渠道
									运单编号：EM4112700041（基本运费：<b style="color:#FF0000;">52.00</b>；额外运费：<b
									style="color:#FF0000;">0</b>；）；</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=3">411270003</a>
								</td>
								<td>A渠道</td>
								<td>原箱转运</td>
								<td>2014-11-27 14:14:01</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=3">待审核</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=3">取消</a>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=2">411270002</a>
								</td>
								<td>A渠道</td>
								<td>原箱转运</td>
								<td>2014-11-27 14:10:44</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=2">待审核</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=2">取消</a>
								</td>
							</tr>
							<tr>
								<td rowspan="2">5</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=1">411270001</a>
								</td>
								<td>D渠道</td>
								<td>原箱转运</td>
								<td>2014-11-27 13:00:49</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/DaiLi/MoneyRuAdd.aspx">待付款</a>
								</td>
								<td class="money">12.00</td>
								<td class="money">0.00</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=1">详情</a>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="text-align: left;text-indent: 1em;">费用详情：_临时的：<b
									style="color:#FF0000;">0.00</b>； 运单编号：EM4112700011（基本运费：<b
									style="color:#FF0000;">0.00</b>；额外运费：<b style="color:#FF0000;">12</b>；）；</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</form>


</body>
</html>