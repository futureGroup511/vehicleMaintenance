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
<title>辉县市机动车维修站-维修信息录入</title>
<link href="<%=basePath %>css/research.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath %>js/new_file.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/date.format.js"></script>
<!-- 日历控件的使用 -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/NewCanlendar/tcal.css"></script>
<script type="text/javascript" src="<%=basePath %>resource/NewCanlendar/tcal.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
/* $(function(){
		var nowDate = new Date();
		var realDate = dateFormat(new Date(),'yyyy-mm-dd');
		$("#repairDateInput").val(realDate);
		$("#repairDateInput").attr("disabled", true);
		var nextDate = new Date();
		nextDate.setDate(nextDate.getDate()+120);
		var nextRepairDate = dateFormat(nextDate,'yyyy-mm-dd');
		$("#nextRepairDate").val(nextRepairDate);
		$("#nextRepairDate").attr("disabled", true);
}); */

/* 
//日历控件得到焦点，使其可用
function repairFocus(){
	$("#repairDateInput").attr("disabled", false);
	//$("#nextRepairDate").attr("disabled", true);
} */

/* $(function(){
	
	$("").onblur(function(){
		$("#nextRepairDate").attr("disabled", false);
		var dateValue = $("#repairDateInput").val();
		var repairDate = new Date(dateValue);
		var nextRepairDate = new Date();
		nextRepairDate.setDate(repairDate.getDate()+120);
		var realNextDate = dateFormat(nextRepairDate,'yyyy-mm-dd');
		$("#nextRepairDate").val(realNextDate);
		$("#nextRepairDate").attr("disabled", true);
	});
}); */
$(function(){
	var nowDate = new Date();
	var realDate = dateFormat(new Date(),'yyyy-mm-dd');
	$("#repairDateInput").val(realDate);
	/* var nextDate = new Date();
	nextDate.setDate(nextDate.getDate()+120);
	var nextRepairDate = dateFormat(nextDate,'yyyy-mm-dd');
	$("#nextRepairDate").val(nextRepairDate); */
	
});
/* //加入维修时间可选的控件
function timeValueChange(){
		//if($("#repairDateInput").val() != "==请选择==" ||$("#repairDateInput").val() != "" || $("#repairDateInput").val() != null){
			$("#nextRepairDate").attr("disabled", false);
			var dateValue = $("#repairDateInput").val();
			alert(dateValue);
			var nextRepairDate = new Date(dateValue);
		//	alert(nextRepairDate);
		//	alert(nextRepairDate.getDate());
			nextRepairDate.setDate(nextRepairDate.getDate()+30);
			var realNextDate = dateFormat(nextRepairDate,'yyyy-mm-dd');
			//alert(realNextDate);
			$("#nextRepairDate").val(realNextDate);
			$("#nextRepairDate").attr("disabled", true);
		//}
} */

function afterInputCarNum(arr){
	var carNumValue = arr.value.trim();
	if(carNumValue == ""||carNumValue == null||carNumValue == "豫G"||carNumValue.length != 7){
		$("#carNumNotNullJudge").show();
		
	}else{
		var userParam = {'carNum':carNumValue};
		$.ajax  //后台车牌号查询
        (  
            {  
                url:'carInformation_queryByCarNum',//先走校验的action  
                type:'post',  
                data:userParam,     
                dataType:'text',
                success:function(data)  
                {  
                	if(data=="false"){
	                		$("#carNum").val("");
	                		$("#carNumInputSame").show();
	                		$("#carNumNotNullJudge").hide();
	                	}
                }
            });
	}
}
function carNumGetFocus(){
	$("#carNum").val("");
	$("#carNumInputSame").hide();
	$("#carNumNotNullJudge").hide();
}

//豫G

function carNumPrefix(arr){
	var carValue = arr.value;
	if(carValue == null||carValue == ""){
		$(arr).val("豫G");
	
	}
	
}


