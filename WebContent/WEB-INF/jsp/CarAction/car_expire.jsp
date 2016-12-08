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
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" media="screen"/>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/new_file.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/Myjs/external/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/Myjs/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function(){
		var selectquery_cartype=$("select[name='query_cartype'] option");
		var new_query_cartype=$("#new_query_cartype").val();
		for(i=0;i<=selectquery_cartype.length;i++){
			if($(selectquery_cartype.get(i)).attr("value")==new_query_cartype){
				$(selectquery_cartype.get(i)).attr("selected",true);
			}
		}
		$(".conditiona").click(function(){
			var href=$(this).attr("href");
			var currentPage=href.split("=")[1];
			$("#currentPage").attr("value",currentPage);
			$("#sub").click();
			return false;
		});
		
		$("#jumpPage").click(function(){
			var jumpage=$("select[name='currentPage']").val();
				$("#currentPage").attr("value",jumpage);
				$("#sub").click();
		});
		
		var availableTags=null;
		$.ajax({
		     url:"car_allCarNum",
		     type:'post', 
		     dataType:'json',
		     success:function(data){
		    		 availableTags=data;
		    		 if(availableTags!=null){
		    			 $( "#query_carcarNum" ).autocomplete({
								source: availableTags
							}); 
		    		 }
		     }
		});
		$("#sub").click(function(){
			
			$("#nwp_car_expire").submit();
		});
	});
