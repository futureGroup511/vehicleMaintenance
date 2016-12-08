<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body>
	<a href="<%=basePath %>carInformation_put" >车辆信息录入</a>
	<a href="<%=basePath %>repairInformation_input">维护信息录入</a>
	<a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=1">车辆信息查询</a>
	
</body>
</html> --%>

<%-- <%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.sendRedirect(request.getContextPath() + "/user_loginUI.action");
%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.sendRedirect(request.getContextPath() + "/user_index.action");
%>