//提交按钮的响应
function beforeSubmit(){
	var carNumValue = $("#carNum").val().trim();
	var repairDate = $("#repairDateInput").val();
	var nextTime = $("#nextRepairDate").val();
	var peopleName = $("#peopleName").val();
	if(repairDate == null||repairDate == "" || repairDate == "==请选择=="){
		$("#timeChooseMust").show();
	}
	if(carNumValue == ""||carNumValue == null||carNumValue == "豫G"||carNumValue.length != 7 ){
		$("#carNumNotNullJudge").show();
		$("#carNumInputSame").hide();
		return;
	}else{
		$("#carNumNotNullJudge").hide();
		var statusConfirm = confirm("您确定要添加这些信息吗？\n车牌号："+carNumValue+"\n工作人员："
				+peopleName+"\n维修时间:"+repairDate);
		if(statusConfirm == true){
			$("#repairDateInput").attr("disabled", false);
			$("#nextRepairDate").attr("disabled", false);
			$("#carRepairInformationInput").submit();
		}else{
			return;
		}
	}
}
</script>
</head>
<body>
<!--header-->
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe><!--main-->
<!--main-->
<div id="main">
	<div id="message">
    	<div class="p-detail">
    	<span><a href="<%=basePath %>carInformation_put.action">添加车辆信息</a></span>
        	<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">维护历史</a>>><a href="#">维修信息录入</a></p>
        </div>
        <div id="line"></div>
        <div id="demo">
        	<form class="jqtransform" action="repairInformation_realInput" method="post" id="carRepairInformationInput">
                <div><p>车牌号：</p><input maxlength="7" type="text" id="carNum" name="carNum" onfocus="carNumPrefix(this)" value="豫G" onchange="afterInputCarNum(this)" onfocus="carNumGetFocus()"/><label id="carNumNotNullJudge" style="font:bold;color: red" hidden>请输入内容，不能为空</label><label id="carNumInputSame" style="font:bold;color: red" hidden>未添加此车辆,请<a href="<%=basePath %>carInformation_put.action">添加</a></label></div>
                <div onblur="timeValueChange()"><p>维修时间：</p><input type="text" style="width:200px" class="purchaseDate" id="repairDateInput" onblur="timeValueChange()" onfocus="repairFocus()" name="repairDate" value="==请选择==" /><label id="timeChooseMust" style="font:bold;color: red" hidden>请输入内容，不能为空</label></div>
               <!--  <div><p>下次维修时间：</p><input type="text" id="nextRepairDate" name="nextRepairDate" value=""/></div> -->
                <div class="button"><input type="button" value="提交" onclick="beforeSubmit()"/></div>
                <input type="text" id="peopleName"name="peopleName" value="${sessionScope.user.name }" hidden/>
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
<s:if test="#session.user ==null || #session.user ==''" >
	<% response.sendRedirect(request.getContextPath() + "/user_loginUI.action"); %>	
</s:if>
    
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辉县市机动车维修站-维护信息录入</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen"/>
<%-- 
<link href="<%=basePath %>css/research.css" rel="stylesheet" type="text/css"> --%>
<script type="text/javascript" src="<%=basePath %>js/new_file.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/date.format.js"></script>
<!-- 日历控件的使用 -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>resource/NewCanlendar/tcal.css"></script>
<script type="text/javascript" src="<%=basePath %>resource/NewCanlendar/tcal.js"></script>
<script type="text/javascript">
/* $(function(){
var nowDate = new Date();
var realDate = dateFormat(new Date(),'yyyy-mm-dd');
$("#repairDateInput").val(realDate);
$("#repairDateInput").attr("disabled", true);
var nextDate = new Date();
nextDate.setDate(nextDate.getDate()+120);
var nextRepairDate = dateFormat(nextDate,'yyyy-mm-dd');
$("#nextRepairDate").val(nextRepairDate);
$("#nextRepairDate").attr("disabled", true);
}); */

/* 
//日历控件得到焦点，使其可用
function repairFocus(){
$("#repairDateInput").attr("disabled", false);
//$("#nextRepairDate").attr("disabled", true);
} */

/* $(function(){

$("").onblur(function(){
$("#nextRepairDate").attr("disabled", false);
var dateValue = $("#repairDateInput").val();
var repairDate = new Date(dateValue);
var nextRepairDate = new Date();
nextRepairDate.setDate(repairDate.getDate()+120);
var realNextDate = dateFormat(nextRepairDate,'yyyy-mm-dd');
$("#nextRepairDate").val(realNextDate);
$("#nextRepairDate").attr("disabled", true);
});
}); */
$(function(){
var nowDate = new Date();
var realDate = dateFormat(new Date(),'yyyy-mm-dd');
$("#repairDateInput").val(realDate);
/* var nextDate = new Date();
nextDate.setDate(nextDate.getDate()+120);
var nextRepairDate = dateFormat(nextDate,'yyyy-mm-dd');
$("#nextRepairDate").val(nextRepairDate); */

});
/* //加入维修时间可选的控件
function timeValueChange(){
//if($("#repairDateInput").val() != "==请选择==" ||$("#repairDateInput").val() != "" || $("#repairDateInput").val() != null){
	$("#nextRepairDate").attr("disabled", false);
	var dateValue = $("#repairDateInput").val();
	alert(dateValue);
	var nextRepairDate = new Date(dateValue);
//	alert(nextRepairDate);
//	alert(nextRepairDate.getDate());
	nextRepairDate.setDate(nextRepairDate.getDate()+30);
	var realNextDate = dateFormat(nextRepairDate,'yyyy-mm-dd');
	//alert(realNextDate);
	$("#nextRepairDate").val(realNextDate);
	$("#nextRepairDate").attr("disabled", true);
//}
} */

