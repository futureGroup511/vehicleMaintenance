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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>辉县市机动车维修站</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/error.css" rel="stylesheet" type="text/css">
</head>

<body>
	<img src="images/bg.jpg" class="img"/>
	<div  id="div1" > 

		<img src="images/6132672_211033002696_2.jpg" border="0" usemap="#Map"/>
		   <map name="Map" id="Map">
		      <area shape="rect" coords="353,103,399,123" href="<%=basePath %>repairInformation_input.action" />
		   </map>
	</div>


</body>
</html>

