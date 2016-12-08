<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>辉县市机动车维修站</title>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<script type="text/javascript" src="js/new_file.js"></script>
</head>
<body>
<div id="title">
	<p>辉县市机动车维修站车辆维护管理系统</p>
    
</div>
<div id="header">
<div id="container" class="container">
	<div id="container-tit" class="container-tit">
		<ul>
        <li><a href="user_logout" onclick="javascript:if(confirm('确定要注销吗？')) { return true;}else{return false;};"  target="_blank">注销登录</a></li>
        <li><a href="#" >使用说明</a></li>
        <li><a href="#" >查询</a></li>
        <li><a href="# }" >信息管理</a></li>
	    <li class="select"><a href="#" >信息录入</a></li>
		</ul>
	</div>
	<div id="container-con" class="container-con">
		<div class="mod" style="display:none">
			<ul>
				<li><a href="#" ></a></li>
			</ul>
		</div>
		
		<div class="mod" style="display:none">
			<ul>
				<li><a href="useintroduce.html" target="_parent">使用说明</a></li>
			</ul>
		</div>
		<div class="mod" style="display:none">
			<ul>
				<li><a  href="repairInformation_query?currentPage=1" target="_parent" >维护历史</a></li>
				<li><a  href="car_expire?currentPage=1"  target="_parent">到期查询</a></li>
				<li><a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=1" target="_parent">车辆信息查询</a></li>
			</ul>
		</div>
        <div class="mod" style="display:none">
			<ul>
				<li><a href="user_updatePasswordUI?id=${user.id}" target="_parent" >修改密码</a></li>
				<li><a href="user_info?id=${user.id}" target="_parent">查看个人信息</a></li>
				<s:if test="#session.user.loginName =='admin'" >
					<li><a href="user_list" target="_parent">用户管理</a></li>
				</s:if>
				
			</ul>
		</div>
        <div class="mod" style="display:block">
			<ul>
				<li><a href="<%=basePath %>carInformation_put.action" target="_parent" >车辆信息录入</a></li>
				<li><a href="<%=basePath %>repairInformation_input.action" target="_parent" >维护信息录入</a></li>
			</ul>
		</div>
	</div>
</div>
</div>

</body>
</html>