function afterInputCarNum(arr){
	var carNumValue = arr.value.trim();
	if(carNumValue == ""||carNumValue == null||carNumValue == "豫G"||carNumValue.length != 7){
	$("#carNumNotNullJudge").show();
	return;
	}else{
	var userParam = {'carNum':carNumValue};
	$.ajax  //后台车牌号查询
	(  
	    {  
	        url:'carInformation_queryByCarNum',//先走校验的action  
	        type:'post',  
	        data:userParam,     
	        dataType:'text',
	        success:function(data)  
	        {  
	        	if(data=="false"){
	            		$("#carNum").val("");
	            		$("#carNumInputSame").show();
	            		$("#carNumNotNullJudge").hide();
	            	}
	        }
	    });
	}
}
function carNumGetFocus(arr){
	// $("#carNum").val(""); 
	var carValue = arr.value;
	if(carValue == null||carValue == ""){
		$(arr).val("豫G");
		$("#carNumInputSame").hide();
		$("#carNumNotNullJudge").hide();
	}
}

//豫G

function carNumPrefix(arr){
	var carValue = arr.value;
	if(carValue == null||carValue == ""){
		$(arr).val("豫G");
	}
}


//提交按钮的响应
function beforeSubmit(){
	var carNumValue = $("#carNum").val().trim();
	var repairDate = $("#repairDateInput").val();
	var nextTime = $("#nextRepairDate").val();
	var peopleName = $("#peopleName").val();
	if(repairDate == null||repairDate == "" || repairDate == "==请选择=="){
		$("#timeChooseMust").show();
	}
	if(carNumValue == ""||carNumValue == null||carNumValue == "豫G"||carNumValue.length != 7 ){
		$("#carNumNotNullJudge").show();
		$("#carNumInputSame").hide();
		return;
	}else{
		$("#carNumNotNullJudge").hide();
	var statusConfirm = confirm("您确定要添加这些信息吗？\n车牌号："+carNumValue+"\n工作人员："
			+peopleName+"\n维修时间:"+repairDate);
	if(statusConfirm == true){
		$("#repairDateInput").attr("disabled", false);
		//$("#nextRepairDate").attr("disabled", false);
		$("#carRepairInformationInput").submit();
	}else{
		return;
	}
	}
}
</script>
<style>
*{margin:0px; padding:0px;}
body{margin:0 auto; font-size:12px; color:#666; font-family:"微软雅黑", Simsun;}
.main {
    padding-top: 80px;
	margin-top:50px;
}
</style>
</head>
<body background="images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="<%=basePath %>carInformation_put.action" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">添加车辆信息</a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息录入&nbsp;>>&nbsp; 维护信息录入</a>
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">欢迎　${user.name }　登录本系统!</a>
            </div>
        </div>
    </div>
<div id=top-bar>
    <div id=topbar-inner>
    </div>
</div>
<div class="main">
    <div class="row">
      <div class="container">
           <div class="row" >
                <div class="col-md-12 col-xs-12  col-lg-12 " style="float:left;">
                     <br>
                    <!-- <form class="form-horizontal">  -->
                    <form class="jqtransform form-group" action="repairInformation_realInput" method="post" id="carRepairInformationInput">
                        <div class="form-group">
                        
                            <label class="search-lab  col-sm-1 col-lg-1 col-md-1">车牌号</label>
                           
                            <div>
                            	<input style="width: 20%;" maxlength="7" class="form-control" type="text" id="carNum" name="carNum" value="豫G" onblur="afterInputCarNum(this)" onfocus="carNumGetFocus(this)" />
                            <label id="carNumNotNullJudge" style="font:bold;color: red;margin-left:0%;" hidden>请输入内容，不能为空</p></label>
                            <label id="carNumInputSame" style="font:bold;color: red;margin-left:0%" hidden>未添加此车辆,请<a href="<%=basePath %>carInformation_put.action">添加</a></label>
                            
                            </div>    
                               
                        </div>
                
                        <div class="stay-list-left form-group" style="margin-left: -18px;">                
                            <!-- <form> -->
                                <div class="sea-div">
                                    <label class="search-lab  col-sm-3 col-lg-3 col-md-3 ">维修日期</label>
                                    <!-- <input type="text" readonly  id="startDate" class="form-control"/> -->
                                    <input type="text" style="width:200px" class="purchaseDate" id="repairDateInput" onblur="timeValueChange()" onfocus="repairFocus()" name="repairDate" value="==请选择==" /><label id="timeChooseMust" style="font:bold;color: red" hidden>请输入内容，不能为空</label>
                                </div>                               
                           <!--  </form> -->
                        </div>
                         <div class="form-group"> 
                            <div class="col-sm-1 col-lg-1 col-md-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                            <!-- <button type="submit" class=" btn btn-primary">提交</button> -->
                            <input type="text" id="peopleName" name="peopleName" value="${sessionScope.user.name }" hidden/>
                            <input class=" btn btn-primary" type="button" value="提交" onclick="beforeSubmit()"/>
                            </div>              
                        </div>
                    </form>    
                </div>
           </div>      
         </div>
    </div>

</div>    
</div>


<script type="text/javascript" src="<%=basePath %>js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.ui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/moment.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/stay.js"></script>

</body>
</html>
