<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辉县市机动车维修站-修改个人信息</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/person.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/new_file.js"></script>

</head>
<body>
<!--header-->
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe>
<!--main-->
<div id="main" style="height: 400px;">
	<div id="message" style="height: 380px;">
    	<div class="p-detail">
        	<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">信息管理</a>>><a href="#">修改个人信息</a></p>
        </div>
        <div id="line"></div>
        <div id="demo">
            <s:form action="user_edit" cssClass="jqtransform" method="post"> 
            	 <s:hidden name="id"></s:hidden>
				 <s:hidden name="password"></s:hidden>
            	 <div><p>用户名：</p><s:textfield name="loginName" disabled="true"/></div>
            	 <div><p>密码：</p><s:textfield name="ppp" value="****" disabled="true"/></div>
            	 <div><p>真实姓名：</p><s:textfield name="name" onblur="isNameNull(this)" /><label
					style="font: bold; color: red; display: none" id="name">真实姓名不能为空</label></div>
				<div><p>联系方式：</p><s:textfield name="phoneNum" onblur="phoneNumNull(this)"/><label
					style="font: bold; color: red; display: none" id="phoneNum">联系方式不能为空</label></div>
				
				<div class="button"><s:submit id="sub" value="提交"></s:submit></div>
					
			</s:form>
	
	
    	</div>
	</div>
</div>
<!--footer-->
<iframe name="control" src="footer.html" scrolling="no" frameborder="0" style="width:100%; height:100px;"></iframe>
</body>
</html>


 --%>
















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<title>辉县市机动车维修站-修改个人信息</title>
<link href="css/choice_file.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen"/>

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<style type="text/css">
body{ margin-top:0; margin-left:0; background-color:#F1F3FA; height:100%; font-family:"微软雅黑";overflow:auto;}
.main{margin:1%; padding:60px 100px; background-color:#FFF; line-height:30px; border:solid 1px #DEE0E0; width:99%; height:600px; margin-top:50px;}
</style>

<script type="text/javascript">
	function isNameNull(name){
		var inputValue = name.value;
		if (inputValue == "") {
			var name = document.getElementById('name');
			name.style.display = "inline";
			var sub = document.getElementById('sub');
			sub.disabled=true;
		} else {
			var name = document.getElementById('name');
			name.style.display = "none";
			var sub = document.getElementById('sub');
			sub.disabled=false;
		}
	}

	function phoneNumNull(phoneNum){
		var inputValue = phoneNum.value;
		if (inputValue == "") {
			var phoneNum = document.getElementById('phoneNum');
			phoneNum.style.display = "inline";
			var sub = document.getElementById('sub');
			sub.disabled=true;
		} else {
			var phoneNum = document.getElementById('phoneNum');
			phoneNum.style.display = "none";
			var sub = document.getElementById('sub');
			sub.disabled=false;
		}
	}
</script>
</head>
<body background="images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息管理&nbsp;>>&nbsp; 修改个人信息</a>
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
       <p style="text-align:left">&nbsp;&nbsp;&nbsp;添加用户</p>
            <div class="col-md-8 col-md-offset-1  col-xs-8 col-xs-offset-1   col-lg-8 col-lg-offset-1 ">
                 <br>

                <s:form class="form-horizontal" action="user_edit">
                	<s:hidden name="id"></s:hidden>
					<s:hidden name="password"></s:hidden>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">用户名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <s:textfield name="loginName"  cssClass="form-control" disabled="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">密码&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <s:textfield name="password" value="****" cssClass="form-control" disabled="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">真实姓名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <s:textfield name="name" cssClass="form-control" onblur="isNameNull(this)" /><label
					       style="font: bold; color: red; display: none" id="name">真实姓名不能为空</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">联系方式&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <s:textfield name="phoneNum"  cssClass="form-control" onblur="phoneNumNull(this)"/><label
					style="font: bold; color: red; display: none" id="phoneNum">联系方式不能为空</label>
                          
                          <input type="submit" style="height:30px; width:80px; text-align:center;" value="提交">
                        </div>
                    </div>
                </s:form>    
            </div>
       </div>      
     </div>
</div> 
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>

