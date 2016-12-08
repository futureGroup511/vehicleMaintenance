<!DOCTYPE html>
<html lang="en">
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辉县市机动车维修站-车辆信息录入</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen"/>
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
$(function(){
	$("hidden").hide();
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
	 //车牌照号的检测
	 function carNumJudgeNotNullAndQuery(carNumNode){
		 var inputValue = carNumNode.value.trim();
	 		if(inputValue == null || inputValue == ""||inputValue == "豫G"){
	 			$(carNumNode).attr("value", "豫G");
	 			$(carNumNode).next().show();
	 		}else if(inputValue.length != 7){
	 			$(carNumNode).next().show();
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
	 //车牌照得到焦点
	 function carNumFocus(attr){
		 
		 var carNumValue = attr.value.trim();
			if(carNumValue == null || carNumValue.length <= 2 || carNumValue == ""){
				$("#carNum").val("豫G");
				$("#carNumQuery").hide();
        		$("#doWithCarNum").hide();
			}else{
				$("#carNumQuery").hide();
        		$("#doWithCarNum").hide();
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
		 arr.value = "";
		 $("#phoneNumNotNull").hide();
		$("#phoneNumSize").hide();
	 }
	  function afterSubmitAll(confirmNode){
		 var carTypeValue = $("#carType").find("option:selected").text();  
		 var carOwner = $("[name=carOwner]").val().trim();
		 var address = $("[name=address]").val().trim();
		 var carNum = $("[name=carNum]").val().trim();
		 var carFileNum = $("[name=fileNum]").val().trim();
		 var businessNum = $("[name=businessNum]").val().trim();
		 var factoryNum = $("[name=factoryNum]").val().trim();
		 var purchaseDate = $("[name=purchaseDate]").val();
		 var capacity = $("[name=capacity]").val().trim();
		 var engineNum = $("[name=engineNum]").val().trim();
		 var chassisNum = $("[name=chassisNum]").val().trim();
		 var color = $("[name=color]").val().trim();
		 var phoneNum = $("[name=phoneNum]").val().trim();
		 
		// var takeParam = {'carNum':carNum};
		 //判断非空和非法
		 if(carOwner == ""||carOwner == null || carNum == ""||carNum == null || carNum == "豫G"||
				 factoryNum == ""||factoryNum == null || capacity == "" || capacity == null || engineNum == ""||engineNum == null||
			 	chassisNum == ""|| chassisNum == null ||
				phoneNum == ""|| phoneNum == null			 	
				 ){
			 
			 alert("请把信息填写完整之后再进行提交！！！")
			 return;
		 }else{
			 if(purchaseDate == "==请选择=="){
				 $("[name=purchaseDate]").val("");
			 }
			var submitStatus = confirm("确定提交您所填的这些信息   \n车辆类型："+carTypeValue+"\n车主："+carOwner+"\n地址："+address+"\n车牌号："+carNum+"\n档案号："+carFileNum
			+"\n营运证号："+businessNum+"\n厂牌型号："+factoryNum+"\n出厂日期："+purchaseDate+"\n容量："+capacity+"\n发动机型号："+engineNum+"\n底盘号："+chassisNum
			+"\n颜色："+color+"\n联系方式："+phoneNum);
			
				if(submitStatus == true){
					//提交表单
					$("#carInformationInput").submit();
				}else{
					$("input").val();
					//什么也不做
					/* var carFile = {'carFileNum':carFileNum};
					//发送ajax请求，删除这个对象
					$.ajax  //后台车牌号查询
					  (  
						 {  
							 url:'carInformation_deleteCarInformation',//发送删除请求 
							 type:'post',  
							 data:carFile,     
							 dataType:'json',
							 success:function(){}//不做任何动作
					 }); */
				}
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
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
            	<!-- <p class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">带*号的为必填项，其他的为选填项</p> -->
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息录入&nbsp;>>&nbsp; 车辆信息录入</a>
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
                    <form class="form-horizontal"  id="carInformationInput" action="carInformation_saveCarInformation" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 col-lg-1 col-md-2 control-label">车辆类型:</label>
                                <div class="col-sm-4">
                                   <select name="carType" onchange="sameCapacity(this)" id="carType" class=" multiple form-control">
									 	<option value=""  selected="selected">请选择</option>
										<option value ="货运">货运</option>
								  		<option value ="客运">客运</option>
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
                            <input  class="form-control" type="text" name="carOwner" value="" onblur="judgeNotNull(this)"/><label style="font:bold;color: red" hidden>请输入内容，不能为空</label>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
&nbsp;档案号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input type="text" class="form-control" id="carFileNum" name="fileNum" value="${showNextFileNum }" readonly="readonly"/>
                            <!-- <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">地址&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                           <!-- <input type="text" class="form-control"> -->
                            <input type="text" class="form-control" name="address" value=""/>
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
车牌号码&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" maxlength="7" type="text" name="carNum" value="豫G" onfocus="carNumFocus(this)"  onblur="carNumJudgeNotNullAndQuery(this)" id="carNum"/><label id="doWithCarNum" style="font:bold;color: red"  hidden>请完善车牌信息</label><label id="carNumQuery" style="font:bold;color: red" hidden>信息已存在，勿复录入</label>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">运营证号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <!-- <input type="text" class="form-control"> -->
                            <input class="form-control" type="text" name="businessNum" value=""/>
                            </div>  
                        </div>   
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
车辆容量&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                          <!--   <input type="text" class="form-control"> -->
                            <input  class="form-control" type="text" name="capacity" value="" onblur="capacityJudgeNotNull(this)" onfocus="capacityFocus()"/><label id="capacityTon" hidden>吨</label><label id="capacitySit" hidden>座</label><label id="capacityNull" style="font:bold;color: red" hidden>请输入内容，不能为空</label><label id="trueNumOnly" style="font:bold;color: red" hidden>请重新输入数</label>
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
发动机号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="engineNum" value="" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                          <!--   <input type="text" class="form-control"> -->
                            </div>  
                        </div>                       
                         <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
&nbsp;底盘号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                           <!--  <input type="text" class="form-control"> -->
                            <input class="form-control" type="text" name="chassisNum" value="" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label">外观颜色&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="color" value=""/>
                            <!-- <input type="text" class="form-control"> -->
                            </div>  
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
厂牌型号&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="factoryNum" value="" onblur="judgeNotNull(this)"/><label style="font:bold;color: red"  hidden>请输入内容，不能为空</label>
                          <!--   <input type="text" class="form-control"> -->
                            </div>
                            <label for="" class="col-sm-2 col-lg-1 col-md-2 control-label"><span style="color:red;">*</span>
联系号码&nbsp;:</label>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                            <input class="form-control" type="text" name="phoneNum" value="" id="phoneNum" onblur="phoneNumBeSure(this)" onfocus="phoneNumFocus(this)"/><label id="phoneNumNotNull" style="font:bold;color: red" hidden>请输入内容，不能为空</label><label id="phoneNumSize" style="font:bold;color: red" hidden>手机号码格式不正确,位数不足<span style="color: black;font-family: monospace;font-size: x-large;">十一</span>位，请重新输入</label>
                           <!--  <input type="text" class="form-control"> -->
                            </div>
                        </div>


                         <div class="form-group">
                           <div class="stay-list-left form-group">                
                                <!--  <form> -->
                                     <div class="sea-div" style="margin-left:28px;">
                                        <label class="search-lab col-sm-2 col-lg-1 col-md-2 ">出厂日期</label>
                                      <!--   <input type="text" readonly  id="startDate" class="form-control"/>  -->   
                                      	     <input type="text" name="purchaseDate" class="purchaseDate form-control" value="==请选择==" readonly="readonly"/>
                                        <div class="col-sm-1 col-lg-1 col-md-1 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                                      <!--   <button type="submit" class=" btn btn-primary">提交</button> -->
                                      <input class=" btn btn-primary" id="confirmAllValue" onclick="afterSubmitAll(this)" type="button" value="提交"/>
                                        </div>  
                                        <div class="col-sm-1 col-lg-1 col-md-1">
                                       <!--  <button type="submit" class=" btn btn-primary">重置</button> -->
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







