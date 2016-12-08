<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/ceshi.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/new_file.js"></script>
</head>
<body>
<div id="header">
<!--main-->
<div id="container" class="container">
	<div id="container-tit" class="container-tit">
		<ul>
        <li><a href="user_logout" onclick="javascript:if(confirm('确定要注销吗？')) { return true;}else{return false;};">退出登陆</a></li>
        <li><a href="#">使用说明</a></li>
        <li ><a href="#">查询</a></li>
        <li class="select"><a href="#">信息管理</a></li>
	    <li><a href="#">信息录入</a></li>
		</ul>
	</div>
	<div id="container-con" class="container-con">
		<div class="mod" style="display:none">
			<ul>
				<li><a href="#"></a></li>
			</ul>
		</div>
		<div class="mod" style="display:none">
			<ul>
				<li><a href="useintroduce.html">使用说明</a></li>
			</ul>
		</div>
		<div class="mod" style="display:none">
			<ul>
				<li><a href="repairInformation_query?currentPage=1">维护历史</a></li>
				<li><a  href="car_expire?currentPage=1">到期查询</a></li>
			</ul>
		</div>
        <div class="mod" style="display:block">
			<ul>
				<li><a href="user_updatePasswordUI?id=${user.id}">修改密码</a></li>
				<li><a href="user_info?id=${user.id}">查看个人信息</a></li>
				<li><a href="user_list">用户管理</a></li>
				<li><a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=1">车辆信息查询</a></li>
			</ul>
		</div>
        <div class="mod" style="display:none" >
			<ul>
				<li><a href="<%=basePath %>carInformation_put.action">车辆信息录入</a></li>
				<li><a href="<%=basePath %>repairInformation_input.action">维护信息录入</a></li>
			</ul>
		</div>
	</div>
</div>
</div>
</body>
</html>