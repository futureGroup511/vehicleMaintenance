
<!DOCTYPE html>
<html lang="en">
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辉县市机动车维修站-修改车辆信息</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen"/>

<%-- <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/new_file.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/date.format.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/NewCanlendar/tcal.css"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/NewCanlendar/tcal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-2.1.4.js"></script>

<style>
*{margin:0px; padding:0px;}
body{margin:0 auto; font-size:12px; color:#666; font-family:"微软雅黑", Simsun;}
.main {
    padding-top: 50px;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/new_file.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/NewCanlendar/tcal.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/NewCanlendar/tcal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-2.1.4.js"></script>

<script type="text/javascript">
function changeNumer(){
	var input=$("input[name='capacity']");
	var data=Number(input.val());
	input.attr("value",data); 
}
$(function(){
	changeNumer();
	});

//判断输入框的内容不能为空和只填空格
	 	function judgeNotNull(arr){
	 		var inputValue = arr.value.trim();
	 		if(inputValue == null || inputValue == ""){
	 			$(arr).val("");
	 			$(arr).next().show();
	 		}else{
	 			$(arr).next().hide();
	 		}
	 	}
	 	
	 	//车牌号修改相关
	 	 //车牌照号的检测
	 function carNumJudgeNotNullAndQuery(carNumNode){
		 var inputValue = carNumNode.value.trim();
		 var rememberCarNumValue = $("#rememberCarNum").val();
	 		if(inputValue == null || inputValue == ""||inputValue == "豫G"){
	 			$(carNumNode).attr("value", "豫G");
	 			$(carNumNode).next().show();
	 		}else if(inputValue.length != 7){
	 			$(carNumNode).next().show();
	 		}else if(rememberCarNumValue == inputValue){//如果和本次的车牌号相同，则不进行查询
	 			return;
	 		}else{
	 			$(carNumNode).next().hide();
		 		var userParam = {"carNum":inputValue};
		 		$.ajax  //后台车牌号查询
		        (  
		            {  
		                url:'carInformation_queryByCarNum',//先走校验的action  
		                type:'post',  
		                data:userParam,     
		                dataType:'text',
		                success:function(data)  
		                {  
		                	if(data=="true"){
		                		$("#carNum").val("豫G");
		                		$("#carNumQuery").show();
		                		$("#doWithCarNum").hide();
 		                	}
		                }
		            });
	 		}
	 } 

	
		
	 	//车辆类型和容量单位的同步
	 	function sameCapacity(carTypeNode){
	 		
	 		var carTypeValue = $(carTypeNode).find("option:selected").text();
	 		if(carTypeValue == "货运"){
	 			$("#capacityNull").hide();
	 			$("#capacityTon").show();
	 			$("#capacitySit").hide();
	 			$("#trueNumOnly").hide();
	 		}else if(carTypeValue == "客运"){
	 			$("#capacityNull").hide();
	 			$("#capacityTon").hide();
	 			$("#capacitySit").show();
	 			$("#trueNumOnly").hide();
	 		}else{
	 			$("#capacityNull").hide();
	 			$("#capacityTon").hide();
	 			$("#capacitySit").hide();
	 			$("#trueNumOnly").hide();
	 		}
	 	}
	 	//容量的改变
	 	function capacityJudgeNotNull(capacityNotNull){
	 		
	 		var capacityValue = capacityNotNull.value.trim();
	 		if(capacityValue == "" || capacityValue == null){
	 			$("trueNumOnly").hide();
	 			$("#capacityTon").hide();
	 			$("#capacitySit").hide();
	 			$("#capacityNull").show();
	 		}else{
	 			var patternNode = /^[0-9]+([.]{1}[0-9]+){0,1}$/;
              var result = patternNode.test(capacityValue);
              if(result == false){
            	  capacityNotNull.value = "";
            	  $("#capacityTon").hide();
  	 			  $("#capacitySit").hide();
  	 			  $("#capacityNull").hide();
            	  $("#trueNumOnly").show();
              }
	 		}
	 	}
	 //容量得到焦点
	 function capacityFocus(){
		 var carTypeValue = $("#carType").find("option:selected").text();
	 		if(carTypeValue == "货运"){
	 			$("#capacityTon").show();
	 			$("#capacitySit").hide();
	 			$("#capacityNull").hide();
	 			$("#trueNumOnly").hide();
	 		}else if(carTypeValue == "客运"){
	 			$("#capacityTon").hide();
	 			$("#capacitySit").show();
	 			$("#capacityNull").hide();
	 			$("#trueNumOnly").hide();
	 		}else{
	 			$("#capacityTon").hide();
	 			$("#capacitySit").hide();
	 			$("#capacityNull").hide();
	 			$("#trueNumOnly").hide();
	 		}
	 }
	 //手机号码验证
	 function phoneNumBeSure(phoneNode){
		 if(phoneNode.value.trim() == "" || phoneNode.value.trim() == null){
			 $("#phoneNumNotNull").show();
			 $("#phoneNumSize").hide();
		 }else{
				$("#phoneNumNotNull").hide();
	 			$("#phoneNumSize").hide();
		 }
	 }
	 //获得焦点
	 function phoneNumFocus(arr){
		 $("#phoneNumNotNull").hide();
		$("#phoneNumSize").hide();
	 }
	  function afterSubmitAll(confirmNode){
		
		 var carOwner = $("[name=carOwner]").val().trim();
		 var address = $("[name=address]").val().trim();
		 var carNum = $("[name=carNum]").val().trim();
		 var businessNum = $("[name=businessNum]").val().trim();
		 var factoryNum = $("[name=factoryNum]").val().trim();
		 var purchaseDate = $("[name=purchaseDate]").val();
		 var capacity = $("[name=capacity]").val().trim();
		 var engineNum = $("[name=engineNum]").val().trim();
		 var chassisNum = $("[name=chassisNum]").val().trim();
		 var color = $("[name=color]").val().trim();
		 var phoneNum = $("[name=phoneNum]").val().trim();
		 
		 var takeParam = {'carNum':carNum};//ajax发送数据
		 //判断非空和非法
		 if(carOwner == ""||carOwner == null ||
				 factoryNum == ""||factoryNum == null || capacity == "" || capacity == null || engineNum == ""||engineNum == null||
			 	chassisNum == ""|| chassisNum == null ||
				phoneNum == ""|| phoneNum == null||carNum == null|| carNum.trim().length != 7	 	
				 ){
			 
			 alert("请把信息填写完整之后再进行提交！！！")
			 return;
		 }else{
			 $("#carInformationInput").submit();
		 }
	 }
</script>

</head>
<body background="${pageContext.request.contextPath}/images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="<%=basePath %>carInformation_put.action" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">添加车辆信息</a>
            	<!-- <p class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">带*号的为必填项，其他的为选填项</p> -->
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;修改信息&nbsp;>>&nbsp; 修改车辆信息</a>
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
                     <br>
                    <form class="form-horizontal" id="carInformationInput" action="carInformation_updateCarSuccessFuzzy.action?currentPage=${sessionScope.currentPage }" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 col-lg-1 col-md-2 control-label">车辆类型:</label>
                                <div class="col-sm-4">
                                   <select name="carType" onchange="sameCapacity(this)" id="carType" class=" multiple form-control">
									 	<option value="${carType }"  selected="selected">${carType }</option>
										<option value ="货运">货运</option>
								  		<option value ="客运">客运</option>
								  		<option value="未知">未知</option>
									</select>
                                  <!-- <select class=" multiple form-control">
                                      <option>-------------请选择-------------</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                      <option>5</option>
                                   </select> -->
                                </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label" ><span style="color:red;">*</span>
&nbsp;车主&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input  class="form-control" type="text" name="carOwner" value="${carOwner }" onblur="judgeNotNull(this)"/><label style="font:bold;color: red" hidden>请输入内容，不能为空</label>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
&nbsp;档案号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input type="text" class="form-control" id="carFileNum" name="fileNum" value="${fileNum }" readonly="readonly"/>
                            <!-- <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">地址&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                           <!-- <input type="text" class="form-control"> -->
                            <input type="text" class="form-control" name="address" value="${address }"/>
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
车牌号码&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" maxlength="7" type="text" name="carNum" value="${carNum }"  onblur="carNumJudgeNotNullAndQuery(this)" id="carNum"/><label id="doWithCarNum" style="font:bold;color: red"  hidden>请完善车牌信息</label><label id="carNumQuery" style="font:bold;color: red" hidden>信息已存在，勿复录入</label>
                             <input type="hidden" id="rememberCarNum" value="${carNum }"/>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">运营证号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <!-- <input type="text" class="form-control"> -->
                            <input class="form-control" type="text" name="businessNum" value="${businessNum }"/>
                            </div>  
                        </div>   
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
车辆容量&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                          <!--   <input type="text" class="form-control"> -->
                            <input  class="form-control" type="text" name="capacity" value="${capacity }" onblur="capacityJudgeNotNull(this)" onfocus="capacityFocus()"/><label id="capacityTon" hidden>吨</label><label id="capacitySit" hidden>座</label><label id="capacityNull" style="font:bold;color: red" hidden>请输入内容，不能为空</label><label id="trueNumOnly" style="font:bold;color: red" hidden>请重新输入数</label>
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
发动机号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="engineNum" value="${engineNum }" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                          <!--   <input type="text" class="form-control"> -->
                            </div>  
                        </div>                       
                         <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
&nbsp;底盘号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                           <!--  <input type="text" class="form-control"> -->
                            <input class="form-control" type="text" name="chassisNum" value="${chassisNum }" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">外观颜色&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="color" value="${color }"/>
                            <!-- <input type="text" class="form-control"> -->
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
厂牌型号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="factoryNum" value="${factoryNum }" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                          <!--   <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
联系号码&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="phoneNum" value="${phoneNum }" id="phoneNum" onblur="phoneNumBeSure(this)" onfocus="phoneNumFocus(this)"/><label id="phoneNumNotNull" style="font:bold;color: red" hidden>请输入内容，不能为空</label><label id="phoneNumSize" style="font:bold;color: red" hidden>手机号码格式不正确,位数不足<span style="color: black;font-family: monospace;font-size: x-large;">十一</span>位，请重新输入</label>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                        </div>


                         <div class="form-group">
                           <div class="stay-list-left form-group">                
                                <!--  <form> -->
                                     <div class="sea-div" style="margin-left:28px;">
                                        <label class="search-lab col-sm-2 col-lg-1 col-md-2 ">出厂日期</label>
                                      <!--   <input type="text" readonly  id="startDate" class="form-control"/>  -->   
                                      	     <input type="text" name="purchaseDate" class="purchaseDate form-control" value="${purchaseDate }" readonly="readonly"/>
                                        <div class="col-sm-1 col-lg-1 col-md-1 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                                      <!--   <button type="submit" class=" btn btn-primary">提交</button> -->
                                      <input class=" btn btn-primary" id="confirmAllValue" onclick="afterSubmitAll(this)" type="button" value="提交"/>
                                        </div>  
                                        <div class="col-sm-1 col-lg-1 col-md-1">
                                       <!--  <button type="submit" class=" btn btn-primary">重置</button> -->
                                       <input type="hidden" name="status" value="1" />
   										<input type="hidden" name="id" value="${id }" />
   										
                                       <input class=" btn btn-primary" type="reset" value="重置"/>
                                        </div>                                       
                                        </div> 
										
                              <!--   </form> -->
                            </div>
               
                                        
                        </div>
                    </form>    
                </div>
           </div>      
         </div>
    </div>

</div>    
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/stay.js"></script>
</body>
</html>

