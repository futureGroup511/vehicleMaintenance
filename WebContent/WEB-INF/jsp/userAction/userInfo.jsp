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
<title>辉县市机动车维修站-查看个人信息</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/person.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/new_file.js"></script>
</head>
<body>
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe>
<!--main-->
<div id="main">
	<div id="message">
    	<div class="p-detail">
        	<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">信息管理</a>>><a href="#">查看个人信息</a></p>
        </div>
        <div id="line"></div>
        <div id="demo">
        	<form class="jqtransform" action="#" method="post">
                <div><p>真实姓名：</p><input type="text" value="${user.name }" disabled="disabled"/></div>
                <div><p>用户名：</p><input type="text"  value="${user.loginName }" disabled="disabled"/></div>
                <div><p>手机号：</p><input type="text"  value="${user.phoneNum }" disabled="disabled"/></div>
            </form>
    	</div>
	</div>
</div>
<!--footer-->
<iframe name="control" src="footer.html" scrolling="no" frameborder="0" style="width:100%; height:100px;"></iframe>
</body>
</html>
 --%>
<%--  
 

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"  content="width=device-width,initial-scale=1">

<title>辉县市机动车维修站-查看个人信息</title>
<link href="css/choice_file.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<style type="text/css">
body{ margin-top:0; margin-left:0; background-color:#F1F3FA; height:100%; font-family:"微软雅黑";overflow:auto;}
.main{margin:1%; padding:60px 100px; background-color:#FFF; line-height:30px; border:solid 1px #DEE0E0; width:99%; height:600px;}
</style>
</head>
<body>


<div id=top-bar>
    <div id=topbar-inner>
    </div>
</div>
        
   
   
   
<div class="main">

<div class="row" style="margin-top:-1%; margin-left:3%;">

  <div class="container">
       <div class="row">
            <div class="col-md-8 col-md-offset-1  col-xs-8 col-xs-offset-1   col-lg-8 col-lg-offset-1 ">
                 <br>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">真实姓名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="管理员" value="${user.name }" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">用户名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="admin" value="${user.loginName } " disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">手机号&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="15737316070" value="${user.phoneNum }" disabled="disabled">
                        </div> 		                             
                    </div>
                </form>                                                    
            </div>
       </div>      
     </div>
</div> 
<script src="js/jquery-2.1.4.js"></script>

</body>
</html> --%>



















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"  content="width=device-width,initial-scale=1">

<title>辉县市机动车维修站-查看个人信息</title>
<link href="css/choice_file.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen"/>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<style type="text/css">
body{ margin-top:0; margin-left:0; background-color:#F1F3FA; height:100%; font-family:"微软雅黑";overflow:auto;}
.main{margin:1%; padding:60px 100px; background-color:#FFF; line-height:30px; border:solid 1px #DEE0E0; width:99%; height:600px; margin-top:50px;}
</style>
</head>
<body>
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
    <!--<div class="navbar-container" id="navbar-container">-->
    <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息管理&nbsp;>>&nbsp; 查看个人信息</a>
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">欢迎　${user.name }　登录本系统!</a>
            </div>
        </div>
    </div>


<div id=top-bar>
    <div id=topbar-inner>
    </div>
</div>



<div class="main">

<div class="row" style="margin-top:-1%; margin-left:3%;">

  <div class="container">
       <div class="row">
            <div class="col-md-8 col-md-offset-1  col-xs-8 col-xs-offset-1   col-lg-8 col-lg-offset-1 ">
                 <br>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">真实姓名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="管理员" value="${user.name }" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">用户名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="admin" value="${user.loginName }" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">手机号&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" placeholder="15737316070" value="${user.phoneNum }" disabled="disabled">
                        </div>
                    </div>
                </form>    
            </div>
       </div>      
     </div>
</div> 
<script src="js/jquery-2.1.4.js"></script>

</body>
</html>

 