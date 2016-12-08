
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辉县市机动车维修站-车辆查询</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen"/>
<script type="text/javascript" src="js/jquery.paginate.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<script type="text/javascript" src="<%=basePath %>js/new_file.js"></script>

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
.fenye{ float:left;}

.fenye ul{ float:left; margin-left:32px; }
.fenye ul li{ float:left; margin-left:5px;padding: 4px 6px; border:1px solid #ccc;  font-weight:bold; cursor:pointer; color:#999;}
.fenye ul li a{ color:#999;}
.fenye ul li.xifenye{ width:60px; text-align:center; float:left; position:relative;cursor: pointer;}
.fenye ul li .xab{ float:left; position:absolute; width:50px; border:1px solid #ccc; height:100px; overflow-y: auto;overflow-x: hidden;top:-125px; background-color: #fff; display:inline;left:-1px; width:50px;}
.fenye ul li .xab ul{ margin-left:0; padding-bottom:0;}
.fenye ul li .xab ul li{ border:0; padding:4px 0px; color:#999; width:34px; margin-left:0px; text-align:center;}
.main{margin-top:50px;}
</style>
</head>

<body background="<%=basePath %>images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">

    <div class="row">
        <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            <a href="<%=basePath %>carInformation_put.action" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">添加车辆信息</a>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
            <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;查询&nbsp;>>&nbsp; 车辆信息查询</a>
            <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">欢迎　${user.name }　登录本系统!</a>
        </div>
    </div>
</div>
<div id=top-bar>
    <div id=topbar-inner>
    </div>
</div>

<div class="main">
    <div class="row" >
      <div class="container">
           <div class="row">
                <div class="col-md-8 col-md-offset-1  col-xs-8 col-xs-offset-1   col-lg-8 col-lg-offset-1 ">
                     <br>
                    <!-- <form class="form-horizontal"> -->
                    <form  class="jqtransform form-horizontal" id="condition" action="<%=basePath %>carInformation_getCarBySomeCarNum.action" method="post">
                        <div class="form-group">
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">车牌号码&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <!-- <input type="password" class="form-control"> -->
                            <input class="form-control" type="text" name="someCarNum" value=""/>
                            <!-- <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">车辆档案号&nbsp;:</label> -->
                            <!--   车辆档案号：<input class="form-control" type="text" name="1someCarFileNum" value=""/> -->
                            </div>
                            
                            
                            <label for="" class="col-sm-2 col-lg-2 col-md-2 control-label">档案号&nbsp;:</label>
                            <div class="col-sm-2 col-lg-2 col-md-2">
                            <input class="form-control" type="text" name="someCarFileNum" value=""/>
                            </div>
                            
                            <label class="col-sm-2 control-label">车辆类型：</label>
                                <div class="col-sm-2">
                                <select name="carType" onchange="sameCapacity(this)" id="carType" class=" multiple form-control">
									<option selected="selected"  value="">请选择!</option>
									<option   value="货运">货运</option>
									<option   value="客运">客运</option>
								</select>
								 <button type="submit" class=" btn btn-primary" style="float:left; margin-left:110%; margin-top:-30%;">确定</button>
                                <div class="btn btn-group dropup" style="float:left; margin-left:110%; margin-top:-8%;"> 
                                
                              </div>
                            </div>
                            
                            
                            
                        </div>
                                           
                        
                        
                    </form>    
                </div>
           </div>      
         </div>
    </div> 

        <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-left:-15;margin-right:-15; margin-top:-2%;">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" style="font-size:12px;">
                    <thead>
                        <tr class="active" >
                            <th>档案号</th>
                            <th>车主</th>
                            <th>车牌号</th>
                            <th>类型</th>
                            <th>发动机号</th>
                            <th>手机联系号码</th>
                            <th>详细信息</th>
                            <th>修改</th>
                            <th>删除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:if test="#request.pageBean.recordList.size()>0 && #request.pageBean.recordList != null">
					<s:iterator value="#request.pageBean.recordList" var="CarInfo">
						<tr>
							<td>${CarInfo.fileNum }</td>
							<td>${CarInfo.carOwner }</td>
							<td>${CarInfo.carNum }</td>
							<td>${CarInfo.carType }</td>
							<td>${CarInfo.engineNum }</td>
							<td>${CarInfo.phoneNum }</td>
							<td><a href="<%=basePath %>carInformation_queryCarAllInformation.action?carId=${CarInfo.id }">查看</a></td>
							<td><a style="margin-right:10%;" href="<%=basePath %>carInformation_updateCarInformationInput.action?carId=${CarInfo.id }&currentPage=${sessionScope.currentPage}"><img src="<%=basePath %>images/bian.png">&nbsp;&nbsp;修改</a></td>
							<td><a class="tablelink1" href="<%=basePath %>carInformation_deleteTheCar.action?carId=${CarInfo.id }&currentPage=${sessionScope.currentPage}"><img src="<%=basePath %>images/shan.png">&nbsp;&nbsp;删除</a></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="8">
						没有数据
						</td>
					</tr>
				</s:else>
                    </tbody>
                </table>
            </div>
        </div>
        </div>    
        
        <!-- 
         <form action="<%=basePath %>carInformation_seeAllCarInformation.action"   method="post">
					<div class="pagechose">
									<p>
						当前页/总页数:${pageBean.currentPage}/${pageBean.pageCount}&nbsp;
						总记录数：${pageBean.recordCount }
							<s:if test="#request.pageBean.currentPage!=1">
										<a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=${pageBean.currentPage-1}">上页</a>
							</s:if>
							<s:if test="#request.pageBean.currentPage!=#request.pageBean.endPageIndex">
										<a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=${pageBean.currentPage+1}">下页</a>
							</s:if>
						</p>
					</div>
				<div class="pageGo">
						<p>
											
							跳转到：
									<select name="currentPage">
										<s:iterator begin="1" end="#request.pageBean.pageCount" status="index">
											<option value=" ${index.index+1}">${index.index+1}</option>
										</s:iterator>
									<lect>
							页
								<input type="submit" value="确定">
						</p>
				</div>
		</form>	
        
         -->
        
        
    
     
       <div class="wrap" >
					<form action="<%=basePath %>carInformation_seeAllCarInformation.action" method="post">
						<div class="fenye">
			                <ul>
			                    <li >当前页/总页数:${pageBean.currentPage}/${pageBean.pageCount}&nbsp;&nbsp;总记录数:${pageBean.recordCount}</li>
			                    <!-- <li id="first">首页</li> -->
			                    <s:if test="#request.pageBean.currentPage!=1">
											<li><a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=${pageBean.currentPage-1}">上页</a></li>
								</s:if>
								<s:if test="#request.pageBean.currentPage!=#request.pageBean.endPageIndex">
											<li><a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=${pageBean.currentPage+1}">下页</a></li>
								</s:if>
			                    
			                    
			                   <!--  <li id="top" onclick="topclick()">上一页</li> -->
			                    <li >
			                    	跳到第：
									<select name="currentPage">
										<s:iterator begin="1" end="#request.pageBean.pageCount" status="index">
											<option value=" ${index.index+1}">${index.index+1}</option>
										</s:iterator>
									</select>
											页
											<input type="submit" value="确定">
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
<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.paginate.js"></script>
<script type="text/javascript" src="<%=basePath %>js/public.js"></script>
</div>
</body>
</html>
   