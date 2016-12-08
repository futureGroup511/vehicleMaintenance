<%-- 
<head>
<meta charset="utf-8">
<title>辉县市机动车维修站-添加用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/new_file.js"></script>
<script type="text/javascript"
	src="jquery/jquery-1.7.2.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.cl {
	fontsize: 18px;
	margin: 0px;
	padding: 0px;
	color: red;
	display: inline-table;
}
</style>

</head>

<body>
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe>
<div id="main">
	<div id="message">
    	<div class="p-detail">
        	<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">信息管理</a>>><a href="#">用户管理</a></p>
        </div>
        <div id="line">
        	<p>添加用户</p>
        </div>
        <div id="demo">
        	<form class="jqtransform"  action="user_add" onsubmit="return checkReg()" name="frm"
		method="post">
                <div><p>用户名：</p>
                <input type="text" name="loginName" value="${loginName }" onblur="userOrNo(this)" />
				<label style="font: bold; color: red; display: none" id="loginName">用户已存在</label></div>
                
                <div><p>密码：</p>
                	<input type="password" name="password"
					value="${password }" onblur="passwordNull(this)" /><label
					style="font: bold; color: red; display: none" id="password">密码不能为空</label>
                </div>
                <div><p>真实姓名：</p>
                	<input type="text" onblur="nameNull(this)" value="${name }" name="name" />
					<label style="font: bold; color: red; display: none" id="name">真实姓名不能为空</label>
                </div>
                <div><p>联系方式：</p>
		             <input type="text" name="phoneNum" value="${phoneNum}" onblur="phoneNumNull(this)" />
					<label style="font: bold; color: red; display: none" id="phoneNum">联系方式不能为空</label>
                </div>
                <div class="button"><input type="submit" value="提交"></div>
            </form>
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
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"  content="width=device-width,initial-scale=1">

<title>辉县市机动车维修站-添加用户</title>
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

<SCRIPT language="javascript" type="text/javascript">
	function yincang() {
		alert("yincang")
	}
	function checkReg() {

		var loginName = document.frm.loginName.value;
		if (loginName == "") {
			alert("请输入用户名:");
			document.frm.loginName.focus();
			return false;
		}

		var pass1 = document.frm.password.value;
		if (pass1 == "") {
			alert("请输入密码");
			document.frm.password.focus();
			return false;
		}

		var name = document.frm.name.value;
		if (name == "") {
			alert("请输入真实姓名!");
			document.frm.name.focus();
			return false;
		}
		/* if (!isNaN(name)) {
			alert("真实姓名请输入中文!");
			document.frm.name.focus();
			return false;
		} */

		var phoneNum = document.frm.phoneNum.value;
		if (phoneNum == "") {
			alert("请输入联系方式！");
			document.frm.phoneNum.focus();
			return false;
		}
		/* if (isNaN(phoneNum)) {
			alert("手机号码请输入数字！");
			document.frm.phoneNum.focus();
			return false
		}
		if (phoneNum.length < 7) {
			alert("请输入正确的手机号码！");
			document.frm.phoneNum.focus();
			return false
		} */

		var submitStatus = confirm("用户名：" + loginName + 
								   "\n密码：" + pass1+ 
								   "\n真实姓名:" + name + 
								   "\n联系方式：" + phoneNum);
		//alert(document.getElementById('loginName').style.display)
		if (submitStatus == true & document.getElementById('loginName').style.display =='none') {
			return true;
		} else {
			return false;
		}

		return true;
	}

	//车牌照号的检测
	function userOrNo(loginName) {
		var inputValue = loginName.value.trim();
		if (inputValue == null || inputValue == "") {
			alert("请输入用户名");
			document.frm.loginName.focus();
		} else {
			
			var loginName = {
				"loginName" : inputValue
			}
			$.ajax({
				//先走校验的action  
				url : 'user_isornot',
				type : 'post',
				data : loginName,
				dataType : 'text',
				success : function(data) {
					if (data == "true") {
						var loginName = document.getElementById('loginName');
						loginName.style.display = "inline";
						//alert("用户已存在！");
					} else {
						var loginName = document.getElementById('loginName');
						loginName.style.display = "none";
					}

				}

			});
		}
	}

	function passwordNull(password) {
		var inputValue = password.value;
		if (inputValue == "") {
			var password = document.getElementById('password');
			password.style.display = "inline";
		} else {
			var password = document.getElementById('password');
			password.style.display = "none";
		}
	}
	function nameNull(name) {
		var inputValue = name.value;
		if (inputValue == "") {
			var name = document.getElementById('name');
			name.style.display = "inline";
		} else {
			var name = document.getElementById('name');
			name.style.display = "none";
		}
	}
	function phoneNumNull(phoneNum) {
		var inputValue = phoneNum.value;
		if (inputValue == "") {
			var phoneNum = document.getElementById('phoneNum');
			phoneNum.style.display = "inline";
		} else {
			var phoneNum = document.getElementById('phoneNum');
			phoneNum.style.display = "none";
		}
	}
</SCRIPT>
</head>
<body background="images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">添加车辆信息</a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息管理&nbsp;>>&nbsp; 添加用户</a>
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

                <form class="form-horizontal" action="user_add" onsubmit="return checkReg()" name="frm">
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">用户名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" name="loginName"  class="form-control" value="${loginName }" onblur="userOrNo(this)" />
						  <label style="font: bold; color: red; display: none" id="loginName">用户已存在</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">密码&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="password" name="password" class="form-control" value="${password }" onblur="passwordNull(this)" />
                          <label style="font: bold; color: red; display: none" id="password">密码不能为空</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">真实姓名&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" onblur="nameNull(this)"  class="form-control" value="${name }" name="name" />
						  <label style="font: bold; color: red; display: none" id="name">真实姓名不能为空</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">联系方式&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="text" class="form-control" name="phoneNum" value="${phoneNum}" onblur="phoneNumNull(this)" />
						  <label style="font: bold; color: red; display: none" id="phoneNum">联系方式不能为空</label><br>
                          <input type="submit" style="height:30px; width:80px; text-align:center;" value="提交">
                        </div>
                    </div>
                </form>    
            </div>
       </div>      
     </div>
</div> 
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>

