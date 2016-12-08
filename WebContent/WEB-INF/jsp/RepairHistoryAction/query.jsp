<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="s"   uri="/struts-tags"%>
<%@ taglib  prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resource/Myjs/jquery-ui.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath }/css/ceshi.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" media="screen"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>


<style>
*{margin:0px; padding:0px;}
body{margin:0 auto; font-size:12px; color:#666; font-family:"微软雅黑", Simsun;}
li{list-style:none;}
img{border:none;}
a, a:visited{text-decoration:none;}

/* .tong{ background:url(../images/images/sy-toubjing_03.gif) repeat-x 0px -11px; width:100%; height:40px;} */
.wrap{ width:auto; max-width:620px; margin:0 auto;}
.center{ width:103%; margin:0 auto;}

/***************分页******************/
.fenye{ float:left; margin-top:-12%; position:relative;}
.fenye ul{ float:left; margin-left:32px; }
.fenye ul li{ float:left; margin-left:5px;padding: 4px 6px; border:1px solid #ccc;  font-weight:bold; cursor:pointer; color:#999;}
.fenye ul li a{ color:#999;}
.fenye ul li.xifenye{ width:60px; text-align:center; float:left; position:relative;cursor: pointer;}
.fenye ul li .xab{ float:left; position:absolute; width:50px; border:1px solid #ccc; height:100px; overflow-y: auto;overflow-x: hidden;top:-125px; background-color: #fff; display:inline;left:-1px; width:50px;}
.fenye ul li .xab ul{ margin-left:0; padding-bottom:0;}
.fenye ul li .xab ul li{ border:0; padding:4px 0px; color:#999; width:34px; margin-left:0px; text-align:center;}
.main{margin-top:50px;}
</style>

<title>辉县市机动车维修站-历史查询</title>
</head>
<body background="${pageContext.request.contextPath }/images/dotted.png">
		 <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;查询&nbsp;>>&nbsp; 维护历史</a>
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">欢迎　${user.name }　登录本系统!</a>
            </div>
        	</div>
	    </div>
		<div id=top-bar>
		    <div id=topbar-inner>
		    </div>
		</div>
			
		<!-- <iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe> -->
		<div id="main">
				<div class="row">
					<div class="container">
						<div class="row">
							<!--这个DIV里面写的是form表单  -->
							<div class="col-md-12 col-xs-12  col-lg-12 " style="float:left;">
                     <br><br><br><br>
                     <!--<form action="repairInformation_conditionQuery" method="POST"    id="condition"   class="jqtransform">
										 <input type="hidden" id="operator"   value="${request.query.query_manname}"><br>
						 <div><p>操作人员:</p>
						 						<select name="query_manname">
													<option selected="selected"  value="">请选择!</option>
													<s:iterator value="#request.users" var="user">
														<option value="${user.id}">${user.name}</option>
													</s:iterator>
												</select></div>
						<div><p>车辆类型:</p>
						 						<select name="query_cartype" >
													<option selected="selected"  value="">请选择!</option>
													<option   value="货运">货运</option>
													<option   value="客运">客运</option>
												</select>
												<input type="hidden" value="${request.query.query_cartype}" id="new_query_cartype">
												</div>
						<div><p>档案号:</p><input type="text" name="query_carfileNum"      value="${request.query.query_carfileNum}"  id="carfileNum"  ></div>
						<div><p>车牌照号:	</p><input type="text" name="query_carcarNum"  value="${request.query.query_carcarNum}" id="autocomplete"></div>
														
						<div><p>起始时间:</p>
									<input type="text" value="${request.query.query_firstdatatime}" id="selectedone" name="firstdatatime">
													<%-- <select name="firstdatatime"   id="selectone">
															<option selected="selected" value="0000-00-00">请选择!</option>
															<s:iterator value="#request.timelist" var="time" >
															<option value="${time}">${time}</option>
															</s:iterator>
													</select> --%></div>
															
						<div><p>截止时间:	</p>
									<input type="text"  value="${request.query.query_seconddatatime}" id="selectedtwo" name="seconddatatime">
									<%-- <select name="seconddatatime"   id="selecttwo">
																<option selected="selected" value="0000-00-00">请选择!</option>
																<s:iterator value="#request.timelist" var="time" >
																		<option value="${time}">${time}</option>
																</s:iterator>
														</select> --%></div>
														
														<input type="hidden"   name="currentPage"   value="1"   id="currentPage">
												<div class="button"><input type="button" value="确定"   id="sub"></div>               
					    </form>  -->
                    <form class="form-horizontal" action="repairInformation_conditionQuery" method="POST"    id="condition">
                        <input type="hidden" id="operator"   value="${request.query.query_manname}"><br>
                        
                        
                <div style="line-height: 2px;" >
                
                
                       <div class="form-group" >
                       
                            <label class="col-sm-2 control-label">操作人员:</label>
                                <div class="col-sm-2">
                                  <select name="query_manname" class="form-control">
										<option selected="selected"  value="">请选择!</option>
										<s:iterator value="#request.users" var="user">
											<option value="${user.id}">${user.name}</option>
										</s:iterator>
								</select>
                            </div>
                            
                            <label class="col-sm-2 control-label">车辆类型:</label>
                                <div class="col-sm-2">
                                <select name="query_cartype" class="form-control">
													<option selected="selected"  value="">请选择!</option>
													<option   value="货运">货运</option>
													<option   value="客运">客运</option>
								</select>
								<input type="hidden" value="${request.query.query_cartype}" id="new_query_cartype">
                            </div>
                            
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">档案号&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <input type="text" name="query_carfileNum"  class="form-control"    value="${request.query.query_carfileNum}"  id="carfileNum"  >
                            </div>
                        </div>
       
                        <div class="form-group">
                        
                        	<label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">车牌号码&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <input type="text" name="query_carcarNum"  class="form-control" value="${request.query.query_carcarNum}" id="autocomplete">
                            </div> 
                            
                            
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">起始时间&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <input type="text" value="${request.query.query_firstdatatime}" class="form-control" id="selectedone" name="firstdatatime">
                            </div>
                            
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">截止时间&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <input type="text"  class="form-control" value="${request.query.query_seconddatatime}" id="selectedtwo" name="seconddatatime">
                            <button type="submit" class=" btn btn-primary" id="sub" style="margin-left:110%; margin-top:-16%;">确定</button>
                            <div class="btn btn-group dropup" > 
                              <input type="hidden"   name="currentPage"   value="1"   id="currentPage">
                            </div>                             
                            </div>  
                            
                            
              <div class="row"  style="padding-top: -36%;">
					<div class="col-sm-12 col-md-12 col-lg-12" style="padding-left:-15%;margin-right:-15%; ">
            			<div class="table-responsive">
            						<s:if test="#request.pageBean.recordList!=null">
						<table  id="grid" class="table table-striped table-bordered table-hover" style="font-size:12px; margin-top:-1%; padding-left:15%;">
							 <thead>
	                        	<tr class="active">
		                            <th>档案号</th>
		                            <th>车主</th>
		                            <th>车牌号</th>
		                            <th>类型</th>
		                            <th>维序人员</th>
		                            <th>维修日期</th>
		                            <th>到期日期</th>
		                            <th>删除</th>
	                       		 </tr>
                    		</thead>
							 <tbody>
									<s:iterator value="#request.pageBean.recordList" var="p" status="index" >
										<tr>
											<td>${p.car.fileNum}</td>
											<td>${p.car.carOwner}</td>
											<td>${p.car.carNum }</td>
											<td>${p.car.carType }</td>
											<td>${p.repairMan.name }</td>
											<td>${p.repairDate}</td>
											<td>${p.nextrepairDate}</td>
											<%-- <td><a href="repairInformation_deleteData?id=${p.id}" onclick="deleteData(this);">删除</a></td> --%>
											<td><a href="repairInformation_deleteData?id=${p.id}" onclick="javascript:if(confirm('确定要删除本条维修记录吗？')) { return true;}else{return false;};">删除</a></td>
										</tr>
								</s:iterator>
							 </tbody>
							
					</table>	
									</s:if>
		<s:else>
			<font style="color:red;fontSize:100px"><center><p>没有相关数据</p></center></font>
		</s:else>
						</div>
					</div>
				</div>                           
                            
                            
                            
                        </div>   
                        
                    
                                
                                  
                                            
                </div>



                    </form>    
                </div>
							
				</div>
			
			</div>
				
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<div class="wrap" style="margin-top:40px; float:center;">
					<form action="repairInformation_query" method="post">
						<div class="fenye">
			                <ul>
			                    <li >当前页/总页数:${pageBean.currentPage}/${pageBean.pageCount}&nbsp;&nbsp;维修次数:${pageBean.recordCount}</li>
			                    <!-- <li id="first">首页</li> -->
			                    <s:if test="#request.pageBean.currentPage!=1">
										<s:if test="#request.conditionQuery==1">
											<li><a href="repairInformation_conditionQuery?currentPage=${pageBean.currentPage-1}"   class="conditiona">上页</a></li>
										</s:if>
										<s:else>
											<li><a href="repairInformation_query?currentPage=${pageBean.currentPage-1}"  >上一页</a></li>
										</s:else>
								</s:if>
								<s:if test="#request.pageBean.currentPage!=#request.pageBean.endPageIndex">
										<s:if test="#request.conditionQuery==1">
											<li><a href="repairInformation_conditionQuery?currentPage=${pageBean.currentPage+1}"  class="conditiona">下页</a></li>
										</s:if>
										<s:else>
											<li><a href="repairInformation_query?currentPage=${pageBean.currentPage+1}"  >下一页</a></li>
										</s:else>
								</s:if>
			                    
			                    
			                   <!--  <li id="top" onclick="topclick()">上一页</li> -->
			                    <li >
			                    	跳到第：
											<select name="currentPage">
												<s:iterator begin="1" end="#request.pageBean.pageCount" status="index">
													<option value="${index.index+1}">${index.index+1}</option>
												</s:iterator>
											</select>
											页
											<input type="button" value="确定" id="jumpPage">
			                       <!--  <a id="xiye">1</a>/<a id="mo">66</a> -->
			                        <div class="xab" id="xab" style="display:none">
			                            <ul id="uljia">
			                                <p>
											
										</p>
			                            </ul>
			                        </div>
			                    </li>
			                  <!--   <li id="down" onclick="downclick()">下一页</a></li> -->
			                   <!--  <li id="last">末页</li> -->
			                </ul>
			            </div>
						
					</form>
				
		</div>
				
		
	</div>


<script type="text/javascript" src="${pageContext.request.contextPath }/js/new_file.js"></script>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.7.2.min.js"></script> --%> 
<script src="${pageContext.request.contextPath}/resource/Myjs/external/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/Myjs/jquery-ui.js"></script>
<script type="text/javascript">


				
								//字符串转日期格式，strDate要转为日期格式的字符串
				/* function getDate(strDate) {
				    var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,
				     function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
				    return date;
				}
				
				Date.prototype.format = function(format) { 
				    var date = { 
				           "M+": this.getMonth() + 1, 
				           "d+": this.getDate(), 
				           "h+": this.getHours(), 
				           "m+": this.getMinutes(), 
				           "s+": this.getSeconds(), 
				           "q+": Math.floor((this.getMonth() + 3) / 3), 
				           "S+": this.getMilliseconds() 
				    }; 
				    if (/(y+)/i.test(format)) { 
				           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length)); 
				    } 
				    for (var k in date) { 
				           if (new RegExp("(" + k + ")").test(format)) { 
				                  format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? date[k] : ("00" + date[k]).substr(("" + date[k]).length)); 
				           } 
				    } 
				    return format; 
				} 
				function getTime(){
					var mydate = new Date();
					   var str = "" + mydate.getFullYear() + "-";
					   str += (mydate.getMonth()+1) + "-";
					   str += mydate.getDate();
					   return str;
				} */
				
				function allCarNumber(){
					var availableTags=null;
					$.ajax({
					     url:"car_allCarNum",
					     type:'post', 
					     dataType:'json',
					     success:function(data){
					    		 availableTags=data;
					    		 if(availableTags!=null){
					    			 $( "#autocomplete" ).autocomplete({
											source: availableTags
										}); 
					    		 }
					     }
					});
				}
				
				function allCarFileNumber(){
					var availableTags=null;
					$.ajax({
					     url:"car_allCarFileNum",
					     type:'post', 
					     dataType:'json',
					     success:function(data){
					    		 availableTags=data;
					    		 if(availableTags!=null){
					    			 $( "#carfileNum" ).autocomplete({
											source: availableTags
										}); 
					    		 }
					     }
					});
				}
				$(function(){
					allCarNumber();
					allCarFileNumber();
					
					$("#selectedone").datepicker();
				
					$("#selectedtwo").datepicker();
					$("#autocomplete").focusout(function(){
						var carnumber=$(this).val().trim();
						if(carnumber!=null&&carnumber!=""){
							var carfileNum=$("#carfileNum").attr("value"," ");
							var datas={"carNum":carnumber};
							$.ajax({
								url:"car_jugeByCarNumberAndcarFileNum",
								type:'post',
								data:datas,
								dataType:'json',
								success:function(data){
									$("#carfileNum").val(data);
								}
							});
						}
					});
					
					$("#carfileNum").focusout(function(){
						var carfileNum=$(this).val().trim();
						if(carfileNum!=null&&carfileNum!=""){
							var carnumber=$("#autocomplete").attr("value"," ");
							var datas={"carFileNum":carfileNum};
							$.ajax({
								url:"car_jugeByCarNumberAndcarFileNum",
								type:'post',
								data:datas,
								dataType:'json',
								success:function(data){
									$("#autocomplete").val(data);
								}
							});
						}
					});
					var selectquery_cartype=$("select[name='query_cartype'] option");
					var new_query_cartype=$("#new_query_cartype").val();
					for(i=0;i<=selectquery_cartype.length;i++){
						if($(selectquery_cartype.get(i)).attr("value")==new_query_cartype){
							$(selectquery_cartype.get(i)).attr("selected",true);
						}
					}
					var selectquery_manname=$("select[name='query_manname'] option");
					var input_query_manname=$("#operator").attr("value");
					for(i=0;i<=selectquery_manname.length;i++){
						if($(selectquery_manname.get(i)).attr("value")==input_query_manname){
							$(selectquery_manname.get(i)).attr("selected",true);
						}
					 } 
					/* 
					var selectonetime=$("select[name='firstdatatime'] option");
					var selectedone=$("#selectedone").attr("value");
					for(i=0;i<=selectonetime.length;i++){
							if($(selectonetime.get(i)).attr("value")==selectedone){
								$(selectonetime.get(i)).attr("selected",true);
							}
					 } 
					
					var selecttwotime=$("select[name='seconddatatime'] option");
					var selectedtwo=$("#selectedtwo").attr("value");
					for(i=0;i<=selecttwotime.length;i++){
						if($(selecttwotime.get(i)).attr("value")==selectedtwo){
							$(selecttwotime.get(i)).attr("selected",true);
						}
				 } 
					
					
					
					
					$("#selectone").change(function(){
						var selecttwotime=$("select[name='seconddatatime'] option");
						var data=$("select[name='firstdatatime'] option:selected").val();
						var index;
						for(i=0;i<=selecttwotime.length;i++){
							if($(selecttwotime.get(i)).attr("value")<=data){
								$(selecttwotime.get(i)).remove();
							}
						}
					});
					
					$("#selecttwo").change(function(){
						var select=$("select[name='firstdatatime'] option:selected");
						var data=select.attr("value");
						var select2=$("select[name='seconddatatime'] option:selected");
						var data2=select2.attr("value");
						if(data2=="0000-00-00"){
							select.text("请选择");
							select.val("0000-00-00");
						 }
						if(data=="0000-00-00"){
							var time=new Date().format("yyyy-MM-dd");
							select.text(time);
							select.val(time);	
						}
					});  */
					
					$("#sub").click(function(){
						/* var select=$("select[name='firstdatatime'] option:selected");
						var data=select.attr("value");
						var select2=$("select[name='seconddatatime'] option:selected");
						var data2=select2.attr("value");
						var time=new Date().format("yyyy-MM-dd");
						if(data2=="0000-00-00"){
							select.val(null);
						 }
						if(data=="0000-00-00"){
							select.val(null);
						} */
						$("#condition").submit();
					});
					$(".conditiona").click(function(){
						var data=$(this).attr("href");
						var currentpage=data.split("=")[1];
						$("#currentPage").attr("value",currentpage);
						$("#sub").click();
						return false;
					});
					
					$("#jumpPage").click(function(){
						var jumpage=$("select[name='currentPage']").val();
							$("#currentPage").attr("value",jumpage);
							$("#sub").click();
					});
				});
</script>
<!-- <iframe name="control" src="footer.html" scrolling="no" frameborder="0" style="width:100%; height:100px;"></iframe> -->
</body>
</html>