</script>
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
.fenye{ float:left; }
.fenye ul{ float:left; margin-left:32px; }
.fenye ul li{ float:left; margin-left:5px;padding: 4px 6px; border:1px solid #ccc;  font-weight:bold; cursor:pointer; color:#999;}
.fenye ul li a{ color:#999;}
.fenye ul li.xifenye{ width:60px; text-align:center; float:left; position:relative;cursor: pointer;}
.fenye ul li .xab{ float:left; position:absolute; width:50px; border:1px solid #ccc; height:100px; overflow-y: auto;overflow-x: hidden;top:-125px; background-color: #fff; display:inline;left:-1px; width:50px;}
.fenye ul li .xab ul{ margin-left:0; padding-bottom:0;}
.fenye ul li .xab ul li{ border:0; padding:4px 0px; color:#999; width:34px; margin-left:0px; text-align:center;}
.main{margin-top:50px;}
</style>

<title>辉县市机动车维修站-到期查询</title>
</head>
<body background="${pageContext.request.contextPath }/images/dotted.png">
		<div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;"></a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;查询&nbsp;>>&nbsp; 到期查询</a>
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
				<div class="row" >
					<div class="container">
						<div class="row" >
							<div class="col-md-8 col-md-offset-1  col-xs-8 col-xs-offset-1   col-lg-8 col-lg-offset-1">
                     		<br><br><br><br><br>
                     <form class="form-horizontal" action="car_expire"   method="POST"  id="nwp_car_expire">
                        <div >
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">车牌号码&nbsp;:</label>
                            <div class="col-sm-3 col-lg-3 col-md-3">
                            	<input  type="text"  class="form-control"  name="query_carcarNum"   id="query_carcarNum" value="${request.query.query_carcarNum}">
                            	<input type="hidden"   name="currentPage"   value="1"   id="currentPage">
                            </div>
                            
                            <label class="col-sm-2 control-label">车辆类型：</label>
                                <div class="col-sm-3">
                                	<select name="query_cartype" id="nwp_query_cartype" class="form-control">
													<option selected="selected"  value="">请选择!</option>
													<option   value="货运">货运</option>
													<option   value="客运">客运</option>
												</select>
												<input type="hidden" value="${request.query.query_cartype}" id="new_query_cartype">
												<input  type="button"   class=" btn btn-primary" id="sub"   value="确定"  style="margin-left:110%;margin-top:-16%;" >
                                <div class="btn btn-group dropup"> 
                           
                              </div>
                            </div>
                            
                     </div>
                    </form>   
                     			
							</div>
						</div>
					</div>
				</div>
				<s:if test="#request.pageBean.recordList!=null||#request.pageBean.recordList.size()!=0">
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-12" >
            				<div class="table-responsive">
            					<table  class="table table-striped table-bordered table-hover" style="font-size:12px; margin-top:-1%;" id="grid">
									<thead>
				                        <tr class="active" >
				                            <th>档案号</th>
				                            <th>车主</th>
				                            <th>车牌号</th>
				                            <th>类型</th>
				                            <th>维序人员</th>
				                            <th>维修日期</th>
				                            <th>到期日期</th>
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
											</tr>
									</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				
					<div class="wrap">
							 <div class="fenye">
							 	<form action="car_expire "   method="post">
							 			<ul>
					                    <li >当前页/总页数:${pageBean.currentPage}/${pageBean.pageCount}&nbsp;&nbsp;维修次数:${pageBean.recordCount}</li>
					                    <!-- <li id="first">首页</li> -->
					                    <s:if test="#request.pageBean.currentPage!=1">
												<li><a class="conditiona" href="car_expire?currentPage=${pageBean.currentPage-1}"  >上页</a></li>
										</s:if>
										<s:if test="#request.pageBean.currentPage!=#request.pageBean.endPageIndex">
												<li><a class="conditiona"  href="car_expire?currentPage=${pageBean.currentPage+1}">下页</a></li>
										</s:if>
					                    
					                    
					                    <!-- <li id="top" onclick="topclick()">上一页</li> -->
					                    <li >
					                        <!-- <a id="xiye">1</a>/<a id="mo">66</a>
					                        <div class="xab" id="xab" style="display:none">
					                            <ul id="uljia">
					                                
					                            </ul>
					                        </div> -->
					                        跳到第：
												<select name="currentPage">
													<s:iterator begin="1" end="#request.pageBean.pageCount" status="index">
														<option value=" ${index.index+1}">${index.index+1}</option>
													</s:iterator>
												</select>
											页
											<input type="button" value="确定" id="jumpPage">
					                    </li>
					                   <!--  <li id="down" onclick="downclick()">下一页</a></li> -->
					                   <!--  <li id="last">末页</li> -->
				                	</ul>
							 	</form>
				                
            
            				</div>
					</div>
					
				</s:if>
				<s:else>
					<font style="color:red;fontSize:100px"><center><p>没有相关数据</p></center></font>
				</s:else>
		
		
			<%-- <div id="message">
				<div class="p-detail">
        							<p>当前位置&nbsp;:&nbsp;&nbsp;<a href="#">查询</a>>><a href="#">到期查询</a></p>
       			</div>
       			<div id="line"></div>
       			<div id="demo" style="height:50px">
       				<form action="car_expire"   method="POST" 	class="jqtransform su"  id="nwp_car_expire">
							<div><p>车牌号:</p><input  type="text"    name="query_carcarNum"   id="query_carcarNum" value="${request.query.query_carcarNum}">
										<input type="hidden"   name="currentPage"   value="1"   id="currentPage">
								<input  type="button"   id="sub"   value="确定"  class="gb1" style="width: 50px;">
							</div>
							<div><p>车辆类型:</p>
						 						<select name="query_cartype" id="nwp_query_cartype">
													<option selected="selected"  value="">请选择!</option>
													<option   value="货运">货运</option>
													<option   value="客运">客运</option>
												</select>
												<input type="hidden" value="${request.query.query_cartype}" id="new_query_cartype">
												</div>
					
					</form> 
       			</div>
		<s:if test="#request.pageBean.recordList!=null||#request.pageBean.recordList.size()!=0">
				<!-- <div id="list">-->
						<table  width="750" id="grid">
					<tr>
						<th>档案号</th>
						<th>车主</th>
						<th>车牌号</th>
						<th>类型</th>
						<th>维修人员</th>
						<th>维修日期</th>
						<th>到期日期</th>
					</tr>
					<s:iterator value="#request.pageBean.recordList" var="p" status="index" >
						<tr>
							<td>${p.car.fileNum}</td>
							<td>${p.car.carOwner}</td>
							<td>${p.car.carNum }</td>
							<td>${p.car.carType }</td>
							<td>${p.repairMan.name }</td>
							<td>${p.repairDate}</td>
							<td>${p.nextrepairDate}</td>
						</tr>
				</s:iterator>
		</table>
	<!--  </div>-->
		<div id="bootom">
			<div class="totalNum">
					<s:iterator begin="#request.pageBean.beginPageIndex" end="#request.pageBean.endPageIndex" status="index" >
					<a href="car_expire?currentPage=${index.index+pageBean.beginPageIndex}">${index.index+pageBean.beginPageIndex}</a>
					</s:iterator>
						<span>
                	
                		</span>
			</div>
			 <form action="car_expire "   method="post">
					<div class="pagechose">
									<p>
						当前页/总页数:${pageBean.currentPage}/${pageBean.pageCount}
						&nbsp;&nbsp;维修次数:${pageBean.recordCount}
							<s:if test="#request.pageBean.currentPage!=1">
										<a class="conditiona" href="car_expire?currentPage=${pageBean.currentPage-1}"  >上页</a>
							</s:if>
							<s:if test="#request.pageBean.currentPage!=#request.pageBean.endPageIndex">
									
										<a class="conditiona"  href="car_expire?currentPage=${pageBean.currentPage+1}">下页</a>
							</s:if>
						</p>
					</div>
				<div class="pageGo">
						<p>
							跳到第：
									<select name="currentPage">
										<s:iterator begin="1" end="#request.pageBean.pageCount" status="index">
											<option value=" ${index.index+1}">${index.index+1}</option>
										</s:iterator>
									</select>
							页
								<input type="button" value="确定" id="jumpPage">
						</p>
				</div>
		</form>		
		</div>		
		</s:if>
		<s:else>
			<font style="color:red;fontSize:100px"><center><p>没有相关数据</p></center></font>
		</s:else>
			</div> --%>
		</div>
		<!-- <iframe name="control" src="footer.html" scrolling="no" frameborder="0" style="width:100%; height:100px;"></iframe> -->
</body>
</html>