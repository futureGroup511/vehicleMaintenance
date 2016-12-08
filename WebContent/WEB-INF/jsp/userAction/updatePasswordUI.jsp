<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辉县市机动车维修站-修改密码</title>
<link href="css/password.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/new_file.js"></script>
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/password.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function checkReg() {
	var oldPassword = document.frm.oldPassword.value;
	if (oldPassword == "") {
		alert("请输入旧密码:");
		document.frm.oldPassword.focus();
		return false;
	}

	var newPassword = document.frm.newPassword.value;
	if (newPassword == "") {
		alert("请输入新密码");
		document.frm.newPassword.focus();
		return false;
	}
	var newPassword2 = document.frm.newPassword2.value;
	if (newPassword2 == "") {
		alert("请输入新密码");
		document.frm.newPassword2.focus();
		return false;
	}
	return true;
}


	function $(id){
	return typeof id==='string'?document.getElementById(id):id;
}

window.onload=function(){
  // 标签的索引
  var index=0;
  var timer=null;

  var lis=$('container-tit').getElementsByTagName('li'),
      divs=$('container-con').getElementsByTagName('div');

  if(lis.length!=divs.length) return;

  // 遍历所有的页签
  for(var i=0;i<lis.length;i++){
    lis[i].id=i;
    lis[i].onmouseover=function(){
      // 用that这个变量来引用当前滑过的li
      var that=this;
      // 如果存在准备执行的定时器，立刻清除，只有当前停留时间大于100ms时才开始执行
      if(timer){
        clearTimeout(timer);
        timer=null;
      }
      // 延迟0.1秒执行
      timer=window.setTimeout(function(){
        for(var j=0;j<lis.length;j++){
          lis[j].className='';
          divs[j].style.display='none';
        }
        lis[that.id].className='select';
        divs[that.id].style.display='block';
      },100);
    }
  }
}
</script>
</head>
<body>
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe>
<!--main-->
<div id="main">
	<div id="message">
    	<div class="p-detail">
        	<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">信息管理</a>>><a href="#">修改密码</a></p>
        </div>
        <div id="line"></div>
        <div id="demo">
        	<form class="jqtransform" action="user_updatePassword" method="post" name="frm" method="post" onsubmit="return checkReg()">
                <s:hidden name="id"></s:hidden>
                <div><p>旧密码：</p>
                	<input type="password" name="oldPassword" value="${oldPassword }">
                	<font color="red">${passwordMessage }</font>
                </div>
                <div><p>新密码：</p><input type="password" name="newPassword" value="${newPassword }"></div>
                <div><p>确认密码：</p><input type="password" name="newPassword2" value="${newPassword2 }"></div>
                <div class="button"><input type="submit" value="提交" onclick="javascript:if(confirm('确定要修改密码吗？成功之后将跳转登录页面！')) { return true;}else{return false;};"></div>
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

<title>辉县市机动车维修站-修改密码</title>
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



<script type="text/javascript">
function checkReg() {
	var oldPassword = document.frm.oldPassword.value;
	if (oldPassword == "") {
		alert("请输入旧密码:");
		document.frm.oldPassword.focus();
		return false;
	}

	var newPassword = document.frm.newPassword.value;
	if (newPassword == "") {
		alert("请输入新密码");
		document.frm.newPassword.focus();
		return false;
	}
	var newPassword2 = document.frm.newPassword2.value;
	if (newPassword2 == "") {
		alert("请输入新密码");
		document.frm.newPassword2.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body  background="images/dotted.png">
	<div class="navbar navbar-default navbar-fixed-top" id="navbar">
    <!--<div class="navbar-container" id="navbar-container">-->
    <!--<div class="navbar-header">-->
    <div class="row">
        <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
            <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息管理&nbsp;>>&nbsp; 修改密码</a>
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
                <form class="form-horizontal" action="user_updatePassword" method="post" name="frm" method="post" onsubmit="return checkReg()">
                    <s:hidden name="id"></s:hidden>
                    <div class="form-group">
                        	<font color="red">${passwordMessage }</font>
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">旧密码&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="password" class="form-control" name="oldPassword" value="${oldPassword }">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">新密码&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="password" class="form-control" name="newPassword" value="${newPassword }">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">确认密码&nbsp;:</label>
                        <div class="col-sm-7 col-lg-7 col-md-7">
                          <input type="password" class="form-control" name="newPassword2" value="${newPassword2 }">
                          <button type="submit" class=" btn btn-primary" onclick="javascript:if(confirm('确定要修改密码吗？成功之后将跳转登录页面！')) { return true;}else{return false;};">确定</button>
                              </div>
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

