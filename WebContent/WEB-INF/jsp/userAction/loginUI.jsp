
<%-- <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>辉县市机动车维修站-用户登录</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/dl.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		</style>
	</head>
	<body>
		<div id="title">
			<p>辉县市机动车维修站车辆维护管理系统</p>
		</div>
			<div class="main">
				<img src="images/banner-1.jpg" height="100%" />
				<div class="main-img-bottom">
				<s:if test="#session.user.id !=null" >
					<%
						response.sendRedirect(request.getContextPath() + "/user_back.action");
					%>
				</s:if>
				<s:else>
					<div class="main-one">
					<h2>用户登录</h2>
					<form action="user_login" method="post">
						<div class="btntext">用户 &nbsp;:<input type="text" name="loginName" value="${loginName }">
							<br>
							　　　　　<font style="color: red;fontsize:12px">${message }</font>
							<br />
						</div>
						<div class="btntext">密码 &nbsp;:<input type="password" value="${password }" name="password">
							<br />
						</div>
						<div class="img">
							<input type="submit" value="登录" name="pw">	
						</div>
					</form>
					
					
				</div>
				</s:else>
	
			
				</div>
			</div>
	</body>
</html>
 --%>























<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>辉县市机动车维修站-用户登录</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">

		
		// 在被嵌套时就刷新上级窗口
		if(window.parent != window){
			window.parent.location.reload(true);
		}
		
		
	</script>
</head>

<body>
<div class="box">
		<div class="login-box">
			<div class="login-content ">
			<s:if test="#session.user.id !=null" >
					<%
						response.sendRedirect(request.getContextPath() + "/user_back.action");
					%>
				</s:if>
				<s:else>
						<div class="login-title text-center">
							<h1>用户登录</h1>
							<font style="color: red;fontsize:12px">${message }</font>
						</div>
			</s:else>
			<div class="form">
			
			
			<form action="user_login" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="input-group">
							<span class="input-group-addon"><img src="images/ren.png"></span>
							<input type="text" id="username" name="loginName" value="${loginName }" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">                                                                              
						<div class="input-group">
							<span class="input-group-addon"><img src="images/she.png"></span>
							<input type="text" id="password" value="${password }" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
						<button type="submit" class="btn btn-group-xs btn-info"> &nbsp;登&nbsp;&nbsp;&nbsp;录&nbsp;</button>
						<button type="submit" class="btn btn-group-xs btn-info">记住密码</button>
				</div>
                
				<div class="form-group">
                    <!--<div class="col-xs-6 link">
						<p class="text-center remove-margin">还没注册?<a href="javascript:void(0)" >注册</a>
						</p>
					</div>-->
					<div class="col-xs-6 link">
						<p class="text-center remove-margin">忘记密码？ <a href="javascript:void(0)" >找回</a>
						</p>
					</div>
					
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html> --%>
















<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>辉县市机动车维修站-用户登录</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">

		
		// 在被嵌套时就刷新上级窗口
		if(window.parent != window){
			window.parent.location.reload(true);
		}
		
		
	</script>
</head>

<body>
<div class="box">
		<div class="login-box">
			<div class="login-content ">
			<div class="login-title text-center">
				<h2>欢迎登录本系统</h2>
			</div>
			
			
			<s:if test="#session.user.id !=null" >
					<%
						response.sendRedirect(request.getContextPath() + "/user_back.action");
					%>
				</s:if>
				<s:else>
						<div class="login-title text-center">
							<!-- <h1>用户登录</h1> -->
							<font style="color: red;fontsize:12px">${message }</font>
						</div>
			</s:else>
			
			
			<div class="form">
			<form action="user_login" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="input-group">
							<span class="input-group-addon"><img src="images/ren.png"></span>
							<input type="text" id="username" name="loginName" value="${loginName }" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">                                                                              
						<div class="input-group">
							<span class="input-group-addon"><img src="images/she.png"></span>
							<input type="password" id="password" value="${password }" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions" style="margin-left:10%;">
						<button type="submit" class="btn btn-group-xs btn-info"> &nbsp;登&nbsp;&nbsp;&nbsp;录&nbsp;</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>


</body>

</html>

