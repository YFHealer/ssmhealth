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
                    alert("???????????????????????????");
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
			<span class="text">??????????????????????????? &gt; ??????????????????</span>
		</div>
		<div class="right">
			<div class="part">
				<div class="title">??????????????????</div>
				<div class="select">
					<select name="dropIsUsing" id="dropIsUsing" class="dropIsUsing">
						<option value="">=????????????=</option>
						<option value="0">?????????</option>
						<option value="2">?????????</option>
						<option value="1">????????????</option>
						<option value="-1">????????????</option>

					</select> ???????????????<input name="txtCNum" type="text" id="txtCNum"
						class="txtCNum"> ???????????????<input name="selectStartCreatime"
						type="text" id="selectStartCreatime" class="selectStartCreatime"
						onfocus="WdatePicker({startDate:&#39;%y-%M-%d&#39;,dateFmt:&#39;yyyy-MM-dd&#39;})"
						style="width:80px;">-<input name="selectEndCreatime"
						type="text" id="selectEndCreatime" class="selectEndCreatime"
						onfocus="WdatePicker({startDate:&#39;%y-%M-%d&#39;,dateFmt:&#39;yyyy-MM-dd&#39;})"
						style="width:80px;"> <span class="btnSelect">??????</span><span
						class="btnAll">??????</span>
				</div>
				<div class="content">
					<table>
						<tbody>
							<tr>
								<th style="width: 40px;">??????</th>
								<th>????????????</th>
								<th>????????????</th>
								<th>????????????</th>
								<th>????????????</th>
								<th>????????????</th>
								<th>??????????????????</th>
								<th>????????????</th>
								<th>??????</th>
							</tr>
							<tr>
								<td>1</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=5">411280001</a>
								</td>
								<td>C??????</td>
								<td>????????????</td>
								<td>2014-11-28 15:35:46</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=5">?????????</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=5">??????</a>
								</td>
							</tr>
							<tr>
								<td rowspan="2">2</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=4">411270004</a>
								</td>
								<td>A??????</td>
								<td>????????????</td>
								<td>2014-11-27 14:17:45</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/DaiLi/MoneyRuAdd.aspx">?????????</a>
								</td>
								<td class="money">52.00</td>
								<td class="money">0.00</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=4">??????</a>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="text-align: left;text-indent: 1em;">???????????????????????????_A??????
									???????????????EM4112700041??????????????????<b style="color:#FF0000;">52.00</b>??????????????????<b
									style="color:#FF0000;">0</b>?????????</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=3">411270003</a>
								</td>
								<td>A??????</td>
								<td>????????????</td>
								<td>2014-11-27 14:14:01</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=3">?????????</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=3">??????</a>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=2">411270002</a>
								</td>
								<td>A??????</td>
								<td>????????????</td>
								<td>2014-11-27 14:10:44</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuChuliEmail.aspx?ID=2">?????????</a>
								</td>
								<td class="money"></td>
								<td class="money">0.00</td>
								<td><a
									href="http://usdizhi.com/adminUser/DaiLi/YeWuDelEmail.aspx?ID=2">??????</a>
								</td>
							</tr>
							<tr>
								<td rowspan="2">5</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=1">411270001</a>
								</td>
								<td>D??????</td>
								<td>????????????</td>
								<td>2014-11-27 13:00:49</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/DaiLi/MoneyRuAdd.aspx">?????????</a>
								</td>
								<td class="money">12.00</td>
								<td class="money">0.00</td>
								<td><a target="_blank"
									href="http://usdizhi.com/adminUser/sys/BusinessViewEmail.aspx?ID=1">??????</a>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="text-align: left;text-indent: 1em;">???????????????_????????????<b
									style="color:#FF0000;">0.00</b>??? ???????????????EM4112700011??????????????????<b
									style="color:#FF0000;">0.00</b>??????????????????<b style="color:#FF0000;">12</b>?????????</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</form>


</body>
</html>